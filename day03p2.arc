(load "day03p1.arc")

(def extract-column (seq i)
 (map [_ i] seq))

(def criticize (col)
 (commonest (cons 1 col))) ; add a 1, since commonest returns 0 on equal counts

(def gamma (cols)
 (map car:criticize cols))

(def find-rating (seq critf)
 (ccc
  (fn (ep)
   (forlen i (car seq)
    (= cols (accum acc
             (forlen i (car seq)
              (acc (extract-column seq i)))))
    (= crit (critf cols))
    (pull [isnt (_ i) (crit i)] seq)
    (when (is 1 (len seq))
     (ep (car seq)))))))


(def run-puzzle (e)
 (withs (inp (map [coerce _ 'cons] (puzzle-input 03 'strs e))
         intlist (map [map int:string _] inp))
   (*
    (bin2dec (find-rating (copylist intlist) gamma))
    (bin2dec (find-rating (copylist intlist) epsilon)))))
