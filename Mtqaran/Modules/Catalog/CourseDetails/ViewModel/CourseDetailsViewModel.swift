//
//  CourseDetailsViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation
import Combine

final class CourseDetailsViewModel: Identifiable, CourseDetailsViewModeling {
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var course: CourseDetailsDTO? = nil
   
    private var getCourseDetailsUseCase: GetCourseDetailsUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getCourseDetailsUseCase: GetCourseDetailsUseCase) {
        self.getCourseDetailsUseCase = getCourseDetailsUseCase
    }
    
    func getCourseDetails(id: Int) {
        getCourseDetailsUseCase.execute(id: id)
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
                    print(result)
                    self?.course = result
                }
            }.store(in: &cancelables)
    }
}
