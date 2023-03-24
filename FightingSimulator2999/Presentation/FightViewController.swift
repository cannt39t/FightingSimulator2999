//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
class FightViewController: UIViewController {
    @IBOutlet
    private var myHealthView: UIProgressView!

    @IBOutlet
    private var enemyHealthView: UIProgressView!
    
    var fightPresenter: FightPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fightPresenter.startFight()
        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }

    @IBAction
    private func basicAttackTap() {
        let (myHealth, enemyHealth) = fightPresenter.basicAttackTap()
        myHealthView.progress = Float(myHealth) / 100
        enemyHealthView.progress = Float(enemyHealth) / 100
    }

    @IBAction
    private func magicAttackTap() {
        let (myHealth, enemyHealth) = fightPresenter.magicAttackTap()
        myHealthView.progress = Float(myHealth) / 100
        enemyHealthView.progress = Float(enemyHealth) / 100
    }
}

