//
//  CatalogViewModeling.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation

protocol CatalogViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var catalogItems: CatalogDTO { get set }
    
    func getCatalog()

}
