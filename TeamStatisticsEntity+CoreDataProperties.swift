//
//  TeamStatisticsEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//

import CoreData
import Foundation

extension TeamStatisticsEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamStatisticsEntity>
    {
        return NSFetchRequest<TeamStatisticsEntity>(entityName: "TeamStatisticsEntity")
    }

    @NSManaged public var abbreviation: String?
    @NSManaged public var gamesPlayed: Int16
    @NSManaged public var wins: Int16
    @NSManaged public var losses: Int16
    @NSManaged public var overtimeWins: Int16
    @NSManaged public var overtimeLosses: Int16
    @NSManaged public var points: Int16
    @NSManaged public var powerPlays: Int16
    @NSManaged public var powerPlayGoals: Int16
    @NSManaged public var powerPlayPercent: Double
    @NSManaged public var penaltyKills: Int16
    @NSManaged public var penaltyKillGoalsAllowed: Int16
    @NSManaged public var penaltyKillPercent: Double
    @NSManaged public var goalsFor: Int16
    @NSManaged public var goalsAgainst: Int16
    @NSManaged public var shots: Int16
    @NSManaged public var penalties: Int16
    @NSManaged public var penaltyMinutes: Int16
    @NSManaged public var hits: Int16
    @NSManaged public var faceOffWins: Int16
    @NSManaged public var faceOffLosses: Int16
    @NSManaged public var faceOffPercent: Double
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var team: TeamEntity?
    
    public var wrappedAbbreviation: String
    {
        abbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedLastUpdated: Date
    {
        lastUpdated ?? Date()
    }
    
    public var wrappedDateCreated: Date
    {
        dateCreated ?? Date()
    }
}

extension TeamStatisticsEntity: Identifiable
{
}
