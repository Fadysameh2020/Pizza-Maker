//
//  MainNavigator.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import Foundation
import UIKit

class MainNavigator: NavigatorProtocol{
    
    var coordinator: CoordinatorProtocol

    required init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    enum Destination {
        case home
        case itemDetails(product: Product)
    }
    
    func viewController(for destination: Destination, coordinator: CoordinatorProtocol) -> UIViewController {
        let view: UIViewController!
        switch destination {
        case .home:
            let viewModel = HomeViewModel()
            view = HomeViewController(viewModel: viewModel, coordinator: coordinator)
            return view
            
        case .itemDetails(let product):
            let viewModel = ItemDetailsViewModel(product: product)
            view = ItemDetailsViewController(viewModel: viewModel, coordinator: coordinator)
            return view
        }
        
    }
    
    
}
