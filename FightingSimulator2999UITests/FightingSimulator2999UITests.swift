//
//  FightingSimulator2999UITests.swift
//  FightingSimulator2999UITests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest

final class FightingSimulator2999UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        let app = XCUIApplication()
        app.launch()
        self.app = app
    }
    
    func testYOuLose() throws {
        
        let basicAttackStaticText = XCUIApplication()/*@START_MENU_TOKEN@*/.staticTexts["Basic attack"]/*[[".buttons[\"Basic attack\"].staticTexts[\"Basic attack\"]",".staticTexts[\"Basic attack\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        basicAttackStaticText.tap()
        
        var restartButton = app.buttons["Restart"].firstMatch
        XCTAssertTrue(restartButton.exists)
    }
    
    
    
}
