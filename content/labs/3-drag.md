# Drag and Velocity-Dependent Acceleration

3-drag

[]

So far, we've implemented integration that can handle variable acceleration.
Next, we'll implement a simulation for objects whose acceleration depends
on their velocity.

## Drag

The equation for drag force on an object is:

```
F_d = 0.5 * rho * v^2 * A * c_d
```

Where `rho` is the density of the fluid, `v` is the velocity of the object relative to the fluid,
`A` is the area of the object, and `c_d` is the drag coefficient. In this equation `v^2` represents
a vector with the magnitude of `v` squared, and the same direction as `v`.

## Implementing drag

Since there are no changes to the actual integration equations, we can reuse the engine's
built-in integration. We'll just need to add the drag force to each body. Additionally,
since drag forces are very low at low velocities, we'll add a check to see if the velocity
is below a certain threshold, and if so, set the velocity to zero. This is an approximation
so that we don't have to wait forever for objects to stop moving.

```
const RHO = 1.0;
const DRAG_COEFFICIENT = 5 * 0.1**9;

let update = |ids, bodies| {
    for body in ids {
        if (is_paused()) {
            return;
        }

        let v = body.get_vel();
        let s = v.length;
        if (s < 1.0) {
            body.set_vel(vec(0.0, 0.0));
            continue;
        }
        
        let v_norm = v / s;
        let r = body.get_radius();

        let A = ???;
        let F_d = ???;

        body.add_force(-F_d);
    }
};
```

## Exercises

1. Using the `create_body()` function before the update function, create two bodies with the same starting velocity, but one with half the radius of the other. Make sure the radii are more than 250.0, and the masses are 1.0, or else the drag force will not be noticeable. Run the simulation. Approximately how far did the larger body travel in relation to the smaller one?

2. Add this line to the start of your loop after the if statement to simulate fixed gravity: `body.add_force(vec(0.0, -1.0) * body.get_mass())`. Additionally, use `create_body()` before `update` to create an object with radius 50.0 and mass 10.0. Run the script. The body should accelerate downwards from gravity, and then reach a fixed velocity due to drag. What is the terminal velocity of this object? It might be helpful to follow the body through its inspect panel.

3. You can adjust the timestep of the simulation through the options panel at the top. Set up a simulation with one body with mass 1.0 and radius 100.0, and velocity `vec(10.0, 0.0)`. First, calculate the expected end position of the body by hand. Then, experiment with different timesteps. How does the timestep affect the simulation accuracy?
