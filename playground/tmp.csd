<CsoundSynthesizer>

<CsOptions>

--output=dac --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr 23

endin

instr 22
 event_i "i", 21, 604800.0, 1.0e-2
endin

instr 21
 turnoff2 20, 0.0, 0.0
 turnoff2 19, 0.0, 0.0
 turnoff2 18, 0.0, 0.0
 exitnow 
endin

instr 20
ir1 = 8.5e-2
kr0 = birnd(ir1)
ir4 = 8.5e-3
kr1 = birnd(ir4)
 xtratim 0.1
ir9 = 9.0e-2
kr2 = birnd(ir9)
arl0 init 0.0
ar0 subinstr 19
ir16 = 1.0
ar1 upsamp k(ir16)
ir17 = 0.0
ir18 = 90.0
ir19 = 100.0
ar2 compress ar0, ar1, ir17, ir18, ir18, ir19, ir17, ir17, 0.0
ar0 = (ar2 * 0.8)
arl0 = ar0
ar0 = arl0
 out ar0
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
 chnclear S18
arl1 init 0.0
arl1 = ar0
ar0 = arl1
 out ar0
kr0 = krl0
S33 sprintf "alive_%d", ir3
 chnset kr0, S33
endin

instr 18
arl0 init 0.0
ir3 = 8.5e-2
ir4 = birnd(ir3)
ir5 = (ir4 * 0.43)
ir6 = (0.43 + ir5)
kr0 transeg 1.0, ir6, -14.0, 0.0, 1.0, 0.0, 0.0
ar0 upsamp kr0
ar1 = (ar0 * 225.0)
kr0 linsegr 1.0, 1.0, 1.0, ir6, 0.0
ar0 upsamp kr0
ar2 = (ar1 * ar0)
ir11 = 1.0
ir12 = 0.0
ar0 mpulse ir11, ir12
ir14 = 8.5e-3
kr0 = birnd(ir14)
kr1 = (kr0 * 64.0)
kr0 = (64.0 + kr1)
kr1 = (kr0 * 1.0e-3)
ar1 reson ar0, kr0, kr1, 2.0
ir20 = 500.0
ar0 tone ar1, ir20
ar1 = (ar2 * ar0)
ir23 = 9.0e-2
kr0 = birnd(ir23)
ar0 upsamp kr0
ar2 = (1.0 + ar0)
ar0 = (ar1 * ar2)
ar1 = (0.5 * ar0)
arl0 = ar1
ar0 = arl0
S32 sprintf "p1_%d", p4
 chnmix ar0, S32
S35 sprintf "alive_%d", p4
kr0 chnget S35
if (kr0 < -10.0) then
     turnoff 
endif
kr1 = (kr0 - 1.0)
 chnset kr1, S35
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 23 0.0 -1.0 
i 22 0.0 -1.0 
i 20 0.0 -1.0 

</CsScore>



</CsoundSynthesizer>