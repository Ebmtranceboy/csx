<CsoundSynthesizer>

<CsOptions>

--output=dac --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 25

endin

instr 24
 event_i "i", 23, 604800.0, 1.0e-2
endin

instr 23
 turnoff2 22, 0.0, 0.0
 turnoff2 21, 0.0, 0.0
 turnoff2 20, 0.0, 0.0
 turnoff2 19, 0.0, 0.0
 turnoff2 18, 0.0, 0.0
 exitnow 
endin

instr 22
 seed 2.0151213e7
ir3 = -1.0
ir4 = 1.0
ar0 upsamp k(ir4)
ar1 random ir3, ir4
ar2 random ir3, ir4
 seed 2.0151013e7
ar3 random ir3, ir4
ar4 random ir3, ir4
arl0 init 0.0
arl1 init 0.0
ar5, ar6 subinstr 19
ar7, ar8 subinstr 21
ar9 = (ar5 + ar7)
ar5 = (0.125 * ar9)
ir25 = 0.0
ir26 = 89.0
ir27 = 100.0
ar7 compress ar5, ar0, ir25, ir26, ir26, ir27, ir25, ir25, 0.0
ar5 = (ar7 * 0.8)
arl0 = ar5
ar5 = (ar6 + ar8)
ar6 = (0.125 * ar5)
ar5 compress ar6, ar0, ir25, ir26, ir26, ir27, ir25, ir25, 0.0
ar0 = (ar5 * 0.8)
arl1 = ar0
ar0 = arl0
ar5 = arl1
 outs ar0, ar5
endin

instr 21
krl0 init 10.0
ir3 FreePort 
ir5 = 1.0
kr0 metro ir5
if (kr0 == 1.0) then
    krl0 = 2.0
    ir11 = 20
    ir12 = 0.0
    ir13 = 1.0
     event "i", ir11, ir12, ir13, ir3
endif
S18 sprintf "p1_%d", ir3
ar0 chnget S18
S21 sprintf "p2_%d", ir3
ar1 chnget S21
 chnclear S18
 chnclear S21
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
kr0 = krl0
S44 sprintf "alive_%d", ir3
 chnset kr0, S44
endin

instr 20
arl0 init 0.0
ir3 = -1.0
ir4 = 1.0
ar0 random ir3, ir4
kr0 expseg 1.0, 2.0e-2, 6.0e-2, 2.0e-2, 1.0e-2, 0.12, 1.0e-5, 0.12, 1.0e-5, 1.0, 1.0e-5
ar1 upsamp kr0
ar2 = (ar0 * ar1)
ar0 = (1.0 - ar1)
kr0 expseg 1.0e-5, 5.0e-3, 1.0, 0.16, 1.0, 0.5, 1.0e-5, 0.0, 1.0e-5, 1.0, 1.0e-5
ar3 upsamp kr0
ar4 = (ar0 * ar3)
kr0 expseg 600.0, 2.0e-2, 112.0, 0.14, 50.0, 0.11, 20.0, 0.0, 20.0, 1.0, 20.0
ar0 oscili ar4, kr0, 2
ar3 = (ar2 + ar0)
arl0 = ar3
ar2 = arl0
S18 sprintf "p1_%d", p4
 chnmix ar2, S18
arl1 init 0.0
ar2 random ir3, ir4
ar3 = (ar2 * ar1)
ar1 = (ar3 + ar0)
arl1 = ar1
ar0 = arl1
S30 sprintf "p2_%d", p4
 chnmix ar0, S30
S33 sprintf "alive_%d", p4
kr0 chnget S33
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S33
endin

instr 19
krl0 init 10.0
ir3 FreePort 
ir5 = 0.5
kr0 metro ir5
if (kr0 == 1.0) then
    krl0 = 2.0
    ir11 = 18
    ir12 = 0.0
    ir13 = 2.0
     event "i", ir11, ir12, ir13, ir3
endif
S18 sprintf "p1_%d", ir3
ar0 chnget S18
S21 sprintf "p2_%d", ir3
ar1 chnget S21
 chnclear S18
 chnclear S21
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
kr0 = krl0
S44 sprintf "alive_%d", ir3
 chnset kr0, S44
endin

instr 18
arl0 init 0.0
kr0 expseg 1.0, 5.0e-2, 1.0, 0.9, 1.0e-4, 0.0, 1.0e-4, 1.0, 1.0e-4
ar0 upsamp kr0
ir4 = -1.0
ir5 = 1.0
ar1 random ir4, ir5
ir7 = 6000.0
ar2 tone ar1, ir7
kr0 expseg 1.0, 7.0e-3, 1.0, 1.0e-2, 0.2, 5.0e-2, 0.2, 1.0e-2, 0.5, 0.5, 0.5, 1.0, 0.5
ar1 upsamp kr0
kr0 expseg 1.0e-5, 5.0e-3, 1.0e-5, 1.0e-2, 1.0, 5.0e-2, 1.0, 1.0e-2, 1.0e-5, 0.0, 1.0e-5, 1.0, 1.0e-5
ar3 upsamp kr0
ir11 = 126.0
ar4 oscil3 ir5, ir11, 2
ar5 = (0.15 * ar4)
ar4 = (ar3 * ar5)
ar3 = (ar1 + ar4)
ar1 = (ar2 * ar3)
kr0 expseg 1.0e-2, 1.0e-3, 0.4, 5.0e-2, 0.4, 0.12, 1.0e-3, 0.0, 1.0e-3, 1.0, 1.0e-3
ar2 upsamp kr0
ar4 = (1.0 - ar3)
ar5 = (ar2 * ar4)
ir20 = 84.0
ar2 oscili ar5, ir20, 4
ar4 = (ar1 + ar2)
ar1 = (ar0 * ar4)
arl0 = ar1
ar1 = arl0
S28 sprintf "p1_%d", p4
 chnmix ar1, S28
arl1 init 0.0
ar1 random ir4, ir5
ar4 tone ar1, ir7
ar1 = (ar4 * ar3)
ar3 = (ar1 + ar2)
ar1 = (ar0 * ar3)
arl1 = ar1
ar0 = arl1
S42 sprintf "p2_%d", p4
 chnmix ar0, S42
S45 sprintf "alive_%d", p4
kr0 chnget S45
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S45
endin

</CsInstruments>

<CsScore>

f4 0 2048 7  0.0 256.0 -1.0 512.0 1.0 256.0 0.0
f2 0 8192 10  1.0

f0 604800.0

i 25 0.0 -1.0 
i 24 0.0 -1.0 
i 22 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>