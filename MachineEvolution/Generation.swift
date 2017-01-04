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
    var name: String
    
    init(organismsHere: [Organism], genName: String) {
        organisms = organismsHere
        name = genName
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
    
    func numberSickTotal() -> Int {
        var sickNum: Int = 0
        for organism in organisms {
            if organism.isSick {
                sickNum += 1
            }
        }
        return sickNum
    }
    
    func numberDeadSick() -> Int {
        var numberDeadSick: Int = 0
        for organism in organisms{
            if organism.isSick && organism.isDead {
                numberDeadSick += 1
            }
        }
        return numberDeadSick
    }
    
    func numberAliveSick() -> Int {
        var numberAliveSick: Int = 0
        for organism in organisms{
            if organism.isSick && !organism.isDead {
                numberAliveSick += 1
            }
        }
        return numberAliveSick
    }
    
    func numberDead() -> Int {
        var deadNum: Int = 0
        for organism in organisms {
            if organism.isDead {
                deadNum += 1
            }
        }
        return deadNum
    }
    
    //75% chance to kill each sick organism in the array
    func killSick(){
        for organism in organisms {
            if organism.isSick && Double(Float(arc4random()) / Float(UINT32_MAX)) <= 0.75 && numberDead() < organisms.count / 2 && !organism.isDead{
                organism.kill()
            }
        }
    }
    
    func killBottomHalf(){
        organisms.sort {$0.fitnessLevel < $1.fitnessLevel}
        for organism in organisms {
            if !organism.isDead && numberDead() < organisms.count / 2{
                organism.kill()
            }
        }
    }
    
    func deathCycle() {
        killSick()
        killBottomHalf()
    }
    
    func topFitnessOrganism() -> Organism {
        organisms.sort {$0.fitnessLevel < $1.fitnessLevel}
        
        return organisms[organisms.count-1]
    }
    
    func medianFitnessOrganism() -> Organism {
        organisms.sort {$0.fitnessLevel < $1.fitnessLevel}
        
        //check to see if there are even or odd number of organisms, for sake of not crashing even though i plan to always use 1000 organisms
            //if even, use position n/2, if odd, use ((n+1)/2) where n is the count of the array
        if organisms.count % 2 == 0 {
            return organisms[organisms.count/2]
        } else {
            return organisms[(organisms.count+1)/2 ]
        }
    }
    
    func bottomFitnessOrganism() -> Organism {
        organisms.sort {$0.fitnessLevel < $1.fitnessLevel}
        
        return organisms[0]
    }
    
    //assigns the fitness level variables for all so that it can be used instead of just max distance
    func assignFitnessLevels(){
        for organism in organisms{
            organism.setFitnessLevel()
        }
    }
    
    func printLifeStats(){
        organisms.sort {$0.fitnessLevel < $1.fitnessLevel}
        
        var lifeString: String
        
        for organism in organisms{
            if organism.isDead {
                lifeString = "Dead"
            } else {
                lifeString = "Alive"
            }
            print("Organism \(organism.name): \(lifeString) Fitness Level: \(organism.fitnessLevel) Sick: \(organism.isSick)")
        }
    }
    
    func printGenStats() {
        
        
        print("Generation: \(name)")
        print("Number of Organisms: \(organisms.count)")
        print("Number Sick Total: \(numberSickTotal())")
        print("Number Sick Dead: \(numberDeadSick())")
        print("Number Sick Alive: \(numberAliveSick())")
        print("Number Dead: \(numberDead())")
    }
    
    func cloneOrganism(organism: Organism) -> Organism {
        let offspring = Organism(orgName: organism.name, orgVelocity: organism.velocity, orgStamina: organism.stamina, orgIsSick: organism.isSick)
        return offspring
    }
    
    func produceOffspring() -> [Organism] {

        var newGeneration: [Organism] = []
        
        for organism in organisms {
            if !organism.isDead {
                var parentOrganism: Organism
                parentOrganism = organism
                parentOrganism.amParent()
                newGeneration.append(parentOrganism)
                
                
                var childOrganism: Organism = cloneOrganism(organism: organism)

                childOrganism.amOffspring()
                //childOrganism.name += "C"
                newGeneration.append(childOrganism)
            }

        }
        
        /*
        for organism in newGeneration {
            print(organism.name)
        }
        */
        
        return newGeneration
    }
    
    func mutateChildren() {
        for organism in organisms{
            if organism.isChild{
                organism.mutate()
            }
        }
    }
    
}
