---
title: About
---

# SIMple Physics

Metarepo/website for [https://github.com/mkhan45/SIMple-Gravity](https://github.com/mkhan45/SIMple-Gravity) and [https://github.com/mkhan45/SIMple-Mechanics](https://github.com/mkhan45/SIMple-Mechanics)

Using the Chirpy jekyll theme
https://chirpy.cotes.info/

___

SIMple Physics is a set of educational physics simulators. It is made to help students and teachers conduct labs and experiments for high school level physics without sophisticated and expensive equipment.

Important goals include:

- Performance even on lower spec'd machines
- Cross platform
- Ease of use
- Free and [Open Source](https://github.com/mkhan45/SIMple-Physics)
- Extensibility

SIMple Physics aims to include a separate simulator for each section of high school physics, including:

- ✔️ Kinematics, Projectile Motion, and basic Mechanics (SIMple Mechanics) [Github](https://github.com/mkhan45/SIMple-Gravity)
- ✔️ Universal Gravitation (SIMple Gravity) [Github](https://github.com/mkhan45/SIMple-Mechanics)
- ❌Electromagnetics and Magnetism
- ❌Waves and Optics

Each simulator has a few core features to help learn and teach physics. For example,

- Save and load preset scenes
- Graph object properties and export graphs to CSV
- Extensive documentation and example labs

SIMple Physics was started as my high school senior research project. Unfortunately, because of COVID, I didn't finish it during the school year. After it became clear that the 2020-2021 school year would also be primarily online, I decided to finish the project and make it useable for real world classes.
___

Technical Details:

Currently SIMple Gravity and SIMple Physics are written in Rust using [`ggez`](https://github.com/ggez/ggez) and [`specs`](https://github.com/amethyst/specs). Rust was chosen for its performance, easy cross-platform compilation, and for its potential to compile for the web through WebAssembly.

WebAssembly compilation is a high priority goal. Initially the (naive) expectation was that `ggez` would work on the web by the end of the year, but because that hasn't happened yet, I am exploring a rewrite using a different Rust libraries such as `wgpu-rs` and `egui` or even using Godot. Such a rewrite will not happen for the forseeable future, but `ggez` is seeing some work on WASM compilation so it might not be all that necessary in a few months.
