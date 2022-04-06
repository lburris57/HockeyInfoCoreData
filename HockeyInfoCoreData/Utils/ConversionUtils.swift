//
//  ConversionUtils.swift
//  HockeyDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import UIKit

class ConversionUtils
{
    static func retrievePlayedStatusFromNumberOfPeriods(_ numberOfPeriods: Int) -> String
    {
        switch numberOfPeriods
        {
            case 3: return PeriodEnum.final.rawValue
            case 4: return PeriodEnum.overtime.rawValue
            case 5: return PeriodEnum.shootout.rawValue
            case 6: return PeriodEnum.doubleOvertime.rawValue
            case 7: return PeriodEnum.tripleOvertime.rawValue
            case 8: return PeriodEnum.quadrupleOvertime.rawValue
            default: return PeriodEnum.final.rawValue
        }
    }
    
    static func normalizeRank(_ rank: Int) -> String
    {
        switch(rank)
        {
            case 1: return String(rank) + "st"
            case 2: return String(rank) + "nd"
            case 3: return String(rank) + "rd"
            default: return String(rank) + "th"
        }
    }
    
    static func removeRemainingText(_ text: String) -> String
    {
        return text.replacingOccurrences(of: " Remaining", with: "")
    }
    
    static func removeEmptyNetText(_ text: String) -> String
    {
        return text.replacingOccurrences(of: "(Empty Net) ", with: "")
    }
    
    static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage
    {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

        return newImage!
    }
}
