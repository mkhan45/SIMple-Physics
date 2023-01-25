# Position Update and Integration

integration-pos

["Gravity"]

In this lab, you'll learn about loops and see how the position update
equation can be used to simulate objects with a velocity.

Make sure you understand [the tutorial](https://simple-physics.org/tutorial/gravity.html)
before doing this lab.

## For-each loops

The scripting panel will be the focus of this lab. Feel free to re-read the
scripting section of the tutorial, or keep it open for reference.

Using the scripting engine, how would you print all the numbers from 1 to 5?
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

First, create some bodies by clicking the 'Create' button in the top left
or by pressing your 'c' key, then clicking and dragging. You'll want a few
bodies with close to zero velocity for the next step.

The basic update function looks like this:
```
let update = |ids, bodies| {
};
```

You may have noticed the `ids` and `bodies` parameters. In this class,
we'll primarily use `ids`, which contains the ID of every body in the
simulation. The engine grabs the ID of every body in the simulation
and calls this function on them each frame.

As with the last lab, we can use these IDs to interact with
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
x_f = x_0 + v_0 * dt
```

You can get the dt of the engine using the function `DT()`.

Using this equation, fill in the following script to implement the position update
function:

```
set_integration(false);

let update = |ids, bodies| {
    for id in ids {
        let x_0 = id.get_pos();
        let v_0 = id.get_vel();
        let dt = DT();

        let x_f = ???;

        id.set_pos(x_f);
    }
}
```

Once you're done, try instantiating more bodies. You can try colliding them too. However,
since we've implemented only position update and not velocity update, gravity won't work
properly and it will be impossible to create an orbit.
