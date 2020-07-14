//
//  SectionThreeCell.swift
//  CompositionalLayout_Demo
//
//  Created by Nirav Gondaliya on 2020-07-14.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SectionThreeCell: UICollectionViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.layer.cornerRadius = 8
        self.backView.clipsToBounds = true
    }

    func setGradientView(startColor: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [startColor.cgColor, UIColor.white.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.backView.frame.size.width, height: self.backView.frame.size.height)

        self.backView.layer.insertSublayer(gradient, at: 0)
        
    }
    
}
