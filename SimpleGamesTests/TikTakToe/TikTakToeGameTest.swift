//
//  TikTakToeGameTest.swift
//  SimpleGamesTests
//
//  Created by Przemek Szafulski on 26/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import XCTest

@testable import SimpleGames

class TikTakToeGameTest: XCTestCase {
    var tikTakToeGame: TikTakToeGame!

    override func setUp() {
        let firstPlayer = Player(name: "Przemek")
        let secondPlayer = Player(name: "Daria")
        tikTakToeGame = TikTakToeGame(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializesGameBoard() {
        XCTAssertNotNil(tikTakToeGame.board)
    }
    
    func testHas3Columns() {
        XCTAssertEqual(tikTakToeGame.board.count, 3)
    }
    
    func testHas3Rows() {
        for row in tikTakToeGame.board {
            XCTAssertEqual(row.count, 3)
        }
    }
    
    func testValidSelectionEmpty() {
        XCTAssertTrue(tikTakToeGame.isValidSelection(row: 0, column: 0))
    }
    
    func testValidSelectionFalse() {
        tikTakToeGame.board[0][0] = 1
        XCTAssertFalse(tikTakToeGame.isValidSelection(row: 0, column: 0))
    }

    func testSelectionWorks() {
        tikTakToeGame.select(row: 0, column: 1)
        XCTAssertEqual(tikTakToeGame.board[0][1], 1)
    }
    
    func testSelectionWorksForSecondPlayer() {
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        XCTAssertEqual(tikTakToeGame.board[0][1], 2)
    }
    
    func testWinningSimpleSecondPlayer() {
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningSimpleFirstPlayer() {
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningExample2SecondPlayer() {
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample2FirstPlayer() {
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningExample3SecondPlayer() {
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample3FirstPlayer() {
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningExample4SecondPlayer() {
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 1)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample4FirstPlayer() {
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 1)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    
    func testWinningExample5SecondPlayer() {
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 0)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample5FirstPlayer() {
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 2, column: 0)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningExample6SecondPlayer() {
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 2, column: 1)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample6FirstPlayer() {
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 2, column: 1)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningExample7SecondPlayer() {
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 2)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample7FirstPlayer() {
        tikTakToeGame.select(row: 0, column: 2)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 2)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningExample8SecondPlayer() {
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .secondPlayer)
    }
    
    func testWinningExample8FirstPlayer() {
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .firstPlayer)
    }
    
    func testWinningWithTie() {
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 2)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 2, column: 2)
        tikTakToeGame.select(row: 2, column: 1)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .tie)
    }
    
    func testNotFinished() {
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 0, column: 2)
        tikTakToeGame.select(row: 1, column: 2)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 2, column: 1)
        tikTakToeGame.select(row: 2, column: 2)
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .not)
    }
    
    func testRepeatGame() {
        tikTakToeGame.select(row: 0, column: 0)
        tikTakToeGame.select(row: 0, column: 2)
        tikTakToeGame.select(row: 0, column: 1)
        tikTakToeGame.select(row: 1, column: 0)
        tikTakToeGame.select(row: 1, column: 2)
        tikTakToeGame.select(row: 1, column: 1)
        tikTakToeGame.select(row: 2, column: 0)
        tikTakToeGame.select(row: 2, column: 2)
        tikTakToeGame.select(row: 2, column: 1)
        tikTakToeGame.repeatGame()
        XCTAssertEqual(tikTakToeGame.isGameFinished(), .not)
    }
    
    

}
