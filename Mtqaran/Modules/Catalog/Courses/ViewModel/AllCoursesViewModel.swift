//
//  AllCoursesViewModel.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class AllCoursesViewModel: ObservableObject, Identifiable {
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var courses: [CourseDTO] = []
   
    private var getCoursesUseCase: GetCoursesUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getCoursesUseCase: GetCoursesUseCase) {
        self.getCoursesUseCase = getCoursesUseCase
    }
    
    func getCourses(searchWord: String, page: Int) {
        getCoursesUseCase.execute(searchWord: searchWord, page: page)
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
                    self?.courses = result
                }
            }.store(in: &cancelables)
    }
}
