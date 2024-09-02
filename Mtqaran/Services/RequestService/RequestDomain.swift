//
//  RequestDomain.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import Foundation

import Foundation

enum RequestDomain {
    
    enum Mtqaran {
        static let baseUrl: URL = URL(string: "")!
        static let apiQueue: DispatchQueue = .init(label: "", qos: .default, attributes: .concurrent)
    }
}
