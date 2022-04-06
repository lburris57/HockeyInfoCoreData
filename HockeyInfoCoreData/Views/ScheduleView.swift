//
//  ScheduleView.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import SwiftUI

struct ScheduleView: View
{
    @State var dateValue = Date()
    
    var body: some View
    {
        NavigationView
        {
            VStack(alignment: .leading, spacing: 0)
            {
                DatePicker("Choose a date:",
                        selection: $dateValue,
                        displayedComponents: .date)
                    .datePickerStyle(.graphical)
                
                Text("Scheduled games for \(formatDate(dateValue))")
                    .font(.subheadline).bold()
                    .padding(.horizontal)
                    .padding(.bottom)
                                
                ScrollView(showsIndicators: false)
                {
                    ForEach(0..<10)
                    {
                        _ in
                        
                        HStack(spacing: 5)
                        {
                            Text("7:00 PM").font(.caption).bold().padding(.horizontal)
                            Text("|").font(.largeTitle)
                            
                            VStack(alignment: .leading)
                            {
                                Text("St. Louis Blues @ NY Islanders")
                                Text("Nassau Veterans Memorial Coliseum")
                            }
                            .font(.caption)
                        }
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
            }
            .navigationTitle("Season Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                Button("Today")
                {
                    dateValue = Date()
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ScheduleView()
    }
}

func formatDate(_ date: Date) -> String
{
    let formatter = DateFormatter()
    
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    
    return formatter.string(from: date)
}


