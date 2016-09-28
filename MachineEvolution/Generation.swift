//
//  Generation.swift
//  MachineEvolution
//
//  Created by John Chiaramonte on 9/28/16.
//  Copyright © 2016 John Chiaramonte. All rights reserved.
//

import Foundation

class Generation {
    
    var organisms: [Organism]
    
    init(organismsHere: [Organism]) {
        organisms = organismsHere
    }
    
    func runAll(){
        for organism in organisms {
            organism.runDistance()
        }
    }
    
    func mutateAll(){
        for organism in organisms {
            organism.mutate()
        }
    }
    
    func printMaxDistances(){
        for organism in organisms{
            print(organism.maxDistance)
        }
    }
    func printAllStats(){
        for organism in organisms{
            organism.printStats()
        }
    }
    func numberSick() -> Int {
        var sickNum: Int = 0
        for organism in organisms {
            if organism.isSick {
                sickNum += 1
            }
        }
        return sickNum
    }
    
}
