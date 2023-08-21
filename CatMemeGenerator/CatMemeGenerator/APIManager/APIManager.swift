//
//  APIManager.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 20.08.23.
//

import SwiftUI
import RxSwift
import RxCocoa


enum CatMemeEndpoint {
    case custom(String)
    case randomCat
}

extension CatMemeEndpoint {
    var path: String {
        switch self {
        case .custom(let text):
            return "cat/cute/says/\(text)"
        case .randomCat:
            return "cat"
        }
    }
    
    var url: URL? {
        let baseURLString = "https://cataas.com/"
        let urlString = baseURLString + (path.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? path)
        return URL(string: urlString)
    }
}


class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func generateMemeImageData(with text: String) -> Observable<Data?> {
        guard let url = CatMemeEndpoint.custom(text).url else {
            return Observable.just(nil)
        }
        
        return URLSession.shared.rx.data(request: URLRequest(url: url))
            .map { data in
                return data
            }
    }
    
    func generateRandomCatImageData() -> Observable<Data?> {
        guard let url = CatMemeEndpoint.randomCat.url else {
            return Observable.just(nil)
        }
        
        return URLSession.shared.rx.data(request: URLRequest(url: url))
            .map { data in
                return data
            }
    }
}
