//
//  UserData.swift
//  ProdComp
//
//  Created by apple on 3/21/21.
//

import Foundation

class  userData: ObservableObject {
  @Published var coins: Int = 0
  @Published var sessionsCompleted: Int = 0
  @Published var userTime: Int = 0
  @Published var numOfTask: Int = 0
  @Published var TaskTextField: String = ""
  @Published var name: String = ""
  @Published var friend: String = ""
  
}
