import SwiftUI

struct Screen5: View {
    
    // Colors
    @State private var casualMain = Color(red: 0.26, green: 0.47, blue: 0.15)
    @State private var grey = Color(red: 0.85, green: 0.85, blue: 0.85)
    
    // State for answers
    @State private var fitnessLevelPreference: String? = nil
    @State private var genderPreference: String? = nil
    
    @Environment(\.dismiss) var dismiss
    @State private var navigateToScreen6 = false
    
    let options = ["Yes", "No", "Doesn't matter"]
    
    var body: some View {
        VStack {
            ScrollView {
                // Progress bar
                HStack(spacing: 8) {
                    ForEach(0..<5) { _ in
                        Rectangle()
                            .frame(width: 40, height: 3)
                            .foregroundColor(casualMain)
                    }
                    Rectangle()
                        .frame(width: 40, height: 3)
                        .foregroundColor(.gray.opacity(0.3))
                }
                .padding(.top)
                
                // Question 1
                VStack(spacing: 16) {
                    Text("Question 5")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Do you prefer a gym buddy with a similar fitness level?")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation(.easeInOut) {
                                fitnessLevelPreference = option
                            }
                        }) {
                            Text(option)
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(fitnessLevelPreference == option ? casualMain : grey)
                                )
                                .foregroundColor(fitnessLevelPreference == option ? .white : .black)
                        }
                        .animation(.easeInOut, value: fitnessLevelPreference)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                // Question 2
                VStack(spacing: 16) {
                    Text("Do you prefer a gym buddy of the same gender?")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                        .padding(.horizontal)
                    
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation(.easeInOut) {
                                genderPreference = option
                            }
                        }) {
                            Text(option)
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(genderPreference == option ? casualMain : grey)
                                )
                                .foregroundColor(genderPreference == option ? .white : .black)
                        }
                        .animation(.easeInOut, value: genderPreference)
                    }
                }
                .padding(.horizontal,30)
            }
            
            Spacer()
            
            // Bottom Navigation Buttons
            HStack {
                Button(action: {
                    dismiss() // Goes back to Screen4
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Previous")
                    }
                    .foregroundColor(.gray)
                }
                
                Spacer()
                
                NavigationLink(destination: Screen6(), isActive: $navigateToScreen6) {
                    EmptyView()
                }
                
                Button(action: {
                    navigateToScreen6 = true // Goes to Screen6
                }) {
                    HStack(spacing: 4) {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                }
                .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .navigationTitle("Question 5")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Screen5()
}
