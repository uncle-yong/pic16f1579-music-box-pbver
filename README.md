# pic16f1572-music-box-pbasic

This is a proof of concept project for the case study in Hackaday.io: https://hackaday.io/project/28016-case-study-a-polyphonic-pic18f-music-box and from this link also: http://www.protonbasic.co.uk/content.php/849-Making-Polyphonic-Music-with-PICBASIC-and-the-Proton-Compiler

A very early prototype of this is at the page: https://github.com/uncle-yong/PIC12F1572-Music-Box

Video of the project: https://youtu.be/aWSiTR5RM2M

It uses a PIC16F1579 running at 32MHz and three independent PWM as square wave generators and each of them is with a decay generator. The song is converted from midi and parsed by using Len Shustek's miditones. https://github.com/LenShustek/miditones

The related schematic is at the hackaday.io page: https://hackaday.io/project/28016-case-study-a-polyphonic-pic18f-music-box/log/71114-man-some-roadblocks-and-it-works

This is using MikroC for PIC and compiles within the demo limit.

Issues:
- Higher note frequencies may be off.
- Do not turn the LM386 volume to maximum. It doesn't sound good anymore and you won't be able to hear the decays.
- Finding midi files with only three voices is a tough mission. Miditones had to drop the extra voices in the midi parser if three         channels are only used.

Notes: 
- I have misplaced the link for some of the really nice sounding midi Christmas tunes. When I found them, I'm placing them here for references.
