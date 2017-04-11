{- AVATARA aka loop-102-}
import Csound.Patch
import Csound.Base

pace = 40
iter = 10
notes pchs = map (\pch -> (0.5, cpspch pch)) pchs
sequencer instr tempo xs  = mix $ str tempo $ loopBy iter $ atSco instr $ mel 
           $ fmap temp $ notes $ concat xs

avatar = 
   let oct = 9
       ins pch = temp (0.1, cpspch $ oct + pch)
       tick n = 60 * n / pace
       in mix $ loopBy iter $ atSco (avatara 10)
                           $ har [ mel $ zipWith str (map tick [5,1,7,1,2]) 
                                            $ map ins [0.05,0.04,0.05,0.04,0.05]
                                 , mel $ zipWith str (map tick [2,2,2,2,6,2]) 
                                            $ map ins [0.10,0.08,0.07,0.08,0.10,0.08]
                                 , mel $ zipWith str (map tick [1,1,7,1,2,4]) 
                                            $ map ins [1.00,1.01,1.00,1.03,1.01,1.00]
                                 ] 
     
synth = 
   let notes = map (\pch -> temp (0.5, cpspch $ 8 + pch))
                                [0.10,1.00,1.01,1.03,1.05
                                ,1.05,1.04,1.05,1.00,0.10,0.08
                                ,0.00,0.01,0.10,1.00,1.01,1.03,1.01
                                ,1.00,0.07,0.05,0.08,0.07,0.05]
       strs = [6,2,2,2,11
              ,1,5,1,5,1,8
              ,2,2,7,2,2,2,11
              ,1,4,1,5,1,8]
       tick n = 60 * 16 / (sum strs + 4) * n / pace
       in mix $ loopBy iter $ atSco polySynthm -- razorLeadFast
                           $ mel $ (++ [rest $ tick 4]) 
                              $ zipWith str (map tick strs) notes
                                 
canon = 
   let oct = 7
       ins pch = temp (0.4, cpspch $ oct + pch)
       tick n = 60 * 16 / 96 * n / pace
       in mix $ loopBy iter $ atSco ({-FxChain [FxSpec 0.75 (return . smallHall2)]-} overtoneLead {-razorLead-})
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

pad =                                                    
   let oct = 7
       ins = map (\pch -> temp (0.08, cpspch $ oct + pch))
       ticks = map (* (60 * 16 / 16 / pace))
       in mix $ loopBy iter $ atSco polySynthm
                   $ har [ mel $ zipWith str (ticks [1,1,2,1,1,2,1,1,2,1,1,2 ]) 
                                       $ ins 
                              [ 0.10,1.03,1.05
                              , 1.04,1.00,1.05
                              , 0.10,1.01,1.05
                              , 1.04,1.00,1.05
                              ]
                                 , mel $ zipWith str (ticks [2,2,2,2,4,2,2])
                                  $ ins 
                                 [1.10,1.08,1.07,1.08,1.10,1.07,1.08]]

main = dac $  {-at (dumpWav "avatara_pace40.wav") $ -} sum $ [
                   avatar
                   ,synth
                   ,canon
                   ,pad
                   ]

                 
{-
main = dac $ {- at (dumpWav "avatara_pace40.wav") $ -} sum $ [ atMidi $ addInstrFx (return . mul 0.5) $ harmonPatch [lfo saw 0.5 4, lfo saw 1.33 5] [1,1] polySynth
                   ,return avatar
                   ,return synth
                   ,return canon
                   ,return pad
                   ]
-}

                  