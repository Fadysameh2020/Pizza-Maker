//
//  ItemDetailsViewController.swift
//  Pizza Maker
//
//  Created by MESHO on 20/02/2024.
//

import UIKit

class ItemDetailsViewController: BaseWireframe<ItemDetailsViewModel> {

    @IBOutlet private weak var pizzaTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()
    }

    override func bind(viewModel: ItemDetailsViewModel) {
        viewModel.displayMainData.subscribe(onNext: { [weak self] productViewModel in
            guard let self = self else { return }
            self.setupProductView(with: productViewModel)
        }).disposed(by: disposeBag)
    }
    
    private func setupProductView(with viewModel: ProductViewModel) {
        pizzaTitle.text = viewModel.mainTitle

    }
    


}
