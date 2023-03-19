//
//  Calculator2.swift
//  NMR App
//
//  Created by Zohaib Suhail on 3/19/23.
//

import SwiftUI

struct Calculator2: View {
    @State private var a: String = ""
    @State private var b: String = ""
    @State private var c: String = ""
    @State private var c1: String = ""
    @State private var c2: String = ""
    @State private var c3: String = ""
    @State private var d: String = ""
    @State private var d1: String = ""
    @State private var d2: String = ""
    @State private var d3: String = ""
    @State private var e: String = ""
    @State private var e1: String = ""
    @State private var e2: String = ""
    @State private var e3: String = ""
    @State private var f: String = ""
    @State private var f1: String = ""
    @State private var f2: String = ""
    @State private var f3: String = ""
    @State private var g: String = ""
    @State private var g1: String = ""
    @State private var g2: String = ""
    @State private var g3: String = ""
    @State private var h: String = ""
    @State private var showingResult = false
    
    var body: some View {
        VStack {
            HStack {
                Text("")
                TextField("Reactor Volume (L) [0.13L]", text: $h)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("Pressure (psi)", text: $a)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("Temperature (C)", text: $b)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("H2%", text: $c)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("CO%", text: $d)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("CO2%", text: $e)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("CH4%", text: $f)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            HStack {
                Text("")
                TextField("C2H6%", text: $g)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.padding()
            
            Button("Calculate") {
                let aValue = Double(a) ?? 0
                let bValue = Double(b) ?? 0
                let cValue = Double(c) ?? 0
                let dValue = Double(d) ?? 0
                let eValue = Double(e) ?? 0
                let fValue = Double(f) ?? 0
                let gValue = Double(g) ?? 0
                let hValue = Double(h) ?? 0
               
                let tm = aValue * (hValue/14.696) * 1000 / (0.08205736608096 * (273.15 + bValue))
                let c1 = cValue * 0.0829
                let d1 = dValue * 1.1032
                let e1 = eValue * 1.036406
                let f1 = fValue * 0.31949
                let g1 = gValue * 0.30931
                let rec = 100/(c1 + d1 + e1 + f1 + g1)
                
                let c2 = rec * c1
                let d2 = rec * d1
                let e2 = rec * e1
                let f2 = rec * f1
                let g2 = rec * g1
                
                c3 = String(format: "%.2f",tm * c2/100)
                d3 = String(format: "%.2f",tm * d2/100)
                e3 = String(format: "%.2f",tm * e2/100)
                f3 = String(format: "%.2f",tm * f2/100)
                g3 = String(format: "%.2f",tm * g2/100)
                
                
                showingResult = true
            }
        }
        .alert(isPresented: $showingResult) {
                    Alert(title: Text("GC Results (mmol)"), message: Text("H2: \(c3)\nCO: \(d3)\nCO2: \(e3)\nCH4: \(f3)\nC2H6: \(g3)"))
        }
        .navigationBarTitle("GC")
    }
}

struct Calculator2_Previews: PreviewProvider {
    static var previews: some View {
        Calculator2()
    }
}
