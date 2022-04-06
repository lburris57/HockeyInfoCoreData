//
//  TeamStandings.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the TeamStandingsEntity database class
struct TeamStandings: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let teamStandingsEntity: TeamStandingsEntity
    
    var id: NSManagedObjectID
    {
        return teamStandingsEntity.objectID
    }
    
    var abbreviation: String
    {
        return teamStandingsEntity.wrappedAbbreviation
    }
    
    var conference: String
    {
        return teamStandingsEntity.wrappedConference
    }
    
    var conferenceRank: Int16
    {
        return teamStandingsEntity.conferenceRank
    }
    
    var division: String
    {
        return teamStandingsEntity.wrappedDivision
    }
    
    var divisionRank: Int16
    {
        return teamStandingsEntity.divisionRank
    }
    
    var gamesPlayed: Int16
    {
        return teamStandingsEntity.gamesPlayed
    }
    
    var wins: Int16
    {
        return teamStandingsEntity.wins
    }
    
    var losses: Int16
    {
        return teamStandingsEntity.losses
    }
    
    var overtimeLosses: Int16
    {
        return teamStandingsEntity.overtimeLosses
    }
    
    var points: Int16
    {
        return teamStandingsEntity.points
    }
    
    var lastUpdated: Date
    {
        return teamStandingsEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return teamStandingsEntity.wrappedDateCreated
    }
    
    var team: TeamEntity
    {
        return teamStandingsEntity.team ?? TeamEntity(context: context)
    }
}
