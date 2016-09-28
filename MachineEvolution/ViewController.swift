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

        var organisms: [Organism] = []
        for i in 0..<100 {
            organisms.append(Organism(orgName: "Q\(i)", orgVelocity: 0.0, orgStamina: 0, orgIsSick: false))
        }
        
        var generation: Generation = Generation(organismsHere: organisms)
        
        generation.mutateAll()
        generation.runAll()
        generation.printAllStats()
        print(generation.numberSick())
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

