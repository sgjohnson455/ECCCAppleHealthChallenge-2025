//
//  ForumStructures.swift
//  CommunityForum
//
//  Created by Allison Camila Diaz on 7/13/25.
//

import SwiftUI

// PostStore
class PostStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        self.posts = [
            Post(
                title: "Need a beginner buddy",
                body: "I'm looking for someone to join me 2x a week.",
                username: "casualSam",
                likes: 3,
                tags: ["casual"],
                isMine: false,
                category: "casual",
                date: Date(),
                comments: []
            ),
            Post(
                title: "Morning runs",
                body: "Anyone interested in 6AM jogs?",
                username: "runCat",
                likes: 2,
                tags: ["casual"],
                isMine: false,
                category: "casual",
                date: Date(),
                comments: []
            ),
            Post(
                title: "Stretch & Chill",
                body: "Casual stretching sessions on weekends!",
                username: "banana1",
                likes: 1,
                tags: ["casual"],
                isMine: false,
                category: "casual",
                date: Date(),
                comments: []
            ),
            Post(
                title: "Hardcore lifting group",
                body: "We go heavy. Join us.",
                username: "beastMode",
                likes: 15,
                tags: ["competitive"],
                isMine: false,
                category: "competitive",
                date: Date(),
                comments: []
            ),
            Post(
                title: "CrossFit Challenges",
                body: "Looking for competition!",
                username: "fitPro",
                likes: 9,
                tags: ["competitive"],
                isMine: false,
                category: "competitive",
                date: Date(),
                comments: []
            ),
            Post(
                title: "HIIT until failure",
                body: "No pain, no gain.",
                username: "ironWolf",
                likes: 20,
                tags: ["competitive"],
                isMine: false,
                category: "competitive",
                date: Date(),
                comments: []
            )
        ]
    }

    func addPost(_ post: Post) {
        posts.append(post)
    }

    func likePost(postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].likes += 1
        }
    }

    func addComment(_ comment: Comment, to postID: UUID) {
        if let index = posts.firstIndex(where: { $0.id == postID }) {
            posts[index].comments.append(comment)
        }
    }
}



// Posts //////////////////////////////////////
struct Post: Identifiable {
    let id = UUID()
    var title: String
    var body: String
    var username: String
    var likes: Int = 0
    var tags: [String]
    var isMine: Bool
    var category: String
    var date: Date
    var comments: [Comment]
}

// Create Post View
struct CreatePostView: View {
    @EnvironmentObject var postStore: PostStore
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var postBody = ""
    @State private var tagsText = ""
    @State private var category = "casual"
    
    let categories = ["casual", "competitive"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(category == "casual" ? Color.casualMain : Color.compMain)
                .ignoresSafeArea()
            VStack {
                // Stationary Back Button
                Button(action: {dismiss()}) {
                    HStack{
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .font(.title3)
                        }
                        .foregroundColor(.white)
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                //Content
                NavigationStack {
                    // Changes the nav stack background to green
                    ZStack {
                        Rectangle()
                            .foregroundStyle(category == "casual" ? Color.casualMain : Color.compMain)
                        VStack (alignment: .leading){
                            Text("Create Post")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 10)
                                .padding(.horizontal)
                            ZStack {
                                Rectangle()
                                    .fill(category == "casual" ? Color.casualTint : Color.compTint)
                                    .cornerRadius(21)
                                //VStack {
                                Form {
                                    Section(header: Text("Title")) {
                                        TextField("Enter title", text: $title)
                                    }
                                    .listRowBackground(Color.white)
                                    Section(header: Text("Body")) {
                                        TextEditor(text: $postBody)
                                            .frame(height: 120)
                                    }
                                    .listRowBackground(Color.white)
                                    Section(header: Text("Tags (comma separated)")) {
                                        TextField("e.g. fitness, lifting", text: $tagsText)
                                    }
                                    .listRowBackground(Color.white)
                                    Section(header: Text("Category")) {
                                        Picker("Category", selection: $category) {
                                            ForEach(categories, id: \.self) { cat in
                                                Text(cat.capitalized)
                                            }
                                        }
                                        .pickerStyle(SegmentedPickerStyle())
                                    }
                                    .listRowBackground(category == "casual" ? Color.casualTint : Color.compTint)
                                    
                                    Button(action: {
                                        let tags = tagsText.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }

                                        let newPost = Post(
                                            title: title,
                                            body: postBody,
                                            username: "admira6",
                                            likes: 0,
                                            tags: tags,
                                            isMine: true,
                                            category: category,
                                            date: Date(),
                                            comments: []
                                        )

                                        postStore.addPost(newPost)
                                        dismiss()
                                    }) {
                                        ZStack {
                                            Rectangle()
                                                .background(category == "casual" ? ((title.isEmpty || postBody.isEmpty) ? Color.casualTint : Color.casualMain) : ((title.isEmpty || postBody.isEmpty) ? Color.compTint : Color.compMain))
                                                .cornerRadius(21)
                                            
                                            HStack {
                                                Text("Create Post")
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                    .frame(maxWidth: .infinity)
                                                Image(systemName: "paperplane.fill")
                                                    .foregroundStyle(.white)
                                            }
                                            .padding(10)
                                        }
                                    }
                                    .disabled(title.isEmpty || postBody.isEmpty)
                                    .foregroundStyle(category == "casual" ? ((title.isEmpty || postBody.isEmpty) ? Color.casualTint : Color.casualMain) : ((title.isEmpty || postBody.isEmpty) ? Color.compTint : Color.compMain))
                                    
                                }
                                .scrollContentBackground(.hidden)
                                .foregroundStyle(Color.black)
                                
                            }
                            .padding(.horizontal)
                        }
                        .background(category == "casual" ? Color.casualMain : Color.compMain)
                    }
                    .ignoresSafeArea(edges: .top)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .foregroundStyle(Color.black)
            }
            
        }
    }
}

// Post Detailed View
struct PostDetailView: View {
    @EnvironmentObject var postStore: PostStore
    @Environment(\.dismiss) var dismiss
    
    let post: Post
    
    @State private var newCommentText = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.casualMain)
                .ignoresSafeArea()
            
            VStack {
                // Stationary Back Button
                Button(action: {dismiss()}) {
                    HStack{
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .font(.title3)
                        }
                        .foregroundColor(.white)
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                
                // Content
                ScrollView {
                    ZStack {
                        
                        // Background Color
                        RoundedRectangle(cornerRadius: 21)
                            .fill(.white)
                        
                        // Content
                        VStack(alignment: .leading, spacing: 12) {
                            //  Header
                            HStack {
                                Text(post.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                Text(post.date, style: .date)
                                    .font(.headline)
                                    .foregroundColor(Color.casualMain)
                            }
                            Text(post.username)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.casualMain)
                            Text(post.body)
                                .font(.body)
                            
                            // Tags
                            if !post.tags.isEmpty {
                                HStack {
                                    ForEach(post.tags, id: \.self) { tag in
                                        Text("#\(tag)")
                                            .font(.body)
                                            .padding(5)
                                            .foregroundStyle(.white)
                                            .background(Color.casualMain)
                                            .cornerRadius(6)
                                    }
                                }
                            }
                            
                            // Like and Comment Count
                            HStack {
                                Button(action: {
                                    if let index = postStore.posts.firstIndex(where: {$0.id == post.id }) {
                                        postStore.posts[index].likes += 1
                                    }
                                }) {
                                    HStack {
                                        Image(systemName: "heart.fill")
                                        Text("\(post.likes)")
                                    }
                                    .font(.system(size: 24))
                                }
                                HStack {
                                    Image(systemName: "ellipsis.message")
                                    Text("\(post.comments.count)")
                                }
                                .font(.system(size: 24))
                            }
                            .font(.caption)
                            .foregroundColor(.black)
                            
                            Divider()
                            
                            // Comments
                            Text("Comments")
                                .font(.title3)
                            
                            if post.comments.isEmpty {
                                Text("Be the first to comment!")
                                    .foregroundColor(.black)
                                    .italic()
                            } else {
                                ForEach(post.comments) { comment in
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(comment.username)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Text(comment.content)
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                            
                            Divider()
                            
                            // Add Comment
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Add a Comment:")
                                    .font(.title3)
                                // HStack {
                                TextField("Write something...", text: $newCommentText)
                                    .foregroundStyle(Color.casualTint)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            
                            Button(action: {
                                guard !newCommentText.isEmpty else { return }
                                
                                let comment = Comment(username: "admira6", content: newCommentText)
                                postStore.addComment(comment, to: post.id)
                                newCommentText = ""
                            }) {
                                ZStack {
                                    Rectangle()
                                        .background(newCommentText.isEmpty ? Color.casualTint : Color.casualMain)
                                        .cornerRadius(12)
                                    
                                    HStack {
                                        Text("Create Post")
                                            .foregroundStyle(.white)
                                        Spacer()
                                            .frame(maxWidth: .infinity)
                                        Image(systemName: "paperplane.fill")
                                            .foregroundStyle(.white)
                                    }
                                    .padding()
                                }
                                
                                
                            }
                            .disabled(newCommentText.isEmpty)
                            .foregroundStyle(newCommentText.isEmpty ? Color.casualTint : Color.casualMain)
                        }
                        .padding(20)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}



// Comments //////////////////////////
struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let content: String
    let date = Date()
}



// Displays Poststore as View
struct MyApp: App {
    @StateObject private var store = PostStore()

    var body: some Scene {
        WindowGroup {
            ComForum()
                .environmentObject(store)
        }
    }
}
