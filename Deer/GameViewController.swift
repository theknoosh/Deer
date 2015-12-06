//
//  GameViewController.swift
//  Deer
//
//  Created by DPayne on 12/4/15.
//  Copyright (c) 2015 Sanctuary of Darkness. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var sceneView: SCNView?
    let scene = GameScene(create: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = self.view as? SCNView
        if let view = sceneView {
            
            view.scene = scene
            view.showsStatistics = true
            view.backgroundColor = UIColor(red: 0xc9/255.0, green: 0xcf/255.0, blue: 0xfb/255.0, alpha: 1)
            view.antialiasingMode = SCNAntialiasingMode.Multisampling4X
            
        }
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
