//
//  ScoringSummaryEntity+CoreDataProperties.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/13/22.
//
//

import CoreData
import Foundation

extension ScoringSummaryEntity
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoringSummaryEntity>
    {
        return NSFetchRequest<ScoringSummaryEntity>(entityName: "ScoringSummaryEntity")
    }

    @NSManaged public var gameId: Int16
    @NSManaged public var playedStatus: String?
    @NSManaged public var homeTeamAbbreviation: String?
    @NSManaged public var awayTeamAbbreviation: String?
    @NSManaged public var homeScoreTotal: Int16
    @NSManaged public var awayScoreTotal: Int16
    @NSManaged public var numberOfPeriods: Int16
    @NSManaged public var dateCreated: Date?
    @NSManaged public var lastUpdated: Date?
    @NSManaged public var periodScoringList: NSSet?
    
    public var wrappedPlayedStatus: String
    {
        playedStatus ?? PlayedStatusEnum.unplayed.rawValue
    }
    
    public var wrappedHomeTeamAbbreviation: String
    {
        homeTeamAbbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedAwayTeamAbbreviation: String
    {
        awayTeamAbbreviation ?? Constants.EMPTY_STRING
    }
    
    public var wrappedLastUpdated: Date
    {
        lastUpdated ?? Date()
    }
    
    public var wrappedDateCreated: Date
    {
        dateCreated ?? Date()
    }
    
    public var periodScoringListArray: [PeriodScoringDataEntity]
    {
        let set = periodScoringList as? Set<PeriodScoringDataEntity> ?? []
        
        return set.sorted
        {
            $0.gameId < $1.gameId
        }
    }
}

// MARK: Generated accessors for periodScoringList

extension ScoringSummaryEntity
{
    @objc(addPeriodScoringListObject:)
    @NSManaged public func addToPeriodScoringList(_ value: PeriodScoringDataEntity)

    @objc(removePeriodScoringListObject:)
    @NSManaged public func removeFromPeriodScoringList(_ value: PeriodScoringDataEntity)

    @objc(addPeriodScoringList:)
    @NSManaged public func addToPeriodScoringList(_ values: NSSet)

    @objc(removePeriodScoringList:)
    @NSManaged public func removeFromPeriodScoringList(_ values: NSSet)
}

extension ScoringSummaryEntity: Identifiable
{
}
