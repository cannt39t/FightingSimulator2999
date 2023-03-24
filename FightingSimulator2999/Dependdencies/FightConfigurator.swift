//
//  FightConfigurator.swift
//  FightingSimulator2999
//
//  Created by Илья Казначеев on 24.03.2023.
//

import Foundation
import FightingServices
import FightingServiceImplementation

class FightConfigurator {
    
    func configure() -> ServiceLocator {
        let serviceLocator = ServiceLocator()
        
        let fightService = FightServiceImpl()
        serviceLocator.register { () -> FightService in
            fightService
        }
        return serviceLocator
    }
}
