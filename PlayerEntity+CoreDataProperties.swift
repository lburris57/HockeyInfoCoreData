//
//  PlayerEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//

import CoreData
import Foundation

extension PlayerEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerEntity>
    {
        return NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")
    }

    @NSManaged public var teamId: Int16
    @NSManaged public var playerId: Int16
    @NSManaged public var teamAbbreviation: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var position: String?
    @NSManaged public var jerseyNumber: String?
    @NSManaged public var height: String?
    @NSManaged public var weight: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var age: String?
    @NSManaged public var birthCity: String?
    @NSManaged public var birthCountry: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var shoots: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var playerStatistics: NSSet?
    @NSManaged public var playerInjuries: NSSet?
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
    
    public var wrappedHeight: String
    {
        height ?? Constants.EMPTY_STRING
    }
    
    public var wrappedWeight: String
    {
        weight ?? Constants.EMPTY_STRING
    }
    
    public var wrappedBirthDate: String
    {
        birthDate ?? Constants.EMPTY_STRING
    }
    
    public var wrappedAge: String
    {
        age ?? Constants.EMPTY_STRING
    }
    
    public var wrappedBirthCity: String
    {
        birthCity ?? Constants.EMPTY_STRING
    }
    
    public var wrappedBirthCountry: String
    {
        birthCountry ?? Constants.EMPTY_STRING
    }
    
    public var wrappedImageURL: String
    {
        imageURL ?? Constants.EMPTY_STRING
    }
    
    public var wrappedShoots: String
    {
        shoots ?? Constants.EMPTY_STRING
    }
    
    public var wrappedLastUpdated: Date
    {
        lastUpdated ?? Date()
    }
    
    public var wrappedDateCreated: Date
    {
        dateCreated ?? Date()
    }
    
    public var playerStatisticsArray: [PlayerStatisticsEntity]
    {
        let set = playerStatistics as? Set<PlayerStatisticsEntity> ?? []
        
        return set.sorted
        {
            $0.wrappedLastUpdated > $1.wrappedLastUpdated
        }
    }
    
    public var playerInjuriesArray: [PlayerInjuryEntity]
    {
        let set = playerInjuries as? Set<PlayerInjuryEntity> ?? []
        
        return set.sorted
        {
            $0.wrappedLastName < $1.wrappedLastName
        }
    }
}

// MARK: Generated accessors for playerStatistics

extension PlayerEntity
{
    @objc(addPlayerStatisticsObject:)
    @NSManaged public func addToPlayerStatistics(_ value: PlayerStatisticsEntity)

    @objc(removePlayerStatisticsObject:)
    @NSManaged public func removeFromPlayerStatistics(_ value: PlayerStatisticsEntity)

    @objc(addPlayerStatistics:)
    @NSManaged public func addToPlayerStatistics(_ values: NSSet)

    @objc(removePlayerStatistics:)
    @NSManaged public func removeFromPlayerStatistics(_ values: NSSet)
}

// MARK: Generated accessors for playerInjuries

extension PlayerEntity
{
    @objc(addPlayerInjuriesObject:)
    @NSManaged public func addToPlayerInjuries(_ value: PlayerInjuryEntity)

    @objc(removePlayerInjuriesObject:)
    @NSManaged public func removeFromPlayerInjuries(_ value: PlayerInjuryEntity)

    @objc(addPlayerInjuries:)
    @NSManaged public func addToPlayerInjuries(_ values: NSSet)

    @objc(removePlayerInjuries:)
    @NSManaged public func removeFromPlayerInjuries(_ values: NSSet)
}

extension PlayerEntity: Identifiable
{
}
