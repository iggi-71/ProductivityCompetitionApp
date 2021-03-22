//
//  TaskVC.swift
//  ProdComp
//
//  Created by apple on 3/16/21.
//

import SwiftUI

class TaskView: UIViewController {
  
  
  struct TaskView: View {
    
    var body: some View{
      
      let FaceUp: Bool = true
      
      VStack(content: {
          ForEach(0..<3, content: { index in
              HStack(content: {
                  ForEach(0..<3, content: { index in
                      ZStack(content: {
                          if FaceUp{
                              RoundedRectangle(cornerRadius: 50)
                              Text("👻")
                          }
                          else {
                              RoundedRectangle(cornerRadius: 50)
                          }
                      })
                  })
              })
          })
      })
      .foregroundColor(.white)
      .padding()
      .frame(width: 400, height: 400, alignment: .center)
      .clipShape(Capsule())
      
//      HStack{
//        VStack{
//          Circle()
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .square))
//            .frame(width: 100, height: 100)
//          Circle()
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .square))
//            .frame(width: 100, height: 100)
//        }
//        VStack{
//          Circle()
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .square))
//            .frame(width: 100, height: 100)
//          Circle()
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .square))
//            .frame(width: 100, height: 100)
//        }
//      }
    }
  }
}

