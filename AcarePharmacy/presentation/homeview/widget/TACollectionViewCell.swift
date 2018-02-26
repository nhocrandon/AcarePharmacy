//
//  TACollectionViewCell.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/19/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit

class TACollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageTA: UIImageView!
    @IBOutlet weak var lblTAName: UILabel!
    
    @IBOutlet weak var widthContraint: NSLayoutConstraint!
    static let ID = "taCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageTA.layer.cornerRadius = imageTA.frame.width/2
        imageTA.layer.masksToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthContraint.constant = screenWidth/2 - 50
    }
    
}
