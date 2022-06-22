//
//  TimeAndDateUtils.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import SwiftDate

class TimeAndDateUtils
{
    let season = UserSettingsViewModel().season
    
    static let allSeasonsArray = ["2007-2008","2008-2009","2009-2010","2010-2011","2011-2012","2012-2013","2013-2014","2014-2015","2015-2016","2016-2017","2017-2018","2018-2019","2019-2020","2020-2021",
    "2021-2022","2022-2023","2023-2024","2024-2025","2025-2026","2026-2027","2027-2028","2028-2029","2029-2030","2030-2031","2031-2032","2032-2033","2033-2034","2034-2035","2035-2036"]
    
    static func getDate(_ timestamp: String) -> String
    {
        let formatter = DateFormatter()
        
        var date = Date()
        
        formatter.dateFormat = Constants.GMT_FORMAT
        
        if TimeZone.current.isDaylightSavingTime()
        {
            date = (formatter.date(from: timestamp)?.addingTimeInterval(-(8*60*60)))!
        }
        else
        {
            date = (formatter.date(from: timestamp)?.addingTimeInterval(-(10*60*60)))!
        }
        
        return date.asLongDateFormattedString()
    }
    
    static func getTime(_ timestamp: String) -> String
    {
        let formatter = DateFormatter()
        
        var date = Date()
        
        formatter.dateFormat = Constants.GMT_FORMAT
        
        if TimeZone.current.isDaylightSavingTime()
        {
            date = (formatter.date(from: timestamp)?.addingTimeInterval(-(8*60*60)))!
        }
        else
        {
            date = (formatter.date(from: timestamp)?.addingTimeInterval(-(10*60*60)))!
        }
        
        return formatDateAsString(date, format: Constants.TIME_FORMAT)
        
    }
    
    static func getDateAndTime(_ timestamp: String) -> (String, String)
    {
        let formatter = DateFormatter()
        
        var date = Date()
        
        formatter.dateFormat = Constants.GMT_FORMAT
        
        if TimeZone.current.isDaylightSavingTime()
        {
            date = (formatter.date(from: timestamp)?.addingTimeInterval(-(8*60*60)))!
        }
        else
        {
            date = (formatter.date(from: timestamp)?.addingTimeInterval(-(10*60*60)))!
        }
        
        return (date.asLongDateFormattedString(), formatDateAsString(date, format: Constants.TIME_FORMAT))
    }
    
    static func getCurrentTimeRemainingString(_ currentPeriodSecondsRemaining: Int) -> String
    {
        var currentTimeRemainingString = ""
        
        if currentPeriodSecondsRemaining > 0
        {
            if currentPeriodSecondsRemaining >= 60
            {
                let mins = Int(currentPeriodSecondsRemaining / 60)
                let sixtyMins: Int = mins * 60
                let secs = currentPeriodSecondsRemaining - sixtyMins
                
                if(mins < 10)
                {
                    if(secs < 10)
                    {
                        currentTimeRemainingString = "0\(mins):0\(secs) Remaining"
                    }
                    else
                    {
                        currentTimeRemainingString = "0\(mins):\(secs) Remaining"
                    }
                }
                else
                {
                    if(secs < 10)
                    {
                        currentTimeRemainingString = "\(mins):0\(secs) Remaining"
                    }
                    else
                    {
                        currentTimeRemainingString = "\(mins):\(secs) Remaining"
                    }
                }
            }
            else
            {
                if(currentPeriodSecondsRemaining < 10)
                {
                    currentTimeRemainingString = "00:0\(currentPeriodSecondsRemaining) Remaining"
                }
                else
                {
                    currentTimeRemainingString = "00:\(currentPeriodSecondsRemaining) Remaining"
                }
            }
        }
        else
        {
            return currentTimeRemainingString
        }
        
        return currentTimeRemainingString
    }
    
    static func getTimeFromDate(_ date: Date) -> String
    {
        let formatter = DateFormatter()
        
        var formattableDate = date
        
        formatter.dateFormat = Constants.GMT_FORMAT
        
        if TimeZone.current.isDaylightSavingTime()
        {
            formattableDate = date.addingTimeInterval(-(8*60*60))
        }
        else
        {
            formattableDate = date.addingTimeInterval(-(10*60*60))
        }
        
        return formatDateAsString(formattableDate, format: Constants.TIME_FORMAT)
    }
    
    static func getCurrentDateAsString() -> String
    {
        return (Date().asLongDateFormattedString())
    }
    
    static func getCurrentDateAsStringInGMTFormat() -> String
    {
        return formatDateAsString(Date(), format: Constants.GMT_FORMAT)
    }
    
    static func getDateAsString(_ date: Date) -> String
    {
        return (date.asLongDateFormattedString())
    }
    
    static func getCurrentDateAsStringInWebServiceFormat() -> String
    {
        return (Date().asShortDateFormattedString())
    }
    
    static func createDateStringInWebServiceFormat(from beginDate: Date, to endDate: Date) -> String
    {
        return (beginDate.asShortDateFormattedString()) + "-" + (endDate.asShortDateFormattedString())
    }
    
    static func createUpdateDateStringInWebServiceFormat(from date: Date) -> String
    {
        return "since-" + date.asShortDateFormattedString()
    }
    
    static func getDate(fromString dateString: String, dateFormat format: String ) -> Date?
    {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.date(from: dateString)
    }
    
    static func formatDateAsString(_ date: Date, format: String) -> String
    {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    static func evaluateIfFutureDate(_ date: Date) -> Bool
    {
        date > Date() ? true : false
    }
    
    static func formattedYYYYMMDDDateStringToDDMMYYYY(dateString: String) -> String?
    {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString)
        {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MM/dd/yyyy"

            return outputFormatter.string(from: date)
        }

        return Constants.EMPTY_STRING
    }
    
    static func getCurrentSeason() -> String
    {
        let currentMonth = Int(Date().toFormat(Constants.MONTH_FORMAT))
        let currentYear = Int(Date().toFormat(Constants.YEAR_FORMAT))
        
        if let year = currentYear
        {
            return currentMonth! > 6 ? "\(year)-\(year + 1)" : "\(year - 1)-\(year)"
        }
        else
        {
            return Constants.S2021_2022
        }
    }
    
    static func getCurrentPlayoffSeason() -> String
    {
        let currentMonth = Int(Date().toFormat(Constants.MONTH_FORMAT))
        let currentYear = Int(Date().toFormat(Constants.YEAR_FORMAT))
        
        if let year = currentYear
        {
            return currentMonth! > 6 ? "\(year + 1)" : "\(year)"
        }
        else
        {
            return "2022"
        }
    }
    
    static func getSeasonSettingsArray() -> [String]
    {
        var seasonSettingsArray = [String]()
        
        for season in allSeasonsArray
        {
            seasonSettingsArray.append(season)
            
            if season == self.getCurrentSeason()
            {
                break
            }
        }
        
        return seasonSettingsArray
    }
    
    static func getPlayoffSeasonSettingsArray() -> [String]
    {
        var playoffSeasonSettingsArray = [String]()
        
        for season in allSeasonsArray
        {
            playoffSeasonSettingsArray.append(season.getSubstring(from: season, atIndex: 5))
            
            if season == self.getCurrentSeason()
            {
                break
            }
        }
        
        return playoffSeasonSettingsArray
    }
    
    static func isValidSetting(_ season: String, _ seasonType: String) -> Bool
    {
        let currentMonth = Int(Date().toFormat(Constants.MONTH_FORMAT))
        
        print("Current season is \(getCurrentSeason())")
        
        //  If prior season, return true
        if(season != getCurrentSeason() || seasonType != Constants.PLAYOFFS)
        {
            return true
        }
        else if(season == getCurrentSeason())
        {
            //  If current year and playoffs haven't started yet, return false
            if let currentMonth = currentMonth
            {
                if(seasonType == Constants.PLAYOFFS)
                {
                    return currentMonth >= 4 && currentMonth <= 6 ? true : false
                }
            }
        }
        
        return true
    }
    
    static func isValidSetting(_ season: String, _ isPlayoffs: Bool) -> Bool
    {
        let currentMonth = Int(Date().toFormat(Constants.MONTH_FORMAT))
        
        print("Current season is \(getCurrentSeason())")
        
        //  If prior season, return true
        if(season != getCurrentSeason() || !isPlayoffs)
        {
            return true
        }
        else if(season == getCurrentSeason())
        {
            //  If current year and playoffs haven't started yet, return false
            if let currentMonth = currentMonth
            {
                if(isPlayoffs)
                {
                    return currentMonth >= 4 && currentMonth <= 6 ? true : false
                }
            }
        }
        
        return true
    }
    
    func calculateMinCalendarValues() -> (Double)
    {
        let seasons = season.components(separatedBy: "-")
        
        //  Find the number of days from October 1st to current date
        let seasonStart = ("October 1, " + seasons[0]).asDate
        
        let daysSinceSeasonStart = seasonStart.daysBeforeNow
        
        //  Get the seconds since season start
        let secondsSinceSeasonStart = daysSinceSeasonStart.day! * Constants.SECONDS_PER_DAY
        
        return (Double(secondsSinceSeasonStart))
    }
    
    func calculateMaxCalendarValues() -> (Double)
    {
        let seasons = season.components(separatedBy: "-")
        
        //  Find the number of days from current date to June 30
        let seasonEnd = ("June 30, " + seasons[1]).asDate
        
        let daysTillSeasonEnds = seasonEnd.daysSinceNow
        
        let secondsTillSeasonEnds = daysTillSeasonEnds.day! * Constants.SECONDS_PER_DAY
        
        return (Double(secondsTillSeasonEnds))
    }
}
