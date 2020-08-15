---
title: SIMple Mechanics Tutorial
date: 2020-08-15 03:48:00 -0500
categories: [SIMple_Mechanics, Tutorials]
tags: [mechanics, tutorials]
---

SIMple Mechanics is the simulator meant for the kinematics, projectile motions, and collisions sections of high school physics. 

## Download/Installation
`//TODO`

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
