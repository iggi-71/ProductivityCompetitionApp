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
    UITabBar.appearance().barTintColor = UIColor.white
  }
  
  var body: some View {
    NavigationView{
      NavigationLink(destination:
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
      ) {
        Text("Hello worldssss")
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
