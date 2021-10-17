import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happier/api/models/repositories/bot.repository.dart';

void main() {
  late BotRepository repository;
  setUp(() async {
    DialogAuthCredentials credentials =
        await DialogAuthCredentials.fromNetwork('https://jsonkeeper.com/b/J43E');
    DialogFlowtter instance = DialogFlowtter(
      credentials: credentials,
    );
    repository = BotRepository(instance);
  });
  group('testing dialogFlow repository', () {
    test('testing getting intent from message', () async {
      String? message = await repository.detectIntent('Hello!');
      int length = message?.length ?? 0;
      expect(length, greaterThan(5));
    });
  });
}
