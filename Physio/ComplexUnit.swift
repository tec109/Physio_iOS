//
//  ComplexUnit.swift
//  Physio
//
//  Created by Tyler Veeman on 6/9/20.
//  Copyright © 2020 Tyler Veeman. All rights reserved.
//

import Foundation

class ComplexUnit
{
    var unitDict = [String: Unit]()
    let equation: Equation
    
    init(units: [Unit], equation: Equation)
    {
        for u in units
        {
            unitDict[u.type] = u
        }
        
        self.equation = equation
    }
    
    func complexConvert(value: Float, wantedUnit: ComplexUnit) -> Float?
    {
        if (self.equation == wantedUnit.equation)
        {
            var resultDict = [String: Float]()
            
            for u in unitDict
            {
                resultDict[u.key] = convert(value: 1, currentUnit: u.value, endUnit: wantedUnit.unitDict[u.key]!)
            }
            
            switch equation {
            case .velocity:
                return value * resultDict["distance"]! / resultDict["time"]!
            }
        }
        return nil
    }
    
    func getString() -> String
    {
        switch equation {
        case .velocity:
            return "\(unitDict["distance"]!.name) / \(unitDict["time"]!.name)"
        }
    }
}
