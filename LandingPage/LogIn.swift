//
//  SwiftUIView.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/16/25.
//

import SwiftUI

struct LogIn: View {
    
    // Color
    
    var bgcolor : Color = Color(red: 0.95, green: 0.75, blue: 0.34)
    
    var body: some View {
        ZStack {
            bgcolor
                .ignoresSafeArea()
            VStack(spacing: 15) {
                VStack(spacing: 10) {
                    ZStack {
                        Rectangle() // outline
                            .fill(Color(red: 0.96, green: 0.75, blue: 0.34))
                            .frame(width: 255, height: 255)
                            .cornerRadius(24)
                        
                        Image("ClearLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 245, height: 245)
                    }
                    
                    //Gym Buddies
                    Text("Pear").font(.system(size: 40, weight: .bold)).multilineTextAlignment(.center)
                }
                Spacer()
                    .frame(height: 0)
                TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(21)
                    .padding(.horizontal, 20)
                    .foregroundStyle(.white)
    
                TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(21)
                    .padding(.horizontal, 20)
                    .foregroundStyle(.white)
                
                Spacer()
                    .frame(height: 10)
                
                // Log In and Sign Up
                NavigationStack {
                    NavigationLink("Log In") {
                        TabBar()
                    }
                }
                Button(action: {
                    //TabBar()
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 353, height: 50)
                            .background(Color.casualMain)
                            .cornerRadius(21)
                        Text("Sign Up")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color.white)
                    }
                }
                .foregroundStyle(.clear)
//                
                
                Spacer()
                    .frame(height: 100)
            }
        }
    }
    
}
#Preview {
    LogIn()
}
