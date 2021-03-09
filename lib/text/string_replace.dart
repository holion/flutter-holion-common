import 'package:holion_common/humio/humio_manager.dart';

extension KeyReplacement on String {
  String Replace(Map<String, String> replaceValues) {
    //The string value we are manipulating
    String _stringValue = this;

    RegExp exp = new RegExp(r"\{\{(\w+)\}\}");

    final replacedString = _stringValue.replaceAllMapped(exp, (Match m) {
      if (replaceValues != null) {
        if (replaceValues.containsKey(m.group(1)))
          return replaceValues[m.group(1)];
      }
      HumioManager().warning(
          'Error in ValidPlaceholder substitution on : $_stringValue. ${m.group(1)} does not exist.');

      return "";
    });

    return replacedString;
  }
}
