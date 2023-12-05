//
//  SceneDelegate.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let mainVC = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = mainVC
        self.window = window
        window.makeKeyAndVisible()
    }
}

