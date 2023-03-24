//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Илья Казначеев on 11.03.2023.
//

import Foundation
import Combine
import FightingServices
import FightingServiceImplementation


class FightPresenter {
    
    weak var view: FightViewController?
    public var fightService: FightService!
    
    private var myHealthSubscriber: AnyCancellable?
    private var enemyHealthSubscriber: AnyCancellable?
    
    public var resultDetermined = false
    
    private var myHealthValue: Int = 100
    private var enemyHealthValue: Int = 100
    
    private var showResult: (_ result: ResultViewController.Result) -> Void = { result in }
        
    init(view: FightViewController, fightService: FightService, showResult: @escaping (ResultViewController.Result) -> Void) {
        self.view = view
        self.fightService = fightService
        self.showResult = showResult
        myHealthSubscriber = fightService.myHealth
            .combineLatest(fightService.enemyHealth)
            .sink { [self] myHealth, enemyHealth in
                myHealthValue = myHealth
                enemyHealthValue = enemyHealth
                if myHealth <= 0 && !resultDetermined {
                    resultDetermined = true
                    showResult(.lose)
                } else if enemyHealth <= 0 && !resultDetermined {
                    resultDetermined = true
                    showResult(.win)
                }
            }
        fightService.startFight()
    }
    
    func startFight() {
        fightService.startFight()
        resultDetermined = false
    }
    
    
    public func basicAttackTap() -> (Int, Int) {
        fightService.basicAttack()
        return (myHealthValue, enemyHealthValue)
    }

    public func magicAttackTap() -> (Int, Int) {
        fightService.magicAttack()
        return (myHealthValue, enemyHealthValue)
    }
}
