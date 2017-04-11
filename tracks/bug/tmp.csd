<CsoundSynthesizer>

<CsOptions>

--output=dac --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
girgfree_vco = 149
ir11 = girgfree_vco
ir13 vco2init 1, ir11
girgfree_vco = ir13
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 30

endin

instr 29
 event_i "i", 28, 240.0, 1.0e-2
endin

instr 28
 turnoff2 27, 0.0, 0.0
 turnoff2 26, 0.0, 0.0
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

instr 27
arl0 init 0.0
arl1 init 0.0
ar0, ar1 subinstr 20
ar2, ar3 subinstr 23
ar4 = (ar0 + ar2)
ar2 = (ar4 + ar0)
ar0, ar4 subinstr 26
ar5 = (ar2 + ar0)
ir14 = 1.0
ar0 upsamp k(ir14)
ir15 = 0.0
ir16 = 90.0
ir17 = 100.0
ar2 compress ar5, ar0, ir15, ir16, ir16, ir17, ir15, ir15, 0.0
ar5 = (ar2 * 0.8)
arl0 = ar5
ar2 = (ar1 + ar1)
ar1 = (ar2 + ar4)
ar2 = (ar1 + ar3)
ar1 compress ar2, ar0, ir15, ir16, ir16, ir17, ir15, ir15, 0.0
ar0 = (ar1 * 0.8)
arl1 = ar0
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 26
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 25, 0.0, 24.0, ir5, ir1
ir9 = 7.1
ir10 = cpspch(ir9)
 event_i "i", 24, 0.0, 1.5, 8.0e-2, ir10, ir5
ir13 = 8.03
ir14 = cpspch(ir13)
 event_i "i", 24, 1.5, 1.5, 8.0e-2, ir14, ir5
ir17 = 8.05
ir18 = cpspch(ir17)
 event_i "i", 24, 3.0, 3.0, 8.0e-2, ir18, ir5
ir21 = 8.04
ir22 = cpspch(ir21)
 event_i "i", 24, 6.0, 1.5, 8.0e-2, ir22, ir5
ir25 = 8.0
ir26 = cpspch(ir25)
 event_i "i", 24, 7.5, 1.5, 8.0e-2, ir26, ir5
 event_i "i", 24, 9.0, 3.0, 8.0e-2, ir18, ir5
 event_i "i", 24, 12.0, 1.5, 8.0e-2, ir10, ir5
ir33 = 8.01
ir34 = cpspch(ir33)
 event_i "i", 24, 13.5, 1.5, 8.0e-2, ir34, ir5
 event_i "i", 24, 15.0, 3.0, 8.0e-2, ir18, ir5
 event_i "i", 24, 18.0, 1.5, 8.0e-2, ir22, ir5
 event_i "i", 24, 19.5, 1.5, 8.0e-2, ir26, ir5
 event_i "i", 24, 21.0, 3.0, 8.0e-2, ir18, ir5
ir45 = 8.1
ir46 = cpspch(ir45)
 event_i "i", 24, 0.0, 3.0, 8.0e-2, ir46, ir5
ir49 = 8.08
ir50 = cpspch(ir49)
 event_i "i", 24, 3.0, 3.0, 8.0e-2, ir50, ir5
ir53 = 8.07
ir54 = cpspch(ir53)
 event_i "i", 24, 6.0, 3.0, 8.0e-2, ir54, ir5
 event_i "i", 24, 9.0, 3.0, 8.0e-2, ir50, ir5
 event_i "i", 24, 12.0, 6.0, 8.0e-2, ir46, ir5
 event_i "i", 24, 18.0, 3.0, 8.0e-2, ir54, ir5
 event_i "i", 24, 21.0, 3.0, 8.0e-2, ir50, ir5
krl0 = 2.0
kr0 = krl0
S69 sprintf "alive_%d", ir5
 chnset kr0, S69
ir72 FreePort 
 event_i "i", 25, 24.0, 24.0, ir72, ir1
 event_i "i", 24, 24.0, 1.5, 8.0e-2, ir10, ir72
 event_i "i", 24, 25.5, 1.5, 8.0e-2, ir14, ir72
 event_i "i", 24, 27.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 24, 30.0, 1.5, 8.0e-2, ir22, ir72
 event_i "i", 24, 31.5, 1.5, 8.0e-2, ir26, ir72
 event_i "i", 24, 33.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 24, 36.0, 1.5, 8.0e-2, ir10, ir72
 event_i "i", 24, 37.5, 1.5, 8.0e-2, ir34, ir72
 event_i "i", 24, 39.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 24, 42.0, 1.5, 8.0e-2, ir22, ir72
 event_i "i", 24, 43.5, 1.5, 8.0e-2, ir26, ir72
 event_i "i", 24, 45.0, 3.0, 8.0e-2, ir18, ir72
 event_i "i", 24, 24.0, 3.0, 8.0e-2, ir46, ir72
 event_i "i", 24, 27.0, 3.0, 8.0e-2, ir50, ir72
 event_i "i", 24, 30.0, 3.0, 8.0e-2, ir54, ir72
 event_i "i", 24, 33.0, 3.0, 8.0e-2, ir50, ir72
 event_i "i", 24, 36.0, 6.0, 8.0e-2, ir46, ir72
 event_i "i", 24, 42.0, 3.0, 8.0e-2, ir54, ir72
 event_i "i", 24, 45.0, 3.0, 8.0e-2, ir50, ir72
krl0 = 2.0
kr0 = krl0
S118 sprintf "alive_%d", ir72
 chnset kr0, S118
ir121 FreePort 
 event_i "i", 25, 48.0, 24.0, ir121, ir1
 event_i "i", 24, 48.0, 1.5, 8.0e-2, ir10, ir121
 event_i "i", 24, 49.5, 1.5, 8.0e-2, ir14, ir121
 event_i "i", 24, 51.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 24, 54.0, 1.5, 8.0e-2, ir22, ir121
 event_i "i", 24, 55.5, 1.5, 8.0e-2, ir26, ir121
 event_i "i", 24, 57.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 24, 60.0, 1.5, 8.0e-2, ir10, ir121
 event_i "i", 24, 61.5, 1.5, 8.0e-2, ir34, ir121
 event_i "i", 24, 63.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 24, 66.0, 1.5, 8.0e-2, ir22, ir121
 event_i "i", 24, 67.5, 1.5, 8.0e-2, ir26, ir121
 event_i "i", 24, 69.0, 3.0, 8.0e-2, ir18, ir121
 event_i "i", 24, 48.0, 3.0, 8.0e-2, ir46, ir121
 event_i "i", 24, 51.0, 3.0, 8.0e-2, ir50, ir121
 event_i "i", 24, 54.0, 3.0, 8.0e-2, ir54, ir121
 event_i "i", 24, 57.0, 3.0, 8.0e-2, ir50, ir121
 event_i "i", 24, 60.0, 6.0, 8.0e-2, ir46, ir121
 event_i "i", 24, 66.0, 3.0, 8.0e-2, ir54, ir121
 event_i "i", 24, 69.0, 3.0, 8.0e-2, ir50, ir121
krl0 = 2.0
kr0 = krl0
S167 sprintf "alive_%d", ir121
 chnset kr0, S167
ir170 FreePort 
 event_i "i", 25, 72.0, 24.0, ir170, ir1
 event_i "i", 24, 72.0, 1.5, 8.0e-2, ir10, ir170
 event_i "i", 24, 73.5, 1.5, 8.0e-2, ir14, ir170
 event_i "i", 24, 75.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 24, 78.0, 1.5, 8.0e-2, ir22, ir170
 event_i "i", 24, 79.5, 1.5, 8.0e-2, ir26, ir170
 event_i "i", 24, 81.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 24, 84.0, 1.5, 8.0e-2, ir10, ir170
 event_i "i", 24, 85.5, 1.5, 8.0e-2, ir34, ir170
 event_i "i", 24, 87.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 24, 90.0, 1.5, 8.0e-2, ir22, ir170
 event_i "i", 24, 91.5, 1.5, 8.0e-2, ir26, ir170
 event_i "i", 24, 93.0, 3.0, 8.0e-2, ir18, ir170
 event_i "i", 24, 72.0, 3.0, 8.0e-2, ir46, ir170
 event_i "i", 24, 75.0, 3.0, 8.0e-2, ir50, ir170
 event_i "i", 24, 78.0, 3.0, 8.0e-2, ir54, ir170
 event_i "i", 24, 81.0, 3.0, 8.0e-2, ir50, ir170
 event_i "i", 24, 84.0, 6.0, 8.0e-2, ir46, ir170
 event_i "i", 24, 90.0, 3.0, 8.0e-2, ir54, ir170
 event_i "i", 24, 93.0, 3.0, 8.0e-2, ir50, ir170
krl0 = 2.0
kr0 = krl0
S216 sprintf "alive_%d", ir170
 chnset kr0, S216
ir219 FreePort 
 event_i "i", 25, 96.0, 24.0, ir219, ir1
 event_i "i", 24, 96.0, 1.5, 8.0e-2, ir10, ir219
 event_i "i", 24, 97.5, 1.5, 8.0e-2, ir14, ir219
 event_i "i", 24, 99.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 24, 102.0, 1.5, 8.0e-2, ir22, ir219
 event_i "i", 24, 103.5, 1.5, 8.0e-2, ir26, ir219
 event_i "i", 24, 105.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 24, 108.0, 1.5, 8.0e-2, ir10, ir219
 event_i "i", 24, 109.5, 1.5, 8.0e-2, ir34, ir219
 event_i "i", 24, 111.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 24, 114.0, 1.5, 8.0e-2, ir22, ir219
 event_i "i", 24, 115.5, 1.5, 8.0e-2, ir26, ir219
 event_i "i", 24, 117.0, 3.0, 8.0e-2, ir18, ir219
 event_i "i", 24, 96.0, 3.0, 8.0e-2, ir46, ir219
 event_i "i", 24, 99.0, 3.0, 8.0e-2, ir50, ir219
 event_i "i", 24, 102.0, 3.0, 8.0e-2, ir54, ir219
 event_i "i", 24, 105.0, 3.0, 8.0e-2, ir50, ir219
 event_i "i", 24, 108.0, 6.0, 8.0e-2, ir46, ir219
 event_i "i", 24, 114.0, 3.0, 8.0e-2, ir54, ir219
 event_i "i", 24, 117.0, 3.0, 8.0e-2, ir50, ir219
krl0 = 2.0
kr0 = krl0
S265 sprintf "alive_%d", ir219
 chnset kr0, S265
ir268 FreePort 
 event_i "i", 25, 120.0, 24.0, ir268, ir1
 event_i "i", 24, 120.0, 1.5, 8.0e-2, ir10, ir268
 event_i "i", 24, 121.5, 1.5, 8.0e-2, ir14, ir268
 event_i "i", 24, 123.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 24, 126.0, 1.5, 8.0e-2, ir22, ir268
 event_i "i", 24, 127.5, 1.5, 8.0e-2, ir26, ir268
 event_i "i", 24, 129.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 24, 132.0, 1.5, 8.0e-2, ir10, ir268
 event_i "i", 24, 133.5, 1.5, 8.0e-2, ir34, ir268
 event_i "i", 24, 135.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 24, 138.0, 1.5, 8.0e-2, ir22, ir268
 event_i "i", 24, 139.5, 1.5, 8.0e-2, ir26, ir268
 event_i "i", 24, 141.0, 3.0, 8.0e-2, ir18, ir268
 event_i "i", 24, 120.0, 3.0, 8.0e-2, ir46, ir268
 event_i "i", 24, 123.0, 3.0, 8.0e-2, ir50, ir268
 event_i "i", 24, 126.0, 3.0, 8.0e-2, ir54, ir268
 event_i "i", 24, 129.0, 3.0, 8.0e-2, ir50, ir268
 event_i "i", 24, 132.0, 6.0, 8.0e-2, ir46, ir268
 event_i "i", 24, 138.0, 3.0, 8.0e-2, ir54, ir268
 event_i "i", 24, 141.0, 3.0, 8.0e-2, ir50, ir268
krl0 = 2.0
kr0 = krl0
S314 sprintf "alive_%d", ir268
 chnset kr0, S314
ir317 FreePort 
 event_i "i", 25, 144.0, 24.0, ir317, ir1
 event_i "i", 24, 144.0, 1.5, 8.0e-2, ir10, ir317
 event_i "i", 24, 145.5, 1.5, 8.0e-2, ir14, ir317
 event_i "i", 24, 147.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 24, 150.0, 1.5, 8.0e-2, ir22, ir317
 event_i "i", 24, 151.5, 1.5, 8.0e-2, ir26, ir317
 event_i "i", 24, 153.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 24, 156.0, 1.5, 8.0e-2, ir10, ir317
 event_i "i", 24, 157.5, 1.5, 8.0e-2, ir34, ir317
 event_i "i", 24, 159.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 24, 162.0, 1.5, 8.0e-2, ir22, ir317
 event_i "i", 24, 163.5, 1.5, 8.0e-2, ir26, ir317
 event_i "i", 24, 165.0, 3.0, 8.0e-2, ir18, ir317
 event_i "i", 24, 144.0, 3.0, 8.0e-2, ir46, ir317
 event_i "i", 24, 147.0, 3.0, 8.0e-2, ir50, ir317
 event_i "i", 24, 150.0, 3.0, 8.0e-2, ir54, ir317
 event_i "i", 24, 153.0, 3.0, 8.0e-2, ir50, ir317
 event_i "i", 24, 156.0, 6.0, 8.0e-2, ir46, ir317
 event_i "i", 24, 162.0, 3.0, 8.0e-2, ir54, ir317
 event_i "i", 24, 165.0, 3.0, 8.0e-2, ir50, ir317
krl0 = 2.0
kr0 = krl0
S363 sprintf "alive_%d", ir317
 chnset kr0, S363
ir366 FreePort 
 event_i "i", 25, 168.0, 24.0, ir366, ir1
 event_i "i", 24, 168.0, 1.5, 8.0e-2, ir10, ir366
 event_i "i", 24, 169.5, 1.5, 8.0e-2, ir14, ir366
 event_i "i", 24, 171.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 24, 174.0, 1.5, 8.0e-2, ir22, ir366
 event_i "i", 24, 175.5, 1.5, 8.0e-2, ir26, ir366
 event_i "i", 24, 177.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 24, 180.0, 1.5, 8.0e-2, ir10, ir366
 event_i "i", 24, 181.5, 1.5, 8.0e-2, ir34, ir366
 event_i "i", 24, 183.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 24, 186.0, 1.5, 8.0e-2, ir22, ir366
 event_i "i", 24, 187.5, 1.5, 8.0e-2, ir26, ir366
 event_i "i", 24, 189.0, 3.0, 8.0e-2, ir18, ir366
 event_i "i", 24, 168.0, 3.0, 8.0e-2, ir46, ir366
 event_i "i", 24, 171.0, 3.0, 8.0e-2, ir50, ir366
 event_i "i", 24, 174.0, 3.0, 8.0e-2, ir54, ir366
 event_i "i", 24, 177.0, 3.0, 8.0e-2, ir50, ir366
 event_i "i", 24, 180.0, 6.0, 8.0e-2, ir46, ir366
 event_i "i", 24, 186.0, 3.0, 8.0e-2, ir54, ir366
 event_i "i", 24, 189.0, 3.0, 8.0e-2, ir50, ir366
krl0 = 2.0
kr0 = krl0
S412 sprintf "alive_%d", ir366
 chnset kr0, S412
ir415 FreePort 
 event_i "i", 25, 192.0, 24.0, ir415, ir1
 event_i "i", 24, 192.0, 1.5, 8.0e-2, ir10, ir415
 event_i "i", 24, 193.5, 1.5, 8.0e-2, ir14, ir415
 event_i "i", 24, 195.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 24, 198.0, 1.5, 8.0e-2, ir22, ir415
 event_i "i", 24, 199.5, 1.5, 8.0e-2, ir26, ir415
 event_i "i", 24, 201.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 24, 204.0, 1.5, 8.0e-2, ir10, ir415
 event_i "i", 24, 205.5, 1.5, 8.0e-2, ir34, ir415
 event_i "i", 24, 207.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 24, 210.0, 1.5, 8.0e-2, ir22, ir415
 event_i "i", 24, 211.5, 1.5, 8.0e-2, ir26, ir415
 event_i "i", 24, 213.0, 3.0, 8.0e-2, ir18, ir415
 event_i "i", 24, 192.0, 3.0, 8.0e-2, ir46, ir415
 event_i "i", 24, 195.0, 3.0, 8.0e-2, ir50, ir415
 event_i "i", 24, 198.0, 3.0, 8.0e-2, ir54, ir415
 event_i "i", 24, 201.0, 3.0, 8.0e-2, ir50, ir415
 event_i "i", 24, 204.0, 6.0, 8.0e-2, ir46, ir415
 event_i "i", 24, 210.0, 3.0, 8.0e-2, ir54, ir415
 event_i "i", 24, 213.0, 3.0, 8.0e-2, ir50, ir415
krl0 = 2.0
kr0 = krl0
S461 sprintf "alive_%d", ir415
 chnset kr0, S461
ir464 FreePort 
 event_i "i", 25, 216.0, 24.0, ir464, ir1
 event_i "i", 24, 216.0, 1.5, 8.0e-2, ir10, ir464
 event_i "i", 24, 217.5, 1.5, 8.0e-2, ir14, ir464
 event_i "i", 24, 219.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 24, 222.0, 1.5, 8.0e-2, ir22, ir464
 event_i "i", 24, 223.5, 1.5, 8.0e-2, ir26, ir464
 event_i "i", 24, 225.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 24, 228.0, 1.5, 8.0e-2, ir10, ir464
 event_i "i", 24, 229.5, 1.5, 8.0e-2, ir34, ir464
 event_i "i", 24, 231.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 24, 234.0, 1.5, 8.0e-2, ir22, ir464
 event_i "i", 24, 235.5, 1.5, 8.0e-2, ir26, ir464
 event_i "i", 24, 237.0, 3.0, 8.0e-2, ir18, ir464
 event_i "i", 24, 216.0, 3.0, 8.0e-2, ir46, ir464
 event_i "i", 24, 219.0, 3.0, 8.0e-2, ir50, ir464
 event_i "i", 24, 222.0, 3.0, 8.0e-2, ir54, ir464
 event_i "i", 24, 225.0, 3.0, 8.0e-2, ir50, ir464
 event_i "i", 24, 228.0, 6.0, 8.0e-2, ir46, ir464
 event_i "i", 24, 234.0, 3.0, 8.0e-2, ir54, ir464
 event_i "i", 24, 237.0, 3.0, 8.0e-2, ir50, ir464
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

instr 25
S1 sprintf "p1_%d", p4
ar0 chnget S1
S4 sprintf "p2_%d", p4
ar1 chnget S4
 chnclear S1
 chnclear S4
ar2 delayr 1.2
ir13 = 1.0
ir14 = 3.75
ar3 oscil3 ir13, ir14, 48
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

instr 24
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

instr 23
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 22, 0.0, 24.0, ir5, ir1
ir9 = 8.1
ir10 = cpspch(ir9)
 event_i "i", 21, 0.0, 15.272727272727272, 0.5, ir10, ir5
krl0 = 2.0
kr0 = krl0
S17 sprintf "alive_%d", ir5
 chnset kr0, S17
ir20 FreePort 
 event_i "i", 22, 24.0, 24.0, ir20, ir1
 event_i "i", 21, 24.0, 15.272727272727272, 0.5, ir10, ir20
krl0 = 2.0
kr0 = krl0
S30 sprintf "alive_%d", ir20
 chnset kr0, S30
ir33 FreePort 
 event_i "i", 22, 48.0, 24.0, ir33, ir1
 event_i "i", 21, 48.0, 15.272727272727272, 0.5, ir10, ir33
krl0 = 2.0
kr0 = krl0
S43 sprintf "alive_%d", ir33
 chnset kr0, S43
ir46 FreePort 
 event_i "i", 22, 72.0, 24.0, ir46, ir1
 event_i "i", 21, 72.0, 15.272727272727272, 0.5, ir10, ir46
krl0 = 2.0
kr0 = krl0
S56 sprintf "alive_%d", ir46
 chnset kr0, S56
ir59 FreePort 
 event_i "i", 22, 96.0, 24.0, ir59, ir1
 event_i "i", 21, 96.0, 15.272727272727272, 0.5, ir10, ir59
krl0 = 2.0
kr0 = krl0
S69 sprintf "alive_%d", ir59
 chnset kr0, S69
ir72 FreePort 
 event_i "i", 22, 120.0, 24.0, ir72, ir1
 event_i "i", 21, 120.0, 15.272727272727272, 0.5, ir10, ir72
krl0 = 2.0
kr0 = krl0
S82 sprintf "alive_%d", ir72
 chnset kr0, S82
ir85 FreePort 
 event_i "i", 22, 144.0, 24.0, ir85, ir1
 event_i "i", 21, 144.0, 15.272727272727272, 0.5, ir10, ir85
krl0 = 2.0
kr0 = krl0
S95 sprintf "alive_%d", ir85
 chnset kr0, S95
ir98 FreePort 
 event_i "i", 22, 168.0, 24.0, ir98, ir1
 event_i "i", 21, 168.0, 15.272727272727272, 0.5, ir10, ir98
krl0 = 2.0
kr0 = krl0
S108 sprintf "alive_%d", ir98
 chnset kr0, S108
ir111 FreePort 
 event_i "i", 22, 192.0, 24.0, ir111, ir1
 event_i "i", 21, 192.0, 15.272727272727272, 0.5, ir10, ir111
krl0 = 2.0
kr0 = krl0
S121 sprintf "alive_%d", ir111
 chnset kr0, S121
ir124 FreePort 
 event_i "i", 22, 216.0, 24.0, ir124, ir1
 event_i "i", 21, 216.0, 15.272727272727272, 0.5, ir10, ir124
krl0 = 2.0
kr0 = krl0
S134 sprintf "alive_%d", ir124
 chnset kr0, S134
krl0 = 20.0
kr0 = krl0
S141 sprintf "alive_%d", ir1
 chnset kr0, S141
S144 sprintf "p1_%d", ir1
ar0 chnget S144
S147 sprintf "p2_%d", ir1
ar1 chnget S147
 chnclear S144
 chnclear S147
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

instr 21
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
kr0 oscil3 ir20, kr1, 44
kr3 = (0.5 * kr0)
kr0 = (0.5 + kr3)
kr3 = (kr5 * kr0)
ar1 foscili ir20, ir21, ir20, ir22, kr3, 44
kr0 = (kr1 + 0.2)
kr3 oscil3 ir20, kr0, 44
kr0 = (0.5 * kr3)
kr3 = (0.5 + kr0)
kr0 = (kr2 * kr3)
ar3 foscili ir20, ir21, ir22, ir20, kr0, 44
ar4 = (ar1 + ar3)
ir35 = 7.0
kr0 = (kr1 - 0.15)
kr1 oscil3 ir20, kr0, 44
kr0 = (0.5 * kr1)
kr1 = (0.5 + kr0)
kr0 = (kr5 * kr1)
ar1 foscili ir20, ir21, ir20, ir35, kr0, 44
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

instr 20
ir1 FreePort 
krl0 init 10.0
ir5 FreePort 
 event_i "i", 19, 0.0, 24.0, ir5, ir1
ir9 = 9.05
ir10 = cpspch(ir9)
 event_i "i", 18, 0.0, 7.5, 0.1, ir10, ir5
ir13 = 9.04
ir14 = cpspch(ir13)
 event_i "i", 18, 7.5, 1.5, 0.1, ir14, ir5
 event_i "i", 18, 9.0, 10.5, 0.1, ir10, ir5
 event_i "i", 18, 19.5, 1.5, 0.1, ir14, ir5
 event_i "i", 18, 21.0, 3.0, 0.1, ir10, ir5
ir23 = 9.1
ir24 = cpspch(ir23)
 event_i "i", 18, 0.0, 3.0, 0.1, ir24, ir5
ir27 = 9.08
ir28 = cpspch(ir27)
 event_i "i", 18, 3.0, 3.0, 0.1, ir28, ir5
ir31 = 9.07
ir32 = cpspch(ir31)
 event_i "i", 18, 6.0, 3.0, 0.1, ir32, ir5
 event_i "i", 18, 9.0, 3.0, 0.1, ir28, ir5
 event_i "i", 18, 12.0, 9.0, 0.1, ir24, ir5
 event_i "i", 18, 21.0, 3.0, 0.1, ir28, ir5
ir41 = 10.0
ir42 = cpspch(ir41)
 event_i "i", 18, 0.0, 1.5, 0.1, ir42, ir5
ir45 = 10.01
ir46 = cpspch(ir45)
 event_i "i", 18, 1.5, 1.5, 0.1, ir46, ir5
 event_i "i", 18, 3.0, 10.5, 0.1, ir42, ir5
ir51 = 10.03
ir52 = cpspch(ir51)
 event_i "i", 18, 13.5, 1.5, 0.1, ir52, ir5
 event_i "i", 18, 15.0, 3.0, 0.1, ir46, ir5
 event_i "i", 18, 18.0, 6.0, 0.1, ir42, ir5
krl0 = 2.0
kr0 = krl0
S63 sprintf "alive_%d", ir5
 chnset kr0, S63
ir66 FreePort 
 event_i "i", 19, 24.0, 24.0, ir66, ir1
 event_i "i", 18, 24.0, 7.5, 0.1, ir10, ir66
 event_i "i", 18, 31.5, 1.5, 0.1, ir14, ir66
 event_i "i", 18, 33.0, 10.5, 0.1, ir10, ir66
 event_i "i", 18, 43.5, 1.5, 0.1, ir14, ir66
 event_i "i", 18, 45.0, 3.0, 0.1, ir10, ir66
 event_i "i", 18, 24.0, 3.0, 0.1, ir24, ir66
 event_i "i", 18, 27.0, 3.0, 0.1, ir28, ir66
 event_i "i", 18, 30.0, 3.0, 0.1, ir32, ir66
 event_i "i", 18, 33.0, 3.0, 0.1, ir28, ir66
 event_i "i", 18, 36.0, 9.0, 0.1, ir24, ir66
 event_i "i", 18, 45.0, 3.0, 0.1, ir28, ir66
 event_i "i", 18, 24.0, 1.5, 0.1, ir42, ir66
 event_i "i", 18, 25.5, 1.5, 0.1, ir46, ir66
 event_i "i", 18, 27.0, 10.5, 0.1, ir42, ir66
 event_i "i", 18, 37.5, 1.5, 0.1, ir52, ir66
 event_i "i", 18, 39.0, 3.0, 0.1, ir46, ir66
 event_i "i", 18, 42.0, 6.0, 0.1, ir42, ir66
krl0 = 2.0
kr0 = krl0
S108 sprintf "alive_%d", ir66
 chnset kr0, S108
ir111 FreePort 
 event_i "i", 19, 48.0, 24.0, ir111, ir1
 event_i "i", 18, 48.0, 7.5, 0.1, ir10, ir111
 event_i "i", 18, 55.5, 1.5, 0.1, ir14, ir111
 event_i "i", 18, 57.0, 10.5, 0.1, ir10, ir111
 event_i "i", 18, 67.5, 1.5, 0.1, ir14, ir111
 event_i "i", 18, 69.0, 3.0, 0.1, ir10, ir111
 event_i "i", 18, 48.0, 3.0, 0.1, ir24, ir111
 event_i "i", 18, 51.0, 3.0, 0.1, ir28, ir111
 event_i "i", 18, 54.0, 3.0, 0.1, ir32, ir111
 event_i "i", 18, 57.0, 3.0, 0.1, ir28, ir111
 event_i "i", 18, 60.0, 9.0, 0.1, ir24, ir111
 event_i "i", 18, 69.0, 3.0, 0.1, ir28, ir111
 event_i "i", 18, 48.0, 1.5, 0.1, ir42, ir111
 event_i "i", 18, 49.5, 1.5, 0.1, ir46, ir111
 event_i "i", 18, 51.0, 10.5, 0.1, ir42, ir111
 event_i "i", 18, 61.5, 1.5, 0.1, ir52, ir111
 event_i "i", 18, 63.0, 3.0, 0.1, ir46, ir111
 event_i "i", 18, 66.0, 6.0, 0.1, ir42, ir111
krl0 = 2.0
kr0 = krl0
S153 sprintf "alive_%d", ir111
 chnset kr0, S153
ir156 FreePort 
 event_i "i", 19, 72.0, 24.0, ir156, ir1
 event_i "i", 18, 72.0, 7.5, 0.1, ir10, ir156
 event_i "i", 18, 79.5, 1.5, 0.1, ir14, ir156
 event_i "i", 18, 81.0, 10.5, 0.1, ir10, ir156
 event_i "i", 18, 91.5, 1.5, 0.1, ir14, ir156
 event_i "i", 18, 93.0, 3.0, 0.1, ir10, ir156
 event_i "i", 18, 72.0, 3.0, 0.1, ir24, ir156
 event_i "i", 18, 75.0, 3.0, 0.1, ir28, ir156
 event_i "i", 18, 78.0, 3.0, 0.1, ir32, ir156
 event_i "i", 18, 81.0, 3.0, 0.1, ir28, ir156
 event_i "i", 18, 84.0, 9.0, 0.1, ir24, ir156
 event_i "i", 18, 93.0, 3.0, 0.1, ir28, ir156
 event_i "i", 18, 72.0, 1.5, 0.1, ir42, ir156
 event_i "i", 18, 73.5, 1.5, 0.1, ir46, ir156
 event_i "i", 18, 75.0, 10.5, 0.1, ir42, ir156
 event_i "i", 18, 85.5, 1.5, 0.1, ir52, ir156
 event_i "i", 18, 87.0, 3.0, 0.1, ir46, ir156
 event_i "i", 18, 90.0, 6.0, 0.1, ir42, ir156
krl0 = 2.0
kr0 = krl0
S198 sprintf "alive_%d", ir156
 chnset kr0, S198
ir201 FreePort 
 event_i "i", 19, 96.0, 24.0, ir201, ir1
 event_i "i", 18, 96.0, 7.5, 0.1, ir10, ir201
 event_i "i", 18, 103.5, 1.5, 0.1, ir14, ir201
 event_i "i", 18, 105.0, 10.5, 0.1, ir10, ir201
 event_i "i", 18, 115.5, 1.5, 0.1, ir14, ir201
 event_i "i", 18, 117.0, 3.0, 0.1, ir10, ir201
 event_i "i", 18, 96.0, 3.0, 0.1, ir24, ir201
 event_i "i", 18, 99.0, 3.0, 0.1, ir28, ir201
 event_i "i", 18, 102.0, 3.0, 0.1, ir32, ir201
 event_i "i", 18, 105.0, 3.0, 0.1, ir28, ir201
 event_i "i", 18, 108.0, 9.0, 0.1, ir24, ir201
 event_i "i", 18, 117.0, 3.0, 0.1, ir28, ir201
 event_i "i", 18, 96.0, 1.5, 0.1, ir42, ir201
 event_i "i", 18, 97.5, 1.5, 0.1, ir46, ir201
 event_i "i", 18, 99.0, 10.5, 0.1, ir42, ir201
 event_i "i", 18, 109.5, 1.5, 0.1, ir52, ir201
 event_i "i", 18, 111.0, 3.0, 0.1, ir46, ir201
 event_i "i", 18, 114.0, 6.0, 0.1, ir42, ir201
krl0 = 2.0
kr0 = krl0
S243 sprintf "alive_%d", ir201
 chnset kr0, S243
ir246 FreePort 
 event_i "i", 19, 120.0, 24.0, ir246, ir1
 event_i "i", 18, 120.0, 7.5, 0.1, ir10, ir246
 event_i "i", 18, 127.5, 1.5, 0.1, ir14, ir246
 event_i "i", 18, 129.0, 10.5, 0.1, ir10, ir246
 event_i "i", 18, 139.5, 1.5, 0.1, ir14, ir246
 event_i "i", 18, 141.0, 3.0, 0.1, ir10, ir246
 event_i "i", 18, 120.0, 3.0, 0.1, ir24, ir246
 event_i "i", 18, 123.0, 3.0, 0.1, ir28, ir246
 event_i "i", 18, 126.0, 3.0, 0.1, ir32, ir246
 event_i "i", 18, 129.0, 3.0, 0.1, ir28, ir246
 event_i "i", 18, 132.0, 9.0, 0.1, ir24, ir246
 event_i "i", 18, 141.0, 3.0, 0.1, ir28, ir246
 event_i "i", 18, 120.0, 1.5, 0.1, ir42, ir246
 event_i "i", 18, 121.5, 1.5, 0.1, ir46, ir246
 event_i "i", 18, 123.0, 10.5, 0.1, ir42, ir246
 event_i "i", 18, 133.5, 1.5, 0.1, ir52, ir246
 event_i "i", 18, 135.0, 3.0, 0.1, ir46, ir246
 event_i "i", 18, 138.0, 6.0, 0.1, ir42, ir246
krl0 = 2.0
kr0 = krl0
S288 sprintf "alive_%d", ir246
 chnset kr0, S288
ir291 FreePort 
 event_i "i", 19, 144.0, 24.0, ir291, ir1
 event_i "i", 18, 144.0, 7.5, 0.1, ir10, ir291
 event_i "i", 18, 151.5, 1.5, 0.1, ir14, ir291
 event_i "i", 18, 153.0, 10.5, 0.1, ir10, ir291
 event_i "i", 18, 163.5, 1.5, 0.1, ir14, ir291
 event_i "i", 18, 165.0, 3.0, 0.1, ir10, ir291
 event_i "i", 18, 144.0, 3.0, 0.1, ir24, ir291
 event_i "i", 18, 147.0, 3.0, 0.1, ir28, ir291
 event_i "i", 18, 150.0, 3.0, 0.1, ir32, ir291
 event_i "i", 18, 153.0, 3.0, 0.1, ir28, ir291
 event_i "i", 18, 156.0, 9.0, 0.1, ir24, ir291
 event_i "i", 18, 165.0, 3.0, 0.1, ir28, ir291
 event_i "i", 18, 144.0, 1.5, 0.1, ir42, ir291
 event_i "i", 18, 145.5, 1.5, 0.1, ir46, ir291
 event_i "i", 18, 147.0, 10.5, 0.1, ir42, ir291
 event_i "i", 18, 157.5, 1.5, 0.1, ir52, ir291
 event_i "i", 18, 159.0, 3.0, 0.1, ir46, ir291
 event_i "i", 18, 162.0, 6.0, 0.1, ir42, ir291
krl0 = 2.0
kr0 = krl0
S333 sprintf "alive_%d", ir291
 chnset kr0, S333
ir336 FreePort 
 event_i "i", 19, 168.0, 24.0, ir336, ir1
 event_i "i", 18, 168.0, 7.5, 0.1, ir10, ir336
 event_i "i", 18, 175.5, 1.5, 0.1, ir14, ir336
 event_i "i", 18, 177.0, 10.5, 0.1, ir10, ir336
 event_i "i", 18, 187.5, 1.5, 0.1, ir14, ir336
 event_i "i", 18, 189.0, 3.0, 0.1, ir10, ir336
 event_i "i", 18, 168.0, 3.0, 0.1, ir24, ir336
 event_i "i", 18, 171.0, 3.0, 0.1, ir28, ir336
 event_i "i", 18, 174.0, 3.0, 0.1, ir32, ir336
 event_i "i", 18, 177.0, 3.0, 0.1, ir28, ir336
 event_i "i", 18, 180.0, 9.0, 0.1, ir24, ir336
 event_i "i", 18, 189.0, 3.0, 0.1, ir28, ir336
 event_i "i", 18, 168.0, 1.5, 0.1, ir42, ir336
 event_i "i", 18, 169.5, 1.5, 0.1, ir46, ir336
 event_i "i", 18, 171.0, 10.5, 0.1, ir42, ir336
 event_i "i", 18, 181.5, 1.5, 0.1, ir52, ir336
 event_i "i", 18, 183.0, 3.0, 0.1, ir46, ir336
 event_i "i", 18, 186.0, 6.0, 0.1, ir42, ir336
krl0 = 2.0
kr0 = krl0
S378 sprintf "alive_%d", ir336
 chnset kr0, S378
ir381 FreePort 
 event_i "i", 19, 192.0, 24.0, ir381, ir1
 event_i "i", 18, 192.0, 7.5, 0.1, ir10, ir381
 event_i "i", 18, 199.5, 1.5, 0.1, ir14, ir381
 event_i "i", 18, 201.0, 10.5, 0.1, ir10, ir381
 event_i "i", 18, 211.5, 1.5, 0.1, ir14, ir381
 event_i "i", 18, 213.0, 3.0, 0.1, ir10, ir381
 event_i "i", 18, 192.0, 3.0, 0.1, ir24, ir381
 event_i "i", 18, 195.0, 3.0, 0.1, ir28, ir381
 event_i "i", 18, 198.0, 3.0, 0.1, ir32, ir381
 event_i "i", 18, 201.0, 3.0, 0.1, ir28, ir381
 event_i "i", 18, 204.0, 9.0, 0.1, ir24, ir381
 event_i "i", 18, 213.0, 3.0, 0.1, ir28, ir381
 event_i "i", 18, 192.0, 1.5, 0.1, ir42, ir381
 event_i "i", 18, 193.5, 1.5, 0.1, ir46, ir381
 event_i "i", 18, 195.0, 10.5, 0.1, ir42, ir381
 event_i "i", 18, 205.5, 1.5, 0.1, ir52, ir381
 event_i "i", 18, 207.0, 3.0, 0.1, ir46, ir381
 event_i "i", 18, 210.0, 6.0, 0.1, ir42, ir381
krl0 = 2.0
kr0 = krl0
S423 sprintf "alive_%d", ir381
 chnset kr0, S423
ir426 FreePort 
 event_i "i", 19, 216.0, 24.0, ir426, ir1
 event_i "i", 18, 216.0, 7.5, 0.1, ir10, ir426
 event_i "i", 18, 223.5, 1.5, 0.1, ir14, ir426
 event_i "i", 18, 225.0, 10.5, 0.1, ir10, ir426
 event_i "i", 18, 235.5, 1.5, 0.1, ir14, ir426
 event_i "i", 18, 237.0, 3.0, 0.1, ir10, ir426
 event_i "i", 18, 216.0, 3.0, 0.1, ir24, ir426
 event_i "i", 18, 219.0, 3.0, 0.1, ir28, ir426
 event_i "i", 18, 222.0, 3.0, 0.1, ir32, ir426
 event_i "i", 18, 225.0, 3.0, 0.1, ir28, ir426
 event_i "i", 18, 228.0, 9.0, 0.1, ir24, ir426
 event_i "i", 18, 237.0, 3.0, 0.1, ir28, ir426
 event_i "i", 18, 216.0, 1.5, 0.1, ir42, ir426
 event_i "i", 18, 217.5, 1.5, 0.1, ir46, ir426
 event_i "i", 18, 219.0, 10.5, 0.1, ir42, ir426
 event_i "i", 18, 229.5, 1.5, 0.1, ir52, ir426
 event_i "i", 18, 231.0, 3.0, 0.1, ir46, ir426
 event_i "i", 18, 234.0, 6.0, 0.1, ir42, ir426
krl0 = 2.0
kr0 = krl0
S468 sprintf "alive_%d", ir426
 chnset kr0, S468
krl0 = 20.0
kr0 = krl0
S475 sprintf "alive_%d", ir1
 chnset kr0, S475
S478 sprintf "p1_%d", ir1
ar0 chnget S478
S481 sprintf "p2_%d", ir1
ar1 chnget S481
 chnclear S478
 chnclear S481
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
ar2 delayr 5.0
ir13 = 0.25
ar3 deltap3 ir13
 delayw ar0
ar4 delayr 10.0
ir20 = 0.5
ar5 deltap3 ir20
ir23 = 3500.0
ar6 tone ar3, ir23
ar3 tone ar5, ir23
ar5 = (ar3 * 0.65)
ar7 = (ar6 + ar5)
 delayw ar7
ar5 delayr 10.0
ar7 deltap3 ir20
ar8 tone ar7, ir23
ar7 = (ar8 * 0.65)
ar9 = (ar1 + ar7)
 delayw ar9
ar7 delayr 0.125
ir41 = 0.125
ar9 deltap3 ir41
ar10 = (0.55 * ar0)
ar11 = (0.5 * ar0)
ar0 = (ar6 + ar3)
ar6 = (0.7 * ar8)
ar12 = (ar0 + ar6)
ar0 = (0.5 * ar12)
ar6 = (ar11 + ar0)
ar0 = (0.45 * ar6)
ar6 = (ar10 + ar0)
ar0 = (0.65 * ar9)
ar10 = (ar6 + ar0)
 delayw ar10
ar0 delayr 0.125
ar10 deltap3 ir41
ar11 = (0.55 * ar1)
ar12 = (0.5 * ar1)
ar1 = (0.7 * ar3)
ar3 = (ar8 + ar1)
ar1 = (0.5 * ar3)
ar3 = (ar12 + ar1)
ar1 = (0.45 * ar3)
ar3 = (ar11 + ar1)
ar1 = (0.65 * ar10)
ar8 = (ar3 + ar1)
 delayw ar8
arl0 init 0.0
ar1 = (0.7 * ar6)
ar8 = (ar9 * 1.0)
ar9 = (ar6 + ar8)
ar6 = (0.3 * ar9)
ar8 = (ar1 + ar6)
ar1 = (0.5 * ar8)
ar6 = (7.5 * ar8)
ar8 = (ar6 / 20.0)
ar6 tablei ar8, 46, 1.0, 0.5
ar8 = (2.1 * ar6)
ar6 = (0.5 * ar8)
ar8 = (ar1 + ar6)
ar1 = (0.75 * ar8)
ar6 = (0.7 * ar3)
ar9 = (ar10 * 1.0)
ar10 = (ar3 + ar9)
ar3 = (0.3 * ar10)
ar9 = (ar6 + ar3)
ar3 = (0.5 * ar9)
ar6 = (7.5 * ar9)
ar9 = (ar6 / 20.0)
ar6 tablei ar9, 46, 1.0, 0.5
ar9 = (2.1 * ar6)
ar6 = (0.5 * ar9)
ar9 = (ar3 + ar6)
ir100 = 0.9
ir101 = 12000.0
ar3, ar6 reverbsc ar8, ar9, ir100, ir101
ar10 = (ar8 + ar3)
ar3 = (0.25 * ar10)
ar8 = (ar1 + ar3)
arl0 = ar8
ar1 = arl0
S111 sprintf "p1_%d", p5
 chnmix ar1, S111
arl1 init 0.0
ar1 = (0.75 * ar9)
ar3 = (ar9 + ar6)
ar6 = (0.25 * ar3)
ar3 = (ar1 + ar6)
arl1 = ar3
ar1 = arl1
S125 sprintf "p2_%d", p5
 chnmix ar1, S125
endin

instr 18
irl0 init 2
irl1 init 587.33
if (p5 < 195.998) then
    if (p5 < 110.0) then
        if (p5 < 87.307) then
            if (p5 < 77.782) then
                irl0 = 4
                irl1 = 77.782
            else
                irl0 = 6
                irl1 = 87.307
            endif
        else
            if (p5 < 97.999) then
                irl0 = 8
                irl1 = 97.999
            else
                irl0 = 11
                irl1 = 110.0
            endif
        endif
    else
        if (p5 < 138.591) then
            if (p5 < 123.471) then
                irl0 = 13
                irl1 = 123.471
            else
                irl0 = 15
                irl1 = 138.591
            endif
        else
            if (p5 < 155.563) then
                irl0 = 17
                irl1 = 155.563
            else
                if (p5 < 174.614) then
                    irl0 = 19
                    irl1 = 174.614
                else
                    irl0 = 22
                    irl1 = 195.998
                endif
            endif
        endif
    endif
else
    if (p5 < 349.228) then
        if (p5 < 246.942) then
            if (p5 < 220.0) then
                irl0 = 24
                irl1 = 220.0
            else
                irl0 = 26
                irl1 = 246.942
            endif
        else
            if (p5 < 277.183) then
                irl0 = 28
                irl1 = 277.183
            else
                if (p5 < 311.127) then
                    irl0 = 31
                    irl1 = 311.127
                else
                    irl0 = 33
                    irl1 = 349.228
                endif
            endif
        endif
    else
        if (p5 < 440.0) then
            if (p5 < 391.995) then
                irl0 = 35
                irl1 = 391.995
            else
                irl0 = 37
                irl1 = 440.0
            endif
        else
            if (p5 < 493.883) then
                irl0 = 39
                irl1 = 493.883
            else
                if (p5 < 554.365) then
                    irl0 = 42
                    irl1 = 554.365
                else
                    irl0 = 2
                    irl1 = 587.33
                endif
            endif
        endif
    endif
endif
ir189 = irl0
ir191 = irl1
ir193 = 1.0
ir194 = rnd(ir193)
ir196 = rnd(ir193)
irl2 init 2
irl3 init 587.33
ir202 = (p5 / 2.0)
if (ir202 < 195.998) then
    if (ir202 < 110.0) then
        if (ir202 < 87.307) then
            if (ir202 < 77.782) then
                irl2 = 4
                irl3 = 77.782
            else
                irl2 = 6
                irl3 = 87.307
            endif
        else
            if (ir202 < 97.999) then
                irl2 = 8
                irl3 = 97.999
            else
                irl2 = 11
                irl3 = 110.0
            endif
        endif
    else
        if (ir202 < 138.591) then
            if (ir202 < 123.471) then
                irl2 = 13
                irl3 = 123.471
            else
                irl2 = 15
                irl3 = 138.591
            endif
        else
            if (ir202 < 155.563) then
                irl2 = 17
                irl3 = 155.563
            else
                if (ir202 < 174.614) then
                    irl2 = 19
                    irl3 = 174.614
                else
                    irl2 = 22
                    irl3 = 195.998
                endif
            endif
        endif
    endif
else
    if (ir202 < 349.228) then
        if (ir202 < 246.942) then
            if (ir202 < 220.0) then
                irl2 = 24
                irl3 = 220.0
            else
                irl2 = 26
                irl3 = 246.942
            endif
        else
            if (ir202 < 277.183) then
                irl2 = 28
                irl3 = 277.183
            else
                if (ir202 < 311.127) then
                    irl2 = 31
                    irl3 = 311.127
                else
                    irl2 = 33
                    irl3 = 349.228
                endif
            endif
        endif
    else
        if (ir202 < 440.0) then
            if (ir202 < 391.995) then
                irl2 = 35
                irl3 = 391.995
            else
                irl2 = 37
                irl3 = 440.0
            endif
        else
            if (ir202 < 493.883) then
                irl2 = 39
                irl3 = 493.883
            else
                if (ir202 < 554.365) then
                    irl2 = 42
                    irl3 = 554.365
                else
                    irl2 = 2
                    irl3 = 587.33
                endif
            endif
        endif
    endif
endif
ir387 = irl2
ir389 = irl3
ir391 = rnd(ir193)
ir393 = rnd(ir193)
arl4 init 0.0
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar0 upsamp kr0
ir398 = (p5 / 3500.0)
ir399 = (p4 - ir398)
ir400 = (0.6 + ir399)
kr0 linsegr 1.0, 1.0, 1.0, ir400, 0.0
ar1 upsamp kr0
ar2 = (ar0 * ar1)
ar0 = (1.2 * ar2)
kr0 = ftlen(ir189)
kr1 = (sr / kr0)
kr0 = (kr1 / ir191)
kr1 = (p5 * kr0)
ar2 poscil ir193, kr1, ir189, ir194
kr0 = (p5 / 2.0)
kr2 = ftlen(ir387)
kr3 = (sr / kr2)
kr2 = (kr3 / ir389)
kr3 = (kr0 * kr2)
ar3 poscil ir193, kr3, ir387, ir391
ar4 = (ar2 + ar3)
ar2 = (0.5 * ar4)
ar3 = (0.3 * p5)
ar4 = (ar3 + 2500.0)
kr0 linseg 0.0, 0.15, 1.0, 1.0, 1.0
ar3 upsamp kr0
ar5 = (ar3 * ar1)
ar1 = (2000.0 * ar5)
ar3 = (ar4 + ar1)
kr0 linseg 0.0, 0.75, 0.0, 0.5, 1.0, 1.0, 1.0
ar1 upsamp kr0
ar4 = (350.0 * ar1)
ir425 = 8.0
ar1 oscil3 ir193, ir425, 44
ar5 = (ar4 * ar1)
ar1 = (ar3 + ar5)
ir429 = 0.15
ar3 moogvcf ar2, ar1, ir429
ar2 = (ar3 * p4)
ar3 = (ar0 * ar2)
ar2 = (0.8 * ar3)
arl4 = ar2
ar2 = arl4
S438 sprintf "p1_%d", p6
 chnmix ar2, S438
arl5 init 0.0
ar2 poscil ir193, kr1, ir189, ir196
ar3 poscil ir193, kr3, ir387, ir393
ar4 = (ar2 + ar3)
ar2 = (0.5 * ar4)
ar3 moogvcf ar2, ar1, ir429
ar1 = (ar3 * p4)
ar2 = (ar0 * ar1)
ar0 = (0.8 * ar2)
arl5 = ar0
ar0 = arl5
S455 sprintf "p2_%d", p6
 chnmix ar0, S455
S458 sprintf "alive_%d", p6
kr0 chnget S458
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S458
endin

</CsInstruments>

<CsScore>

f46 0 2048 8  -0.9051482536448664 341.0 -0.7615941559557649 341.0 -0.46211715726000974 341.0 0.0 341.0 0.46211715726000974 341.0 0.7615941559557649 341.0 0.9051482536448664
f44 0 8192 10  1.0
f48 0 8192 19  0.5 1.0 180.0 1.0
f4 0 262144 "padsynth"  77.782 10.0 1.0 1.0 1.0 1.0 7.955530085959886e-2 0.17107392550143266 0.2957936962750716 0.5169707736389685 0.671257306590258 1.0 0.8518131805157593 0.6958085959885387 0.6350361031518624 0.6469031518624642 0.5092160458452721 0.44205845272206307 0.37355873925501437 0.3562888252148997 0.32577077363896845 0.24549914040114612 0.2066212034383954 0.1975002865329513 0.191832664756447 0.1694727793696275 0.14186246418338108 0.12891690544412607 8.901318051575931e-2 7.074040114613181e-2 5.213295128939828e-2 4.579140401146131e-2 2.3848710601719197e-2 3.169627507163324e-2 2.9102578796561602e-2 2.221432664756447e-2 1.8406876790830945e-2 2.0393123209169056e-2 2.5951862464183382e-2 2.2668194842406876e-2 1.5864756446991403e-2 1.669111747851003e-2 1.5416618911174785e-2 1.2984527220630373e-2 1.4308309455587392e-2 1.3094555873925502e-2 1.3541547277936963e-2 1.2307163323782235e-2 1.0927220630372493e-2 1.0143266475644699e-2 9.031518624641834e-3 6.395415472779369e-3 3.936962750716332e-3 4.860744985673352e-3 6.325501432664756e-3 6.213180515759312e-3 6.528366762177651e-3 5.720343839541547e-3 4.7977077363896845e-3 3.652722063037249e-3 3.230945558739255e-3 2.9455587392550144e-3 2.8137535816618914e-3 2.216618911174785e-3 2.3564469914040113e-3 2.623495702005731e-3 1.9770773638968482e-3 1.495702005730659e-3 1.503724928366762e-3 1.422349570200573e-3 6.326647564469913e-4 1.2722063037249286e-4 5.891117478510028e-4 8.194842406876791e-4 5.363896848137535e-4 9.237822349570201e-4 1.059025787965616e-3 9.146131805157593e-4 9.283667621776504e-4 1.1220630372492835e-3 1.230945558739255e-3 8.378223495702005e-4 5.237822349570201e-4 4.2636103151862467e-4 4.6876790830945557e-4 6.212034383954154e-4 5.203438395415473e-4 4.3667621776504297e-4 3.816618911174785e-4 3.2206303724928366e-4 4.446991404011461e-4 3.805157593123209e-4 5.29512893982808e-4 4.194842406876791e-4 3.713467048710602e-4 4.401146131805157e-4 2.6017191977077366e-4 1.9255014326647563e-4 1.7650429799426933e-4 1.329512893982808e-4 1.822349570200573e-4 1.6733524355300858e-4 1.5587392550143268e-4 9.512893982808023e-5 1.2263610315186248e-4 7.449856733524355e-5 6.303724928366763e-5 1.5587392550143268e-4 1.6962750716332378e-4 9.8567335243553e-5 5.386819484240687e-5 7.335243553008597e-5 5.730659025787966e-5 4.813753581661891e-5 2.2922636103151864e-5 7.220630372492837e-5 5.6160458452722065e-5 9.512893982808023e-5 8.022922636103152e-5 6.074498567335244e-5 8.022922636103152e-5 1.2492836676217766e-4 1.0888252148997134e-4 2.7507163323782232e-5 1.856733524355301e-4 1.0085959885386819e-4 9.283667621776506e-5 7.335243553008597e-5 8.595988538681948e-5 4.2406876790830946e-5 8.481375358166189e-5 5.959885386819485e-5 7.449856733524355e-5 5.5014326647564465e-5 6.53295128939828e-5
f6 0 262144 "padsynth"  87.307 10.0 1.0 1.0 1.0 1.0 0.1162144420131291 0.27681345733041574 0.6269939824945295 0.7611788840262582 0.9934053610503282 1.0 0.9265672866520789 0.765511487964989 0.6922948577680526 0.5825382932166303 0.45081783369803063 0.43519420131291026 0.3392696936542669 0.21603665207877462 0.1827324945295405 0.15161105032822755 0.12433533916849016 9.786378555798687e-2 8.62089715536105e-2 6.351750547045952e-2 5.338347921225382e-2 4.3388949671772425e-2 2.386487964989059e-2 7.62308533916849e-3 8.462800875273523e-3 7.4261487964989055e-3 7.073304157549234e-3 8.24124726477024e-3 8.24671772428884e-3 7.286652078774617e-3 6.293763676148797e-3 6.386761487964989e-3 4.811269146608315e-3 5.032822757111597e-3 3.4655361050328227e-3 3.1208971553610505e-3 2.8555798687089715e-3 2.5738512035010943e-3 1.9420131291028445e-3 1.8298687089715537e-3 1.813457330415755e-3 1.739606126914661e-3 1.0831509846827134e-3 8.014223194748359e-4 4.5678336980306344e-4 3.8566739606126914e-4 1.777899343544858e-4 3.4463894967177246e-4 3.2822757111597374e-4 8.670678336980307e-4 4.6772428884026256e-4 6.208971553610503e-4 5.142231947483588e-4 3.7199124726477025e-4 2.297592997811816e-4 7.932166301969365e-5 5.990153172866521e-4 4.266958424507659e-4 3.7472647702407007e-4 1.449671772428884e-4 4.786652078774617e-4 4.896061269146608e-4 1.6411378555798687e-4 1.0940919037199125e-5 4.2943107221006565e-4 3.172866520787746e-4 5.74398249452954e-5 3.5284463894967176e-4 2.5164113785557986e-4 1.4770240700218818e-4 2.024070021881838e-4 2.735229759299781e-4 1.449671772428884e-4 1.2582056892778993e-4 2.8172866520787747e-4 2.9540481400437636e-4 1.3402625820568929e-4 1.312910284463895e-4 2.297592997811816e-4 1.9146608315098466e-4 1.6137855579868708e-4 2.8719912472647706e-4 3.036105032822757e-4 1.887308533916849e-4 1.0393873085339169e-4 2.1608315098468273e-4 3.7199124726477025e-4 6.291028446389496e-5 1.312910284463895e-4 1.6684901531728664e-4 1.4223194748358862e-4 1.3676148796498906e-5 1.777899343544858e-4 2.0514223194748358e-4 1.5043763676148798e-4 9.026258205689278e-5 2.297592997811816e-4 1.6958424507658643e-4 1.887308533916849e-4 1.6684901531728664e-4 1.8599562363238512e-4 1.1214442013129102e-4 1.9693654266958425e-4 1.3676148796498906e-5 6.564551422319475e-5 1.4223194748358862e-4 1.2308533916849016e-4 1.9693654266958425e-4 3.309628008752735e-4 1.6137855579868708e-4 8.479212253829322e-5 2.4343544857768052e-4 1.3402625820568929e-4 2.4070021881838076e-4 2.297592997811816e-4
f8 0 262144 "padsynth"  97.999 10.0 1.0 1.0 1.0 1.0 0.11371806781235486 0.30113330236878777 0.6011797491871806 0.8069136089177892 1.0 0.8977798420808175 0.8037714816535068 0.7108522991175105 0.6102322340919647 0.4888597306084534 0.3938875986994891 0.2707477937761263 0.1776637250348351 0.15085694379934975 0.10363446353924756 9.685322805387832e-2 7.241058987459359e-2 5.0585229911751045e-2 3.009057129586623e-2 1.7823966558290757e-2 8.502090106827682e-3 9.152345564328843e-3 8.620529493729679e-3 3.8295401764979094e-3 3.5926614026939156e-3 3.5601486298188576e-3 4.024616813748258e-3 3.5926614026939156e-3 3.903855085926614e-3 2.666047375754761e-3 2.227124941941477e-3 1.7115652577798421e-3 2.261960055736182e-3 2.0181142591732463e-3 1.3190896423594983e-3 1.2145843009753832e-3 6.456107756618671e-4 5.689735253135161e-4 1.144914073385973e-3 1.5234556432884346e-3 1.8996748722712494e-3 7.942405945192754e-4 8.337203901532744e-4 2.0784951230840686e-3 2.1551323734324197e-3 1.1007895959126801e-3 1.3121226196005575e-3 1.2378077101718532e-3 7.617278216442173e-4 7.965629354389225e-4 6.456107756618671e-4 6.01486298188574e-4 8.964235949837436e-4 9.057129586623316e-4 6.665118439386903e-4 7.477937761263354e-4 6.247097073850441e-4 7.803065490013934e-4 5.898745935903391e-4 3.8550859266140266e-4 1.4398513701811426e-4 2.4384579656293545e-4 3.0887134231305155e-4 1.068276823037622e-4 8.592661402693915e-5 1.114723641430562e-4 2.3920111472364142e-4 1.4398513701811426e-4 2.0436600092893636e-4 3.762192289828147e-4 3.5299581978634465e-4 5.15559684161635e-4 3.6692986530422665e-4 2.531351602415235e-4 3.181607059916396e-4 5.132373432419879e-4 2.4152345564328845e-4 4.458894565722248e-4 3.460287970274036e-4 9.521597770552716e-5 2.531351602415235e-4 7.663725034835114e-5 1.4862981885740826e-4 3.599628425452857e-4 2.879702740362285e-4 3.692522062238737e-4 2.229447282861124e-4 2.2991175104505342e-4 1.672085462145843e-4 2.0204366000928936e-4 2.113330236878774e-4 1.718532280538783e-4 9.057129586623316e-5 1.695308871342313e-4 1.3934045517882026e-4 1.8578727357176035e-4 8.360427310729215e-5 7.663725034835114e-5 7.199256850905713e-5 2.3223409196470042e-4 1.4862981885740826e-4 7.431490942870413e-5
f11 0 262144 "padsynth"  110.0 10.0 1.0 1.0 1.0 1.0 0.17242977528089887 0.49266619850187265 0.8095926966292135 0.9818960674157303 1.0 0.8230969101123595 0.7416549625468165 0.6047659176029963 0.5036142322097379 0.4072940074906367 0.2440449438202247 0.1646512172284644 0.15108614232209738 0.10873361423220973 7.822565543071161e-2 6.355571161048688e-2 3.9606741573033705e-2 2.364934456928839e-2 1.3497191011235954e-2 1.2574906367041198e-2 9.878277153558053e-3 6.128277153558052e-3 9.150280898876406e-3 6.6268726591760295e-3 5.088951310861423e-3 3.2818352059925094e-3 2.5117041198501875e-3 2.6544943820224717e-3 2.3923220973782774e-3 2.1652621722846443e-3 1.2289325842696629e-3 7.982209737827715e-4 4.915730337078652e-4 7.771535580524344e-4 7.5374531835206e-4 2.0599250936329587e-4 2.3876404494382024e-4 1.4747191011235956e-4 1.2406367041198504e-4 6.062734082397003e-4 1.100187265917603e-4 2.0599250936329587e-4 8.661048689138577e-5 8.661048689138577e-5 1.9662921348314607e-4 1.1938202247191012e-4 1.638576779026217e-4 1.8726591760299626e-5 1.2406367041198504e-4 2.247191011235955e-4 6.788389513108614e-5 1.9194756554307115e-4 5.852059925093633e-5 1.638576779026217e-4 1.0767790262172285e-4 2.8089887640449436e-5 2.3408239700374533e-5 3.5112359550561794e-5 1.4747191011235956e-4 2.3174157303370788e-4 2.7855805243445693e-4 1.2640449438202248e-4 1.942883895131086e-4 2.504681647940075e-4 2.0599250936329587e-4 4.377340823970038e-4 3.9559925093632955e-4 2.4812734082397007e-4 2.294007490636704e-4 1.2874531835205993e-4 3.1132958801498127e-4 4.2368913857677905e-4 3.6985018726591763e-4 2.6685393258426963e-4 2.4110486891385768e-4 2.691947565543071e-4 2.3174157303370788e-4 1.1235955056179774e-4 1.802434456928839e-4 5.149812734082397e-5 6.320224719101124e-5 1.7556179775280898e-4 1.638576779026217e-4 9.597378277153558e-5 1.053370786516854e-4 1.942883895131086e-4 1.9194756554307115e-4 2.5749063670411984e-5 2.106741573033708e-4 2.200374531835206e-4
f13 0 262144 "padsynth"  123.471 10.0 1.0 1.0 1.0 1.0 0.2121833480956599 0.6229229406554473 0.7733635961027459 1.0 0.8322918511957484 0.739789636846767 0.5531864481842338 0.4457528786536758 0.3902480070859167 0.26134189548272807 0.18309344552701506 0.13649247121346322 9.841895482728077e-2 6.4174047829938e-2 4.0101860053144374e-2 2.195748449955713e-2 9.53941541186891e-3 1.3768821966341896e-2 8.939326837909654e-3 7.573073516386183e-3 7.586359610274579e-3 5.617803365810452e-3 5.024357838795394e-3 3.6337466784765278e-3 2.4158547387068204e-3 2.4822852081488045e-3 2.0726306465899025e-3 1.79140832595217e-3 1.0717449069973428e-3 8.281665190434013e-4 1.5389725420726307e-3 7.905225863596103e-4 6.00088573959256e-4 2.325066430469442e-4 3.520814880425155e-4 3.033658104517272e-4 2.1700620017714792e-4 1.771479185119575e-4 1.5943312666076174e-4 1.550044286979628e-5 6.643046944198405e-5 1.1957484499557131e-4 1.2400354295837024e-4 1.483613817537644e-4 9.300265721877768e-5 1.9486271036315322e-4 2.103631532329495e-4 8.193091231178033e-5 2.657218777679362e-5 5.093002657218778e-5 3.100088573959256e-5 1.1514614703277236e-4 1.3728963684676705e-4 6.421612046058458e-5 1.7050487156775908e-4 1.4614703277236494e-4 1.3507528786536757e-4 4.650132860938884e-5 7.971656333038087e-5 1.550044286979628e-4 1.7050487156775908e-4 1.0186005314437556e-4 3.3215234720992025e-5 2.3029229406554473e-4 5.757307351638618e-5 3.100088573959256e-5 9.743135518157661e-5 4.8715677590788305e-5 8.41452612931798e-5 8.635961027457928e-5 2.103631532329495e-4 2.1700620017714792e-4 3.365810451727192e-4 9.743135518157661e-5 2.258635961027458e-4 1.616474756421612e-4 1.904340124003543e-4 7.307351638618247e-5 1.41718334809566e-4 5.9787422497785654e-5
f15 0 262144 "padsynth"  138.591 10.0 1.0 1.0 1.0 1.0 0.23043554773427188 0.6242410910690718 1.0 0.8554861416630004 0.6396172459304883 0.5116344038715354 0.4244610646722393 0.29865816102067755 0.19071271447426308 0.1496480422349318 0.12175758908930928 7.521997360316762e-2 4.647162340519138e-2 3.197096348438187e-2 1.5767707875054996e-2 1.661020677518698e-2 9.472063352397713e-3 9.06291245050594e-3 9.069511658600968e-3 5.954685437747471e-3 4.100307963044435e-3 4.392872855257369e-3 4.025516937967444e-3 3.570171579410471e-3 2.91684997800264e-3 1.2736471623405192e-3 2.0875494940607127e-3 1.4672239331280246e-3 8.205015398152222e-4 3.1896172459304885e-4 4.2894852617685877e-4 4.2454905411350635e-4 2.001759788825341e-4 2.2657281126264847e-4 2.0897492300923887e-4 1.0558732952045754e-4 7.259128904531456e-5 2.067751869775627e-4 1.4078310602727673e-4 6.379234491860976e-5 5.9392872855257375e-5 1.0118785745710515e-4 2.419709634843819e-5 1.1218653761548615e-4 8.798944126704795e-5 9.458864936207654e-5 1.2758468983721952e-4 4.6194456665200174e-5 9.238891333040035e-5 8.139023317201936e-5 1.847778266608007e-4 1.5618125824901012e-4 1.913770347558293e-4 1.5618125824901012e-4 1.7817861856577212e-4 2.441706995160581e-4 3.7395512538495386e-5 2.8596568411790586e-5 1.4738231412230534e-4 1.1658600967883854e-4 2.2657281126264847e-4 1.2098548174219095e-4 1.253849538055433e-4 1.1218653761548615e-4 5.719313682358117e-5 5.0593928728552574e-5 8.798944126704795e-5 1.539815222173339e-4 9.678838539375275e-5 1.6058073031236252e-4 1.4518257809062912e-4 5.279366476022877e-5
f17 0 262144 "padsynth"  155.563 10.0 1.0 1.0 1.0 1.0 0.3059004843681198 0.6364420959929546 1.0 0.5811889035667107 0.3572523117569353 0.2516380449141348 0.16450022016732715 8.398062527520916e-2 5.73447820343461e-2 3.4544253632760896e-2 1.6922060766182297e-2 8.643769264641128e-3 3.2540730955526198e-3 1.8053720827829148e-3 1.6512549537648614e-3 1.0479964773227653e-3 5.239982386613827e-4 4.711580801409071e-4 5.856450902686042e-4 7.926023778071334e-5 2.3337736679876709e-4 2.686041391457508e-4 2.8621752531924266e-4 4.6675473359753417e-4 2.2016732716864817e-4 3.522677234698371e-4 2.0255394099515632e-4 8.806693086745927e-6 9.687362395420519e-5 1.541171290180537e-4 1.7173051519154558e-4 3.3465433729634524e-4 7.485689123734039e-5 1.7613386173491856e-4 2.3778071334214004e-4 4.8436811977102595e-5 1.4971378247468077e-4 2.553940995156319e-4 2.2457067371202115e-4 1.1008366358432408e-4 2.686041391457508e-4 2.9942756494936155e-4 5.7243505063848526e-5 3.3025099075297226e-4 1.7173051519154558e-4 8.366358432408631e-5 3.3025099075297226e-4 3.214442976662263e-4 3.963011889035667e-5 3.6547776309995596e-4 1.9374724790841038e-4 2.8621752531924266e-4 2.157639806252752e-4 6.605019815059445e-5 1.23293703214443e-4 7.485689123734039e-5 7.485689123734039e-5 1.0568031704095111e-4 5.284015852047556e-5 1.0568031704095111e-4 6.605019815059445e-5 8.366358432408631e-5 3.082342580361075e-5 1.453104359313078e-4
f19 0 262144 "padsynth"  174.614 10.0 1.0 1.0 1.0 1.0 0.3736290909090909 0.8990036363636363 1.0 0.6724242424242424 0.4155418181818182 0.283180606060606 0.16264 0.10162424242424242 5.727030303030303e-2 3.0186666666666667e-2 1.3447272727272728e-2 3.844848484848485e-3 3.6581818181818182e-3 2.2036363636363638e-3 1.9878787878787876e-3 2.3345454545454546e-3 1.7333333333333335e-3 1.372121212121212e-3 6.206060606060606e-4 3.757575757575758e-4 1.7454545454545454e-4 5.842424242424243e-4 9.939393939393939e-5 1.3818181818181816e-4 1.3090909090909093e-4 1.2606060606060608e-4 1.793939393939394e-4 1.0909090909090909e-4 2.1333333333333333e-4 2.4e-4 4.2424242424242425e-4 4.0727272727272726e-4 4.3151515151515154e-4 1.1636363636363636e-4 3.854545454545455e-4 3.1272727272727273e-4 3.3212121212121214e-4 5.430303030303031e-4 3.272727272727273e-4 2.4242424242424242e-4 2.739393939393939e-4 2.812121212121212e-4 2.690909090909091e-4 3.1515151515151515e-4 3.563636363636364e-4 1.793939393939394e-4 1.0181818181818181e-4 8.727272727272727e-5 2.1575757575757577e-4 8.0e-5 3.151515151515152e-5 4.606060606060606e-5 1.5515151515151516e-4 4.606060606060606e-5 2.690909090909091e-4 2.0363636363636363e-4 1.721212121212121e-4
f22 0 262144 "padsynth"  195.998 10.0 1.0 1.0 1.0 1.0 0.35587043760749093 1.0 0.7936575578062297 0.48202369577680104 0.3170781578444487 0.19812918020256065 0.11329638830498757 7.060577106822091e-2 3.213644181158035e-2 1.017198547678196e-2 3.2677240588572525e-3 3.1052933307854002e-3 2.0600038218994837e-3 1.8612650487292185e-3 1.1408369959870054e-3 6.879419071278425e-4 6.497229122874068e-4 9.287215746225874e-4 7.242499522262564e-4 6.994076055799733e-4 2.3313586852665775e-4 4.204089432447927e-4 4.108541945346837e-4 3.9174469711446584e-4 9.554748710108924e-5 3.6308045098413914e-5 1.8154022549206954e-4 1.299445824574814e-4 1.24211733231416e-4 5.159564303458819e-5 2.1402637110643993e-4 2.1402637110643993e-4 2.3504681826867953e-4 9.936938658513282e-5 7.261609019682783e-5 1.394993311675903e-4 1.2038983374737244e-4 1.261226829734378e-4 7.261609019682783e-5 5.923944200267533e-5 1.3376648194152492e-4 8.599273839098032e-5 3.057519587234856e-5 1.0510223581119818e-4 1.261226829734378e-4 9.363653735906745e-5 5.159564303458819e-5 3.057519587234856e-5 4.968469329256641e-5 6.879419071278425e-5 7.834893942289317e-5
f24 0 262144 "padsynth"  220.0 10.0 1.0 1.0 1.0 1.0 0.38361740857190135 1.0 0.7839682277014729 0.46777097468144957 0.294204865133212 0.1448370014893265 0.11323183849081582 5.6415687572397816e-2 2.1783882177726293e-2 7.706437200066192e-3 5.391361906337912e-3 6.0565944067516135e-3 3.935131557173589e-3 2.0817474764189972e-3 1.7756081416514977e-3 1.0756246897236472e-3 6.883998014231343e-4 3.359258646367698e-4 4.0377296045010757e-4 4.1039218930994536e-4 2.250537812344862e-4 2.515306966738375e-4 3.6902200893595895e-4 3.5743835843124276e-4 4.832037067681615e-4 2.962104914777429e-4 1.5389707099122953e-4 3.2765182856197254e-4 2.399470461691213e-4 2.0519609465497268e-4 2.598047327486348e-4 2.6145953996359426e-4 3.094489491974185e-4 4.964421644878371e-4 4.2032103259970216e-4 2.796624193281483e-4 3.590931656462022e-4 3.624027800761211e-4 3.5412874400132387e-4 3.259970213470131e-4 2.829720337580672e-4 2.8131722654310774e-4 2.697335760383915e-4 1.9526725136521594e-4 2.9952010590766177e-4
f26 0 262144 "padsynth"  246.942 10.0 1.0 1.0 1.0 1.0 0.5562110616656072 1.0 0.6582114854842127 0.285045560500106 0.15154058063148973 8.871794871794872e-2 3.595677050222505e-2 1.445645263827082e-2 7.217630853994491e-3 3.8503920322102143e-3 3.1892350074168257e-3 1.981351981351981e-3 1.2036448400084762e-3 1.1400720491629582e-3 6.336088154269973e-4 8.412799321890231e-4 2.394575121847849e-4 4.789150243695698e-4 3.157448611994067e-4 2.1826658190294553e-4 1.822420004238186e-4 1.8012290739563466e-4 2.924348378893833e-4 3.793176520449248e-4 8.900190718372537e-5 1.8012290739563466e-4 1.8012290739563466e-4 1.1655011655011656e-4 2.2462386098749736e-4 2.924348378893833e-4 3.4965034965034965e-4 2.71243907607544e-4 8.052553507098962e-5 1.419792328883238e-4 6.145369781733417e-5 1.9707565162110617e-4 1.9707565162110617e-4 1.3774104683195594e-4 1.7376562831108284e-4 1.8648018648018648e-4
f28 0 262144 "padsynth"  277.183 10.0 1.0 1.0 1.0 1.0 0.601318795430945 1.0 0.5893544479058498 0.325392869505019 0.16508480443059884 9.521114572516441e-2 3.372101073035653e-2 8.181031498788509e-3 8.79196953963309e-3 7.287988923502942e-3 4.305988231221876e-3 2.7102803738317757e-3 1.4814814814814816e-3 1.1163032191069575e-3 3.8421599169262725e-4 2.4922118380062304e-4 2.4402907580477673e-4 5.5382485289027346e-5 2.717203184492904e-4 4.655590169608861e-4 5.088265835929387e-4 2.1114572516441675e-4 2.8383523710626515e-4 2.8729664243682936e-4 2.0941502249913465e-4 2.5614399446175146e-4 1.626860505365178e-4 8.999653859466944e-5 8.999653859466944e-5 2.7691242644513673e-5 5.711318795430945e-5 3.461405330564209e-5 6.230529595015576e-5 1.644167532017999e-4 5.1921079958463136e-5
f31 0 262144 "padsynth"  311.127 10.0 1.0 1.0 1.0 1.0 0.7372781299524565 1.0 0.6055764659270998 0.27101822503961964 0.14341917591125197 3.829437400950872e-2 1.4857369255150554e-2 7.187004754358162e-3 7.809033280507132e-3 3.4469096671949284e-3 2.0602218700475437e-3 1.95919175911252e-3 1.1984944532488113e-3 8.161648177496038e-4 7.884310618066561e-4 5.54675118858954e-4 3.189381933438986e-4 3.565768621236133e-4 1.327258320126783e-4 1.60459587955626e-4 1.822503961965135e-4 2.3771790808240886e-4 2.3573692551505544e-4 3.724247226624406e-4 3.328050713153724e-4 2.476228209191759e-4 1.8819334389857367e-4 1.0499207606973059e-4 2.2187004754358164e-4 1.406497622820919e-4 2.614896988906498e-4 1.7828843106180666e-4
f33 0 262144 "padsynth"  349.228 10.0 1.0 1.0 1.0 1.0 0.9458879694462127 1.0 0.4464035646085296 0.20215573944409082 9.628474432420964e-2 2.1464035646085296e-2 6.53723742838956e-3 1.0413749204328453e-2 5.5548482919584126e-3 4.1778060683216635e-3 2.2109060046679395e-3 1.2094207511139403e-3 4.010184595798854e-4 3.67069806917038e-4 3.1190324633991086e-4 2.737110120942075e-4 3.9040950562274564e-4 1.20942075111394e-4 4.3921069382558877e-4 3.819223424570337e-5 1.2942923827710586e-4 1.5913430935709738e-4 1.888393804370889e-4 1.2518565669424994e-4 1.357946106513898e-4 1.8671758964566095e-4 2.3551877784850416e-4 2.970507107999151e-4
f35 0 262144 "padsynth"  391.995 10.0 1.0 1.0 1.0 1.0 1.0 0.5663148524923703 0.18639877924720244 5.508138351983723e-2 7.436419125127162e-3 2.0193285859613427e-3 2.0752797558494405e-3 5.010172939979654e-4 4.018311291963378e-4 2.5940996948118006e-4 2.924720244150559e-4 1.2716174974567651e-5 4.323499491353001e-5 1.7548321464903356e-4 2.5686673448626653e-4 1.0172939979654121e-4 1.5005086469989826e-4 1.2207527975584943e-4 1.9074262461851475e-4 8.138351983723296e-5 7.121057985757884e-5 6.103763987792471e-5 7.375381485249236e-5 3.306205493387589e-5 1.2461851475076296e-4
f37 0 262144 "padsynth"  440.0 10.0 1.0 1.0 1.0 1.0 1.0 0.3703244166192373 6.085372794536141e-2 1.1360273192942517e-2 2.2396129766647697e-3 2.797381900967558e-3 1.7928286852589642e-3 2.3107569721115538e-3 1.9578827546955038e-3 1.277746158224246e-3 4.410927717700626e-4 8.11041548093341e-4 9.41946499715424e-4 6.4314171883893e-4 7.057484348321002e-4 1.9351166761525328e-4 6.488332384746727e-4 5.293113261240752e-4 3.9271485486624925e-4 5.606146841206602e-4 4.012521343198634e-4 4.21172453044963e-4
f39 0 262144 "padsynth"  493.883 10.0 1.0 1.0 1.0 1.0 1.0 0.25630659618478513 6.1990347046655944e-2 1.133302689037003e-2 1.7766030797517812e-3 9.285221788094691e-4 8.986439898873822e-4 1.0940013789933348e-3 4.389795449321995e-4 3.5623994484026663e-4 7.998161342220179e-4 3.7922316708802575e-4 3.7462652263847387e-4 2.757986669731096e-4 3.861181337623535e-4 1.6088255573431395e-4 2.9418524477131696e-4 3.516433003907148e-4 5.30912433923236e-4 2.1144564467938406e-4
f42 0 262144 "padsynth"  554.365 10.0 1.0 1.0 1.0 1.0 1.0 0.2520795779292152 6.065728731589361e-2 1.2233457902835788e-2 3.343591998241372e-3 1.3343591998241373e-3 8.551329962629149e-4 4.616399208617278e-5 7.254341613541438e-5 2.967685205539679e-4 2.769839525170367e-4 2.769839525170367e-4 3.363376566278303e-4 2.8138052319191033e-4 1.5387997362057595e-4 1.6487140030775995e-4 1.7146625632007034e-4
f2 0 262144 "padsynth"  587.33 10.0 1.0 1.0 1.0 1.0 1.0 0.13590473244664397 1.985153108567894e-2 4.837612124961336e-3 8.38230745437674e-4 1.0021651716671822e-3 3.3714815960408294e-4 2.567274976801732e-4 2.0105165480977422e-4 1.4846891432106403e-4 1.7012063099288588e-4 2.8765852149706156e-4 7.114135477884319e-5 1.6084132384781936e-4 9.279307145066501e-5 2.196102690999072e-4

f0 604800.0

i 30 0.0 -1.0 
i 29 0.0 -1.0 
i 27 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>