//
//  HockeyInfoCoreDataApp.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/11/22.
//
import SwiftUI

@main
struct HockeyInfoCoreDataApp: App
{
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene
    {
        WindowGroup
        {
            TeamTabView()
            .environment(\.managedObjectContext, persistentContainer.viewContext)
            .onAppear
            {
                // Disable the UIConstraint to fix bug in Apple's code
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
        }
    }
}
