# Springs

5-spring

[]

In this lab, you'll learn about loops and see how the momentum update
equation can be used to simulate objects with variable acceleration.

## Spring Forces

To start out, we'll script a spring. Specifically, we'll apply a
spring force to every object towards the center of the screen
using this function:

```
const SPRING_CONSTANT = 0.001;
const DAMPING_FACTOR = 0.999;

fn apply_spring_forces(ids) {
    for body in ids {
        draw_spring(
            vec(0.0, body.get_pos().y),
            body.get_pos(),
            body.get_radius() * 2.0,
            body.get_radius() / 2.0,
            10
        );
        let spring_length = (body.get_pos().x + body.get_vel().x);
        body.add_force(vec(SPRING_CONSTANT * -spring_length, 0.0));
        body.set_vel(body.get_vel() * DAMPING_FACTOR);
    }
}
```

Try to understand this function. The important line is this:
```
body.add_force(vec(SPRING_CONSTANT * -spring_length, 0.0));
```

The `damping_factor` simulates energy lost by the spring. It is common
in computational integration to prevent integration error for growing;
it is better for the total energy of the system to increase than decrease.
In real life, the total energy of a system will generally fall due to air
resistance, friction, or other small forces, so damping is a good approximation.

We can use these functions in the update function below. Also, make sure to include
the `draw_spring` function:
```
set_g(0.0);

let update = |ids, bodies| {
    if (!is_paused()) {
        apply_spring_forces(ids);
    }
};

fn apply_spring_forces(ids) {
    ...
}

fn draw_spring(start, end, width, thickness, coils) {
    let r = end - start;
    let incr = r / coils;
    let offs = incr.rotate(3.1415 / 2.0).normalized * width;

    let pos = start;
    for i in 0..coils {
        let p1 = pos + (incr / 3.0) + (offs / 2.0);
        let p2 = pos + (incr * 2.0/3.0) - (offs / 2.0);
        let p3 = pos + incr;
        draw_line(pos, p1, thickness);
        draw_line(p1, p2, thickness);
        draw_line(p2, p3, thickness);
        pos = p3;
    }
}
```

Run this script and try instantiating some objects. What happens? Try giving them
a bit of vertical velocity.

## Total Energy

Next, we'll examine the total energy of the system by calculating it at each
step of the simulation. Let's add some code to print the kinetic, potential,
and total energy of the simulation. Fill in the question marks below:

```
set_g(0.0);

let update = |ids, bodies| {
    if (!is_paused()) {
        apply_spring_forces(ids);
    }

    let total_kinetic_energy = 0.0;
    let total_potential_energy = 0.0;
    for body in ids {
        let m = body.get_mass();
        let x = body.get_pos().x;
        let v = body.get_vel();
        let v_mag = v.length;

        // use the SPRING_CONSTANT variable for 
        // potential energy
        let body_kinetic_energy = ???;
        let body_potential_energy = ???;

        // add the body's energy to the total
        total_kinetic_energy += body_kinetic_energy;
        total_potential_energy += body_potential_energy;
    }

    let total_energy = 
        total_kinetic_energy + total_potential_energy;

    print(
        [total_kinetic_energy, total_potential_energy, total_energy]
    );
};

fn apply_spring_forces(ids) {
    ...
}

fn draw_spring(start, end, width, thickness, coils) {
    ...
}
```

Clear the scene and run the script, and then use the "Create" button in the top left to add a body
a few inches left of the center of the screen. Then, try pausing the simulation by pressing space
when the body is roughly at the center of the screen. Next, do the same when the body is at the right
or left of the screen.

1. When is the potential energy maximized, and when is the kinetic energy maximized?

2. You might notice that the total energy of the system isn't completely constant. Given your
knowledge about computational integration, why do you think this is? Try adjusting the `damping_factor`
and delta time, or adding more bodies.

3. Super Bonus: Try playing with <https://cloth.mikail-khan.com>. This cloth simulator uses spring constraints
between every node. However, it doesn't use anything like the `apply_spring_forces` function above. Instead,
it uses a spring constraint solving approach which updates the positions directly. Try implementing this
approach in your own script, and see how the energy is preserved. You can find the source code for the
cloth simulator here: <https://github.com/mkhan45/clothsim>
