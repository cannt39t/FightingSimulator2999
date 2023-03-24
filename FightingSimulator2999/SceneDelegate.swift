//
//  SceneDelegate.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let fightConfigurator = FightConfigurator()
        let fightService = fightConfigurator.configure()
        let fightCoordinator = FightCoordinator()
        fightCoordinator.services = fightService
        let navifationController = UINavigationController(rootViewController: fightCoordinator.start())
        fightCoordinator.navigationController = navifationController
        window.rootViewController = navifationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

