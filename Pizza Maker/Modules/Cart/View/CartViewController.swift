//
//  CartViewController.swift
//  Pizza Maker
//
//  Created by MESHO on 24/02/2024.
//

import UIKit

class CartViewController: BaseWireframe<CartViewModel>{
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var placeOrderButton: PizzaButton!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func bind(viewModel: CartViewModel) {
        
    }
    
    @IBAction func didPressOnPlaceOrder(_ sender: PizzaButton) {
        
    }
    

}
