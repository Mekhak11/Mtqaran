//
//  GetLecturersUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class GetLecturersUseCase: CatalogUseCase {
    func execute(searchWord: String, page: Int) -> AnyPublisher<[LecturerDTO], Error> {
        catalogRepository.getLecturers(searchWord: searchWord, page: page)
            .eraseToAnyPublisher()
    }
}
