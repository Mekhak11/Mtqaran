//
//  LectureDetailsViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation
import Combine

final class LectureDetailsViewModel: Identifiable, LectureDetailsViewModeling {
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var lecture: LectureDetailsDTO? = nil
   
    private var getLectureDetailsUseCase: GetLectureDetailsUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getLectureDetailsUseCase: GetLectureDetailsUseCase) {
        self.getLectureDetailsUseCase = getLectureDetailsUseCase
    }
    
    func getLectureDetails(id: Int) {
        getLectureDetailsUseCase.execute(id: id)
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
                    self?.lecture = result
                }
            }.store(in: &cancelables)
    }
}
