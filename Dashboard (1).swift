//
//  ContentView.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/10/25.
//

import SwiftUI

struct FindBuddyCard : View {
    var body : some View {
        ZStack {
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "envelope")
                    Text("Find a Buddy")
                        .font(.system(size: 20))
                }
                Text("Easily find and split membership costs with people who want to work out like you!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                
                Text("Establish good routines for a healthier community")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                
                Spacer()
                    .frame(height: 10)
                HStack {
                    NavigationLink(destination: LogIn()) {
                        ZStack {
                            Text("Not Right Now")
                                .foregroundStyle(Color.casualMain)
                        }
                        .padding(EdgeInsets(top: 7, leading: 14, bottom: 7, trailing: 14))
                        .background(.white)
                        .cornerRadius(40)
                    }
                    Spacer()
                        .frame(width: 20)
                    
                    NavigationLink(destination: LogIn()) {
                        ZStack {
                            Text("Sounds good!")
                                .foregroundStyle(Color.casualMain)
                        }
                        .padding(EdgeInsets(top: 7, leading: 14, bottom: 7, trailing: 14))
                        .background(.white)
                        .cornerRadius(40)
                    }
                    
                }
                
            }
            .frame(width: 305)
            .foregroundStyle(Color.white)
            NavigationLink (destination: Profile()) {
            }
            .foregroundStyle(.clear)
        }
        
    }
}

struct WorkoutMiniSummary : View {
    var body : some View {
        HStack {
            // Graph image
            Image("75percent")
                .resizable()
                .frame(width: 120, height:115)
                .padding(.leading)
            
            
            // Summary stack info
            VStack(alignment: .leading) {
            Text("Summary")
                .font(.system(size: 34))
                .fontWeight(.semibold)
                .foregroundStyle(Color.casualMain)
            HStack {
                
                Text("60")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.casualMain)
                VStack {
                    Spacer()
                        .frame(width: 4, height: 5)
                    Text("min")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundStyle(.black.opacity(0.5))
                }
                .padding(.leading, -7)
                Text("Workout")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            HStack {
                
                Text("15")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.casualMain)
                VStack {
                    Spacer()
                        .frame(width: 4, height: 5)
                    Text("min")
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundStyle(.black.opacity(0.5))
                }
                .padding(.leading, -7)
                Text("Stretching")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 15, height: 30)
                .foregroundStyle(Color.casualMain)
                .padding(.vertical)
                .padding(.trailing, 23)
        }
        .padding(.top, -2)
    }
}

struct NotebookMiniSummary : View {
    var body : some View {
        Spacer()
            .frame(height: 30)
        HStack(spacing: 30) {
            VStack {
                Text("Mood")
                    .font(.body)
                    .foregroundStyle(Color.casualMain)
                ZStack {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(Color.grey)
                    Image("smile")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
            }
            VStack {
                Text("Water")
                    .font(.body)
                    .foregroundStyle(Color.casualMain)
                ZStack {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(Color.grey)
                    VStack (spacing: -5) {
                        Text("11")
                            .font(.title2)
                            .foregroundStyle(Color.casualMain)
                            .fontWeight(.bold)
                        Text("Cups")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.black.opacity(0.5))
                    }
                }
            }
            VStack {
                Text("Sleep")
                    .font(.body)
                    .foregroundStyle(Color.casualMain)
                ZStack {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(Color.grey)
                    VStack (spacing: -5) {
                        Text("10")
                            .font(.title2)
                            .foregroundStyle(Color.casualMain)
                            .fontWeight(.bold)
                        Text("Hours")
                            .font(.system(size: 14))
                            .foregroundStyle(Color.black.opacity(0.5))
                    }
                        
                }
            }
        }
        .padding(.top, -10)
        Spacer()
            .frame(height: 7)
    }
}

struct WTabBar : View {
    @State private var showWorkoutSum : Bool = false
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 21)
                .fill(Color.white)
                .frame(width: 353, height: 193)
            RoundedRectangle(cornerRadius: 21)
                .stroke(Color(red: 0.26, green: 0.47, blue: 0.15), lineWidth: 4)
                .frame(width: 349, height: 189)
            VStack {
                Spacer()
                    .frame(height: 5)
                Picker("test", selection: $showWorkoutSum) {
                    Text("Workout").tag(true)
                    Text("Notebook").tag(false)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 40)
                ZStack {
                    VStack {
                        showWorkoutSum ? AnyView(WorkoutMiniSummary()) : AnyView(NotebookMiniSummary())
                        Spacer()
                            .frame(height: 20)
                    }
                }
            }
            
        }
    }
}

struct Dashboard: View {
    @EnvironmentObject var userData : UserData // User Data
    
    var viewTrendingPosts : Bool = false
    
    // Tab Organization
    var body: some View {
        VStack(spacing: 15) {  // Main Vstack - contains all content sans tab bar
            HStack() {
                // Welcome Header Text
                VStack {
                    Text("Hello \(userData.firstName)!")
                        .font(.system(size:33))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    Text("Hello! Ready for another great day?")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // User Profile Photo (Icon)
                ZStack {
                    Circle()
                        .fill(Color.casualMain)
                        .frame(width:54, height:54)
                    Circle()
                        .fill(Color.casualTint)
                        .frame(width:50, height:50)
                    NavigationLink(destination: ProfileCasual()) {
                        Image(systemName: "person")
                            .frame(width:44, height:44)
                            .foregroundColor(Color.casualMain)
                    }
                    .frame(width:44, height:44)
                    .foregroundColor(.clear)
                }
                
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 20)
            
        
        // Content Frame Vstack
            VStack(spacing: 17) {
                
                // Membership Card Button
                Button("Membership Card", systemImage: "creditcard") {
                    
                }
                .foregroundColor(.white)
                .frame(width: 353, height: 50)
                .background(Color.casualMain)
                .cornerRadius(12)
                
                // Stats and Log View
                WTabBar()
                
                // Custom Social Card
                ZStack {
                    RoundedRectangle(cornerRadius: 21)
                        .fill(Color.casualMain)
                        .frame(width: 353, height: 304)
                    viewTrendingPosts ? AnyView(FindBuddyCard()) : AnyView(FindBuddyCard()) //swap with com forum
                }
                
            }
        }
        
    }
        
}

struct TabBar: View {
    // Tab Enum Declaration
    enum Tab {
        case dashboard, findbuddy, notebook, forum
    }
    
    var selectedTab: Tab = .dashboard
        var body: some View{
            
            NavigationStack {
            // After Main Content (Tab Bar)
            TabView {
                Dashboard()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.dashboard)
                    .toolbarBackground(.white, for: .tabBar)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                FindBuddy()
                    .tabItem{
                        Label("Buddy", systemImage: "person")
                    }
                    .tag(Tab.findbuddy)
                    //.toolbarBackground(Color.casualMain, for: .tabBar)
                    .toolbarBackground(.white, for: .tabBar)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                Notebook()
                    .tabItem{
                        Label("Notebook", systemImage: "book")
                    }
                    .tag(Tab.notebook)
                    .toolbarBackground(.white, for: .tabBar)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                ComForum()
                    .tabItem{
                        Label("Forum", systemImage: "star.bubble")
                    }
                    .tag(Tab.forum)
                    //.toolbarBackground(Color.casualMain, for: .tabBar)
                    .toolbarBackground(.white, for: .tabBar)
                    .toolbarBackgroundVisibility(.visible, for: .tabBar)
                
            }
            .navigationBarBackButtonHidden(true)
            .accentColor(Color.casualMain)
        }
            
}
}

#Preview {
        TabBar()
            .environmentObject(UserData())
            .environmentObject(PostStore())
}
