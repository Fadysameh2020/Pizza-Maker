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
    func viewController(for destination: Destination, coordinator: CoordinatorProtocol) -> UIViewController
    init(coordinator: CoordinatorProtocol)
    var coordinator: CoordinatorProtocol { get }
    
    func navigate(to destination: Destination, with navigationType: NavigatorType)
    
}

enum NavigatorType {
    case push
    case present
    case presentWithNavigation
    case root
}

extension NavigatorProtocol{
    func navigate(to destination: Destination, with navigationType: NavigatorType = .push){
        let viewController = self.viewController(for: destination, coordinator: coordinator)

        switch navigationType {
        case .push:
            coordinator.navigationController?.pushViewController(viewController, animated: true)
        case .present:
            viewController.modalPresentationStyle = .overCurrentContext
            coordinator.tabBar.present(viewController, animated: true, completion: nil)
        case .presentWithNavigation:
            let newVC = self.viewController(for: destination, coordinator: coordinator.subCoordinator)
//            let navigationController = coordinator.navigationController.root
            coordinator.navigationController?.setViewControllers([newVC], animated: true)
            coordinator.tabBar.present(coordinator.navigationController!, animated: true, completion: nil)
        case .root:
//            coordinator.navigationController?.popToRootViewController(animated: true)
            coordinator.navigationController?.setViewControllers([viewController], animated: true)

        }
        
    }
    
    
    
}
