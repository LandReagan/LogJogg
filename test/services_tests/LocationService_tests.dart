import 'package:flutter_test/flutter_test.dart';

import 'package:LogJogg/services/LocationService.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  test('Current Position fetching', () async {
    print(await LocationService.currentPosition());
  });
}