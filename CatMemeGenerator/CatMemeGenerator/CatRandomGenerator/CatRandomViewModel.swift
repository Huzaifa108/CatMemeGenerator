//
//  CatRandomViewModel.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 19.08.23.
//

import Foundation
import SwiftUI
import RxSwift
import RxCocoa

class CatRandomViewModel: ObservableObject {
    
    private let useCase: RandomGeneratorUseCase
    
    private var disposeBag = DisposeBag()
    private var ongoingRequests: [Disposable] = []

    private let memeImageRelay = BehaviorRelay<UIImage?>(value: nil)
    private(set) var memeImage: Driver<UIImage?>

    init(useCase: RandomGeneratorUseCase) {
        self.useCase = useCase
        self.memeImage = memeImageRelay
                    .asDriver(onErrorJustReturn: nil)
    }
    
    func generateRandomImage() {
        cancelOngoingRequests()
        let request = useCase.generateRandomCatImage()
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
