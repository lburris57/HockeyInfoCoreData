//
//  TeamRosterView.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 6/25/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct TeamRosterView : View
{
    @EnvironmentObject var settings: UserSettingsViewModel
    //@EnvironmentObject var teamInfo: TeamInformationViewModel
    
    var playersArray = [Player]()
    
    var teamItem: TeamItem
    
    var body: some View
    {
        VStack
        {
            Text("\(teamItem.teamName)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding(.top)
            
//            List
//            {
//                //if let players =  playersArray  //teamInfo.teamDictionary[teamItem.teamId]?.players
//            Section(header: Text("Forwards").font(.headline).foregroundColor(.black))
//            {
//                ForEach(playersArray, id:\.self)
//                {
//                    player in
//
//                    if player.position == PositionEnum.leftWing.rawValue || player.position == PositionEnum.center.rawValue || player.position == PositionEnum.rightWing.rawValue
//                    {
//                        NavigationLink(destination: Text("Player detail view for selected skater goes here..."))
//                        {
//                            HStack
//                            {
//                                Text("\(player.position)")
//                                Text("\(player.jerseyNumber)")
//                                Text("\(player.firstName) \(player.lastName)")
//                            }
//                        }
//                    }
//                }
//            }.padding(.top)
            
            
//                skaterSection
//
//                defensemanSection
//
//                goalieSection
//            }
        }.navigationBarTitle(Text("Roster Players for \(teamItem.teamName)"), displayMode: .inline)
    }
    
//    var skaterSection: some View
//    {
//        Section(header: Text("Forwards").font(.headline).foregroundColor(.black))
//        {
//            ForEach(playersArray, id:\.self)
//            {
//                player in
//
//                if player.position == PositionEnum.leftWing.rawValue || player.position == PositionEnum.center.rawValue || player.position == PositionEnum.rightWing.rawValue
//                {
//                    NavigationLink(destination: Text("Player detail view for selected skater goes here..."))
//                    {
//                        HStack
//                        {
//                            Text("\(player.position)")
//                            Text("\(player.jerseyNumber)")
//                            Text("\(player.firstName) \(player.lastName)")
//                        }
//                    }
//                }
//            }
//        }.padding(.top)
//    }
//
//    var defensemanSection: some View
//    {
//        Section(header: Text("Defensemen").font(.headline).foregroundColor(.black))
//        {
//            ForEach(playersArray, id:\.self)
//            {
//                player in
//
//                if player.position == PositionEnum.defenseman.rawValue
//                {
//                    NavigationLink(destination: Text("Player detail view for selected defenseman goes here..."))
//                    {
//                        HStack
//                        {
//                            Text("\(player.position)")
//                            Text("\(player.jerseyNumber)")
//                            Text("\(player.firstName) \(player.lastName)")
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    var goalieSection: some View
//    {
//        Section(header: Text("Goalies").font(.headline).foregroundColor(.black))
//        {
//            ForEach(playersArray, id:\.self)
//            {
//                player in
//
//                if player.position == PositionEnum.goalie.rawValue
//                {
//                    NavigationLink(destination: Text("Player detail view for selected goalie goes here..."))
//                    {
//                        HStack
//                        {
//                            Text("\(player.position)")
//                            Text("\(player.jerseyNumber)")
//                            Text("\(player.firstName) \(player.lastName)")
//                        }
//                    }
//                }
//            }
//        }
//    }
}

#if DEBUG
struct TeamRosterView_Previews : PreviewProvider
{
    static var previews: some View
    {
        TeamRosterView(teamItem: TeamItem.allTeamItems()[5]).environmentObject(UserSettingsViewModel())
    }
}
#endif
