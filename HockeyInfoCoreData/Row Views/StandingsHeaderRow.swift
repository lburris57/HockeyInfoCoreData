//
//  StandingsHeaderRow.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 7/19/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//

import SwiftUI

struct StandingsHeaderRow : View
{
    var headerName: String
    
    var body: some View
    {
        Text("\(headerName)       GP        W        L        OTL        PTS")
                .font(.custom("Monospaced", size: 15)).multilineTextAlignment(.leading).background(Color.black).foregroundColor(Color.white)
    }
}

#if DEBUG
struct StandingsHeaderRow_Previews : PreviewProvider
{
    static var previews: some View
    {
        StandingsHeaderRow(headerName: "Atlantic Division")
    }
}
#endif
