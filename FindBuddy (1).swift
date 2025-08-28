//
//  FindBuddy.swift
//  GymBuddiesFinal
//
//  Created by sj on 7/10/25.
//

import SwiftUI
//import MapKit
//import CoreLocation

struct SearchBar : View {
    @State var userSearch : String = ""
    var body : some View {
        ZStack {
            Rectangle()
                .background(Color.white)
                .foregroundStyle(.clear)
                .frame(width: 353, height: 43)
                .cornerRadius(100)
                .offset(x:0, y:0)
            HStack {
                Image(systemName: "magnifyingglass")
                    .frame(width:24, height:24)
                
                TextField("Search Gym By Name", text: $userSearch)
            }
            .padding(.leading, 40)
            
        } // Search Bar - Gym Name
    }
}

struct BuddyCard : View {
    let name: String
    let language: String
    let gymLocation: String
    let age: Int
    let description: String
    var body : some View {
        NavigationLink(destination: Profile()){
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 353, height: 145)
                    .background(.white)
                    .foregroundStyle(.clear)
                    .cornerRadius(12)
                VStack (alignment: .leading) {
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(Color.grey)
                                .frame(width: 50, height: 50)
                            Image(systemName: "person")
                        }
                        VStack(alignment: .leading) {
                            Text("\(name)")
                                .fontWeight(.bold)
                            Text("\(language)")
                                .foregroundStyle(Color.casualMain)
                        }
                        Spacer()
                            .frame(width: 33)
                        VStack(alignment: .trailing) {
                            Text("\(gymLocation)")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.casualMain)
                            Text("\(age) years old")
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 30)
                    .font(.body)
                    .fixedSize()
                    
                    Text("\(description)")
                        .font(.body)
                        .padding(.horizontal, 35)
                        .padding(.leading, 5)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TagView: View {
    let text: String
    var onRemove: (() -> Void)? // Optional closure to handle removal

    var body: some View {
        HStack(spacing: 4) { // Small spacing between text and 'X'
            Text(text)
                .font(.body) // Smaller font for tags
                .padding(.vertical, 5) // Vertical padding for height
                .padding(.leading, 10) // Padding on the left of the text
                .foregroundStyle(.white)

            // The "X" button
            Button(action: {
                onRemove?() // Call the closure if it exists
            }) {
                Image(systemName: "xmark.circle.fill") // A filled circle X looks nice
                    .font(.body) // Match font size
                    .foregroundColor(.white) // Gray color for the X
            }
            .padding(.trailing, 8) // Padding on the right of the button
        }
        .background(Color.casualMain) // Light blue background for the tag
        .cornerRadius(8) // Rounded corners for the rectangle
        .fixedSize(horizontal: true, vertical: false) // Prevent tags from stretching horizontally
    }
}

struct FilterBarEmpty : View {
    var body : some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 393, height: 44)
                .background(.white)
            HStack {
                Text("Filter")
                    .font(.system(size:17))
                    .fontWeight(.semibold)
                    .padding(.leading, 30)
                Spacer()
                    .frame(width: 265)
            }
            
        } // Filter Bar
    }
}

struct FilterBarFull : View {
    @State private var selectedTags: [String] = [
            "Weightlifting", "Cardio", "Yoga"
        ]
    @State private var selectedTags2: [String] = [
            "Running"
        ]
    var body : some View {
        ZStack {
            ZStack {
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 393, height: 135)
                        .background(.white)
                    VStack {
                        HStack (){
                            Text("Filter")
                                .font(.system(size:17))
                                .fontWeight(.semibold)
                                .padding(.leading, 30)
                                .padding(.top, 12)
                            Spacer()
                                .frame(width: 265, height: 3)
                        }
                    }
                    
                } // Filter Bar
                VStack {
                    Divider()
                    Spacer()
                        .frame(height: 60)
                }
            }
            VStack {
                HStack(spacing: 8) {
                    ForEach(selectedTags, id: \.self) { tagText in
                        TagView(text: tagText) {
                            if let index = selectedTags.firstIndex(of: tagText) {
                                selectedTags.remove(at: index)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                HStack(spacing: 8) {
                    ForEach(selectedTags2, id: \.self) { tagText in
                        TagView(text: tagText) {
                            if let index = selectedTags2.firstIndex(of: tagText) {
                                selectedTags2.remove(at: index)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 5)
            }
            .padding(.top, 30)
        }
    }
}

struct MapViewEmpty : View {
    var body : some View {
        ZStack (alignment: .bottomTrailing) {
            ZStack(alignment: .topLeading){
                Image("map")
                    .resizable()
                    .frame(width: 353, height: 183)
                    .background(.white)
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 85, height: 25)
                            .background(Color.casualMain)
                            .cornerRadius(8)
                            .foregroundStyle(.clear)
                        Text("Near You")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .padding()
                    }
                }
            }
            ZStack {
                Rectangle()
                    .frame(width: 30, height: 25)
                    .background(Color.casualMain)
                    .cornerRadius(8)
                    .foregroundStyle(.clear)
                Image(systemName: "rectangle.expand.diagonal")
                    .foregroundStyle(Color.white)
                    .font(.headline)
                    .padding()
            }
                

        } // MapKit Plugin
    }
}

struct MapViewFull : View {
    var body : some View {
        ZStack {
            ZStack (alignment: .bottomTrailing) {
                ZStack(alignment: .topLeading){
                    Image("map")
                        .resizable()
                        .frame(width: 353, height: 183)
                        .background(.white)
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 85, height: 25)
                                .background(Color.casualMain)
                                .cornerRadius(8)
                                .foregroundStyle(.clear)
                            Text("Near You")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .padding()
                        }
                    }
                }
                ZStack {
                    Rectangle()
                        .frame(width: 30, height: 25)
                        .background(Color.casualMain)
                        .cornerRadius(8)
                        .foregroundStyle(.clear)
                    Image(systemName: "rectangle.expand.diagonal")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .padding()
                }
            }
                // map pins yay
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 24))
                        Spacer()
                            .frame(width: 90)
                    }
                    HStack {
                        Spacer()
                            .frame(width: 200)
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 24))
                        
                    }
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 24))
                        Spacer()
                            .frame(width: 130)
                        
                    }
                }
                .foregroundStyle(Color.casualMain)
                
            } // MapKit Plugin
    }
}

struct FindBuddy: View {
    
    // Style Variable
        // controls competitive vs. casual view
        @State private var competitive : Bool = false
    
    // Map Variables
        // @State var locationManager = LocationManager()
        //@State private var userLocation
    
    // Search Bar
    @State private var userSearch : String = ""
    @State private var showUsers : Bool = false
    
    // Filter bar
    @State var showFilterBar : Bool = true
    
    var body: some View {
        // UI
        NavigationStack {
            ZStack (alignment: .top){
                Color.casualMain
                    .ignoresSafeArea()// background Color
                VStack (spacing:20) {
                    SearchBar() // Search Bar - Gym Name
                    
                    // Map View
                    ZStack {
                        // Toggle Map
                        MapViewFull()
                        
                        Button(action: {
                            showUsers.toggle()
                        }) {
                            if (showUsers) {
                                Image(systemName: "mappin.circle")
                                    .font(.system(size: 24))
                                    .foregroundStyle(Color.casualMain)
                            } else {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundStyle(Color.casualMain)
                            }
                        }
                    }
                    
                    ZStack (alignment: .top) {
                        if showFilterBar {
                            FilterBarEmpty()
                        } else {
                            FilterBarFull()
                        }
                        HStack() {
                            Spacer()
                                .frame(width: 339)
                            Button(action: {
                                showFilterBar.toggle()
                            }) {
                                Image(systemName: "line.3.horizontal.decrease")
                                    .foregroundStyle(.black)
                                    .frame(width: 24, height:24)
                            }
                        }
                        .padding(.top, 10)
                    }
                    if (showUsers) {
                        ScrollView { // Use ScrollView to display multiple cards if they exceed screen height
                            VStack(spacing: 20) { // Add spacing between cards
                                BuddyCard(
                                    name: "Rachel Garcia",
                                    language: "English",
                                    gymLocation: "LA Fitness",
                                    age: 28,
                                    description: "Looking for a beginner like me to practice skills with! Hoping to go 1x/2x every week? I want to build endurance."
                                )
                                
                                BuddyCard(
                                    name: "Adam Strong",
                                    language: "Spanish",
                                    gymLocation: "LA Fitness",
                                    age: 35,
                                    description: "Into powerlifting and strongman. Happy to spot or share tips. Available mornings before work."
                                )
                                
                                BuddyCard(
                                    name: "Charlie Zhang",
                                    language: "French",
                                    gymLocation: "LA Fitness",
                                    age: 22,
                                    description: "New to the gym and looking for someone to help me get started with a routine. Very motivated!"
                                )
                                // Add more BuddyCard instances as needed
                            }
                            .padding() // Add padding around the VStack
                        }
                        .padding(.top, -10)
                    }
                } // Content Frame
            }
            
            
            
        }
        
        
    }
        
}
    

#Preview {
    FindBuddy()
}
