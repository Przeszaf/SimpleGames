//
//  ViewController.swift
//  SimpleGames
//
//  Created by Przemek Szafulski on 25/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tikTakToeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(_ button: UIButton) {
        var viewController: UIViewController?
        switch button {
        case tikTakToeButton:
            let tikTakToeVC: TikTakToeViewController = TikTakToeViewController.loadFromNib()
            viewController = tikTakToeVC
        default:
            viewController = nil
        }
        if let viewController = viewController {
            self.present(viewController, animated: true, completion: nil)
        }
    }

}

