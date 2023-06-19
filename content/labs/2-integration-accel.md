# Momentum Update - Constant Force

2-integration-accel

["Gravity"]

In this lab, you'll learn about loops and see how the position update
equation can be used to simulate objects with acceleration.

Make sure you understand [the tutorial](https://simple-physics.org/tutorial/gravity.html)
and [the previous integration lab](https://simple-physics.org/lab/integration-pos.html) before doing this lab.

In the last lab, you implemented position update integration. As you observed, this
was limited to fixed velocities. In this lab, you'll learn how to update the velocity
so that we can simulate the fixed force of gravity on Earth.

# Velocity-Update

The velocity update equation is:
```
v_f = v_0 + a * dt
```

Use this equation and the code from earlier to write
a velocity update script. Fill in the question marks
with the correct velocity update code.

```
set_integration(false);

add_body(#{pos: vec(0, 0), accel: vec(0.0, -0.1), radius: 50.0});

let update = |ids, bodies| {
    for ?? {
        let x_0 = id.get_pos();
        let v_0 = id.get_vel();
        let a_0 = id.get_accel();
        let dt = DT();

        let x_f = ??
        let v_f = ??

        id.set_pos(x_f);
        id.set_vel(??);
    }
}
```

If you've done it correctly, the ball should fall, accelerating down.

___

To check that this behavior is exactly what we expect, let's run an experiment.
Fill in the ellipses below using your previous code to complete the script.

```
set_integration(false);

add_body(...);

let t = 0.0;
let update = |ids, bodies| {
    if (is_paused()) {
        return;
    }
    if (t >= 300.0) {
        set_paused(true);
    }

    for ... {
        ...
    }

    t += DT();
}
```

Don't worry if you don't understand the added code. Its purpose it to keep track of the
time and pause the simulation after about 5 seconds.

___

Now, calculate the expected position and velocity of the ball by hand. Note that
the simulation's time does not match up with the real world.

- Delta Time: 300 seconds
- Start Position: 0.0 meters
- Start Velocity: 0.0 m/s
- Start Acceleration: -0.1 m/s²

- End position: ??
- End Velocity: ??

Click the body in the simulation. Does its velocity and position match what you calculated?

The velocity should match up exactly, but it is expected that the position will be a little
different than calculated. This is because of computational integration error; we are essentially
taking a Riemann sum with non-zero width rectangles. Numerical integration is an advanced
topic that won't be covered in this class. If you're interested, read about it 
[on Wikipedia](https://en.wikipedia.org/wiki/Numerical_integration).
