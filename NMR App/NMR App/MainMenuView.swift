//
//  MainMenuView.swift
//  NMR App
//
//  Created by Zohaib Suhail on 3/19/23.
//

import SwiftUI

struct MainMenuView: View {
   var body: some View {
      NavigationView {
         VStack {
             NavigationLink(destination: ContentView()) {
                 Text("Imidizole NMR").padding()
             }
             NavigationLink(destination: Calculator2()) {
                 Text("GC").padding()
            }
         }
         .navigationBarTitle("Select Calculator", displayMode: .inline)
      }
   }
}
struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
