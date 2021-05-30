//
//  ContentView.swift
//  CheckSplitter
//
//  Created by Smital on 29/05/21.
//  Copyright © 2021 IoSmit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amtPerPerson = grandTotal / peopleCount
        return amtPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { element in
                            Text("\(element) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) { element in
                          Text("\(self.tipPercentages[element]) %")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }

            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
