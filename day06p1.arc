(def simulate-day (c)
 (let new-fishies (or (c 0) 0)
  (for i 0 8
   (= (c i) (c (+ i 1))))
  (++ (c 6) new-fishies)
  (= (c 8) new-fishies)))

(def start-simulation (seq n)
 (let h (counts seq) ; initialize hash table with counts
  (repeat n          ; repeat for every day:
   (simulate-day h)) ;  simulate (i.e. apply pattern)
  h))

(def count-results (h)
 (sum int (vals h)))

(def parse-input (e)
 (map int (tokens (car (puzzle-input 06 'strs e)) #\,)))

(def run-puzzle (e)
 (count-results (start-simulation (parse-input e) 80)))
