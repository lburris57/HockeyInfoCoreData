//
//  DataConversionHelper.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation
import SwiftUI
import CoreData

struct DataConversionHelper
{
    static let context = CoreDataManager.shared.persistentContainer.viewContext
    
    static func convertSeasonToScheduleEntitiesAndScheduledGames(_ seasonalGames: SeasonalGames) -> ([ScheduleEntity], [ScheduledGame])
    {
        var scheduledEntities = [ScheduleEntity]()
        var scheduledGames = [ScheduledGame]()
        
        let games = seasonalGames.games
        
        for game in games
        {
            let scheduledEntity = ScheduleEntity(context: context)
            
            scheduledEntity.dateCreated = Date()
            scheduledEntity.lastUpdated = seasonalGames.lastUpdatedOn
            scheduledEntity.gameId = Int16(game.schedule.id)
            scheduledEntity.date = TimeAndDateUtils.getDateAsString(game.schedule.startTime)
            scheduledEntity.time = TimeAndDateUtils.getTimeFromDate(game.schedule.startTime)
            scheduledEntity.homeTeam = game.schedule.homeTeam.abbreviation
            scheduledEntity.awayTeam = game.schedule.awayTeam.abbreviation
            scheduledEntity.homeShotsTotal = Int16(game.score.homeShotsTotal ?? 0)
            scheduledEntity.awayShotsTotal = Int16(game.score.awayShotsTotal ?? 0)
            scheduledEntity.homeScoreTotal = Int16(game.score.homeScoreTotal ?? 0)
            scheduledEntity.awayScoreTotal = Int16(game.score.awayScoreTotal ?? 0)
            scheduledEntity.venue = game.schedule.venue.name
            scheduledEntity.currentPeriod = Int16(game.score.currentPeriod ?? 0)
            scheduledEntity.currentTimeRemaining = Int16(game.score.currentPeriodSecondsRemaining ?? 0)
            scheduledEntity.numberOfPeriods = Int16(game.score.periods.count)
            scheduledEntity.playedStatus = game.schedule.playedStatus
            scheduledEntity.scheduleStatus = game.schedule.scheduleStatus
            
            scheduledEntities.append(scheduledEntity)
        }
        
        scheduledGames = scheduledEntities.map(ScheduledGame.init)
        
        return (scheduledEntities, scheduledGames)
    }
    
    static func convertSeasonalPlayersToPlayerEntitiesAndPlayers(_ seasonalPlayers: SeasonalPlayers) -> ([PlayerEntity], [Player])
    {
        var playerEntities = [PlayerEntity]()
        var playerModels = [Player]()
        
        let players = seasonalPlayers.players
        
        for player in players
        {
            let playerEntity = PlayerEntity(context: context)
            
            playerEntity.dateCreated = Date()
            playerEntity.lastUpdated = seasonalPlayers.lastUpdatedOn
            playerEntity.teamId = Int16(player.player.currentTeam?.id ?? 0)
            playerEntity.birthCity = player.player.birthCity
            playerEntity.birthCountry = player.player.birthCountry
            playerEntity.birthDate = player.player.birthDate
            playerEntity.firstName = player.player.firstName
            playerEntity.lastName = player.player.lastName
            playerEntity.height = player.player.height
            playerEntity.weight = String(player.player.weight ?? 0)
            playerEntity.imageURL = player.player.officialImageSrc?.absoluteString
            playerEntity.jerseyNumber = String(player.player.jerseyNumber ?? 0)
            playerEntity.playerId = Int16(player.player.id)
            playerEntity.position = player.player.primaryPosition
            playerEntity.shoots = player.player.handedness.shoots
            
            
            playerEntities.append(playerEntity)
        }
        
        playerModels = playerEntities.map(Player.init)
        
        return (playerEntities, playerModels)
    }
}
