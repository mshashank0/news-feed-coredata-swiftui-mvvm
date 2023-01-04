//
//  NewsView.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import SwiftUI

struct NewsFeedView: View {
    
    @ObservedObject private var viewModel = NewsFeedViewModel()
    
    @State var isFavourite : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.newsFeed?.hits ?? []) { feed in
                        HStack {
                            Text(feed.title)
                            Spacer()
                            Button {
                                isFavourite.toggle()
                            } label: {
                                isFavourite ?
                                Image(systemName: "star.fill") :
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
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
