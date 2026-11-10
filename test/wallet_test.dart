import 'package:flutter_test/flutter_test.dart';
import 'package:nexmile/core/network/api_exception.dart';
import 'package:nexmile/features/wallet/data/payment_gateway.dart';
import 'package:nexmile/features/wallet/data/wallet_models.dart';
import 'package:nexmile/features/wallet/state/wallet_controller.dart';

import 'wallet_fakes.dart';

const PayerDetails _payer = PayerDetails(name: 'Asha', phone: '9876500011');

void main() {
  group('wallet decoding', () {
    test('reads the balance and signs each entry', () {
      final Wallet wallet = Wallet.fromJson(<String, dynamic>{
        'balance': '250.50',
        'transactions': <Map<String, dynamic>>[
          <String, dynamic>{
            'id': 1,
            'type': 'topup',
            'amount': 500,
            'direction': 'credit',
            'created_at': '2026-11-09T10:00:00Z',
          },
          <String, dynamic>{
            'id': 2,
            'type': 'order_payment',
            'amount': 249.5,
            'direction': 'debit',
            'order_number': 'NX261109AAAA',
          },
          <String, dynamic>{'id': 3, 'type': 'cashback', 'amount': 20},
        ],
      });

      expect(wallet.balance, 250.5);
      expect(wallet.transactions[0].kind, WalletEntryKind.topUp);
      expect(wallet.transactions[0].isCredit, isTrue);
      expect(wallet.transactions[1].amount, -249.5);
      expect(wallet.transactions[1].orderNumber, 'NX261109AAAA');
      // A kind this build predates still lists, with the server's wording.
      expect(wallet.transactions[2].kind, WalletEntryKind.other);
    });
  });

  group('wallet controller', () {
    test('is not available until the server answers', () async {
      final WalletController wallet = WalletController(
        repository: FakeWalletRepository(unavailable: true),
        gateway: FakePaymentGateway(),
      );

      await wallet.load();

      // No balance of zero is claimed on a server with no wallet.
      expect(wallet.isAvailable, isFalse);
      expect(wallet.failure, isNotNull);
    });

    test('adding money credits the balance the server returns', () async {
      final FakeWalletRepository repository = FakeWalletRepository(balance: 50);
      final WalletController wallet = WalletController(
        repository: repository,
        gateway: FakePaymentGateway(),
      );
      await wallet.load();

      final TopUpOutcome outcome = await wallet.addMoney(200, _payer);

      expect(outcome, TopUpOutcome.added);
      expect(wallet.balance, 250);
      expect(repository.lastReceipt?.signature, 'sig_test');
    });

    test('closing the gateway is a cancel, not a failure', () async {
      final FakeWalletRepository repository = FakeWalletRepository(balance: 50);
      final WalletController wallet = WalletController(
        repository: repository,
        gateway: FakePaymentGateway(const GatewayCancelled()),
      );
      await wallet.load();

      expect(await wallet.addMoney(200, _payer), TopUpOutcome.cancelled);
      expect(wallet.balance, 50);
      expect(repository.lastReceipt, isNull);
    });

    test('a declined payment is reported as such', () async {
      final WalletController wallet = WalletController(
        repository: FakeWalletRepository(),
        gateway: FakePaymentGateway(const GatewayFailed()),
      );

      expect(await wallet.addMoney(200, _payer), TopUpOutcome.paymentFailed);
    });

    test('paid but unconfirmed says the money is on its way', () async {
      final FakeWalletRepository repository = FakeWalletRepository()
        ..failVerify = true;
      final WalletController wallet = WalletController(
        repository: repository,
        gateway: FakePaymentGateway(),
      );

      // The customer has paid. "Failed" here would send them to pay twice.
      expect(await wallet.addMoney(200, _payer), TopUpOutcome.confirming);
      expect(wallet.isAdding, isFalse);
    });

    test('a failed verify the webhook already credited is a success', () async {
      final FakeWalletRepository repository = FakeWalletRepository(balance: 50)
        ..failVerify = true
        ..webhookCredits = true;
      final WalletController wallet = WalletController(
        repository: repository,
        gateway: FakePaymentGateway(),
      );
      await wallet.load();

      expect(await wallet.addMoney(200, _payer), TopUpOutcome.added);
      expect(wallet.balance, 250);
    });

    test('an amount over the ceiling carries the server reason', () async {
      final FakeWalletRepository repository = FakeWalletRepository(balance: 9800)
        ..failCreateWith = const ApiException(
          kind: ApiErrorKind.validation,
          statusCode: 422,
          errors: <String, List<String>>{
            'amount': <String>['You can add up to ₹200 more.'],
          },
        );
      final WalletController wallet = WalletController(
        repository: repository,
        gateway: FakePaymentGateway(),
      );
      await wallet.load();

      expect(await wallet.addMoney(500, _payer), TopUpOutcome.rejected);
      expect(wallet.rejection, 'You can add up to ₹200 more.');
    });

    test('a gateway that is not switched on reads as unavailable', () async {
      final FakePaymentGateway gateway = FakePaymentGateway();
      final WalletController wallet = WalletController(
        repository: FakeWalletRepository()
          ..failCreateWith = const ApiException(
            kind: ApiErrorKind.server,
            statusCode: 503,
          ),
        gateway: gateway,
      );

      expect(await wallet.addMoney(200, _payer), TopUpOutcome.unavailable);
      expect(gateway.opened, 0);
    });

    test('the addable amount shrinks as the balance nears the ceiling', () async {
      final WalletController wallet = WalletController(
        repository: FakeWalletRepository(balance: 9700),
        gateway: FakePaymentGateway(),
      );
      await wallet.load();

      expect(wallet.maxAddable, 300);
    });

    test('a top-up that cannot start never opens the gateway', () async {
      final FakePaymentGateway gateway = FakePaymentGateway();
      final WalletController wallet = WalletController(
        repository: FakeWalletRepository(unavailable: true),
        gateway: gateway,
      );

      expect(await wallet.addMoney(200, _payer), TopUpOutcome.failed);
      expect(gateway.opened, 0);
    });

    test('sign-out forgets the balance', () async {
      final WalletController wallet = WalletController(
        repository: FakeWalletRepository(balance: 300),
        gateway: FakePaymentGateway(),
      );
      await wallet.load();

      wallet.clear();

      expect(wallet.isAvailable, isFalse);
      expect(wallet.balance, 0);
    });
  });
}
