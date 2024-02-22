//
//  PizzaOptionsView.swift
//  Pizza Maker
//
//  Created by MESHO on 22/02/2024.
//

import UIKit

class PizzaOptionsView: NibLoadingView {
    @IBOutlet weak var sizeView: SizesSelectorView!
    
    @IBOutlet weak var quantityView: QuantityView!
    
    @IBOutlet weak var descriptionView: PIZZATextView!
}

