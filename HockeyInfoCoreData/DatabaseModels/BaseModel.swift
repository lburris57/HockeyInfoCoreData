//
//  BaseModel.swift
//  HockeyInfoCoreData
//
//  Created by Larry Burris on 02/14/22.
//  Copyright © 2022 Larry Burris. All rights reserved.
//
import Foundation
import CoreData

protocol BaseModel where Self: NSManagedObject
{
    func save()
    func delete()
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?
    static func all<T: NSManagedObject>() -> [T]
}

extension BaseModel
{
    static var viewContext: NSManagedObjectContext
    {
        return CoreDataManager.shared.persistentContainer.viewContext
    }
    
    //  Saves the entire viewContext and rolls back if there are any errors
    func save()
    {
        if Self.viewContext.hasChanges
        {
            do
            {
                try Self.viewContext.save()
            }
            catch
            {
                CoreDataManager.shared.persistentContainer.viewContext.rollback()
                
                Log.error("Error saving data: \(error.localizedDescription)")
            }
        }
    }
    
    //  Deletes the existing object
    func delete()
    {
        Self.viewContext.delete(self)
        save()
    }
    
    //  Deletes all of the existing objects in the table.
    static func deleteAll()
    {
        let fetchRequest: NSFetchRequest<Self> = NSFetchRequest(entityName: String(describing: Self.self))
        
        do
        {
            let retrievedObjects = try viewContext.fetch(fetchRequest)
            
            for retrievedObject in retrievedObjects
            {
                Self.viewContext.delete(retrievedObject)
            }
        }
        catch
        {
            Log.error("Error deleting all \(Self.self) objects: \(error.localizedDescription)")
        }
    }
    
    //  Retrieve all objects without sorting
    static func all<T>() -> [T] where T: NSManagedObject
    {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
        
        do
        {
            return try viewContext.fetch(fetchRequest)
        }
        catch
        {
            Log.error("Error retrieving all \(T.self) objects: \(error.localizedDescription)")
            
            return []
        }
    }
    
    //  Retrieve all objects using sort descriptors
    static func allWithSort<T>(_ sortDescriptors: [NSSortDescriptor]) -> [T] where T: NSManagedObject
    {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
        
        fetchRequest.sortDescriptors = sortDescriptors
        
        do
        {
            return try viewContext.fetch(fetchRequest)
        }
        catch
        {
            Log.error("Error retrieving all \(T.self) objects: \(error.localizedDescription)")
            
            return []
        }
    }
    
    //  Retrieve an object by the objectId
    static func byId<T>(id: NSManagedObjectID) -> T? where T: NSManagedObject
    {
        do
        {
            return try viewContext.existingObject(with: id) as? T
        }
        catch
        {
            Log.error("Error retrieving \(T.self.description()) by id): \(error.localizedDescription)")
            
            return nil
        }
    }
}

extension ScheduleEntity: BaseModel
{
    
}

extension ScoringSummaryEntity: BaseModel
{
    
}

extension GameLogEntity: BaseModel
{
    
}

extension PlayerStatisticsEntity: BaseModel
{
    
}

extension PlayerInjuryEntity: BaseModel
{
    
}

extension PeriodScoringDataEntity: BaseModel
{
    
}

extension TeamStandingsEntity: BaseModel
{
    
}

extension TeamStatisticsEntity: BaseModel
{
    
}

extension TeamEntity: BaseModel
{
    
}

extension PlayerEntity: BaseModel
{
    
}

extension Date
{
    func asLongDateFormattedString() -> String
    {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMM d, yyyy hh:mm a"
        return formatter.string(from: self)
    }
    
    func asShortDateFormattedString() -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}


