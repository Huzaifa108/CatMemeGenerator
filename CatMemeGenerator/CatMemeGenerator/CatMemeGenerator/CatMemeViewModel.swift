//
//  CatMemeViewModel.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 19.08.23.
//

import Foundation
import SwiftUI
import RxSwift
import RxCocoa

class CatMemeViewModel: ObservableObject {
    
    private let useCase: MemeGeneratorUseCase
    
    private let disposeBag = DisposeBag()
    private var ongoingRequests: [Disposable] = []
    
    let userInput = BehaviorRelay<String>(value: "")
    
    private let memeImageRelay = BehaviorRelay<UIImage?>(value: nil)
    private(set) var memeImage: Driver<UIImage?>

    init(useCase: MemeGeneratorUseCase) {
        self.useCase = useCase
        self.memeImage = memeImageRelay
                    .asDriver(onErrorJustReturn: nil)
    }
    
    func setUpUserInputSubscriber() {
        let debouncedInput = userInput
            .debounce(.seconds(3), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.count >= 3 }
        
        debouncedInput
            .subscribe(onNext: { [weak self] value in
                self?.generateMemeImage(with: value)
                print("Debounced input: \(value)")
            })
            .disposed(by: disposeBag)
    }
    
    func generateMemeImage(with text: String) {
        cancelOngoingRequests()
        let request = useCase.generateMemeImage(with: text)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] image in
                self?.memeImageRelay.accept(image)
            })
        
        request.disposed(by: disposeBag)
        ongoingRequests.append(request)
    }
    
    func cancelOngoingRequests() {
        ongoingRequests.forEach { $0.dispose() }
        ongoingRequests.removeAll()
    }
    
    deinit {
        cancelOngoingRequests()
    }
    
}
