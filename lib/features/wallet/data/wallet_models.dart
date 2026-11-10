import 'package:flutter/foundation.dart';

import '../../catalogue/data/storefront_models.dart';

/// `GET /v1/wallet` — the balance and the most recent movements on it.
@immutable
class Wallet {
  const Wallet({required this.balance, this.transactions = const []});

  /// Rupees. The server is the only place this changes; the app never adds or
  /// subtracts locally, it re-reads.
  final double balance;

  /// Newest first.
  final List<WalletTransaction> transactions;

  static Wallet fromJson(Map<String, dynamic> json) => Wallet(
        balance: asDouble(json['balance']),
        transactions: asMapList(json['transactions'])
            .map(WalletTransaction.fromJson)
            .toList(growable: false),
      );
}

enum WalletEntryKind {
  /// Money added through the gateway.
  topUp,

  /// Spent on an order.
  orderPayment,

  /// Returned from a cancelled or refunded order.
  refund,

  /// A kind this build predates. Shown with the server's own description.
  other,
}

WalletEntryKind _kindFrom(Object? raw) {
  switch (asString(raw)) {
    case 'topup':
    case 'top_up':
      return WalletEntryKind.topUp;
    case 'order_payment':
    case 'order':
      return WalletEntryKind.orderPayment;
    case 'refund':
      return WalletEntryKind.refund;
    default:
      return WalletEntryKind.other;
  }
}

@immutable
class WalletTransaction {
  const WalletTransaction({
    required this.id,
    required this.kind,
    required this.amount,
    required this.description,
    this.createdAt,
    this.orderNumber,
  });

  final int id;
  final WalletEntryKind kind;

  /// Signed: positive for money in, negative for money out. The server may
  /// send it unsigned with a `direction`, so both are read.
  final double amount;

  final String description;
  final DateTime? createdAt;

  /// Set for order payments and refunds.
  final String? orderNumber;

  bool get isCredit => amount >= 0;

  static WalletTransaction fromJson(Map<String, dynamic> json) {
    final double raw = asDouble(json['amount']);
    final String direction = asString(json['direction']);
    final double amount = direction == 'debit'
        ? -raw.abs()
        : direction == 'credit'
            ? raw.abs()
            : raw;

    return WalletTransaction(
      id: asInt(json['id']),
      kind: _kindFrom(json['type']),
      amount: amount,
      description: asString(json['description']),
      createdAt: DateTime.tryParse(asString(json['created_at'])),
      orderNumber: json['order_number'] as String?,
    );
  }
}

/// `POST /v1/wallet/topups` — a Razorpay order the server created for this
/// top-up, which the checkout sheet is opened against.
///
/// The server creates the Razorpay order, not the app, because creating one
/// needs the Razorpay secret. The publishable [keyId] comes back with it so
/// the app never hard-codes which Razorpay account it pays into.
@immutable
class TopUp {
  const TopUp({
    required this.id,
    required this.gatewayOrderId,
    required this.keyId,
    required this.amountPaise,
    this.currency = 'INR',
  });

  /// Our id for the top-up, used to confirm it afterwards.
  final int id;

  /// Razorpay's `order_...` id.
  final String gatewayOrderId;

  final String keyId;
  final int amountPaise;
  final String currency;

  static TopUp fromJson(Map<String, dynamic> json) => TopUp(
        id: asInt(json['id']),
        gatewayOrderId: asString(json['razorpay_order_id']),
        keyId: asString(json['razorpay_key_id']),
        amountPaise: asInt(json['amount_paise']),
        currency: asString(json['currency'], 'INR'),
      );
}

/// What Razorpay hands back after a successful payment, passed to the server
/// verbatim so it can check the signature.
@immutable
class GatewayReceipt {
  const GatewayReceipt({
    required this.paymentId,
    required this.orderId,
    required this.signature,
  });

  final String paymentId;
  final String orderId;
  final String signature;
}
