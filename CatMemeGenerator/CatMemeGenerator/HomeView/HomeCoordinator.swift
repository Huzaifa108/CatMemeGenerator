//
//  HomeCoordinator.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 20.08.23.
//

import SwiftUI

class HomeCoordinator {
    func navigateToCatMemeGenerator() -> CatMemeView {
        let viewModel = CatMemeViewModel(useCase: MemeGeneratorUseCase(repository: Repository()))
        return CatMemeView(viewModel: viewModel)
    }
    
    func navigateToRandomCatGenerator() -> CatRandomView {
        let viewModel = CatRandomViewModel(useCase: RandomGeneratorUseCase(repository: Repository()))
        return CatRandomView(viewModel: viewModel)
    }
}
