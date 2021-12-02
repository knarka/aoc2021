(= position 0)
(= depth 0)
(= aim 0)

(def forward (x)
 (++ position x)
 (++ depth (* aim x)))

(def down (x)
 (++ aim x))

(def up (x)
 (-- aim x))

(def run-puzzle (e)
 (map eval:readall (puzzle-input 02 'strs e))
 (* position depth))
