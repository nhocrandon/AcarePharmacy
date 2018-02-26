//
//  MenuExpandedTableViewCell.swift
//  AcarePharmacy
//
//  Created by Long Quách Phi on 1/18/18.
//  Copyright © 2018 Long Quách Phi. All rights reserved.
//

import UIKit

class MenuExpandedTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNameItem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    static let ID = "menuExpanded"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
