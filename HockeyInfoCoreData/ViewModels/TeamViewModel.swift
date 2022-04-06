//
//  TeamViewModel.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/31/22.
//
import Foundation

class TeamViewModel
{
    let teams = NHLTeam.allTeams()
    let conferences = ["Eastern Conference", "Western Conference"]
    let divisions = ["Atlantic Division", "Metropolitan Division", "Central Division", "Pacific Division"]
    let atlanticDivisionTeams = NHLTeam.allAtlanticDivisionTeams()
    let metropolitanDivisionTeams = NHLTeam.allMetropolitanDivisionTeams()
    let centralDivisionTeams = NHLTeam.allCentralDivisionTeams()
    let pacificDivisionTeams = NHLTeam.allPacificDivisionTeams()
    let easternConferenceTeams = NHLTeam.allEasternConferenceTeams()
    let westernConferenceTeams = NHLTeam.allWesternConferenceTeams()
}
