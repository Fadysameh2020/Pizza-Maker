//
//  HomeViewController.swift
//  Pizza Maker
//
//  Created by MESHO on 15/02/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var sliderCollectionView: UICollectionView!{
        didSet{
            sliderCollectionView.dataSource = self
            sliderCollectionView.delegate = self
        }
    }
    
//    var slides: [Int] = []
    
    var homeVM = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeViewController{
    private func setupUI(){
        registerCells()
        startTimer()
        homeVM.viewDidLoad()
        
        
    }
    
    private func registerCells(){
        sliderCollectionView.registerCell(cellClass: SliderCollectionViewCell.self)
    }
    
    private func startTimer(){
        homeVM.slideToItemAtIndex = { [weak self] index in
            //take action
        self?.sliderCollectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
//            pageControl.currentPage = currentIndex


        }
        
    }
    
    

    
    
}

//MARK: - CollectionView Protocols
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
//        self.pageControl.currentPage = indexPath.row
    }
    
    
}
