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




instr 26

endin

instr 25
 event_i "i", 24, 1.0, 1.0e-2
endin

instr 24
 turnoff2 23, 0.0, 0.0
 turnoff2 22, 0.0, 0.0
 turnoff2 21, 0.0, 0.0
 turnoff2 20, 0.0, 0.0
 turnoff2 19, 0.0, 0.0
 turnoff2 18, 0.0, 0.0
 exitnow 
endin

instr 23
arl0 init 0.0
arl1 init 0.0
ar0, ar1 subinstr 20
ar2, ar3 subinstr 22
ar4 = (ar0 + ar2)
ir10 = 1.0
ar0 upsamp k(ir10)
ir11 = 0.0
ir12 = 90.0
ir13 = 100.0
ar2 compress ar4, ar0, ir11, ir12, ir12, ir13, ir11, ir11, 0.0
ar4 = (ar2 * 0.8)
arl0 = ar4
ar2 = (ar1 + ar1)
ar1 compress ar2, ar0, ir11, ir12, ir12, ir13, ir11, ir11, 0.0
ar0 = (ar1 * 0.8)
arl1 = ar0
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 22
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 1.0, ir5, ir1
ir9 = 8.05
ir10 = cpspch(ir9)
 event_i "i", 21, 0.0, 1.0, 0.4, ir10, ir5
krl0 = 2.0
kr0 = krl0
S17 sprintf "alive_%d", ir5
 chnset kr0, S17
krl0 = 2.0
kr0 = krl0
S24 sprintf "alive_%d", ir1
 chnset kr0, S24
S27 sprintf "p1_%d", ir1
ar0 chnget S27
S30 sprintf "p2_%d", ir1
ar1 chnget S30
 chnclear S27
 chnclear S30
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
endin

instr 21
ir1 = p4
kr0 = (3.5 + p4)
kr1 = (0.5 * p4)
kr2 = (kr1 / 4.0)
kr3 = (kr2 * -9.000000000000001e-2)
kr4 = (kr2 * 0.11)
kr5 rspline ir1, kr0, kr3, kr4
kr3 = (kr2 * -8.0e-2)
kr4 = (kr2 * 0.12000000000000001)
kr2 rspline ir1, kr0, kr3, kr4
arl0 init 0.0
ir15 = (p4 * 0.3)
ir16 = (5.0e-2 + ir15)
kr0 linsegr 1.0, 1.0, 1.0, ir16, 0.0
ar0 upsamp kr0
ar1 madsr 1.0e-2, 1.0, 0.5, 0.5
ar2 = (0.5 * ar1)
ir20 = 1.0
ir21 = p5
ir22 = 3.0
kr0 oscil3 ir20, kr1, 2
kr3 = (0.5 * kr0)
kr0 = (0.5 + kr3)
kr3 = (kr5 * kr0)
ar1 foscili ir20, ir21, ir20, ir22, kr3, 2
kr0 = (kr1 + 0.2)
kr3 oscil3 ir20, kr0, 2
kr0 = (0.5 * kr3)
kr3 = (0.5 + kr0)
kr0 = (kr2 * kr3)
ar3 foscili ir20, ir21, ir22, ir20, kr0, 2
ar4 = (ar1 + ar3)
ir35 = 7.0
kr0 = (kr1 - 0.15)
kr2 oscil3 ir20, kr0, 2
kr0 = (0.5 * kr2)
kr2 = (0.5 + kr0)
kr0 = (kr5 * kr2)
ar1 foscili ir20, ir21, ir20, ir35, kr0, 2
ar3 = (ar4 + ar1)
ar1 = (ar3 / 3.0)
kr0 = (2.0 * p5)
kr2 = (1000.0 + kr0)
kr0 = (500.0 * p4)
kr3 = (kr2 + kr0)
ir48 = 0.1
kr0 = (2.0 * kr1)
ar3 lpf18 ar1, kr3, ir48, kr0
ar1 lpf18 ar3, kr3, ir48, kr0
ar3 = (p4 * ar1)
ar1 = (ar2 * ar3)
ar2 = (ar0 * ar1)
arl0 = ar2
ar0 = arl0
S59 sprintf "p1_%d", p6
 chnmix ar0, S59
arl1 init 0.0
arl1 = ar2
ar0 = arl1
S68 sprintf "p2_%d", p6
 chnmix ar0, S68
S71 sprintf "alive_%d", p6
kr0 chnget S71
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S71
endin

instr 20
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 1.0, ir5, ir1
ir9 = 8.1
ir10 = cpspch(ir9)
 event_i "i", 18, 0.0, 1.0, 0.5, ir10, ir5
krl0 = 2.0
kr0 = krl0
S17 sprintf "alive_%d", ir5
 chnset kr0, S17
krl0 = 2.0
kr0 = krl0
S24 sprintf "alive_%d", ir1
 chnset kr0, S24
S27 sprintf "p1_%d", ir1
ar0 chnget S27
S30 sprintf "p2_%d", ir1
ar1 chnget S30
 chnclear S27
 chnclear S30
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
endin

instr 19
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
arl0 init 0.0
ar2 = (0.65 * ar0)
ir14 = 0.8
ir15 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir14, ir15
ar5 = (ar0 + ar3)
ar0 = (0.35 * ar5)
ar3 = (ar2 + ar0)
arl0 = ar3
ar0 = arl0
S25 sprintf "p1_%d", p5
 chnmix ar0, S25
arl1 init 0.0
ar0 = (0.65 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.35 * ar2)
ar2 = (ar0 + ar1)
arl1 = ar2
ar0 = arl1
S39 sprintf "p2_%d", p5
 chnmix ar0, S39
endin

instr 18
ir1 = p4
kr0 = (3.5 + p4)
kr1 = (1.7 * p4)
kr2 = (kr1 / 4.0)
kr3 = (kr2 * -9.000000000000001e-2)
kr4 = (kr2 * 0.11)
kr5 rspline ir1, kr0, kr3, kr4
kr3 = (kr2 * -8.0e-2)
kr4 = (kr2 * 0.12000000000000001)
kr2 rspline ir1, kr0, kr3, kr4
arl0 init 0.0
ir15 = (p4 * 0.3)
ir16 = (5.0e-2 + ir15)
kr0 linsegr 1.0, 1.0, 1.0, ir16, 0.0
ar0 upsamp kr0
ar1 madsr 1.0e-2, 1.0, 0.5, 0.5
ar2 = (0.5 * ar1)
ir20 = 1.0
ir21 = p5
ir22 = 3.0
kr0 oscil3 ir20, kr1, 2
kr3 = (0.5 * kr0)
kr0 = (0.5 + kr3)
kr3 = (kr5 * kr0)
ar1 foscili ir20, ir21, ir20, ir22, kr3, 2
kr0 = (kr1 + 0.2)
kr3 oscil3 ir20, kr0, 2
kr0 = (0.5 * kr3)
kr3 = (0.5 + kr0)
kr0 = (kr2 * kr3)
ar3 foscili ir20, ir21, ir22, ir20, kr0, 2
ar4 = (ar1 + ar3)
ir35 = 7.0
kr0 = (kr1 - 0.15)
kr1 oscil3 ir20, kr0, 2
kr0 = (0.5 * kr1)
kr1 = (0.5 + kr0)
kr0 = (kr5 * kr1)
ar1 foscili ir20, ir21, ir20, ir35, kr0, 2
ar3 = (ar4 + ar1)
ar1 = (ar3 / 3.0)
kr0 = (2.0 * p5)
kr1 = (1000.0 + kr0)
kr0 = (500.0 * p4)
kr2 = (kr1 + kr0)
ir48 = 0.1
kr0 = (0.5 * p4)
kr1 = (2.0 * kr0)
ar3 lpf18 ar1, kr2, ir48, kr1
ar1 lpf18 ar3, kr2, ir48, kr1
ar3 = (p4 * ar1)
ar1 = (ar2 * ar3)
ar2 = (ar0 * ar1)
arl0 = ar2
ar0 = arl0
S60 sprintf "p1_%d", p6
 chnmix ar0, S60
arl1 init 0.0
arl1 = ar2
ar0 = arl1
S69 sprintf "p2_%d", p6
 chnmix ar0, S69
S72 sprintf "alive_%d", p6
kr0 chnget S72
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S72
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0

f0 604800.0

i 26 0.0 -1.0 
i 25 0.0 -1.0 
i 23 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>