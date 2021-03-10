import 'package:flutter_test/flutter_test.dart';
import 'package:holion_common/humioManager.dart';
import 'package:holion_common/stringExtensions.dart';
import 'package:humio/humio.dart';

void main() {
  group('ReplaceExtension test', () {
    test('Example', () {
      String sut = 'Test if {{words}} can be replaced with cookies';
      print(sut);
      var replaceValues = {'words': 'cookies'};
      sut = sut.Replace(replaceValues);
      print(sut);
      expect(sut, 'Test if cookies can be replaced with cookies');
    });

    test('Multiple values', () {
      var sut = 'Test {{map}}  {{test}}';
      var replaceValues = {'map': '30', 'test': '40'};
      sut = sut.Replace(replaceValues);
      expect(sut, 'Test 30  40');
    });

    test('To many keywords in map', () {
      var sut = 'Test';
      var replaceValues = {'map': '30'};
      sut = sut.Replace(replaceValues);
      expect(sut, 'Test');
    });

    test('To few keywords in map', () {
      var sut = 'Test {{test}}';
      var replaceValues;
      sut = sut.Replace(replaceValues);
      expect(sut, 'Test ');
    });

    test('Wrong keywords in map', () {
      var sut = 'Test {{test}}';
      var replaceValues = {'map': '30'};
      sut = sut.Replace(replaceValues);
      expect(sut, 'Test ');
    });
  });

  test('Humio Example', () {
    var humio = Humio.defaultImplementation('your-humio-ingest-token');
    HumioManager humioManager = HumioManager();
    humioManager.initialize(humio);

    var sut = 'Test {{test}}';
    var replaceValues = {'map': '30'};
    sut = sut.Replace(replaceValues);
    expect(sut, 'Test ');
  });

  test('Humio Test if initialized', () {
    HumioManager humioManager = HumioManager();
    bool isInitialised = humioManager.isInitialized();
    expect(isInitialised, false);
    var humio = Humio.defaultImplementation('your-humio-ingest-token');
    humioManager.initialize(humio);
    isInitialised = humioManager.isInitialized();
    expect(isInitialised, true);
  });

  test('Humio Test if initialized', () {
    var humio = Humio.defaultImplementation('your-humio-ingest-token');
    HumioManager humioManager = HumioManager();
    var isInitialised = humioManager.isInitialized();
    if (!humioManager.isInitialized()) humioManager.initialize(humio);
    isInitialised = humioManager.isInitialized();
    expect(isInitialised, true);
  });
}
