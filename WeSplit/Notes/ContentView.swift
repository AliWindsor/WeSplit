//
//  ContentView.swift
//  WeSplit, bill splitting app
//
//  Created by Alicia Windsor on 18/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billTotal = "" //SwiftUI MUST use String to store textField values
    @State private var numPeople = 2
    @State private var tipPercent = 2 //pos in tip amounts array
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalSplit: Double{
        let peopleCount = Double(numPeople + 2)
        let tipSelection = Double(tipAmounts[tipPercent])
        //converting string to number will return an optional as swift can't be sure the string contains a num. if it does, return num, else return 0.
        let billAmount = Double(billTotal) ?? 0
        let tipVal = (billAmount / 100) * tipSelection
        let total = billAmount + tipVal
    
        return total / peopleCount
    }
    
    var body: some View {
        NavigationView{//declarative ui
            Form {
                Section (header: Text("Bill")){
                    
                    HStack{
                        Text("Bill Total").bold()
                        Divider()
                        
                        TextField("0.00", text: $billTotal)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                    }
                    
                    HStack {
                        Text("Number Of People").bold()
                        Divider()
             
                        Picker("", selection: $numPeople){
                            ForEach(2 ..< 100){ people in
                                Text("\(people) people")
                            }
                        }
                    }
                    
                }
                
                Section (header: Text("Tip Percentage")) {
                    
                    HStack {
                        Text("Tip").bold()
                        Divider()
             
                        Picker("Tip Percent", selection: $tipPercent) {
                            ForEach(0 ..< tipAmounts.count) { tip in
                                Text("\(self.tipAmounts[tip])%")
                            }
                        }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section (header: Text("Total Per Person")){
                    Text("£\(totalSplit, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
       
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
