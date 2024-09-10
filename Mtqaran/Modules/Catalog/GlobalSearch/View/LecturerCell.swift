//
//  LecturerCell.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import SwiftUI

struct LecturerCell: View {
    @State var lecturer: LecturerDTO
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .center, spacing: 6) {
                RemoteImageView(urlString: lecturer.image ?? "", width: 110, height: 94, cornerRadius: 8)
                VStack(alignment: .center, spacing: 2) {
                    Text(lecturer.name ?? "")
                        .font(AppFonts.Normal.boldSmall)
                    Text(lecturer.professions ?? "")
                        .font(AppFonts.Normal.lightXSmall)
                }
            }.padding(6)
        }.cornerRadius(8)
    }
}
