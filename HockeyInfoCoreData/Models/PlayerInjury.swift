//
//  PlayerInjury.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the PlayerInjury database class
struct PlayerInjury: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let playerInjuryEntity: PlayerInjuryEntity
    
    var id: NSManagedObjectID
    {
        return playerInjuryEntity.objectID
    }
    
    var teamId: Int16
    {
        return playerInjuryEntity.teamId
    }
    
    var playerId: Int16
    {
        return playerInjuryEntity.playerId
    }
    
    var teamAbbreviation: String
    {
        return playerInjuryEntity.wrappedTeamAbbreviation
    }
    
    var firstName: String
    {
        return playerInjuryEntity.wrappedFirstName
    }
    
    var lastName: String
    {
        return playerInjuryEntity.wrappedLastName
    }
    
    var position: String
    {
        return playerInjuryEntity.wrappedPosition
    }
    
    var jerseyNumber: String
    {
        return playerInjuryEntity.wrappedJerseyNumber
    }
    
    var injuryDescription: String
    {
        return playerInjuryEntity.wrappedInjuryDescription
    }
    
    var playingProbability: String
    {
        return playerInjuryEntity.wrappedPlayingProbability
    }
    
    var lastUpdated: Date
    {
        return playerInjuryEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return playerInjuryEntity.wrappedDateCreated
    }
    
    var team: TeamEntity
    {
        return playerInjuryEntity.team ?? TeamEntity(context: context)
    }
    
    var player: PlayerEntity
    {
        return playerInjuryEntity.player ?? PlayerEntity(context: context)
    }
}
