(def parse-input (e)
 (map int (tokens (car (puzzle-input 07 'strs e)) #\,)))

(def find-fuel-cost (crab target)
 (abs (- crab target)))

(def run-puzzle (e)
 (withs (crabs (parse-input e)
         target (median crabs))
  (sum int (map [find-fuel-cost _ target] crabs))))
