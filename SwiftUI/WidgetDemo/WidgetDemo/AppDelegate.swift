//
//  AppDelegate.swift
//  WidgetDemo
//
//  Created by Vineet Kumar on 21/10/20.
//

import UIKit

let widgetActivityDeeplinkURL = "widget-activity-deeplink"

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nav: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ActivityVC(nibName: nil, bundle: nil)
        nav = UINavigationController.init(rootViewController: vc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        checkIfOpenedFromWidget(url: url)
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // userActivity.userInfo contains info about widget if no widgetUrl or Link used
        return true
    }
}

extension AppDelegate {
    
    private func checkIfOpenedFromWidget(url: URL) {
        if url.scheme?.contains(widgetActivityDeeplinkURL) ?? false {
            let newActivityVC = ActivityVC(nibName: nil, bundle: nil)
            newActivityVC.imgStr = url.host?.removingPercentEncoding?.decode() ?? ""
            nav?.pushViewController(newActivityVC, animated: true)
        }
    }
}

