(= position 0)
(= depth 0)

(def forward (x)
 (++ position x))

(def down (x)
 (++ depth x))

(def up (x)
 (-- depth x))

(def run-puzzle (e)
 (map eval:readall (puzzle-input 02 'strs e))
 (* position depth))
