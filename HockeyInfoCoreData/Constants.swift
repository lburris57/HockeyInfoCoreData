//
//  Constants.swift
//  TodoList
//
//  Created by Larry Burris on 02/14/22.
//  Copyright © 2022 Larry Burris. All rights reserved.
//
import Foundation

struct Constants
{
    static let EMPTY_STRING = ""
    static let ZERO: Int = 0
    
    //  Time constants
    static let SECONDS_PER_DAY = 86400
    static let DAYS_PER_MONTH = 30.333
    
    static let SYSTEM: String = "System"
    
    static let USER_NAME_KEY: String = "userName"
    static let FILTER_TYPE_KEY: String = "filter"
    static let SORT_ORDER_KEY: String = "sort"
    
    //  URLs
    static let REGULAR_SEASON_URL = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/games.json"  //  Decodes into SeasonalGames model
    static let REGULAR_SEASON_STANDINGS_URL = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/standings.json"  //  Decodes into SeasonStandings model
    static let REGULAR_SEASON_GAME_BOX_SCORE_URL_PREFIX = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/games/" // Need to add "YYYYMMDD-awayTeamAbbreviation-homeTeamAbbreviation"
    static let REGULAR_SEASON_GAME_BOX_SCORE_URL_SUFFIX = "/boxscore.json"  //  Decodes into GameBoxScore model
    static let REGULAR_SEASON_GAMES_BY_DATE_URL_PREFIX = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/date/" // Need to add "YYYYMMDD"
    static let REGULAR_SEASON_GAMES_BY_DATE_URL_SUFFIX = "/games.json"  //  Decodes into GameForDate model
    static let REGULAR_SEASON_PLAYER_GAME_LOGS_BY_DATE_URL_PREFIX = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/date/" // Need to add "YYYYMMDD"
    static let REGULAR_SEASON_PLAYER_GAME_LOGS_BY_DATE_URL_SUFFIX = "/player_gamelogs.json?team="  //  Need to add team abbreviation.  Decodes into PlayerGameLogsForDate model
    static let REGULAR_SEASON_DAILY_TEAM_GAME_LOGS_URL_PREFIX = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/date/" // Need to add "YYYYMMDD"
    static let REGULAR_SEASON_DAILY_TEAM_GAME_LOGS_URL_SUFFIX = "/team_gamelogs.json?team="  //  Need to add team abbreviation.  Decodes into DailyTeamGameLogs model
    static let REGULAR_SEASON_INJURIES_URL = "https://api.mysportsfeeds.com/v2.1/pull/nhl/injuries.json"  //  Decodes into PlayerInjuries model
    static let REGULAR_SEASON_TEAM_STATS_URL = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/team_stats_totals.json"  //  Decodes into SeasonalTeamStats model
    static let REGULAR_SEASON_PLAYER_STATS_URL = "https://api.mysportsfeeds.com/v2.1/pull/nhl/2021-2022-regular/player_stats_totals.json"  //  Decodes into SeasonalPlayerStats model
    static let REGULAR_SEASON_PLAYERS_URL = "https://api.mysportsfeeds.com/v2.1/pull/nhl/players.json"  //  Decodes into SeasonalPlayers model
    
    //  TableNames
    static let MENU_CATEGORY_TABLE = "menuCategoryTable"
    static let GAME_LOG_TABLE = "gameLogTable"
    static let PERIOD_SCORING_DATA_TABLE = "periodScoringDataTable"
    static let PLAYER_TABLE = "playerTable"
    static let PLAYER_INJURY_TABLE = "playerInjuryTable"
    static let SCHEDULE_TABLE = "scheduleTable"
    static let SCORING_SUMMARY_TABLE = "scoringSummaryTable"
    static let TEAM_TABLE = "teamTable"
    static let PLAYER_STATISTICS_TABLE = "playerStatisticsTable"
    static let TEAM_STANDINGS_TABLE = "team_StandingsTable"
    static let TEAM_STATISTICS_TABLE = "teamStatisticsTable"
    
    //  Tables Loaded?
    static let MENU_CATEGORY_TABLE_LOADED = "menuCategoryTableLoaded"
    static let GAME_LOG_TABLE_LOADED = "gameLogTableLoaded"
    static let PERIOD_SCORING_DATA_TABLE_LOADED = "periodScoringDataTableLoaded"
    static let PLAYER_TABLE_LOADED = "playerTableLoaded"
    static let PLAYER_INJURY_TABLE_LOADED = "playerInjuryTableLoaded"
    static let SCHEDULE_TABLE_LOADED = "scheduleTableLoaded"
    static let SCORING_SUMMARY_TABLE_LOADED = "scoringSummaryTableLoaded"
    static let TEAM_TABLE_LOADED = "teamTableLoaded"
    static let PLAYER_STATISTICS_TABLE_LOADED = "playerStatisticsTableLoaded"
    static let TEAM_STANDINGS_TABLE_LOADED = "teamStandingsTableLoaded"
    static let TEAM_STATISTICS_TABLE_LOADED = "teamStatisticsTableLoaded"
    
    static let TABLES_NEED_RELOAD = "tablesNeedReload"
    
    //  Tables Linked?
    static let TEAM_PLAYERS_LINKED = "teamPlayersLinked"
    static let TEAM_STANDINGS_LINKED = "teamStandingsLinked"
    static let TEAM_STATISTICS_LINKED = "teamStatisticsLinked"
    static let TEAM_SCHEDULES_LINKED = "teamSchedulesLinked"
    static let TEAM_PLAYER_INJURIES_LINKED = "teamPlayerInjuriesLinked"
    static let TEAM_GAME_LOGS_LINKED = "teamGameLogsLinked"
    static let PLAYER_STATISTICS_LINKED = "playerStatisticsLinked"
    static let PLAYER_INJURIES_LINKED = "playerInjuriesLinked"
    
    //  User Defaults
    static let USER_DEFAULTS = UserDefaults.standard
    
    //  Categories and Teams
    static let CATEGORY_ARRAY = ["Season Schedule", "Team Information List", "Search Player Information", "Standings", "Scores", "Settings"]
    static let TEAM_ABBREVIATION_ARRAY = ["ANA", "ARI", "BOS", "BUF", "CGY", "CAR", "CHI", "COL", "CBJ", "DAL", "DET", "EDM", "FLO", "LAK", "MIN", "MTL", "NSH", "NJD", "NYI", "NYR", "OTT", "PHI", "PIT", "SEA", "SJS", "STL", "TBL", "TOR", "VAN", "VGK", "WSH", "WPJ"]
    static let ALL_TEAMS = "ANA,ARI,BOS,BUF,CGY,CAR,CHI,COL,CBJ,DAL,DET,EDM,FLO,LAK,MIN,MTL,NSH,NJD,NYI,NYR,OTT,PHI,PIT,SEA,SJS,STL,TBL,TOR,VAN,VGK,WSH,WPJ"
    
    //  URL Authorization Data
    static let AUTHORIZATION = "Authorization"
    static let USER_ID = "6faa8a21-d219-433a-914b-fcd2d4:MYSPORTSFEEDS"
    static let AUTHORIZATION_VALUE = "Basic "
    
    //  Time and date formats
    static let MONTH_FORMAT = "MM"
    static let YEAR_FORMAT = "yyyy"
    static let MONTH_YEAR_FORMAT = "MMyyyy"
    static let SHORT_DATE_FORMAT = "yyyyMMdd"
    static let LONG_DATE_FORMAT = "EEEE, MMM dd, yyyy"
    static let GMT_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
    static let TIME_FORMAT = "hh:mm a"
    
    //  Season Strings
    static let S2007_2008 = "2007-2008"
    static let S2008_2009 = "2008-2009"
    static let S2009_2010 = "2009-2010"
    static let S2010_2011 = "2010-2011"
    static let S2011_2012 = "2011-2012"
    static let S2012_2013 = "2012-2013"
    static let S2013_2014 = "2013-2014"
    static let S2014_2015 = "2014-2015"
    static let S2015_2016 = "2015-2016"
    static let S2016_2017 = "2016-2017"
    static let S2017_2018 = "2017-2018"
    static let S2018_2019 = "2018-2019"
    static let S2019_2020 = "2019-2020"
    static let S2020_2021 = "2020-2021"
    static let S2021_2022 = "2021-2022"
    static let S2022_2023 = "2022-2023"
    static let S2023_2024 = "2023-2024"
    static let S2024_2025 = "2024-2025"
    static let S2025_2026 = "2025-2026"
    static let S2026_2027 = "2026-2027"
    static let S2027_2028 = "2027-2028"
    static let S2028_2029 = "2028-2029"
    static let S2029_2030 = "2029-2030"
    static let S2030_2031 = "2030-2031"
    static let S2031_2032 = "2031-2032"
    static let S2032_2033 = "2032-2033"
    static let S2033_2034 = "2033-2034"
    static let S2034_2035 = "2034-2035"
    static let S2035_2036 = "2035-2036"
    
    //  Playoff Strings
    static let P2007_2008 = "2007-2008-Playoffs"
    static let P2008_2009 = "2008-2009-Playoffs"
    static let P2009_2010 = "2009-2010-Playoffs"
    static let P2010_2011 = "2010-2011-Playoffs"
    static let P2011_2012 = "2011-2012-Playoffs"
    static let P2012_2013 = "2012-2013-Playoffs"
    static let P2013_2014 = "2013-2014-Playoffs"
    static let P2014_2015 = "2014-2015-Playoffs"
    static let P2015_2016 = "2015-2016-Playoffs"
    static let P2016_2017 = "2016-2017-Playoffs"
    static let P2017_2018 = "2017-2018-Playoffs"
    static let P2018_2019 = "2018-2019-Playoffs"
    static let P2019_2020 = "2019-2020-Playoffs"
    static let P2020_2021 = "2020-2021-Playoffs"
    static let P2021_2022 = "2021-2022-Playoffs"
    static let P2022_2023 = "2022-2023-Playoffs"
    static let P2023_2024 = "2023-2024-Playoffs"
    static let P2024_2025 = "2024-2025-Playoffs"
    static let P2025_2026 = "2025-2026-Playoffs"
    static let P2026_2027 = "2026-2027-Playoffs"
    static let P2027_2028 = "2027-2028-Playoffs"
    static let P2028_2029 = "2028-2029-Playoffs"
    static let P2029_2030 = "2029-2030-Playoffs"
    static let P2030_2031 = "2030-2031-Playoffs"
    static let P2031_2032 = "2031-2032-Playoffs"
    static let P2032_2033 = "2032-2033-Playoffs"
    static let P2033_2034 = "2033-2034-Playoffs"
    static let P2034_2035 = "2034-2035-Playoffs"
    static let P2035_2036 = "2035-2036-Playoffs"
    
    static let SEASON = "season"
    static let SEASON_TYPE = "seasonType"
    static let PLAYOFF_YEAR = "playoffYear"
    
    static let CURRENT_SEASON = "currentSeason"
    static let REGULAR_SEASON = "Regular"
    static let PLAYOFFS = "Playoffs"
    
    static let IS_PLAYOFF_SETTING_VALID = "isPlayoffSettingValid"
    static let IS_PLAYOFFS = "isPlayoffs"
}

