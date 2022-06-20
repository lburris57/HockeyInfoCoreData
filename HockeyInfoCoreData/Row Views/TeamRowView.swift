//
//  TeamRowView.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 6/25/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct TeamRowView : View
{
    var teamItem: TeamItem
    
    var body: some View
    {
        HStack()
        {
            Image(teamItem.teamIconName).resizable().frame(width: 30, height: 20).aspectRatio(contentMode: .fit).padding(.leading)
            Text(teamItem.teamName)
            Spacer()
        }
    }
}

struct TeamItem : Identifiable
{
    var id = UUID()
    var teamIconName = ""
    var teamName = ""
    var division = ""
    var teamId = 0
}

extension TeamItem
{
    static func allTeamItems() -> [TeamItem]
    {
        return [
            TeamItem(teamIconName: "ANA", teamName: "Anaheim Ducks", division: "Pacific", teamId: TeamManager.getIDByTeam("ANA")),
            TeamItem(teamIconName: "ARI", teamName: "Arizona Coytotes", division: "Pacific", teamId: TeamManager.getIDByTeam("ARI")),
            TeamItem(teamIconName: "BOS", teamName: "Boston Bruins", division: "Atlantic", teamId: TeamManager.getIDByTeam("BOS")),
            TeamItem(teamIconName: "BUF", teamName: "Buffalo Sabres", division: "Atlantic", teamId: TeamManager.getIDByTeam("BUF")),
            TeamItem(teamIconName: "CGY", teamName: "Calgary Flames", division: "Pacific", teamId: TeamManager.getIDByTeam("CGY")),
            TeamItem(teamIconName: "CAR", teamName: "Carolina Hurricanes", division: "Metropolitan", teamId: TeamManager.getIDByTeam("CAR")),
            TeamItem(teamIconName: "CHI", teamName: "Chicago Blackhawks", division: "Central", teamId: TeamManager.getIDByTeam("CHI")),
            TeamItem(teamIconName: "COL", teamName: "Colorado Avalanche", division: "Central", teamId: TeamManager.getIDByTeam("COL")),
            TeamItem(teamIconName: "CBJ", teamName: "Columbus Blue Jackets", division: "Metropolitan", teamId: TeamManager.getIDByTeam("CBJ")),
            TeamItem(teamIconName: "DAL", teamName: "Dallas Stars", division: "Central", teamId: TeamManager.getIDByTeam("DAL")),
            TeamItem(teamIconName: "DET", teamName: "Detroit Red Wings", division: "Atlantic", teamId: TeamManager.getIDByTeam("DET")),
            TeamItem(teamIconName: "EDM", teamName: "Edmonton Oilers", division: "Pacific", teamId: TeamManager.getIDByTeam("EDM")),
            TeamItem(teamIconName: "FLO", teamName: "Florida Panthers", division: "Atlantic", teamId: TeamManager.getIDByTeam("FLO")),
            TeamItem(teamIconName: "LAK", teamName: "Los Angeles Kings", division: "Pacific", teamId: TeamManager.getIDByTeam("LAK")),
            TeamItem(teamIconName: "MIN", teamName: "Minnesota Wild", division: "Central", teamId: TeamManager.getIDByTeam("MIN")),
            TeamItem(teamIconName: "MTL", teamName: "Montreal Canadiens", division: "Atlantic", teamId: TeamManager.getIDByTeam("MTL")),
            TeamItem(teamIconName: "NSH", teamName: "Nashville Predators", division: "Central", teamId: TeamManager.getIDByTeam("NSH")),
            TeamItem(teamIconName: "NJD", teamName: "New Jersey Devils", division: "Metropolitan", teamId: TeamManager.getIDByTeam("NJD")),
            TeamItem(teamIconName: "NYI", teamName: "New York Islanders", division: "Metropolitan", teamId: TeamManager.getIDByTeam("NYI")),
            TeamItem(teamIconName: "NYR", teamName: "New York Rangers", division: "Metropolitan", teamId: TeamManager.getIDByTeam("NYR")),
            TeamItem(teamIconName: "OTT", teamName: "Ottawa Senators", division: "Atlantic", teamId: TeamManager.getIDByTeam("OTT")),
            TeamItem(teamIconName: "PHI", teamName: "Philadelphia Flyers", division: "Metropolitan", teamId: TeamManager.getIDByTeam("PHI")),
            TeamItem(teamIconName: "PIT", teamName: "Pittsburgh Penguins", division: "Metropolitan", teamId: TeamManager.getIDByTeam("PIT")),
            TeamItem(teamIconName: "STL", teamName: "St. Louis Blues", division: "Central", teamId: TeamManager.getIDByTeam("STL")),
            TeamItem(teamIconName: "TBL", teamName: "Tampa Bay Lightning", division: "Atlantic", teamId: TeamManager.getIDByTeam("TBL")),
            TeamItem(teamIconName: "VAN", teamName: "Vancouver Canucks", division: "Pacific", teamId: TeamManager.getIDByTeam("VAN")),
            TeamItem(teamIconName: "VGK", teamName: "Vegas Golden Knights", division: "Pacific", teamId: TeamManager.getIDByTeam("VGK")),
            TeamItem(teamIconName: "WSH", teamName: "Washington Capitals", division: "Metropolitan", teamId: TeamManager.getIDByTeam("WSH")),
            TeamItem(teamIconName: "WPJ", teamName: "Winnipeg Jets", division: "Central", teamId: TeamManager.getIDByTeam("WPJ"))
        ]
    }
    
    static func atlanticDivisionTeamItems() -> [TeamItem]
    {
        return [
            TeamItem(teamIconName: "BOS", teamName: "Boston Bruins", division: "Atlantic", teamId: TeamManager.getIDByTeam("BOS")),
            TeamItem(teamIconName: "BUF", teamName: "Buffalo Sabres", division: "Atlantic", teamId: TeamManager.getIDByTeam("BUF")),
            TeamItem(teamIconName: "DET", teamName: "Detroit Red Wings", division: "Atlantic", teamId: TeamManager.getIDByTeam("DET")),
            TeamItem(teamIconName: "FLO", teamName: "Florida Panthers", division: "Atlantic", teamId: TeamManager.getIDByTeam("FLO")),
            TeamItem(teamIconName: "MTL", teamName: "Montreal Canadiens", division: "Atlantic", teamId: TeamManager.getIDByTeam("MTL")),
            TeamItem(teamIconName: "OTT", teamName: "Ottawa Senators", division: "Atlantic", teamId: TeamManager.getIDByTeam("OTT")),
            TeamItem(teamIconName: "TBL", teamName: "Tampa Bay Lightning", division: "Atlantic", teamId: TeamManager.getIDByTeam("TBL")),
            TeamItem(teamIconName: "TOR", teamName: "Toronto Maple Leafs", division: "Atlantic", teamId: TeamManager.getIDByTeam("TOR"))
        ]
    }
    
    static func metropolitanDivisionTeamItems() -> [TeamItem]
    {
        return [
            TeamItem(teamIconName: "CAR", teamName: "Carolina Hurricanes", division: "Metropolitan", teamId: TeamManager.getIDByTeam("CAR")),
            TeamItem(teamIconName: "CBJ", teamName: "Columbus Blue Jackets", division: "Metropolitan", teamId: TeamManager.getIDByTeam("CBJ")),
            TeamItem(teamIconName: "NJD", teamName: "New Jersey Devils", division: "Metropolitan", teamId: TeamManager.getIDByTeam("NJD")),
            TeamItem(teamIconName: "NYI", teamName: "New York Islanders", division: "Metropolitan", teamId: TeamManager.getIDByTeam("NYI")),
            TeamItem(teamIconName: "NYR", teamName: "New York Rangers", division: "Metropolitan", teamId: TeamManager.getIDByTeam("NYR")),
            TeamItem(teamIconName: "PHI", teamName: "Philadelphia Flyers", division: "Metropolitan", teamId: TeamManager.getIDByTeam("PHI")),
            TeamItem(teamIconName: "PIT", teamName: "Pittsburgh Penguins", division: "Metropolitan", teamId: TeamManager.getIDByTeam("PIT")),
            TeamItem(teamIconName: "WSH", teamName: "Washington Capitals", division: "Metropolitan", teamId: TeamManager.getIDByTeam("WSH"))
        ]
    }
    
    static func centralDivisionTeamItems() -> [TeamItem]
    {
        return [
            TeamItem(teamIconName: "CHI", teamName: "Chicago Blackhawks", division: "Central", teamId: TeamManager.getIDByTeam("CHI")),
            TeamItem(teamIconName: "COL", teamName: "Colorado Avalanche", division: "Central", teamId: TeamManager.getIDByTeam("COL")),
            TeamItem(teamIconName: "DAL", teamName: "Dallas Stars", division: "Central", teamId: TeamManager.getIDByTeam("DAL")),
            TeamItem(teamIconName: "MIN", teamName: "Minnesota Wild", division: "Central", teamId: TeamManager.getIDByTeam("MIN")),
            TeamItem(teamIconName: "NSH", teamName: "Nashville Predators", division: "Central", teamId: TeamManager.getIDByTeam("NSH")),
            TeamItem(teamIconName: "STL", teamName: "St. Louis Blues", division: "Central", teamId: TeamManager.getIDByTeam("STL")),
            TeamItem(teamIconName: "WPJ", teamName: "Winnipeg Jets", division: "Central", teamId: TeamManager.getIDByTeam("WPJ"))
        ]
    }
    
    static func pacificDivisionTeamItems() -> [TeamItem]
    {
        return [
            TeamItem(teamIconName: "ANA", teamName: "Anaheim Ducks", division: "Pacific", teamId: TeamManager.getIDByTeam("ANA")),
            TeamItem(teamIconName: "ARI", teamName: "Arizona Coytotes", division: "Pacific", teamId: TeamManager.getIDByTeam("ARI")),
            TeamItem(teamIconName: "EDM", teamName: "Calgary Flames", division: "Pacific", teamId: TeamManager.getIDByTeam("EDM")),
            TeamItem(teamIconName: "EDM", teamName: "Edmonton Oilers", division: "Pacific", teamId: TeamManager.getIDByTeam("EDM")),
            TeamItem(teamIconName: "LAK", teamName: "Los Angeles Kings", division: "Pacific", teamId: TeamManager.getIDByTeam("LAK")),
            TeamItem(teamIconName: "SJS", teamName: "San Jose Sharks", division: "Pacific", teamId: TeamManager.getIDByTeam("SJS")),
            TeamItem(teamIconName: "VAN", teamName: "Vancouver Canucks", division: "Pacific", teamId: TeamManager.getIDByTeam("VAN")),
            TeamItem(teamIconName: "VGK", teamName: "Vegas Golden Knights", division: "Pacific", teamId: TeamManager.getIDByTeam("VGK"))
        ]
    }
}


#if DEBUG
struct TeamRowView_Previews : PreviewProvider
{
    static var previews: some View
    {
        TeamRowView(teamItem: TeamItem(teamIconName: "BUF", teamName: "Buffalo Sabres", teamId: TeamManager.getIDByTeam("BUF")))
    }
}
#endif
