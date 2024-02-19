//
//  HomeViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 17/02/2024.
//

import Foundation
import RxSwift

class HomeViewModel {
    private var sliderTimer: Timer?
    private var slides: [Int] = [1, 2, 3, 4, 5]
    private var currentIndex = 0
    
    //MARK: Public Variables
    var numberOfItems: Int{
        return slides.count
    }
    
    // inputs
    var slideToItemAtIndex: ((Int)-> Void)?

    // outputs
    func viewDidLoad() {
        sliderTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(movetoindex), userInfo: nil, repeats: true)
    }
    
    @objc func movetoindex () {
        if currentIndex < slides.count - 1 {
            currentIndex += 1
        }
        else{
            currentIndex = 0
        }
        
        slideToItemAtIndex?(currentIndex)
        
    }
    
    
}

