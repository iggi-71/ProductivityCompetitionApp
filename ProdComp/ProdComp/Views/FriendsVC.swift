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
        
        var body: some View{
            VStack{
                HStack{
                    Spacer()
                    Spacer()
                    Text("Friends Screen")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    VStack{
                        Text("Points")
                        Text(String(format: "%02d", userData.coins))
                    }
                }
                ZStack{
                    Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
                    HStack{
                        Image("profile_picture")
                        VStack{
                            Text("Hello")
                            Text("Hello")
                            Text("Hello")
                    }
                    
                    }
                }
            }
        }
    }
}
