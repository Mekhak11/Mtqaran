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
        static let baseUrl: URL = URL(string: "https://admin.mtqaran.am/arm/app/")!
        static let apiQueue: DispatchQueue = .init(label: "https://admin.mtqaran.am/arm/app/", qos: .default, attributes: .concurrent)
    }
}
