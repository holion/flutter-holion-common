import 'package:holion_common/humioManager.dart';

extension KeyReplacement on String {
  /// String extension method.
  ///
  /// This method replaces keys in a text string wrapped in double set of curly brackets {{key}}
  /// with corresponding values from a Map (replaceValues). Note, the values in the map
  /// should not be in curly brackets.
  String Replace(Map<String, String> replaceValues) {
    // The string value we are manipulating.
    String _stringValue = this;

    // Reg expression used to find the keys inside the string
    RegExp exp = new RegExp(r"\{\{(\w+)\}\}");

    // Replace all {{keys}} with their corresponding value from the replaceValues Map.
    final replacedString = _stringValue.replaceAllMapped(exp, (Match m) {
      if (replaceValues != null) {
        if (replaceValues.containsKey(m.group(1)))
          return replaceValues[m.group(1)];
      }
      // Logging if replacement does not occur.
      HumioManager().warning(
          'Error in ValidPlaceholder substitution on : $_stringValue. ${m.group(1)} does not exist.');

      return "";
    });

    return replacedString;
  }
}
