#import "FlutterToNativePlugin.h"
#import <flutter_to_native_plugin/flutter_to_native_plugin-Swift.h>

@implementation FlutterToNativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterToNativePlugin registerWithRegistrar:registrar];
}
@end
