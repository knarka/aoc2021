(def split-input (seq)
 (let sp (map [tokens _ #\|] seq)
  (map [map tokens _] sp)))

(def naive (seq)
 (count [pos (len _) '(2 3 4 7)] seq))

(def flatten (seq)
 (if (len> seq 0) (join (flat:cdr:car seq) (flatten (cdr seq)))))

(def run-puzzle (e)
 (naive:flatten:split-input (puzzle-input 08 'strs e)))
