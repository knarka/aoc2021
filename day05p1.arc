; Parse input to list of four ints (x1, y1, x2, y2).
(def parse (inp)
 (map [map int (tokens (subst #\, " -> " _) #\,)] inp))

; Keep only horizontal and vertical lines.
(def keep-only-orthogonal (lines)
 (keep
  [or
   (is (_ 0) (_ 2))
   (is (_ 1) (_ 3))]
  lines))

; Lookup `coord` in table `x`, or return 0 if no value exists.
(def lookup (x coord)
 (or (x coord) 0))

; Increment value `coord` in table `x`.
(def tab++ (x coord)
  (= (x coord) (+ 1 (lookup x coord))))

; Iterate horizontally and vertically over `line`, incrementing every
; member coordinate in table `x`.
(def increment-all-in-line (x line)
 (tab++ x (list (line 0) (line 1)))
 (if
  (< (line 0) (line 2)) (increment-all-in-line x (cons (+ (car line) 1) (cdr line)))
  (> (line 0) (line 2)) (increment-all-in-line x (cons (- (car line) 1) (cdr line)))
  (< (line 1) (line 3)) (increment-all-in-line x (list (line 0) (+ (line 1) 1) (line 2) (line 3)))
  (> (line 1) (line 3)) (increment-all-in-line x (list (line 0) (- (line 1) 1) (line 2) (line 3)))))

; Count all nonzero values in a table `x`.
(def count-nonzero (x)
 (len:flat (map [> _ 1] (vals x))))

(def run-puzzle (e)
 (let diagram (table)
  (map [increment-all-in-line diagram _] (keep-only-orthogonal:parse (puzzle-input 05 'strs e)))
  (count-nonzero diagram)))
