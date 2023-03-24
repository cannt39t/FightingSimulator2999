import Foundation
import Combine
import FightingServices

public class FightServiceImpl: FightService {
    
    public static let shared: FightServiceImpl = .init()
    
    public init () {}
    
    private let _myHealth = CurrentValueSubject<Int, Never>(100)
    private let _enemyHealth = CurrentValueSubject<Int, Never>(100)
    
    public var myHealth: AnyPublisher<Int, Never> {
        _myHealth.eraseToAnyPublisher()
    }
    
    public var enemyHealth: AnyPublisher<Int, Never> {
        _enemyHealth.eraseToAnyPublisher()
    }
    
    public func startFight() {
        _myHealth.send(100)
        _enemyHealth.send(100)
    }
    
    public func basicAttack() {
        _myHealth.send(_myHealth.value - 10)
        _enemyHealth.send(_enemyHealth.value - 9)
    }
    
    public func magicAttack() {
        _myHealth.send(_myHealth.value - 10)
        let damage = Int.random(in: 7...15)
        _enemyHealth.send(_enemyHealth.value - damage)
    }
}
