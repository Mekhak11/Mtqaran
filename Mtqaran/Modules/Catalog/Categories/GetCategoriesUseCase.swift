//
//  GetCategoriesUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 06.09.24.
//

import Foundation
import Combine

final class GetCategoriesUseCase: CatalogUseCase {
    func execute(searchWord: String, page: Int) -> AnyPublisher<[CategoryDTO], Error> {
        catalogRepository.getCategories(searchWord: searchWord, page: page)
            .eraseToAnyPublisher()
    }
}
