//
//  TeamStatsView.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 6/25/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct TeamStatsView : View
{
    @EnvironmentObject var settings: UserSettingsViewModel
    
    var teamItem: TeamItem
    
    var body: some View
    {
        Text("Team Stats View for \(teamItem.teamName)!")
    }
}

#if DEBUG
struct TeamStatsView_Previews : PreviewProvider
{
    static var previews: some View
    {
        TeamStatsView(teamItem: TeamItem.allTeamItems()[27]).environmentObject(UserSettingsViewModel())
    }
}
#endif
