//
//  FilteredList.swift
//
//  Created by Larry Burris on 12/10/2022.
//  Copyright © 2022 Larry Burris. All rights reserved.
//
import CoreData
import SwiftUI

@available(iOS 15.0, *)
struct FilteredList<T: NSManagedObject, Content: View>: View
{
    // USAGE:
    // FilteredList(filterKey: "abc", filterValue: "xyz")
    // {
    //    (myEntity: MyEntity) in
    //    Text(myEntity.myField)
    // }

    @FetchRequest var fetchRequest: FetchedResults<T>

    let content: (T) -> Content

    var body: some View
    {
        List(fetchRequest, id: \.self)
        {
            item in
            self.content(item)
        }
    }

    //  Only one key and value using == comparator
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content)
    {
        _fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K == %@", filterKey, filterValue))
        
        self.content = content
    }
    
    //  Only one key and value using BETWEEN comparator
    init(filterKey: String, filterValues: [String], @ViewBuilder content: @escaping (T) -> Content)
    {
        _fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BETWEEN %@ AND %@", filterKey, filterValues[0], filterValues[1]))
        
        self.content = content
    }
    
    //  Only one key and value using passed in comparator
    init(filterKey: String, filterValue: String, comparator: String, @ViewBuilder content: @escaping (T) -> Content)
    {
        _fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K \(comparator) %@", filterKey, filterValue))
        
        self.content = content
    }
    
    //  Between 1 and three key/value pairs with multiple comparators
    init(filterKeys: [String], filterValues: [String], sortDescriptors: [NSSortDescriptor], comparators: [String], @ViewBuilder content: @escaping (T) -> Content)
    {
        var predicate = NSPredicate()
        
        if filterKeys.count == 1
        {
            predicate = NSPredicate(format: "%K \(comparators[0]) %@", filterKeys[0], filterValues[0])
        }
        else if filterKeys.count == 2
        {
            predicate = NSPredicate(format: "%K \(comparators[0]) %@ AND %K \(comparators[1]) %@", filterKeys[0], filterValues[0], filterKeys[1], filterValues[1])
        }
        else if filterKeys.count == 3
        {
            predicate = NSPredicate(format: "%K \(comparators[0]) %@ AND %K \(comparators[1]) %@ AND %K \(comparators[2]) %@", filterKeys[0], filterValues[0], filterKeys[1], filterValues[1], filterKeys[2], filterValues[2])
        }
        
        _fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: predicate)
        
        self.content = content
    }
}
