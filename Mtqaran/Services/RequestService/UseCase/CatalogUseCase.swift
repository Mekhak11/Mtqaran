//
//  CatalogUseCase.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation

class CatalogUseCase {
    let catalogRepository: CatalogRepository
    
    init(catalogRepository: CatalogRepository) {
        self.catalogRepository = catalogRepository
    }
}
