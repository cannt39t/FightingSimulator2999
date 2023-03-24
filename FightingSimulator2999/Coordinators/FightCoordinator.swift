//
//  FightCoordinator.swift
//  FightingSimulator2999
//
//  Created by Илья Казначеев on 11.03.2023.
//

import UIKit

class FightCoordinator {
    
    public let storyboard = UIStoryboard(name: "Main", bundle: nil)
    public var navigationController: UINavigationController!
    public var services: ServiceLocator!
    
    func start() -> UIViewController {
        let controller: FightViewController = storyboard.instantiateViewController(withIdentifier: "FightViewController") as! FightViewController
        let fightPresenter = FightPresenter(view: controller, fightService: services.resolve(), showResult: showResult)
        controller.fightPresenter = fightPresenter
        return controller
    }
    
    func showResult(result: ResultViewController.Result) {
        let resultViewController: ResultViewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.result = result
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
}
