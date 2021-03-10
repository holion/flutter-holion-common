import 'package:humio/humio.dart';

class HumioManager {
  static final HumioManager _instance = HumioManager._internal();

  Humio _humio;

  /// Getting an instance of the HumioManager
  factory HumioManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  HumioManager._internal() {
    // initialization logic
  }

  /// Initialize the HumioManager with a humio instance
  initialize(Humio humio) {
    this._humio = humio;
  }

  /// This call returns if the HumioManagers humio instance is different from null
  bool isInitialized() {
    return _humio != null;
  }

  /// Log a message to Humio, if the HumioManager has been initialized with a humio instance
  ///
  /// This method can be called directly - but we recommend you call it using the [HumioExtensions].
  Future<bool> log(String level, String message,
      {Object error,
      StackTrace stackTrace,
      Map<String, dynamic> fields,
      Map<String, String> tags}) async {
    if (_humio != null)
      return await _humio.log(level, message,
          error: error, stackTrace: stackTrace, fields: fields, tags: tags);
  }
}

extension HumioExtensions on HumioManager {
  /// Verbose is the noisiest level, rarely (if ever) enabled for a production app.
  Future verbose(String message,
          {Map<String, dynamic> fields, Map<String, String> tags}) async =>
      await this.log('verbose', message, fields: fields, tags: tags);

  /// Debug is used for internal system events that are not necessarily observable from the outside, but useful when determining how something happened.
  Future debug(String message,
          {Map<String, dynamic> fields, Map<String, String> tags}) async =>
      await this.log('debug', message, fields: fields, tags: tags);

  /// Information events describe things happening in the system that correspond to its responsibilities and functions. Generally these are the observable actions the system can perform.
  Future information(String message,
          {Map<String, dynamic> fields, Map<String, String> tags}) async =>
      await this.log('information', message, fields: fields, tags: tags);

  /// When service is degraded, endangered, or may be behaving outside of its expected parameters, Warning level events are used.
  Future warning(String message,
          {Map<String, dynamic> fields, Map<String, String> tags}) async =>
      await this.log('warning', message, fields: fields, tags: tags);

  /// When functionality is unavailable or expectations broken, an Error event is used.
  Future error(String message, Object error, StackTrace stackTrace,
          {Map<String, dynamic> fields, Map<String, String> tags}) async =>
      await this.log('error', message,
          error: error, stackTrace: stackTrace, fields: fields, tags: tags);

  /// The most critical level, Fatal events demand immediate attention.
  Future fatal(String message,
          {Map<String, dynamic> fields, Map<String, String> tags}) async =>
      await this.log('fatal', message, fields: fields, tags: tags);
}
