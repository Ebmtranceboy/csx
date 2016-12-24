import Csound.Base
import Csound.Sam
import Data.List(transpose)
import Csound.Catalog.Drum.Tr808
import Orchestra.Percussions

f = [gen 10 [1],
     gen 10 [1,0.5,0.3,0.25,0.2,0.167,0.14,0.125,0.111],
     gen 10 [1,0,0.3,0,0.2,0,0.14,0,0.111],
     gen 10 [1,0,0.3,0,0.2]
     ]

durs = take (length freqs) $ repeat 0.25
ampsdb = map double $ repeat 66
freqs = map double $ take 128 $ cycle [9.03,9.10,8.03,9.03,8.03,9.03,9.08
        ,8.03,9.04,9.03,8.03,8.11,9.03,8.03
        ,9.03,8.10,8.03,9.03,9.04,8.03,9.04,9.03,8.03,9.06
        ,8.03,9.03,9.08,8.03,9.11,8.03,9.11,8.03]
attacks = map double $ map (/100) $ repeat 3
releases = map double $ map (/10) $ repeat 7
vibRates = map double $ repeat 6
vibDepths = map double $ repeat 9
vibDelays = map double $ repeat 0.8
forms = map (f!!) $ repeat 2

track = map (\(xs,ys)->temp (xs!!0,xs!!1,xs!!2,xs!!3,xs!!4,(xs!!5,xs!!6,xs!!7,ys))) $ zip (transpose 
   [durs,ampsdb,freqs,attacks,releases,vibRates,vibDepths,vibDelays]) forms

instr6 (dur, adb, freq, attack, release, (rate, depth, delay, form)) = 
  let rel = 0.01
      del1 = dur * delay
      sus = dur - (del1 + rel)
      
      amp = ampdb adb
      scale = amp * 0.333
      note = cpspch freq

      rampFreq = linseg [0,del1,depth,sus,depth,rel,0]
      k2 = oscil rampFreq rate (f!!0)
      rampAmp = linen scale attack dur release

      a3 = oscil rampAmp (note*0.999 + k2) form
      a2 = oscil rampAmp (note*1.005 + k2) form
      a1 = oscil rampAmp (note + k2) form
      sig = a1 + a2 + a3
    in (0.09 * sig + reverb sig 1.2) / 30000

instr7 =
  let a1 = oscil (ampdb 66) (cpspch 6.03) (f!!2)
      a2 = oscil (ampdb 76) (1.006 * (cpspch 5.03)) (f!!3)
  in  (a1 + a2) /  7000

whipDur = 1

whipInstr =
  let sig = (1 + rand 0.6) * fmap (flip butterlp 1900) (fmap toMono $ runSam 60 $ del 0.19 $ seg1 23.65 24 "../sample/whip.wav")
   in mul 0.3 sig + fmap (flip reverb 1.2) sig

whip = fmap fromMono $ fmap (repeatSnd (1/whipDur)) whipInstr
--drum = del 1.75 $ loop $ str 0.25 $ mul 1.2 bd2
drum = del 1.75 $ toSam $ fmap (repeatSnd 0.5)  kick 
bazz = del 0.5 $ loopBy ((`div` 2)  $ length freqs) $ mel [str 0.25 $ sco (const $ return instr7) (temp unit), rest 0.25]
lead = sco (return . instr6 . (\(a,b,c,d,e,(f,g,h,i))->(a,sig b,sig c,d,e,(sig f,g,h,i)))) $ mel $ zipWith str durs track
lead' = del 0.2 lead
main = dac $ (/3) $ drum =:= (toSam $ sum [return $ fromMono $ mix $ bazz =:= lead =:= lead', whip])

