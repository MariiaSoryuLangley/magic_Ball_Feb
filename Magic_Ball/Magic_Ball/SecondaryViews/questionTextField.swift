//
//  questionTextField.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI

struct questionTextField: View {
    
    let isPaddingEnabled: Bool
    @Binding var textFieldInput: String
    var navigationText: String
    
    var body: some View {
        
        VStack{
            
            ZStack(alignment: .leading) {

            if textFieldInput == "" {
                Text(navigationText)
                    .font(.custom("Inter-Regular", size: 12))
                    .foregroundColor(.gray)
                    .allowsHitTesting(false)
                    .padding(.leading, 10)
                
            }
            
            TextField("", text: $textFieldInput)
                .foregroundColor(Color.black)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(5)
                .colorMultiply(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray, lineWidth: 1)
                        .opacity(0.4)
                        .background(Color.white)
                )
            
        }
        }
        .padding(.horizontal, isPaddingEnabled ? 20 : 0)
        .padding(.vertical, isPaddingEnabled ? 20 : 0)
        
    }
}


