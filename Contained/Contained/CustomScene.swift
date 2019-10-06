//
//  CustomScene.swift
//  Contained
//
//  Created by Alex Thompson on 10/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import SpriteKit

class CustomScene: SKScene {
    let crab = SKSpriteNode()
    
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        addChild(crab)
        crab.loadTextures(named: "HappyCrab", forKey: SKSpriteNode.textureKey)
        crab.position = CGPoint(x: frame.midX, y: frame .midY)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !touches.isEmpty, let touch = touches.first else {return}
        
        let position = touch.location(in: self)
        
        let actionDuration = 1.0
        let moveAction = SKAction.move(to: position, duration: actionDuration)
        
        let rollAction = SKAction.rotate(byAngle: CGFloat.pi *  2, duration: actionDuration)
        let zoomAction = SKAction.scale(by: 1.3, duration: 0.3)
        let unzoomAction = SKAction.scale(to: 1.0, duration: 0.1)
        
        switch Settings.shared.shouldZoom {
        case false:
            crab.run(moveAction)
        case true:
            let sequenceAction = SKAction.sequence([zoomAction, moveAction, unzoomAction])
            crab.run(sequenceAction)
        }
        if Settings.shared.shouldRoll {
            crab.run(rollAction)
        }
        switch Settings.shared.changeCrab {
        case false: crab.loadTextures(named: "HappyCrab", forKey: SKSpriteNode.textureKey)
        case true: crab.loadTextures(named: "WaitingCrab", forKey: SKSpriteNode.textureKey)
            
        }
    }
}
