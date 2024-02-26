//
//  PopularTableViewCell.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingView: RatingView!
    
    @IBOutlet private weak var itemImage: UIImageView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var cookTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ viewModel: PopularItemViewModel){
        self.titleLabel.text = viewModel.title
        self.subTitleLabel.text = viewModel.subTitle
        self.categoryLabel.text = viewModel.category
        self.cookTimeLabel.text = viewModel.cookTime
        
        ratingView.configureWithRating(rating: viewModel.rating)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ratingView.stackView.removeAllArrangedSubviews()
    }
    
    
}
