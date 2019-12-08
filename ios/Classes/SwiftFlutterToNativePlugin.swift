import Flutter
import UIKit

public class SwiftFlutterToNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_to_native_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterToNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //if(call.method.elementsEqual("showDialog")){
//        let arguments = call.arguments as? NSDictionary
//        let msg = arguments!["msg"] as? String
//     UIAlertView(title:"", message: msg, delegate: nil, cancelButtonTitle: "OK").show()
        
        
//    guard let url = URL(string: "http://172.20.238.178:8090/api/device/register") else {return}
//
//
//    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
//        guard error == nil else {
//            return
//        }
//        guard let data = data else {
//            return
//        }
//        do {
//            if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                print(json)
//
//                }
//            } catch let error {
//            print(error.localizedDescription)
//                              }
//    })
//    task.resume()
    
  let Url = String(format: "http://172.20.238.178:8090/api/device/register")
  guard let serviceUrl = URL(string: Url) else { return }
  let parameterDictionary = ["deviceID":"AA5BACC8-261D-4074-AD66-AD901B8476F4"]
  var request = URLRequest(url: serviceUrl)
  request.httpMethod = "POST"
    
  request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
  request.setValue("Application/json", forHTTPHeaderField: "Accept")
  request.setValue("", forHTTPHeaderField: "Authorization")
  request.setValue("Bd06ogqdczfadzmuzo4q50gyroqyg2qlcp", forHTTPHeaderField: "RC")
 
  guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
      return
  }
  request.httpBody = httpBody

  let session = URLSession.shared
  session.dataTask(with: request) { (data, response, error) in
      if let response = response {
          print(response)
      }
      if let data = data {
          do {
              let json = try JSONSerialization.jsonObject(with: data, options: [])
              print(json)
          } catch {
              print(error)
          }
      }
      }.resume()


    }

 //   result("iOS " + UIDevice.current.systemVersion)
 // }
}
