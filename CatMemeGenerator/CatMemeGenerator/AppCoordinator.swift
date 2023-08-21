//
//  AppCoordinator.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 20.08.23.
//

import SwiftUI

class AppCoordinator {
    func start() -> some View {
        let homeCoordinator = HomeCoordinator()
        let viewModel = HomeViewModel(coordinator: homeCoordinator)
        return HomeView(viewModel: viewModel)
    }
}
