//
//  GetLecturesUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class GetLecturesUseCase: CatalogUseCase {
    func execute(searchWord: String, page: Int) -> AnyPublisher<[LectureDTO], Error> {
        catalogRepository.getLectures(searchWord: searchWord, page: page)
            .eraseToAnyPublisher()
    }
}
