//
//  GameLog.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the GameLog database class
struct GameLog: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let gameLogEntity: GameLogEntity
    
    var id: NSManagedObjectID
    {
        return gameLogEntity.objectID
    }
    
    var gameId: Int16
    {
        return gameLogEntity.gameId
    }
    
    var date: String
    {
        return gameLogEntity.wrappedDate
    }
    
    var time: String
    {
        return gameLogEntity.wrappedTime
    }
    
    var playedStatus: String
    {
        return gameLogEntity.wrappedPlayedStatus
    }
    
    var homeTeamId: Int16
    {
        return gameLogEntity.homeTeamId
    }
    
    var homeTeamAbbreviation: String
    {
        return gameLogEntity.wrappedHomeTeamAbbreviation
    }
    
    var homeWins: Int16
    {
        return gameLogEntity.homeWins
    }
    
    var homeLosses: Int16
    {
        return gameLogEntity.homeLosses
    }
    
    var homeOvertimeWns: Int16
    {
        return gameLogEntity.homeOvertimeWns
    }
    
    var homeOvertimeLosses: Int16
    {
        return gameLogEntity.homeOvertimeLosses
    }
    
    var homePoints: Int16
    {
        return gameLogEntity.homePoints
    }
    
    var homeFaceOffWins: Int16
    {
        return gameLogEntity.homeFaceOffWins
    }
    
    var homeFaceOffLosses: Int16
    {
        return gameLogEntity.homeFaceOffLosses
    }
    
    var homeFaceOffPercent: Double
    {
        return gameLogEntity.homeFaceOffPercent
    }
    
    var homePowerPlays: Int16
    {
        return gameLogEntity.homePowerPlays
    }
    
    var homePowerPlayGoals: Int16
    {
        return gameLogEntity.homePowerPlayGoals
    }
    
    var homePowerPlayPercent: Double
    {
        return gameLogEntity.homePowerPlayPercent
    }
    
    var homePenaltyKills: Int16
    {
        return gameLogEntity.homePenaltyKills
    }
    
    var homePenaltyKillGoalsAllowed: Int16
    {
        return gameLogEntity.homePenaltyKillGoalsAllowed
    }
    
    var homePenaltyKillPercent: Double
    {
        return gameLogEntity.homePenaltyKillPercent
    }
    
    var homeGoalsFor: Int16
    {
        return gameLogEntity.homeGoalsFor
    }
    
    var homeGoalsAgainst: Int16
    {
        return gameLogEntity.homeGoalsAgainst
    }
    
    var homeShots: Int16
    {
        return gameLogEntity.homePenalties
    }
    
    var homePenalties: Int16
    {
        return gameLogEntity.homePenalties
    }
    
    var homePenaltyMinutes: Int16
    {
        return gameLogEntity.homePenaltyMinutes
    }
    
    var homeHits: Int16
    {
        return gameLogEntity.homeHits
    }
    
    var awayTeamId: Int16
    {
        return gameLogEntity.awayTeamId
    }
    
    var awayTeamAbbreviation: String
    {
        return gameLogEntity.wrappedAwayTeamAbbreviation
    }
    
    var awayWins: Int16
    {
        return gameLogEntity.awayWins
    }
    
    var awayLosses: Int16
    {
        return gameLogEntity.awayLosses
    }
    
    var awayOvertimeWins: Int16
    {
        return gameLogEntity.awayOvertimeWins
    }
    
    var awayOvertimeLosses: Int16
    {
        return gameLogEntity.awayOvertimeLosses
    }
    
    var awayPoints: Int16
    {
        return gameLogEntity.awayPoints
    }
    
    var awayFaceOffWins: Int16
    {
        return gameLogEntity.awayFaceOffWins
    }
    
    var awayFaceOffLosses: Int16
    {
        return gameLogEntity.awayFaceOffLosses
    }
    
    var awayFaceOffPercent: Double
    {
        return gameLogEntity.awayFaceOffPercent
    }
    
    var awayPowerPlays: Int16
    {
        return gameLogEntity.awayPowerPlays
    }
    
    var awayPowerPlayGoals: Int16
    {
        return gameLogEntity.awayPowerPlayGoals
    }
    
    var awayPowerPlayPercent: Double
    {
        return gameLogEntity.awayPowerPlayPercent
    }
    
    var awayPenaltyKills: Int16
    {
        return gameLogEntity.awayPenaltyKills
    }
    
    var awayPenaltyKillGoalsAllowed: Int16
    {
        return gameLogEntity.awayPenaltyKillGoalsAllowed
    }
    
    var awayPenaltyKillPercent: Double
    {
        return gameLogEntity.awayPenaltyKillPercent
    }
    
    var awayGoalsFor: Int16
    {
        return gameLogEntity.awayGoalsFor
    }
    
    var awayGoalsAgainst: Int16
    {
        return gameLogEntity.awayGoalsAgainst
    }
    
    var awayShots: Int16
    {
        return gameLogEntity.awayShots
    }
    
    var awayPenalties: Int16
    {
        return gameLogEntity.awayPenalties
    }
    
    var awayPenaltyMinutes: Int16
    {
        return gameLogEntity.awayPenaltyMinutes
    }
    
    var awayHits: Int16
    {
        return gameLogEntity.awayHits
    }
    
    var lastUpdated: Date
    {
        return gameLogEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return gameLogEntity.wrappedDateCreated
    }
    
    var team: TeamEntity
    {
        return gameLogEntity.team ?? TeamEntity(context: context)
    }
}
