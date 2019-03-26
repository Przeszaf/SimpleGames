//
//  TikTakToeGame.swift
//  SimpleGames
//
//  Created by Przemek Szafulski on 26/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import Foundation

enum GameFinished {
    case firstPlayer
    case secondPlayer
    case tie
    case not
}

class TikTakToeGame {
    let firstPlayer: Player!
    let secondPlayer: Player!
    var currentPlayer: Player!
    
    var board = [[Int]].init(repeating: [0, 0, 0], count: 3)
    
    init(firstPlayer: Player, secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        currentPlayer = firstPlayer
    }
    
    func isValidSelection(row: Int, column: Int) -> Bool {
        return board[row][column] == 0
    }
    
    func select(row: Int, column: Int) {
        if currentPlayer == firstPlayer {
            board[row][column] = 1
            currentPlayer = secondPlayer
        } else if currentPlayer == secondPlayer {
            board[row][column] = 2
            currentPlayer = firstPlayer
        }
    }
    
    func isGameFinished() -> GameFinished {
        for i in 0..<3 {
            for j in 0..<3 {
                if (isItEndAt(row: i, column: j)) {
                    if board[i][j] == 1 {
                        return .firstPlayer
                    } else {
                        return .secondPlayer
                    }
                }
            }
        }
        return isItTie() ? .tie : .not
    }
    
    func repeatGame() {
        board = [[Int]].init(repeating: [0, 0, 0], count: 3)
    }
    
    private func isItEndAt(row: Int, column: Int) -> Bool {
        let num = board[row][column]
        if num == 0 {
            return false
        }
        
        if (isItEndHorizontal(num: num, row: row, column: column) ||
            isItEndVertical(num: num, row: row, column: column) ||
            isItEndCross(num: num, row: row, column: column)) {
            return true
        }
        return false
    }
    
    private func isItEndHorizontal(num: Int, row: Int, column: Int) -> Bool {
        for i in -2...0 {
            let newStartRow = row + i
            let newFinishRow = newStartRow + 2
            if newStartRow >= 0 && newFinishRow < 3 {
                for j in newStartRow...newFinishRow {
                    if board[j][column] != num {
                        return false
                    }
                }
                return true
            }
        }
        return false
    }
    
    private func isItEndVertical(num: Int, row: Int, column: Int) -> Bool {
        for i in -2...0 {
            let newStartColumn = column + i
            let newFinishColumn = newStartColumn + 2
            if newStartColumn >= 0 && newFinishColumn < 3 {
                for j in newStartColumn...newFinishColumn {
                    if board[row][j] != num {
                        return false
                    }
                }
                return true
            }
        }
        return false
    }
    
    private func isItEndCross(num: Int, row: Int, column: Int) -> Bool {
        for i in -2...0 {
            //top left to bottom right
            let newStartColumn = column + i
            let newFinishColumn = newStartColumn + 2
            var newStartRow = row + i
            var newFinishRow = newStartRow + 2
            if newStartColumn >= 0 && newFinishColumn < 3 && newStartRow >= 0 && newFinishRow < 3 {
                for j in 0..<3 {
                    if board[newStartColumn + j][newStartRow + j] != num {
                        return false
                    }
                }
                return true
            }
            
            //Top right to bottom left
            newStartRow = row + 2
            newFinishRow = newStartRow + i
            if newStartColumn >= 0 && newFinishColumn < 3 && newStartRow < 3 && newFinishRow >= 0 {
                for j in 0..<3 {
                    if board[newStartColumn + j][newStartRow - j] != num {
                        return false
                    }
                }
                return true
            }
        }
        return false
    }
    
    private func isItTie() -> Bool {
        for i in 0..<3 {
            for j in 0..<3 {
                if board[i][j] == 0 {
                    return false
                }
            }
        }
        return true;
    }
    
}
