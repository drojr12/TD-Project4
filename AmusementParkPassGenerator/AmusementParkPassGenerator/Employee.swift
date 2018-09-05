//
//  Employee.swift
//  AmusementParkPassGenerator
//
//  Created by David Oliveira on 9/2/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

import Foundation

enum PersonalInformationError: Error {
    case noFirstNameFound
    case noLastNameFound
    case noStreetAddressFound
    case noCityFound
    case noStateFound
    case noZipcodeFound
}

class Employee: Entrant {
    
    // Input properties ONLY for Employees
    
    // Input Behavior for ONLY Employees
    
    override func swipeAccessPass() {
        //Input swipe code for Employee
        
        if entrantType == .employeeFoodServices {
            //Show the area access priviledges
            if areaAccess[0] == .amusementAreas {
                print("This employee has access to the Amusement Areas")
            }
            if areaAccess[1] == .kitchenAreas {
                print("This employee has access to the Kitchen Areas")
            }
            
            //Show the ride access priviledge
            if rideAccess == [.canAccessAllRides] {
                print("This Employee CAN access all the rides")
            }
            
            //Show the percentage off discounts
            print("This Employee has a \(percentDiscountForFood) percent off for Food and a \(percentDiscountForMerch) percent off of Merchandise")
            
            //Check to make sure Personal Information of the Employee exists and throw errors as needed
            do {
                try checkToSeeIfPersonalInformationIsValid()
            } catch PersonalInformationError.noFirstNameFound {
                print("Error: There has been no first name found!")
            } catch PersonalInformationError.noLastNameFound {
                print("Error: There has been no last name found!")
            } catch PersonalInformationError.noStreetAddressFound {
                print("Error: There has been no street adddress found!")
            } catch PersonalInformationError.noCityFound {
                print("Error: There has been no city found!")
            } catch PersonalInformationError.noStateFound {
                print("Error: There has been no state found!")
            } catch PersonalInformationError.noZipcodeFound {
                print("Error: There has been no zipcode found!")
            } catch let error {
                fatalError("\(error)")
            }
            
        }
    }
    
    func checkToSeeIfPersonalInformationIsValid() throws {
        if let firstName = entrantInformation?.firstName {
            print("First Name: \(firstName)")
        } else {
            throw PersonalInformationError.noFirstNameFound
        }
        
        if let lastName = entrantInformation?.lastName {
            print("Last Name: \(lastName)")
        } else {
            throw PersonalInformationError.noLastNameFound
        }
        
        if let address = entrantInformation?.streetAddress {
            print("Street Address: \(address)")
        } else {
            throw PersonalInformationError.noStreetAddressFound
        }
        
        if let city = entrantInformation?.city {
            print("City: \(city)")
        } else {
            throw PersonalInformationError.noCityFound
        }
        
        if let state = entrantInformation?.state {
            print("State: \(state)")
        } else {
            throw PersonalInformationError.noStateFound
        }
        
        if let zip = entrantInformation?.zipcode {
            print("Zipcode: \(zip)")
        } else {
            throw PersonalInformationError.noZipcodeFound
        }
    }
    
}
