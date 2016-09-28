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

        let quark = Organism(orgName: "Quark", orgVelocity: 0, orgStamina: 0, orgIsSick: false)

        
        for _ in 0..<100 {
            quark.mutate()
            quark.runDistance()
            quark.printStats()
        }
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

