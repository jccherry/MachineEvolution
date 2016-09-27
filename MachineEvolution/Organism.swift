//
//  Organism.swift
//  MachineEvolution
//
//  Created by John Chiaramonte on 9/27/16.
//  Copyright © 2016 John Chiaramonte. All rights reserved.
//

class Organism {
    
    var speed: Double
    var strength: Int
    var isSick: Bool
    
    init(orgSpeed: Double, orgStrength: Int, orgIsSick: Bool){
        speed = orgSpeed
        strength = orgStrength
        isSick = orgIsSick
    }
    
}
