//
//  CatalogRout.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation

import Foundation
import Moya

enum CatalogRout: TargetType {
    case getCatalog
    case globalSearch(search: String)
    
    case getLecturers(search: String, page: Int)
    case getLectures(search: String, page: Int)
    case getCategories(search: String, page: Int)
    case getCourses(search: String, page: Int)
    
    case getCourseDetails(id: Int)
    case getLectureDetails(id: Int)
  
    
    var baseURL: URL {
        return RequestDomain.Mtqaran.baseUrl
    }
    
    var path: String {
        switch self {
        case .getCatalog:
            return "homePage"
        case .globalSearch:
            return "search"
        case .getLecturers:
            return "teachers"
        case .getLectures:
            return "lessons"
        case .getCategories:
            return "categories"
        case .getCourses:
            return "courses"
        case .getCourseDetails:
            return "courseItem"
        case .getLectureDetails:
            return "lessonItem"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCatalog:
            return .get
        case .globalSearch:
            return .post
        case .getLecturers:
            return .post
        case .getLectures:
            return .post
        case .getCategories:
            return .post
        case .getCourses:
            return .post
        case .getCourseDetails:
            return .post
        case .getLectureDetails:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getCatalog:
            return .requestPlain
        case .globalSearch(let search):
            let params = [
                "search" : search
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getLecturers(search: let search, page: let page):
            let params: [String : Any] = [
                "search" : search,
                "page" : page
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getLectures(search: let search, page: let page):
            let params: [String : Any] = [
                "search" : search,
                "page" : page
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getCategories(search: let search, page: let page):
            let params: [String : Any] = [
                "search" : search,
                "page" : page
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getCourses(search: let search, page: let page):
            let params: [String : Any] = [
                "search" : search,
                "page" : page
            ]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .getCourseDetails(id: let id):
            let params:[String: Any] = [
                "itemID" : id
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.httpBody)
        case .getLectureDetails(id: let id):
            let params:[String: Any] = [
                "itemID" : id
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
//        var token:TokenDto? = UserDefaultsService().getObject(forKey: .User.token)
        return [
//            "Content-Type": "application/json",
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
//            "Authorization": "Bearer \(token?.token ?? "")",
        ]
    }

    
    
}
