//
//  ItemCell.swift
//  Pizza Maker
//
//  Created by MESHO on 29/02/2024.
//

import UIKit
import Kingfisher

class ItemCell: UICollectionViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    
    func configure(with viewModel: PizzaCategoryItemViewModel){
        self.categoryName.text = viewModel.name
        if let imageUrl = viewModel.imageUrl {
            img.kf.setImage(with: imageUrl)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
