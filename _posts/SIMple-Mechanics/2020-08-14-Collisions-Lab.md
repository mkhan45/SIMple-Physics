---
title: Collisions Lab
date: 2020-08-14 10:15:00 -0500
categories: [SIMple_Mechanics]
tags: [mechanics]
---

Load the `collisionlab.lua` file using the "Load World" button in the top menu:
![load world]({{"/assets/img/tutorials/load_world.png"|relative_url}})

You should see something like this:
![collision lab default]({{"/assets/img/tutorials/collisionlab.png"|relative_url}})

The scene is paused on load in. To play the scene, press the pause button at the top or press space.
![collision lab played]({{"/assets/gifs/tutorials/collisionlab.gif"|relative_url}})

Reset by reloading the scene with the "Load World" button again. Each row of shapes has two masses. The mass on the left is Mass A. The mass on the right is Mass B. When the simulation runs, Mass A wil fly towards Mass B to demonstrate the physics of collisions.

This table contains the initial properties of each shape on each row:

| Row | Mass A Velocity | Mass A Elasticity | Mass A Mass | Mass B Velocity | Mass B Elasticity | Mass B Mass
|-----|-----------------|-------------------|-------------|-----------------|-------------------|------------
|  1  |        5        |        1.0        |     1.0     |       0.0       |        1.0        |     1.0
|  2  |        5        |        1.0        |     1.0     |       0.0       |        1.0        |     5.0
|  3  |        5        |        0.0        |     1.0     |       0.0       |        0.0        |     1.0
|  4  |        5        |        0.0        |     1.0     |       0.0       |        0.0        |     5.0

The Lua code is very understandable even if you don't know how to code. It's encouraged to change some values and look at the results.

___

## Collecting Data:

For each of the four rows:
1. Reload the scene. 
2. Without unpausing, right click on the left mass in the row and add an x velocity graph:
![add x vel graph]({{"/assets/img/tutorials/add_x_vel_graph.png"|relative_url}})
3. Also add an x velocity graph for the green mass.
4. It might be helpful to move the graph using the drag button in the bottom right (left click to move, right click to resize):
![move graph]({{"/assets/gifs/tutorials/move_graph.gif"|relative_url}})
5. Unpause the scene (graph jittering should be fixed soon)
![unpaused]({{"/assets/gifs/tutorials/collisionunpause.gif"|relative_url}})
6. Save the graphs to a spreadsheet using the "Save Graphs" button at the top. By default, it will save to "graphs.csv" in the folder that you downloaded the program into. Make sure to pause and save the graph while the time of collision is still shown, otherwise it won't get exported.
