//
//  DailyTeamGameLogs.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation

struct DailyTeamGameLogs: Codable
{
    struct Gamelog: Codable
    {
        struct Game: Codable
        {
            let id: Int
            let startTime: Date
            let awayTeamAbbreviation: String
            let homeTeamAbbreviation: String
        }

        struct Team: Codable
        {
            let id: Int
            let abbreviation: String
        }

        struct Stat: Codable
        {
            struct Standing: Codable
            {
                let wins: Int
                let losses: Int
                let overtimeWins: Int
                let overtimeLosses: Int
                let shootoutWins: Int
                let shootoutLosses: Int
                let points: Int
                let pointsPercent: Double
            }

            struct Faceoff: Codable
            {
                let faceoffs: Int
                let faceoffWins: Int
                let faceoffLosses: Int
                let faceoffPercent: Double
            }

            struct Powerplay: Codable
            {
                let powerplays: Int
                let powerplayGoals: Int
                let powerplayPercent: Int
                let penaltyKills: Int
                let penaltyKillGoalsAllowed: Int
                let penaltyKillPercent: Int
                let shorthandedGoalsFor: Int
                let shorthandedGoalsAgainst: Int
            }

            struct Miscellaneous: Codable
            {
                let goalsFor: Int
                let goalsAgainst: Int
                let shAttFor: Int
                let shAttAgainst: Int
                let shots: Int
                let shAgainst: Int
                let shMissFor: Int
                let shMissAgainst: Int
                let blockedShots: Int
                let blockedShotsAgainst: Int
                let penalties: Int
                let penaltyMinutes: Int
                let penaltiesDrawn: Int
                let penaltyMinutesDrawn: Int
                let fights: Int
                let hits: Int
                let hitsReceived: Int
                let giveaways: Int
                let takeaways: Int
                let soAttFor: Int
                let soGoalsFor: Int
                let soAttAgainst: Int
                let soGoalsAgainst: Int
            }

            let standings: Standing
            let faceoffs: Faceoff
            let powerplay: Powerplay
            let miscellaneous: Miscellaneous
        }

        let game: Game
        let team: Team
        let stats: Stat
    }

    struct Reference: Codable
    {
        struct TeamReference: Codable
        {
            struct HomeVenue: Codable
            {
                let id: Int
                let name: String
            }

            struct SocialMediaAccount: Codable
            {
                let mediaType: String
                let value: String
            }

            let id: Int
            let city: String
            let name: String
            let abbreviation: String
            let homeVenue: HomeVenue
            let teamColoursHex: [String]
            let socialMediaAccounts: [SocialMediaAccount]
            let officialLogoImageSrc: URL
        }

        struct VenueReference: Codable
        {
            struct GeoCoordinate: Codable
            {
                let latitude: Double
                let longitude: Double
            }
        }

        struct GameReference: Codable
        {
            struct AwayTeam: Codable
            {
                let id: Int
                let abbreviation: String
            }

            struct HomeTeam: Codable
            {
                let id: Int
                let abbreviation: String
            }

            struct Venue: Codable
            {
                let id: Int
                let name: String
            }

            struct Official: Codable
            {
                let id: Int
                let title: String
                let firstName: String
                let lastName: String
            }

            let id: Int
            let startTime: Date
            let endedTime: Date?
            let awayTeam: AwayTeam
            let homeTeam: HomeTeam
            let venue: Venue
            let venueAllegiance: String
            let scheduleStatus: String
            let originalStartTime: Date?
            let delayedOrPostponedReason: String?
            let playedStatus: String
            let attendance: Int
            let officials: [Official]
            let broadcasters: [String]
        }

        struct TeamStatReference: Codable
        {
            let category: String
            let fullName: String
            let description: String
            let abbreviation: String
            let type: String
        }

        let teamReferences: [TeamReference]
        let venueReferences: [VenueReference]
        let gameReferences: [GameReference]
        let teamStatReferences: [TeamStatReference]
    }

    let lastUpdatedOn: Date
    let gamelogs: [Gamelog]
    let references: Reference
}
