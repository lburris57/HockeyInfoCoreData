//
//  GamesForDate.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation

struct GameForDate: Codable
{
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
            let attendance: Int?
            let officials: [Official]
            let broadcasters: [String]
        }

        struct Score: Codable
        {
            struct Period: Codable
            {
                let periodNumber: Int
                let awayScore: Int
                let awayShots: Int
                let homeScore: Int
                let homeShots: Int
            }

            let currentPeriod: Int?
            let currentPeriodSecondsRemaining: Int?
            let currentIntermission: Int?
            let awayScoreTotal: Int
            let awayShotsTotal: Int
            let homeScoreTotal: Int
            let homeShotsTotal: Int
            let periods: [Period]
        }

        let schedule: Schedule
        let score: Score
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

            let id: Int
            let name: String
            let city: String
            let country: String
            let geoCoordinates: GeoCoordinate
        }

        let teamReferences: [TeamReference]
        let venueReferences: [VenueReference]
    }

    let lastUpdatedOn: Date
    let games: [Game]
    let references: Reference
}
