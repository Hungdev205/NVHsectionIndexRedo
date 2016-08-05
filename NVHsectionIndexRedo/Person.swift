//
//  Person.swift
//  NVHsectionIndexRedo
//
//  Created by Hùng Nguyễn  on 8/4/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import Foundation

class Person {
    
    // khai bao mang static kieu [String]
    static var arrFirstNameMen: [String]!
    static var arrFirstNameWomen: [String]!
    static var arrLastName: [String]!
    static var arrMiddleNameMen: [String]!
    static var arrMiddleNameWomen: [String]!
    static var arrPhoneNumber: [String]!
    static var arrAvatarMen: [String]!
    static var arrAvatarWomen: [String]!
    
    var fullName: String!
    var lastName: String!
    var firstName: String!
    var middleName: String!
    var phoneNumber: String!
    var avatar: String!
   
    
    static var isCheck: Bool = true
    
    init() {
        if Person.isCheck == true {
            Person.arrAvatarMen = ["chef-32","doctor-32","gentleman-32","king-32","man-2-32","man-2-32","police-man-32","speaker-32","spy-32","superman-32","support-32","user-32","worker-32"]
            Person.arrAvatarWomen = ["Dominatrix-32","female1-32","girl-32","girl2-32","hipster_girl-32","maturewoman-3-32","Nerd_woman-32","police-women-32","queen-32","supportfemale-32","woman2-32","woman2-32"]
            Person.arrFirstNameMen = ["Hùng","Thượng","Thắng","Thanh","Sơn","Thế","Tú","Đạt","Thành","Hưng","Ngọc","Đức","Cảnh","Hải","Khánh","Mạnh","Cường","Dũng","Xuân","Quốc","Anh","An","Bình","Bảo","Bắc"]
            Person.arrFirstNameWomen = ["Linh","Hương","Thảo","Hằng","Ngọc","Lan","My","Cúc","Trang","Ly","Dung","Hoa","Nhung","Thuỳ","Huệ","Phượng","Phương","Thắm","Khuê","Uyên","Ánh"]
            Person.arrMiddleNameMen = ["Văn","Đức","Đăng","Bảo","Bình","Kim","Duy","Mạnh","Công","Xuân","Khắc","Việt","Cao","Lương","Danh","Dương","Bắc","Bình","Bảy"]
            Person.arrMiddleNameWomen = ["Thị","Diệu","Thuỳ","Quỳnh","Khánh","Bích","Trần","Kỳ","Huyền","Vũ"]
            Person.arrLastName = ["Nguyễn","Lê","Trần","Phạm","Đào","Hồ","Vũ","Đinh","Hoàng","Đặng","Đỗ","Trịnh","Lại","Dương","Lý","Bùi"]
            Person.arrPhoneNumber = ["01675267345","01675267390","01685267345","01975267345","01775267123","01234787767","0947868888","0321379999","0989696996","0987654532","0999886688","0132669699"]
            
            
            Person.isCheck = false
        }
        let genderIndex = arc4random_uniform(2)
        if genderIndex == 0 {
            
            middleName = Person.arrMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameWomen.count)))]
            firstName = Person.arrFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrFirstNameWomen.count)))]
            avatar = Person.arrAvatarWomen[Int(arc4random_uniform(UInt32(Person.arrAvatarWomen.count)))]
        } else {
            
            middleName = Person.arrMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
            firstName = Person.arrFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrFirstNameMen.count)))]
            avatar = Person.arrAvatarMen[Int(arc4random_uniform(UInt32(Person.arrAvatarMen.count)))]
        }
        
        lastName = Person.arrLastName[Int(arc4random_uniform(UInt32(Person.arrLastName.count)))]
        phoneNumber = Person.arrPhoneNumber[Int(arc4random_uniform(UInt32(Person.arrPhoneNumber.count)))]
        
        fullName = lastName + " " + middleName + " " + firstName
    }
    
    
}