# holion_common

This package is going to contain several handy miscellaneous functionalities.

For now is implemented:

- A string extension functionality replacing keys in a String with their corresponding values from a provided Map. 

## Getting Started

To use this package, add holion_common as a dependency in the pubspec.yaml file.
Note: This package is dependent on the Humio plugin.
 

## Example

If logging is wanted, import and create a humio instance as described in https://pub.dev/packages/humio. This initialization can be omitted if logging is not wanted.

Import  holion_common/humioManager.dart and initialize the humioManager:

```
 // Look at the Humio documentation on how to create a Humio instance.
 var humio = Humio.defaultImplementation('your-humio-ingest-token');

 // Create a humioManager and add the Humio instance.
 HumioManager humioManager = HumioManager();
 if (!humioManager.isInitialized())
    humioManager.initialize(humio);

``` 

Import holion_common/stringExtensions.dart'; and the package can now be used:
```
// String to be modified - words to be modified are put into two sets of curly brackets.
String textStr = 'Test if {{words}} can be replaced with cookies';

// Mapped key-value pairs.
var replaceValues = {'words': 'cookies'};

// Replace the keys with their value.
textStr = textStr.Replace(replaceValues);

```


