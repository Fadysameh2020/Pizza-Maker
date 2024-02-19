//
//  RatingView.swift
//  Pizza Maker
//
//  Created by MESHO on 15/02/2024.
//

import Foundation
import UIKit

class RatingView: UIView {
    //MARK: UI Private Configuration
    private let maximumRating = 5
    
    
    //MARK: UI Public Configuration
    var rating:Int = 5
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 2
        return stack
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        configurationWithRating(rating: 3)
    }
    
    func setupUI(){
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func configurationWithRating(rating: Int) {
        //add filled stars
        if rating > 0 {
            for _ in 1...rating {
                let image = generateStarView(.filled)
                stackView.addArrangedSubview(image)
            }
        }
    
        //add non-filled stars
        let nonFilledStars = maximumRating - rating
        if nonFilledStars > 0 {
            for _ in 1...nonFilledStars {
                let image = generateStarView(.nonFilled)
                stackView.addArrangedSubview(image)
            }
        }
        
    }
    
    private func generateStarView(_ type: StarType) -> UIImageView {
        let starImage: UIImage
        switch type {
        case .filled:
            starImage = UIImage(named: "filledStar")!
        case .nonFilled:
            starImage = UIImage(named: "star")!
        }
        let image = UIImageView(image: starImage)
        image.widthAnchor.constraint(lessThanOrEqualToConstant: 10).isActive = true
        return image
    }
    
    enum StarType {
        case filled
        case nonFilled
    }
    
}
