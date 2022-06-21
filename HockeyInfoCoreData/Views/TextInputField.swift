//
//  TextInputField.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 6/20/22.
//
import SwiftUI

//  Moves the text field placeholder value above the text field with animation
//  Usage: TextInputField(title: "First Name", text: $firstName)

struct TextInputField: View
{
    @Binding var text: String
    
    var title: String
    
    init(_ title: String, text: Binding<String>)
    {
        self.title = title
        self._text = text
    }
    
    var body: some View
    {
        withAnimation(.default)
        {
            ZStack(alignment: .leading)
            {
                Text(title + ":")
                    .foregroundColor(text.isEmpty ? .secondary : .secondary)
                    .fontWeight(.bold)
                    .offset(y: text.isEmpty ? 0 : -30)
                    .scaleEffect(text.isEmpty ? 1 : 1, anchor: .leading)
                
                TextField(title, text: $text)
            }
            .padding(.top, 15)
        }
    }
}
