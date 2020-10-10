//
//  Variable.swift
//  Physio
//
//  Created by Tyler Veeman on 5/17/20.
//  Copyright © 2020 Tyler Veeman. All rights reserved.
//

import Foundation

enum Equation: String
{
    case velocity = "velocity"
}

class Variable: DataPoint
{
    var equation: Equation
    var complexUnit: ComplexUnit
    
    init(name: Equation, value: Float, unit: ComplexUnit)
    {
        self.equation = name
        self.complexUnit = unit
        super.init(value: value)
    }
    
    func convertTo(wantedUnit: ComplexUnit)
    {
        self.value = self.complexUnit.complexConvert(value: self.value, wantedUnit: wantedUnit)!
    }
}

func getUnitOptions(name: Equation) -> [ComplexUnit]
{
    var result = [ComplexUnit]()
    
    switch name
    {
        case .velocity:
        do {
            for d in DistanceUnit.allCases
            {
                for t in TimeUnit.allCases
                {
                    result.append(ComplexUnit(units: [Unit.distance(d), Unit.time(t)], equation: Equation.velocity))
                }
            }
        }
    }
    return result
}
