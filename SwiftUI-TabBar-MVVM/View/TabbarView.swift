//
//  TabbarView.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 04/01/23.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            NewsFeedView()
                .tabItem {
                    Label("Feed", systemImage: "doc.plaintext")
                }
            
            FavouriteView()
                .tabItem {
                    Label("Favourite", systemImage: "star")
                }
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
