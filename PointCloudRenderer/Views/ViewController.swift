//
//  ViewController.swift
//  PointCloudRenderer
//
//  Created by Haruya Ishikawa on 2018/03/27.
//  Copyright © 2018 Haruya Ishikawa. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zNear = 1.0
        cameraNode.camera?.zFar = 100.0
        //scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 0.3)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 3, z: 3)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the node
        let pc = PointCloud()
        let pcNode = pc.getNode()
        pcNode.position = SCNVector3(x: 0, y: -0.1, z: 0)
        
        scene.rootNode.addChildNode(pcNode)
        
        // animate the 3d object
        pcNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))
        
        // set the scene to the view
        sceneView.scene = scene
        
        // allows the user to manipulate the camera
        sceneView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = .showWireframe
        
        // configure the view
        sceneView.backgroundColor = UIColor.gray
    }


}

