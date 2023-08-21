//
//  CatRandomView.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 19.08.23.
//

import SwiftUI
import RxSwift
import RxCocoa

struct CatRandomView: View {
    @ObservedObject var viewModel: CatRandomViewModel
    @State private var displayedImage: UIImage? = nil
    private let disposeBag = DisposeBag()
    
    var body: some View {
        VStack {
            Image(uiImage: displayedImage ?? UIImage())
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            Button(action: {
                viewModel.generateRandomImage()
            }) {
                Text("Generate")
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            viewModel.memeImage
                .drive(onNext: { image in
                    displayedImage = image
                })
                .disposed(by: disposeBag)
        }
        .padding()
        .navigationTitle("Cat Random Generator")
    }
}

struct CatRandomView_Previews: PreviewProvider {
    static var previews: some View {
        let useCase = RandomGeneratorUseCase(repository: Repository())
        let viewModel = CatRandomViewModel(useCase: useCase)
        CatRandomView(viewModel: viewModel)
    }
}
