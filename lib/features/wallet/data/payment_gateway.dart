import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'wallet_models.dart';

/// How a trip through the gateway ended.
sealed class GatewayOutcome {
  const GatewayOutcome();
}

class GatewayPaid extends GatewayOutcome {
  const GatewayPaid(this.receipt);

  final GatewayReceipt receipt;
}

/// The customer closed the sheet. Not an error and not worth a red message.
class GatewayCancelled extends GatewayOutcome {
  const GatewayCancelled();
}

class GatewayFailed extends GatewayOutcome {
  const GatewayFailed();
}

/// Who is paying, to pre-fill the gateway's contact fields.
@immutable
class PayerDetails {
  const PayerDetails({this.name, this.email, this.phone});

  final String? name;
  final String? email;
  final String? phone;
}

/// The payment sheet, behind an interface so tests and the wallet controller
/// never touch the Razorpay plugin.
abstract class PaymentGateway {
  Future<GatewayOutcome> pay(TopUp topUp, PayerDetails payer);
}

/// Razorpay Standard Checkout.
///
/// The plugin reports results through callbacks rather than a future, so each
/// payment gets its own [Razorpay] instance whose listeners complete one
/// [Completer] and are then cleared. A shared instance would leave a slow
/// callback from one attempt able to complete the next.
class RazorpayGateway implements PaymentGateway {
  RazorpayGateway();

  @override
  Future<GatewayOutcome> pay(TopUp topUp, PayerDetails payer) {
    final Completer<GatewayOutcome> result = Completer<GatewayOutcome>();
    final Razorpay razorpay = Razorpay();

    void finish(GatewayOutcome outcome) {
      if (result.isCompleted) return;
      razorpay.clear();
      result.complete(outcome);
    }

    razorpay
      ..on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse r) {
        final String? paymentId = r.paymentId;
        final String? signature = r.signature;
        if (paymentId == null || signature == null) {
          finish(const GatewayFailed());
          return;
        }
        finish(
          GatewayPaid(
            GatewayReceipt(
              paymentId: paymentId,
              orderId: r.orderId ?? topUp.gatewayOrderId,
              signature: signature,
            ),
          ),
        );
      })
      ..on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse r) {
        finish(
          r.code == Razorpay.PAYMENT_CANCELLED
              ? const GatewayCancelled()
              : const GatewayFailed(),
        );
      })
      // An external wallet (Paytm, PhonePe) was picked; Razorpay hands off and
      // the payment, if any, is confirmed by the server's webhook.
      ..on(Razorpay.EVENT_EXTERNAL_WALLET, (ExternalWalletResponse _) {
        finish(const GatewayCancelled());
      });

    try {
      razorpay.open(<String, dynamic>{
        'key': topUp.keyId,
        'order_id': topUp.gatewayOrderId,
        'amount': topUp.amountPaise,
        'currency': topUp.currency,
        'name': 'Nexmile',
        'description': 'Add money to Nexmile wallet',
        'prefill': <String, String>{
          if (payer.name != null) 'name': payer.name!,
          if (payer.email != null) 'email': payer.email!,
          if (payer.phone != null) 'contact': payer.phone!,
        },
        'theme': <String, String>{'color': '#2C8B0D'},
      });
    } catch (_) {
      finish(const GatewayFailed());
    }

    return result.future;
  }
}
