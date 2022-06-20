//
//  GameLogView.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 7/19/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct GameLogView : View
{
    @EnvironmentObject var settings: UserSettingsViewModel
    
    var teamItem: TeamItem
    
    @State var selectedGameType = 0
    @State var gameTypes = ["Remaining Games", "Completed Games"]
    
    var body: some View
    {
        VStack
        {
            Spacer()
            
            getSelectedView(selectedGameType)
            
            Spacer()
            
            Picker("Games", selection: $selectedGameType)
            {
                ForEach(0 ..< 2)
                {
                    Text(self.gameTypes[$0]).tag($0)
                }
            }.pickerStyle(.segmented)
        }
    }
    
    func getSelectedView(_ selection: Int) -> AnyView
    {
        return selection == 0 ? AnyView(Text("Remaining Games View goes here...")) : AnyView(Text("Completed Games View goes here..."))
    }
}

#if DEBUG
struct GameLogView_Previews : PreviewProvider
{
    static var previews: some View
    {
        GameLogView(teamItem: TeamItem.allTeamItems()[5])
    }
}
#endif
