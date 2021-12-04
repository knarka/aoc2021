(= winning-card nil)
(= winning-seq nil)
(= cards nil)
(= random-numbers nil)
(= drawn-numbers nil)

(def run-puzzle (e)
 (split-data (puzzle-input 04 'chrs e))
 (play-bingo))

#|
Take the input, and extract a list of random numbers `random-numbers`
and a list of cards `cards`.
|#
(def split-data (data)
 (let parts (tokens (subst #\! "\n\n" data) #\!) ; split on double newlines
  (= random-numbers (readall (subst #\  "," (car parts))))
  (= cards (map
            [map readall (tokens _ #\newline)]
            (cdr parts)))
  cards))

#|
True is all items in sequence have been drawn, nil otherwise.
|#
(def is-winning-seq (seq)
 (is
  (count [pos _ drawn-numbers] seq) ; amount of numbers in this row that has been drawn
  (len seq)))

(def has-winning-row (card)
 (keep is-winning-seq card))

(def rotate-matrix (matrix)
 (accum outer
  (forlen i (car matrix)
   (outer (accum inner
             (forlen j matrix
              (inner ((matrix j) i))))))))

(def has-winning-col (card)
 (keep is-winning-seq (rotate-matrix card)))

(def is-winner (card)
 (or
  (has-winning-row card)
  (has-winning-col card)))

#|
Move first number in `random-numbers` to `drawn-numbers`.
|#
(def draw-number ()
 (let new-number (car random-numbers)
  (= drawn-numbers (cons new-number drawn-numbers))
  (= random-numbers (cdr random-numbers))))

(def calculate-score (card)
 (* (sum int (rem [pos _ drawn-numbers] (flat winning-card))) (car drawn-numbers)))

(def play-bingo ()
 (while (is winning-card nil)
  (draw-number)
  (each card cards
   (awhen (is-winner card)
    (= winning-card card)
    (= winning-seq it))))
 (calculate-score winning-card))
