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
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .home:
            let viewModel = HomeViewModel()
            let view = HomeViewController(viewModel: viewModel, coordinator: coordinator)
            view.coordinator = coordinator
            return view
        }
        
    }

//    func navigate(to destination: Destination, navigationType: NavigatorType = .push) {
//        
//    }
    
    
}
