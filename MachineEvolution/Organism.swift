//
//  Organism.swift
//  MachineEvolution
//
//  Created by John Chiaramonte on 9/27/16.
//  Copyright © 2016 John Chiaramonte. All rights reserved.
//

import Foundation

class Organism {
    
    //instance variables
    var velocity: Double
    var stamina: Int
    var isSick: Bool
    var lastDistance: Double = 0
    var maxDistance: Double = 0
    var name: String
    
    //initializers
    init(orgName: String, orgVelocity: Double, orgStamina: Int, orgIsSick: Bool){
        name = orgName
        velocity = orgVelocity
        stamina = orgStamina
        isSick = orgIsSick
    }
    
    //takes the statistics and uses algorithm to determine the maximum distance
    func run() -> Double{
        var distance:Double = 0
        
        distance = Double(stamina) * velocity
        
        if isSick{
            distance -= abs(distance)/3
        }
        
        return distance
    }
    
    //instead of just returning the run value, it assigns the current run value and attempts to assign the highest run value
    func runDistance(){
        lastDistance = run()
        
        if lastDistance > maxDistance {
            maxDistance = lastDistance
        }
    }
    
    func mutate() {
        
        let velocitySeed = Double(Float(arc4random()) / Float(UINT32_MAX))
        let velocityOdds = Double(Float(arc4random()) / Float(UINT32_MAX))
        
        let staminaSeed = Double(Float(arc4random()) / Float(UINT32_MAX))
        //let staminaOdds = Double(Float(arc4random()) / Float(UINT32_MAX))
        
        let sickOdds = Double(Float(arc4random()) / Float(UINT32_MAX))
        
        //33% chance to add .1, 33% chance to subtract 0.1, 33% chance to stay the same
        if velocitySeed <= 0.33 {
            velocity += 0.1
        } else if velocitySeed <= 0.66 {
            velocity -= 0.1
        }
        //10% chance to switch direction of velocity
        if velocityOdds <= 0.1 {
            velocity *= -1
        }
        //33% chance to add 1, 33% chance to subtract 1 only if it isnt 0, 33% chance to stay the same
        if staminaSeed <= 0.33 {
            stamina += 1
        } else if staminaSeed <= 0.66 {
            if stamina != 0 {
                stamina -= 1
            }
        }

        if sickOdds <= 0.05{
            if isSick {
                isSick = false
            } else {
                isSick = true
            }
        }

    }
    
    
    func printStats() {
        print("---\(name)'s Statistics---")
        print("Velocity: \(velocity) m/s")
        print("Stamina: \(stamina) s")
        print("Sickness Status: \(isSick)")
        print("Last Distance: \(lastDistance)")
        print("Furthest Distance: \(maxDistance)")
        
    }
}
