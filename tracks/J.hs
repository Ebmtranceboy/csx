import Csound.Base
import Csound.Sam
import Csound.Patch
import Csound.Catalog.Drum.Hm
import Orchestra.Percussions


{- dans le train pour Paris -}
kicks = mul 0.125 $ pat [2,1,3,2,3,2,2,1] $ limSam 1 kick
snares = mul 0.125 $ loop $ mel [rest 4, limSam 3 $ snareDrum 84,rest 1]
pad = toSam $ mix $ atSco (purePadSharc shClarinet) $ loopBy 16 $ mel $ zipWith str [1,2,1] $ fmap temp $ map (((,) 0.1) . cpspch) [6.00, 6.02, 6.07]
main = dac $ kicks =:= snares =:= pad

               


