//
//  CourseDetailsViewModeling.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation

protocol CourseDetailsViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError?  { get set }
    var course: CourseDetailsDTO? { get set }
    
    func getCourseDetails(id: Int)
}
