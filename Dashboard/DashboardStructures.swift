//
//  UserData.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/14/25.
//

import SwiftUI

// Custom Color Extension
extension Color {
    static let casualMain = Color(red: 0.26, green: 0.47, blue: 0.15)
    static let casualTint = Color(red: 0.65, green: 0.75, blue: 0.60)
    static let compMain = Color(red: 0.93, green: 0.37, blue: 0.03)
    static let compTint = Color(red: 1, green: 0.80, blue: 0.67)
    static let white = Color.white
    static let grey = Color(red: 0.85, green: 0.85, blue: 0.85)
}


// Workout Organization
class WorkoutData {
    var workoutType : String = "Nil"                // reps, sets, etc
    var workoutName : String = "Nil"                // User inputted name for workout
    var duration : Int = 0                          // Duration is a numerical value assigned by user
}

// User Data
class UserData: ObservableObject {
    @Published var firstName : String       // User's Real First Name
    @Published var lastName : String        // User's Real Last Name
    @Published var apptype : String         // Causal vs Competitive
    @Published var sleep : Double           // User's Sleep Goal
    @Published var water : Int                      // User's Water Intake Goal
    //@Published var workoutData : List[WorkoutData]      // List of the User's Workout Data (for example)
    
    // Populate with sample data
    init() {
        firstName = "Admira"
        lastName = "LastName"
        apptype = "Casual"
        sleep = 10.5
        water = 8
    }
}

// Text Styles
struct HeaderText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .fontWeight(.semibold)
            .foregroundStyle(.black)
    }
}
struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .fontWeight(.regular)
            .foregroundStyle(.black)
    }
}
struct SubHeadText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .fontWeight(.semibold)
            .foregroundStyle(.black)
    }
}
extension View {
    func hStyle() -> some View {
        modifier(HeaderText())
    }
    func bStyle() -> some View {
        modifier(BodyText())
    }
    func subStyle() -> some View {
        modifier(SubHeadText())
    }
}






//struct TabBar : ObservableObject {
//    
//    // Shared Variables
//    @State private var casualTint = Color(red: 0.65, green: 0.75, blue: 0.60)
//    // Colors
//    @State private var casualMain = Color(red: 0.26, green: 0.47, blue: 0.15)
//    @State private var compMain = Color(red: 0.93, green: 0.37, blue: 0.03)
//    @State private var compTint = Color(red: 1, green: 0.80, blue: 0.67)
//    @State private var white = Color.white
//    @State private var grey = Color(red: 0.85, green: 0.85, blue: 0.85)
//    
//    // Tab Enum Declaration
//    enum Tab {
//        case dashboard, findbuddy, notebook, forum
//    }
//    @State private var selectedTab: Tab = .dashboard
//    
//    var body: some View{
//    // After Main Content (Tab Bar)
//        TabView {
//            Dashboard()
//                .tabItem{
//                    Label("Home", systemImage: "house")
//                }
//                .tag(Tab.dashboard)
//            FindBuddy()
//                .tabItem{
//                    Label("Buddy", systemImage: "person")
//                }
//                .tag(Tab.dashboard)
//            Notebook()
//                .tabItem{
//                    Label("Notebook", systemImage: "book")
//                }
//                .tag(Tab.dashboard)
//            Forum()
//                .tabItem{
//                    Label("Forum", systemImage: "star.bubble")
//                }
//                .tag(Tab.dashboard)
//        }
//        .accentColor(casualMain)
//}
//}

//#Preview {
//    TabBar()
//}
