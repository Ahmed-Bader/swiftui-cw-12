//
//  SecondPage.swift
//  CW-12
//
//  Created by Ahmed Alkhuder on 7/1/21.
//

import SwiftUI

struct SecondPage: View {
    @Binding var name : String
    @Binding var age : String
    @Binding var phone : String
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack (alignment: .center, spacing: 40)
        {
            TextField("الاسم", text: $name)
            TextField("العمر", text: $age)
            TextField("الهاتف", text: $phone)
        }.padding()
        .font(.title)
        .multilineTextAlignment(.trailing)
        
        Button(action: {
            presentation.wrappedValue.dismiss()
        }, label: {
            Text("موافق")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    }
}

//struct SecondPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondPage()
//    }
//}
