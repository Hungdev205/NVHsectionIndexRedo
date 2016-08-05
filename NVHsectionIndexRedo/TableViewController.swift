//
//  TableViewController.swift
//  NVHsectionIndexRedo
//
//  Created by Hùng Nguyễn  on 8/4/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // khai bao 1 mang NSMutableArray
    var arrayData: NSMutableArray!
    // khai bao 1 dictionary 
    var dictContacts = NSMutableDictionary()
    // khai bao mang lay ra allKey cua dictionary
    var arrayKey: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // thay đổi màu nền sectionIndexTitle .sectionIndexBackgroundColor
        self.tableView.sectionIndexBackgroundColor = UIColor.grayColor()
    // đổi màu chữ sectionIndex
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        
        arrayData = NSMutableArray()
    // tao ra 60 person trong mang arrayData
        for i in 0..<60 {
            arrayData.addObject(Person())
            let person = arrayData[i] as! Person
           print("\(person.fullName)  \(person.phoneNumber)")
        }
        
        
    // truy xuat tung phan tu trong mang arrayData
        for element in arrayData {
            // declare person = element
            let person = element as! Person
            // firstLetter ki tu 1st cua firstName .substringToIndex
            var firstLetter: String = (person.firstName as NSString!).substringToIndex(1)
           
            // firstLetter == Đ -> section D, Á -> A
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            
            
    // khai bao mang arrayForLetter save cac person co ki tu 1st firstName == firstLetter
            var arrayForLetter: NSMutableArray!
            
            if dictContacts.valueForKey(firstLetter) != nil {
                    arrayForLetter = dictContacts.valueForKey((firstLetter)) as! NSMutableArray
                    arrayForLetter.addObject(person)
                    dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            } else {
                arrayForLetter = NSMutableArray(object: person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
        }
        
        arrayKey = dictContacts.allKeys as! [String]
    // sap xep person theo abc
        arrayKey = arrayKey.sortedArrayUsingSelector(#selector(NSString.compare(_:)))
        
        
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrayKey.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // lay ra phan tu tai vi tri section trong arrayKey -> sectionTitle
        let sectionTitle = arrayKey[section]
        let sectionPersons =  dictContacts[sectionTitle as! String]
        
        return (sectionPersons?.count)!
    
    }
    

    // do du lieu len tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle , reuseIdentifier: "Cell")
        }
        // lay ve doi tuong person tuong ung voi cell
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons =  dictContacts[sectionTitle as! String]

        let person = sectionPersons![indexPath.row] as! Person
        
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.phoneNumber
        cell?.imageView?.image = UIImage(named: "\(person.avatar)")
        
        
        return cell!
    }
    
    // hien thi title cua tung section len tableView
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    
    // thêm sectionIndexTitleForTableView
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKey as? [String]
    }
    
    // change textColor HeaderView section + background HeaderView Section
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // color background header
        view.tintColor = UIColor.grayColor()
        // text color header View
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }
    
    // khi chon cell thi thuc hien phuong thuc nay
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailVC()
        // lay person tuong ung voi cell ta chon
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons =  dictContacts[sectionTitle as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        
        // pass doi tuong person tren den doi tuong person trong detailVC
        detailVC.person = person
        
        // day sang detailVC
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
   
}
