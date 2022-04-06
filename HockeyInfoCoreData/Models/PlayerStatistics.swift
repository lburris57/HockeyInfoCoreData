//
//  PlayerStatistics.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the PlayerStatistics database class
struct PlayerStatistics: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let playerStatisticsEntity: PlayerStatisticsEntity
    
    var id: NSManagedObjectID
    {
        return playerStatisticsEntity.objectID
    }
    
    var gamesPlayed: Int16
    {
        return playerStatisticsEntity.gamesPlayed
    }
    
    var goals: Int16
    {
        return playerStatisticsEntity.goals
    }
    
    var assists: Int16
    {
        return playerStatisticsEntity.assists
    }
    
    var points: Int16
    {
        return playerStatisticsEntity.points
    }
    
    var hatTricks: Int16
    {
        return playerStatisticsEntity.hatTricks
    }
    
    var powerPlayGoals: Int16
    {
        return playerStatisticsEntity.powerPlayGoals
    }
    
    var powerPlayAssists: Int16
    {
        return playerStatisticsEntity.powerPlayAssists
    }
    
    var powerPlayPoints: Int16
    {
        return playerStatisticsEntity.powerPlayPoints
    }
    
    var shortHandedGoals: Int16
    {
        return playerStatisticsEntity.shortHandedGoals
    }
    
    var shortHandedAssists: Int16
    {
        return playerStatisticsEntity.shortHandedAssists
    }
    
    var shortHandedPoints: Int16
    {
        return playerStatisticsEntity.shortHandedPoints
    }
    
    var gameWinningGoals: Int16
    {
        return playerStatisticsEntity.gameWinningGoals
    }
    
    var gameTyingGoals: Int16
    {
        return playerStatisticsEntity.powerPlayAssists
    }
    
    var penalties: Int16
    {
        return playerStatisticsEntity.penalties
    }
    
    var penaltyMinutes: Int16
    {
        return playerStatisticsEntity.penaltyMinutes
    }
    
    var lastUpdated: Date
    {
        return playerStatisticsEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return playerStatisticsEntity.wrappedDateCreated
    }
    
    var plusMinus: Int16
    {
        return playerStatisticsEntity.plusMinus
    }
    
    var shots: Int16
    {
        return playerStatisticsEntity.shots
    }
    
    var faceOffs: Int16
    {
        return playerStatisticsEntity.faceOffs
    }
    
    var shotPercentage: Double
    {
        return playerStatisticsEntity.shotPercentage
    }
    
    var blockedShots: Int16
    {
        return playerStatisticsEntity.blockedShots
    }
    
    var hits: Int16
    {
        return playerStatisticsEntity.hits
    }
    
    var faceOffWins: Int16
    {
        return playerStatisticsEntity.faceOffWins
    }
    
    var faceOffLosses: Int16
    {
        return playerStatisticsEntity.faceOffLosses
    }
    
    var faceOffPercent: Double
    {
        return playerStatisticsEntity.faceOffPercent
    }
    
    var wins: Int16
    {
        return playerStatisticsEntity.wins
    }
    
    var losses: Int16
    {
        return playerStatisticsEntity.losses
    }
    
    var overtimeWins: Int16
    {
        return playerStatisticsEntity.overtimeWins
    }
    
    var overtimeLosses: Int16
    {
        return playerStatisticsEntity.overtimeLosses
    }
    
    var goalsAgainst: Int16
    {
        return playerStatisticsEntity.goalsAgainst
    }
    
    var shotsAgainst: Int16
    {
        return playerStatisticsEntity.shotsAgainst
    }
    
    var saves: Int16
    {
        return playerStatisticsEntity.saves
    }
    
    var goalsAgainstAverage: Double
    {
        return playerStatisticsEntity.goalsAgainstAverage
    }
    
    var savePercentage: Double
    {
        return playerStatisticsEntity.savePercentage
    }
    
    var shutouts: Int16
    {
        return playerStatisticsEntity.shutouts
    }
    
    var gamesStarted: Int16
    {
        return playerStatisticsEntity.gamesStarted
    }
    
    var creditForGame: Int16
    {
        return playerStatisticsEntity.creditForGame
    }
    
    var minutesPlayed: Int16
    {
        return playerStatisticsEntity.minutesPlayed
    }
    
    var player: PlayerEntity
    {
        return playerStatisticsEntity.player ?? PlayerEntity(context: context)
    }
}
