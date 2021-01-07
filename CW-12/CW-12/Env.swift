//
//  Env.swift
//  CW-12
//
//  Created by Ahmed Alkhuder on 7/1/21.
//

import SwiftUI

class Env : ObservableObject {
    @Published var name : String = ""
    @Published var age : String = ""
    @Published var phone : String = ""
    @Published var isSecondPageShown : Bool = false
}
// Env here in this file so that when we use this in the main file we know which object we're referring to.
