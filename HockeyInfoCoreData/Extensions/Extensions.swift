//
//  Extensions.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import Foundation
import UIKit

extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int)
    {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int)
    {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}

extension Array
{
    func randomValue() -> Element
    {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}

public extension Sequence
{
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]]
    {
        var categories: [U: [Iterator.Element]] = [:]
        for element in self
        {
            let key = key(element)
            if categories[key] == nil
            {
                categories[key] = [element]
            }
            else
            {
                categories[key]?.append(element)
            }
        }
        
        return categories
    }
}

extension Date
{
    func isThisMonth() -> Bool
    {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "yyyy MM"
        
        let dateString = monthFormatter.string(from: self)
        let currentDateString = monthFormatter.string(from: Date())
        return dateString == currentDateString
    }
}

extension String
{
    func fromBase64() -> String?
    {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else
        {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String?
    {
        guard let data = self.data(using: String.Encoding.utf8) else
        {
            return nil
        }
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}

extension Int: Sequence
{
    public func makeIterator() -> CountableRange<Int>.Iterator
    {
        return (0..<self).makeIterator()
    }
}
