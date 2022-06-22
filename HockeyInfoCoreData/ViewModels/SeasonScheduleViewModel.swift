//
//  SeasonScheduleViewModel.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//
import Foundation

class SeasonScheduleViewModel: ObservableObject
{
    @Published var scheduledEntities: [ScheduleEntity] = []
    @Published var scheduledGames: [ScheduledGame] = []
    @Published var filteredGames: [ScheduledGame] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    @Published var selectedDate = Constants.EMPTY_STRING
    
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    
    @MainActor
    func evaluateDataSource() async
    {
        //  Check database to see if scheduled game data has been saved/updated already, otherwise retrieve data from the web service
        if DatabaseManager().scheduledGamesRequireSaving(selectedDate)
        {
            await fetchDataFromWebService()
        }
        else
        {
            fetchDataFromDatabase()
        }
    }
    
    //  Download the data, populate the database and update the scheduledGames and filteredGames arrays
    @MainActor
    func fetchDataFromWebService() async
    {
        //  URL is https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/games.json
        
        let apiService = APIService(urlString: Constants.REGULAR_SEASON_URL)
        
        isLoading.toggle()
        
        //  Set the isLoading value to false after data is retrieved
        defer
        {
            isLoading.toggle()
        }
        
        do
        {
            //  The season object contains all of the scheduled games data
            if let season = try await apiService.getJSON() as SeasonalGames?
            {
                //  Convert the decoded JSON object into an ScheduleEntity and ScheduledGame arrays
                (scheduledEntities, scheduledGames) = DataConversionHelper.convertSeasonToScheduleEntitiesAndScheduledGames(season)
                
                filterScheduledGamesBySelectedDate()
                
                //  Save the scheduledEntities to the database on a background thread
                DispatchQueue.global(qos: .userInitiated).async
                {
                    do
                    {
                        if self.viewContext.hasChanges
                        {
                            try DatabaseManager().saveScheduleEntities(self.scheduledEntities)
                        }
                    }
                    catch
                    {
                        Log.error("Error saving scheduled games to the database: \(error.localizedDescription)")
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
        //scheduledGames = DatabaseManager().retrieveScheduledGamesByDateString(self.selectedDate)
        filterScheduledGamesBySelectedDate()
    }
    
    //  Populate the filteredGames array based on the selected date
    func filterScheduledGamesBySelectedDate()
    {
        filteredGames = scheduledGames.filter({$0.date == self.selectedDate})
    }
    
    //  Return sample data to be used for development
    static func sampleGames() -> [NHLScheduledGame]
    {
        var sampleScheduledGamesList = [NHLScheduledGame]()
        
        var sampleGame1 = NHLScheduledGame()
        
        sampleGame1.timeString = "  7:00 PM"
        sampleGame1.homeTeam = TeamManager.getFullTeamName("BUF")
        sampleGame1.awayTeam = TeamManager.getFullTeamName("VAN")
        sampleGame1.venue = TeamManager.getVenueByTeam("BUF")
        
        sampleScheduledGamesList.append(sampleGame1)
        
        var sampleGame2 = NHLScheduledGame()
        
        sampleGame2.timeString = "  7:00 PM"
        sampleGame2.homeTeam = TeamManager.getFullTeamName("MTL")
        sampleGame2.awayTeam = TeamManager.getFullTeamName("TOR")
        sampleGame2.venue = TeamManager.getVenueByTeam("MTL")
        
        sampleScheduledGamesList.append(sampleGame2)
        
        var sampleGame3 = NHLScheduledGame()
        
        sampleGame3.timeString = "  8:00 PM"
        sampleGame3.homeTeam = TeamManager.getFullTeamName("CHI")
        sampleGame3.awayTeam = TeamManager.getFullTeamName("VGK")
        sampleGame3.venue = TeamManager.getVenueByTeam("CHI")
        
        sampleScheduledGamesList.append(sampleGame3)
        
        var sampleGame4 = NHLScheduledGame()
        
        sampleGame4.timeString = "  8:00 PM"
        sampleGame4.homeTeam = TeamManager.getFullTeamName("WPJ")
        sampleGame4.awayTeam = TeamManager.getFullTeamName("TBL")
        sampleGame4.venue = TeamManager.getVenueByTeam("WPJ")
        
        sampleScheduledGamesList.append(sampleGame4)
        
        var sampleGame5 = NHLScheduledGame()
        
        sampleGame5.timeString = "10:00 PM"
        sampleGame5.homeTeam = TeamManager.getFullTeamName("EDM")
        sampleGame5.awayTeam = TeamManager.getFullTeamName("LAK")
        sampleGame5.venue = TeamManager.getVenueByTeam("EDM")
        
        sampleScheduledGamesList.append(sampleGame5)
        
        return sampleScheduledGamesList
    }
}
