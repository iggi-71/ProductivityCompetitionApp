//
//  UserData.swift
//  ProdComp
//
//  Created by apple on 3/21/21.
//

import Foundation

class  userData: ObservableObject {
    @Published var coins: Int = 0
    @Published var TaskTextField: String = ""
    @Published var name: String = ""
}
