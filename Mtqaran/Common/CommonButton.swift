//
//  CommonButton.swift
//  Mtqaran
//
//  Created by MEKHAK GHAPANTSYAN on 09.09.24.
//

import SwiftUI

import SwiftUI

struct CommonButton: View {
    
    var type: `Type` = .primary
    var color: Color = .white
    var backgroundColor: Color? = nil
    var action: (() -> Void)? = nil
    let title: String
    @Binding var isContentValid: Bool
    @Binding var isLoading: Bool
    
    init(type: `Type` = .primary, color: Color = .white, backgroundColor: Color? = nil, action: (() -> Void)? = nil, title: String, isContentValid: Binding<Bool> = .constant(true), isLoading: Binding<Bool> = .constant(false)) {
        self.type = type
        self.color = color
        self.backgroundColor = backgroundColor
        self.action = action
        self.title = title
        self._isContentValid = isContentValid
        self._isLoading = isLoading
    }
    
    var body: some View {
        ZStack {
            switch type {
            case .primary:
                if isContentValid {
                    backgroundColor ?? AppColors.Primary.Orange
                } else {
                    AppColors.Secondary.grey
                }
            case .secondary:
                Color.clear
                    .border(color)
            }
            
            if let action = action {
                Button(action: action, label: {
                    ZStack {
                        switch type {
                        case .primary:
                            isContentValid ? backgroundColor ??
                            AppColors.Primary.Orange
                            :
                            AppColors.Secondary.grey
                        case .secondary:
                            Color.clear
                                .border(color)
                        }
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            label
                        }
                    }
                }).disabled(!isContentValid)
            } else {
                label
            }
        }.frame(height: 42).cornerRadius(16.0)
    }
    
    private var label: some View {
        Text(LocalizedStringKey(title))
            .font(AppFonts.Normal.medium)
            .foregroundColor(isContentValid ? .white : AppColors.Secondary.grey)
    }
}

extension CommonButton {
    enum `Type` {
        case primary, secondary
    }
}

#Preview {
    CommonButton(title: "Mtqaran")
}
