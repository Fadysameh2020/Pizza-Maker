//
//  CategoriesDataSource.swift
//  Pizza Maker
//
//  Created by MESHO on 29/02/2024.
//

import UIKit

class CategoriesDataSource: NSObject, UICollectionViewDataSource {
    let viewModel: PizzaMakerViewModel
    init(viewModel: PizzaMakerViewModel) {
        self.viewModel = viewModel
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as CategoryCell
        let item = viewModel.categoryViewModelForIndex(indexPath: indexPath)
        cell.configure(with: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pizzaRepository.numberOfItems(for: .categories)
    }
}
