(load "day05p1.arc")

; Iterate horizontally, vertically, and diagonally over `line`,
; incrementing every member coordinate in table `x`.
; Base-case: no offset, so no iteration.
; Iterative case: offset, so iterate to those x and y offsets.
(def increment-all-in-line (x line)
 (tab++ x (list (line 0) (line 1)))
 (withs (offset-x 0 offset-y 0)
  (if
   (< (line 0) (line 2)) (++ offset-x)
   (> (line 0) (line 2)) (-- offset-x))
  (if
   (< (line 1) (line 3)) (++ offset-y)
   (> (line 1) (line 3)) (-- offset-y))
  (when (or (isnt offset-x 0) (isnt offset-y 0))
   (increment-all-in-line x (list (+ (line 0) offset-x) (+ (line 1) offset-y) (line 2) (line 3))))))

(def run-puzzle (e)
 (let diagram (table)
  (map [increment-all-in-line diagram _] (parse (puzzle-input 05 'strs e)))
  (count-nonzero diagram)))
