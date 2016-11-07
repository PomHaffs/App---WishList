//
//  ItemType+CoreDataProperties.swift
//  WishListApp
//
//  Created by Tomas-William Haffenden on 7/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
