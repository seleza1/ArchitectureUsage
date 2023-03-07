//
//  SceneDelegate.swift
//  ArchitectureUsage
//
//  Created by user on 06.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let mainVC = ModelBuilder.createMainModule()
        let navigationBar = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navigationBar
        window?.makeKeyAndVisible()
    }

}

