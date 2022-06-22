//
//  DatabaseManager.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/14/22.
//
import Foundation
import CoreData

class DatabaseManager
{
    let persistentContainer = CoreDataManager.shared.persistentContainer
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    
    //  Fetch Requests
    let scheduledEntityFetchRequest = ScheduleEntity.fetchRequest()
    let scoringSummaryEntityFetchRequest = ScoringSummaryEntity.fetchRequest()
    let periodScoringDataEntityFetchRequest = PeriodScoringDataEntity.fetchRequest()
    let gameLogEntityFetchRequest = GameLogEntity.fetchRequest()
    let playerEntityFetchRequest = PlayerEntity.fetchRequest()
    let playerStatisticsEntityFetchRequest = PlayerStatisticsEntity.fetchRequest()
    let playerInjuryEntityFetchRequest = PlayerInjuryEntity.fetchRequest()
    let teamEntityFetchRequest = TeamEntity.fetchRequest()
    let teamStandingsEntityFetchRequest = TeamStandingsEntity.fetchRequest()
    let teamStatisticsFetchRequest = TeamStatisticsEntity.fetchRequest()
    
    /*
        The following is a listing of each database table with a description detailing how often it should be updated and linked, if necessary.
        Otherwise, simply return the requested data directly from the database.
     
        NOTE: Check the last updated date of the tables and adjust the date range as necessary using the TimeAndDateUtils.
     
        ScheduleEntity - Once per day after all games have been completed.  No linking required.
        ScoringSummaryEntity - Once per day after all games have been completed and/or each time query is performed when a game is in progress.
        PeriodScoringDataEntity - Same as ScoringSummaryEntity. Link with ScoringSummaryEntity.
        GameLogEntity - Once per day after all games have been completed.  Link with TeamEntity.
        PlayerEntity - Once per day after all games have been completed.
        PlayerStatisticsEntity - Once per day after all games have been completed.  Link with PlayerEntity.
        PlayerInjuryEntity - Once per day after all games have been completed.  Link with PlayerEntity.
        TeamEntity - Once per day after all games have been completed.
        TeamStandingsEntity - Once per day after all games have been completed.  Link with TeamEntity.
        TeamStatisticsEntity - Once per day after all games have been completed.  Link with TeamEntity.
     */
    
    /*
        This is a list of functions that need to be included in the DatabaseManager code:
     
        saveScheduleEntities(_ scheduledEntities: [ScheduleEntity], )
        retrieveFullSeasonSchedule() -> [ScheduleEntity]
        retrieveScheduleEntitiesByDate(_ date: Date) -> [ScheduleEntity]
        retrieveScheduleEntitiesByDateRange(_ beginDate: Date, endDate: Date) -> [ScheduleEntity]
     
        saveTeamEntities(_ teamEntities: [TeamEntity])
        retrieveAllTeamEntities() -> [TeamEntity]
        retrieveTeamEntityById(_ teamId: String) -> TeamEntity
     
        saveTeamStatisticsEntities(_ teamStatisticsEntities: [TeamStatisticsEntity])
        retrieveAllTeamStatisticsEntities() -> [TeamStatisticsEntity]
        retrieveTeamStatisticsEntityById(_ teamId: String) -> TeamStatisticsEntity
     
        saveTeamStandingsEntities(_ teamStandingsEntities: [TeamStandingsEntity])
        retrieveAllTeamStandingsEntities() -> [TeamStandingsEntity]
        retrieveTeamStandingsEntityById(_ teamId: String) -> TeamStandingsEntity
     
        savePlayers(_ playerEntities: [PlayerEntity])
        retrieveAllPlayerEntities() -> [PlayerEntity]
        retrievePlayerEntityById(_ playerId: String) -> PlayerEntity
     
        savePlayerStatisticsEntities(_ playerStatisticsEntities: [PlayerStatisticsEntity])
        retrieveAllPlayerStatisticsEntities() -> [PlayerStatisticsEntity]
        retrievePlayerStatisticsEntityById(_ playerId: String) -> PlayerStatisticsEntity
     
        savePlayerInjuryEntities(_ playerInjuryEntities: [PlayerInjuryEntity])
        retrieveAllPlayerInjuryEntities() -> [PlayerInjuryEntity]
        retrievePlayerInjuryEntitiesByDate(_ date: Date) -> [PlayerInjuryEntity]
        retrievePlayerInjuryEntitiesByDateRange(_ beginDate: Date, endDate: Date) -> [PlayerInjuryEntity]
     
        saveGameLogEntities(_ gameLogEntities: [GameLogEntity])
        retrieveAllGameLogEntities() -> [GameLogEntity]
        retrieveGameLogEntitiesByDate(_ date: Date) -> [GameLogEntity]
        retrieveGameLogEntitiesByDateRange(_ beginDate: Date, endDate: Date) -> [GameLogEntity]
     
        saveScoringSummaryEntities(_ scoringSummaryEntities: [scoringSummaryEntity])
        retrieveAllScoringSummaryEntities() -> [scoringSummaryEntity]
        retrieveScoringSummaryEntitiesByDate(_ date: Date) -> [scoringSummaryEntity]
        retrieveScoringSummaryEntitiesByDateRange(_ beginDate: Date, endDate: Date) -> [scoringSummaryEntity]
     
     */
    
    // MARK: -
    // MARK: Retrieval Functions
    func retrieveAllGames() -> [ScheduleEntity]
    {
        var games: [ScheduleEntity] = []
        
        let sortDescriptor = NSSortDescriptor(keyPath: \ScheduleEntity.date, ascending: true)
        
        scheduledEntityFetchRequest.sortDescriptors = [sortDescriptor]
        
        do
        {
            try games = viewContext.fetch(scheduledEntityFetchRequest)
        }
        catch
        {
            Log.error("Error retrieving schedule information. \(error.localizedDescription)")
        }
        
        return games
    }
    
    func retrieveAllTeams() -> [TeamEntity]
    {
        var teams: [TeamEntity] = []
        
        let sortDescriptor = NSSortDescriptor(keyPath: \TeamEntity.name, ascending: true)
        
        teamEntityFetchRequest.sortDescriptors = [sortDescriptor]
        
        do
        {
            try teams = viewContext.fetch(teamEntityFetchRequest)
        }
        catch
        {
            Log.error("Error retrieving team information. \(error.localizedDescription)")
        }
        
        return teams
    }
    
    func retrieveAllPlayers() -> [PlayerEntity]
    {
        var players: [PlayerEntity] = []
        
        let sortDescriptor = NSSortDescriptor(keyPath: \PlayerEntity.lastName, ascending: true)
        
        playerEntityFetchRequest.sortDescriptors = [sortDescriptor]
        
        do
        {
            try players = viewContext.fetch(playerEntityFetchRequest)
        }
        catch
        {
            Log.error("Error retrieving players. \(error.localizedDescription)")
        }
        
        return players
    }
    
    func retrieveAllInjuries() -> [PlayerInjuryEntity]
    {
        var playerInjuries: [PlayerInjuryEntity] = []
        
        let sortDescriptor = NSSortDescriptor(keyPath: \PlayerInjuryEntity.lastName, ascending: true)
        
        playerInjuryEntityFetchRequest.sortDescriptors = [sortDescriptor]
        
        do
        {
            try playerInjuries = viewContext.fetch(playerInjuryEntityFetchRequest)
        }
        catch
        {
            Log.error("Error retrieving player injuries. \(error.localizedDescription)")
        }
        
        return playerInjuries
    }
    
    func retrieveAllTeamStatistics(_ sortDescriptors: [NSSortDescriptor]) -> [TeamStatisticsEntity]
    {
        var teamStatistics: [TeamStatisticsEntity] = []
        
        let sortDescriptor = NSSortDescriptor(keyPath: \TeamStatisticsEntity.abbreviation, ascending: true)
        
        teamStatisticsFetchRequest.sortDescriptors = [sortDescriptor]
        
        do
        {
            try teamStatistics = viewContext.fetch(teamStatisticsFetchRequest)
        }
        catch
        {
            Log.error("Error retrieving team statistics. \(error.localizedDescription)")
        }
        
        return teamStatistics
    }
    
    func scheduledGamesRequireSaving(_ selectedDate: String) -> Bool
    {
        // If future date, return false
        if TimeAndDateUtils.evaluateIfFutureDate(TimeAndDateUtils.getDate(fromString: selectedDate, dateFormat: "EEEE, MMM d, yyyy")!) { return false }
        
        //  Retrieve all games
        let retrievedGames = retrieveAllGames()
        
        //  Filter the games by the selected date
        let filteredGames = retrievedGames.filter({$0.date == selectedDate})
        
        //  If no games found or the last updated date was before today, return true
        if retrievedGames.count == 0 || filteredGames.count == 0 || retrievedGames.first!.lastUpdated! < Date()
        {
            return true
        }
        
        return false
    }
    
    func playersRequireSaving() -> Bool
    {
        //  Retrieve all players
        let retrievedPlayers = retrieveAllPlayers()
        
        //  If no players found or the last updated date was before today, return true
        if retrievedPlayers.count == 0 || retrievedPlayers.first!.lastUpdated! < Date()
        {
            return true
        }
        
        return false
    }
    
    func teamsRequireSaving() -> Bool
    {
        //  Retrieve all teams
        let retrievedTeams = retrieveAllTeams()
        
        //  If no teams found or the last updated date was before today, return true
        if retrievedTeams.count == 0 || retrievedTeams.first!.lastUpdated! < Date()
        {
            return true
        }
        
        return false
    }
    
    func saveScheduleEntities(_ scheduledEntities: [ScheduleEntity]) throws
    {
        ScheduleEntity().save()
    }
    
    func saveTeamEntities(_ teamEntities: [TeamEntity]) throws
    {
        TeamEntity().save()
    }
    
    func savePlayerEntities(_ playerEntities: [PlayerEntity]) throws
    {
        PlayerEntity().save()
    }
}
