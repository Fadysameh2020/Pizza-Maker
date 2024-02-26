//
//  HomeViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 17/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelOutputProtocol {
    var slideToItem: PublishSubject<Int> { get set }
    var navigateToItemDetails: PublishSubject<Product> { get set }
}

protocol HomeViewModelInputProtocol {
    func viewDidLoad()
    func movetoindex ()
    func didSelectItemAtIndexPath(_ indexPath: IndexPath)
}

class HomeViewModel: ViewModelProtocol, HomeViewModelInputProtocol, HomeViewModelOutputProtocol {
    
    private var sliderTimer: Timer?
    var slides: BehaviorRelay<[Int]> = .init(value: [1, 2, 3, 4])
    var popularItems: BehaviorRelay<[Product]> = .init(value: [
        Product(title: "Pizza", rating: 5, price: 20.5), Product(title: "Pizza Burger", rating: 5, price: 20.5), Product(title: "Pizza Shrimp", rating: 5, price: 20.5), Product(title: "Pizza Beef", rating: 5, price: 20.5), Product(title: "Pizza BBQ", rating: 5, price: 20.5)
    ])
    private var currentIndex = 0
    
    //MARK: Public Variables
//    var numberOfItems: Int{
//        return slides.value.count
//    }
    
    // outputs
    var slideToItem: PublishSubject<Int> = .init()
    var navigateToItemDetails: PublishSubject<Product> = .init()

    // inputs
    func viewDidLoad() {
        sliderTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(movetoindex), userInfo: nil, repeats: true)
    }
    
    @objc func movetoindex () {
        if currentIndex < slides.value.count - 1 {
            currentIndex += 1
        }
        else{
            currentIndex = 0
        }
        slideToItem.onNext(currentIndex)        
    }
    
    func didSelectItemAtIndexPath(_ indexPath: IndexPath) {
        let model = popularItems.value[indexPath.row]
        navigateToItemDetails.onNext(model)
    }
    
    
}

