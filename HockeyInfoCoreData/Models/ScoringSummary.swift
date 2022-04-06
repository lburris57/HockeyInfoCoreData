//
//  ScoringSummary.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the ScoringSummary database class
struct ScoringSummary: Identifiable
{
    let scoringSummaryEntity: ScoringSummaryEntity
    
    var id: NSManagedObjectID
    {
        return scoringSummaryEntity.objectID
    }
    
    var gameId: Int16
    {
        return scoringSummaryEntity.gameId
    }
    
    var playedStatus: String
    {
        return scoringSummaryEntity.wrappedPlayedStatus
    }
    
    var homeTeamAbbreviation: String
    {
        return scoringSummaryEntity.wrappedHomeTeamAbbreviation
    }
    
    var awayTeamAbbreviation: String
    {
        return scoringSummaryEntity.wrappedAwayTeamAbbreviation
    }
    
    var homeScoreTotal: Int16
    {
        return scoringSummaryEntity.homeScoreTotal
    }
    
    var awayScoreTotal: Int16
    {
        return scoringSummaryEntity.awayScoreTotal
    }
    
    var numberOfPeriods: Int16
    {
        return scoringSummaryEntity.numberOfPeriods
    }
    
    var lastUpdated: Date
    {
        return scoringSummaryEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return scoringSummaryEntity.wrappedDateCreated
    }
    
    var periodScoringList: [PeriodScoringDataEntity]
    {
        return scoringSummaryEntity.periodScoringListArray
    }
}
