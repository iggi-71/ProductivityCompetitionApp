//
//  FriendsView.swift
//  ProdComp
//
//  Created by apple on 3/16/21.
//

import SwiftUI

class FriendsView: UIViewController {
    
    struct FriendsView: View {
        var body: some View{
            VStack{
                Text("Friends Screen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ZStack{
                    Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)

                    List(0 ..< 5){ item in
                        Image("profile_picture")
                        VStack{
                            Text("This is the friend view")
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
    }
}
