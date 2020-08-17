---
title: About
---

SIMple Physics is a set of educational physics simulators. It is made to help students and teachers conduct labs and experiments for high school level physics without sophisticated and expensive equipment.

Find cool gifs at [https://mkhan45.github.io/SIMple-Physics/posts/Gifs/](https://mkhan45.github.io/SIMple-Physics/posts/Gifs/)

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

## Getting Started

To get started, try some [tutorials](https://mkhan45.github.io/SIMple-Physics/tags/tutorials/), or [complete a lab](http://localhost:4000/SIMple-Physics/tags/labs/).

Currently SIMple Mechanics is much more up to date than SIMple Physics.

___

## Contributing

Contributions are welcome. Get started with the issue tracker for each repository on Github. For now the focus is on SIMple Mechanics because that's the first unit of physics, but soon the improvements to SIMple Mechancs will need to be backported to SIMple Gravity. If you have the time, motivation, and knowledge to make a Electronics and Magnetism or Wave/Optics simulator, contact me at mikail.khan@protonmail.com.

___

## Technical Details:

Currently SIMple Gravity and SIMple Physics are written in Rust using [`ggez`](https://github.com/ggez/ggez) and [`specs`](https://github.com/amethyst/specs). Rust was chosen for its performance, easy cross-platform compilation, and for its potential to compile for the web through WebAssembly.

WebAssembly compilation is a high priority goal. Initially the (naive) expectation was that `ggez` would work on the web by the end of the year, but because that hasn't happened yet, I am exploring a rewrite using a different Rust libraries such as `wgpu-rs` and `egui` or even using Godot. Such a rewrite will not happen for the forseeable future, but `ggez` is seeing some work on WASM compilation so it might not be all that necessary in a few months.
