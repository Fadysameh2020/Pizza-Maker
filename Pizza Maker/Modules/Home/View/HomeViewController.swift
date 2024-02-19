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
//    {
//        didSet{
//            popularTableView.dataSource = self
//            popularTableView.delegate = self
//        }
//    }
    
//    var homeVM = HomeViewModel()
//    private let disposeBag = DisposeBag()
//    
//    var coordinator: CoordinatorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

//    init() {
//        super.init(nibName: "HomeViewController", bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func bind(viewModel: HomeViewModel) {
        viewModel.slideToItem.subscribe { [weak self] index in
            //take action
            guard let self = self else {return}
            self.sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            
        }.disposed(by: disposeBag)

        viewModel.slides.subscribe { [weak self] (_) in
            guard let self = self else {return}
            print("hii")
            self.sliderCollectionView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    
}

extension HomeViewController{
    private func setupUI(){
        registerCells()
        setupPopularTableView()
        viewModel.viewDidLoad()
    }
    
    private func setupPopularTableView(){
        popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.popularItems.asObservable()
            .bind(to: popularTableView.rx.items(cellIdentifier: String(describing: PopularTableViewCell.self), cellType: PopularTableViewCell.self)){ index, model, cell in
                cell.ratingView.configurationWithRating(rating: 5, style: .compact)
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
        return viewModel.slides.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        viewModel.didSelectItem()
        coordinator.Main.navigate(to: .home)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
//        self.pageControl.currentPage = indexPath.row
    }
    
    
}
