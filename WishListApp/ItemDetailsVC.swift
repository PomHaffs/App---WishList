//
//  ITemDetailsVC.swift
//  WishListApp
//
//  Created by Tomas-William Haffenden on 8/11/16.
//  Copyright © 2016 PomHaffs. All rights reserved.
//

import UIKit
import CoreData


class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var PriceField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let topItem = self.navigationController?.navigationBar.topItem {
          topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        // let store = Store(context: context)
        // store.name = "Apple"
        // let store2 = Store(context: context)
        // store2.name = "Bose"
        // let store3 = Store(context: context)
        // store3.name = "Monkey Chops"
        // let store4 = Store(context: context)
        //  store4.name = "Dick Smith"
        //   let store5 = Store(context: context)
        //   store5.name = "Amazon"
        
        //      ad.saveContext()
        
        getStores()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Update when selected
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            //this is where to handle error
        }
    }
 
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let item = Item(context: context)
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = PriceField.text {
            //because we want to change string into double for price
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        //toStore because that is what we called the enitity
        //inComponent is 0 because we only have column
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        //this call is for saving the new info to the DB
        ad.saveContext()
        
        //back to main view
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
}
