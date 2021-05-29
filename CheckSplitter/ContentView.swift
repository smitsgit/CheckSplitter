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
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
            }
            Section {
                Text("you set amount to : \(checkAmount)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
