import Csound.Base
import Data.List(genericLength)

instr freq =
  let iamp = 1 -- ampmidi [] g0dbfs -- amplitude (scaled from 0 – 0dbfs, which is set to 32767 by default)

      kcps = cpspch freq -- cps + pitch bend (range = 2 semitones)
      semitone' x = 2**(x/12)
      octD = 1
      oct = double octD
      mkCps n xs = semitone' (-12*octD) : (concatMap (\(y,y') -> [n*(lenD-2*transD)/((size-1)*lenD),y,n*2*transD/((size-1)*lenD),y']) $ zip xs (tail xs))
      mkEnv n xs = iamp : (take (8 * (length xs -1)) $ cycle [n*audD/((size-1)*lenD),iamp,n*transD/((size-1)*lenD),0.01,n*(lenD-audD-2*transD)/((size-1)*lenD),0.01,n*transD/((size-1)*lenD),iamp])
      mkSeq n xs (from,to) = from : (take (4 * (length xs -1)) $ cycle [n*audD/((size-1)*lenD),to,n*(lenD-audD)/((size-1)*lenD),from])
      lenD, transD, audD :: Double
      (lenD, transD, audD) = (0.5 , 0.001,3* lenD / 4)
      [len, trans, aud] = map double [lenD, transD, audD]
      size = genericLength arps
      arps = let a = [0,0,0,1,0,0,0,0,0,0,0,0,0,0,12,0,0,0] in a ++ tail (reverse a)
      kclock = phasor 0.3
      tabsizeD = 65536.0
      tabsize = double tabsizeD
      kcpstab' = table kclock $ skipNorm $ gen 07 $ mkCps tabsizeD (map (semitone' . subtract (octD*12)) arps)
      kcpstab = ifB (kcpstab' ==*  0) (sig $ semitone (-12*oct)) kcpstab'
      kenvtab = table kclock $ skipNorm $ gen 07 $ mkEnv tabsizeD arps
      kvcotab = table kclock $ skipNorm $ gen 05 $ mkSeq tabsizeD arps (0.99,0.048)
      avcol = vco kenvtab (kcpstab * sig kcps) 2 kvcotab `withTab` (gen 10 [1])
      avcor = vco kenvtab (1.0001*kcpstab * sig kcps) 2 kvcotab `withTab` (gen 10 [1])
      klptab = table kclock $ skipNorm $ gen 05 $ mkSeq tabsizeD arps (5600,3800)
      avcfl = moogvcf avcol klptab 0.5
      avcfr = moogvcf avcor klptab 0.5
    in (avcfl + avcfr) / 20

len = 4.2
durs =  take 18 $ cycle $ map (*len) [1,   1,   1,   0.88,0.12,4]
track = map temp $ take 18 $ cycle $ [7.09,7.11,7.06,7.08,6.07,7.00]

main = dac $ mix $ str 0.5 $ sco (return . instr) $ mel $ zipWith str durs  track
