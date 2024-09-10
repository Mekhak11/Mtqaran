//
//  AllCategoriesViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class AllCategoriesViewModel: ObservableObject, Identifiable {
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var categories: [CategoryDTO] = []
   
    private var getCategoriesUseCase: GetCategoriesUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getCategoriesUseCase: GetCategoriesUseCase) {
        self.getCategoriesUseCase = getCategoriesUseCase
    }
    
    func getCategories(searchWord: String, page: Int) {
        getCategoriesUseCase.execute(searchWord: searchWord, page: page)
              .sink { [weak self] result in
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
                switch result {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    self?.error = error as? RequestServiceError
                    print(error)
                }
            } receiveValue: { [weak self]  result in
                DispatchQueue.main.async {
                    self?.categories = result
                }
            }.store(in: &cancelables)
    }
}
