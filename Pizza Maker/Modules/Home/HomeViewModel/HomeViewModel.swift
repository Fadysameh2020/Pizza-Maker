//
//  HomeViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 17/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private var sliderTimer: Timer?
    var slides: BehaviorRelay<[Int]> = .init(value: [1])
    private var currentIndex = 0
    
    //MARK: Public Variables
//    var numberOfItems: Int{
//        return slides.value.count
//    }
    
    // inputs
    var slideToItem: PublishSubject<Int> = .init()

    // outputs
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
    
    func didSelectItem(){
        slides.accept([1, 2, 3])
    }
    
    
}

