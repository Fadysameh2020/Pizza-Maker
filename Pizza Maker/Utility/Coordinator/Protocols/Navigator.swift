//
//  Navigator.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    associatedtype Destination
    func viewController(for destination: Destination) -> UIViewController
    init(coordinator: CoordinatorProtocol)
    var coordinator: CoordinatorProtocol { get }
    
    func navigate(to destination: Destination, with navigationType: NavigatorType)
}

enum NavigatorType {
    case push
    case present
    case pop
    case root
}

extension NavigatorProtocol{
    func navigate(to destination: Destination, with navigationType: NavigatorType = .push){
        let viewCotroller = self.viewController(for: destination)

        switch navigationType {
        case .push:
            coordinator.navigationController?.pushViewController(viewCotroller, animated: true)
        case .present:
            coordinator.navigationController?.present(viewCotroller, animated: true)
            viewCotroller.modalPresentationStyle = .popover
        case .pop:
            coordinator.navigationController?.popViewController(animated: true)
        case .root:
//            coordinator.navigationController?.popToRootViewController(animated: true)
            coordinator.navigationController?.setViewControllers([viewCotroller], animated: true)

        }
        
    }
    
    
    
}
