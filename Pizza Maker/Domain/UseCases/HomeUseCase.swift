//
//  HomeUseCase.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

class HomeUseCase {
    let homeRepository: HomeRepositoryProtocol
    let networkDispatchGroup = DispatchGroup()
    let disposeBag = DisposeBag()
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
        networkDispatchGroup.notify(queue: .main) {
            print("I'm done")
        }
        self.networkDispatchGroup.enter()
        self.networkDispatchGroup.enter()
        self.networkDispatchGroup.leave()
        self.networkDispatchGroup.leave()

    }

    func executeSliderFetch() -> Observable<[Slider]>{
        let observable = homeRepository.fetchSliderData()
        observable.subscribe { (item) in
            DispatchQueue.main.async {
//                self?.networkDispatchGroup.leave()
            }
        }.disposed(by: disposeBag)

        return observable
    }
    
    func executePopularFetch() -> Observable<[Product]> {
        let observable = homeRepository.fetchPopularItemsData()
        observable.subscribe { (item) in
//                self?.networkDispatchGroup.leave()
        }.disposed(by: disposeBag)
        return observable
    }
    
}
