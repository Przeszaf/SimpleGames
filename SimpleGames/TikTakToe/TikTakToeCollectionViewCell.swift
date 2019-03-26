//
//  TikTakToeCollectionViewCell.swift
//  SimpleGames
//
//  Created by Przemek Szafulski on 25/03/2019.
//  Copyright © 2019 Szafulski. All rights reserved.
//

import UIKit

class TikTakToeCollectionViewCell: UICollectionViewCell {
    private var addedLayer: CAShapeLayer?
    
    func setCross() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 10, y: 10))
        bezierPath.addLine(to: CGPoint(x: self.bounds.maxX - 10, y: self.bounds.maxY - 10))
        bezierPath.move(to: CGPoint(x: self.bounds.maxX - 10, y: 10))
        bezierPath.addLine(to: CGPoint(x: 10, y: self.bounds.maxY - 10))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.path = bezierPath.cgPath
        
        layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 0.5
        shapeLayer.add(animation, forKey: "MyAnimation")
        addedLayer = shapeLayer
    }
    
    func setCircle() {
        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: CGPoint(x: self.bounds.maxX / 2, y: self.bounds.maxY / 2), radius: self.bounds.maxX / 2 - 10, startAngle: 1.5 * CGFloat.pi, endAngle: 3.5 * CGFloat.pi, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.path = bezierPath.cgPath
        
        layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 0.5
        shapeLayer.add(animation, forKey: "MyAnimation")
        addedLayer = shapeLayer
    }
    
    func setClear() {
        addedLayer?.removeAllAnimations()
        addedLayer?.removeFromSuperlayer()
    }
    
    
    static func register(for collectionView: UICollectionView)  {
        let cellName = String(describing: self)
        let cellIdentifier = cellName + "Identifier"
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
}
