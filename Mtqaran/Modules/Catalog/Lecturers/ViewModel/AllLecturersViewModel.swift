//
//  AllLecturersViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class AllLecturersViewModel: ObservableObject, Identifiable {
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var lecturers: [LecturerDTO] = []
   
    private var getLectureresUseCase: GetLecturersUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getLectureresUseCase: GetLecturersUseCase) {
        self.getLectureresUseCase = getLectureresUseCase
    }
    
    func getLecturers(searchWord: String, page: Int) {
        getLectureresUseCase.execute(searchWord: searchWord, page: page)
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
                    self?.lecturers = result
                }
            }.store(in: &cancelables)
    }
}
