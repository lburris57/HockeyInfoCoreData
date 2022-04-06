//
//  ScheduleEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//
import CoreData
import Foundation

extension ScheduleEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScheduleEntity>
    {
        return NSFetchRequest<ScheduleEntity>(entityName: "ScheduleEntity")
    }

    @NSManaged public var gameId: Int16
    @NSManaged public var date: String?
    @NSManaged public var time: String?
    @NSManaged public var homeTeam: String?
    @NSManaged public var awayTeam: String?
    @NSManaged public var playedStatus: String?
    @NSManaged public var homeScoreTotal: Int16
    @NSManaged public var awayScoreTotal: Int16
    @NSManaged public var numberOfPeriods: Int16
    @NSManaged public var homeShotsTotal: Int16
    @NSManaged public var awayShotsTotal: Int16
    @NSManaged public var scheduleStatus: String?
    @NSManaged public var currentTimeRemaining: Int16
    @NSManaged public var currentPeriod: Int16
    @NSManaged public var venue: String?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var team: TeamEntity?
    
    public var wrappedDate: String
    {
        date ?? Date().asShortDateFormattedString()
    }
    
    public var wrappedTime: String
    {
        time ?? "7:00 PM"
    }
    
    public var wrappedHomeTeam: String
    {
        homeTeam ?? Constants.EMPTY_STRING
    }
    
    public var wrappedAwayTeam: String
    {
        awayTeam ?? Constants.EMPTY_STRING
    }
    
    public var wrappedPlayedStatus: String
    {
        playedStatus ?? PlayedStatusEnum.unplayed.rawValue
    }
    
    public var wrappedScheduleStatus: String
    {
        scheduleStatus ?? PlayedStatusEnum.unplayed.rawValue
    }
    
    public var wrappedVenue: String
    {
        venue ?? Constants.EMPTY_STRING
    }
    
    public var wrappedLastUpdated: Date
    {
        lastUpdated ?? Date()
    }
    
    public var wrappedDateCreated: Date
    {
        dateCreated ?? Date()
    }
}

extension ScheduleEntity: Identifiable
{
}
