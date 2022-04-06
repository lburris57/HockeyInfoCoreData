//
//  SeasonalPlayers.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation

struct SeasonalPlayers: Codable
{
    struct Player: Codable
    {
        struct Player: Codable
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

            struct CurrentContractYear: Codable
            {
                struct OverallContract: Codable
                {
                    struct SigningTeam: Codable
                    {
                        let id: Int
                        let abbreviation: String
                    }

                    let signingTeam: SigningTeam
                    let signedOn: Date?
                    let totalYears: Int
                    let totalSalary: Int
                    let totalBonuses: Int
                    let expiryStatus: String?
                    let annualAverageSalary: Int
                }

                let seasonStartYear: Int
                let baseSalary: Int
                let minorsSalary: Int
                let signingBonus: Int
                let otherBonuses: Int
                let capHit: Int
                let fullNoTradeClause: Bool
                let modifiedNoTradeClause: Bool
                let noMovementClause: Bool
                let overallContract: OverallContract
            }

            struct Drafted: Codable
            {
                struct Team: Codable
                {
                    let id: Int
                    let abbreviation: String
                }

                struct PickTeam: Codable
                {
                    let id: Int
                    let abbreviation: String
                }

                let year: Int
                let team: Team
                let pickTeam: PickTeam
                let round: Int
                let roundPick: Int
                let overallPick: Int
            }

            struct ExternalMapping: Codable
            {
                let source: String
                let id: Int
            }

            let id: Int
            let firstName: String
            let lastName: String
            let primaryPosition: String
            let alternatePositions: [String]
            let jerseyNumber: Int?
            let currentTeam: CurrentTeam?
            let currentRosterStatus: String
            let currentInjury: CurrentInjury?
            let height: String?
            let weight: Int?
            let birthDate: String?
            let age: Int?
            let birthCity: String?
            let birthCountry: String?
            let rookie: Bool
            let highSchool: String?
            let college: String?
            let handedness: Handedness
            let officialImageSrc: URL?
            let socialMediaAccounts: [SocialMediaAccount]
            let currentContractYear: CurrentContractYear?
            let drafted: Drafted?
            let externalMappings: [ExternalMapping]
        }

        struct TeamAsOfDate: Codable
        {
            let id: Int
            let abbreviation: String
        }

        let player: Player
        let teamAsOfDate: TeamAsOfDate?
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
    let players: [Player]
    let references: Reference
}
