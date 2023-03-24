import Foundation
import Combine
import PlayerServices

public class PlayerServiceImpl: PlayerService {
    public var defaultHealth: Int
    
    public init(defaultHealth: Int) {
        self.defaultHealth = defaultHealth
    }
}
