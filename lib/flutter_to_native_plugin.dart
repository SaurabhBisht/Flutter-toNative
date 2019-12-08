import 'dart:async';

import 'package:flutter/services.dart';

class FlutterToNativePlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_to_native_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static Future<Null> showDialog(String msg) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("msg", () => msg);
    await _channel.invokeMethod('showDialog', args);
    return null;
  }

}
