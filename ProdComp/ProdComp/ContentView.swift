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
  
  @EnvironmentObject var userData: userData
  
  var body: some View {
    Text("Productify")
      .fontWeight(.bold)
    NavigationView{
      ZStack{
        VStack{
          HStack{
            Text("what is your name")
              .frame(minWidth: 120)
            TextField("name", text: self.$userData.name)
              .frame(maxWidth: 140)
          }
          .frame(maxHeight: .infinity, alignment: .center)
          HStack{
            Text("add your friends name")
              .frame(minWidth: 120)
            TextField("name", text: self.$userData.friend)
              .frame(maxWidth: 140)
          }
          .frame(maxHeight: .infinity, alignment: .center)
      }
        HStack{
          VStack{
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
              //action to move to next view
              LoginView.LoginView()
            }
          }
        }
      }
      .edgesIgnoringSafeArea(.all)

      

      
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
