//
//  FeedView.swift
//  CommunityForum
//
//  Created by Allison Camila Diaz on 7/13/25.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var postStore: PostStore
    @State private var searchText = ""
    @State private var selectedFilter: String = "All"
    @State var isCompetitiveMode = false
    
    var appBackground : Color = Color.casualMain
    
    let filters = ["All", "My Posts", "Popular"]
    
    // Filter Posts
    var filteredPosts: [Post] {
        var posts = postStore.posts
        posts = posts.filter { post in
            post.category == (isCompetitiveMode ? "competitive" : "casual") }
        
        // My Posts - Search for Posts tagged with User's Name
        if selectedFilter == "My Posts" {
            posts = posts.filter { $0.isMine }
            
        // Popular - Sort by number of likes
        } else if selectedFilter == "Popular" {
            posts = posts.sorted { $0.likes > $1.likes }
        }
        
        // Searchbar - Search titles and tags for relevance
        if !searchText.isEmpty {
            posts = posts.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.tags.contains(where: { $0.localizedCaseInsensitiveContains(searchText) })
            }
        }
        
        return posts
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(isCompetitiveMode == false ? Color.casualMain : Color.compMain)
                    .edgesIgnoringSafeArea(.all)
                    
                // Toggle with icons
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Community Feed")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        HStack {
                            //Spacer()
                            HStack {
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(.white)
                                Toggle("", isOn: $isCompetitiveMode)
                                    .labelsHidden()
                                    .tint(isCompetitiveMode == false ? Color.casualTint : Color.compTint)
                                    .background(Color.casualTint, in: Capsule())
                                
                                Image(systemName: "flame.fill")
                                    .foregroundColor(.white)
                            }
                            
                        }
                       
                    }
                    .padding(.bottom, -10)
                    
                    // Search bar
                    ZStack {
                        Rectangle()
                            .background(.white)
                            .foregroundStyle(.clear)
                            .frame(width: 365, height: 43)
                            .cornerRadius(100)
                            .offset(x:0, y:0)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .frame(width:24, height:24)
                            
                            TextField("Search...", text: $searchText)
                        }
                        .padding(.leading, 40)
                        
                    }
                    .padding(.bottom, 10)
                
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(filters, id: \.self) { filter in
                                Button(action: {
                                    selectedFilter = filter
                                }) {
                                    Text(filter)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(selectedFilter == filter ? (isCompetitiveMode ? Color.compTint : Color.casualTint) : Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(25)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.casualMain, lineWidth: selectedFilter == filter ? 0 : 1)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 5)
                    // Posts list
                    List(filteredPosts.reversed()) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(post.title)
                                        .font(.title2)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(post.date, style: .date)
                                        .font(.body)
                                        .padding(.top, -5)
                                        .foregroundStyle(isCompetitiveMode == false ? Color.casualMain : Color.compMain)
                                    Menu {
                                        Button(action: {
                                            // Block user action
                                        }) {
                                            Label("Block \"\(post.username)\"", systemImage: "person.fill.xmark")
                                        }

                                        Button(action: {
                                            // Hide post action
                                        }) {
                                            Label("Hide this post", systemImage: "eye.slash")
                                        }

                                        Button(action: {
                                            // Share action
                                        }) {
                                            Label("Share", systemImage: "square.and.arrow.up")
                                        }
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .rotationEffect(.degrees(90)) // optional: vertical dots
                                            .foregroundColor(.black)
                                            .padding(.leading, 3)
                                    }
                                }
                                Text(post.username).bold()
                                    .foregroundStyle(isCompetitiveMode == false ? Color.casualMain : Color.compMain)
                                Text(post.body)
                                    .foregroundColor(.black)
                                
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
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(12)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, -8)
                    .cornerRadius(12)
                    
                    // Create Post Button
                    NavigationLink(destination: CreatePostView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 353, height: 50)
                                .background(Color.white)
                                .cornerRadius(12)
                            HStack {
                                Text("Create Post")
                                Image(systemName: "plus")
                            }
                            .foregroundStyle(isCompetitiveMode == false ? Color.casualMain : Color.compMain)
                            .fontWeight(.semibold)
                        }
                        .padding(.leading, 20)
                        .padding(.top, 5)
                        
                    }
                    .padding(.bottom, 20)
                    
                    // Tab Bar
                    //TabBar()
                }
                .padding(.horizontal, 0)
            } // Includes background
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    
    
}

// Community Forum View

struct ComForum: View {
    var body: some View {
        FeedView()
    }
}

#Preview {
    ComForum()
        .environmentObject(UserData())
        .environmentObject(PostStore())
}

