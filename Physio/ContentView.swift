//
//  ContentView.swift
//  Physio
//
//  Created by Tyler Veeman on 5/13/20.
//  Copyright © 2020 Tyler Veeman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var test: String
    
    var body: some View {
        Text(test)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(test: getUnitOptions(name: Equation.velocity)[0].getString())
    }
}
