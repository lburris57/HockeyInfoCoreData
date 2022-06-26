//
//  TeamNavLinkView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 2/6/22.
//
import SwiftUI

struct TeamNavLinkView: View
{
    let team: TeamDisplayData
    
    var body: some View
    {
        NavigationLink(destination: Text(team.city + " " + team.name + " roster goes here..."))
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
