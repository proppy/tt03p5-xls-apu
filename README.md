![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg)

# XLS APU Pulse Oscillator

Attempt at recreating the square oscillator from the NES [APU](https://www.nesdev.org/wiki/APU_Pulse) with [XLS](https://google.github.io/xls/) for [TinyTapeout 3.5](https://github.com/TinyTapeout/tinytapeout-03p5).

<a href="https://colab.research.google.com/gist/proppy/d8d6b17e2ca595696f70f8500dbb9112/xls_audio_playground.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a> for building and simulating the design.

*Note: Currently just implement the base oscillator frequency and duty cycle control, the other 4 oscillators are each tuned on different octave.*

## Simulation

![wave](wave.png)

## Chip preview

<img src="https://camo.githubusercontent.com/bf7e87d9693de7885eaedd1f0b10738645530ba6d64998c69d3f46909e634c97/68747470733a2f2f70726f7070792e6769746875622e696f2f7474303370352d786c732d6170752f6764735f72656e6465722e706e67" alt="png"/>

[3D viewer](https://gds-viewer.tinytapeout.com/?model=https://proppy.github.io/tt03p5-xls-apu/tinytapeout.gds.gltf)

## Resources

* [XLS: Accelerated HW Synthesis](https://google.github.io/xls/)
* [APU Pulse](https://www.nesdev.org/wiki/APU_Pulse)
* [FAQ](https://tinytapeout.com/faq/)
* [Digital design lessons](https://tinytapeout.com/digital_design/)
* [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
* [Join the community](https://discord.gg/rPK2nSjxy8)
