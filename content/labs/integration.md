# Position Update and Integration

integration

["Gravity"]


## Intro

[SIMple Gravity](https://gravity.simple-physics.org/) is a universal
gravitation engine. Within the engine, bodies are attracted to each
other according to Newton's law of Universal Gravity, and they collide
inelastically.

When you start the simulator, you'll see a basic orbit with a big
object in the middle and a smaller one orbiting. Click either of
these to inspect properties including their radius, mass, and velocity.

Try:
- Changing the mass and radius of the larger object, what happens when you change the radius?
- Setting trails relative to the orbiting object and following it. Can you see why people used
to believe the sun orbited the earth?

Note: At any point, reset the simulation just by reloading the page.

You can also create new objects. Click the create button on the top left
for a menu containing two sliders and a create button. Using these sliders,
you can adjust the properties of a body, and then by clicking create you
can enable create mode. You'll see a transparent body under your cursor
with the radius you set. Click and hold somewhere on the screen, dragging
your mouse to set the velocity. As you hold, you'll see a preview showing
the predicted path of the body. Release your mouse button to spawn it.

[insert gif]

Other than the create panel, there's also an options menu. Using this, you
can adjust the timestep, the gravitational constant, and toggle relative trails.
You can also pause and unpause the simulation and clear the whole scene.

The scripting panel is the most important part for this lab. Using it,
you can write a script to interact with the simulation using a language
called rhai. Try running the following code in the scripting window:

```rhai
print("Hello World")
```

You should see "Hello World" appear at the bottom of the editor.

// rhai tutorial

- Intro to loops and the update function

## For-each loops
- For each loops
- Adding constant position to every body
- Position update
