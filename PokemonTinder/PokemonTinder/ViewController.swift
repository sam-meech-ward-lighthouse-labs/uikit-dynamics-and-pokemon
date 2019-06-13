//
//  ViewController.swift
//  PokemonTinder
//
//  Created by Sam Meech-Ward on 2019-06-13.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  var animator: UIDynamicAnimator!
  var gravity: UIGravityBehavior!
  var collision: UICollisionBehavior!
  var attachmentBehaviour: UIAttachmentBehavior?
  var snap: UISnapBehavior!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    animator = UIDynamicAnimator(referenceView: view)
    
    gravity = UIGravityBehavior(items: [imageView])
    gravity.magnitude = 1.0
    animator.addBehavior(gravity)
    
    collision = UICollisionBehavior(items: [imageView])
//    collision.translatesReferenceBoundsIntoBoundary = true;
    collision.addBoundary(withIdentifier: "floor" as NSString, from: CGPoint(x: view.frame.minX, y: view.frame.maxY), to: CGPoint(x: view.frame.maxX, y: view.frame.maxY))
    animator.addBehavior(collision)
    
    snap = UISnapBehavior(item: imageView, snapTo: view.center)
    animator.addBehavior(snap)
  }

  @IBAction func panImageView(_ sender: UIPanGestureRecognizer) {
    let dragPoint = sender.location(in: view)
    attachmentBehaviour?.anchorPoint = dragPoint
    
    switch sender.state {
    case .began:
      animator.removeBehavior(gravity)
      animator.removeBehavior(snap)
      attachmentBehaviour = UIAttachmentBehavior(item: imageView, offsetFromCenter: UIOffset(horizontal: dragPoint.x-imageView.center.x, vertical: dragPoint.y-imageView.center.y), attachedToAnchor: dragPoint)
      
      animator.addBehavior(attachmentBehaviour!)
    case .changed:
      sender.setTranslation(.zero, in: view)
      break;
    case .ended, .cancelled, .failed:
      if let attachmentBehaviour = attachmentBehaviour {
        animator.removeBehavior(attachmentBehaviour)
      }
      if dragPoint.x >= view.frame.width - 75 || dragPoint.x <= 75 {
        animator.addBehavior(gravity)
      } else {
        animator.addBehavior(snap)
      }
    default:
      break
    }
  }
  
  @IBAction func tappedScreen(_ sender: Any) {
//    animator.addBehavior(gravity)
  }
}

