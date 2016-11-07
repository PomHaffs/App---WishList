//
//  Item+CoreDataClass.swift
//  WishListApp
//
//  Created by Tomas-William Haffenden on 7/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        //assigning current date(timestamp) to this attribute
        self.created = NSDate()
        
    }
    
}
