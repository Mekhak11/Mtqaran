//
//  RoundedProgressBar.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 03.09.24.
//

import SwiftUI

struct RoundedProgressBar: View {
    var percentage: Double

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(min(percentage / 100, 1)))
                .stroke(AppColors.Primary.Orange, lineWidth: 2)
                .rotationEffect(.degrees(-90))

            Circle()
                .trim(from: CGFloat(min(percentage / 100, 1)), to: 1)
                .stroke(AppColors.Secondary.lightGrey, lineWidth: 2)
                .rotationEffect(.degrees(-90))

            Text("\(Int(percentage))%")
                .font(AppFonts.Normal.xSmall)
                .foregroundColor(Color.gray)
        }
    }
}

#Preview {
    RoundedProgressBar(percentage: 20.0)
}
