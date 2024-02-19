//
//  PopularTableViewCell.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingView: RatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
