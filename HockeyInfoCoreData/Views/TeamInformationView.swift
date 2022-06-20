//
//  TeamInformationView.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 6/25/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct TeamInformationView : View
{
    //@EnvironmentObject var settings: UserSettings
    
    var teamItem: TeamItem
    
    var body: some View
    {
        TabView()
        {
            Text("RosterView goes here...").tabItem
            {
                Label("Roster", systemImage: "person.3")
            }
            TeamStatsView(teamItem: teamItem).tabItem
            {
                Label("Stats", systemImage: "list.clipboard.fill")
            }
            Text("InjuriesView goes here...").tabItem
            {
                Label("Injuries", systemImage: "figure.fall")
            }
            GameLogView(teamItem: TeamItem.allTeamItems()[5]).tabItem
            {
                Label("Game Log", systemImage: "scroll.fill")
            }
            VenueView(venue: Venue.allVenues()[29]).tabItem
            {
                Label("Venue", systemImage: "building.columns.fill")
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

#if DEBUG
struct TeamInformationView_Previews : PreviewProvider
{
    static var previews: some View
    {
        TeamInformationView(teamItem: TeamItem.allTeamItems()[27])
    }
}
#endif
