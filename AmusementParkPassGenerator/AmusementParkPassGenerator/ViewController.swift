//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by David Oliveira on 9/1/18.
//  Copyright © 2018 David Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var submenuButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Comment which method you want to run!
        
        setupGuestEntrants()
        //setupEmployeeEntrants()
        
        //setupEmployeeEntrantsForErrorTesting()
        //setupGuestEntrantsForErrorTesting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guestButtonAction() {
        submenuButton1.setTitle("OK", for: .normal)
    }
    
    // This is the proper setup information the Guest Entrants
    func setupGuestEntrants() {
        let classicGuestEntrant = Guest(entrantType: EntrantType.classicGuest, areaAccess: [AreaAccess.amusementAreas], rideAccess: [RideAccess.canAccessAllRides],
            entrantInformation: nil)
        
        let vipGuestEntrant = Guest(entrantType: EntrantType.vipGuest, areaAccess: [AreaAccess.amusementAreas], rideAccess: [RideAccess.canAccessAllRides, RideAccess.canSkipAllRideLines], entrantInformation: nil)
        
        let freeChildGuestEntrantInformation = EntrantInformation(dateOfBirth: Date())
        let freeChildGuestEntrant = Guest(entrantType: EntrantType.freeChildGuest, areaAccess: [AreaAccess.amusementAreas], rideAccess: [RideAccess.canAccessAllRides], entrantInformation: freeChildGuestEntrantInformation)
        
        // Create a entrants array for all the entrants, and an empty passes array for the corresponding passes
        let entrants: [Entrant] = [classicGuestEntrant, vipGuestEntrant, freeChildGuestEntrant, freeChildGuestEntrant]
        var passes: [Pass] = [Pass]()
        
        for entrant in entrants {
            passes.append(entrant.createPassFromEntrant())
        }
        
        for index in 0...passes.count - 1 {
            entrants[index].entrantPass = passes[index]
            if let pass = entrants[index].entrantPass {
                print(pass)
            }
        }
        
        // I'm just calling the 1st entry in the entrants array to call the swipe methods.  So I was testing based on the first position in the array for the 1st part of the project.
        // I'm doing this until we write the UI in the next project.
        entrants[0].swipeAccessPass()
    }
    
    // This is the proper setup of the employee entrants
    func setupEmployeeEntrants() {
        let employeeFoodServicesEntrantInformation = EntrantInformation(dateOfBirth: Date(), firstName: "Bob", lastName: "Barker", streetAddress: "2422 NE Dake Rd, city", city: "Bremerton", state: "WA", zipcode: 98322)
        let employeeFoodServicesEntrant = Employee(entrantType: .employeeFoodServices, areaAccess: [.amusementAreas, .kitchenAreas], rideAccess: [RideAccess.canAccessAllRides], entrantInformation: employeeFoodServicesEntrantInformation)
        
        let employeeRideServicesEntrantInformation = EntrantInformation(dateOfBirth: Date(), firstName: "Craig", lastName: "David", streetAddress: "4425 32nd Ave SE", city: "Kent", state: "WA", zipcode: 98032)
        let employeeRideServicesEntrant = Employee(entrantType: .employeeRideServices, areaAccess: [.amusementAreas, .rideControlAreas], rideAccess:[.canAccessAllRides] , entrantInformation: employeeRideServicesEntrantInformation)
        
        let employeeMaintenanceEntrantInformation = EntrantInformation(dateOfBirth: Date(), firstName: "Kid", lastName: "Rock", streetAddress: "3232 Rock Street NE", city: "Detroit", state: "MI", zipcode: 12332)
        let employeeMaintenanceEntrant = Employee(entrantType: .employeeMaintenance, areaAccess: [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas], rideAccess: [.canAccessAllRides], entrantInformation: employeeMaintenanceEntrantInformation)
        
        let employeeManagerEntrantInformation = EntrantInformation(dateOfBirth: Date(), firstName: "Aubrey", lastName: "Graham", streetAddress: "51223 Calabasas Dr.", city: "Calabasas", state: "CA", zipcode: 90290)
        let employeeManagerEntrant = Employee(entrantType: .manager, areaAccess: [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas], rideAccess: [.canAccessAllRides], entrantInformation: employeeManagerEntrantInformation)
        
        // Create a entrants array for all the entrants, and an empty passes array for the corresponding passes
        let entrants: [Entrant] = [employeeFoodServicesEntrant, employeeRideServicesEntrant, employeeMaintenanceEntrant, employeeManagerEntrant]
        var passes: [Pass] = [Pass]()
        
        for entrant in entrants {
            passes.append(entrant.createPassFromEntrant())
        }
        
        for index in 0...passes.count - 1 {
            entrants[index].entrantPass = passes[index]
            if let pass = entrants[index].entrantPass {
                print(pass)
            }
        }
        
        //Calling swipe
        entrants[0].swipeAccessPass()
        
    }
    
    // In this function, the streetAddress is nil. Employees require you to have your personal information filled out!
    // You can make any of the EntrantInformation's parameters nil and it will error out on the first one it finds nil.
    func setupEmployeeEntrantsForErrorTesting() {
        let employeeFoodServicesEntrantInformation = EntrantInformation(dateOfBirth: Date(), firstName: "Bob", lastName: "Barker", streetAddress: nil, city: "Bremerton", state: "WA", zipcode: 98322)
        let employeeFoodServicesEntrant = Employee(entrantType: .employeeFoodServices, areaAccess: [.amusementAreas, .kitchenAreas], rideAccess: [RideAccess.canAccessAllRides], entrantInformation: employeeFoodServicesEntrantInformation)
        
        // Create a entrants array for all the entrants, and an empty passes array for the corresponding passes
        let entrants: [Entrant] = [employeeFoodServicesEntrant]
        var passes: [Pass] = [Pass]()
        
        for entrant in entrants {
            passes.append(entrant.createPassFromEntrant())
        }
        
        for index in 0...passes.count - 1 {
            entrants[index].entrantPass = passes[index]
            if let pass = entrants[index].entrantPass {
                print(pass)
            }
        }
        
        //Calling swipe
        entrants[0].swipeAccessPass()
    }
    
    //In this function, the Child Guest Entrant is required to have a birthdate.
    //So we passed in nil to trigger the error checking!
    func setupGuestEntrantsForErrorTesting() {
    
        let freeChildGuestEntrantInformation = EntrantInformation(dateOfBirth: nil)
        let freeChildGuestEntrant = Guest(entrantType: EntrantType.freeChildGuest, areaAccess: [AreaAccess.amusementAreas], rideAccess: [RideAccess.canAccessAllRides], entrantInformation: freeChildGuestEntrantInformation)
        
        // Create a entrants array for all the entrants, and an empty passes array for the corresponding passes
        let entrants: [Entrant] = [freeChildGuestEntrant]
        var passes: [Pass] = [Pass]()
        
        for entrant in entrants {
            passes.append(entrant.createPassFromEntrant())
        }
        
        for index in 0...passes.count - 1 {
            entrants[index].entrantPass = passes[index]
            if let pass = entrants[index].entrantPass {
                print(pass)
            }
        }
        
        // Calling the swipe method
        entrants[0].swipeAccessPass()
    }
    
}// End of ViewController

