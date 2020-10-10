//
//  DataPoint.swift
//  Physio
//
//  Created by Tyler Veeman on 5/17/20.
//  Copyright © 2020 Tyler Veeman. All rights reserved.
//

import Foundation

class DataPoint
{
    var value: Float
    var unit: Unit?
    
    init(value: Float)
    {
        self.value = value
    }
    
    func setUnit(unit: Unit)
    {
        self.unit = unit
    }
    
    func convertTo(wantedUnit: Unit)
    {
        if (unit != nil)
        {
            value = convert(value: value, currentUnit: unit!, endUnit: wantedUnit)!
            unit = wantedUnit
        }
    }
}
