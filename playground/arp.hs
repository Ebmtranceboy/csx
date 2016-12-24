import Csound.Base

len, trans, aud :: Double
(len, trans, aud) = (0.5 , 0.001,3* len / 4)
oct = 1 :: Double
amp = 1  -- amplitude (scaled from 0 – 0dbfs, which is set to 32767 by default)
      
arps = let a = [0,0,0,1,0,0,0,0,0,0,0,0,0,0,121,0,0,0] in a ++ tail (reverse a) :: [Double]

size = fromIntegral $ length arps
mkSeq n xs (from,to) = from : (take (4 * (length xs -1)) $ cycle [n*aud/((size-1)*len),to,n*(len-aud)/((size-1)*len),from])
mkEnv n xs = amp : (take (8 * (length xs -1)) $ cycle [n*aud/((size-1)*len),amp,n*trans/((size-1)*len),0.01,n*(len-aud-2*trans)/((size-1)*len),0.01,n*trans/((size-1)*len),amp])
amps = skipNorm $ gen 07 $ mkEnv 8192 arps
fcuts = skipNorm $ gen 05 $ mkSeq 8192 arps (5600,3800)

instr cps =
  let clock = phasor 0.3
      -- [0,3,7,12,17,20,24]
-- [0,0,0,1,0,0,0,11,0,0,0]
-- 	[0,0,0,1,0,0,0,0,12,0,0,0]
-- [0,0,0,1,0,0,0,0,0,0,0,0,0,0,12,0,0,0]
      
      envtab = table clock amps
      vcol = vco2 envtab cps
      vcor = vco2 envtab (1.0001 * cps)
      lptab = table clock fcuts
      vcfl = moogvcf vcol lptab 0.5
      vcfr = moogvcf vcor lptab 0.5 
    in (vcfl + vcfr) / 2

main = dac $ midi $ onMsg instr
