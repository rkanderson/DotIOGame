//
//  MineButton.swift
//  DotIOGame
//
//  Created by Ryan Anderson on 7/14/16.
//  Copyright © 2016 Ryan Anderson. All rights reserved.
//

import Foundation
import SpriteKit

class MineButton: SKSpriteNode {
    // This is kinda a clone of boost button lol
    
    let canPressTexture = SKTexture(imageNamed: "shuriken_can_press") //TODO change the textures
    let unableToPressTexture = SKTexture(imageNamed: "shuriken_unable_to_press")
    var onPressed: () -> Void = { print("No mine pressed action set") }
    var onReleased: () -> Void = { print("No mine realeased action set.") }
    var buttonIcon: SKSpriteNode!
    override var xScale: CGFloat {
        didSet { buttonIcon.xScale = self.xScale }
    }
    override var yScale: CGFloat {
        didSet { buttonIcon.yScale = self.yScale }
    }
    override var position: CGPoint {
        didSet { if let _ = buttonIcon { buttonIcon.position = position } }
    }
    
    init() {
        super.init(texture: nil, color: SKColor.whiteColor(), size: CGSize(width: 100, height: 100))
        alpha = 0.001 //Basically u can't see it. this is the hitbox
        self.userInteractionEnabled = true
    }
    
    func addButtonIconToParent() {
        buttonIcon = SKSpriteNode(texture: unableToPressTexture, size: CGSize(width: 80, height: 80)) //This size variable doesn't matter, as the actual hitbox of the button is independant of the size of the button icon
        buttonIcon.zPosition = self.zPosition - 1
        buttonIcon.alpha = 1
        buttonIcon.position = self.position
        parent!.addChild(buttonIcon)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        onPressed()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        onReleased()
    }

}