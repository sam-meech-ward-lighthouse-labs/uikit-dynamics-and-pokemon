# UIKit Dynamics

## Dynamics Snippets:

* View: 

```swift
let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
square.backgroundColor = UIColor.gray
view.addSubview(square)
```

* UIDynamic Animator:

```swift
animator = UIDynamicAnimator(referenceView: view)
```

* Gravity:

```swift
let gravity = UIGravityBehavior(items: [square])
animator.addBehavior(gravity)
```

* Collision:

```swift
let collision = UICollisionBehavior(items: [square])
collision.translatesReferenceBoundsIntoBoundary = true
animator.addBehavior(collision)
```

* Barrier view:

```swift
let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
barrier.backgroundColor = UIColor.red
view.addSubview(barrier)
```

* Barrier view as a collision:

```swift
UICollisionBehavior(items: [square, barrier])
```

* `addBoundary`

```swift
let rightEdge = CGPoint(x: barrier.frame.origin.x + barrier.frame.size.width, y: barrier.frame.origin.y)
collision.addBoundary(withIdentifier: "barrier" as NSString, from: barrier.frame.origin, to: rightEdge)
```

* `UICollisionBehaviorDelegate`:

```swift
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
    
    let view = item as! UIView
    view.backgroundColor = UIColor.yellow
    UIView.animate(withDuration: 0.3) {
        view.backgroundColor = UIColor.gray
    }
    
}
```


```swift
@IBAction func pannedImage(_ sender: UIPanGestureRecognizer) {
  let dragPoint = sender.location(in: view)
  attachment?.anchorPoint = dragPoint
  
  switch sender.state {
  case .began:
    attachment = UIAttachmentBehavior(item: imageView, offsetFromCenter: UIOffset(horizontal: dragPoint.x-imageView.center.x, vertical: dragPoint.y-imageView.center.y), attachedToAnchor: dragPoint)
    animator.addBehavior(attachment!)
  case .changed:
    break;
  case .ended, .cancelled, .failed:
    if let attachment = attachment {
      animator.removeBehavior(attachment)
    }
  default:
    break
  }
}
```