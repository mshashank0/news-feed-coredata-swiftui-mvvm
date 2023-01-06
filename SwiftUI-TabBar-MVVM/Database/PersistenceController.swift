//
//  PersistenceController.swift
//  SwiftUI-TabBar-MVVM
//
//  Created by Shashank Mishra on 04/01/23.
//

import CoreData

class PersistenceController {
    
    //Sigleton to use it anywhere and not create multiple instances
    static let shared = PersistenceController()
    
    //Storage for coredata
    let container: NSPersistentContainer
    
    init() {
      container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { storeDecription, error in
            if let error = error as NSError? {
                fatalError("container load failed \(error)")
            }
        }
    }
}

