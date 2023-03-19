//
//  ContentView.swift
//  NMR App
//
//  Created by Zohaib Suhail on 3/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var a: String = ""
    @State var b: String = ""
    @State var c: String = ""
    @State var d: String = ""
    @State var result: String = ""
    @State private var savedResults: [(name: String, result: Double)] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("")
                TextField("Sample volume (mL)", text: $a)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("Aliquot (mL)", text: $b)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("Imidazole Mass (mg)", text: $c)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            HStack {
                Text("")
                TextField("Methanol Integration", text: $d)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            Button("Calculate") {
                let aValue = Double(a) ?? 0
                let bValue = Double(b) ?? 0
                let cValue = Double(c) ?? 0
                let dValue = Double(d) ?? 0
                
                let resultValue =  2.0 * cValue * dValue * aValue / (3.0 * 68.08 * bValue)
                
                result = String(format: "%.2f",resultValue)
            }
            
            Text("CH₃OH mmol Produced: \(result)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
