//
//  SwiftUIView.swift
//  
//
//  Created by can ersoz on 23.02.2021.
//

import SwiftUI

public struct TextImageInputView: View {
    @Binding var inputText: String
    
    let image: Image?
    let headline: String
    let textFieldPrompt: String
    let secure: Bool
    let inputType: UITextContentType?
    let color: Color
    let textColor: Color
    let headlineColor: Color
    
    init(headline: String, textFieldPrompt: String, inputText: Binding<String>, image: Image? = nil, inputType: UITextContentType? = nil, secure: Bool = false, color: Color = .black, textColor: Color = .black, headlineColor: Color = .gray) {
        self.image = image
        self.headline = headline
        self.textFieldPrompt = textFieldPrompt
        self._inputText = inputText
        self.inputType = inputType
        self.secure = secure
        self.color = color
        self.textColor = textColor
        self.headlineColor = headlineColor
    }
    
    @ViewBuilder
    var field: some View {
        if secure {
            SecureField(textFieldPrompt, text: $inputText)
        }
        else {
            TextField(textFieldPrompt, text: $inputText)
        }
    }
    
    @ViewBuilder
    var contentTypedField: some View {
        if let t = inputType { field.textContentType(t) }
        else { field }
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(headline)
                .font(.headline)
                .foregroundColor(headlineColor)
            HStack {
                contentTypedField
                    .foregroundColor(textColor)
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    .font(.headline)
                if let image = image {
                    image
                        .renderingMode(.template)
                        .foregroundColor(color)
                        .padding(.trailing)
                }
            }.padding(0)
            
            Divider().background(color)
        }
    }
}

struct TextImageInputView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TextImageInputView(headline: "Password", textFieldPrompt: "Password", inputText: .constant("Hegdfhjy"), image: Image(systemName: "lock.fill"), inputType: .password, secure: false, color: .blue, textColor: .green, headlineColor: .pink)
            TextImageInputView(headline: "Password", textFieldPrompt: "Password", inputText: .constant("Hey"))
        }
    }
}
