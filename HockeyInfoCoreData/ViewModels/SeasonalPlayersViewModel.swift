//
//  SeasonalPlayersViewModel.swift
//  HockeyInfoCoreData
//
//  Created by Ethan Kisiel on 6/17/22.
//
import Foundation

class SeasonalPlayersViewModel
{
    @Published var playerEntities: [PlayerEntity] = []
    @Published var players: [Player] = []
    @Published var filteredPlayers: [Player] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    
    @MainActor
    func evaluateDataSource() async
    {
        if DatabaseManager().playersRequireSaving()
        {
            await fetchDataFromWebService()
        }
        else
        {
            //fetchDataFromDatabase()
        }
        
    }
    
    @MainActor
    func fetchDataFromWebService() async
    {
        // URL is https://api.mysportsfeeds.com/v2.1/pull/nhl/players.json
        
        let apiService = APIService(urlString: Constants.REGULAR_SEASON_PLAYERS_URL)
        
        isLoading.toggle()
        
        defer
        {
            isLoading.toggle()
        }
        
        do
        {
            if let seasonalPlayers = try await apiService.getJSON() as SeasonalPlayers?
            {
                //  Convert the decoded JSON object into PlayerEntity and Player arrays
                (playerEntities, players) = DataConversionHelper.convertSeasonalPlayersToPlayerEntitiesAndPlayers(seasonalPlayers)
                
                //  Save the playerEntities to the database on a background thread
                DispatchQueue.global(qos: .userInitiated).async
                {
                    do
                    {
                        if self.viewContext.hasChanges
                        {
                            try DatabaseManager().savePlayerEntities(self.playerEntities)
                        }
                    }
                    catch
                    {
                        Log.error("Error saving seasonal players to the database: \(error.localizedDescription)")
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
}
