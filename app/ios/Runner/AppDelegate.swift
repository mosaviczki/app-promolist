import UIKit
import Flutter
import GoogleMaps
import dotenv

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let key : String = dotenv.env['MAPS_KEY'];
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(key)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
