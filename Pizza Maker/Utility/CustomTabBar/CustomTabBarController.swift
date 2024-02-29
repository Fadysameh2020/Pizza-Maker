//
//  CustomTabBarController.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum TabBarItem: Int, CaseIterable {
        case Home
        case PizzaMaker
        case Cart
    }
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PizzaTabBar"), for: .normal)
        button.backgroundColor = .pinkishRed
//        button.isCircle = true
        
//        button.layer.cornerRadius = 30
//        button.imageEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: 0)
         
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setValue(CustomTabBar(), forKey: "tabBar")
        setupTabBarItem()
        setupTabBarUI()
        createMiddleButton()
    }
    
    
    private func createMiddleButton(){
        view.addSubview(middleButton)
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleButton.widthAnchor.constraint(equalToConstant: 60),
            middleButton.heightAnchor.constraint(equalToConstant: 60),
            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -16)
        ])
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        middleButton.isCircle = true
    }
    
    
    private func setupTabBarUI(){
        tabBar.tintColor = .darkBlueGrey
        tabBar.unselectedItemTintColor = .red
        tabBar.items?[TabBarItem.PizzaMaker.rawValue].isEnabled = false
        middleButton.addTarget(self, action: #selector(didSelectMiddleButton), for: .touchUpInside)
    }
    
    @objc func didSelectMiddleButton(){
        print("pressed middle butto")
        selectedIndex = TabBarItem.PizzaMaker.rawValue
    }
    
    private func setupTabBarItem(){
        self.viewControllers = TabBarItem.allCases.map({ 
            let view = viewControllerForTabBarItem($0)
            let navigation = UINavigationController(rootViewController: view)
            return navigation })
    }
    
    func viewControllerForTabBarItem(_ item: TabBarItem) -> UIViewController {
        var view: UIViewController
        switch item {
        case .Home:
            view = coordinator.Main.viewController(for: .home, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
        case .PizzaMaker:
            view = coordinator.Pizza.viewController(for: .pizzaMakerOptions, coordinator: coordinator)
//            let view = UIViewController()
            return view
        case .Cart:
            view = coordinator.Cart.viewController(for: .cart, coordinator: coordinator)
            view.tabBarItem = tabBarItem(for: item)
        }
        
        return view
    }
    
    func tabBarItem(for item: TabBarItem) -> UITabBarItem? {
        var tabBarItem: UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        case .PizzaMaker:
            return nil
        case .Cart:
            tabBarItem = .init(title: "Cart", image: UIImage(named: "cart"), selectedImage: UIImage(named: "cart"))
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        return tabBarItem
    }
    
    

}
