//
//  RequestServiceError.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation

struct RequestServiceError: LocalizedError, Codable, Error {
    let message: String
    var path: [String]?
    var httpStatus: String?

    var statusCode: Int?

    var errorDescription: String? { message }
    var localizedDescription: String { message }
    var failureReason: String? { message }
    var recoverySuggestion: String? { message }
    var helpAnchor: String? { message }
    
    private enum CodingKeys : String, CodingKey {
        case message
    }
    
    init(message: String, httpStatus: String) {
        self.message = message
        self.httpStatus = httpStatus
    }
}
