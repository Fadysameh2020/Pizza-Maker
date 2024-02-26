//
//  CartHeaderCell.swift
//  Pizza Maker
//
//  Created by MESHO on 25/02/2024.
//

import UIKit

class CartHeaderCell: UITableViewCell {

    @IBOutlet weak var itemsCountLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: CartHeaderViewModel){
        itemsCountLabel.text = viewModel.itemsCount
        totalCostLabel.text = viewModel.totalCost
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
