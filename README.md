# flutter-holion-common

An extension functionality replacing keys in a string with their coresponding values from a provided Map 

## Getting Started

To use this package, add StringReplaceByMapValues as a dependency in your pubspec.yaml file.
Note: This package is depended on the use of the Humio plugin.

### Example

Import and create a humio instance as described in https://pub.dev/packages/humio

Import StringReplaceByMapValues and the package can now be used:
```
var humio = Humio(); //Needs to be created. Look at Humio documentation

var testStr = 'Test';
var replaceValues = {'map': '30'};

if (replaceValues != null) 
    testStr = testStr.Replace(replaceValues, humio);
```


