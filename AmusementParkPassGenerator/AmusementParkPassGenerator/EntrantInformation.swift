//
//  EntrantInformation.swift
//  AmusementParkPassGenerator
//
//  Created by David Oliveira on 9/2/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

import Foundation

//Information struct to hold Entrant Information
struct EntrantInformation {
    var dateOfBirth: Date?
    var firstName: String?
    var lastName:  String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: Int?
    
    var fullName: String {
        return "\(String(describing: firstName)) \(String(describing: lastName))"
        
    }
    
    init(dateOfBirth: Date?, firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipcode: Int?) {
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
    
    init(dateOfBirth: Date?) {
        self.dateOfBirth = dateOfBirth
        self.firstName = ""
        self.lastName = ""
        self.streetAddress = ""
        self.city = ""
        self.state = ""
        self.zipcode = 0
    }
}

