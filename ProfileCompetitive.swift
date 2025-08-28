//
//  Profile.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/10/25.
//

import SwiftUI

struct CompWorkoutCard : View {
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
                            Text("1.5 hrs")
                        }
                        Divider()
                            .frame(width: 290)
                        HStack {
                            Text("2. Lifting")
                            Spacer()
                                //.frame(width: 130, height: 20)
                            Text("1 hr")
                        }
                        Divider()
                            .frame(width: 290)
                        HStack {
                            Text("3. Swimming")
                            Spacer()
                                //.frame(width: 130, height: 20)
                            Text("45 min")
                        }
                    }
                    .padding(.horizontal, 60)
                }
            }
                
        }
    }
} // Need to add code to showcase workouts


struct ProfileCompetitive: View {
    @Environment(\.dismiss) var dismiss
    
    // Profile Details
    @State var language : String = "English"
    @State var lastActive : String = "7:00am"
    @State var gym : String = "LA Fitness"
    @State var name : String = "Admira Mendoza"
    @State var userName : String = "@admira6"
    
    @State var bio : String = "I love going 3x times a week. I'm currently doing muscle training, but I'm also curious about calisthenics. Join me!"
    
    @State private var isFollowing: Bool = true

    var body: some View {
        NavigationStack {
            ZStack {
                ZStack(alignment: .top) {
                    VStack (){
                        ZStack(alignment: .top) {
                            Color.compMain // color background
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
                                        .fill(Color.compTint)
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
                                            .fill(isFollowing ? Color.compTint : Color.white)
                                            .frame(width: 104, height: 35)
                                            .cornerRadius(100)
                                        Text(isFollowing ? "Paired" : "Unpaired")
                                            .foregroundStyle(isFollowing ? .black : Color.compMain)
                                            .fontWeight(.semibold)
                                    }
                                    
                                }
                                
                                
                                // Three Words
                                ZStack {
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(width: 346, height: 42)
                                        .background(Color.compTint)
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
                        Image(systemName: "flame.fill")
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
    ProfileCompetitive()
}


