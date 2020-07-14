//
//  SectionTwoCell.swift
//  CompositionalLayout_Demo
//
//  Created by Nirav Gondaliya on 2020-07-14.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SectionTwoCell: UICollectionViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var lbl: UILabel!
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backView.layer.cornerRadius = 8
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
    }

}
