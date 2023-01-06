//
//  FavouriteView.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import SwiftUI
import CoreData

struct FavouriteView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: NewsFeed.entity(), sortDescriptors: [])
    
    private var feeds: FetchedResults<NewsFeed>
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(feeds) { feed in
                        Text(feed.title ?? "NA")
                    }
                }
            }
        }
        
    }
    
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
