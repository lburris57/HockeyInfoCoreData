//
//  DivisionTeamView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/31/22.
//
import SwiftUI

struct DivisionTeamView: View
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
                    Section(teamViewModel.divisions[0])
                    {
                        ForEach(teamViewModel.atlanticDivisionTeams)
                        {
                            team in
                        
                            TeamNavLinkView(team: team)
                        }

                    }
                    
                    Section(teamViewModel.divisions[1])
                    {
                        ForEach(teamViewModel.metropolitanDivisionTeams)
                        {
                            team in
                        
                            TeamNavLinkView(team: team)
                        }

                    }
                    
                    Section(teamViewModel.divisions[2])
                    {
                        ForEach(teamViewModel.centralDivisionTeams)
                        {
                            team in
                        
                            TeamNavLinkView(team: team)
                        }

                    }
                    
                    Section(teamViewModel.divisions[3])
                    {
                        ForEach(teamViewModel.pacificDivisionTeams)
                        {
                            team in
                        
                            TeamNavLinkView(team: team)
                        }

                    }
                }.listStyle(.plain)
                
            }
            .navigationTitle("Division")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct TeamView_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        DivisionTeamView()
//    }
//}
