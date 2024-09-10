//
//  LectureDetailsDTO.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import Foundation

struct  LectureDetailsDTO: Decodable {
    let id: Int?
    let name, desc: String?
    let image: String?
    let voice: String?
    let voice_duration: String?
    let lessons: [LectureDTO]?
    let teacher: LecturerDTO?
    let date: String?
    let files: [String]?
    let save, views, like, dislike: Int?
}
