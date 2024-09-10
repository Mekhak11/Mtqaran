//
//  GetCoursesUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class GetCoursesUseCase: CatalogUseCase {
    func execute(searchWord: String, page: Int) -> AnyPublisher<[CourseDTO], Error> {
        catalogRepository.getCourses(searchWord: searchWord, page: page)
            .eraseToAnyPublisher()
    }
}
