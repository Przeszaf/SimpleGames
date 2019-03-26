//
//  Player.swift
//  SimpleGames
//
//  Created by Przemek Szafulski on 26/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import Foundation

class Player: Equatable {
    
    let name: String!
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
    
}
