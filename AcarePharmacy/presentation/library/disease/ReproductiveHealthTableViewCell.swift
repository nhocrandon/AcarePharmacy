//
//  ReproductiveHealthTableViewCell.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/25/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit

class ReproductiveHealthTableViewCell: UITableViewCell {
    @IBOutlet weak var lblReproductiveHealth: UILabel!
    
    static let ID = "iDReproductiveHealth"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
