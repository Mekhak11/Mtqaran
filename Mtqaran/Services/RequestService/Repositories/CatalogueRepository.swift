//
//  CatalogRepository.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation
import Combine
import Moya

protocol CatalogRepository {
    func getCalaog() -> AnyPublisher<CatalogDTO, Error>
    func globalSearch(searchWord: String) ->AnyPublisher<GlobalSearcgDTO, Error>
    func getCourses(searchWord: String, page: Int) ->AnyPublisher<[CourseDTO], Error>
    func getLectures(searchWord: String,page: Int) ->AnyPublisher<[LectureDTO], Error>
    func getCategories(searchWord: String, page: Int) ->AnyPublisher<[CategoryDTO], Error>
    func getLecturers(searchWord: String, page: Int) ->AnyPublisher<[LecturerDTO], Error>
    func getCourseDetails(id: Int) -> AnyPublisher<CourseDetailsDTO, Error>
    func getLectureDetails(id: Int) -> AnyPublisher<LectureDetailsDTO, Error>
    
}

final class CatalogDefaultRepository: MoyaProvider<CatalogRout>, CatalogRepository, ObservableObject {
    func getCourseDetails(id: Int) -> AnyPublisher<CourseDetailsDTO, Error> {
        requestDecodable(.getCourseDetails(id: id))
    }
    
    func getLectureDetails(id: Int) -> AnyPublisher<LectureDetailsDTO, Error> {
        requestDecodable(.getLectureDetails(id: id))
    }
    
    func getCourses(searchWord: String, page: Int) -> AnyPublisher<[CourseDTO], Error> {
        requestDecodable(.getCourses(search: searchWord, page: page))
    }
    
    func getLectures(searchWord: String, page: Int) -> AnyPublisher<[LectureDTO], Error> {
        requestDecodable(.getLectures(search: searchWord, page: page))
    }
    
    func getCategories(searchWord: String, page: Int) -> AnyPublisher<[CategoryDTO], Error> {
        requestDecodable(.getCategories(search: searchWord, page: page))
    }
    
    func getLecturers(searchWord: String, page: Int) -> AnyPublisher<[LecturerDTO], Error> {
        requestDecodable(.getLecturers(search: searchWord, page: page))
    }
    
    func getCalaog() -> AnyPublisher<CatalogDTO, Error> {
        requestDecodable(.getCatalog)
    }
    
    func globalSearch(searchWord: String) -> AnyPublisher<GlobalSearcgDTO, Error> {
        requestDecodable(.globalSearch(search: searchWord))
    }
    
}
