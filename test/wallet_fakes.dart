import 'package:nexmile/core/network/api_exception.dart';
import 'package:nexmile/features/wallet/data/payment_gateway.dart';
import 'package:nexmile/features/wallet/data/wallet_models.dart';
import 'package:nexmile/features/wallet/data/wallet_repository.dart';

/// A wallet held in memory. Credits on verify the way the server would.
class FakeWalletRepository implements WalletRepository {
  FakeWalletRepository({this.balance = 0, this.unavailable = false});

  double balance;

  /// Answers every call with a 404-shaped failure, like a server that has no
  /// wallet endpoints yet.
  bool unavailable;

  /// Makes verify fail after the gateway has taken the money.
  bool failVerify = false;

  /// When verify fails, whether the webhook has already credited the top-up,
  /// so a re-read shows the new balance.
  bool webhookCredits = false;

  /// Thrown by the next [createTopUp], to stand in for a 422 or a 503.
  ApiException? failCreateWith;

  double? lastTopUpAmount;
  GatewayReceipt? lastReceipt;

  void _check() {
    if (unavailable) {
      throw const ApiException(kind: ApiErrorKind.server, statusCode: 404);
    }
  }

  @override
  Future<Wallet> wallet() async {
    _check();
    return Wallet(balance: balance);
  }

  @override
  Future<TopUp> createTopUp(double amount) async {
    _check();
    final ApiException? failure = failCreateWith;
    if (failure != null) throw failure;
    lastTopUpAmount = amount;
    return TopUp(
      id: 41,
      gatewayOrderId: 'order_test',
      keyId: 'rzp_test_key',
      amountPaise: (amount * 100).round(),
    );
  }

  @override
  Future<Wallet> verifyTopUp(int topUpId, GatewayReceipt receipt) async {
    _check();
    if (failVerify) {
      if (webhookCredits) balance += (lastTopUpAmount ?? 0);
      throw const ApiException(kind: ApiErrorKind.network);
    }
    lastReceipt = receipt;
    balance += (lastTopUpAmount ?? 0);
    return Wallet(balance: balance);
  }
}

/// Answers every payment with [outcome], without opening anything.
class FakePaymentGateway implements PaymentGateway {
  FakePaymentGateway([this.outcome = const GatewayPaid(_receipt)]);

  GatewayOutcome outcome;
  int opened = 0;

  static const GatewayReceipt _receipt = GatewayReceipt(
    paymentId: 'pay_test',
    orderId: 'order_test',
    signature: 'sig_test',
  );

  @override
  Future<GatewayOutcome> pay(TopUp topUp, PayerDetails payer) async {
    opened++;
    return outcome;
  }
}
