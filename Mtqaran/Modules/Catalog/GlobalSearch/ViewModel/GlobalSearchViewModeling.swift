//
//  GlobalSearchViewModeling.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import Foundation

protocol GlobalSearchViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var searchResult: GlobalSearcgDTO { get set }
    
    func globalSearch(searchWord: String)
}
