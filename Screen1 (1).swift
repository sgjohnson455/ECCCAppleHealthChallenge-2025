//
//  ContentView.swift
//  Questions
//
//  Created by Amna Saddiqa on 7/8/25.
//

import SwiftUI

struct MainQuestions : View {
    
    // Colors
    @State private var Main = Color.casualMain
    @State private var Tint = Color.casualTint
    
    // User Data
    @AppStorage("selectedGender") var selectedGender: String = ""
    @State private var navigateToScreen2 = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    // Progress bar
                    HStack {
                        Divider()
                            .frame(width: 40, height: 3)
                            .overlay(Main)
                        ForEach(0..<5) { _ in
                            Divider()
                                .frame(width: 40, height: 3)
                                .overlay(Tint)
                        }
                        
                    }
                    .padding()

                    
                    // Question Text
                    VStack {
                        Text("Question 1")
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        Text("What is your gender?")
                            .font(.headline)
                            .padding(.bottom, 30)
                    }
                    
                    // Female Option
                    Button(action: {
                        selectedGender = "Female1"
                    }) {
                        HStack {
                            Image(selectedGender == "Female1" ? "Female" : "Female1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                            Text("Female")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    
                    // Male Option
                    Button(action: {
                        selectedGender = "Male"
                    }) {
                        HStack {
                            Text("Male")
                                .foregroundColor(.black)
                            Image(selectedGender == "Male" ? "Male1" : "Male")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                            
                        }
                    }
                    .padding()
                    
                    // Other Option
                    Button(action: {
                        selectedGender = "Other"
                    }) {
                        HStack {
                            Image(selectedGender == "Other" ? "Other1" : "Other")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                            Text("Other")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    
                    // Optional: Show selected gender for testing
                    //                    Text("Selected: \(selectedGender)")
                    //                        .foregroundColor(.gray)
                    //                        .padding(.top, 20)
                    
                }
                .padding()
                
                HStack{
                    
                    Spacer()
                    
                    // Custom "Next" button to Screen2
                    NavigationLink(
                        destination: Screen2(),
                        isActive: $navigateToScreen2
                    ) {
                        HStack {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(selectedGender.isEmpty ? Color.gray.opacity(0.5) : .gray)
                        .font(.body)
                    }
                    .disabled(selectedGender.isEmpty)
                    .padding(.bottom)
                }
                .padding()
                .navigationBarHidden(true)
            }
        }
    }
}
    

#Preview {
    MainQuestions()
}

