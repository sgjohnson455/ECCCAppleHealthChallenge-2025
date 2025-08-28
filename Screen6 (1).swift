import SwiftUI

struct Screen6: View {
    
    // MARK: - Colors
    @State private var casualMain = Color(red: 0.26, green: 0.47, blue: 0.15)
    @State private var grey = Color(red: 0.85, green: 0.85, blue: 0.85)
    
    // MARK: - State
    @State private var selectedLanguages: Set<String> = []
    @State private var showOtherField = false
    @State private var otherLanguageInput = ""
    
    @Environment(\.dismiss) var dismiss
    @State private var navigateToDashboard = false
    
    let languageOptions = ["English", "Spanish", "Arabic", "Hindi", "Other"]
    
    var body: some View {
        VStack {
            ScrollView {
                // Progress bar
                HStack(spacing: 8) {
                    ForEach(0..<6) { _ in
                        Rectangle()
                            .frame(width: 40, height: 3)
                            .foregroundColor(casualMain)
                    }
                }
                .padding(.top)
                
                
                
                // Question Text
                VStack(spacing: 6) {
                    
                    Text("Question 6")
                            .font(.system(size: 12))
                            .multilineTextAlignment(.leading)

                    
                    Text("What are your language preferences?")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text("More than one option is possible.")
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.gray)
                        .padding(40)
                }
                .padding(.top, 40)
                
                // Language Options (vertical layout)
                VStack(spacing: 12) {
                    ForEach(languageOptions, id: \.self) { lang in
                        Button(action: {
                            if lang == "Other" {
                                showOtherField.toggle()
                                otherLanguageInput = ""
                            } else {
                                toggleLanguage(lang)
                            }
                        }) {
                            Text(lang)
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(selectedLanguages.contains(lang) ? casualMain : grey)
                                )
                                .foregroundColor(selectedLanguages.contains(lang) ? .white : .black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        .padding(.horizontal, 50)
                    }
                    
                    // Show custom-added languages
                    ForEach(customLanguages(), id: \.self) { customLang in
                        Button(action: {
                            toggleLanguage(customLang)
                        }) {
                            Text(customLang)
                                .font(.body)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(selectedLanguages.contains(customLang) ? casualMain : grey)
                                )
                                .foregroundColor(selectedLanguages.contains(customLang) ? .white : .black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        .padding(.horizontal, 50)
                    }
                }
                .padding(.top)
                
                // Other language input
                if showOtherField {
                    VStack(spacing: 12) {
                        Text("Enter other language:")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        HStack {
                            TextField("Type here...", text: $otherLanguageInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Button(action: {
                                let trimmed = otherLanguageInput.trimmingCharacters(in: .whitespaces)
                                guard !trimmed.isEmpty else { return }
                                selectedLanguages.insert(trimmed)
                                otherLanguageInput = ""
                                showOtherField = false
                            }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(casualMain)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                    .animation(.easeInOut, value: showOtherField)
                }
            }
            
            Spacer()
            
            // Navigation Buttons
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
                
                NavigationLink(destination: TabBar(), isActive: $navigateToDashboard) {
                    HStack(spacing: 4) {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                }
                .foregroundColor(.gray)
                .onTapGesture {
                    navigateToDashboard = true
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    // MARK: - Helpers
    func toggleLanguage(_ lang: String) {
        if selectedLanguages.contains(lang) {
            selectedLanguages.remove(lang)
        } else {
            selectedLanguages.insert(lang)
        }
    }
    
    func customLanguages() -> [String] {
        return selectedLanguages.filter { !languageOptions.contains($0) }
    }
}

#Preview {
    Screen6()
}
