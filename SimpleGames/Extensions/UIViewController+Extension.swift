//
//  UIViewController+Extension.swift
//  SimpleGames
//
//  Created by Przemek Szafulski on 25/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func loadFromNib<T: UIViewController>() -> T {
        let myVC = T(nibName: String(describing: self), bundle: nil)
        return myVC
    }
    
}
