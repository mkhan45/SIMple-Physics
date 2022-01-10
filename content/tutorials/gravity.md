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

<div>
    <video controls loop>
        <source src="<%= base_url %>/static/video/grav-camera.webm" type="video/webm"/>
        <source src="<%= base_url %>/static/video/grav-camera.mp4" type="video/mp4"/>
    </video>
</div>

# Inspect

Click a body to inspect it. Using the side panel, you can edit the body's radius, mass, and trail length.
You can also view its position, velocity, and acceleration.

![SIMple Gravity Inspect](<%= base_url %>/static/img/grav_inspect.png)

To remove the side panel, click in empty space or press Escape.

## Follow & Relative Trails

Using the inspect menu, you can follow the body and make the trails relative to the inspected body:

<div>
    <video controls loop>
        <source src="<%= base_url %>/static/video/grav-follow.webm" type="video/webm"/>
    </video>
</div>
