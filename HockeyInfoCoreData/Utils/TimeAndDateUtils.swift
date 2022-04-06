//
//  TimeAndDateUtils.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation

class TimeAndDateUtils
{
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
}
