//
//  UseCases.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 20.08.23.
//

import Foundation
import SwiftUI
import RxSwift

class MemeGeneratorUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func generateMemeImage(with text: String) -> Observable<UIImage?> {
        return repository.generateMemeImage(with: text)
            .map { data in
                guard let data = data else {
                    return nil
                }
                return UIImage(data: data)
            }
    }
}


class RandomGeneratorUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func generateRandomCatImage() -> Observable<UIImage?> {
        return repository.generateRandomCatImage()
            .map { data in
                guard let data = data else {
                    return nil
                }
                return UIImage(data: data)
            }
    }
}
