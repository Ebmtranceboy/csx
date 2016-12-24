import Csound.Base
import Csound.Sam
import Csound.Catalog.Drum.Hm
import Orchestra.Percussions
               
                
main = dac $ sum [fmap (repeatSnd 2) $ snareDrum 84,
                                       fmap (repeatSnd 1) $ kick]

