//
//  ScheduledGame.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the ScheduleEntity database class
struct ScheduledGame: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let scheduleEntity: ScheduleEntity
    
    var id: NSManagedObjectID
    {
        return scheduleEntity.objectID
    }
    
    var gameId: Int16
    {
        return scheduleEntity.gameId
    }
    
    var date: String
    {
        return scheduleEntity.wrappedDate
    }
    
    var time: String
    {
        return scheduleEntity.wrappedTime
    }
    
    var homeTeam: String
    {
        return scheduleEntity.wrappedHomeTeam
    }
    
    var awayTeam: String
    {
        return scheduleEntity.wrappedAwayTeam
    }
    
    var venue: String
    {
        return scheduleEntity.wrappedVenue
    }
    
    var playedStatus: String
    {
        return scheduleEntity.wrappedPlayedStatus
    }
    
    var homeScoreTotal: Int16
    {
        return scheduleEntity.homeScoreTotal
    }
    
    var awayScoreTotal: Int16
    {
        return scheduleEntity.awayScoreTotal
    }
    
    var numberOfPeriods: Int16
    {
        return scheduleEntity.numberOfPeriods
    }
    
    var homeShotsTotal: Int16
    {
        return scheduleEntity.homeShotsTotal
    }
    
    var awayShotsTotal: Int16
    {
        return scheduleEntity.awayShotsTotal
    }
    
    var scheduleStatus: String
    {
        return scheduleEntity.wrappedScheduleStatus
    }
    
    var currentTimeRemaining: Int16
    {
        return scheduleEntity.currentTimeRemaining
    }
    
    var currentPeriod: Int16
    {
        return scheduleEntity.currentPeriod
    }
    
    var lastUpdated: Date
    {
        return scheduleEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return scheduleEntity.wrappedDateCreated
    }
    
    var team: TeamEntity
    {
        return scheduleEntity.team ?? TeamEntity(context: context)
    }
    
    var teamVenue: Venue?
    {
        let venues = Venue.allVenues()
        
        for venue in venues
        {
            if venue.imageName == team.wrappedAbbreviation
            {
                return venue
            }
        }
        
        return nil
    }
}

