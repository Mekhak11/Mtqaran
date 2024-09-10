//
//  GetLectureDetailsUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation
import Combine

final class GetLectureDetailsUseCase: CatalogUseCase {
    func execute(id: Int) -> AnyPublisher<LectureDetailsDTO, Error> {
        catalogRepository.getLectureDetails(id: id)
            .eraseToAnyPublisher()
    }
}
