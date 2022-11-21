//
//  URLHelper.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 6/25/22.
//
import Foundation

class URLHelper
{
    static let userSettings = UserSettingsViewModel()
    
    let season = userSettings.season
    let seasonType = userSettings.seasonType
    let playoffYear = userSettings.playoffYear
    let isPlayoffs = Constants.USER_DEFAULTS.bool(forKey: Constants.IS_PLAYOFFS)
    
    var seasonSettingURL: String
    
    init()
    {
        print("Value of season is: \(season)")
        print("Value of seasonType is: \(seasonType)")
        print("Value of playoffYear is: \(playoffYear)")
        print("Value of isPlayoffs is: \(isPlayoffs)")
        
        seasonSettingURL = isPlayoffs ? playoffYear : season + "-" + Constants.REGULAR_SEASON.lowercased()
    }
    
    func retrieveFullSeasonURL() -> String
    {
        //https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022/games.json
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/games.json"
    }
    
    func retrieveRosterPlayersURL() -> String
    {
        //https://api.mysportsfeeds.com/v2.1/pull/nhl/players.json?rosterstatus=assigned-to-roster&season=2021-2022
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/players.json?rosterstatus=assigned-to-roster&season=\(seasonSettingURL)"
    }
    
    func retrieveStandingsURL() -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/standings.json"
    }
    
    func retrievePlayerStatsURL() -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/player_stats_totals.json"
    }
    
    func retrievePlayerInjuriesURL() -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/injuries.json"
    }
    
    func retrieveGameLogsURL() -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/team_gamelogs.json?team=\(Constants.ALL_TEAMS)"
    }
    
    func retrieveScoringSummaryURL(_ gameId: Int) -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/games/\(gameId)/boxscore.json?teamstats=none&playerstats=none"
    }
    
    func retrieveLatestScheduleInfoURL(_ dateRange: String) -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/games.json?team=\(Constants.ALL_TEAMS)&date=\(dateRange)"
    }
    
    func retrieveScheduleForDateURL(_ scheduledDate: String) -> String
    {
        return "https://api.mysportsfeeds.com/v2.1/pull/nhl/\(seasonSettingURL)/date/\(scheduledDate)/games.json"
    }
}
