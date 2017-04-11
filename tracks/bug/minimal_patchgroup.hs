import Csound.Base
import Csound.Patch

raw_instr (amp, cps) = 
   let signal = saw (sig cps)
       aout = sig amp * moogvcf signal (expseg [3000,1,50]) 0.8
       in return (aout, aout)
       
patch1 = avatara 1 -- polySynt raw_instr
patch2 = polySynth -- polySynt raw_instr
patch3 = FxChain [FxSpec 0.75 (return . smallHall2)] $ polySynt raw_instr
patch4 = razorPad

melody1 = mix $ atSco patch1 $ mel $ (map temp [(0.1,110),(0.5,550),(0.3,330)]) ++ [rest 9]
melody2 = mix $ atSco patch2 $ mel $ [rest 3] ++ (map temp [(0.2,220),(0.7,770),(0.6,660)]) ++ [rest 6]
melody3 = mix $ atSco patch3 $ mel $ [rest 6] ++ (map temp [(0.3,330),(0.9,990),(0.9,990)]) ++ [rest 3]
melody4 = mix $ atSco patch4 $ mel $ [rest 9] ++ (map temp [(0.4,440),(0.1,110),(0.2,220)])
                           
main = dac $ sum [atMidi polySynth, return melody1, return melody2, return melody3, return melody4]      
                    