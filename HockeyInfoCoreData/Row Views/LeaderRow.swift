//
//  LeaderRow.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 7/18/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct LeaderRow : View
{
    var player: Player
    var index: Int = 1
    var category: String = "goals"
    
    var body: some View
    {
        HStack
        {
            Text("\(index).  \(player.firstName) \(player.lastName), \(player.teamAbbreviation)").padding(5).padding(.leading)
            
            if(category == "points")
            {
                Text("\(player.playerStatistics[0].points)").padding(5).padding(.trailing)
            }
            else if(category == "goals")
            {
                Text("\(player.playerStatistics[0].goals)").padding(5).padding(.trailing)
            }
            else if(category == "assists")
            {
                Text("\(player.playerStatistics[0].assists)").padding(5).padding(.trailing)
            }
            else if(category == "plusMinus")
            {
                Text("\(player.playerStatistics[0].plusMinus)").padding(5).padding(.trailing)
            }
            else if(category == "goalsAgainstAverage")
            {
                Text("\(player.playerStatistics[0].goalsAgainstAverage)").padding(5).padding(.trailing)
            }
            else if(category == "savePercentage")
            {
                Text("\(player.playerStatistics[0].savePercentage)").padding(5).padding(.trailing)
            }
            else if(category == "wins")
            {
                Text("\(player.playerStatistics[0].wins)").padding(5).padding(.trailing)
            }
            else if(category == "shutouts")
            {
                Text("\(player.playerStatistics[0].shutouts)").padding(5).padding(.trailing)
            }
        }
    }
}

//#if DEBUG
//struct LeaderRow_Previews : PreviewProvider
//{
//    static var previews: some View
//    {
//        LeaderRow(player: DBManager().retrieveAllPlayers()[0], index: 0, category: "goals")
//    }
//}
//#endif
