//
//  CatalogViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation
import Combine

final class CatalogViewModel: CatalogViewModeling, Identifiable {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    
    @Published var catalogItems: CatalogDTO = CatalogDTO(categories: [], courses: [])
    
    private var getCatalogUseCase: GetCatalogUseCase
    private var cancelables = Set<AnyCancellable>()

    
    init(getCatalogUseCase: GetCatalogUseCase) {
        self.getCatalogUseCase = getCatalogUseCase
    }
    
    func getCatalog() {
        isLoading = true
        getCatalogUseCase.execute()
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
            } receiveValue: { [weak self]  catalogItems in
                print(catalogItems)
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.catalogItems = catalogItems
                }
            }.store(in: &cancelables)
    }
}
