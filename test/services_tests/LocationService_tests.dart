import 'package:flutter_test/flutter_test.dart';

import 'file:///C:/Users/landr/Desktop/LogJogg/lib/services/location/LocationService.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  test('Current Position fetching', () async {
    print(await LocationService.currentPosition());
  });
}