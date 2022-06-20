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
                Image("user-group-icon")
                
                Text("Roster")
            }
            TeamStatsView(teamItem: teamItem).tabItem
            {
                Image("stats")
                
                Text("Stats")
            }
            Text("InjuriesView goes here...").tabItem
            {
                Image("first_aid_kit-4")

                Text("Injuries")
            }
            GameLogView(teamItem: TeamItem.allTeamItems()[5]).tabItem
            {
                Image("history")
                
                Text("Game Log")
            }
            VenueView(venue: Venue.allVenues()[29]).tabItem
            {
                Image("Library-icon")
                
                Text("Venue")
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
