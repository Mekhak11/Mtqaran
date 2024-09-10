//
//  URLImage.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import SwiftUI

struct RemoteImageView: View {
    
    var urlString: String
    var width: Int = 128
    var height: Int = 128
    var cornerRadius: Int = 25
    
    init(urlString: String, width: Int, height: Int, cornerRadius: Int) {
        self.urlString = urlString
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
        } placeholder: {
            Color.clear
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
        .clipShape(.rect(cornerRadius: CGFloat(cornerRadius) ))
    }
}
