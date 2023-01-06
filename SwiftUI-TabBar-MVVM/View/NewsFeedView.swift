//
//  NewsView.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import SwiftUI

struct NewsFeedView: View {
    
    @ObservedObject private var viewModel = NewsFeedViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: NewsFeed.entity(), sortDescriptors: [])
    
    private var favFeeds: FetchedResults<NewsFeed>
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.newsFeed?.hits ?? []) { feed in
                        HStack {
                            Text(feed.title)
                            Spacer()
                            Button {
                                addFavorite(feed)
                            } label: {
                                Image(systemName: "star")
                            }
                        }
                    }
                }
            }
            .onAppear(){
                viewModel.getNewsFeed()
            }
            .navigationTitle("News Feed")
        }
    }
    
    private func addFavorite(_ feedHit: Hit) {
           
           withAnimation {
               let feed = NewsFeed(context: viewContext)
               print(feedHit.objectID)
               feed.objectId = feedHit.objectID
               feed.id = UUID()
               feed.title = feedHit.title
               feed.url = feedHit.url
               feed.isFavourite = true
               
               saveContext()
           }
       }
       
       private func saveContext() {
           do {
               try viewContext.save()
           } catch {
               let error = error as NSError
               fatalError("An error occured: \(error)")
           }
       }

}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
