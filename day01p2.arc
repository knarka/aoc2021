; List eater. While there's at least two elements, recurse, adding one if
; the first is smaller than the second.
(def count-increments (seq)
 (if (len< seq 2)
  0
  (if (< (car seq) (cadr seq))
   (+ 1 (count-increments (cdr seq)))
   (count-increments (cdr seq)))))

; This is just convolution with a '(1 1 1) kernel.
(def sum-first-n (n seq)
 (if (len< seq n)
  nil
  (cons (sum int (firstn n seq)) (sum-first-n n (cdr seq)))))

(def run-puzzle (e)
 (count-increments (sum-first-n 3 (puzzle-input 01 'strs e))))
