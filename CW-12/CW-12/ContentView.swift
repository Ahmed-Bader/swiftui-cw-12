//
//  ContentView.swift
//  CW-12
//
//  Created by Ahmed Alkhuder on 7/1/21.
// sheets and using environment objects

import SwiftUI

struct ContentView: View {
    /* @State var name = ""
    @State var age = ""
    @State var phone = ""
    @State var isSecondPageShown = false
     we swapped those for the new observable environment object check files*/
    
    var body: some View {
            MainView()
                .environmentObject(Env())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 when dealing with local stuff or Structs == @State and @Binding works well and the recommended standard way
 
 if we have databases and other remote stuff
 it is recomended to use class + @environmentObject + ObeservedObject + mainview() wih object modifier injector.
 */

struct MainView: View {
    @EnvironmentObject var env : Env //this Env should == class we defined not the name of the file
    // var (name we choose) : (class of file we made which is called Env
    var body: some View {
        VStack
        {
            Text("مرحباً بك في الكويت تبرمج")
                .padding(.bottom, 50)
                .foregroundColor(.blue)
                .font(.title)
            Button(action: {
                env.isSecondPageShown = true /*isSecondPageShown.toggle() works too
                 but it's used more for switch like buttons ( false <==> true )*/
            }, label: {
                Text("ادخل بياناتك")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }).sheet(isPresented: $env.isSecondPageShown, content: {
                SecondPage(env: self.env)
            })
            if env.name != ""
            {
                HStack
                {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10)
                    {
                        Text("الاسم : \(env.name)")
                        Text("العمر : \(env.age)")
                        Text("الهاتف : \(env.phone)")
                    }.font(.title)
                    .padding()
                }
            }
        }
    }
}
