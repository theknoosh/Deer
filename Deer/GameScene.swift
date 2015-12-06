//
//  GameScene.swift
//  Deer
//
//  Created by DPayne on 12/5/15.
//  Copyright © 2015 Sanctuary of Darkness. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameScene: SCNScene {
    
    convenience init(create:Bool) {
        self.init()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera!.usesOrthographicProjection = true
        cameraNode.position = SCNVector3(0,1,5)
        
        rootNode.addChildNode(cameraNode)
        let spotLight = SCNNode()
        spotLight.light = SCNLight()
        spotLight.light!.type = SCNLightTypeSpot
        spotLight.light!.attenuationStartDistance = 0
        spotLight.light!.attenuationFalloffExponent = 2
        spotLight.light!.attenuationEndDistance = 50
        spotLight.light!.color = UIColor(red: 1, green: 0x2b/255.0, blue: 0x71/255.0, alpha: 1)
        spotLight.position = SCNVector3(0,2,2)
        
        rootNode.addChildNode(spotLight)
        
        let ambiLight = SCNNode()
        ambiLight.light = SCNLight()
        ambiLight.light!.type = SCNLightTypeAmbient
        ambiLight.light!.color = UIColor.whiteColor()
        
        rootNode.addChildNode(ambiLight)
        
        let spotLookAtNode = SCNNode()
        spotLookAtNode.position = SCNVector3Zero
        
        spotLight.constraints = [SCNLookAtConstraint(target: spotLookAtNode)]
        cameraNode.constraints = [SCNLookAtConstraint(target: spotLookAtNode)]
        
        let deerScene = SCNScene(named: "art.scnassets/Deer.dae")!
        let deer = deerScene.rootNode.childNodeWithName("Deer", recursively: true)!
        
        let empty = SCNNode()
        empty.scale = SCNVector3(2,2,2)
        empty.position = SCNVector3(0.25,0,0)
        empty.rotation = SCNVector4(0,1,0,Float(M_PI_4))

        empty.addChildNode(deer)
        
        rootNode.addChildNode(empty)
        

        
    }
}
