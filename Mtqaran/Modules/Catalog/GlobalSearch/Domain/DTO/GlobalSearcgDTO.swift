//
//  GlobalSearcgDTO.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import Foundation

struct GlobalSearcgDTO: Decodable{
    let users: [UserDTO]?
    let teachers: [LecturerDTO]?
    let courses: [CourseDTO]?
    let lessons: [LectureDTO]?
}

// MARK: - Lesson
struct LectureDTO: Decodable {
    let id: Int?
    let name, desc: String?
    let image: String?
    let voice: String?
    let voice_duration, course: String?
    let save: Int?
}

// MARK: - Teacher
struct LecturerDTO: Decodable {
    let id: Int?
    let name, desc: String?
    let image: String?
    let professions: String?
    let fav: Int?
}

// MARK: - User
struct UserDTO: Decodable {
    let id: Int?
    let firstname, lastname: String?
    let username: String?
    let image: String?
}
