//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by David Oliveira on 9/2/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

enum EntrantType {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case employeeFoodServices
    case employeeRideServices
    case employeeMaintenance
    case manager
    case vendor
}

enum AreaAccess {
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case maintenanceAreas
    case officeAreas
}

enum RideAccess {
    case canAccessAllRides
    case canSkipAllRideLines
}

protocol Discountable {
    var percentDiscountForFood: Double { get }
    var percentDiscountForMerch: Double { get }
}

protocol Swipable {
    func swipeAccessPass()
}

import Foundation

class Entrant: Swipable, Discountable {
    
    var entrantType: EntrantType
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    weak var entrantPass: Pass?
    weak var createPass: Pass? {
        return createPassFromEntrant()
    }
    
    let entrantInformation: EntrantInformation?
    
    var percentDiscountForFood: Double {
        switch(entrantType) {
        case .classicGuest, .freeChildGuest: return 0.0
        case .vipGuest: return 0.10
        case .employeeFoodServices, .employeeRideServices, .employeeMaintenance: return 0.15
        case .manager: return 0.25
        case .vendor: return 0.0
        }
    }
    
    var percentDiscountForMerch: Double {
        switch(entrantType) {
        case .classicGuest, .freeChildGuest: return 0.0
        case .vipGuest: return 0.20
        case .employeeFoodServices, .employeeRideServices, .employeeMaintenance: return 0.25
        case .manager: return 0.25
        case .vendor: return 0.0
        }
    }
    
    init(entrantType: EntrantType, areaAccess: [AreaAccess], rideAccess: [RideAccess], entrantInformation: EntrantInformation?) {
        self.entrantType = entrantType
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        
        self.entrantInformation = entrantInformation
    }
    
    func createPassFromEntrant() -> Pass {
        if entrantType == EntrantType.freeChildGuest || entrantType == EntrantType.classicGuest || entrantType == EntrantType.vipGuest {
            return Pass(entrantType: entrantType, rideAccess: rideAccess, fullName: nil)
        } else {
            return Pass(entrantType: entrantType, rideAccess: rideAccess, fullName: entrantInformation?.fullName)
        }
    }
    
    func swipeAccessPass() {
        //Write Logic to check whether the entrant can access certain areas of the park, ride rides, skip ride lines, receive discounts, etc.
        
        //Implemented in sub-class types
        
    }
    
}




