//
//  TeamView.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/31/22.
//
import SwiftUI

struct TeamView: View
{
    @StateObject var teamsViewModel = TeamsViewModel()
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(teamsViewModel.teams)
                {
                    team in
                    
                    NavigationLink
                    {
                        Text(team.city + " " + team.name)
                    }
                label:
                    {
                        HStack
                        {
                            Image(team.abbreviation)
                                .resizable()
                                .frame(width: 40, height: 30)
                                .scaledToFit()
                            
                            Text(team.city + " " + team.name)
                        }
                    }
                    
                }
            }
            .listStyle(.plain)
            .task
            {
                await teamsViewModel.fetchDataFromWebService()
            }
            .navigationTitle("NHL Teams")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TeamView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TeamView()
    }
}
