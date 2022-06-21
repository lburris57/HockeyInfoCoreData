//
//  MainMenuView.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 6/16/22.
//  Copyright © 2022 Larry Burris. All rights reserved.
//
import SwiftUI

struct MainMenuView : View
{
    var body: some View
    {
        return NavigationView
        {
            ZStack
            {
                List
                {
                    NavigationLink(destination: ScheduleView())
                    {
                        HStack
                        {
                            Image("scheduleCategory").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Season Schedule")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("info").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Team Information List")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("positioning").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Standings")
                        }
                    }

                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("scoreCategory").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Scores")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("searchPlayersCategory").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Search Players")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("Hockey_IceSkate").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Skater Leaders")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("ice-hockey-helmet-icon").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Goalie Leaders")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("first-aid-bag").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Player Injuries")
                        }
                    }
                    
                    NavigationLink(destination: TeamTabView())
                    {
                        HStack
                        {
                            Image("gear-2").resizable().frame(width: 45, height: 45).aspectRatio(contentMode: .fit)
                            
                            Text("Season Settings")
                        }
                    }
                }.navigationBarTitle(Text("Main Menu"), displayMode: .inline)
                    .listStyle(.plain)
            }
        }
    }
}
    

#if DEBUG
struct MainMenuView_Previews : PreviewProvider
{
    static var previews: some View
    {
        MainMenuView()
    }
}
#endif
