//
//  ContentView.swift
//  CW-12
//
//  Created by Ahmed Alkhuder on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var age = ""
    @State var phone = ""
    @State var isSecondPageShown = false
    
    var body: some View {
        VStack
        {
            Text("مرحباً بك في الكويت تبرمج")
                .padding(.bottom, 50)
                .foregroundColor(.blue)
                .font(.title)
            Button(action: {
                isSecondPageShown = true /*isSecondPageShown.toggle() works too
                                        but it's used more for switch like buttons ( false <==> true )*/
            }, label: {
                Text("ادخل بياناتك")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }).sheet(isPresented: $isSecondPageShown, content: {
                SecondPage(name: $name, age: $age, phone: $phone)
            })
            if name != ""
            {
                HStack
                {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10)
                    {
                        Text("الاسم : \(name)")
                        Text("العمر : \(age)")
                        Text("الهاتف : \(phone)")
                    }.font(.title)
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
