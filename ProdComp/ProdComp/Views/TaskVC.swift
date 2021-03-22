//
//  TaskVC.swift
//  ProdComp
//
//  Created by apple on 3/16/21.
//

import SwiftUI

class TaskView: UIViewController {
  
  
  struct TaskView: View {
    
    let data = (1...10).map { "Item \($0)" }
    
    let columns = [
      GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View{
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(data, id: \.self) { item in
            Text(item)
          }
        }
        .padding(.horizontal)
      }
      .frame(maxHeight: 300)
    }
  }
}

