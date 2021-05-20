//
//  ContentView.swift
//  WeSplit, bill splitting app
//
//  Created by Alicia Windsor on 18/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billTotal = "" //SwiftUI MUST use String to store textField values
    @State private var numPeople = ""
    @State private var tipPercent = 2 //pos in tip amounts array
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalSplit: Double{
        let peopleCount = Double(numPeople) ?? 0
        let tipSelection = Double(tipAmounts[tipPercent])
        //converting string to number will return an optional as swift can't be sure the string contains a num. if it does, return num, else return 0.
        let billAmount = Double(billTotal) ?? 0
        let tipVal = (billAmount / 100) * tipSelection
        let total = billAmount + tipVal
    
        return total / peopleCount
    }
    
    var totalSplitNoTip: Double{
        let peopleCount = Double(numPeople) ?? 0
        let billAmount = Double(billTotal) ?? 0

        return billAmount / peopleCount
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
                        
                        TextField("1", text: $numPeople)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                        
                        /*
                        Picker("", selection: $numPeople){
                            ForEach(2 ..< 100){ people in
                                Text("\(people) people")
                            }
                        }*/
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
                    HStack {
                        Text("Without Tip").bold()
                        Divider()
                        
                        Spacer()
 
                        if totalSplit > 0{
                            Text("£\(totalSplit, specifier: "%.2f")")
                        }else{
                            Text("0.00")
                                .foregroundColor(.gray)
                                .opacity(0.6)
                        }
                    }
                    
                    HStack {
                        Text("With Tip").bold()
                        Divider()
                        
                        Spacer()
                        
                        if totalSplit > 0{
                            Text("£\(totalSplitNoTip, specifier: "%.2f")")
                        }else{
                            Text("0.00")
                                .foregroundColor(.gray)
                                .opacity(0.6)
                        }
                    }
                    
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
