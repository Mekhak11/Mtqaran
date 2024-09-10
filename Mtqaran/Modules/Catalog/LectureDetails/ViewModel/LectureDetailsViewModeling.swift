//
//  LectureDetailsViewModeling.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation

protocol LectureDetailsViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var lecture: LectureDetailsDTO? { get set }
     
    func getLectureDetails(id: Int)
}
