//
//  SliderCollectionViewCell.swift
//  Pizza Maker
//
//  Created by MESHO on 15/02/2024.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var ratingView: RatingView!
    
    @IBOutlet private weak var sliderImage: UIImageView!
    @IBOutlet private weak var orderNowButton: UIButton!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var cookTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configure(_ viewModel: SliderViewModel){
        self.titleLabel.text = viewModel.title
        self.orderNowButton.setTitle(viewModel.buttonTitle, for: .normal)
        self.categoryLabel.text = viewModel.category
        self.cookTimeLabel.text = viewModel.cookTime
        
        ratingView.configureWithRating(rating: viewModel.rating)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ratingView.stackView.removeAllArrangedSubviews()
    }

}
