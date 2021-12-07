(load "day07p1.arc")

(def find-fuel-cost (crab target)
 (sum int (range 0 (abs (- crab target)))))

(def run-puzzle (e)
 (withs (crabs (parse-input e)
         target (nearest (avg crabs) 1))
  (sum int (map [find-fuel-cost _ target] crabs))))
