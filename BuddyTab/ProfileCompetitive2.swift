//
//  Profile.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/10/25.
//

import SwiftUI


struct ProfileCasual: View {
    @Environment(\.dismiss) var dismiss
    
    // Profile Details
    @State var language : String = "English"
    @State var lastActive : String = "7:00am"
    @State var gym : String = "LA Fitness"
    @State var name : String = "Admira Mendoza"
    @State var userName : String = "@admira6"
    
    @State var bio : String = "Just starting out! Wanting to try calisthenics or cardio. Open to tips!"
    
    @State private var isFollowing: Bool = true

    var body: some View {
        NavigationStack {
            ZStack {
                ZStack(alignment: .top) {
                    VStack (){
                        ZStack(alignment: .top) {
                            Color.casualMain // color background
                                .frame(height: 450)
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
                                        Text(isFollowing ? "Paired" : "Unpaired")
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
                            .padding(30)
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
    ProfileCasual()
}


