//
//  ServiceLocator.swift
//  FightingSimulator2999
//
//  Created by Илья Казначеев on 24.03.2023.
//

import Foundation

public class ServiceLocator {
    
    public var resolves: [String: () -> Any] = [:]
    
    public func register<T>(_ resolver: @escaping () -> T) {
        let typeString = String(describing: T.self)
        resolves[typeString] = resolver
    }
    
    public func resolve<T>() -> T {
        let typeString = String(describing: T.self)
        guard let resolver = resolves[typeString], let resolved = resolver() as? T else {
            fatalError("Error")
        }
        return resolved
    }
}
