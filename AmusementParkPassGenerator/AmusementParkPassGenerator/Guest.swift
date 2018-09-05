//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by David Oliveira on 9/2/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

import Foundation

enum BirthDateError: Error {
    case noBirthDateFound
}

class Guest: Entrant {
    
    // Input properties ONLY for Guests
    
    
    // Input Behavior for ONLY Guests
    
    override func swipeAccessPass() {
        // Input swipe code for Guest
        
        // Check to see the area access for the entrant
        if areaAccess[0] == AreaAccess.amusementAreas {
            print("This Guest CAN access the Amusement Areas")
        } else {
            print("This Guest DOES NOT have access to the Amusement Area")
        }
        
        // Check to see the ride access for the entrant
        if rideAccess == [RideAccess.canAccessAllRides, RideAccess.canSkipAllRideLines]  {
            print("This Guest CAN access all the the rides & CAN SKIP all the ride lines")
            
        } else if rideAccess[0] == RideAccess.canAccessAllRides  {
            print("This Guest CAN access all the rides")
        }
        
        // Check to see the discount access for the entrant
        if entrantType == .classicGuest || entrantType == .freeChildGuest {
            print("This Guest does not get any percentage off for Food or Merchandise")
        } else {
            if percentDiscountForFood != 0.0 && percentDiscountForMerch != 0.0 {
                print("This Guest has a \(percentDiscountForFood) percent off for Food and a \(percentDiscountForMerch) percent off of Merchandise")
            }
        }
        
        // Check to see if Personal/Business Information is needed for the entrant
        if entrantType == .classicGuest || entrantType == .vipGuest {
            print("No personal information is required from the Guest")
        } else if entrantType == .freeChildGuest {
            //Do Error checking to see if there is no BirthDate entered
            do {
                try checkForValidBirthday()
            } catch BirthDateError.noBirthDateFound {
                print("There is no birthday fround from the Child Guest and one is needed to proceed!")
            } catch let error {
                //Throw fatal error here
                fatalError("\(error)")
            }
            
        }
        
    }
    
    // Helper Function for the Guest Object that throws for error checking
    func checkForValidBirthday() throws {
        if let birthday = entrantInformation?.dateOfBirth {
            print("The birthday assigned to the Child is \(birthday)")
        } else {
            throw BirthDateError.noBirthDateFound
        }
    }
        
}
