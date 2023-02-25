# Purdue Hackers Workshop

ph-workshop

["workshop"]

Gravity Workshop

Follow along with this workshop using [the web app](https://gravity.simple-physics.org).

# Intro

SIMple Physics is an interactive scriptable physics engine. There is a detailed tutorial
at <https://simple-physics.org/tutorial/gravity.html>, but most of it will be irrelevant
to this workshop.

The most important components for this workshop are:
1. Camera controls - Use middle click or alt and drag your mouse to pan, use the scroll wheel to zoom.
2. Creating bodies - Use the "Create" menu in the top left to enter creation mode, and then click and drag to create a body.
3. The scripting menu - Click the "Scripting" button at the top to open the scripting menu, and try out some of the examples.

## Scripting

The scripting menu uses a language called [Rhai](https://rhai.rs/book/). Using it, you can create and update bodies.

For example, try clicking the star at the center of the screen. In the inspect menu, you should see its ID. Click the ID text to copy its ID. Next, enter the following script into the scripting menu. Then, use the Run button (don't clear the scene):

```rs
let star = id(<paste your id here>);
star.add_vel(vec(2.0, 0.0));
```

---

## Update

The scripting engine also has an `update` function. It calls this function for every frame, so we can
use it to simulate physics by continously applying different laws. The syntax for this function
is slightly different than you might be used to. Try the following script:

```rs
let frame = 0;
let update = |ids, bodies| {
    print(frame);
    frame += 1;
};
```

The `ids` parameter is a list of the id of every body in the simulation. By looping through this list,
we can update every body. This script adds a set downwards velocity to every object, just like fixed gravity
on Earth. Try running it and then shooting bodies into an arc. The trail will form a parabola.

```rs
let update = |ids, bodies| {
    for body in ids {
        body.add_vel(vec(0.0, -0.5));
    }
};
```

# Universal Gravitation

Newton's law of Universal Gravitation states that the force of gravity between two objects is given
by the formula:

```
F_g = G * m_1 * m_2 / r^2

G = the gravitational constant
m_1 = the mass of the first object
m_2 = the mass of the second object
r = the distance between the two objects
```

Universal gravitation is a part of the engine's builtin physics, so we need to disable it so we
can implement it ourselves. To do this, we'll use the line `set_g(0.0)`.

Since this force is between every two objects in the simulation, we need to use a nested for loop:

```rs
set_g(0.0);
let G = 100.0;

let update = |ids, bodies| {
    for a in ids {
        for b in ids {
            if a != b {
                let m1 = a.get_mass();
                let m2 = b.get_mass();
                let r = a.get_pos() - b.get_pos();

                let F_mag = ???;
                let F_x = ???;
                let F_y = ???;
                let F_g = vec(F_x, F_y);

                a.add_force(F_g);
            }
        }
    }
};
```

After running this script, try creating some planets and stars yourself. They should be attracted towards each
other, and you should be able to create orbits.

# Hacking Section

Now that you've implemented universal gravitation, you might have an idea how to implement other phyiscs laws.

Some ideas are:
- Negative gravity
- Electromagnetism (reuse the mass field for charge)
- Roll your own integration (check the [integration labs](https://simple-physics.org/lab/integration-accel.html)
- Collisions (check the scripted collision script, but don't spoil yourself)
