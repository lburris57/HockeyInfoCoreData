//
//  TeamView.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/31/22.
//
import SwiftUI

struct TeamView: View
{
    let teamViewModel = TeamViewModel()
    
    var body: some View
    {
        List
        {
            ForEach(teamViewModel.teams)
            {
                team in
                
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
}

struct TeamView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TeamView()
    }
}
