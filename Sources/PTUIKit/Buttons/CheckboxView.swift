//
//  SwiftUIView.swift
//  
//
//  Created by can ersoz on 23.02.2021.
//

import SwiftUI

struct CheckboxView<T: Equatable>: View {
    @Binding var state: T
    @State var desired: T
    @State var text: String
    var onChange: ((Bool) -> Void)? = nil
    var body: some View {
        Button(action:{
            state = desired
            onChange?(state == desired)
        }) {
            HStack {
                Text(text)
                Spacer()
                if state == desired {
                    Image(systemName: "checkmark.circle.fill").resizable().foregroundColor(Color.blue).frame(width: 22, height: 22)
                }
                else {
                    Circle().stroke(Color.blue).frame(width: 22, height: 22)
                }
            }.contentShape(Rectangle())
        }.buttonStyle(PlainButtonStyle())
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView(state: .constant(false), desired: true, text: "You wanta some potatoo")
    }
}
