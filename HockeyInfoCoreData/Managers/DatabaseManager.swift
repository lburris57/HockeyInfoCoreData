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
    
    // MARK: -
    // MARK: Retrieval Functions
    func retrieveAllGames() -> [ScheduleEntity]
    {
        var games: [ScheduleEntity] = []
        
        let request = NSFetchRequest<ScheduleEntity>(entityName: "ScheduleEntity")
        
        let sort = NSSortDescriptor(keyPath: \ScheduleEntity.date, ascending: true)
        
        request.sortDescriptors = [sort]
        
        do
        {
            try games = viewContext.fetch(request)
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
        
        let request = NSFetchRequest<TeamEntity>(entityName: "TeamEntity")
        
        let sort = NSSortDescriptor(keyPath: \TeamEntity.name, ascending: true)
        
        request.sortDescriptors = [sort]
        
        do
        {
            try teams = viewContext.fetch(request)
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
        
        let request = NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")
        
        let sort = NSSortDescriptor(keyPath: \PlayerEntity.lastName, ascending: true)
        
        request.sortDescriptors = [sort]
        
        do
        {
            try players = viewContext.fetch(request)
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
        
        let request = NSFetchRequest<PlayerInjuryEntity>(entityName: "PlayerInjuryEntity")
        
        let sort = NSSortDescriptor(keyPath: \PlayerInjuryEntity.lastName, ascending: true)
        
        request.sortDescriptors = [sort]
        
        do
        {
            try playerInjuries = viewContext.fetch(request)
        }
        catch
        {
            Log.error("Error retrieving player injuries. \(error.localizedDescription)")
        }
        
        return playerInjuries
    }
    
    func retrieveAllTeamStatistics() -> [TeamStatisticsEntity]
    {
        var teamStatistics: [TeamStatisticsEntity] = []
        
        let request = NSFetchRequest<TeamStatisticsEntity>(entityName: "TeamStatisticsEntity")
        
        let sort = NSSortDescriptor(keyPath: \TeamStatisticsEntity.abbreviation, ascending: true)
        
        request.sortDescriptors = [sort]
        
        do
        {
            try teamStatistics = viewContext.fetch(request)
        }
        catch
        {
            Log.error("Error retrieving team statistics. \(error.localizedDescription)")
        }
        
        return teamStatistics
    }
    
    func scheduledGamesRequiresSaving(_ selectedDate: String) -> Bool
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
    
    func saveScheduleEntities(_ scheduledEntities: [ScheduleEntity]) throws
    {
        ScheduleEntity().save()
    }
}
