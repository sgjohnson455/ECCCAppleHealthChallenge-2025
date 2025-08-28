import SwiftUI

struct Screen3: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("fitnessLevel") private var selectedLevel: String = ""
    @State private var navigateToScreen4 = false
    
    
    let levels: [(name: String, icon: String)] = [
        ("Beginner", "figure.walk"),
        ("Intermediate", "figure.run"),
        ("Advanced", "figure.strengthtraining.functional")
    ]
    
    // Colors
    @State private var casualMain = Color(red: 0.26, green: 0.47, blue: 0.15)
    
    @State private var casualTint = Color(red: 0.65, green: 0.75, blue: 0.60)
    
    @State private var compMain = Color(red: 0.93, green: 0.37, blue: 0.03)
    
    @State private var compTint = Color(red: 1, green: 0.80, blue: 0.67)
    
    @State private var white = Color.white
    
    @State private var grey = Color(red: 0.85, green: 0.85, blue: 0.85)
    
    @State private var Main = Color(red: 0.26, green: 0.47, blue: 0.15)

    @State private var Tint = Color(red: 0.65, green: 0.75, blue: 0.60)
    
    
    var body: some View {
        VStack {
            ScrollView {
                // Progress bar
                HStack(spacing: 8) {
                    ForEach(0..<3) { _ in
                        Rectangle()
                            .frame(width: 40, height: 3)
                            .foregroundColor(casualMain)
                    }
                    ForEach(0..<3) { _ in
                        Rectangle()
                            .frame(width: 40, height: 3)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                }
                .padding()
                
                // Question Text
                VStack {
                    Text("Question 3")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Text("What is your fitness level?")
                        .font(.headline)
                        .padding(.bottom, 150)
                }
                
                
                VStack(spacing: 20) {
                    ForEach(levels, id: \.name) { level in
                        Button(action: {
                            selectedLevel = level.name
                        }) {
                            HStack(spacing: 10) {
                                Image(systemName: level.icon)
                                    .font(.title2)
                                Text(level.name)
                                    .fontWeight(.medium)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                selectedLevel == level.name ? casualMain : grey
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        
        Spacer()
        
        // Navigation buttons
        HStack {
            Button(action: {
                dismiss()
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    Text("Previous")
                }
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            NavigationLink(destination: Screen4(), isActive: $navigateToScreen4) {
                HStack(spacing: 4) {
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
        
        }
    }
    
    #Preview {
        Screen3()
    }
