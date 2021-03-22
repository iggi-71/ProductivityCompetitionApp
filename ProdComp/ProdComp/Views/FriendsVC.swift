//
//  FriendsView.swift
//  ProdComp
//
//  Created by apple on 3/16/21.
//

import SwiftUI
import UserNotifications

class FriendsView: UIViewController {
  
  struct FriendsView: View {
    
    @EnvironmentObject var userData: userData

    let friendTime = Int.random(in: 0..<99)
    let botTime = Int.random(in: 0..<99)

    
    var body: some View{
      VStack{
        Text("You")
          .font(.subheadline)
          .fontWeight(.bold)
        List(0 ..< 1) { item in
          HStack{
            Image("profile_picture")
            VStack{
              Text("\(userData.name)")
              Text("Has been " + String(format: "%02d", userData.userTime) + " minutes productive today")
                .font(.subheadline)
            }
          }
        }
        Text("Friends")
          .font(.subheadline)
          .fontWeight(.bold)
        List(0 ..< 1) { item in
          VStack{
            HStack{
              Image("profile_picture")
              VStack{
                Text("\(userData.friend)")
                Text("Has been " + String(format: "%02d", friendTime) + " minutes productive today")
                  .font(.subheadline)
              }
            }
            HStack{
              Image("profile_picture")
              VStack{
                Text("Jimmy (Bot)")
                Text("Has been " + String(format: "%02d", botTime) + " minutes productive today")
                  .font(.subheadline)
              }
            }
          }
        }
      }
    }
  }
}
