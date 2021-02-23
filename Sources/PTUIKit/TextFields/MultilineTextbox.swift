//
//  SwiftUIView.swift
//  
//
//  Created by can ersoz on 23.02.2021.
//

import SwiftUI

struct MultilineTextbox: View {
    @Binding var textInput: String
    var body: some View {
        Text(textInput.isEmpty ? "A" : textInput)
            .lineLimit(4)
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .overlay(
                TextEditor(text: $textInput)
                    .padding(.top, 2)
                    .padding(.horizontal, 12)
                    .background(
                        ZStack {
                            Color(UIColor.secondarySystemBackground)
                            HStack {
                                Text("Type a message")
                                    .foregroundColor(Color(UIColor.placeholderText))
                                    .padding(.leading, 17.5)
                                Spacer()
                            }.opacity(textInput.isEmpty ? 1.0 : 0.0)
                        }
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            )
            .font(Font.system(.body, design: .rounded))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Divider()
            HStack(alignment: .bottom) {
                MultilineTextbox(textInput: .constant(""))
                Button(action: {
                    print("hello")
                }) {
                    Image(systemName: "arrow.up")
                        .font(Font.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30, alignment: .center)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.bottom, 6)
                }
            }.padding(8)
        }
    }
}
