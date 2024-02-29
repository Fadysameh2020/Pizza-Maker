//
//  PizzaNavigator.swift
//  Pizza Maker
//
//  Created by MESHO on 29/02/2024.
//

import Foundation
import UIKit

class PizzaNavigator: NavigatorProtocol {
    var coordinator: CoordinatorProtocol
        
    enum Destination {
        case pizzaMakerOptions
        case pizzaMaker(options: PizzaOptions)
    }
    
    required init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func viewController(for destination: Destination, coordinator: CoordinatorProtocol) -> UIViewController {
        switch destination {
        case .pizzaMakerOptions:
            let viewModel = PizzaMakerOptionsSelectorViewModel()
            let view = PizzaMakerOptionsSelectorVC(viewModel: viewModel, coordinator: coordinator)
            return view
        case .pizzaMaker(let options):
            let repo = PizzaRepositoryImpl()
            let viewModel = PizzaMakerViewModel(options, repository: repo)
            let view = PizzaMakerVC(viewModel: viewModel, coordinator: coordinator)
            return view
        }
    }
}
