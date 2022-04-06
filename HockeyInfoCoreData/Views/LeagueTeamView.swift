//
//  LeagueTeamView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//
import SwiftUI

struct LeagueTeamView: View
{
    let teamViewModel = TeamViewModel()
    
    var body: some View
    {
        NavigationView
        {
            VStack()
            {
                List
                {
                    ForEach(teamViewModel.teams)
                    {
                        team in
                    
                        TeamNavLinkView(team: team)
                    }

                }.listStyle(.plain)
                
            }
            .navigationTitle("League")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LeagueTeamView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LeagueTeamView()
    }
}
