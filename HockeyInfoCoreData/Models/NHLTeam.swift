//
//  NHLTeam.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/30/22.
//
import SwiftUI

struct NHLTeam : Identifiable
{
    var id = UUID()
    var abbreviation : String = Constants.EMPTY_STRING
    var city : String = Constants.EMPTY_STRING
    var name : String = Constants.EMPTY_STRING
    var division : String = Constants.EMPTY_STRING
    var conference : String = Constants.EMPTY_STRING
}

extension NHLTeam
{
    static func allTeams() -> [NHLTeam]
    {
        return[
            NHLTeam(abbreviation: "ANA", city: "Anaheim", name: "Ducks", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "ARI", city: "Arizona", name: "Coyotes", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "BOS", city: "Boston", name: "Bruins", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "BUF", city: "Buffalo", name: "Sabres", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "CGY", city: "Calgary", name: "Flames", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "CAR", city: "Carolina", name: "Hurricanes", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "CHI", city: "Chicago", name: "Blackhawks", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "COL", city: "Colorado", name: "Avalanche", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "CBJ", city: "Columbus", name: "Blue Jackets", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "DAL", city: "Dallas", name: "Stars", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "DET", city: "Detroit", name: "Red Wings", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "EDM", city: "Edmonton", name: "Oilers", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "FLO", city: "Florida", name: "Panthers", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "LAK", city: "Los Angeles", name: "Kings", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "MIN", city: "Minnesota", name: "Wild", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "MTL", city: "Montreal", name: "Canadiens", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "NSH", city: "Nashville", name: "Predators", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "NJD", city: "New Jersey", name: "Devils", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "NYI", city: "New York", name: "Islanders", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "NYR", city: "New York", name: "Rangers", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "OTT", city: "Ottawa", name: "Senators", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "PHI", city: "Philadelphia", name: "Flyers", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "PIT", city: "Pittsburgh", name: "Penguins", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "SEA", city: "Seattle", name: "Kraken", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "SJS", city: "San Jose", name: "Sharks", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "STL", city: "St Louis", name: "Blues", division: "Central", conference: "Western"),
            NHLTeam(abbreviation: "TBL", city: "Tampa Bay", name: "Lightning", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "TOR", city: "Toronto", name: "Maple Leafs", division: "Atlantic", conference: "Eastern"),
            NHLTeam(abbreviation: "VAN", city: "Vancouver", name: "Canucks", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "VGK", city: "Vegas", name: "Golden Knights", division: "Pacific", conference: "Western"),
            NHLTeam(abbreviation: "WSH", city: "Washington", name: "Capitals", division: "Metropolitan", conference: "Eastern"),
            NHLTeam(abbreviation: "WPJ", city: "Winnipeg", name: "Jets", division: "Central", conference: "Western")
        ]
    }
    
    static func allEasternConferenceTeams() -> [NHLTeam]
    {
        return allTeams().filter({$0.conference == "Eastern"})
    }
    
    static func allWesternConferenceTeams() -> [NHLTeam]
    {
        return allTeams().filter({$0.conference == "Western"})
    }
    
    static func allAtlanticDivisionTeams() -> [NHLTeam]
    {
        return allTeams().filter({$0.division == "Atlantic"})
    }
    
    static func allMetropolitanDivisionTeams() -> [NHLTeam]
    {
        return allTeams().filter({$0.division == "Metropolitan"})
    }
    
    static func allCentralDivisionTeams() -> [NHLTeam]
    {
        return allTeams().filter({$0.division == "Central"})
    }
    
    static func allPacificDivisionTeams() -> [NHLTeam]
    {
        return allTeams().filter({$0.division == "Pacific"})
    }
}
