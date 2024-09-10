//
//  GlobalSearchUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import Foundation
import Combine

final class GlobalSearchUseCase: CatalogUseCase {
    func execute(searchWord: String) -> AnyPublisher<GlobalSearcgDTO, Error> {
        catalogRepository.globalSearch(searchWord: searchWord)
            .eraseToAnyPublisher()
    }
}
