////
////  HomeView.swift
////  ProdComp
////
////  Created by apple on 3/16/21.
//

import SwiftUI
import UserNotifications

class HomeView: UIViewController {
    
    struct HomeView: View {
        
        @State var start = false
        @State var to : CGFloat = 25
        @State var count = 24
        @State var countSec = 59
        @State var countSecTwo = 9
        @State var time = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
        @State var timeSec = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        var body: some View{
            VStack{
                Text("Home Screen")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ZStack{
                    Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Spacer()
                        ZStack{
                            
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(Color.black.opacity(0.6), style: StrokeStyle(lineWidth: 25, lineCap: .round))
                                .frame(width: 280, height: 280)
                            Circle()
                                .trim(from: 0, to: self.to)
                                .stroke(Color.red, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                                .frame(width: 280, height: 280)
                                .rotationEffect(.init(degrees: -90))
                            
                            VStack{
                                
                                Text("\(self.count):\(self.countSec)")
                                    .font(.system(size:65))
                                    .fontWeight(.bold)
                                
                                Text("of 25 Minutes")
                                    .font(.title)
                                    .padding(.top)
                                
                            }
                        }
                        
                        HStack(spacing: 20) {
                            
                            Button(action: {
                                
                                if self.countSec == 0{
                                    
                                    self.countSec = 59
                                    
                                }
                                
                                //                                if self.countSecTwo == 0{
                                //
                                //                                    self.countSecTwo = 9
                                //
                                //                                }
                                
                                
                                
                                //this is the the minutes
                                if self.count == 0{
                                    
                                    self.count = 24
                                    withAnimation(.default){
                                        
                                        self.to = 25
                                    }
                                }
                                
                                self.start.toggle()
                                
                            }) {
                                //this is the restart
                                HStack(spacing: 15){
                                    
                                    Image(systemName: self.start ? "pause.fill" : "play.fill")
                                        .foregroundColor(.white)
                                    
                                    Text(self.start ? "Pause" : "Play")
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                                .background(Color.red)
                                .clipShape(Capsule())
                            }
                            
                            Button(action: {
                                
                                self.count = 24
                                self.countSec = 59
                                
                                withAnimation(.default){
                                    
                                    self.to = 0
                                }
                                
                            }) {
                                HStack(spacing: 15){
                                    
                                    Image(systemName: "arrow.clockwise")
                                        .foregroundColor(.red)
                                    
                                    Text("Restart")
                                        .foregroundColor(.red)
                                }
                                
                                .shadow(radius: 6)
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                                .background(
                                    Capsule()
                                        .stroke(Color.red, lineWidth: 2)
                                )
                                .shadow(radius: 6)
                            }
                        }
                        .padding(.top, 55)
                        Spacer()
                        //this is to move the objects up
                        
                    }
                }
                
                
            }
            .onAppear(perform: {
                
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { (_, _) in
                }
            })
            
            .onReceive(self.time) { (_) in
                
                if self.start{
                    
                    if self.count != 0 {
                        
                        self.count -= 1
                        print("minutes is working")
                        
                        withAnimation(.default){
                            
                            self.to = CGFloat(self.count) / 24
                        }
                    }
                    
                    else{
                        
                        self.start.toggle()
                        self.Notify()
                    }
                }
                
            }
            
            .onReceive(self.timeSec) { (_) in
                
                if self.start{
                    
                    if self.count != 0 {
                        
                        self.countSec -= 1
                        print("seconds are working")
                        
                    }
                    
                    if self.countSec == -1 {
                        
                        self.countSec = 59
                        print("Restarting back to 59 seconds")
                        
                    }
                    else{
                        
                        self.Notify()
                    }
                }
            }
        }
        func Notify() {
            let content = UNMutableNotificationContent()
            content.title = "Message"
            content.body = "Timer is Completed Successfully in the Background"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            
            let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        }
        
    }
}
