//
//  CategoriesItemsDataSource.swift
//  Pizza Maker
//
//  Created by MESHO on 29/02/2024.
//

import UIKit

class CategoriesItemsDataSource: NSObject, UICollectionViewDataSource {
    let viewModel: PizzaMakerViewModel
    init(viewModel: PizzaMakerViewModel) {
        self.viewModel = viewModel
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as ItemCell
        let model = viewModel.categoryItemViewModelForIndex(indexPath: indexPath)
        cell.configure(with: model)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pizzaRepository.numberOfItems(for: .items(categoryIndex: viewModel.currentSelectedCategory))
    }
}

