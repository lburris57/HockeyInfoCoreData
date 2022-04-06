//
//  PlayerGameLogsForDate.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation

struct PlayerGameLogsForDate: Codable
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

        struct Player: Codable
        {
            let id: Int
            let firstName: String
            let lastName: String
            let position: String
            let jerseyNumber: Int
        }

        struct Team: Codable
        {
            let id: Int
            let abbreviation: String
        }

        struct Stat: Codable
        {
            struct Scoring: Codable
            {
                let goals: Int
                let assists: Int
                let primaryAssists: Int
                let powerplayPrimaryAssists: Int
                let shorthandedPrimaryAssists: Int
                let secondaryAssists: Int
                let powerplaySecondaryAssists: Int
                let shorthandedSecondaryAssists: Int
                let points: Int
                let hatTricks: Int
                let powerplayGoals: Int
                let powerplayAssists: Int
                let powerplayPoints: Int
                let shorthandedGoals: Int
                let shorthandedAssists: Int
                let shorthandedPoints: Int
                let gameWinningGoals: Int
                let gameTyingGoals: Int
                let overtimeGoals: Int
                let shootoutAttempts: Int
                let shootoutMisses: Int
                let shootoutGoals: Int
                let shootoutGoalPercent: Int
            }

            struct Skating: Codable
            {
                let plusMinus: Int
                let shotAttempts: Int
                let shots: Int
                let shotPercentage: Int
                let blockedShots: Int
                let blockedShotsAgainst: Int
                let missedShots: Int
                let hits: Int
                let hitsReceived: Int
                let giveaways: Int
                let takeaways: Int
                let faceoffs: Int
                let faceoffWins: Int
                let faceoffLosses: Int
                let faceoffPercent: Double
            }

            struct Penalty: Codable
            {
                let penalties: Int
                let penaltyMinutes: Int
                let minorPenalties: Int
                let minorPenaltyMinutes: Int
                let majorPenalties: Int
                let majorPenaltyMinutes: Int
                let doubleMinorPenalties: Int
                let doubleMinorPenaltyMinutes: Int
                let matchPenalties: Int
                let misconductPenalties: Int
                let misconductPenaltyMinutes: Int
                let penaltiesDrawn: Int
                let penaltyMinutesDrawn: Int
                let fights: Int
            }

            struct Shift: Codable
            {
                let shifts: Int
                let evenStrengthShifts: Int
                let powerplayShifts: Int
                let shorthandedShifts: Int
                let timeOnIceSeconds: Int
                let evenStrengthTimeOnIceSeconds: Int
                let powerplayTimeOnIceSeconds: Int
                let shorthandedTimeOnIceSeconds: Int
            }

            struct Goaltending: Codable
            {
                let wins: Int
                let losses: Int
                let overtimeWins: Int
                let overtimeLosses: Int
                let shootoutWins: Int
                let shootoutLosses: Int
                let goalsAgainst: Int
                let evenStrengthGoalsAgainst: Int
                let powerplayGoalsAgainst: Int
                let shorthandedGoalsAgainst: Int
                let shotsAgainst: Int
                let evenStrengthShotsAgainst: Int
                let powerplayShotsAgainst: Int
                let shorthandedShotsAgainst: Int
                let overtimeGoalsAgainst: Int
                let saves: Int
                let evenStrengthSaves: Int
                let powerplaySaves: Int
                let shorthandedSaves: Int
                let goalsAgainstAverage: Int
                let savePercentage: Double
                let shutouts: Int
                let gamesStarted: Int
                let creditForGame: Int
                let shootoutDefences: Int
                let shootoutSaves: Int
                let shootoutSavePercent: Int
                let shootoutGoalsAgainst: Int
                let minutesPlayed: Int
            }

            let scoring: Scoring
            let skating: Skating?
            let penalties: Penalty
            let shifts: Shift
            let goaltending: Goaltending?
        }

        let game: Game
        let player: Player
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

            let id: Int
            let name: String
            let city: String
            let country: String
            let geoCoordinates: GeoCoordinate
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

        struct PlayerReference: Codable
        {
            struct CurrentTeam: Codable
            {
                let id: Int
                let abbreviation: String
            }

            struct CurrentInjury: Codable
            {
                let description: String
                let playingProbability: String
            }

            struct Handedness: Codable
            {
                let shoots: String?
                let catches: String?
            }

            struct SocialMediaAccount: Codable
            {
                let mediaType: String
                let value: String
            }

            let id: Int
            let firstName: String
            let lastName: String
            let primaryPosition: String
            let jerseyNumber: Int
            let currentTeam: CurrentTeam
            let currentRosterStatus: String
            let currentInjury: CurrentInjury?
            let height: String
            let weight: Int
            let birthDate: String
            let age: Int
            let birthCity: String
            let birthCountry: String
            let rookie: Bool
            let highSchool: String?
            let college: String?
            let handedness: Handedness
            let officialImageSrc: URL?
            let socialMediaAccounts: [SocialMediaAccount]
        }

        struct PlayerStatReference: Codable
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
        let playerReferences: [PlayerReference]
        let playerStatReferences: [PlayerStatReference]
    }

    let lastUpdatedOn: Date
    let gamelogs: [Gamelog]
    let references: Reference
}
