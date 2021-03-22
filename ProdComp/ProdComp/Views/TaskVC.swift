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
        
        var body: some View{
            NavigationView{
                ZStack{
                    TextField("name", text: self.$userData.name)
                }
            }
        }
    }
}
