//
//  TaskVC.swift
//  ProdComp
//
//  Created by apple on 3/16/21.
//

import SwiftUI

class TaskView: UIViewController {
  
  
  struct TaskView: View {
    @EnvironmentObject var userData: userData
    let data = (1...2).map { "Session \($0)" }
    
    var body: some View{
      
      //      List(0 ..< userData.coins) { item in           this is to make a new item appear after completing the timer
      List(0 ..< 1) { item in
        HStack{
          Image("profile_picture")
          VStack{
            Text("\(userData.name)")
            
            Text("You have " + String(format: "%02d", userData.coins) + " Coins")
            Text("You have completed " + String(format: "%02d", userData.sessionsCompleted) + " Sessions")
            Text("with a total of \(userData.userTime) minutes")
          }
        }
      }
      
    }
  }
}

