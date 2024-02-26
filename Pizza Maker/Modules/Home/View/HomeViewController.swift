//
//  HomeViewController.swift
//  Pizza Maker
//
//  Created by MESHO on 15/02/2024.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseWireframe<HomeViewModel> {

    @IBOutlet private weak var sliderCollectionView: UICollectionView!{
        didSet{
            sliderCollectionView.dataSource = self
            sliderCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var popularTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    override func bind(viewModel: HomeViewModel) {
        viewModel.slideToItem.subscribe { [weak self] index in
            //take action
            guard let self = self else {return}
            self.sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            
        }.disposed(by: disposeBag)

        viewModel.slides.subscribe { [weak self] (_) in
            guard let self = self else {return}
            self.sliderCollectionView.reloadData()
        }.disposed(by: disposeBag)
        
        viewModel.navigateToItemDetails.asObservable().subscribe { [weak self] product in
            guard let self = self else {return}
            self.coordinator.Main.navigate(to: .itemDetails(product: product))
        }.disposed(by: disposeBag)

    }
    
    
}

extension HomeViewController{
    private func setupUI(){
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        registerCells()
        setupPopularTableView()
        viewModel.viewDidLoad()
    }
    
    private func setupPopularTableView(){
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.popularItems.asObservable()
            .bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularTableViewCell.self), cellType: PopularTableViewCell.self)){ [weak self] index, model, cell in
                guard let self = self else {return}
                cell.ratingView.configureWithRating(rating: 5, style: .compact)
                cell.configure( self.viewModel.popularItemsViewModelAtIndexPath(IndexPath(item: index, section: 0)))
                
        }.disposed(by: disposeBag)
        
//        popularTableView.rx.modelSelected(Product.self).subscribe { model in
//            print("item selected")
//        }.disposed(by: disposeBag)

        popularTableView.rx.itemSelected.subscribe { [weak self] (indexPath) in
            print("item selected-> \(indexPath)")
            guard let self = self else {return}
            self.popularTableView.deselectRow(at: indexPath, animated: true)
            self.viewModel.didSelectItemAtIndexPath(indexPath)
        }.disposed(by: disposeBag)
        
    }
    
    private func registerCells(){
        sliderCollectionView.registerCell(cellClass: SliderCollectionViewCell.self)
        popularTableView.registerCellNib(cellClass: PopularTableViewCell.self)
    }
    
}

//MARK: - CollectionView Protocols
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCollectionViewCell
        cell.configure(viewModel.sliderViewModelAtIndexPath(indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        viewModel.didSelectItem()
        coordinator.Main.navigate(to: .home, with: .push)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
//        self.pageControl.currentPage = indexPath.row
    }
    
    
}
