//
//  TikTakToeViewController.swift
//  SimpleGames
//
//  Created by Przemek Szafulski on 25/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import UIKit

class TikTakToeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            TikTakToeCollectionViewCell.register(for: collectionView)
        }
    }
    
    let firstPlayer: Player! = Player(name: "Przemek")
    let secondPlayer: Player! = Player(name: "Daria")
    var game: TikTakToeGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = TikTakToeGame(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TikTakToeCollectionViewCell
        if (game.isValidSelection(row: correctRow(from: indexPath), column: correctSection(from: indexPath))) {
            if game.currentPlayer == firstPlayer {
                cell.setCross()
            } else {
                cell.setCircle()
            }
            game.select(row: correctRow(from: indexPath), column: correctSection(from: indexPath))
            switch game.isGameFinished() {
            case .tie, .firstPlayer, .secondPlayer:
                game.repeatGame()
                collectionView.reloadData()
            default:
                print("Not tied yet")
            }
        
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TikTakToeCollectionViewCellIdentifier", for: indexPath) as! TikTakToeCollectionViewCell
        let num = game.board[correctRow(from: indexPath)][correctSection(from: indexPath)]
        if num == 1 {
            cell.setCross()
        } else if num == 2 {
            cell.setCircle()
        } else {
            cell.setClear()
        }
        return cell
    }
    
    //MARK: - CollectionViewLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 20) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    //MARK: - Private
    
    private func correctRow(from indexPath: IndexPath) -> Int {
        return indexPath.row % 3
    }
    
    private func correctSection(from indexPath: IndexPath) -> Int {
        return indexPath.row / 3
    }
    
    
    
    
}
