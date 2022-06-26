//
//  Player.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the PlayerEntity database class
struct Player: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let playerEntity: PlayerEntity
    
    var id: NSManagedObjectID
    {
        return playerEntity.objectID
    }
    
    var teamId: Int16
    {
        return playerEntity.teamId
    }
    
    var playerId: Int16
    {
        return playerEntity.playerId
    }
    
    var teamAbbreviation: String
    {
        return playerEntity.wrappedTeamAbbreviation
    }
    
    var firstName: String
    {
        return playerEntity.wrappedFirstName
    }
    
    var lastName: String
    {
        return playerEntity.wrappedLastName
    }
    
    var position: String
    {
        return playerEntity.wrappedPosition
    }
    
    var jerseyNumber: String
    {
        return playerEntity.wrappedJerseyNumber
    }
    
    var height: String
    {
        return playerEntity.wrappedHeight
    }
    
    var weight: String
    {
        return playerEntity.wrappedWeight
    }
    
    var birthDate: String
    {
        return playerEntity.wrappedBirthDate
    }
    
    var age: String
    {
        return playerEntity.wrappedAge
    }
    
    var birthCity: String
    {
        return playerEntity.wrappedBirthCity
    }
    
    var birthCountry: String
    {
        return playerEntity.wrappedBirthCountry
    }
    
    var imageURL: String
    {
        return playerEntity.wrappedImageURL
    }
    
    var shoots: String
    {
        return playerEntity.wrappedShoots
    }
    
    var lastUpdated: Date
    {
        return playerEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return playerEntity.wrappedDateCreated
    }
    
    var team: TeamEntity
    {
        return playerEntity.team ?? TeamEntity(context: context)
    }
    
    var playerStatistics: [PlayerStatisticsEntity]
    {
        return playerEntity.playerStatisticsArray
    }
    
    var playerInjuries: [PlayerInjuryEntity]
    {
        return playerEntity.playerInjuriesArray
    }
}
