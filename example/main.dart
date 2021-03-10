import 'package:humio/humio.dart';
import 'package:holion_common/humioManager.dart';
import 'package:holion_common/stringExtensions.dart';

main() {
  var humio = Humio.defaultImplementation('your-humio-ingest-token');
  HumioManager humioManager = HumioManager();
  humioManager.initialize(humio);

  String textStr = 'Test if {{words}} can be replaced with cookies';
  print(textStr);
  var replaceValues = {'words': 'cookies'};
  textStr = textStr.Replace(replaceValues);
  print(textStr);
}
