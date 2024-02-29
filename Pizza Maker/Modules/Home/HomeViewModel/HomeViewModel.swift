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

class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    
    private var sliderTimer: Timer?
    var slides: BehaviorRelay<[SliderViewModel]> = .init(value: [])
    var items: BehaviorRelay<[PopularItemViewModel]> = .init(value: [])

    var popularItems: BehaviorRelay<[ProductViewModel]> = .init(value: [])
    private var popularItemsList: [Product] = []
    
    private var currentIndex = 0
    
    let disposeBag = DisposeBag()
    
    let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol = HomeRepositoryImplementation()) {
        self.homeRepository = homeRepository
    }
    
    
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
        guard slides.value.count > 0 else { return }
        if currentIndex < slides.value.count - 1 {
            currentIndex += 1
        }
        else{
            currentIndex = 0
        }
        slideToItem.onNext(currentIndex)        
    }
    
    func didSelectItemAtIndexPath(_ indexPath: IndexPath) {
        guard popularItems.value.count > 0 else { return }
        let product = popularItems.value[indexPath.row]
        let model = product.product
        navigateToItemDetails.onNext(model)
    }
    
    // Network Calls
    private func fetchSliderData(){
        isLoading.onNext(true)
        homeRepository.fetchSliderData().subscribe { [weak self] (items) in
            guard let self = self else {return}
            self.slides.accept(items.map(SliderViewModel.init))
            self.isLoading.onNext(false)
        } onError: { (error) in
            self.displayError.onNext("I got error.... \(error.localizedDescription)")
            print("I got error.... \(error.localizedDescription) ")
            self.isLoading.onNext(false)
        } onCompleted: {
            self.isLoading.onNext(false)
        }.disposed(by: disposeBag)

    }
    
    
    private func fetchPopularData(){
        isLoading.onNext(true)
        homeRepository.fetchPopularItemsData().subscribe { [weak self] (items) in
            guard let self = self else {return}
            let slidesModels = items
            self.popularItems.accept(slidesModels.map(ProductViewModel.init))
            self.items.accept(slidesModels.map(PopularItemViewModel.init))
            self.isLoading.onNext(false)
        } onError: { (error) in
            self.displayError.onNext("I got error.... \(error.localizedDescription)")
            print("I got error.... \(error.localizedDescription) ")
        } onCompleted: {
            self.isLoading.onNext(false)
        }.disposed(by: disposeBag)
        

    }
    
    func sliderViewModelAtIndexPath(_ indexPath: IndexPath) -> SliderViewModel{
        return slides.value[indexPath.row]
    }
    
    func popularItemsViewModelAtIndexPath(_ indexPath: IndexPath) -> PopularItemViewModel{
        return items.value[indexPath.row]
    }
    
    
}

