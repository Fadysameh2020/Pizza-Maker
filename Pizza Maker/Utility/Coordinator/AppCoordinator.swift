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
    var Cart: CartNavigator { get }
//    var Pizza: PizzaNavigator { get }
    var tabBar: CustomTabBarController { get }
    func dismiss()
    var subCoordinator: CoordinatorProtocol { get }
}

class AppCoordinator: CoordinatorProtocol{
    
    let window: UIWindow
    
    lazy var Main: MainNavigator = {
        return .init(coordinator: self)
    }()
    
    lazy var tabBar: CustomTabBarController = {
        return CustomTabBarController(coordinator: self)
    }()
    
    lazy var Cart: CartNavigator = {
        return .init(coordinator: self)
    }()
    
//    lazy var Pizza: PizzaNavigator = {
//        return .init(coordinator: self)
//    }()
    
    lazy var subCoordinator: CoordinatorProtocol = {
        return AppCoordinator(window: window, isSub: true)
    }()
    
    lazy var subNavigationController = {
        return UINavigationController()
    }()

    var navigationController: UINavigationController? {
        if(isSub){
            return subNavigationController
        } else {
            if let navigationController = tabBar.selectedViewController as? UINavigationController {
                return navigationController
            }
            return nil
        }
    }
    var isSub: Bool
    
//    var navigationController: UINavigationController?{
//        guard let navigationController = tabBar.selectedViewController as? UINavigationController else { return nil }
//        
//        return navigationController
//    }
    
    init(window: UIWindow, isSub: Bool = false) {
        self.window = window
        self.isSub = isSub
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func dismiss() {
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    var rootViewController: UIViewController{
        return tabBar
    }
    
}
