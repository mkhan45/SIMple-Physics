---
title: SIMple Mechanics Tutorial
date: 2020-08-15 03:48:00 -0500
categories: [SIMple_Mechanics, Tutorials]
tags: [mechanics, tutorials]
---

SIMple Mechanics is the simulator meant for the kinematics, projectile motions, and collisions sections of high school physics. 

## Download/Installation

#### Windows

1. Download the latest windows release from the [Github releases page](https://github.com/mkhan45/SIMple-Mechanics/releases/tag/1.0.0). It should be called `SIMple-Mechanics-windows.zip`. 
2. Unzip the folder in a folder of your choosing. Remember this folder, as this is where you'll find output graphs and sample Lua files.
3. Run `physics-engine-v2.exe`

#### MacOS

SIMple Mechanics is not currently compiled for MacOS because I don't have a Mac. If you would like to compile it for distribution, contact me at mikail.khan@protonmail.com

#### Linux
1. Download the latest windows release from the [Github releases page](https://github.com/mkhan45/SIMple-Mechanics/releases/tag/1.0.0). It should be called `SIMple-Mechanics-linux.tar.gz`. 
2. Unzip the archive in a folder of your choosing. Remember this folder, as this is where you'll find output graphs and sample Lua files.
3. Run `physics-engine-v2`

___

## Getting Started

When you run SIMple Mechanics for the first time, you should see this:
![initial setup]({{"/assets/img/tutorials/initial_setup.png"|relative_url}})

You can drag around objects with your mouse. 
![drag objects]({{"/assets/gifs/tutorials/drag_objects.gif"|relative_url}})

## Menu bar
There are a few menus on the menu bar.
![menus]({{"/assets/gifs/tutorials/mechanics_menus.gif"|relative_url}})

- Create: adjust the properties of newly created objects
    - Centered: Makes created objects start from the center instead of the bounds
    - Static: Makes created objects completely static, for floors and walls
- Settings: adjust global simulation settings
    - Timestep: The amount of time, in seconds, passed every physics step. The lower this is, the more accurate the simulation will be. 0.016 is the default because each frame is about 16 milliseconds apart, assuming a frame rate of 60 FPS.
    - Gravity
    - Steps per frame: The number of steps calculated each frame. Higher values will make the simulation faster without sacrificing accuracy but can reduce the frame rate.
- Save Graphs: Saves graphs of **named** objects to a CSV file for use in spreadsheet software. The file will be in the folder from which the program was executed.
- Save World: Exports the world to a lua file. The file will be in the lua/ subfolder of the folder in which the program was executed.
- Load World: Loads a lua file from the lua/ subfolder
- Clear: Deletes all objects from the scene
- Pause: Pauses the simulation

## Sidepanel

The sidepanel appears when you right click an object. To deselect an object, right click on an empty spot. The sidepanel lets you see and modify an object's properties. You can also use it to create graphs or delete the shape.
![sidepanel]({{"/assets/gifs/tutorials/sidepanel.gif"|relative_url}})

## Graphs

You can graph an object's properties. Move the graph by left clicking and dragging on the bottom right corner. Scale the graph by right clicking on the corner and dragging. Graphs of objects with a name can be exported to CSV with the "Save Graphs" button. Graphs take on the color of their object, and you can tell what property they are graphing by point style:

| Property            | Point Style |
|---------------------|-------------|
| Speed               | Square      |
| Rotational Velocity | Dot         |
| X Position          | Ring        |
| Y Position          | Ring        |
| X Velocity          | Diamond     |
| Y Velocity          | Diamond     |
| Rotation Angle      | Ring        |

![graphs]({{"/assets/gifs/tutorials/graphs.gif"|relative_url}})

## Hotkeys

| Hotkey        | Action                        |
|---------------|-------------------------------|
| B             | Create a box                  |
| C             | Create a circle               |
| Space         | Pause/Unpause                 |
| S             | Create object static          |
| A             | Create object centered        |
| Shift+D       | Delete all objects            |
| D             | Delete object on sidepanel    |

## Lua

You can create scenes using Lua. Lua is a very simple language so you can probably get started by looking at the defaults in the lua/ folder if you know how to code. The `pinball.lua` example should be a good starting point

There are two important functions:

- `add_shape(shape)` adds a shape
- `add_shapes(shape1, shape2, ...)` adds many shapes

A shape is a Lua table with the following fields:

|  Name         |    Possible Values            | Default |                  Description                          |
|---------------|-------------------------------|---------|-------------------------------------------------------|
| `shape`       | "rect", "circle"              |   N/A   |The shape of the object                                |
| `status`      | "static", "dynamic"           | dynamic |Static objects are unaffected by physics               |
| `x`           | Any number                    |   N/A   |The x coordinate of the center of the object           |
| `y`           | Any number                    |   N/A   |The y coordinate of the center of the object           |
| `rotation`    | Any number                    |   N/A   |The rotation of the object                             |
| `x_vel`       | Any number                    |    0    |The x velocity of the object                           |
| `y_vel`       | Any number                    |    0    |The y velocity of the object                           |
| `rotvel`      | Any number                    |    0    |The rotational/angular velocity of the object          |
| `w`           | Any number                    |   N/A   |If the shape is a rectangle, its width                 |
| `h`           | Any number                    |   N/A   |If the shape is a rectangle, its height                |
| `r`           | Any number                    |   N/A   |If the shape is a circle, its radius                   |
| `mass`        | Any number >= 0               |   N/A   |The object's mass                                      |
| `elasticity`  | A number between 0 and 1      |   0.2   |An object's elasticity/restitution/bounciness          |
| `friction`    | A number between 0 and 1      |   0.5   |An object's static and dynamic friction coeficient     |
| `name`        | Any text                      |  Empty  |An object's name, used for graphing                    |
| `color`       | A table containing {r, g, b}  |  Empty  |The color of the object, RGB values range from 0 to 255|

Values with a default value of N/A are mandatory, except for `w`, `h`, and `r`, which are only mandatory if you are using the corresponding shape.


Additionally, there are a few global variables. 

- `GRAVITY` can be modified to change the gravity of the scene. Positive values make things go to the bottom of the screen.
- `SCREEN_X` is the width of the screen.
- `SCREEN_Y` is the height of the screen.

For security, the Lua environment is sandboxed. You can only use the base, table, math, and string modules of the standard library. Additionally, there is a memory limit of 256 MB and an instruction limit of 75,000.
