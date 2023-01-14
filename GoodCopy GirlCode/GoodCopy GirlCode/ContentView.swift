//
//  ContentView.swift
//  GoodCopy GirlCode
//
//  Created by Hannah Baek on 2023-01-14.
//

import SwiftUI

struct Post: Identifiable {
    
    let id = UUID()
    let keyWords: [String]
    let image: String
    
}

struct ContentView: View {
    @State var searchText = ""
    
    let posts = [
        Post(keyWords: ["The Melina™ Pant", "Agency Blazer"], image: "melina1"),
        Post(keyWords: ["Sculpt Knit Squareneck Cropped Tank"], image: "sculpt1"),
        Post(keyWords: ["The Melina™ Pant"], image: "melina2"),
        Post(keyWords: ["Sculpt Knit Squareneck Cropped Tank"], image: "sculpt2"),
        Post(keyWords: ["Divinity 7' Romper", "Agency Blazer"], image: "divinity5"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity6"),
        Post(keyWords: ["The Melina™ Pant"], image: "melina3"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity7"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity8"),
        Post(keyWords: ["The Melina™ Pant"], image: "melina5"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity9"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity1"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity2"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity3"),
        Post(keyWords: ["Divinity 7' Romper"], image: "divinity4"),
        Post(keyWords: ["The Melina™ Pant"], image: "melina4"),
        Post(keyWords: ["Sculpt Knit Squareneck Cropped Tank"], image: "sculpt3")]
    
    let spacing: CGFloat = 10
    @State private var numberOfRows = 3
    
    var body: some View {
        
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows)
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing){
                ForEach(posts){ post in PostView(post: post)
                    
                }
            }
            .padding(.horizontal)
            
        }
        .background(Color.white)
       
    }
}


struct PostView: View {
    
    let post: Post
    
    var body: some View {
        GeometryReader{ reader in
            VStack(spacing: 5) {
                Image(post.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Color.white)
        }
        .frame(height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
