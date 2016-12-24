module Orchestra.Percussions where
import Csound.Base

kick = do       seed 20151013
                rndL <- random (-1) 1
                rndR <- random (-1) 1
                let rndEnv = expseg [1, 0.02, 0.06, 0.02, 0.01, 0.12, 0.00001, 0.12, 0.00001]
                let lf = expseg [600, 0.02, 112, 0.14, 50, 0.11, 20, 0, 20]
                let lfEnv = expseg [0.00001, 0.005, 1, 0.16, 1, 0.5, 0.00001, 0, 0.00001]
                let raw = gen 10 [1]
                let sine = oscili ((1-rndEnv) * lfEnv) lf (gen 10 [1])
                return (rndL * rndEnv + sine, rndR * rndEnv + sine)

snareDrum freq = do 
                seed 20151213
                let rawTri = gen 7 [0, 256, -1, 512, 1, 256, 0]
                let tri = gen 30 [] --[rawTri, 1, 10]
                rndL <- fmap (flip tone 6000) $ random (-1) 1
                rndR <- fmap (flip tone 6000) $ random (-1) 1
                let rndEnv = expseg [1, 0.007, 1, 0.01, 0.2, 0.05, 0.2, 0.01, 0.5, 0.5, 0.5]
                let rndLfo = lfo osc 0.15 (1.5 * freq)
                let envLfo = expseg [0.00001, 0.005, 0.00001, 0.01, 1, 0.05,1, 0.01, 0.00001, 0 , 0.00001]
                let amp = rndEnv + envLfo * rndLfo
                let env = expseg [1, 0.05, 1, 0.9, 0.0001, 0, 0.0001]
                let lfEnv = expseg [0.01, 0.001, 0.4, 0.05, 0.4, 0.12, 0.001, 0, 0.001]
                let sine = oscili (lfEnv * (1-amp)) freq rawTri -- tri
                return (env * (rndL * amp + sine), env * (rndR * amp + sine))
                
 