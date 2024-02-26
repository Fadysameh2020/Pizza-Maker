//
//  CartViewController.swift
//  Pizza Maker
//
//  Created by MESHO on 24/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

class CartViewController: BaseWireframe<CartViewModel>{
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var placeOrderButton: PizzaButton!
        
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTableView()
    }
    
    
    private func configureTableView(){
        registerCells()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.output.cartItemObservable.bind(to: tableView.rx.items(cellIdentifier: String(describing: CartItemCell.self), cellType: CartItemCell.self)){ (index, model, cell) in
            cell.configure(with: model)
        }.disposed(by: disposeBag)
        
    }
    
    
    private func registerCells(){
        tableView.registerCellNib(cellClass: CartHeaderCell.self)
        tableView.registerCellNib(cellClass: CartItemCell.self)
        tableView.registerCellNib(cellClass: CartFooterCell.self)
    }
    

    override func bind(viewModel: CartViewModel) {
        
    }
    
    @IBAction func didPressOnPlaceOrder(_ sender: PizzaButton) {
        
    }
    

}

extension CartViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeue() as CartHeaderCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}
