import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import 'wallet_models.dart';

/// The customer wallet: its balance, and adding money through Razorpay.
///
/// Spending it is not here. That happens at checkout, where the order request
/// carries `use_wallet` and the server takes what it can from the balance.
abstract class WalletRepository {
  /// `GET /v1/wallet`
  Future<Wallet> wallet();

  /// `POST /v1/wallet/topups` — starts a top-up of [amount] rupees.
  Future<TopUp> createTopUp(double amount);

  /// `POST /v1/wallet/topups/{id}/verify` — hands the gateway's receipt to the
  /// server, which checks the signature and credits the balance.
  Future<Wallet> verifyTopUp(int topUpId, GatewayReceipt receipt);
}

class ApiWalletRepository implements WalletRepository {
  const ApiWalletRepository(this._client);

  final ApiClient _client;

  @override
  Future<Wallet> wallet() async {
    final Map<String, dynamic> response = await _client.get('/v1/wallet');
    return Wallet.fromJson(_data(response));
  }

  @override
  Future<TopUp> createTopUp(double amount) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/wallet/topups',
      body: <String, dynamic>{'amount': amount},
    );
    return TopUp.fromJson(_data(response));
  }

  @override
  Future<Wallet> verifyTopUp(int topUpId, GatewayReceipt receipt) async {
    final Map<String, dynamic> response = await _client.post(
      '/v1/wallet/topups/$topUpId/verify',
      body: <String, dynamic>{
        'razorpay_payment_id': receipt.paymentId,
        'razorpay_order_id': receipt.orderId,
        'razorpay_signature': receipt.signature,
      },
    );
    return Wallet.fromJson(_data(response));
  }

  static Map<String, dynamic> _data(Map<String, dynamic> response) {
    final Object? data = response['data'];
    if (data is Map<String, dynamic>) return data;
    throw const ApiException(
      kind: ApiErrorKind.server,
      message: 'Response did not contain a data object',
    );
  }
}
