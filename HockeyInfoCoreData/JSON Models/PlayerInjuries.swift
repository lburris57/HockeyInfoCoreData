//
//  PlayerInjuries.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/7/22.
//
import Foundation

struct PlayerInjuries: Codable
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

        let id: Int
        let firstName: String
        let lastName: String
        let primaryPosition: String
        let jerseyNumber: Int
        let currentTeam: CurrentTeam?
        let currentRosterStatus: String
        let currentInjury: CurrentInjury
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

    let lastUpdatedOn: Date
    let players: [Player]
}
