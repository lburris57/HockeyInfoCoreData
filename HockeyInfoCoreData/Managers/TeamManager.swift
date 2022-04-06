//
//  TeamManager
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation

class TeamManager
{
    static func getFullTeamName(_ name: String) -> String
    {
        let teamNames = ["ANA":"Anaheim Ducks", "ARI":"Arizona Coytotes", "BOS":"Boston Bruins", "BUF":"Buffalo Sabres", "CGY":"Calgary Flames", "CAR":"Carolina Hurricanes", "CHI":"Chicago Blackhawks", "COL":"Colorado Avalanche", "CBJ":"Columbus Blue Jackets", "DAL":"Dallas Stars", "DET":"Detroit Red Wings", "EDM":"Edmonton Oilers","FLO":"Florida Panthers", "LAK":"Los Angeles Kings", "MIN":"Minnesota Wild", "MTL":"Montreal Canadiens", "NSH":"Nashville Predators", "NJD":"New Jersey Devils", "NYI":"New York Islanders", "NYR":"New York Rangers", "OTT":"Ottawa Senators", "PHI":"Philadelphia Flyers", "PIT":"Pittsburgh Penguins", "SEA":"Seattle Kraken", "SJS":"San Jose Sharks", "STL":"St. Louis Blues","TBL":"Tampa Bay Lightning", "TOR":"Toronto Maple Leafs", "VAN":"Vancouver Canucks", "VGK":"Vegas Golden Knights", "WSH":"Washington Capitals", "WPJ":"Winnipeg Jets"]
        
        return teamNames[name] ?? "What the hell happened???"
    }
    
    static func getTeamCityName(_ name: String) -> String
    {
        let teamNames = ["ANA":"Anaheim", "ARI":"Arizona", "BOS":"Boston", "BUF":"Buffalo", "CGY":"Calgary", "CAR":"Carolina", "CHI":"Chicago", "COL":"Colorado", "CBJ":"Columbus", "DAL":"Dallas", "DET":"Detroit", "EDM":"Edmonton","FLO":"Florida", "LAK":"Los Angeles", "MIN":"Minnesota", "MTL":"Montreal", "NSH":"Nashville", "NJD":"New Jersey", "NYI":"NY Islanders", "NYR":"NY Rangers", "OTT":"Ottawa", "PHI":"Philadelphia", "PIT":"Pittsburgh", "SEA":"Seattle", "SJS":"San Jose", "STL":"St. Louis","TBL":"Tampa Bay", "TOR":"Toronto", "VAN":"Vancouver", "VGK":"Las Vegas", "WSH":"Washington", "WPJ":"Winnipeg"]
        
        return teamNames[name] ?? "What the hell happened???"
    }
    
    static func getTeamName(_ name: String) -> String
    {
        let teamNames = ["ANA":"Ducks", "ARI":"Coytotes", "BOS":"Bruins", "BUF":"Sabres", "CGY":"Flames", "CAR":"Hurricanes", "CHI":"Blackhawks", "COL":"Avalanche", "CBJ":"Blue Jackets", "DAL":"Stars", "DET":"Red Wings", "EDM":"Oilers", "FLO":"Panthers", "LAK":"Kings", "MIN":"Wild", "MTL":"Canadiens", "NSH":"Predators", "NJD":"Devils", "NYI":"Islanders", "NYR":"Rangers", "OTT":"Senators", "PHI":"Flyers", "PIT":"Penguins", "SEA":"Kraken", "SJS":"Sharks", "STL":"Blues", "TBL":"Lightning", "TOR":"Maple Leafs", "VAN":"Canucks", "VGK":"Golden Knights", "WSH":"Capitals", "WPJ":"Jets"]
        
        return teamNames[name] ?? "What the hell happened???"
    }
    
    static func getIDByTeam(_ name: String) -> Int
    {
        let teamNames = ["ANA":29, "ARI":30, "BOS":11, "BUF":15, "CGY":23, "CAR":3, "CHI":20, "COL":22, "CBJ":19, "DAL":27, "DET":16, "EDM":24, "FLO":4, "LAK":28, "MIN":25, "MTL":14, "NSH":18, "NJD":7, "NYI":8, "NYR":9, "OTT":13, "PHI":6, "PIT":10, "SEA": 143, "SJS":26, "STL":17, "TBL":1, "TOR":12, "VAN":21, "VGK":142, "WSH":5, "WPJ":2]
        
        return teamNames[name]!
    }
    
    static func getTeamByID(_ teamId: Int) -> String
    {
        let teamIds = [29:"ANA", 30:"ARI", 11:"BOS", 15:"BUF", 23:"CGY", 3:"CAR", 20:"CHI", 22:"COL", 19:"CBJ", 27:"DAL", 16:"DET", 24:"EDM", 4:"FLO", 28:"LAK", 25:"MIN", 14:"MTL", 18:"NSH", 7:"NJD", 8:"NYI", 9:"NYR", 13:"OTT", 6:"PHI", 10:"PIT", 143:"SEA", 26:"SJS", 17:"STL", 1:"TBL", 12:"TOR", 21:"VAN", 142:"VGK", 5:"WSH", 2:"WPJ"]
        
        return teamIds[teamId]!
    }
    
    static func getVenueByTeam(_ name: String) -> String
    {
        let teamVenues = ["ANA":"Honda Center", "ARI":"Gila River Arena", "BOS":"TD Garden", "BUF":"KeyBank Center", "CGY":"Scotiabank Saddledome", "CAR":"PNC Arena", "CHI":"United Center", "COL":"Pepsi Center", "CBJ":"Nationwide Arena", "DAL":"American Airlines Center", "DET":"Little Caesars Arena", "EDM":"Rogers Place", "FLO":"BB&T Center", "LAK":"Staples Center", "MIN":"Xcel Energy Center", "MTL":"Bell Centre", "NSH":"Bridgestone Arena", "NJD":"Prudential Center", "NYI":"Nassau Veterans Memorial Coliseum", "NYR":"Madison Square Garden", "OTT":"Canadian Tire Centre", "PHI":"Wells Fargo Center", "PIT":"PPG Paints Arena", "SEA":"Climate Pledge Arena", "SJS":"SAP Center at San Jose", "STL":"Enterprise Center", "TBL":"Amalie Arena", "TOR":"Scotiabank Arena", "VAN":"Rogers Arena", "VGK":"T-Mobile Arena", "WSH":"Capital One Arena", "WPJ":"Bell MTS Place"]
        
        return teamVenues[name] ?? "What the hell happened???"
    }
}
