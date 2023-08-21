//
//  HomeView.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 19.08.23.
//

import SwiftUI

struct HomeView: View {
    var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: NavigationLazyView(viewModel.navigateToCatMemeGenerator()))
                {
                    Text("Cat Meme Generator")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: NavigationLazyView(viewModel.navigateToRandomCatGenerator()))
                {
                    Text("Random Cat Generator")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(10)
            .navigationTitle("Meme Generator")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel.init(coordinator: HomeCoordinator.init()))
    }
}



struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
