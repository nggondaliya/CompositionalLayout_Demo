//
//  SectionFourCell.swift
//  CompositionalLayout_Demo
//
//  Created by Nirav Gondaliya on 2020-07-14.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class SectionFourCell: UICollectionViewCell {

    @IBOutlet var viewBack: UIView!
    @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBack.layer.cornerRadius = 8
    }

}
