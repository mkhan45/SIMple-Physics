# Collisions

collisions

[]

In this lab, we'll implement a simulation of elastic collisions between objects in the SIMple Physics engine. Elastic collisions conserve both momentum and kinetic energy. We'll guide you through implementing the collision algorithm and then provide exercises to test your implementation.

## Background

An elastic collision is one where the total kinetic energy of the system is conserved before and after the collision. In a perfectly elastic collision, objects will bounce off each other without any loss of energy. The equations governing the final velocities `v_1f` and `v_2f` of two objects with masses `m_1` and `m_2` and initial velocities `v_1i` and `v_2i` are:

```
v_1f = (m_1 - m_2)/(m_1 + m_2)*v_1i + 2m_2/(m_1 + m_2) * v_2i
v_2f = 2m_1/(m_1 + m_2)*v_1i + (m_2 - m_1)/(m_1 + m_2) * v_2i
```

## Implementing Elastic Collisions

First, we'll need to disable the engine's built-in collision system by adding the following line at the beginning of your script:

```rhai
set_collisions(false);
```

Now, we'll implement the update function that checks for collisions between objects and calculates their new velocities based on the elastic collision equations:

```rhai
let ELASTICITY = 1.0;

let update = |ids, bodies| {
    for i in 0..(ids.length - 1) {
        for j in (i+1)..ids.length {
            let a = ids[i];
            let b = ids[j];
            
            let m1 = a.get_mass();
            let m2 = b.get_mass();
            let mt = m1 + m2;

            let v1 = a.get_vel();
            let v2 = b.get_vel();

            let r1 = a.get_radius();
            let r2 = b.get_radius();
            let r = b.get_pos() - a.get_pos();
            // the radius after the next timestep
            let nr = (b.get_pos() + v2) - (a.get_pos() + v1);

            if ??? {
                let v1f = ???;
                let v2f = ???;

                a.set_vel(v1f);
                b.set_vel(v2f);
            }
        }
    }
};
```

To complete the implementation, you'll need to fill in the missing parts of the script:

1. Determine the condition for a collision to occur. The bodies should be touching and actually moving towards each other.

2. Calculate the final velocities (`v1f` and `v2f`) using the elastic collision equations.

## Exercises

After implementing the elastic collisions script, test your implementation with the following exercises:

1. Create two objects of equal mass and different initial velocities. Observe how their velocities change after the collision. Do the objects exchange their velocities?

2. Create two objects with different masses and observe how their final velocities are affected by the mass ratio. How does the mass ratio impact the energy transfer during the collision?

3. Set up a series of objects in a row with equal spacing, like a Newton's Cradle. Give the first object an initial velocity towards the row. Observe the behavior of the objects as they collide. How does the conservation of kinetic energy play a role in the chain reaction?

4. Experiment with varying values of elasticity. How does the elasticity affect the behavior of the collisions and the conservation of kinetic energy in the system?

5. Bonus: What happens when multiple objects collide at the exact same time? Why does this happen? The solution is to use a constraint solver, which is far outside the scope of this class.
