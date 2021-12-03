(def extract-column (seq i)
 (map [_ i] seq))

(def binflip (seq)
 (map [if (is _ 0) 1 0] seq))

(def criticize (col)
 (commonest (cons 1 col))) ; add a 1, since commonest returns 0 on equal counts

(def gamma (cols)
 (map car:criticize cols))

(def epsilon (cols)
 (binflip (gamma cols)))

(def bin2dec (seq)
 (bin2dec1:rev seq))

(def bin2dec1 (seq)
 (if (len< seq 1)
  0
  (+ (car seq) (* 2 (bin2dec1(cdr seq))))))

(def find-rating (seq critf)
 (ccc
  (fn (ep)
   (for i 0 (- (len (car seq)) 1)
    (= cols (accum acc
             (for i 0 (- (len (car seq)) 1)
              (acc (extract-column seq i)))))
    (= crit (critf cols))
    (= seq (keep [is (_ i) (crit i)] seq))
    (when (is 1 (len seq))
     (ep (car seq)))))))


(def run-puzzle (e)
 (withs (inp (map [coerce _ 'cons] (puzzle-input 03 'strs e))
         intlist (map [map int:string _] inp))
   (*
    (bin2dec (find-rating (copylist intlist) gamma))
    (bin2dec (find-rating (copylist intlist) epsilon)))))
