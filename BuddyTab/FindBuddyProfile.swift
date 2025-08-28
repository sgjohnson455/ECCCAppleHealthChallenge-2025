//
//  Profile.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/10/25.
//

import SwiftUI

struct RequestCard : View {
    
    @State var requestMessage : String = ""
    
    var body : some View {
        ZStack {
            Rectangle() // Background
                .foregroundStyle(.clear)
                .frame(width: 353, height: 134)
                .background(Color.grey)
                .cornerRadius(8)
            VStack (spacing: 15){
                HStack {
                    Image(systemName: "mail")
                    Text("Request")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                } // Request Text
                
                ZStack() {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 243, height: 25)
                        .background(Color.white)
                        .cornerRadius(12)
                    TextField("Ask to connect...", text: $requestMessage)
                        .padding(.leading, 87)
                    Image(systemName: "pencil")
                        .padding(.leading, 217)
                        .frame(width: 24, height: 24)
                } // Request Text Field
                
                Button(action: {}) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(width: 80, height: 25)
                            .background(.white)
                            .cornerRadius(12)
                        Text("Send")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                    }
                } // Send Button
            }
        }
    }
}

struct WorkoutCard : View {
    var body : some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 353, height: 206)
                .background(Color.grey)
                .cornerRadius(8)
            
            VStack {
                Text("Recent Workouts")
                    .font(.system(size: 17))
                    .padding(.top, 15)
                    .fontWeight(.semibold)
                ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 304, height: 145)
                    .cornerRadius(12)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("1. Running")
                            Spacer()
                                //.frame(width: 130, height: 20)
                            Text("45 min")
                        }
                        Divider()
                            .frame(width: 290)
                        HStack {
                            Text("2. Swimming")
                            Spacer()
                                //.frame(width: 130, height: 20)
                            Text("30 min")
                        }
                        Divider()
                            .frame(width: 290)
                        HStack {
                            Text("3. Elliptical")
                            Spacer()
                                //.frame(width: 130, height: 20)
                            Text("25 min")
                        }
                       
                    }
                    .padding(.horizontal, 60)
                }
            }
                
        }
    }
} // Need to add code to showcase workouts

struct Profile: View {
    @Environment(\.dismiss) var dismiss
    
    // Profile Details
    @State var language : String = "English"
    @State var lastActive : String = "6:00pm"
    @State var gym : String = "LA Fitness"
    @State var name : String = "Rachel Garcia"
    @State var userName : String = "@rachelGarcia7"
    
    @State var bio : String = "Looking for a beginner like me to practice skills with! Hoping to go 1x/2x every week? I want to build endurance."
    
    @State private var isFollowing: Bool = false

    var body: some View {
        NavigationStack {
            ZStack{
                ZStack(alignment: .top) {
                    VStack (){
                        ZStack(alignment: .top) {
                            Color.casualMain // color background
                                .frame(height: 429)
                                .ignoresSafeArea()
                            
                            //Stationary Back Button
                            VStack {
                                Button(action: {dismiss()}) {
                                    HStack{
                                        HStack(spacing: 4) {
                                            Image(systemName: "chevron.left")
                                            Text("Back")
                                                .font(.title3)
                                        }
                                        .foregroundColor(.white)
                                        Spacer()
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding()
                            }
                            
                            // Content
                            VStack {  // Content Header
                                ZStack {
                                    Circle()
                                        .fill(Color.casualTint)
                                        .frame(width:100, height:100)
                                        .foregroundStyle(.clear)
                                    Image(systemName: "person")
                                        .font(.system(size: 50))
                                        .foregroundStyle(.black)
                                } // Profile Photo
                                .padding(.top, 10)
                                
                                //Name
                                Text("\(name)")
                                    .foregroundStyle(Color.white)
                                    .font(.title)
                                Text("\(userName)")
                                    .foregroundStyle(Color.white)
                                    .font(.body)
                                
                                // Follow Button
                                Button(action: {
                                    isFollowing.toggle()
                                }) {
                                    
                                    ZStack {
                                        Rectangle()
                                            .fill(isFollowing ? Color.casualTint : Color.white)
                                            .frame(width: 104, height: 35)
                                            .cornerRadius(100)
                                        Text(isFollowing ? "Following" : "Follow")
                                            .foregroundStyle(isFollowing ? .black : Color.casualMain)
                                            .fontWeight(.semibold)
                                    }
                                    
                                }
                                
                                
                                // Three Words
                                ZStack {
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(width: 346, height: 42)
                                        .background(Color.casualTint)
                                        .cornerRadius(8)
                                    HStack (spacing: 60) {
                                        VStack {
                                            Text("Language")
                                                .font(.caption)
                                                .fontWeight(.regular)
                                            Text("\(language)")
                                            
                                        }
                                        VStack {
                                            Text("Last Active")
                                                .font(.caption)
                                                .fontWeight(.regular)
                                            Text("\(lastActive)")
                                        }
                                        VStack {
                                            Text("Gym")
                                                .font(.caption)
                                                .fontWeight(.regular)
                                            Text("\(gym)")
                                        }
                                    }
                                    .fontWeight(.medium)
                                }
                                .padding(.top, 5)
                                .padding(.bottom, 10)
                                
                                // Bio Text
                                Text("\(bio)")
                                    .padding(.horizontal, 45)
                                    .foregroundStyle(Color.white)
                                    .font(.body)
                                    .fontWeight(.medium)
                            }
                            .padding(.bottom, -40)
                        }
                        VStack (spacing: 25){
                            RequestCard()
                            WorkoutCard()
                        }
                        .padding(.top, -30)
                        Spacer()
                        
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "leaf.fill")
                            .padding(20)
                            .foregroundStyle(.white)
                            .font(.system(size: 24))
                        Spacer()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    Profile()
}


