{- AVATARA aka loop-102-}
import Csound.Patch
import Csound.Base

pace = 40
iter = 10
notes pchs = map (\pch -> (0.5, cpspch pch)) pchs
sequencer instr tempo xs  = mix $ str tempo $ loopBy iter $ atSco instr $ mel 
           $ fmap temp $ notes $ concat xs
                                 
canon = 
   let oct = 7
       ins pch = temp (0.4, cpspch $ oct + pch)
       tick n = 60 * 16 / 96 * n / pace
       in mix $ loopBy iter $ atSco (FxChain [fxSpec 0.75 (return . smallHall2)] overtoneLead {-razorLead-})
                           $ mel $ zipWith str (map tick 
                                              [ 4,2,4,2,6,2,2,2,4,2,4,2,12
                                              , 4,2,4,2,6,2,2,2,4,2,4,2,12
                                              ] 
                                              ) 
                                   $ map ins [0.05,1.00,0.10,0.08,0.07
                                             ,0.05,0.07,0.08,0.07,0.05,0.04
                                             ,0.05,1.00
                                             ,0.05,0.08,0.07,0.05,1.01
                                             ,0.10,0.08,0.07,0.05,0.07,0.08,0.10,1.00]

main = dac $ {- at (dumpWav "avatara.wav") $ -} sum $ [atMidi polySynth
                   ,return canon
                   ,return $ loopWav 1 "avatara_pace40.wav"
                   ]
{-
                   

main = dac $ {- at (dumpWav "avatara.wav") $ -} sum $ [ atMidi polySynth
                   ,return canon
                   ,return $ loopWav 1 "avatara_pace40.wav"
                  ]

-}
                  