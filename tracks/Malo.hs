import Csound.Base
import Csound.Sam
import Csound.Catalog.Drum.Hm
import Orchestra.Percussions

{- dans le train pour Saimt Malo -}
kicks = mul 0.125 $ pat [1,2,3,2,1,2,1,2,1,1] $ limSam 1 kick
snares = mul 0.125 $ loop $ mel [rest 4, limSam 3 $ snareDrum 84,rest 1]
main = dac $ kicks =:= snares

               
--pace = 3
                
--main = dac $ mul 0.125 $ sum [fmap (repeatSnd $ 2/pace) $ snareDrum 84,
 --                                      fmap (repeatSnd $ 1/pace) $ kick]
--main = dacBy (setRates 44100 64) $ mul 0.125 $ fmap (repeatSnd 0.51) $ kick

-- main = dac $ kicks


