//
//  CartItemCell.swift
//  Pizza Maker
//
//  Created by MESHO on 25/02/2024.
//

import UIKit

class CartItemCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: CartItemViewModel){
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
