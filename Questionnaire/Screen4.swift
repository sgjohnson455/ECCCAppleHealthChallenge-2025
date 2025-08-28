import SwiftUI

struct Screen4: View {
    @Environment(\.dismiss) var dismiss

    @State private var selectedGoals: Set<String> = []
    @State private var selectedPreferences: Set<String> = []
    @State private var navigateToScreen5 = false

    @State private var goals = ["Build Muscle", "Improve Endurance", "Lose Weight", "Improve General Health", "Other"]
    @State private var preferences = ["Lifting", "Cardio", "Classes", "Calisthenics", "Other"]

    @State private var showingGoalModal = false
    @State private var showingPrefModal = false
    @State private var customInputText = ""
    @FocusState private var isTextFieldFocused: Bool

    let darkGreen = Color(red: 0.0, green: 0.5, blue: 0.0)
    let lightGray = Color.gray.opacity(0.2)
    let white = Color.white
    let Main = Color(red: 0.26, green: 0.47, blue: 0.15)

    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    // Progress bar
                    HStack(spacing: 8) {
                        ForEach(0..<4) { _ in
                            Rectangle()
                                .frame(width: 40, height: 3)
                                .foregroundColor(Main)
                        }
                        ForEach(0..<2) { _ in
                            Rectangle()
                                .frame(width: 40, height: 3)
                                .foregroundColor(.gray.opacity(0.3))
                        }
                    }
                    .padding()

                    // Question text
                    VStack(alignment: .leading) {
                        Text("Question 4")
                            .font(.system(size: 12))

                        Text("What are your fitness goals, and what types of workouts do you prefer?")
                            .font(.headline)
                            .padding(.top, 5)
                            .padding(20)
                    }
                    .padding(.horizontal)

                    // I want to...
                    Text("I want to...")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 12)], spacing: 12) {
                        ForEach(goals, id: \.self) { goal in
                            HStack {
                                Button(action: {
                                    if goal == "Other" {
                                        customInputText = ""
                                        showingGoalModal = true
                                    } else {
                                        toggleSelection(goal, in: &selectedGoals)
                                    }
                                }) {
                                    Text(goal)
                                        .font(.body)
                                        .padding(.vertical, 10)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(selectedGoals.contains(goal) ? Main : lightGray)
                                        )
                                        .foregroundColor(selectedGoals.contains(goal) ? .white : .black)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(white, lineWidth: 1)
                                        )
                                }

                                if !["Build Muscle", "Improve Endurance", "Lose Weight", "Improve General Health", "Other"].contains(goal) {
                                    Button(action: {
                                        withAnimation {
                                            goals.removeAll { $0 == goal }
                                            selectedGoals.remove(goal)
                                        }
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                    .padding(20)
                    .padding(.horizontal)

                    // I prefer...
                    Text("I prefer...")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.top, 10)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 12)], spacing: 12) {
                        ForEach(preferences, id: \.self) { pref in
                            HStack {
                                Button(action: {
                                    if pref == "Other" {
                                        customInputText = ""
                                        showingPrefModal = true
                                    } else {
                                        toggleSelection(pref, in: &selectedPreferences)
                                    }
                                }) {
                                    Text(pref)
                                        .font(.body)
                                        .padding(.vertical, 10)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(selectedPreferences.contains(pref) ? Main : lightGray)
                                        )
                                        .foregroundColor(selectedPreferences.contains(pref) ? .white : .black)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(white, lineWidth: 1)
                                        )
                                }

                                if !["Lifting", "Cardio", "Classes", "Calisthenics", "Other"].contains(pref) {
                                    Button(action: {
                                        withAnimation {
                                            preferences.removeAll { $0 == pref }
                                            selectedPreferences.remove(pref)
                                        }
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }

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

                    NavigationLink(destination: Screen5(), isActive: $navigateToScreen5) {
                        HStack(spacing: 4) {
                            Text("Next")
                            Image(systemName: "chevron.right")
                        }
                    }
                    .onTapGesture {
                        navigateToScreen5 = true
                    }
                    .disabled(selectedGoals.isEmpty && selectedPreferences.isEmpty)
                }
                .padding()
            }

            // Custom modal sheet
            if showingGoalModal || showingPrefModal {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("Other")
                        .font(.headline)

                    TextField("Type here...", text: $customInputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(lightGray)
                        .cornerRadius(10)
                        .focused($isTextFieldFocused)

                    HStack {
                        Button("Cancel") {
                            withAnimation {
                                showingGoalModal = false
                                showingPrefModal = false
                            }
                        }

                        Spacer()

                        Button("Add") {
                            let trimmed = customInputText.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !trimmed.isEmpty else { return }

                            if showingGoalModal {
                                goals.insert(trimmed, at: goals.count - 1)
                                selectedGoals.insert(trimmed)
                                showingGoalModal = false
                            } else {
                                preferences.insert(trimmed, at: preferences.count - 1)
                                selectedPreferences.insert(trimmed)
                                showingPrefModal = false
                            }
                        }
                        .foregroundColor(Main)
                    }
                    .padding(.horizontal)
                }
                .padding()
                .frame(maxWidth: 300)
                .background(white)
                .cornerRadius(16)
                .shadow(radius: 10)
                .padding()
                .transition(.scale)
                .onAppear {
                    withAnimation {
                        isTextFieldFocused = true
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    // Utility
    func toggleSelection(_ item: String, in set: inout Set<String>) {
        if set.contains(item) {
            set.remove(item)
        } else {
            set.insert(item)
        }
    }
}


#Preview {
    Screen4()
}
