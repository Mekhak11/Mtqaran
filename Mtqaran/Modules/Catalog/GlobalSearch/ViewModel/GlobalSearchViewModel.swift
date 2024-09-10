//
//  GlobalSearchViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import Foundation
import Combine

final class GlobalSearchViewModel: GlobalSearchViewModeling, Identifiable {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var searchResult: GlobalSearcgDTO = GlobalSearcgDTO(users: [], teachers: [], courses: [], lessons: [])
    
    private var globalSearchUseCase: GlobalSearchUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(globalSearchUseCase: GlobalSearchUseCase) {
        self.globalSearchUseCase = globalSearchUseCase
    }
    
    func globalSearch(searchWord: String) {
      isLoading = true
        globalSearchUseCase.execute(searchWord: searchWord)
              .sink { [weak self] result in
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
                switch result {
                case .finished:
                    print("Finished")
                    DispatchQueue.main.async {
                        self?.isLoading = false
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.error = error as? RequestServiceError
                    }
                    print(error)
                }
            } receiveValue: { [weak self]  res in
                print(res)
                DispatchQueue.main.async {
                    self?.searchResult = res
                }
            }.store(in: &cancelables)
    }
}
