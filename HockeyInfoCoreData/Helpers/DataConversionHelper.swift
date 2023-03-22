//
//  DataConversionHelper.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation
import CoreData

struct DataConversionHelper
{
    static let context = CoreDataManager.shared.persistentContainer.viewContext
    
    //  Returns populated ScheduleEntity and ScheduledGame arrays from
    //  values contained in the passed-in SeasonalGames JSON object
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
    
    //  Returns populated TeamEntity and Team arrays from values
    //  contained in the passed-in SeasonalTeamStats JSON object
    static func convertSeasonalTeamStatsToTeamEntitiesAndTeams(_ seasonalTeamStats: SeasonalTeamStats) -> ([TeamEntity], [Team])
    {
        var teamEntities = [TeamEntity]()
        var teamModels = [Team]()
        
        let teamStatsTotals = seasonalTeamStats.teamStatsTotals
        
        for teamStatsTotal in teamStatsTotals
        {
            let teamEntity = TeamEntity(context: context)
            let teamStatisticsEntity = TeamStatisticsEntity(context: context)
            
            teamEntity.dateCreated = Date()
            teamEntity.lastUpdated = Date()
            teamEntity.abbreviation = teamStatsTotal.team.abbreviation
            teamEntity.city = teamStatsTotal.team.city
            teamEntity.name = teamStatsTotal.team.name
            teamEntity.division = TeamManager.getDivisionByTeamName(teamStatsTotal.team.abbreviation)
            teamEntity.conference = TeamManager.getConferenceByTeamName(teamStatsTotal.team.abbreviation)
            
            teamStatisticsEntity.dateCreated = Date()
            teamStatisticsEntity.lastUpdated  = Date()
            teamStatisticsEntity.abbreviation = teamStatsTotal.team.abbreviation
            teamStatisticsEntity.gamesPlayed = Int16(teamStatsTotal.stats.gamesPlayed)
            teamStatisticsEntity.wins = Int16(teamStatsTotal.stats.standings.wins)
            teamStatisticsEntity.losses = Int16(teamStatsTotal.stats.standings.losses)
            teamStatisticsEntity.overtimeWins = Int16(teamStatsTotal.stats.standings.overtimeWins)
            teamStatisticsEntity.overtimeLosses = Int16(teamStatsTotal.stats.standings.overtimeLosses)
            teamStatisticsEntity.points = Int16(teamStatsTotal.stats.standings.points)
            teamStatisticsEntity.powerPlays = Int16(teamStatsTotal.stats.powerplay.powerplays)
            teamStatisticsEntity.powerPlayGoals = Int16(teamStatsTotal.stats.powerplay.powerplayGoals)
            teamStatisticsEntity.powerPlayPercent = teamStatsTotal.stats.powerplay.powerplayPercent
            teamStatisticsEntity.penalties = Int16(teamStatsTotal.stats.miscellaneous.penalties)
            teamStatisticsEntity.penaltyMinutes = Int16(teamStatsTotal.stats.miscellaneous.penaltyMinutes)
            teamStatisticsEntity.penaltyKills = Int16(teamStatsTotal.stats.powerplay.penaltyKills)
            teamStatisticsEntity.penaltyKillGoalsAllowed = Int16(teamStatsTotal.stats.powerplay.penaltyKillGoalsAllowed)
            teamStatisticsEntity.penaltyKillPercent = teamStatsTotal.stats.powerplay.penaltyKillPercent
            teamStatisticsEntity.goalsFor = Int16(teamStatsTotal.stats.miscellaneous.goalsFor)
            teamStatisticsEntity.goalsAgainst = Int16(teamStatsTotal.stats.miscellaneous.goalsAgainst)
            teamStatisticsEntity.shots = Int16(teamStatsTotal.stats.miscellaneous.shots)
            teamStatisticsEntity.hits = Int16(teamStatsTotal.stats.miscellaneous.hits)
            teamStatisticsEntity.faceOffs = Int16(teamStatsTotal.stats.faceoffs.faceoffs)
            teamStatisticsEntity.faceOffWins = Int16(teamStatsTotal.stats.faceoffs.faceoffWins)
            teamStatisticsEntity.faceOffLosses = Int16(teamStatsTotal.stats.faceoffs.faceoffLosses)
            teamStatisticsEntity.faceOffPercent = teamStatsTotal.stats.faceoffs.faceoffPercent
            
            teamStatisticsEntity.team = teamEntity
            teamEntity.statistics = teamStatisticsEntity
            
            
            teamEntities.append(teamEntity)
        }
        
        teamModels = teamEntities.map(Team.init)
        
        return (teamEntities, teamModels)
    }
    
    //  Returns populated PlayerEntity and Player arrays from values
    //  contained in the passed-in SeasonalPlayers JSON object
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
            
            playerEntity.save()
            
            playerEntities.append(playerEntity)
        }
        
        playerModels = playerEntities.map(Player.init)
        
        return (playerEntities, playerModels)
    }
}
