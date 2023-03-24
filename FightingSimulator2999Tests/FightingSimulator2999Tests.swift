//
//  FightingSimulator2999Tests.swift
//  FightingSimulator2999Tests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest
@testable import FightingSimulator2999

final class FightingSimulator2999Tests: XCTestCase {
    func testExample() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: FightViewController = storyboard.instantiateViewController(withIdentifier: "FightViewController") as! FightViewController
        let fightPresenter = FightPresenter(view: controller)
        let service = MockFightService()
        fightPresenter.fightService = service
        _ = fightPresenter.basicAttackTap()
        XCTAssertTrue(service.basicAttackCalled)
    }
}
