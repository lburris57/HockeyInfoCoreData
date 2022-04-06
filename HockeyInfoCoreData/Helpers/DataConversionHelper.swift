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
}
