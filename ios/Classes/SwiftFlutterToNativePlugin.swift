import Flutter
import UIKit

public class SwiftFlutterToNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_to_native_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterToNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual("showDialog")){
        let arguments = call.arguments as? NSDictionary
        let msg = arguments!["msg"] as? String
     UIAlertView(title:"", message: msg, delegate: nil, cancelButtonTitle: "OK").show()

    }

    result("iOS " + UIDevice.current.systemVersion)
  }
}
