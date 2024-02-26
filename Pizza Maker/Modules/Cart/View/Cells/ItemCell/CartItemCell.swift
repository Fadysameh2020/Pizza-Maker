//
//  CartItemCell.swift
//  Pizza Maker
//
//  Created by MESHO on 25/02/2024.
//

import UIKit

class CartItemCell: UITableViewCell {
    
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var itemLabel: UILabel!
    @IBOutlet private weak var notesLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: CartItemViewModel){
        itemLabel.text = viewModel.topString
        notesLabel.text = viewModel.notesString
        priceLabel.text = viewModel.price
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
