//
//  NewsArticleView.swift
//  StocksApp
//
//  Created by Elman Asadi on 9/1/21.
//

import SwiftUI
import Kingfisher

struct NewsArticleView: View {
    
    let newsArticles : [NewsArticleViewModel]
    let onDragBeggin : (DragGesture.Value) -> Void
    let onDragEnd : (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
                
                VStack (alignment: .leading) {
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    
                    Text("From Apple News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                    
                }
                Spacer()
                
            }.contentShape(Rectangle())
            .gesture(DragGesture()
                        .onChanged(self.onDragBeggin)
                        .onEnded(self.onDragEnd))
            
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .font(.custom("Arial", size: 22))
                                    .foregroundColor(Color.white)
                            }
                            
                            Spacer()
                            
                            KFImage(URL(string: article.imageURL)!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .padding(5)
                            
                        }
                    }
                }.frame(maxWidth: .infinity)
                .padding()
            }
            
            
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27 / 255, green: 25 / 255, blue: 30 / 255))
        .cornerRadius(20)
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", imageURL: "sxfdsd", publication: "The WallStreet Journal")
        
        NewsArticleView(newsArticles: [NewsArticleViewModel(article: article)], onDragBeggin: {_ in}, onDragEnd: {_ in})
    }
}
