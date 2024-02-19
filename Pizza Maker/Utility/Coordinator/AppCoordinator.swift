//
//  AppCoordinator.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import Foundation
import UIKit

protocol CoordinatorProtocol{
    var Main: MainNavigator { get }
    var navigationController: UINavigationController?{ get }
}

class AppCoordinator: CoordinatorProtocol{
    
    let window: UIWindow
    lazy var Main: MainNavigator = {
        return .init(coordinator: self)
    }()
    
    private lazy var tabBar: CustomTabBarController = {
        return .init(coordinator: self)
    }()
    
    var navigationController: UINavigationController?{
        guard let navigationController = tabBar.selectedViewController as? UINavigationController else { return nil }
        
        return navigationController
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController: UIViewController{
        return tabBar
    }
    
}
