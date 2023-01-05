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

How would you print all the numbers from 1 to 5?
You could write:

```
print(1);
print(2);
print(3);
print(4);
print(5);
```

However, most programming languages have loops, which
allow us to repeat code many times.

The main type of loop we'll use in this class is the
for-each loop, which runs code for every element (a.k.a item) 
in a list. This is usually called "iterating" over a list.

For example, to print the numbers from 1 to 5, we could instead
write:

```
for i in [1, 2, 3, 4, 5] {
    print(i);
}
```

A useful note is that Rhai has special syntax for ranges, so
`1..5 == [1, 2, 3, 4, 5]`.

Let's use this knowledge to find the sum of every number from 1 to 100:

```
let total = 0;
for i in 1..100 {
    total = total + i;
}

print(total);
```

For-each loops are a very common kind of loop. However, two other common
kinds are for loops and while loops.

While loops are important because they can be used to keep executing some
code forever. This is how the `update` function is run by the engine every frame.

## Iterating over Bodies

The basic update function looks like this:
```
let update = |ids, bodies| {
};
```

You may have noticed the `ids` and `bodies` parameters. In this class,
we'll primarily use `ids`, which contains the ID of every body in the
simulation. As with the last lab, we can use these IDs to interact with
the bodies through the scripting engine.

For example, what does this code do?
```
let update = |ids, bodies| {
    for body in ids {
        body.add_pos(vec(5.0, 0.0));
    } 
};
```

## Position Update

Start with a clear scene. The engine has a function called `set_integration` that
can enable or disable the engine's integration. Try the following script:

```
set_integration(false);
```

Now, try creating bodies with different velocities. They'll just stand still.
However, if you click them, you can see that they do have a velocity. Because
the engine's integration system is disabled, you'll have to implement position
update yourself in the scripting engine.

In class, you learned that:
```
x_f = x_0 + v_0
```

Using this equation, fill in the following script to implement the position update
function:

```
set_integration(false);

let update = |ids, bodies| {
    for id in ids {
        let x_0 = id.get_pos();
        let v_0 = id.get_vel();

        let x_f = ???;

        id.set_pos(x_f);
    }
}
```

Once you're done, try instantiating more bodies. You can try colliding them too. However,
since we've implemented only position update and not velocity update, gravity won't work
properly and it will be impossible to create an orbit.
