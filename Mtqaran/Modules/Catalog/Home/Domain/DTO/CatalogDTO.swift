//
//  CatalogDTO.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation

import Foundation

// MARK: - CategoryDTO
struct CatalogDTO: Decodable {
    let categories: [CategoryDTO]?
    let courses: [CourseDTO]?
}

// MARK: - Category
struct CategoryDTO: Decodable, Identifiable {
    let id: Int?
    let name: String?
    let image: String?
}

// MARK: - Course
struct CourseDTO: Decodable, Identifiable {
    let id: Int?
    let name, desc: String?
    let image: String?
    let lessonsCount: String?
    let save, percent: Int?
}
