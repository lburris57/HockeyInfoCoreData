//
//  Venue.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import SwiftUI

struct Venue : Identifiable
{
    var id = UUID()
    var imageName: String
    var teamName: String
    var venueName: String
    var seating: Int
    var address: String
    var latitude: Double
    var longitude: Double
}

extension Venue
{
    static func allVenues() -> [Venue]
    {
        return[
            Venue(imageName: "ANA", teamName: "Anaheim Ducks", venueName: "Honda Center", seating: 17174, address: "2695 East Katella Ave, Anaheim, CA 92806", latitude: 33.80778, longitude: -117.876667),
            Venue(imageName: "ARI", teamName: "Arizona Coytotes", venueName: "Gila River Arena", seating: 17125, address: "9400 West Maryland Avenue, Glendale, AZ 85305", latitude: 33.531944, longitude: -112.261111),
            Venue(imageName: "BOS", teamName: "Boston Bruins", venueName: "TD Garden", seating: 17565, address: "100 Legends Way, Boston, MA 02114", latitude: 42.366303, longitude: -71.062228),
            Venue(imageName: "BUF", teamName: "Buffalo Sabres", venueName: "Key Bank Center", seating: 19070, address: "1 Seymour H. Knox III Plaza, Buffalo, NY 14203", latitude: 42.875, longitude: -78.876389),
            Venue(imageName: "CGY", teamName: "Calgary Flames", venueName: "Scotiabank Saddledome", seating: 19289, address: "555 Saddledome Rise SE, Calgary, Alberta T2G 2W1, Canada", latitude: 51.0375, longitude: -114.051944),
            Venue(imageName: "CAR", teamName: "Carolina Hurricanes", venueName: "PNC Arena", seating: 18680, address: "1400 Edwards Mill Rd, Raleigh, NC 27607", latitude: 35.803333, longitude: -78.721944),
            Venue(imageName: "CHI", teamName: "Chicago Blackhawks", venueName: "United Center", seating: 23500, address: "1901 W Madison St, Chicago, IL 60612", latitude: 41.880556, longitude: -87.674167),
            Venue(imageName: "COL", teamName: "Colorado Avalanche", venueName: "Pepsi Center", seating: 18007, address: "1000 Chopper Cir, Denver, CO 80204", latitude: 39.748611, longitude: -105.0075),
            Venue(imageName: "CBJ", teamName: "Columbus Blue Jackets", venueName: "Nationwide Arena", seating: 20000, address: "200 W Nationwide Blvd, Columbus, OH 43215", latitude: 39.969283, longitude: -83.006111),
            Venue(imageName: "DAL", teamName: "Dallas Stars", venueName: "American Airlines Center", seating: 20000, address: "2500 Victory Ave, Dallas, TX 75219", latitude: 32.790556, longitude: -96.810278),
            Venue(imageName: "DET", teamName: "Detroit Red Wings", venueName: "Little Caesars Arena", seating: 19515, address: "2645 Woodward Ave, Detroit, MI 48201", latitude: 42.341111, longitude: -83.055),
            Venue(imageName: "EDM", teamName: "Edmonton Oilers", venueName: "Rogers Place", seating: 18347, address: "10220 104 Ave NW, Edmonton, AB T5H 2X6, Canada", latitude: 53.546944, longitude: -113.497778),
            Venue(imageName: "FLO", teamName: "Florida Panthers", venueName: "BB&T Center", seating: 20737, address: "1 Panther Pkwy, Sunrise, FL 33323", latitude: 26.158333, longitude: -80.325556),
            Venue(imageName: "LAK", teamName: "Los Angeles Kings", venueName: "Staples Center", seating: 21000, address: "1111 S Figueroa St, Los Angeles, CA 90015", latitude: 34.043056, longitude: -118.267222),
            Venue(imageName: "MIN", teamName: "Minnesota Wild", venueName: "Xcel Energy Center", seating: 20554, address: "199 W Kellogg Blvd, St Paul, MN 55102", latitude: 44.944722, longitude: -93.101111),
            Venue(imageName: "MTL", teamName: "Montreal Canadiens", venueName: "Bell Centre", seating: 21273, address: "1909 Avenue des Canadiens-de-Montréal, Montréal, QC H4B 5G0, Canada", latitude: 45.496111, longitude: -73.569444),
            Venue(imageName: "NSH", teamName: "Nashville Predators", venueName: "Bridgestone Arena", seating: 19500, address: "501 Broadway, Nashville, TN 37203", latitude: 36.159167, longitude: -86.778611),
            Venue(imageName: "NJD", teamName: "New Jersey Devils", venueName: "Prudential Center", seating: 16514, address: "25 Lafayette St, Newark, NJ 07102", latitude: 40.733611, longitude: -74.171111),
            Venue(imageName: "NYI", teamName: "New York Islanders", venueName: "Barclays Center", seating: 19000, address: "620 Atlantic Ave, Brooklyn, NY 11217", latitude: 40.682661, longitude: -73.975225),
            Venue(imageName: "NYR", teamName: "New York Rangers", venueName: "Madison Square Garden", seating: 20789, address: "4 Pennsylvania Plaza, New York, NY 10001", latitude: 40.750556, longitude: -73.993611),
            Venue(imageName: "OTT", teamName: "Ottawa Senators", venueName: "Canadian Tire Centre", seating: 17000, address: "1000 Palladium Dr, Ottawa, ON K2V 1A5, Canada", latitude: 45.296944, longitude: -75.927222),
            Venue(imageName: "PHI", teamName: "Philadelphia Flyers", venueName: "Wells Fargo Center", seating: 19500, address: "3601 S Broad St, Philadelphia, PA 19148", latitude: 39.901111, longitude: -75.171944),
            Venue(imageName: "PIT", teamName: "Pittsburgh Penguins", venueName: "PPG Paints Arena", seating: 19758, address: "1001 Fifth Ave, Pittsburgh, PA 15219", latitude: 40.439444, longitude: -79.989167),
            Venue(imageName: "SEA", teamName: "Seattle Kraken", venueName: "Climate Pledge Arena", seating: 17459, address: "334 1st Ave N, Seattle, WA 98109", latitude: 47.621378, longitude: -122.355309),
            Venue(imageName: "SJS", teamName: "San Jose Sharks", venueName: "SAP Center", seating: 17496, address: "525 W Santa Clara St, San Jose, CA 95113", latitude: 37.332778, longitude: -121.901111),
            Venue(imageName: "STL", teamName: "St. Louis Blues", venueName: "Enterprise Center", seating: 19260, address: "1401 Clark Ave, St. Louis, MO 63103", latitude: 38.626667, longitude: -90.2025),
            Venue(imageName: "TBL", teamName: "Tampa Bay Lightning", venueName: "Amalie Arena", seating: 20500, address: "401 Channelside Dr, Tampa, FL 33602", latitude: 27.942778, longitude: -82.451944),
            Venue(imageName: "TOR", teamName: "Toronto Maple Leafs", venueName: "Scotiabank Arena", seating: 19800, address: "40 Bay St, Toronto, ON M5J 2X2, Canada", latitude: 43.643333, longitude: -79.379167),
            Venue(imageName: "VAN", teamName: "Vancouver Canucks", venueName: "Rogers Arena", seating: 18910, address: "800 Griffiths Way, Vancouver, BC V6B 6G1, Canada", latitude: 49.277778, longitude: -123.108889),
            Venue(imageName: "VGK", teamName: "Vegas Golden Knights", venueName: "T-Mobile Arena", seating: 17500, address: "3780 S Las Vegas Blvd, Las Vegas, NV 89158", latitude: 36.102778, longitude: -115.178333),
            Venue(imageName: "WSH", teamName: "Washington Capitals", venueName: "Capital One Arena", seating: 20356, address: "601 F St NW, Washington, DC 20004", latitude: 38.898056, longitude: -77.020833),
            Venue(imageName: "WPJ", teamName: "Winnipeg Jets", venueName: "Bell MTS Place", seating: 16345, address: "300 Portage Ave, Winnipeg, MB R3K 1W4, Canada", latitude: 49.892778, longitude: -97.143611)
        ]
    }
}
