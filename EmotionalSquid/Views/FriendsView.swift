//
//  SocialView.swift
//  EmotionalSquid
//
//  Created by Noah Boyers on 2/7/22.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Friends")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Divider()
                Text("Search Bar").padding()
                HStack {
                    Text("Add a new Friend")
                    Image(systemName: "arrow.right")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 50.0, height: 30.0)
                }
                HStack {
                    Image(systemName: "checkmark")
                    Text("Pending").padding()
                }
                HStack {
                    Image(systemName: "person.fill.checkmark")
                    Text("Joe Smith")
                }
                Divider()
                Text("Squddies").padding()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(0..<10) { count in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.teal)
                                Text("User \(count)")
                            }
                        }
                    }
                }
                
                Spacer()
                
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
