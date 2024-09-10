//
//  UserCell.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import SwiftUI

struct UserCell: View {
    @State var user: UserDTO
    var body: some View {
        VStack {
            RemoteImageView(urlString: user.image ?? "", width: 40, height: 40, cornerRadius: 50)
            Text(user.firstname ?? "")
                .font(AppFonts.Normal.small)
            Text(user.lastname ?? "")
                .font(AppFonts.Normal.small)
            
        }
    }
}
