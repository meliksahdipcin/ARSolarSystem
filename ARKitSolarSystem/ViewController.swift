//
//  ViewController.swift
//  ARKitSolarSystem
//
//  Created by Melikşah on 25.08.2019.
//  Copyright © 2019 Dipcin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
                        
        let world = createSphere(radius: 0.2, content: "world.png", vector: SCNVector3(0.5, 0.2, -1))
        let mars = createSphere(radius: 0.15, content: "mars.png", vector: SCNVector3(1, 0.2, -1))
        let venus = createSphere(radius: 0.1, content: "venus.png", vector: SCNVector3(0, 0.2, -1))
        
        sceneView.scene.rootNode.addChildNode(world)
        sceneView.scene.rootNode.addChildNode(mars)
        sceneView.scene.rootNode.addChildNode(venus)
        
        sceneView.automaticallyUpdatesLighting = true
        
    }
    
    func createSphere(radius: CGFloat, content : String, vector : SCNVector3) -> SCNNode {
        
        let mySphere = SCNSphere(radius: radius)
        let sphereMaterial = SCNMaterial()
        
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        mySphere.materials = [sphereMaterial]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        
        return node
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
