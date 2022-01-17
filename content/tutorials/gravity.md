# SIMple Gravity Tutorial

gravity

["Gravity"]

Intro tutorial for SIMple Gravity

Follow along with this tutorial using [the web app](https://mkhan45.github.io/SIMple-Gravity).

SIMple Gravity is the simulator for the universal gravitation unit of physics. When you load
the app, it should contain a basic two-body system including a star and a planet:

![SIMple Gravity Interface](<%= base_url %>/static/img/grav_interface.png)

# Camera Controls

You can pan and zoom the camera using the middle mouse button. To pan,
hold the middle mouse button and move your mouse. To zoom around your
mouse cursor, use the scroll wheel.

<%= Components.post_video("grav-camera.webm") %>

# Inspect

Click a body to inspect it. Using the side panel, you can edit the body's radius, mass, and trail length.
You can also view its position, velocity, and acceleration.

![SIMple Gravity Inspect](<%= base_url %>/static/img/grav_inspect.png)

To remove the side panel, click in empty space or press Escape.

## Follow & Relative Trails

Using the inspect menu, you can follow the body and make the trails relative to the inspected body:

<%= Components.post_video("grav-follow.webm") %>

# Creating Bodies

To create bodies, use the "Create" option in the top panel:

![Create](<%= base_url %>/static/img/create_menu.png)

On this menu, adjust the mass and radius of the body, and then click the "Create" button at
the bottom to enable creation mode. Once in creation mode, you can place a body by clicking and
dragging to set its velocity. Release your mouse button to launch the body.

<%= Components.post_video("grav-create.webm") %>
