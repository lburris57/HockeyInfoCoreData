//
//  TeamTabView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//
import SwiftUI

struct TeamTabView: View
{
    var body: some View
    {
        TabView
        {
            DivisionTeamView()
            .tabItem
            {
                Label("Division", systemImage: "d.circle.fill")
            }
            
            ConferenceTeamView()
            .tabItem
            {
                Label("Conference", systemImage: "c.circle.fill")
            }

            LeagueTeamView()
            .tabItem
            {
                Label("League", systemImage: "l.circle.fill")
            }
        }
    }
}

struct TeamTabView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TeamTabView()
    }
}
