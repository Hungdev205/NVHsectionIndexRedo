//
//  DetailVC.swift
//  NVHsectionIndexRedo
//
//  Created by Hùng Nguyễn  on 8/4/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
        
    var person = Person()
    
    var labelName = UILabel()
    var labelPhone = UILabel()
    var labelMobile = UILabel()
    var labelPhoneNumber = UILabel()
    var imageAvatar = UIImageView()
    var imageCall = UIButton()
    var imageSms = UIButton()
    var imageVideoCall = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contact details"
        // set backgound.color
        self.view.backgroundColor = UIColor.whiteColor()
        
        // setup viewTop
        let viewTop = UIView()
        viewTop.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200)
        viewTop.backgroundColor = UIColor.lightGrayColor()
        
        // setup imageAvatar
        self.imageAvatar.frame = CGRectMake(30, 80, 50, 50)
        self.imageAvatar.image = UIImage(named: "\(person.avatar)")
        
        // set vi tri,size cho labelName
        self.labelName.frame = CGRectMake(100, 90, 300, 28)
        self.labelName.text = person.fullName
        self.labelName.font = UIFont.boldSystemFontOfSize(26)
        
        // setup labelPhone
        self.labelPhone.frame = CGRectMake(30, 130, 100, 35)
        self.labelPhone.text = "PHONE"
        
        // setup labelMobile
        self.labelMobile.text = "Mobile:"
        self.labelMobile.textColor = UIColor.blueColor()
        self.labelMobile.frame = CGRectMake(30, 160, 60, 28)
        // setup labelPhoneNumber
        self.labelPhoneNumber.text = person.phoneNumber
        self.labelPhoneNumber.frame = CGRectMake(100, 160, 200, 30)
        
        self.imageCall.frame = CGRectMake(220, 160, 40, 40)
        self.imageCall.setBackgroundImage(UIImage(named: "call"), forState: .Normal)
        
        self.imageSms.frame = CGRectMake(265, 160, 40, 40)
        self.imageSms.setBackgroundImage(UIImage(named: "sms"), forState: .Normal)
        
        self.imageVideoCall.frame = CGRectMake(310, 160, 40, 40)
        self.imageVideoCall.setBackgroundImage(UIImage(named: "video-call"), forState: .Normal)
        
        viewTop.addSubview(imageCall)
        viewTop.addSubview(imageSms)
        viewTop.addSubview(imageVideoCall)
        
        viewTop.addSubview(imageAvatar)
        viewTop.addSubview(labelName)
        viewTop.addSubview(labelPhone)
        viewTop.addSubview(labelMobile)
        viewTop.addSubview(labelPhoneNumber)
        
        self.view.addSubview(viewTop)
    }
    
}
