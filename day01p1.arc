; List eater. While there's at least two elements, recurse, adding one if
; the first is smaller than the second.
(def count-increments (seq)
 (if (len< seq 2)
  0
  (if (< (car seq) (cadr seq))
   (+ 1 (count-increments (cdr seq)))
   (count-increments (cdr seq)))))

(def run-puzzle (e)
 (count-increments (map int (puzzle-input 01 'strs e))))
