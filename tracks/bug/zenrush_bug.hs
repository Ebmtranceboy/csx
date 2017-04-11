
{- ZENRUSH aka loop-108 -}
import Csound.Patch
import Csound.Base

iter = 13
pace = 3.7
notes pchs = map (\pch -> (0.5, cpspch pch)) pchs
sequencer instr tempo xs  = 
       mix $ str (1/tempo) $ atSco instr $ mel 
           $ fmap temp $ notes $ concat xs
           
bass oct = let doct = 1 + oct in sequencer (polySynt $ \(a,c)-> let t x = (x,x) in return $ t $ sig a * saw (sig c) / 5)  pace [
             [oct+0.08,doct+0.05,doct+0.08,doct+1.00]
           , [oct+1.02,doct+0.05,doct+0.08,doct+1.00]
           ]

arp1 [f] (a,b,c) = [f,a,b,c]
arp2 [f] (a,b,c) = [f,b,a,b,f,a,c,b]

melody = 
   let oct = 7
       ins pch = (0.7, cpspch $ oct + pch)
       ticks n = n / pace /2
       in mix $ loopBy iter $ atSco (polySynt $ \(a,c)-> let t x = (x,x) in return $ t $ sig a * saw (sig c) /4) {-polySynth -}
                           $ mel $ ( ++ [rest $ ticks 8]) 
                           $ zipWith str (map ticks 
                            [1,1,2,8]) 
                                 $ map (temp . ins) [0.05,0.07,0.08,1.00]
aout = bass 6 
main = dac $ sum [melody
                 ,bass 6
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