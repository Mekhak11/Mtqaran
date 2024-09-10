////
////  CommonPickerView.swift
////  Mtqaran
////
////  Created by MEKHAK GHAPANTSYAN on 09.09.24.
////
//
//import SwiftUI
//
//struct CommonPickerView<M: Optionable>: View {
//    let options: [M]
//    @Binding var selectedOption: M
//
//    var body: some View {
//        HStack {
//            ForEach(options, id: \.id) { option in
//                Button(action: {
//                    self.selectedOption = option
//                }) {
//                        ZStack {
//                            Text(option.title)
//                                .font(AppFonts.Normal.boldMedium)
//                                .foregroundStyle(.black)
//                                .padding(4)
//                        }
//                        .background(self.selectedOption == option ? Color.white : Color.clear)
//                        .cornerRadius(8)
//                            
//                    
//                        
//                }
//                .frame(maxWidth: .infinity)
//                .background(self.selectedOption == option ? Color.white : AppColors.Primary.Orange)
//            }
//        }
//        .padding()
//        .background(AppColors.Primary.Orange)
//        .cornerRadius(10)
//    }
//}
////
////#Preview {
////    CommonPickerView(options: [], selectedOption: .constant(""))
////}
//
//protocol Optionable {
//    var id: Int { get set }
//    var title: String { get set }
//}
