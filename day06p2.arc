(load "day06p1.arc")

(def run-puzzle (e)
 (count-results (start-simulation (parse-input e) 256)))
