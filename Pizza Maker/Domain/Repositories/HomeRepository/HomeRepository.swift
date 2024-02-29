//
//  HomeRepository.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeRepositoryProtocol {
    func fetchSliderData() -> Observable<[Slider]>
    func fetchPopularItemsData() -> Observable<[Product]>
}

class HomeRepositoryImplementation: HomeRepositoryProtocol {
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = .init()) {
        self.networkClient = networkClient
    }
    
    
    func fetchSliderData() -> Observable<[Slider]> {
        Observable<[Slider]>.create { [weak self] (item) -> Disposable in
            guard let self = self else { return [] as! Disposable}
            self.networkClient.performRequest([Slider].self, router: MainRouter.slider) { (result) in
                switch result{
                case .success(let data):
                    let slidesModel = data.data
                    item.onNext(slidesModel)
                    item.onCompleted()
                case .failure(let error):
                    item.onError(error)
                }
            }
                        
            return Disposables.create()
        }
        
    }
    
    func fetchPopularItemsData() -> Observable<[Product]> {
        Observable<[Product]>.create { [weak self] (item) -> Disposable in
            guard let self = self else { return [] as! Disposable}
            self.networkClient.performRequest([Product].self, router: FeedRouter.popular) { (result) in
                switch result{
                case .success(let data):
                    let slidesModel = data.data
                    item.onNext(slidesModel)
                    item.onCompleted()
                case .failure(let error):
                    item.onError(error)
                }
            }
                        
            return Disposables.create()
        }
    }
    
    
}
