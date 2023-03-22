//
//  VenueView.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 6/30/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI

struct VenueView : View
{
    var venue: Venue
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Image(venue.imageName).resizable().frame(width: 40, height: 25)
                    .aspectRatio(contentMode: .fit)
                Text(venue.teamName).font(.headline).minimumScaleFactor(0.75)
            }
            
            Image(venue.venueName).resizable().cornerRadius(15).frame(height: 200).padding(.horizontal)
            Text(venue.venueName).font(.headline)
            Text(venue.address).font(.subheadline).bold().minimumScaleFactor(0.75).padding(3)
            Text("Seats \(venue.seating)").font(.subheadline).bold()
            
            MapView(venue: venue).cornerRadius(15).padding(5)
        }
    }
}

#if DEBUG
struct VenueView_Previews : PreviewProvider
{
    static var previews: some View
    {
        VenueView(venue: Venue.allVenues()[3])
    }
}
#endif
