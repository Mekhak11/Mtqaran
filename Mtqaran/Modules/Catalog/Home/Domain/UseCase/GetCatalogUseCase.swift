//
//  GetCatalogUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation
import Combine

final class GetCatalogUseCase: CatalogUseCase {
    func execute() -> AnyPublisher<CatalogDTO, Error> {
        catalogRepository.getCalaog()
            .eraseToAnyPublisher()
    }
}
