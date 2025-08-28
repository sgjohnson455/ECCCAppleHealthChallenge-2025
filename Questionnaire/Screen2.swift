import SwiftUI

struct Screen2: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedAgeRange: String? = nil
    @State private var navigateToScreen3 = false
    
    // Colors
    @State private var Main = Color(red: 0.26, green: 0.47, blue: 0.15)
    @State private var Tint = Color(red: 0.65, green: 0.75, blue: 0.60)

    let ageRanges = ["18-25", "26-35", "36-45", "45+"]

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Progress bar
                    HStack {
                        Divider()
                            .frame(width: 40, height: 3)
                            .overlay(Main)
                        Divider()
                            .frame(width: 40, height: 3)
                            .overlay(Main)
                        ForEach(0..<4) { _ in
                            Divider()
                                .frame(width: 40, height: 3)
                                .overlay(Tint)
                        }
                    }
                    .padding(.bottom)
                    
          
                    // Question Text
                    VStack {
                        Text("Question 2")
                            .font(.system(size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                        
                        Text("What is your age?")
                            .font(.headline)
                            .padding(.bottom, 20)
                    }
                    
                    // Age buttons with alternating alignment
                    VStack(spacing: 30) {
                        ForEach(ageRanges.indices, id: \.self) { index in
                            HStack {
                                if index % 2 == 0 { Spacer() }

                                Button(action: {
                                    selectedAgeRange = ageRanges[index]
                                }) {
                                    Text(ageRanges[index])
                                        .font(.headline)
                                        .frame(width: 150, height: 100)
                                        .background(selectedAgeRange == ageRanges[index] ? Main : Color.white)
                                        .foregroundColor(selectedAgeRange == ageRanges[index] ? .white : .black)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(Main, lineWidth: 1)
                                        )
                                        .padding(.horizontal, 50)
                                }

                                if index % 2 != 0 { Spacer() }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }

            Spacer()
            
            // Navigation buttons
            HStack {
                Button(action: {
                    dismiss() // ✅ This will now go back to ContentView
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Previous")
                    }
                    .foregroundColor(.gray)
                }

                Spacer()

                NavigationLink(destination: Screen3(), isActive: $navigateToScreen3) {
                    HStack(spacing: 4) {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(selectedAgeRange == nil ? Color.gray.opacity(0.5) : .gray)
                }
                .disabled(selectedAgeRange == nil)
                .simultaneousGesture(TapGesture().onEnded {
                    if selectedAgeRange != nil {
                        navigateToScreen3 = true
                    }
                })
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    Screen2()
}
