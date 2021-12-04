(load "day01p1.arc")

; This is just convolution with a '(1 1 1) kernel.
(def sum-first-n (n seq)
 (if (len< seq n)
  nil
  (cons (sum int (firstn n seq)) (sum-first-n n (cdr seq)))))

(def run-puzzle (e)
 (count-increments (sum-first-n 3 (puzzle-input 01 'strs e))))
