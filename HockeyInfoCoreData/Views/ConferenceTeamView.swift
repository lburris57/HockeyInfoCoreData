//
//  ConferenceTeamView.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 2/6/22.
//

import SwiftUI

struct ConferenceTeamView: View
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
                    Section(teamViewModel.conferences[0])
                    {
//                        ForEach(teamViewModel.easternConferenceTeams)
//                        {
//                            team in
//
//                            TeamNavLinkView(team: team)
//                        }

                    }
                    
                    Section(teamViewModel.conferences[1])
                    {
//                        ForEach(teamViewModel.westernConferenceTeams)
//                        {
//                            team in
//                        
//                            TeamNavLinkView(team: team)
//                        }

                    }
                }.listStyle(.plain)
                
            }
            .navigationTitle("Conference")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConferenceTeamView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceTeamView()
    }
}
