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
          .shadow(radius: 6)
          .padding(.vertical)
          .frame(width: (UIScreen.main.bounds.width / 2) - 55)
          .background(
            Capsule()
              .stroke(Color.blue, lineWidth: 2))
      }
    }
  }
}
