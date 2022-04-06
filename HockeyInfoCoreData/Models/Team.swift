//
//  Team.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the TeamEntity database class
struct Team: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let teamEntity: TeamEntity
    
    var id: NSManagedObjectID
    {
        return teamEntity.objectID
    }
    
    var teamId: Int16
    {
        return teamEntity.teamId
    }
    
    var abbreviation: String
    {
        return teamEntity.wrappedAbbreviation
    }
    
    var city: String
    {
        return teamEntity.wrappedCity
    }
    
    var name: String
    {
        return teamEntity.wrappedName
    }
    
    var division: String
    {
        return teamEntity.wrappedDivision
    }
    
    var conference: String
    {
        return teamEntity.wrappedConference
    }
    
    var lastUpdated: Date
    {
        return teamEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return teamEntity.wrappedDateCreated
    }
    
    var standings: TeamStandingsEntity
    {
        return teamEntity.standings ?? TeamStandingsEntity(context: context)
    }
    
    var statistics: TeamStatisticsEntity
    {
        return teamEntity.statistics ?? TeamStatisticsEntity(context: context)
    }
    
    var players: [PlayerEntity]
    {
        return teamEntity.playersArray
    }
    
    var games: [ScheduleEntity]
    {
        return teamEntity.gamesArray
    }
    
    var playerInjuries: [PlayerInjuryEntity]
    {
        return teamEntity.playerInjuriesArray
    }
    
    var gameLogs: [GameLogEntity]
    {
        return teamEntity.gameLogsArray
    }
}
