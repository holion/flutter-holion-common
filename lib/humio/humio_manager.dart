import 'package:humio/humio.dart';

class HumioManager {
  static final HumioManager _instance = HumioManager._internal();

  Humio _humio;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory HumioManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  HumioManager._internal() {
    // initialization logic
  }

  initialize(Humio humio) {
    this._humio = humio;
  }

  warning(String message) {
    if (_humio != null) _humio.warning(message);
  }
}
