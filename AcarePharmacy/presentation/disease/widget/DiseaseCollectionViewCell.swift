//
//  DiseaseCollectionViewCell.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/22/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit

class DiseaseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageDisease: UIImageView!
    @IBOutlet weak var lblDiseaseName: UILabel!
    
    @IBOutlet weak var widthContraint: NSLayoutConstraint!
    static let ID = "diseaseCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageDisease.layer.cornerRadius = imageDisease.frame.width/2
        imageDisease.layer.masksToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthContraint.constant = screenWidth/2 - 50
    }
}


