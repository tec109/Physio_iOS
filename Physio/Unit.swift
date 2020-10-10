//
//  Unit.swift
//  Physio
//
//  Created by Tyler Veeman on 5/23/20.
//  Copyright © 2020 Tyler Veeman. All rights reserved.
//

import Foundation

enum Unit
{
    case distance(DistanceUnit)
    case time(TimeUnit)
    
    var type: String
    {
        switch self {
        case .distance(_): return "distance"
        case .time(_): return "time"
        }
    }
    
    var name: String
    {
        switch self {
        case .distance(let vari): return vari.rawValue
        case .time(let vari): return vari.rawValue
        }
    }
}

enum DistanceUnit: String, CaseIterable
{
    case meters = "meters"
    case feet = "feet"
    case miles = "miles"
    case kilometers = "kilometers"
    
    var conversion: Float
    {
        switch self {
        case .meters: return 1
        case .feet: return 0.3048
        case .miles: return 1609.344
        case .kilometers: return 1000
        }
    }
}
 
enum TimeUnit: String, CaseIterable
{
    case seconds = "seconds"
    case minutes = "minutes"
    case hours = "hours"
    case days = "days"
    
    var conversion: Float
    {
        switch self {
        case .seconds: return 1
        case .minutes: return 60
        case .hours: return 3600
        case .days: return 86400
        }
    }
}

func convert(value: Float, currentUnit: Unit, endUnit: Unit) -> Float?
{
    var result = value
    
    switch currentUnit {
    case .distance(let unitType): result *= unitType.conversion
    case .time(let unitType): result *= unitType.conversion
    }
    
    switch endUnit {
    case .distance(let unitType): return result / unitType.conversion
    case .time(let unitType): return result / unitType.conversion
    }
}
