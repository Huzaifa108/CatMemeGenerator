//
//  HomeViewModel.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 20.08.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    private let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToCatMemeGenerator() -> CatMemeView {
        return coordinator.navigateToCatMemeGenerator()
    }
    
    func navigateToRandomCatGenerator() -> CatRandomView {
        return coordinator.navigateToRandomCatGenerator()
    }
}
