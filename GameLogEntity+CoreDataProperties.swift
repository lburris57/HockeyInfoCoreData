//
//  GameLogEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//

import CoreData
import Foundation

extension GameLogEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameLogEntity>
    {
        return NSFetchRequest<GameLogEntity>(entityName: "GameLogEntity")
    }

    @NSManaged public var gameId: Int16
    @NSManaged public var date: String?
    @NSManaged public var time: String?
    @NSManaged public var playedStatus: String?
    @NSManaged public var homeTeamId: Int16
    @NSManaged public var homeTeamAbbreviation: String?
    @NSManaged public var homeWins: Int16
    @NSManaged public var homeLosses: Int16
    @NSManaged public var homeOvertimeWns: Int16
    @NSManaged public var homeOvertimeLosses: Int16
    @NSManaged public var homePoints: Int16
    @NSManaged public var homeFaceOffWins: Int16
    @NSManaged public var homeFaceOffLosses: Int16
    @NSManaged public var homeFaceOffPercent: Double
    @NSManaged public var homePowerPlays: Int16
    @NSManaged public var homePowerPlayGoals: Int16
    @NSManaged public var homePowerPlayPercent: Double
    @NSManaged public var homePenaltyKills: Int16
    @NSManaged public var homePenaltyKillGoalsAllowed: Int16
    @NSManaged public var homePenaltyKillPercent: Double
    @NSManaged public var homeGoalsFor: Int16
    @NSManaged public var homeGoalsAgainst: Int16
    @NSManaged public var homeShots: Int16
    @NSManaged public var homePenalties: Int16
    @NSManaged public var homePenaltyMinutes: Int16
    @NSManaged public var homeHits: Int16
    @NSManaged public var awayTeamId: Int16
    @NSManaged public var awayTeamAbbreviation: String?
    @NSManaged public var awayWins: Int16
    @NSManaged public var awayLosses: Int16
    @NSManaged public var awayOvertimeWins: Int16
    @NSManaged public var awayOvertimeLosses: Int16
    @NSManaged public var awayPoints: Int16
    @NSManaged public var awayFaceOffWins: Int16
    @NSManaged public var awayFaceOffLosses: Int16
    @NSManaged public var awayFaceOffPercent: Double
    @NSManaged public var awayPowerPlays: Int16
    @NSManaged public var awayPowerPlayGoals: Int16
    @NSManaged public var awayPenaltyKills: Int16
    @NSManaged public var awayPowerPlayPercent: Double
    @NSManaged public var awayPenaltyKillGoalsAllowed: Int16
    @NSManaged public var awayPenaltyKillPercent: Double
    @NSManaged public var awayGoalsFor: Int16
    @NSManaged public var awayGoalsAgainst: Int16
    @NSManaged public var awayShots: Int16
    @NSManaged public var awayPenalties: Int16
    @NSManaged public var awayPenaltyMinutes: Int16
    @NSManaged public var awayHits: Int16
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var team: TeamEntity?
    
    public var wrappedDate: String
    {
        date ?? Date().asShortDateFormattedString()
    }
    
    public var wrappedTime: String
    {
        time ?? "7:00 PM"
    }
    
    public var wrappedPlayedStatus: String
    {
        playedStatus ?? PlayedStatusEnum.unplayed.rawValue
    }
    
    public var wrappedHomeTeamAbbreviation: String
    {
        homeTeamAbbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedAwayTeamAbbreviation: String
    {
        awayTeamAbbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedLastUpdated: Date
    {
        lastUpdated ?? Date()
    }
    
    public var wrappedDateCreated: Date
    {
        dateCreated ?? Date()
    }
    
    public var wrappedTeam: TeamEntity?
    {
        team ?? TeamEntity(context: TeamEntity.viewContext)
    }
}

extension GameLogEntity: Identifiable
{
}
