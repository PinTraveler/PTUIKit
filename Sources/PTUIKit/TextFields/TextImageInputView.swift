//
//  SwiftUIView.swift
//  
//
//  Created by can ersoz on 23.02.2021.
//

import SwiftUI

struct TextImageInputView: View {
    @State var imageSystemName: String
    @State var headline: String
    @State var textFieldPrompt: String
    @State var secure: Bool
    @Binding var inputText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headline)
                .font(.headline)
                .foregroundColor(Color(.darkGray))
            
            HStack {
                if secure {
                    SecureField(textFieldPrompt, text: $inputText)
                        .textContentType(.emailAddress)
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                        .font(.headline)
                }
                else {
                    TextField(textFieldPrompt, text: $inputText)
                        .textContentType(.emailAddress)
                        .padding(.top, 15)
                        .padding(.bottom, 10)
                        .font(.headline)
                }
                Image(systemName: imageSystemName).padding(.trailing)
            }
            
            Divider().background(Color.black)
        }
    }
}

struct TextImageInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextImageInputView(imageSystemName: "lock.fill", headline: "Password", textFieldPrompt: "Password", secure: true, inputText: .constant("Hey"))
    }
}
