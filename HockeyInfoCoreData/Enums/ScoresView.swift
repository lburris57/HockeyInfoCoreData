//
//  ScoresView.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/20/22.
//
import SwiftUI

struct ScoresView: View
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
                
                HStack
                {
                    Spacer()
                    Text("Scores for \(formatDate(dateValue))")
                        .font(.headline).bold()
                        .padding(.horizontal)
                        .padding(.bottom)
                    Spacer()
                }
                
                List
                {
                    ForEach(0..<10)
                    {
                        _ in
                        
                        VStack(spacing: 0)
                        {
                            HStack(spacing: 5)
                            {
                                Image("ANA")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading)
                                {
                                    Text("Ducks")
                                    .font(.subheadline)
                                    .bold()
                                    
                                    Text("44-17-10")
                                }
                                .font(.caption)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing)
                                {
                                    Text("5").bold()
                                }
                                
                                Spacer(minLength: 165)
                            }
                            
                            VStack(alignment: .trailing, spacing: 0)
                            {
                                HStack
                                {
                                    Spacer(minLength: 225)
                                    
                                    Text(PeriodEnum.overtime.rawValue).bold()
                                    NavigationLink("", destination: ScheduleView())
                                }
                            }
                            
                            HStack(spacing: 5)
                            {
                                Image("WSH")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading)
                                {
                                    Text("Capitals")
                                    .font(.subheadline)
                                    .bold()
                                    
                                    Text("47-14-10")
                                }
                                .font(.caption)
                                
                                Spacer()
                                
                                VStack(alignment: .leading)
                                {
                                    Text("6").bold()
                                }
                                
                                Spacer(minLength: 165)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
            }
            .navigationTitle("Scores")
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

struct ScoresView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ScoresView()
    }
}
