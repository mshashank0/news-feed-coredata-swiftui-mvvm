//
//  SwiftUI_TabBar_MVVMApp.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 03/01/23.
//

import SwiftUI

@main
struct SwiftUI_TabBar_MVVMApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabbarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
