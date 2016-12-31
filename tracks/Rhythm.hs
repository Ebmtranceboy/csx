import Csound.Base
import Csound.Sam
import Csound.Catalog.Drum.Hm
import Orchestra.Percussions
               
                
main = dac $ mul 0.125 $ sum [fmap (repeatSnd 2) $ snareDrum 84,
                                       fmap (repeatSnd 1) $ kick]
--main = dacBy (setRates 44100 64) $ mul 0.125 $ fmap (repeatSnd 0.51) $ kick

