//
//  CatMemeView.swift
//  CatMemeGenerator
//
//  Created by Huzaifa on 19.08.23.
//

import SwiftUI
import RxSwift
import RxCocoa

struct CatMemeView: View {
    @ObservedObject private var viewModel: CatMemeViewModel
    @State private var displayedImage: UIImage? = nil
    private let disposeBag = DisposeBag()
    
    init(viewModel: CatMemeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            TextField("Enter text", text: Binding(
                get: { self.viewModel.userInput.value },
                set: { self.viewModel.userInput.accept($0) }
            ))
            
            Image(uiImage: displayedImage ?? UIImage())
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
        }
        .onAppear {
            viewModel.memeImage
                .drive(onNext: { image in
                    displayedImage = image
                })
                .disposed(by: disposeBag)
            
            self.viewModel.setUpUserInputSubscriber()
        }
        .padding()
        .navigationTitle("Cat Meme Generator")
    }
}


struct CatMemeView_Previews: PreviewProvider {
    static var previews: some View {
        let useCase = MemeGeneratorUseCase(repository: Repository())
        let viewModel = CatMemeViewModel(useCase: useCase)
        CatMemeView(viewModel: viewModel)
    }
}
