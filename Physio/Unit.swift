//
//  Unit.swift
//  Physio
//
//  Created by Tyler Veeman on 5/23/20.
//  Copyright © 2020 Tyler Veeman. All rights reserved.
//

import Foundation

var unitLibrary = [UnitType: Unit]()

enum UnitType
{
    case distance
    case time
}

struct Unit
{
    let standard: String
    var variations = [String: Float]()
    
    init(standard: String)
    {
        self.standard = standard
    }
    
    mutating func addVariation(name: String, conversion: Float)
    {
        variations[name] = conversion
    }
}

func setupUnitLibrary()
{
    var distance = Unit(standard: "meters")
    distance.addVariation(name: "feet", conversion: 0.3048)
    distance.addVariation(name: "miles", conversion: 1609.344)
    distance.addVariation(name: "kilometers", conversion: 1000)
    unitLibrary[.distance] = distance
    
    var time = Unit(standard: "seconds")
    time.addVariation(name: "minutes", conversion: 60)
    time.addVariation(name: "hours", conversion: 3600)
    time.addVariation(name: "days", conversion: 86400)
    unitLibrary[.time] = time
}
