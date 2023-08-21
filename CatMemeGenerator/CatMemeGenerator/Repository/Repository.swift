//
//  Repository.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 20.08.23.
//

import Foundation
import SwiftUI
import RxSwift

class Repository {
    
    func generateMemeImage(with text: String) -> Observable<Data?> {
        return APIManager.shared.generateMemeImageData(with: text)
    }
    
    func generateRandomCatImage() -> Observable<Data?> {
        return APIManager.shared.generateRandomCatImageData()
    }
}
