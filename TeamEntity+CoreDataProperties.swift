//
//  TeamEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//
import CoreData
import Foundation

extension TeamEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamEntity>
    {
        return NSFetchRequest<TeamEntity>(entityName: "TeamEntity")
    }

    @NSManaged public var teamId: Int16
    @NSManaged public var abbreviation: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var division: String?
    @NSManaged public var conference: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var players: NSSet?
    @NSManaged public var standings: TeamStandingsEntity?
    @NSManaged public var statistics: TeamStatisticsEntity?
    @NSManaged public var games: NSSet?
    @NSManaged public var playerInjuries: NSSet?
    @NSManaged public var gameLogs: NSSet?
    
    public var wrappedAbbreviation: String
    {
        abbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedCity: String
    {
        city ?? Constants.EMPTY_STRING
    }
    
    public var wrappedName: String
    {
        name ?? Constants.EMPTY_STRING
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
    
    public var playersArray: [PlayerEntity]
    {
        let set = players as? Set<PlayerEntity> ?? []
        
        return set.sorted
        {
            $0.wrappedLastName < $1.wrappedLastName
        }
    }
    
    public var gamesArray: [ScheduleEntity]
    {
        let set = games as? Set<ScheduleEntity> ?? []
        
        return set.sorted
        {
            $0.wrappedDate < $1.wrappedDate
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
    
    public var gameLogsArray: [GameLogEntity]
    {
        let set = gameLogs as? Set<GameLogEntity> ?? []
        
        return set.sorted
        {
            $0.wrappedDate < $1.wrappedDate
        }
    }
}

// MARK: Generated accessors for players

extension TeamEntity
{
    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: PlayerEntity)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: PlayerEntity)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)
}

// MARK: Generated accessors for games

extension TeamEntity
{
    @objc(addGamesObject:)
    @NSManaged public func addToGames(_ value: ScheduleEntity)

    @objc(removeGamesObject:)
    @NSManaged public func removeFromGames(_ value: ScheduleEntity)

    @objc(addGames:)
    @NSManaged public func addToGames(_ values: NSSet)

    @objc(removeGames:)
    @NSManaged public func removeFromGames(_ values: NSSet)
}

// MARK: Generated accessors for playerInjuries

extension TeamEntity
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

// MARK: Generated accessors for gameLogs

extension TeamEntity
{
    @objc(addGameLogsObject:)
    @NSManaged public func addToGameLogs(_ value: GameLogEntity)

    @objc(removeGameLogsObject:)
    @NSManaged public func removeFromGameLogs(_ value: GameLogEntity)

    @objc(addGameLogs:)
    @NSManaged public func addToGameLogs(_ values: NSSet)

    @objc(removeGameLogs:)
    @NSManaged public func removeFromGameLogs(_ values: NSSet)
}

extension TeamEntity: Identifiable
{
}
