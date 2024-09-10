//
//  AllLecturesViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class AllLecturesViewModel: ObservableObject, Identifiable {
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var lectures: [LectureDTO] = []
   
    private var getLecturesUseCase: GetLecturesUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getLecturesUseCase: GetLecturesUseCase) {
        self.getLecturesUseCase = getLecturesUseCase
    }
    
    func getLectures(searchWord: String, page: Int) {
        getLecturesUseCase.execute(searchWord: searchWord, page: page)
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
                    self?.lectures = result
                }
            }.store(in: &cancelables)
    }
}
