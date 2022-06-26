//
//  TeamsViewModel.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/14/22.
//
import Foundation
import CoreData

class TeamsViewModel: ObservableObject
{
    @Published var teams = [Team]()
    @Published var teamEntities: [TeamEntity] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    
    @MainActor
    func evaluateDataSource() async
    {
        //  Check database to see if team data has been saved/updated already, otherwise retrieve data from the web service
        if DatabaseManager().teamsRequireSaving()
        {
            await fetchDataFromWebService()
        }
        else
        {
            fetchDataFromDatabase()
        }
    }
    
    //  Download the data, populate the database with teamEntities array and update the teams array
    @MainActor
    func fetchDataFromWebService() async
    {
        //  URL is https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/team_stats_totals.json
        
        let urlString = Constants.REGULAR_SEASON_TEAM_STATS_URL
        
        Log.info("URL String is: \(urlString)")
        
        let apiService = APIService(urlString: urlString)
        
        isLoading.toggle()
        
        //  Set the isLoading value to false after data is retrieved
        defer
        {
            isLoading.toggle()
        }
        
        do
        {
            //  The seasonalTeamStats object contains all of the team and team stats data
            if let seasonalTeamStats = try await apiService.getJSON() as SeasonalTeamStats?
            {
                //  Convert the decoded JSON object into TeamEntity and Team arrays
                (teamEntities, teams) = DataConversionHelper.convertSeasonalTeamStatsToTeamEntitiesAndTeams(seasonalTeamStats)
                
                //  Save the teamEntities to the database on a background thread
                DispatchQueue.global(qos: .userInitiated).async
                {
                    do
                    {
                        if self.viewContext.hasChanges
                        {
                            try DatabaseManager().saveTeamEntities(self.teamEntities)
                        }
                    }
                    catch
                    {
                        Log.error("Error saving teams to the database: \(error.localizedDescription)")
                    }
                }
            }
        }
        catch
        {
            showAlert = true
            errorMessage = error.localizedDescription
        }
    }
    
    //  Fetch the data from the database and update the scheduledGames and filteredGames arrays
    func fetchDataFromDatabase()
    {
        teamEntities = DatabaseManager().retrieveAllTeams()
    }
}
