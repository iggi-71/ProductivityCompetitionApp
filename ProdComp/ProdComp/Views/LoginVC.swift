//
//  LoginVC.swift
//  ProdComp
//
//  Created by apple on 3/20/21.
//

import SwiftUI

class LoginView: UIViewController {
  
  struct LoginView: View {
    var body: some View{
      VStack{
        Text("Login")
        Text("Test")
        NavigationLink(
          destination: ContentView(),
          label: {
            /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
          })
        
      }
    }
  }
}
