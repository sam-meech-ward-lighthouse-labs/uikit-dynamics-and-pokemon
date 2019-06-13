# UIKit Dynamics

* Adding forces or gravity to UIKit.
* Adds a physics engine to UIKit.
  - Simulate basic physics.
* If you're making a game <- This is the wrong answer!!!!!!
  - don't use UIKit Dynamics for games.
* If you want to add physics to buttons or image views or whatever.

If you're using uikit dynamics on a view, try to **always** use uikit dynamics on that view.

## Animating constraints

* animate the constant
* disable and enable constraints
* Create and destroy constraints 
* `transform`

if you are using auto layout, **do not** use `frame`, or `center`!!!!!!!!!!!!!!
frame = (don't do this)

## Side Note

Core animation has a CAEmitterLayer for creating "particles"