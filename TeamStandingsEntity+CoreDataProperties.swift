//
//  TeamStandingsEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//
import CoreData
import Foundation

extension TeamStandingsEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamStandingsEntity>
    {
        return NSFetchRequest<TeamStandingsEntity>(entityName: "TeamStandingsEntity")
    }

    @NSManaged public var abbreviation: String?
    @NSManaged public var conference: String?
    @NSManaged public var conferenceRank: Int16
    @NSManaged public var division: String?
    @NSManaged public var divisionRank: Int16
    @NSManaged public var gamesPlayed: Int16
    @NSManaged public var wins: Int16
    @NSManaged public var losses: Int16
    @NSManaged public var overtimeLosses: Int16
    @NSManaged public var points: Int16
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var team: TeamEntity?
    
    public var wrappedAbbreviation: String
    {
        abbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedConference: String
    {
        conference ?? Constants.EMPTY_STRING
    }
    
    public var wrappedDivision: String
    {
        division ?? Constants.EMPTY_STRING
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

extension TeamStandingsEntity: Identifiable
{
}
