//
//  AutoLayoutViewController.swift
//  PokemonTinder
//
//  Created by Sam Meech-Ward on 2019-06-13.
//  Copyright © 2019 meech-ward. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

  @IBOutlet weak var topConstraints: NSLayoutConstraint!
  @IBOutlet weak var centerConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  @IBAction func tappedScreen(_ sender: Any) {
    
    if topConstraints.isActive {
      topConstraints.isActive = false
      centerConstraint.isActive = true
    } else {
      centerConstraint.isActive = false
      topConstraints.isActive = true
    }
    
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.56, initialSpringVelocity: 0.5, options: [], animations: {
      // animation code
      self.view.layoutIfNeeded()
      
      if self.topConstraints.isActive {
        self.imageView.transform = self.imageView.transform.rotated(by: CGFloat.pi)
      } else {
        self.imageView.transform = CGAffineTransform.identity
      }
    }) { _ in
      
    }
    
    
  }

}
