//
//  TeamsViewModel.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/14/22.
//
import Foundation
import CoreData

class TeamsViewModel: ObservableObject
{
    @Published var teams = [TeamEntity]()
    
    let coreDataManager = CoreDataManager.shared
    
    func getAllTeams()
    {
        teams = DatabaseManager().retrieveAllTeams()
    }
}
