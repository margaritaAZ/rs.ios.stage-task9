//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
        
        window = UIWindow(windowScene: windowScene)
        let tabBarController = UITabBarController()
        let itemsViewController = ItemsViewController()
//        let settingsViewController = SettingsViewController()
        
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        
        tabBarController.viewControllers = [itemsViewController]
        tabBarController.viewControllers?.append(settingsViewController)
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.tintColor = UIColor(red: 0.682, green: 0.682, blue: 0.698, alpha: 1)
        UITabBar.appearance().tintColor = .red
        
        itemsViewController.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "square.grid.2x2"), tag: 0)
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        settingsViewController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)]
        settingsViewController.navigationBar.backgroundColor = .white
        UINavigationBar.appearance().tintColor = .red
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }
}

