//
//  GetCourseDetailsUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation
import Combine

final class GetCourseDetailsUseCase: CatalogUseCase {
    func execute(id: Int) -> AnyPublisher<CourseDetailsDTO, Error> {
        catalogRepository.getCourseDetails(id: id)
            .eraseToAnyPublisher()
    }
}
