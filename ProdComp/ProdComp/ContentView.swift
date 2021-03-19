//
//  ContentView.swift
//  ProdComp
//
//  Created by apple on 3/15/21.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .black
    }
    

    var body: some View {
        TabView{
            HomeView.HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            FriendsView.FriendsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Friends")
                }
            TaskView.TaskView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Task")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
