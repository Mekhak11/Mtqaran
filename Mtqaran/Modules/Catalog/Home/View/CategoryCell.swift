//
//  CategoryCell.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 02.09.24.
//

import SwiftUI

struct CategoryCell: View {
    
    @State var isFilled: Bool
    var model: CategoryDTO
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                if (model.id ?? 0) % 2 == 0 {
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 66, height: 66)
                        .foregroundStyle(AppColors.Primary.Orange)
                } else {
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(AppColors.Primary.Orange, lineWidth: 1)
                        .frame(width: 66, height: 66)
                        .background(.clear)
                }
                image
                
            }.padding()
            desc
        }
    }
}

extension CategoryCell {
    private var image: some View {
        RemoteImageView(urlString: model.image ?? "", width: 66, height: 66, cornerRadius: 7)
            .scaledToFit()
            .offset(x: 6, y: 6)
    }
    
    private var desc: some View {
        Text(model.name ?? "")
            .foregroundStyle(.black)
            .font(AppFonts.Normal.small)
    }
}

#Preview {
    CategoryCell(isFilled: true, model: CategoryDTO(id: 0, name: "", image: ""))
}
