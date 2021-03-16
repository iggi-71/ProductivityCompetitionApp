//
//  ContentView.swift
//  ProdComp
//
//  Created by apple on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    
    
    var body: some View {
        TabView{
            Text("first")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("First")
                }
            Text("Home")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("First")
                }
            Text("Second")
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Second")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
