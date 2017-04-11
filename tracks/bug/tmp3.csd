<CsoundSynthesizer>

<CsOptions>

--output=dac --midi-device=a --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
 massign 0, 25
gargg1 init 0.0
gargg0 init 0.0
girgfree_vco = 105
ir17 = girgfree_vco
ir19 vco2init 1, ir17
girgfree_vco = ir19
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 28

endin

instr 27
 event_i "i", 26, 240.0, 1.0e-2
endin

instr 26
 turnoff2 25, 0.0, 0.0
 turnoff2 24, 0.0, 0.0
 turnoff2 23, 0.0, 0.0
 turnoff2 22, 0.0, 0.0
 turnoff2 21, 0.0, 0.0
 turnoff2 20, 0.0, 0.0
 turnoff2 19, 0.0, 0.0
 turnoff2 18, 0.0, 0.0
 exitnow 
endin

instr 25
ir1 = 1.0
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
ir12 = rnd(ir1)
ir14 = 0.0
ar0 noise ir1, ir14
ar1 = gargg0
ar2 = gargg1
ir21 active p1
ar3 upsamp k(ir21)
ar4 = sqrt(ar3)
ar3 = (1.0 / ar4)
if (ir21 < 2.0) then
    ar4 = 1.0
else
    ar4 = ar3
endif
kr0 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar3 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.15, 0.0
ar5 upsamp kr0
ar6 = (ar3 * ar5)
ir28 cpsmidi 
ir29 = 50.0
kr0 = cent(ir29)
kr1 = (kr0 * -1.0)
kr2 = (ir28 + kr1)
kr3 vco2ft kr2, 0
ar3 oscilikt ir1, kr2, kr3, ir2
kr2 vco2ft ir28, 0
ar5 oscilikt ir1, ir28, kr2, ir4
ar7 = (ar3 + ar5)
kr2 = (kr0 * 1.0)
kr0 = (ir28 + kr2)
kr3 vco2ft kr0, 0
ar3 oscilikt ir1, kr0, kr3, ir6
ar5 = (ar7 + ar3)
ar3 = (ar5 / 3.0)
ir44 = 14.0
kr0 = cent(ir44)
kr3 = (ir28 * kr0)
kr0 = (kr3 + kr1)
kr1 vco2ft kr0, 0
ar5 oscilikt ir1, kr0, kr1, ir8
kr0 vco2ft kr3, 0
ar7 oscilikt ir1, kr3, kr0, ir10
ar8 = (ar5 + ar7)
kr0 = (kr3 + kr2)
kr1 vco2ft kr0, 0
ar5 oscilikt ir1, kr0, kr1, ir12
ar7 = (ar8 + ar5)
ar5 = (ar7 / 3.0)
ar7 = (ar3 + ar5)
ir59 = 400.0
ir60 = 0.1
ar3 bqrez ar0, ir59, ir60
ar0 = (0.2 * ar3)
ar3 = (ar7 + ar0)
ir64 = 18000.0
ir65 = 0.3
ar0 bqrez ar3, ir64, ir65, 3.0
ar3 bqrez ar0, ir64, ir65, 3.0
ir68 = 5500.0
ir69 = 0.12
ar0 moogvcf ar3, ir68, ir69
ar3 = (ar6 * ar0)
ir72 ampmidi 1.0
ar0 upsamp k(ir72)
ar5 = (ar3 * ar0)
ar0 = (ar4 * ar5)
ar3 = (ar1 + ar0)
gargg0 = ar3
ar1 = (ar2 + ar0)
gargg1 = ar1
endin

instr 24
ar0 = gargg0
ar1 = gargg1
gargg0 = 0.0
gargg1 = 0.0
ar2 delayr 1.2
ir11 = 1.0
ar3 upsamp k(ir11)
ir12 = 3.75
ar4 oscil3 ir11, ir12, 2
ar5 = (2.1000000000000003e-3 * ar4)
ar4 = (ar5 + 1.0e-2)
ar5 deltap3 ar4
 delayw ar0
ar6 delayr 1.2
ar7 deltap3 ar4
 delayw ar1
ar4 delayr 0.25
ir28 = 0.25
ar8 deltap3 ir28
ar9 = (0.75 * ar0)
ar10 ntrpol ar0, ar5, ir11
ar0 = (0.25 * ar10)
ar5 = (ar9 + ar0)
ar0 = (0.65 * ar8)
ar9 = (ar5 + ar0)
 delayw ar9
ar0 delayr 0.25
ar9 deltap3 ir28
ar10 = (0.75 * ar1)
ar11 ntrpol ar1, ar7, ir11
ar1 = (0.25 * ar11)
ar7 = (ar10 + ar1)
ar1 = (0.65 * ar9)
ar10 = (ar7 + ar1)
 delayw ar10
arl0 init 0.0
arl1 init 0.0
ar1 = (0.75 * ar5)
ar10 = (ar8 * 1.0)
ar8 = (ar5 + ar10)
ar5 = (0.25 * ar8)
ar8 = (ar1 + ar5)
ar1 = (0.75 * ar8)
ar5 = (0.75 * ar7)
ar10 = (ar9 * 1.0)
ar9 = (ar7 + ar10)
ar7 = (0.25 * ar9)
ar9 = (ar5 + ar7)
ir66 = 0.9
ir67 = 12000.0
ar5, ar7 reverbsc ar8, ar9, ir66, ir67
ar10 = (ar8 + ar5)
ar5 = (0.25 * ar10)
ar8 = (ar1 + ar5)
ar1, ar5 subinstr 20
ar10 = (ar8 + ar1)
ar8 = (ar10 + ar1)
ar1, ar10 subinstr 23
ar11 = (ar8 + ar1)
ir80 = 0.0
ir81 = 90.0
ir82 = 100.0
ar1 compress ar11, ar3, ir80, ir81, ir81, ir82, ir80, ir80, 0.0
ar8 = (ar1 * 0.8)
arl0 = ar8
ar1 = (0.75 * ar9)
ar8 = (ar9 + ar7)
ar7 = (0.25 * ar8)
ar8 = (ar1 + ar7)
ar1 = (ar8 + ar10)
ar7 = (ar1 + ar5)
ar1 = (ar7 + ar10)
ar5 compress ar1, ar3, ir80, ir81, ir81, ir82, ir80, ir80, 0.0
ar1 = (ar5 * 0.8)
arl1 = ar1
ar1 = arl0
ar3 = arl1
 outs ar1, ar3
endin

instr 23
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 22, 0.0, 24.0, ir5, ir1
ir9 = 7.1
ir10 = cpspch(ir9)
 event_i "i", 21, 0.0, 1.5, 8.0e-2, ir10, ir5
ir13 = 8.03
ir14 = cpspch(ir13)
 event_i "i", 21, 1.5, 1.5, 8.0e-2, ir14, ir5
ir17 = 8.05
ir18 = cpspch(ir17)
 event_i "i", 21, 3.0, 3.0, 8.0e-2, ir18, ir5
ir21 = 8.04
ir22 = cpspch(ir21)
 event_i "i", 21, 6.0, 1.5, 8.0e-2, ir22, ir5
ir25 = 8.0
ir26 = cpspch(ir25)
 event_i "i", 21, 7.5, 1.5, 8.0e-2, ir26, ir5
 event_i "i", 21, 9.0, 3.0, 8.0e-2, ir18, ir5
 event_i "i", 21, 12.0, 1.5, 8.0e-2, ir10, ir5
ir33 = 8.01
ir34 = cpspch(ir33)
 event_i "i", 21, 13.5, 1.5, 8.0e-2, ir34, ir5
 event_i "i", 21, 15.0, 3.0, 8.0e-2, ir18, ir5
 event_i "i", 21, 18.0, 1.5, 8.0e-2, ir22, ir5
 event_i "i", 21, 19.5, 1.5, 8.0e-2, ir26, ir5
 event_i "i", 21, 21.0, 3.0, 8.0e-2, ir18, ir5
ir45 = 8.1
ir46 = cpspch(ir45)
 event_i "i", 21, 0.0, 3.0, 8.0e-2, ir46, ir5
ir49 = 8.08
ir50 = cpspch(ir49)
 event_i "i", 21, 3.0, 3.0, 8.0e-2, ir50, ir5
ir53 = 8.07
ir54 = cpspch(ir53)
 event_i "i", 21, 6.0, 3.0, 8.0e-2, ir54, ir5
 event_i "i", 21, 9.0, 3.0, 8.0e-2, ir50, ir5
 event_i "i", 21, 12.0, 6.0, 8.0e-2, ir46, ir5
 event_i "i", 21, 18.0, 3.0, 8.0e-2, ir54, ir5
 event_i "i", 21, 21.0, 3.0, 8.0e-2, ir50, ir5
krl0 = 2.0
kr0 = krl0
S69 sprintf "alive_%d", ir5
 chnset kr0, S69
ir72 FreePort 
 event_i "i", 22, 24.0, 24.0, ir72, ir1
 event_i "i", 21, 24.0, 1.5, 8.0e-2, ir10, ir72
 event_i "i", 21, 25.5, 1.5, 8.0e-2, ir14, ir72
 event_i "i", 21, 27.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 21, 30.0, 1.5, 8.0e-2, ir22, ir72
 event_i "i", 21, 31.5, 1.5, 8.0e-2, ir26, ir72
 event_i "i", 21, 33.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 21, 36.0, 1.5, 8.0e-2, ir10, ir72
 event_i "i", 21, 37.5, 1.5, 8.0e-2, ir34, ir72
 event_i "i", 21, 39.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 21, 42.0, 1.5, 8.0e-2, ir22, ir72
 event_i "i", 21, 43.5, 1.5, 8.0e-2, ir26, ir72
 event_i "i", 21, 45.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 21, 24.0, 3.0, 8.0e-2, ir46, ir72
 event_i "i", 21, 27.0, 3.0, 8.0e-2, ir50, ir72
 event_i "i", 21, 30.0, 3.0, 8.0e-2, ir54, ir72
 event_i "i", 21, 33.0, 3.0, 8.0e-2, ir50, ir72
 event_i "i", 21, 36.0, 6.0, 8.0e-2, ir46, ir72
 event_i "i", 21, 42.0, 3.0, 8.0e-2, ir54, ir72
 event_i "i", 21, 45.0, 3.0, 8.0e-2, ir50, ir72
krl0 = 2.0
kr0 = krl0
S118 sprintf "alive_%d", ir72
 chnset kr0, S118
ir121 FreePort 
 event_i "i", 22, 48.0, 24.0, ir121, ir1
 event_i "i", 21, 48.0, 1.5, 8.0e-2, ir10, ir121
 event_i "i", 21, 49.5, 1.5, 8.0e-2, ir14, ir121
 event_i "i", 21, 51.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 21, 54.0, 1.5, 8.0e-2, ir22, ir121
 event_i "i", 21, 55.5, 1.5, 8.0e-2, ir26, ir121
 event_i "i", 21, 57.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 21, 60.0, 1.5, 8.0e-2, ir10, ir121
 event_i "i", 21, 61.5, 1.5, 8.0e-2, ir34, ir121
 event_i "i", 21, 63.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 21, 66.0, 1.5, 8.0e-2, ir22, ir121
 event_i "i", 21, 67.5, 1.5, 8.0e-2, ir26, ir121
 event_i "i", 21, 69.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 21, 48.0, 3.0, 8.0e-2, ir46, ir121
 event_i "i", 21, 51.0, 3.0, 8.0e-2, ir50, ir121
 event_i "i", 21, 54.0, 3.0, 8.0e-2, ir54, ir121
 event_i "i", 21, 57.0, 3.0, 8.0e-2, ir50, ir121
 event_i "i", 21, 60.0, 6.0, 8.0e-2, ir46, ir121
 event_i "i", 21, 66.0, 3.0, 8.0e-2, ir54, ir121
 event_i "i", 21, 69.0, 3.0, 8.0e-2, ir50, ir121
krl0 = 2.0
kr0 = krl0
S167 sprintf "alive_%d", ir121
 chnset kr0, S167
ir170 FreePort 
 event_i "i", 22, 72.0, 24.0, ir170, ir1
 event_i "i", 21, 72.0, 1.5, 8.0e-2, ir10, ir170
 event_i "i", 21, 73.5, 1.5, 8.0e-2, ir14, ir170
 event_i "i", 21, 75.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 21, 78.0, 1.5, 8.0e-2, ir22, ir170
 event_i "i", 21, 79.5, 1.5, 8.0e-2, ir26, ir170
 event_i "i", 21, 81.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 21, 84.0, 1.5, 8.0e-2, ir10, ir170
 event_i "i", 21, 85.5, 1.5, 8.0e-2, ir34, ir170
 event_i "i", 21, 87.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 21, 90.0, 1.5, 8.0e-2, ir22, ir170
 event_i "i", 21, 91.5, 1.5, 8.0e-2, ir26, ir170
 event_i "i", 21, 93.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 21, 72.0, 3.0, 8.0e-2, ir46, ir170
 event_i "i", 21, 75.0, 3.0, 8.0e-2, ir50, ir170
 event_i "i", 21, 78.0, 3.0, 8.0e-2, ir54, ir170
 event_i "i", 21, 81.0, 3.0, 8.0e-2, ir50, ir170
 event_i "i", 21, 84.0, 6.0, 8.0e-2, ir46, ir170
 event_i "i", 21, 90.0, 3.0, 8.0e-2, ir54, ir170
 event_i "i", 21, 93.0, 3.0, 8.0e-2, ir50, ir170
krl0 = 2.0
kr0 = krl0
S216 sprintf "alive_%d", ir170
 chnset kr0, S216
ir219 FreePort 
 event_i "i", 22, 96.0, 24.0, ir219, ir1
 event_i "i", 21, 96.0, 1.5, 8.0e-2, ir10, ir219
 event_i "i", 21, 97.5, 1.5, 8.0e-2, ir14, ir219
 event_i "i", 21, 99.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 21, 102.0, 1.5, 8.0e-2, ir22, ir219
 event_i "i", 21, 103.5, 1.5, 8.0e-2, ir26, ir219
 event_i "i", 21, 105.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 21, 108.0, 1.5, 8.0e-2, ir10, ir219
 event_i "i", 21, 109.5, 1.5, 8.0e-2, ir34, ir219
 event_i "i", 21, 111.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 21, 114.0, 1.5, 8.0e-2, ir22, ir219
 event_i "i", 21, 115.5, 1.5, 8.0e-2, ir26, ir219
 event_i "i", 21, 117.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 21, 96.0, 3.0, 8.0e-2, ir46, ir219
 event_i "i", 21, 99.0, 3.0, 8.0e-2, ir50, ir219
 event_i "i", 21, 102.0, 3.0, 8.0e-2, ir54, ir219
 event_i "i", 21, 105.0, 3.0, 8.0e-2, ir50, ir219
 event_i "i", 21, 108.0, 6.0, 8.0e-2, ir46, ir219
 event_i "i", 21, 114.0, 3.0, 8.0e-2, ir54, ir219
 event_i "i", 21, 117.0, 3.0, 8.0e-2, ir50, ir219
krl0 = 2.0
kr0 = krl0
S265 sprintf "alive_%d", ir219
 chnset kr0, S265
ir268 FreePort 
 event_i "i", 22, 120.0, 24.0, ir268, ir1
 event_i "i", 21, 120.0, 1.5, 8.0e-2, ir10, ir268
 event_i "i", 21, 121.5, 1.5, 8.0e-2, ir14, ir268
 event_i "i", 21, 123.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 21, 126.0, 1.5, 8.0e-2, ir22, ir268
 event_i "i", 21, 127.5, 1.5, 8.0e-2, ir26, ir268
 event_i "i", 21, 129.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 21, 132.0, 1.5, 8.0e-2, ir10, ir268
 event_i "i", 21, 133.5, 1.5, 8.0e-2, ir34, ir268
 event_i "i", 21, 135.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 21, 138.0, 1.5, 8.0e-2, ir22, ir268
 event_i "i", 21, 139.5, 1.5, 8.0e-2, ir26, ir268
 event_i "i", 21, 141.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 21, 120.0, 3.0, 8.0e-2, ir46, ir268
 event_i "i", 21, 123.0, 3.0, 8.0e-2, ir50, ir268
 event_i "i", 21, 126.0, 3.0, 8.0e-2, ir54, ir268
 event_i "i", 21, 129.0, 3.0, 8.0e-2, ir50, ir268
 event_i "i", 21, 132.0, 6.0, 8.0e-2, ir46, ir268
 event_i "i", 21, 138.0, 3.0, 8.0e-2, ir54, ir268
 event_i "i", 21, 141.0, 3.0, 8.0e-2, ir50, ir268
krl0 = 2.0
kr0 = krl0
S314 sprintf "alive_%d", ir268
 chnset kr0, S314
ir317 FreePort 
 event_i "i", 22, 144.0, 24.0, ir317, ir1
 event_i "i", 21, 144.0, 1.5, 8.0e-2, ir10, ir317
 event_i "i", 21, 145.5, 1.5, 8.0e-2, ir14, ir317
 event_i "i", 21, 147.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 21, 150.0, 1.5, 8.0e-2, ir22, ir317
 event_i "i", 21, 151.5, 1.5, 8.0e-2, ir26, ir317
 event_i "i", 21, 153.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 21, 156.0, 1.5, 8.0e-2, ir10, ir317
 event_i "i", 21, 157.5, 1.5, 8.0e-2, ir34, ir317
 event_i "i", 21, 159.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 21, 162.0, 1.5, 8.0e-2, ir22, ir317
 event_i "i", 21, 163.5, 1.5, 8.0e-2, ir26, ir317
 event_i "i", 21, 165.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 21, 144.0, 3.0, 8.0e-2, ir46, ir317
 event_i "i", 21, 147.0, 3.0, 8.0e-2, ir50, ir317
 event_i "i", 21, 150.0, 3.0, 8.0e-2, ir54, ir317
 event_i "i", 21, 153.0, 3.0, 8.0e-2, ir50, ir317
 event_i "i", 21, 156.0, 6.0, 8.0e-2, ir46, ir317
 event_i "i", 21, 162.0, 3.0, 8.0e-2, ir54, ir317
 event_i "i", 21, 165.0, 3.0, 8.0e-2, ir50, ir317
krl0 = 2.0
kr0 = krl0
S363 sprintf "alive_%d", ir317
 chnset kr0, S363
ir366 FreePort 
 event_i "i", 22, 168.0, 24.0, ir366, ir1
 event_i "i", 21, 168.0, 1.5, 8.0e-2, ir10, ir366
 event_i "i", 21, 169.5, 1.5, 8.0e-2, ir14, ir366
 event_i "i", 21, 171.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 21, 174.0, 1.5, 8.0e-2, ir22, ir366
 event_i "i", 21, 175.5, 1.5, 8.0e-2, ir26, ir366
 event_i "i", 21, 177.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 21, 180.0, 1.5, 8.0e-2, ir10, ir366
 event_i "i", 21, 181.5, 1.5, 8.0e-2, ir34, ir366
 event_i "i", 21, 183.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 21, 186.0, 1.5, 8.0e-2, ir22, ir366
 event_i "i", 21, 187.5, 1.5, 8.0e-2, ir26, ir366
 event_i "i", 21, 189.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 21, 168.0, 3.0, 8.0e-2, ir46, ir366
 event_i "i", 21, 171.0, 3.0, 8.0e-2, ir50, ir366
 event_i "i", 21, 174.0, 3.0, 8.0e-2, ir54, ir366
 event_i "i", 21, 177.0, 3.0, 8.0e-2, ir50, ir366
 event_i "i", 21, 180.0, 6.0, 8.0e-2, ir46, ir366
 event_i "i", 21, 186.0, 3.0, 8.0e-2, ir54, ir366
 event_i "i", 21, 189.0, 3.0, 8.0e-2, ir50, ir366
krl0 = 2.0
kr0 = krl0
S412 sprintf "alive_%d", ir366
 chnset kr0, S412
ir415 FreePort 
 event_i "i", 22, 192.0, 24.0, ir415, ir1
 event_i "i", 21, 192.0, 1.5, 8.0e-2, ir10, ir415
 event_i "i", 21, 193.5, 1.5, 8.0e-2, ir14, ir415
 event_i "i", 21, 195.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 21, 198.0, 1.5, 8.0e-2, ir22, ir415
 event_i "i", 21, 199.5, 1.5, 8.0e-2, ir26, ir415
 event_i "i", 21, 201.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 21, 204.0, 1.5, 8.0e-2, ir10, ir415
 event_i "i", 21, 205.5, 1.5, 8.0e-2, ir34, ir415
 event_i "i", 21, 207.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 21, 210.0, 1.5, 8.0e-2, ir22, ir415
 event_i "i", 21, 211.5, 1.5, 8.0e-2, ir26, ir415
 event_i "i", 21, 213.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 21, 192.0, 3.0, 8.0e-2, ir46, ir415
 event_i "i", 21, 195.0, 3.0, 8.0e-2, ir50, ir415
 event_i "i", 21, 198.0, 3.0, 8.0e-2, ir54, ir415
 event_i "i", 21, 201.0, 3.0, 8.0e-2, ir50, ir415
 event_i "i", 21, 204.0, 6.0, 8.0e-2, ir46, ir415
 event_i "i", 21, 210.0, 3.0, 8.0e-2, ir54, ir415
 event_i "i", 21, 213.0, 3.0, 8.0e-2, ir50, ir415
krl0 = 2.0
kr0 = krl0
S461 sprintf "alive_%d", ir415
 chnset kr0, S461
ir464 FreePort 
 event_i "i", 22, 216.0, 24.0, ir464, ir1
 event_i "i", 21, 216.0, 1.5, 8.0e-2, ir10, ir464
 event_i "i", 21, 217.5, 1.5, 8.0e-2, ir14, ir464
 event_i "i", 21, 219.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 21, 222.0, 1.5, 8.0e-2, ir22, ir464
 event_i "i", 21, 223.5, 1.5, 8.0e-2, ir26, ir464
 event_i "i", 21, 225.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 21, 228.0, 1.5, 8.0e-2, ir10, ir464
 event_i "i", 21, 229.5, 1.5, 8.0e-2, ir34, ir464
 event_i "i", 21, 231.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 21, 234.0, 1.5, 8.0e-2, ir22, ir464
 event_i "i", 21, 235.5, 1.5, 8.0e-2, ir26, ir464
 event_i "i", 21, 237.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 21, 216.0, 3.0, 8.0e-2, ir46, ir464
 event_i "i", 21, 219.0, 3.0, 8.0e-2, ir50, ir464
 event_i "i", 21, 222.0, 3.0, 8.0e-2, ir54, ir464
 event_i "i", 21, 225.0, 3.0, 8.0e-2, ir50, ir464
 event_i "i", 21, 228.0, 6.0, 8.0e-2, ir46, ir464
 event_i "i", 21, 234.0, 3.0, 8.0e-2, ir54, ir464
 event_i "i", 21, 237.0, 3.0, 8.0e-2, ir50, ir464
krl0 = 2.0
kr0 = krl0
S510 sprintf "alive_%d", ir464
 chnset kr0, S510
krl0 = 20.0
kr0 = krl0
S517 sprintf "alive_%d", ir1
 chnset kr0, S517
S520 sprintf "p1_%d", ir1
ar0 chnget S520
S523 sprintf "p2_%d", ir1
ar1 chnget S523
 chnclear S520
 chnclear S523
arl1 init 0.0
arl2 init 0.0
arl1 = ar0
arl2 = ar1
ar0 = arl1
ar1 = arl2
 outs ar0, ar1
endin

instr 22
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
ar2 delayr 1.2
ir13 = 1.0
ir14 = 3.75
ar3 oscil3 ir13, ir14, 2
ar4 = (2.1000000000000003e-3 * ar3)
ar3 = (ar4 + 1.0e-2)
ar4 deltap3 ar3
 delayw ar0
ar5 delayr 1.2
ar6 deltap3 ar3
 delayw ar1
ar3 delayr 0.25
ir30 = 0.25
ar7 deltap3 ir30
ar8 = (0.75 * ar0)
ar9 ntrpol ar0, ar4, ir13
ar0 = (0.25 * ar9)
ar4 = (ar8 + ar0)
ar0 = (0.65 * ar7)
ar8 = (ar4 + ar0)
 delayw ar8
ar0 delayr 0.25
ar8 deltap3 ir30
ar9 = (0.75 * ar1)
ar10 ntrpol ar1, ar6, ir13
ar1 = (0.25 * ar10)
ar6 = (ar9 + ar1)
ar1 = (0.65 * ar8)
ar9 = (ar6 + ar1)
 delayw ar9
arl0 init 0.0
ar1 = (0.75 * ar4)
ar9 = (ar7 * 1.0)
ar7 = (ar4 + ar9)
ar4 = (0.25 * ar7)
ar7 = (ar1 + ar4)
ar1 = (0.75 * ar7)
ar4 = (0.75 * ar6)
ar9 = (ar8 * 1.0)
ar8 = (ar6 + ar9)
ar6 = (0.25 * ar8)
ar8 = (ar4 + ar6)
ir66 = 0.9
ir67 = 12000.0
ar4, ar6 reverbsc ar7, ar8, ir66, ir67
ar9 = (ar7 + ar4)
ar4 = (0.25 * ar9)
ar7 = (ar1 + ar4)
arl0 = ar7
ar1 = arl0
S77 sprintf "p1_%d", p5
 chnmix ar1, S77
arl1 init 0.0
ar1 = (0.75 * ar8)
ar4 = (ar8 + ar6)
ar6 = (0.25 * ar4)
ar4 = (ar1 + ar6)
arl1 = ar4
ar1 = arl1
S91 sprintf "p2_%d", p5
 chnmix ar1, S91
endin

instr 21
ir1 = 1.0
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
ir12 = rnd(ir1)
ir14 = 0.0
ar0 noise ir1, ir14
arl0 init 0.0
kr0 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar1 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.15, 0.0
ar2 upsamp kr0
ar3 = (ar1 * ar2)
ir22 = 50.0
kr0 = cent(ir22)
kr1 = (kr0 * -1.0)
kr2 = (p5 + kr1)
kr3 vco2ft kr2, 0
ar1 oscilikt ir1, kr2, kr3, ir2
ir28 = p5
kr2 vco2ft ir28, 0
ar2 oscilikt ir1, ir28, kr2, ir4
ar4 = (ar1 + ar2)
kr2 = (kr0 * 1.0)
kr0 = (p5 + kr2)
kr3 vco2ft kr0, 0
ar1 oscilikt ir1, kr0, kr3, ir6
ar2 = (ar4 + ar1)
ar1 = (ar2 / 3.0)
ir38 = 14.0
kr0 = cent(ir38)
kr3 = (p5 * kr0)
kr0 = (kr3 + kr1)
kr1 vco2ft kr0, 0
ar2 oscilikt ir1, kr0, kr1, ir8
kr0 vco2ft kr3, 0
ar4 oscilikt ir1, kr3, kr0, ir10
ar5 = (ar2 + ar4)
kr0 = (kr3 + kr2)
kr1 vco2ft kr0, 0
ar2 oscilikt ir1, kr0, kr1, ir12
ar4 = (ar5 + ar2)
ar2 = (ar4 / 3.0)
ar4 = (ar1 + ar2)
ir53 = 400.0
ir54 = 0.1
ar1 bqrez ar0, ir53, ir54
ar0 = (0.2 * ar1)
ar1 = (ar4 + ar0)
ir58 = 18000.0
ir59 = 0.3
ar0 bqrez ar1, ir58, ir59, 3.0
ar1 bqrez ar0, ir58, ir59, 3.0
ir62 = 5500.0
ir63 = 0.12
ar0 moogvcf ar1, ir62, ir63
ar1 = (ar3 * ar0)
ar0 = (ar1 * p4)
arl0 = ar0
ar1 = arl0
S71 sprintf "p1_%d", p6
 chnmix ar1, S71
arl1 init 0.0
arl1 = ar0
ar0 = arl1
S80 sprintf "p2_%d", p6
 chnmix ar0, S80
S83 sprintf "alive_%d", p6
kr0 chnget S83
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S83
endin

instr 20
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 24.0, ir5, ir1
ir9 = 8.1
ir10 = cpspch(ir9)
 event_i "i", 18, 0.0, 1.5, 0.5, ir10, ir5
ir13 = 9.0
ir14 = cpspch(ir13)
 event_i "i", 18, 1.5, 0.5, 0.5, ir14, ir5
ir17 = 9.01
ir18 = cpspch(ir17)
 event_i "i", 18, 2.0, 0.5, 0.5, ir18, ir5
ir21 = 9.03
ir22 = cpspch(ir21)
 event_i "i", 18, 2.5, 0.5, 0.5, ir22, ir5
ir25 = 9.05
ir26 = cpspch(ir25)
 event_i "i", 18, 3.0, 2.75, 0.5, ir26, ir5
 event_i "i", 18, 5.75, 0.25, 0.5, ir26, ir5
ir31 = 9.04
ir32 = cpspch(ir31)
 event_i "i", 18, 6.0, 1.25, 0.5, ir32, ir5
 event_i "i", 18, 7.25, 0.25, 0.5, ir26, ir5
 event_i "i", 18, 7.5, 1.25, 0.5, ir14, ir5
 event_i "i", 18, 8.75, 0.25, 0.5, ir10, ir5
ir41 = 8.08
ir42 = cpspch(ir41)
 event_i "i", 18, 9.0, 2.0, 0.5, ir42, ir5
ir45 = 8.0
ir46 = cpspch(ir45)
 event_i "i", 18, 11.0, 0.5, 0.5, ir46, ir5
ir49 = 8.01
ir50 = cpspch(ir49)
 event_i "i", 18, 11.5, 0.5, 0.5, ir50, ir5
 event_i "i", 18, 12.0, 1.75, 0.5, ir10, ir5
 event_i "i", 18, 13.75, 0.5, 0.5, ir14, ir5
 event_i "i", 18, 14.25, 0.5, 0.5, ir18, ir5
 event_i "i", 18, 14.75, 0.5, 0.5, ir22, ir5
 event_i "i", 18, 15.25, 2.75, 0.5, ir18, ir5
 event_i "i", 18, 18.0, 0.25, 0.5, ir14, ir5
ir65 = 8.07
ir66 = cpspch(ir65)
 event_i "i", 18, 18.25, 1.0, 0.5, ir66, ir5
ir69 = 8.05
ir70 = cpspch(ir69)
 event_i "i", 18, 19.25, 0.25, 0.5, ir70, ir5
 event_i "i", 18, 19.5, 1.25, 0.5, ir42, ir5
 event_i "i", 18, 20.75, 0.25, 0.5, ir66, ir5
 event_i "i", 18, 21.0, 2.0, 0.5, ir70, ir5
krl0 = 2.0
kr0 = krl0
S83 sprintf "alive_%d", ir5
 chnset kr0, S83
ir86 FreePort 
 event_i "i", 19, 24.0, 24.0, ir86, ir1
 event_i "i", 18, 24.0, 1.5, 0.5, ir10, ir86
 event_i "i", 18, 25.5, 0.5, 0.5, ir14, ir86
 event_i "i", 18, 26.0, 0.5, 0.5, ir18, ir86
 event_i "i", 18, 26.5, 0.5, 0.5, ir22, ir86
 event_i "i", 18, 27.0, 2.75, 0.5, ir26, ir86
 event_i "i", 18, 29.75, 0.25, 0.5, ir26, ir86
 event_i "i", 18, 30.0, 1.25, 0.5, ir32, ir86
 event_i "i", 18, 31.25, 0.25, 0.5, ir26, ir86
 event_i "i", 18, 31.5, 1.25, 0.5, ir14, ir86
 event_i "i", 18, 32.75, 0.25, 0.5, ir10, ir86
 event_i "i", 18, 33.0, 2.0, 0.5, ir42, ir86
 event_i "i", 18, 35.0, 0.5, 0.5, ir46, ir86
 event_i "i", 18, 35.5, 0.5, 0.5, ir50, ir86
 event_i "i", 18, 36.0, 1.75, 0.5, ir10, ir86
 event_i "i", 18, 37.75, 0.5, 0.5, ir14, ir86
 event_i "i", 18, 38.25, 0.5, 0.5, ir18, ir86
 event_i "i", 18, 38.75, 0.5, 0.5, ir22, ir86
 event_i "i", 18, 39.25, 2.75, 0.5, ir18, ir86
 event_i "i", 18, 42.0, 0.25, 0.5, ir14, ir86
 event_i "i", 18, 42.25, 1.0, 0.5, ir66, ir86
 event_i "i", 18, 43.25, 0.25, 0.5, ir70, ir86
 event_i "i", 18, 43.5, 1.25, 0.5, ir42, ir86
 event_i "i", 18, 44.75, 0.25, 0.5, ir66, ir86
 event_i "i", 18, 45.0, 2.0, 0.5, ir70, ir86
krl0 = 2.0
kr0 = krl0
S142 sprintf "alive_%d", ir86
 chnset kr0, S142
ir145 FreePort 
 event_i "i", 19, 48.0, 24.0, ir145, ir1
 event_i "i", 18, 48.0, 1.5, 0.5, ir10, ir145
 event_i "i", 18, 49.5, 0.5, 0.5, ir14, ir145
 event_i "i", 18, 50.0, 0.5, 0.5, ir18, ir145
 event_i "i", 18, 50.5, 0.5, 0.5, ir22, ir145
 event_i "i", 18, 51.0, 2.75, 0.5, ir26, ir145
 event_i "i", 18, 53.75, 0.25, 0.5, ir26, ir145
 event_i "i", 18, 54.0, 1.25, 0.5, ir32, ir145
 event_i "i", 18, 55.25, 0.25, 0.5, ir26, ir145
 event_i "i", 18, 55.5, 1.25, 0.5, ir14, ir145
 event_i "i", 18, 56.75, 0.25, 0.5, ir10, ir145
 event_i "i", 18, 57.0, 2.0, 0.5, ir42, ir145
 event_i "i", 18, 59.0, 0.5, 0.5, ir46, ir145
 event_i "i", 18, 59.5, 0.5, 0.5, ir50, ir145
 event_i "i", 18, 60.0, 1.75, 0.5, ir10, ir145
 event_i "i", 18, 61.75, 0.5, 0.5, ir14, ir145
 event_i "i", 18, 62.25, 0.5, 0.5, ir18, ir145
 event_i "i", 18, 62.75, 0.5, 0.5, ir22, ir145
 event_i "i", 18, 63.25, 2.75, 0.5, ir18, ir145
 event_i "i", 18, 66.0, 0.25, 0.5, ir14, ir145
 event_i "i", 18, 66.25, 1.0, 0.5, ir66, ir145
 event_i "i", 18, 67.25, 0.25, 0.5, ir70, ir145
 event_i "i", 18, 67.5, 1.25, 0.5, ir42, ir145
 event_i "i", 18, 68.75, 0.25, 0.5, ir66, ir145
 event_i "i", 18, 69.0, 2.0, 0.5, ir70, ir145
krl0 = 2.0
kr0 = krl0
S201 sprintf "alive_%d", ir145
 chnset kr0, S201
ir204 FreePort 
 event_i "i", 19, 72.0, 24.0, ir204, ir1
 event_i "i", 18, 72.0, 1.5, 0.5, ir10, ir204
 event_i "i", 18, 73.5, 0.5, 0.5, ir14, ir204
 event_i "i", 18, 74.0, 0.5, 0.5, ir18, ir204
 event_i "i", 18, 74.5, 0.5, 0.5, ir22, ir204
 event_i "i", 18, 75.0, 2.75, 0.5, ir26, ir204
 event_i "i", 18, 77.75, 0.25, 0.5, ir26, ir204
 event_i "i", 18, 78.0, 1.25, 0.5, ir32, ir204
 event_i "i", 18, 79.25, 0.25, 0.5, ir26, ir204
 event_i "i", 18, 79.5, 1.25, 0.5, ir14, ir204
 event_i "i", 18, 80.75, 0.25, 0.5, ir10, ir204
 event_i "i", 18, 81.0, 2.0, 0.5, ir42, ir204
 event_i "i", 18, 83.0, 0.5, 0.5, ir46, ir204
 event_i "i", 18, 83.5, 0.5, 0.5, ir50, ir204
 event_i "i", 18, 84.0, 1.75, 0.5, ir10, ir204
 event_i "i", 18, 85.75, 0.5, 0.5, ir14, ir204
 event_i "i", 18, 86.25, 0.5, 0.5, ir18, ir204
 event_i "i", 18, 86.75, 0.5, 0.5, ir22, ir204
 event_i "i", 18, 87.25, 2.75, 0.5, ir18, ir204
 event_i "i", 18, 90.0, 0.25, 0.5, ir14, ir204
 event_i "i", 18, 90.25, 1.0, 0.5, ir66, ir204
 event_i "i", 18, 91.25, 0.25, 0.5, ir70, ir204
 event_i "i", 18, 91.5, 1.25, 0.5, ir42, ir204
 event_i "i", 18, 92.75, 0.25, 0.5, ir66, ir204
 event_i "i", 18, 93.0, 2.0, 0.5, ir70, ir204
krl0 = 2.0
kr0 = krl0
S260 sprintf "alive_%d", ir204
 chnset kr0, S260
ir263 FreePort 
 event_i "i", 19, 96.0, 24.0, ir263, ir1
 event_i "i", 18, 96.0, 1.5, 0.5, ir10, ir263
 event_i "i", 18, 97.5, 0.5, 0.5, ir14, ir263
 event_i "i", 18, 98.0, 0.5, 0.5, ir18, ir263
 event_i "i", 18, 98.5, 0.5, 0.5, ir22, ir263
 event_i "i", 18, 99.0, 2.75, 0.5, ir26, ir263
 event_i "i", 18, 101.75, 0.25, 0.5, ir26, ir263
 event_i "i", 18, 102.0, 1.25, 0.5, ir32, ir263
 event_i "i", 18, 103.25, 0.25, 0.5, ir26, ir263
 event_i "i", 18, 103.5, 1.25, 0.5, ir14, ir263
 event_i "i", 18, 104.75, 0.25, 0.5, ir10, ir263
 event_i "i", 18, 105.0, 2.0, 0.5, ir42, ir263
 event_i "i", 18, 107.0, 0.5, 0.5, ir46, ir263
 event_i "i", 18, 107.5, 0.5, 0.5, ir50, ir263
 event_i "i", 18, 108.0, 1.75, 0.5, ir10, ir263
 event_i "i", 18, 109.75, 0.5, 0.5, ir14, ir263
 event_i "i", 18, 110.25, 0.5, 0.5, ir18, ir263
 event_i "i", 18, 110.75, 0.5, 0.5, ir22, ir263
 event_i "i", 18, 111.25, 2.75, 0.5, ir18, ir263
 event_i "i", 18, 114.0, 0.25, 0.5, ir14, ir263
 event_i "i", 18, 114.25, 1.0, 0.5, ir66, ir263
 event_i "i", 18, 115.25, 0.25, 0.5, ir70, ir263
 event_i "i", 18, 115.5, 1.25, 0.5, ir42, ir263
 event_i "i", 18, 116.75, 0.25, 0.5, ir66, ir263
 event_i "i", 18, 117.0, 2.0, 0.5, ir70, ir263
krl0 = 2.0
kr0 = krl0
S319 sprintf "alive_%d", ir263
 chnset kr0, S319
ir322 FreePort 
 event_i "i", 19, 120.0, 24.0, ir322, ir1
 event_i "i", 18, 120.0, 1.5, 0.5, ir10, ir322
 event_i "i", 18, 121.5, 0.5, 0.5, ir14, ir322
 event_i "i", 18, 122.0, 0.5, 0.5, ir18, ir322
 event_i "i", 18, 122.5, 0.5, 0.5, ir22, ir322
 event_i "i", 18, 123.0, 2.75, 0.5, ir26, ir322
 event_i "i", 18, 125.75, 0.25, 0.5, ir26, ir322
 event_i "i", 18, 126.0, 1.25, 0.5, ir32, ir322
 event_i "i", 18, 127.25, 0.25, 0.5, ir26, ir322
 event_i "i", 18, 127.5, 1.25, 0.5, ir14, ir322
 event_i "i", 18, 128.75, 0.25, 0.5, ir10, ir322
 event_i "i", 18, 129.0, 2.0, 0.5, ir42, ir322
 event_i "i", 18, 131.0, 0.5, 0.5, ir46, ir322
 event_i "i", 18, 131.5, 0.5, 0.5, ir50, ir322
 event_i "i", 18, 132.0, 1.75, 0.5, ir10, ir322
 event_i "i", 18, 133.75, 0.5, 0.5, ir14, ir322
 event_i "i", 18, 134.25, 0.5, 0.5, ir18, ir322
 event_i "i", 18, 134.75, 0.5, 0.5, ir22, ir322
 event_i "i", 18, 135.25, 2.75, 0.5, ir18, ir322
 event_i "i", 18, 138.0, 0.25, 0.5, ir14, ir322
 event_i "i", 18, 138.25, 1.0, 0.5, ir66, ir322
 event_i "i", 18, 139.25, 0.25, 0.5, ir70, ir322
 event_i "i", 18, 139.5, 1.25, 0.5, ir42, ir322
 event_i "i", 18, 140.75, 0.25, 0.5, ir66, ir322
 event_i "i", 18, 141.0, 2.0, 0.5, ir70, ir322
krl0 = 2.0
kr0 = krl0
S378 sprintf "alive_%d", ir322
 chnset kr0, S378
ir381 FreePort 
 event_i "i", 19, 144.0, 24.0, ir381, ir1
 event_i "i", 18, 144.0, 1.5, 0.5, ir10, ir381
 event_i "i", 18, 145.5, 0.5, 0.5, ir14, ir381
 event_i "i", 18, 146.0, 0.5, 0.5, ir18, ir381
 event_i "i", 18, 146.5, 0.5, 0.5, ir22, ir381
 event_i "i", 18, 147.0, 2.75, 0.5, ir26, ir381
 event_i "i", 18, 149.75, 0.25, 0.5, ir26, ir381
 event_i "i", 18, 150.0, 1.25, 0.5, ir32, ir381
 event_i "i", 18, 151.25, 0.25, 0.5, ir26, ir381
 event_i "i", 18, 151.5, 1.25, 0.5, ir14, ir381
 event_i "i", 18, 152.75, 0.25, 0.5, ir10, ir381
 event_i "i", 18, 153.0, 2.0, 0.5, ir42, ir381
 event_i "i", 18, 155.0, 0.5, 0.5, ir46, ir381
 event_i "i", 18, 155.5, 0.5, 0.5, ir50, ir381
 event_i "i", 18, 156.0, 1.75, 0.5, ir10, ir381
 event_i "i", 18, 157.75, 0.5, 0.5, ir14, ir381
 event_i "i", 18, 158.25, 0.5, 0.5, ir18, ir381
 event_i "i", 18, 158.75, 0.5, 0.5, ir22, ir381
 event_i "i", 18, 159.25, 2.75, 0.5, ir18, ir381
 event_i "i", 18, 162.0, 0.25, 0.5, ir14, ir381
 event_i "i", 18, 162.25, 1.0, 0.5, ir66, ir381
 event_i "i", 18, 163.25, 0.25, 0.5, ir70, ir381
 event_i "i", 18, 163.5, 1.25, 0.5, ir42, ir381
 event_i "i", 18, 164.75, 0.25, 0.5, ir66, ir381
 event_i "i", 18, 165.0, 2.0, 0.5, ir70, ir381
krl0 = 2.0
kr0 = krl0
S437 sprintf "alive_%d", ir381
 chnset kr0, S437
ir440 FreePort 
 event_i "i", 19, 168.0, 24.0, ir440, ir1
 event_i "i", 18, 168.0, 1.5, 0.5, ir10, ir440
 event_i "i", 18, 169.5, 0.5, 0.5, ir14, ir440
 event_i "i", 18, 170.0, 0.5, 0.5, ir18, ir440
 event_i "i", 18, 170.5, 0.5, 0.5, ir22, ir440
 event_i "i", 18, 171.0, 2.75, 0.5, ir26, ir440
 event_i "i", 18, 173.75, 0.25, 0.5, ir26, ir440
 event_i "i", 18, 174.0, 1.25, 0.5, ir32, ir440
 event_i "i", 18, 175.25, 0.25, 0.5, ir26, ir440
 event_i "i", 18, 175.5, 1.25, 0.5, ir14, ir440
 event_i "i", 18, 176.75, 0.25, 0.5, ir10, ir440
 event_i "i", 18, 177.0, 2.0, 0.5, ir42, ir440
 event_i "i", 18, 179.0, 0.5, 0.5, ir46, ir440
 event_i "i", 18, 179.5, 0.5, 0.5, ir50, ir440
 event_i "i", 18, 180.0, 1.75, 0.5, ir10, ir440
 event_i "i", 18, 181.75, 0.5, 0.5, ir14, ir440
 event_i "i", 18, 182.25, 0.5, 0.5, ir18, ir440
 event_i "i", 18, 182.75, 0.5, 0.5, ir22, ir440
 event_i "i", 18, 183.25, 2.75, 0.5, ir18, ir440
 event_i "i", 18, 186.0, 0.25, 0.5, ir14, ir440
 event_i "i", 18, 186.25, 1.0, 0.5, ir66, ir440
 event_i "i", 18, 187.25, 0.25, 0.5, ir70, ir440
 event_i "i", 18, 187.5, 1.25, 0.5, ir42, ir440
 event_i "i", 18, 188.75, 0.25, 0.5, ir66, ir440
 event_i "i", 18, 189.0, 2.0, 0.5, ir70, ir440
krl0 = 2.0
kr0 = krl0
S496 sprintf "alive_%d", ir440
 chnset kr0, S496
ir499 FreePort 
 event_i "i", 19, 192.0, 24.0, ir499, ir1
 event_i "i", 18, 192.0, 1.5, 0.5, ir10, ir499
 event_i "i", 18, 193.5, 0.5, 0.5, ir14, ir499
 event_i "i", 18, 194.0, 0.5, 0.5, ir18, ir499
 event_i "i", 18, 194.5, 0.5, 0.5, ir22, ir499
 event_i "i", 18, 195.0, 2.75, 0.5, ir26, ir499
 event_i "i", 18, 197.75, 0.25, 0.5, ir26, ir499
 event_i "i", 18, 198.0, 1.25, 0.5, ir32, ir499
 event_i "i", 18, 199.25, 0.25, 0.5, ir26, ir499
 event_i "i", 18, 199.5, 1.25, 0.5, ir14, ir499
 event_i "i", 18, 200.75, 0.25, 0.5, ir10, ir499
 event_i "i", 18, 201.0, 2.0, 0.5, ir42, ir499
 event_i "i", 18, 203.0, 0.5, 0.5, ir46, ir499
 event_i "i", 18, 203.5, 0.5, 0.5, ir50, ir499
 event_i "i", 18, 204.0, 1.75, 0.5, ir10, ir499
 event_i "i", 18, 205.75, 0.5, 0.5, ir14, ir499
 event_i "i", 18, 206.25, 0.5, 0.5, ir18, ir499
 event_i "i", 18, 206.75, 0.5, 0.5, ir22, ir499
 event_i "i", 18, 207.25, 2.75, 0.5, ir18, ir499
 event_i "i", 18, 210.0, 0.25, 0.5, ir14, ir499
 event_i "i", 18, 210.25, 1.0, 0.5, ir66, ir499
 event_i "i", 18, 211.25, 0.25, 0.5, ir70, ir499
 event_i "i", 18, 211.5, 1.25, 0.5, ir42, ir499
 event_i "i", 18, 212.75, 0.25, 0.5, ir66, ir499
 event_i "i", 18, 213.0, 2.0, 0.5, ir70, ir499
krl0 = 2.0
kr0 = krl0
S555 sprintf "alive_%d", ir499
 chnset kr0, S555
ir558 FreePort 
 event_i "i", 19, 216.0, 24.0, ir558, ir1
 event_i "i", 18, 216.0, 1.5, 0.5, ir10, ir558
 event_i "i", 18, 217.5, 0.5, 0.5, ir14, ir558
 event_i "i", 18, 218.0, 0.5, 0.5, ir18, ir558
 event_i "i", 18, 218.5, 0.5, 0.5, ir22, ir558
 event_i "i", 18, 219.0, 2.75, 0.5, ir26, ir558
 event_i "i", 18, 221.75, 0.25, 0.5, ir26, ir558
 event_i "i", 18, 222.0, 1.25, 0.5, ir32, ir558
 event_i "i", 18, 223.25, 0.25, 0.5, ir26, ir558
 event_i "i", 18, 223.5, 1.25, 0.5, ir14, ir558
 event_i "i", 18, 224.75, 0.25, 0.5, ir10, ir558
 event_i "i", 18, 225.0, 2.0, 0.5, ir42, ir558
 event_i "i", 18, 227.0, 0.5, 0.5, ir46, ir558
 event_i "i", 18, 227.5, 0.5, 0.5, ir50, ir558
 event_i "i", 18, 228.0, 1.75, 0.5, ir10, ir558
 event_i "i", 18, 229.75, 0.5, 0.5, ir14, ir558
 event_i "i", 18, 230.25, 0.5, 0.5, ir18, ir558
 event_i "i", 18, 230.75, 0.5, 0.5, ir22, ir558
 event_i "i", 18, 231.25, 2.75, 0.5, ir18, ir558
 event_i "i", 18, 234.0, 0.25, 0.5, ir14, ir558
 event_i "i", 18, 234.25, 1.0, 0.5, ir66, ir558
 event_i "i", 18, 235.25, 0.25, 0.5, ir70, ir558
 event_i "i", 18, 235.5, 1.25, 0.5, ir42, ir558
 event_i "i", 18, 236.75, 0.25, 0.5, ir66, ir558
 event_i "i", 18, 237.0, 2.0, 0.5, ir70, ir558
krl0 = 2.0
kr0 = krl0
S614 sprintf "alive_%d", ir558
 chnset kr0, S614
krl0 = 20.0
kr0 = krl0
S621 sprintf "alive_%d", ir1
 chnset kr0, S621
S624 sprintf "p1_%d", ir1
ar0 chnget S624
S627 sprintf "p2_%d", ir1
ar1 chnget S627
 chnclear S624
 chnclear S627
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
kr0 oscil3 ir20, kr1, 4
kr3 = (0.5 * kr0)
kr0 = (0.5 + kr3)
kr3 = (kr5 * kr0)
ar1 foscili ir20, ir21, ir20, ir22, kr3, 4
kr0 = (kr1 + 0.2)
kr3 oscil3 ir20, kr0, 4
kr0 = (0.5 * kr3)
kr3 = (0.5 + kr0)
kr0 = (kr2 * kr3)
ar3 foscili ir20, ir21, ir22, ir20, kr0, 4
ar4 = (ar1 + ar3)
ir35 = 7.0
kr0 = (kr1 - 0.15)
kr1 oscil3 ir20, kr0, 4
kr0 = (0.5 * kr1)
kr1 = (0.5 + kr0)
kr0 = (kr5 * kr1)
ar1 foscili ir20, ir21, ir20, ir35, kr0, 4
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

f4 0 8192 10  1.0
f2 0 8192 19  0.5 1.0 180.0 1.0

f0 604800.0

i 28 0.0 -1.0 
i 27 0.0 -1.0 
i 24 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>