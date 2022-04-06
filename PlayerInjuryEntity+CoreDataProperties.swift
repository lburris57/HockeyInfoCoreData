//
//  PlayerInjuryEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//

import CoreData
import Foundation

extension PlayerInjuryEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerInjuryEntity>
    {
        return NSFetchRequest<PlayerInjuryEntity>(entityName: "PlayerInjuryEntity")
    }

    @NSManaged public var teamId: Int16
    @NSManaged public var playerId: Int16
    @NSManaged public var teamAbbreviation: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var position: String?
    @NSManaged public var jerseyNumber: String?
    @NSManaged public var injuryDescription: String?
    @NSManaged public var playingProbability: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var player: PlayerEntity?
    @NSManaged public var team: TeamEntity?
    
    public var wrappedTeamAbbreviation: String
    {
        teamAbbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedFirstName: String
    {
        firstName ?? Constants.EMPTY_STRING
    }
    
    public var wrappedLastName: String
    {
        lastName ?? Constants.EMPTY_STRING
    }
    
    public var wrappedPosition: String
    {
        position ?? Constants.EMPTY_STRING
    }
    
    public var wrappedJerseyNumber: String
    {
        jerseyNumber ?? Constants.EMPTY_STRING
    }
    
    public var wrappedInjuryDescription: String
    {
        injuryDescription ?? Constants.EMPTY_STRING
    }
    
    public var wrappedPlayingProbability: String
    {
        playingProbability ?? Constants.EMPTY_STRING
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

extension PlayerInjuryEntity: Identifiable
{
}
