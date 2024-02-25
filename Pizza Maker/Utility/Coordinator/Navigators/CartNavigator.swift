//
//  CartNavigator.swift
//  Pizza Maker
//
//  Created by MESHO on 24/02/2024.
//

import Foundation
import UIKit

class CartNavigator: NavigatorProtocol {
    
    var coordinator: CoordinatorProtocol
    
    private let storyboard: AppStoryboard = .Cart
    
    enum Destination {
        case cart
    }
    
    required init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: CoordinatorProtocol) -> UIViewController {
        switch destination {
        case .cart:
            let viewModel = CartViewModel()
            let view = CartViewController.createFromStoryboard(storyboard: .Cart, viewModel: viewModel, coordinator: coordinator)
            return view
        }
    }
}
