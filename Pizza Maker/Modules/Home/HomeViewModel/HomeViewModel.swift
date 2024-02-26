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
    func sliderViewModelAtIndexPath(_ indexPath: IndexPath) -> SliderViewModel
    func popularItemsViewModelAtIndexPath(_ indexPath: IndexPath) -> PopularItemViewModel
}

protocol HomeViewModelInputProtocol {
    func viewDidLoad()
    func movetoindex ()
    func didSelectItemAtIndexPath(_ indexPath: IndexPath)
}

protocol HomeViewModelProtocol: HomeViewModelInputProtocol, HomeViewModelOutputProtocol {}

class HomeViewModel: ViewModelProtocol, HomeViewModelProtocol {
    
    private var sliderTimer: Timer?
    var slides: BehaviorRelay<[SliderViewModel]> = .init(value: [])
    var items: BehaviorRelay<[PopularItemViewModel]> = .init(value: [])

    var popularItems: BehaviorRelay<[ProductViewModel]> = .init(value: [])
    private var popularItemsList: [Product] = []
    
    private var currentIndex = 0
    
    //MARK: Public Variables
    var numberOfItems: Int{
        return slides.value.count
    }
    
    // outputs
    var slideToItem: PublishSubject<Int> = .init()
    var navigateToItemDetails: PublishSubject<Product> = .init()

    // inputs
    func viewDidLoad() {
        sliderTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(movetoindex), userInfo: nil, repeats: true)
        fetchSliderData()
        fetchPopularData()
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
        let product = popularItems.value[indexPath.row]
        let model = product.product
        navigateToItemDetails.onNext(model)
    }
    
    // Network Calls
    private func fetchSliderData(){
        NetworkClient().performRequest([Slider].self, router: MainRouter.slider) { [weak self] (result) in
            guard let self = self else {return}
            switch result{
            case .success(let data):
                let slidesModels = data.data
                self.slides.accept(slidesModels.map(SliderViewModel.init))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    private func fetchPopularData(){
        NetworkClient().performRequest([Product].self, router: FeedRouter.popular) { [weak self] (result) in
            guard let self = self else {return}
            switch result{
            case .success(let data):
                let slidesModels = data.data
                self.popularItems.accept(slidesModels.map(ProductViewModel.init))
                self.items.accept(slidesModels.map(PopularItemViewModel.init))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func sliderViewModelAtIndexPath(_ indexPath: IndexPath) -> SliderViewModel{
        return slides.value[indexPath.row]
    }
    
    func popularItemsViewModelAtIndexPath(_ indexPath: IndexPath) -> PopularItemViewModel{
        return items.value[indexPath.row]
    }
    
    
}

