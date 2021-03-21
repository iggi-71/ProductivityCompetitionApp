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
        @State var count = 25
        @State var countSec = 0
        @State var timeSec = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        var body: some View{
            VStack{
                HStack{
                    Spacer()
                    Spacer()
                    Text("Home Screen")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    VStack{
                        Text("Points")
                        Text("🌞")
                    }
                }
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
                                .stroke(Color.blue, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                                .frame(width: 280, height: 280)
                                .rotationEffect(.init(degrees: -90))
                            
                            VStack{
                                
                                Text(String(format: "%02d", count) + ":" + String(format: "%02d", countSec))
                                    .font(.system(size:65))
                                    .fontWeight(.bold)
                                
                                Text("of 25 Minutes")
                                    .font(.title)
                                    .padding(.top)
                                
                            }
                        }
                        
                        HStack(spacing: 20) {
                            
                            Button(action: {
                                //this is the play button
                                
                                if self.countSec == 0{
                                    
                                    self.countSec = 59
                                    
                                }
                                
                                if self.count == 25{
                                    
                                    self.count = 24
                                    
                                }
                                
                                
                                //this is the the minutes
                                if self.count == 0{
                                    
                                    self.count = 24
                                    withAnimation(.default){
                                        
                                        self.to = 25
                                    }
                                }
                                
                                self.start.toggle()
                                
                            }) {
                                HStack(spacing: 15){
                                    
                                    Image(systemName: self.start ? "pause.fill" : "play.fill")
                                        .foregroundColor(.white)
                                    
                                    Text(self.start ? "Pause" : "Play")
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                                .background(Color.blue)
                                .clipShape(Capsule())
                            }
                            //this is the restart
                            Button(action: {
                                
                                self.count = 25
                                self.countSec = 0
                                
                                withAnimation(.default){
                                    
                                    self.to = 25
                                }
                                
                            }) {
                                HStack(spacing: 15){
                                    
                                    Image(systemName: "arrow.clockwise")
                                        .foregroundColor(.blue)
                                    
                                    Text("Restart")
                                        .foregroundColor(.blue)
                                }
                                
                                .shadow(radius: 6)
                                .padding(.vertical)
                                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                                .background(
                                    Capsule()
                                        .stroke(Color.blue, lineWidth: 2)
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
            
            .onReceive(self.timeSec) { (_) in
                
                if self.start{
                    
                    //while the minutes doesnt equal 0 keep subtracting one second
                    if self.count != -1 {
                        
                        self.countSec -= 1
                        print("seconds are working")
                        
                    }
                    
                    //once the minutes reaches -1 it turns it into one
                    //this allows the seconds to count down the last seconds
                    if self.count == -1{
                        self.count = 0
                        self.countSec = 0
                        self.start.toggle()
                    }
                    
                    if self.countSec == -1 {
                        
                        self.countSec = 59
                        self.count -= 1
                        print("Restarting back to 59 seconds")
                        print("subtracting one minute")
                        withAnimation(.default){
                            
                            self.to = CGFloat(self.count) / 25
                        }
                        
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
