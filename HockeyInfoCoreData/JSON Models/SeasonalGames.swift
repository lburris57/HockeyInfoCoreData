//
//  SeasonalGames.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation

struct SeasonalGames: Codable
{
    let lastUpdatedOn: Date
    let games: [Game]
    
    struct Game: Codable
    {
        struct Schedule: Codable
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
            let attendance: Int?
            let broadcasters: [String]
        }

        struct Score: Codable
        {
            struct Period: Codable
            {
                let periodNumber: Int
                let awayScore: Int
                let awayShots: Int?
                let homeScore: Int
                let homeShots: Int?
            }

            let currentPeriod: Int?
            let currentPeriodSecondsRemaining: Int?
            let currentIntermission: Int?
            let awayScoreTotal: Int?
            let awayShotsTotal: Int?
            let homeScoreTotal: Int?
            let homeShotsTotal: Int?
            let periods: [Period]
        }

        let schedule: Schedule
        let score: Score
    }
}
