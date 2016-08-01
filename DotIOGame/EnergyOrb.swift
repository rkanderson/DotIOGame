//
//  EnergyOrb.swift
//  DotIOGame
//
//  Created by Ryan Anderson on 7/11/16.
//  Copyright © 2016 Ryan Anderson. All rights reserved.
//

import Foundation
import SpriteKit

class EnergyOrb: SKSpriteNode, BoundByCircle {
    
    static let orbTextures: [Color : SKTexture] = [
        .Blue: SKTexture.init(imageNamed: "blue_orb.png"),
        .Red: SKTexture.init(imageNamed: "red_orb.png"),
        .Green: SKTexture.init(imageNamed: "green_orb.png"),
        .Yellow: SKTexture.init(imageNamed: "yellow_orb.png")
    ]
    
    var radius: CGFloat = 15 {
        didSet {
            size = CGSize(width: radius * 2, height: radius * 2)
        }
    }
    var minRadius: CGFloat = 10, maxRadius: CGFloat = 15
    var growAmount: CGFloat = 1/5
    
    var growing = true
    var artificiallySpawned = false // An artificially spawned orb will not be considered when the game tries to maintain a constant concentration of natural orbs (spawned from nothing)
    //var isEaten = false
    var type: GameScene.OrbType = GameScene.OrbType.Small
//    @objc override class func initialize() {
//        
//    }
    
    init(orbColor: Color, type: GameScene.OrbType) {
        self.type = type
        let texture = EnergyOrb.orbTextures[orbColor]
        let color = SKColor.whiteColor()
        defer { radius = 0 }
        let size = CGSize(width: 2*radius, height: 2*radius)
        super.init(texture: texture, color: color, size: size)
        zPosition = 0
        blendMode = .Add
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(deltaTime: CFTimeInterval) {
        if growing {
            radius += 20 * CGFloat(deltaTime)
            if radius >= maxRadius {growing = false}
        } //else {
            //radius -= 20 * CGFloat(deltaTime)
            //if radius <= minRadius {growing = true}
        //}
    }
    
    
    
}
