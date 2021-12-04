(load "day04p1.arc")

(def play-bingo ()
 (while (len> cards 0)
  (draw-number)
  (each card cards
   (awhen (is-winner card)
    (= winning-card card)
    (= winning-seq it)
    (pull card cards))))
 (calculate-score winning-card))
