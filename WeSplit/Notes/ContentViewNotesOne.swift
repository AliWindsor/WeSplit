//
//  ContentViewNotesOne.swift
//  WeSplit
//
//  Created by Alicia Windsor on 18/05/2021.
//

import SwiftUI

struct ContentViewNotesOne: View {
    
    @State private var tapCount = 0 //state allows you to make a mutable variable. Private allows var to be accessed in one view only.
    @State private var name = ""
    
    var body: some View {
        
        NavigationView{ //stops items from scrolling into the clock
            Form{ //can only add 10 things, more than 10 requires Group{}, use Section{} for visual change, group does not visually change it
                
                Section{
                    TextField("Enter Your Name", text: $name) //$ representds 2 way binding, ie read and write with user input
                    Text("Your Name is \(name)")
                }
                
                Section{
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1 //2 way binding not needed cuz of self.var
                    }
                }
            }
            .navigationBarTitle("Swift UI", displayMode: .inline) //define this inside navView
        }
        
    }
}

struct ContentViewNotesOne_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNotesOne()
    }
}
