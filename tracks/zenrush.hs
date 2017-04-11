
{- ZENRUSH aka loop-108 -}
import Csound.Patch
import Csound.Base

iter = 13
pace = 3.7
notes pchs = map (\pch -> (0.5, cpspch pch)) pchs
sequencer instr tempo xs  = 
       mix $ str (1/tempo) $ loopBy iter $ atSco instr $ mel 
           $ fmap temp $ notes $ concat xs
           
bass oct = let doct = 1 + oct in sequencer razorLead pace [
             arp1 [oct+0.08] (doct+0.05,doct+0.08,doct+1.00)
           , arp2 [oct+1.02] (doct+0.05,doct+0.08,doct+1.00)
           , arp1 [oct+1.00] (doct+0.04,doct+0.07,doct+1.00) 
           , arp2 [oct+0.07] (doct+0.04,doct+0.07,doct+0.10)
           , arp1 [oct+0.08] (doct+0.05,doct+0.08,doct+1.00) 
           , arp2 [oct+0.05] (doct+0.05,doct+0.08,doct+1.00)
           , arp1 [oct+0.00] (doct+0.04,doct+0.07,doct+1.00) 
           , arp2 [oct+0.02] (doct+0.02,doct+0.05,doct+0.10)
           ]

rush = let oct = 9 
        in sequencer ({-FxChain [FxSpec 0.75 (return . smallHall2)]-} polySynth) (2*pace) [
              arp3 (oct+0.05,oct+0.08,oct+1.00)
            , arp3 (oct+0.05,oct+0.08,oct+1.02)
            , arp3 (oct+0.04,oct+0.07,oct+1.00)
            , arp3 (oct+0.04,oct+0.07,oct+1.02)
            
            , arp3 (oct+0.05,oct+0.08,oct+1.00)
            , arp3 (oct+0.05,oct+0.08,oct+1.02)
            , arp3 (oct+0.04,oct+0.07,oct+1.00)
            , arp3 (oct+0.02,oct+0.10,oct+1.05)
            ]

satellite = let oct = 10 
            in sequencer banyan (pace/4) [[oct+0.08,oct+1.08,oct+1.03,oct+1.05,
                                      oct+0.07,oct+1.07,oct+1.02,oct+1.04,
                                      oct+0.08,oct+1.08,oct+1.03,oct+1.05,
                                      oct+0.07,oct+1.07,oct+1.04,oct+1.05
                                      ]]
arp1 [f] (a,b,c) = [f,a,b,c,f,b,a,c]
arp2 [f] (a,b,c) = [f,b,a,b,f,a,c,b]
arp3 (a,b,c) = concat $ replicate 4 [b,a,c,a]

melody = 
   let oct = 7
       ins pch = (0.7, cpspch $ oct + pch)
       ticks n = n / pace /2
       in mix $ loopBy iter $ atSco polySynth 
                           $ mel $ ( ++ [rest $ ticks 8]) 
                           $ zipWith str (map ticks 
                            [1,1,2,8
                            ,2,1,1,8
                            ,1,1,2,2,4
                            ,1/2,1,1/2,1,1,1/2,1,1,1,1/2,1,12
                            ,2,2,8]) 
                                 $ zipWith del [16, 0,0,0
                                               ,8, 0,0,0
                                               ,20, 0,0,0,0
                                               ,2, 0,0,0,0,0,0,0,0,0,0,0,0
                                               ,0,0,0
                                               ] 
                                 $ map (temp . ins) [0.05,0.07,0.08,1.00
                                                    ,0.04,0.05,0.07,1.00
                                                    ,0.08,0.10,1.00,1.05,1.00
                                                    ,0.08,1.00,0.08,1.05,1.00,1.08,1.05,2.10,2.08,2.00,1.05,1.04
                                                    ,1.02,1.00,1.07
                                                    ]

main = dac $ sum [melody
                 ,rush
                 ,bass 6
                 ,satellite
                 ]
                                                     
{-

main = dac $ sum [return melody
                 --,return $ bass 6
                , return rush
                 --, return satellite
                  ,atMidi polySynth
                 ]

main = dac $ sum $ [mul 0.5 $ loopWav 1 "../../../Desktop/perso/loops/loop-108-rush.wav"
                   , loopWav (1) "../../../Desktop/perso/loops/loop-108.wav"
                   , mul 1.5 $ loopWav (1) "../../../Desktop/perso/loops/loop-108-piano.wav"
                   ]
-}