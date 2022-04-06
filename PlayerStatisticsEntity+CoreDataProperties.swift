//
//  PlayerStatisticsEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//

import CoreData
import Foundation

extension PlayerStatisticsEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerStatisticsEntity>
    {
        return NSFetchRequest<PlayerStatisticsEntity>(entityName: "PlayerStatisticsEntity")
    }

    @NSManaged public var gamesPlayed: Int16
    @NSManaged public var goals: Int16
    @NSManaged public var assists: Int16
    @NSManaged public var points: Int16
    @NSManaged public var hatTricks: Int16
    @NSManaged public var powerPlayGoals: Int16
    @NSManaged public var powerPlayAssists: Int16
    @NSManaged public var powerPlayPoints: Int16
    @NSManaged public var shortHandedGoals: Int16
    @NSManaged public var shortHandedAssists: Int16
    @NSManaged public var shortHandedPoints: Int16
    @NSManaged public var gameWinningGoals: Int16
    @NSManaged public var gameTyingGoals: Int16
    @NSManaged public var penalties: Int16
    @NSManaged public var penaltyMinutes: Int16
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var plusMinus: Int16
    @NSManaged public var shots: Int16
    @NSManaged public var faceOffs: Int16
    @NSManaged public var shotPercentage: Double
    @NSManaged public var blockedShots: Int16
    @NSManaged public var hits: Int16
    @NSManaged public var faceOffWins: Int16
    @NSManaged public var faceOffLosses: Int16
    @NSManaged public var faceOffPercent: Double
    @NSManaged public var wins: Int16
    @NSManaged public var losses: Int16
    @NSManaged public var overtimeWins: Int16
    @NSManaged public var overtimeLosses: Int16
    @NSManaged public var goalsAgainst: Int16
    @NSManaged public var shotsAgainst: Int16
    @NSManaged public var saves: Int16
    @NSManaged public var goalsAgainstAverage: Double
    @NSManaged public var savePercentage: Double
    @NSManaged public var shutouts: Int16
    @NSManaged public var gamesStarted: Int16
    @NSManaged public var creditForGame: Int16
    @NSManaged public var minutesPlayed: Int16
    @NSManaged public var player: PlayerEntity?
    
    public var wrappedLastUpdated: Date
    {
        lastUpdated ?? Date()
    }
    
    public var wrappedDateCreated: Date
    {
        dateCreated ?? Date()
    }
}

extension PlayerStatisticsEntity: Identifiable
{
}
