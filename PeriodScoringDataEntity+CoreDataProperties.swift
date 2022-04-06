//
//  PeriodScoringDataEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//
import CoreData
import Foundation

extension PeriodScoringDataEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PeriodScoringDataEntity>
    {
        return NSFetchRequest<PeriodScoringDataEntity>(entityName: "PeriodScoringDataEntity")
    }

    @NSManaged public var gameId: Int16
    @NSManaged public var periodNumber: Int16
    @NSManaged public var teamAbbreviation: String?
    @NSManaged public var periodSecondsElapsed: Int16
    @NSManaged public var playDescription: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var scoringSummary: ScoringSummaryEntity?
    
    public var wrappedTeamAbbreviation: String
    {
        teamAbbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedPlayDescription: String
    {
        playDescription ?? Constants.EMPTY_STRING
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

extension PeriodScoringDataEntity: Identifiable
{
}
