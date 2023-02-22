# Drag and Velocity-Dependent Acceleration

drag

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
`A` is the area of the object, and `c_d` is the drag coefficient.

## Implementing drag

Since there are no changes to the actual integration equations, we can reuse the engine's
built-in integration. We'll just need to add the drag force to each body.

```
const RHO = 1.0;
const DRAG_COEFFICIENT = 0.5;

let update = |ids, bodies| {
    for body in ids {
        let v = body.get_vel();
        let r = body.get_radius();

        let A = ???;
        let F_d = ???;

        body.add_force(F_d);
    }
};
```

## Exercises

1. Using the `create_body()` function before the update function, create two bodies with the same starting velocity, but one with
half the radius of the other. Run the simulation. Approximately how far did the larger body travel in relation
to the smaller one?

2. Add this line to the end of your loop to simulate fixed gravity: `body.add_force(vec(0.0, -9.8) * body.get_mass())`. Additionally, use `create_body()` before `update` to create an object with radius 50.0 and mass 10.0. Run the script. The body should accelerate downwards from gravity, and then reach a fixed velocity due to drag. What is the terminal velocity of this object? It might be helpful to follow the body through its inspect panel.
