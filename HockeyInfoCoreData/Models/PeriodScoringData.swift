//
//  PeriodScoringData.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 3/28/22.
//
import Foundation
import CoreData

//  Presentation layer struct that has computed fields that
//  return the values from the PeriodScoringData database class
struct PeriodScoringData: Identifiable
{
    let context = CoreDataManager.shared.persistentContainer.viewContext
    
    let periodScoringDataEntity: PeriodScoringDataEntity
    
    var id: NSManagedObjectID
    {
        return periodScoringDataEntity.objectID
    }
    
    var gameId: Int16
    {
        return periodScoringDataEntity.gameId
    }
    
    var periodNumber: Int16
    {
        return periodScoringDataEntity.periodNumber
    }
    
    var teamAbbreviation: String
    {
        return periodScoringDataEntity.wrappedTeamAbbreviation
    }
    
    var periodSecondsElapsed: Int16
    {
        return periodScoringDataEntity.periodSecondsElapsed
    }
    
    var playDescription: String
    {
        return periodScoringDataEntity.wrappedPlayDescription
    }
    
    var lastUpdated: Date
    {
        return periodScoringDataEntity.wrappedLastUpdated
    }
    
    var dateCreated: Date
    {
        return periodScoringDataEntity.wrappedDateCreated
    }
    
    var scoringSummary: ScoringSummaryEntity
    {
        return periodScoringDataEntity.scoringSummary ?? ScoringSummaryEntity(context: context)
    }
}
