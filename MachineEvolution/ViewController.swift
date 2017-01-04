//
//  ViewController.swift
//  MachineEvolution
//
//  Created by John Chiaramonte on 9/27/16.
//  Copyright © 2016 John Chiaramonte. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var starterOrganisms: [Organism] = []
        for i in 0..<100 {
            starterOrganisms.append(Organism(orgName: "Q\(i)", orgVelocity: 0.0, orgStamina: 0, orgIsSick: false))
        }
        
        var generations: [Generation] = []
        
        generations.append(Generation(organismsHere: starterOrganisms, genName: "Gen0"))
        generations[0].mutateAll()
        
        for i in 0..<100 {
            generations[i].mutateChildren()
            generations[i].runAll()
            
            if i % 100 == 0 {
                print("Generation \(i)======================================================")
                
                print("Worst Organism")
                generations[i].bottomFitnessOrganism().printStats()
                print("Median Organism")
                generations[i].medianFitnessOrganism().printStats()
                print("Best Organism")
                generations[i].topFitnessOrganism().printStats()
            }


            generations[i].deathCycle()
            generations.append(Generation(organismsHere: generations[i].produceOffspring(), genName: "Gen\(i+1)"))
        }
     
        generations[generations.count-1].printGenStats()
        generations[generations.count-1].printLifeStats()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

