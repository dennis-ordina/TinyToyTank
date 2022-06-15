//
//  ViewController.swift
//  TinyToyTank
//
//  Created by Dennis van Oosten on 15/06/2022.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    var isActionPlaying: Bool = false
    
    @IBOutlet var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    @IBAction func tankRightPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { isActionPlaying = true }
        
        tankAnchor!.notifications.tankRight.post()
    }
    
    @IBAction func tankLeftPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { isActionPlaying = true }
        
        tankAnchor!.notifications.tankLeft.post()
    }
    
    @IBAction func tankForwardPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { isActionPlaying = true }
        
        tankAnchor!.notifications.tankForward.post()
    }
    
    @IBAction func turretRightPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { isActionPlaying = true }
        
        tankAnchor!.notifications.turretRight.post()
    }
    
    @IBAction func turretLeftPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { isActionPlaying = true }
        
        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func cannonFirePressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { isActionPlaying = true }
        
        tankAnchor!.notifications.cannonFire.post()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor!.cannon?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor!.actions.actionComplete.onAction = { _ in
            self.isActionPlaying = false
        }
        
        arView.scene.anchors.append(tankAnchor!)
    }
}
