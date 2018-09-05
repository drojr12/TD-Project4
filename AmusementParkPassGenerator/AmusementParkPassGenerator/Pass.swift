//
//  Pass.swift
//  AmusementParkPassGenerator
//
//  Created by David Oliveira on 9/2/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

import Foundation

class Pass {
    let entrantType: EntrantType
    let rideAccess: [RideAccess]
    
    var fullName: String?
    
    init(entrantType: EntrantType, rideAccess: [RideAccess], fullName: String?) {
        self.entrantType = entrantType
        self.rideAccess = rideAccess
        
        self.fullName = fullName
    }
    
}
