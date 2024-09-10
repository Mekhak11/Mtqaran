//
//  CommonSearchBar.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import SwiftUI

struct CommonSearchBar: View {
    
    @Binding  var searchText: String
    @State var disabled: Bool = false

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $searchText)
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .disabled(disabled)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.black, lineWidth: 1))

        
    }
}

#Preview {
    CommonSearchBar(searchText: .constant(""))
}
