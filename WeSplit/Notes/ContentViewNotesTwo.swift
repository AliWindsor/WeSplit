//
//  ContentViewNotesTwo.swift
//  WeSplit
//
//  Created by Alicia Windsor on 18/05/2021.
//

import SwiftUI

struct ContentViewNotesTwo: View {
    
    let students = ["Harry", "Hermione","Ron","Alicia"] //constant no changing
    @State private var currentStudent = 0 //can change
    var pickerTitle = "Choose your student"
    
    var body: some View {
        VStack{
            Text("You picked \(students[currentStudent])")
        
            //label for accessibility, double biunding to currentStudent
            Picker("Choose your student", selection: $currentStudent){
                ForEach(0 ..< students.count) { student in
                    Text("\(students[student])")
                }
            }
        //end of vstack
        }
        
    }
}

struct ContentViewNotesTwo_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNotesTwo()
    }
}
