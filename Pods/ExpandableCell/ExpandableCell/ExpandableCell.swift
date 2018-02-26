//
//  ExpandableCell.swift
//  ExpandableCell
//
//  Created by Seungyoun Yi on 2017. 8. 10..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

open class ExpandableCell: UITableViewCell {
    
    open var arrowImageView: UIImageView!
    private var isOpen = false
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initView()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func awakeFromNib() {
        super.awakeFromNib()

        initView()
    }

    open func setLabelAndImage(Image: UIImage, Name: String){
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 15, y: 10, width: 50, height: 50)
        imageView.image = Image
        self.contentView.addSubview(imageView)
        
        let labelView = UILabel()
        labelView.frame = CGRect(x: 83, y: 12, width: 272, height: 20)
        labelView.text = Name
        self.contentView.addSubview(labelView)
    }
    
    func initView() {
        arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "expandableCell_arrow", in: Bundle(for: ExpandableCell.self), compatibleWith: nil)
        self.contentView.addSubview(arrowImageView)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        let width = self.bounds.width
        let height = self.bounds.height

        arrowImageView.frame = CGRect(x: width - 54, y: (height - 11)/2, width: 22, height: 11)
    }

    func open() {
        self.isOpen = true
        UIView.animate(withDuration: 0.3) {
            self.arrowImageView.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 1.0, 0.0, 0.0)
        }
    }

    func close() {
        self.isOpen = false
        UIView.animate(withDuration: 0.3) {
            self.arrowImageView.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
        }
    }

    open func isExpanded() -> Bool {
        return isOpen
    }
}
