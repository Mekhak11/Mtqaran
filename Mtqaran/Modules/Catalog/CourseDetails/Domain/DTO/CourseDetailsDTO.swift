//
//  CourseDetailsDTO.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation

struct CourseDetailsDTO: Decodable {
    let id: Int?
    let name, desc: String?
    let image: String?
    let lessons_count: Int?
    let lessons: [LectureDTO]?
    let teacher: LecturerDTO?
    let category: CategoryDTO?
    let save, like, dislike, percent: Int?
    let code: String?
    let errorCode: Int?
}

