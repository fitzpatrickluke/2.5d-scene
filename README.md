# 2.5d-test

*************************************************************************************
Video week2:
Video week1:
https://drive.google.com/file/d/15TaiStUJfceNYtZCc51U6uIk9-BG3bvn/view?usp=sharing

*************************************************************************************
For my final project I decided to try something that has been piquing my interest for quite some time now. That being 2.5d. Where 2d images/ sprites are placed within a 3d world.

I decided to make a confined small scene of a river and bridge in the middle of the forest. I also added some deer.

The bulk of prohject work was spent setting up the 3d world with lighting and shadows. Once that was complete I added many different post proccessing effects. These inculded: depth of field, bloom, higher contrast ande exposure, water movement via noise, god rays, and some color grading.

For my environment I was used the GameMaker platform. I use it a lot for hobby projects. Despite the program not being typically used for 3d, I chose this application due to my familiarity and hopefully my creation can be used in personal projects going forward.
The engine is a bit similar to how p5js functions in the sense that most of the code happens in a setup/ create event and a draw event. As such, translating my skills from class was pretty seemless.

Going into this I did not realize how many new graphics topics I would have to learn. I think something like Unity or Unreal would have been a better engine ha ha. But I stuck with what I'm comfortable with and my coding skills definitly grew a lot. I learned a lot more on the technical side of graphics that I don't think I would have learned if I went with the typical 3d engine. However, previous weekly assignments slowly got me comfortable with all the new coding problems and techniques I had to learn. I definitly fell if I tried making this project a few months back I would have become overwhelmed and quit.

This also is just a bit more low level then I'm used to working with. I've been using a lot of shaders. But another big thing was learning how 3d shapes are made. I physically sketched out vertices on paper and how they would form cubes. So the 3d shapes are all made via code, line by line. However, then when I got to the point of importing .obj files I found online, I had a stronger understanding of what was going on in the backend.

As of 12/1/2025 the project is nearly complete. The last thing I want to try out is updating the shadows, right now they are just all rectangles. I want the shadows to be more tree shapes, or more player shapes, etc. I think to achieve this I'll have to change what I draw on the shadow object, have a tree 3d model instead of a flat wall. But then keep the flat wall shape for the surface where I draw all the sprites.
Also most of the code I didn't write but more so found online and took some time understanding how it worked.

I'd say if you wanted to take a look at the code, the bulk of its is in the objects folder in obj_camera. Most of the shaders is code I found online.
*************************************************************************************
ASSET SOURCES
SPRITES:
Player: Me
Trees: https://karsiori.itch.io/spruce-tree-pack-pixel-art-animated
Bushes: https://karsiori.itch.io/free-pixel-art-bush-pack
Flowers: https://karsiori.itch.io/free-pixel-art-flower-pack
Deer: https://lyaseek.itch.io/miniffanimals
3D OBJECTS:
Bridge: https://sketchfab.com/3d-models/bridge-7d3d65090eb945e2996c23ac98adec70
SOUNDS:
River: https://freesound.org/people/Akacie/sounds/73716/
Forest: https://freesound.org/people/klankbeeld/sounds/577488/

