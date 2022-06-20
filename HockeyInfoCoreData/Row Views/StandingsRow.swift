//
//  StandingsRow.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 7/19/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct StandingsRow : View
{
    var teamStandings: TeamStandings
    
    var body: some View
    {
        HStack
        {
            Text("\(TeamManager.getFullTeamName(teamStandings.abbreviation))").font(.custom("Monospaced", size: 11)).bold().padding(.top)
            
            Spacer()
            
            Text(" \(teamStandings.gamesPlayed)        \(teamStandings.wins)       \(teamStandings.losses)            \(teamStandings.overtimeLosses)           \(teamStandings.points)")
                .font(.custom("Monospaced", size: 15)).padding(.top)
        }
    }
}
