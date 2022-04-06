//
//  TeamStatistics.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the TeamStatisticsEntity database class
struct TeamStatistics: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let teamStatisticsEntity: TeamStatisticsEntity
    
    var id: NSManagedObjectID
    {
        return teamStatisticsEntity.objectID
    }
    
    var abbreviation: String
    {
        return teamStatisticsEntity.wrappedAbbreviation
    }
    
    var gamesPlayed: Int16
    {
        return teamStatisticsEntity.gamesPlayed
    }
    
    var wins: Int16
    {
        return teamStatisticsEntity.wins
    }
    
    var losses: Int16
    {
        return teamStatisticsEntity.losses
    }
    
    var overtimeWins: Int16
    {
        return teamStatisticsEntity.overtimeWins
    }
    
    var overtimeLosses: Int16
    {
        return teamStatisticsEntity.overtimeLosses
    }
    
    var points: Int16
    {
        return teamStatisticsEntity.points
    }
    
    var powerPlays: Int16
    {
        return teamStatisticsEntity.powerPlays
    }
    
    var powerPlayGoals: Int16
    {
        return teamStatisticsEntity.powerPlayGoals
    }
    
    var powerPlayPercent: Double
    {
        return teamStatisticsEntity.powerPlayPercent
    }
    
    var penaltyKills: Int16
    {
        return teamStatisticsEntity.penaltyKills
    }
    
    var penaltyKillGoalsAllowed: Int16
    {
        return teamStatisticsEntity.penaltyKillGoalsAllowed
    }
    
    var penaltyKillPercent: Double
    {
        return teamStatisticsEntity.penaltyKillPercent
    }
    
    var goalsFor: Int16
    {
        return teamStatisticsEntity.goalsFor
    }
    
    var goalsAgainst: Int16
    {
        return teamStatisticsEntity.goalsAgainst
    }
    
    var shots: Int16
    {
        return teamStatisticsEntity.shots
    }
    
    var penaltyMinutes: Int16
    {
        return teamStatisticsEntity.penaltyMinutes
    }
    
    var penalties: Int16
    {
        return teamStatisticsEntity.penalties
    }
    
    var hits: Int16
    {
        return teamStatisticsEntity.hits
    }
    
    var faceOffWins: Int16
    {
        return teamStatisticsEntity.faceOffWins
    }
    
    var faceOffLosses: Int16
    {
        return teamStatisticsEntity.faceOffLosses
    }
    
    var faceOffPercent: Double
    {
        return teamStatisticsEntity.faceOffPercent
    }
    
    var lastUpdated: Date
    {
        return teamStatisticsEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return teamStatisticsEntity.wrappedDateCreated
    }
    
    var team: TeamEntity
    {
        return teamStatisticsEntity.team ?? TeamEntity(context: context)
    }
}
