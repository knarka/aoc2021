(def extract-column (seq i)
 (map [int:string (_ i)] seq))

(def binflip (seq)
 (map [if (is _ 0) 1 0] seq))

(def gamma (cols)
 (map car:commonest cols))

(def epsilon (cols)
 (binflip (gamma cols)))

(def bin2dec (seq)
 (bin2dec1:rev seq))

(def bin2dec1 (seq)
 (if (len< seq 1)
  0
  (+ (car seq) (* 2 (bin2dec1(cdr seq))))))

(def run-puzzle (e)
 (withs (inp (map [coerce _ 'cons] (puzzle-input 03 'strs e))
         cols (accum acc
               (for i 0 (- (len (car inp)) 1)
                (acc (extract-column inp i)))))
   (* (bin2dec:gamma cols) (bin2dec:epsilon cols))))
