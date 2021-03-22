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
      VStack{
        HStack{
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Text("")
          Text("what is you name")
          TextField("name", text: self.$userData.name)
        }
        HStack{
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Text("")
          Text("add your friends name")
          TextField("name", text: self.$userData.friend)
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
      

      
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
