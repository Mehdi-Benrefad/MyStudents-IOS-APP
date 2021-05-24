//
//  studentTableViewCell.swift
//  MyStudents-IOS-APP
//
//  Created by Mehdi Benrefad on 24/05/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class studentTableViewCell: UITableViewCell {

    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var imageframe: UIImageView!
    @IBOutlet weak var CustomViewContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
        // Initialization code
    }
    
    private func addShadow() {
        CustomViewContainer.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        CustomViewContainer.layer.shadowRadius = 2.0
        CustomViewContainer.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        CustomViewContainer.layer.shadowOpacity = 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(withIcon: String, title: String, subtitle: String) {
        imageframe.image = UIImage(named: withIcon)
        firstname.text = title
        lastname.text = subtitle
    }
}
