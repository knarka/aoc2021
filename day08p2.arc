(def split-input (seq)
 (let sp (map [tokens _ #\|] seq)
  (map [map tokens _] sp)))

(def diff (a b)
 (find [~find _ a] b))

(def deduce-configuration (patterns)
 (withs (one       (find [is (len _) 2] patterns)
         seven     (find [is (len _) 3] patterns)
         four      (find [is (len _) 4] patterns)
         eight     (find [is (len _) 7] patterns)
         top       (diff one seven)
         nine      (find [is-nine _ four top] patterns)
         bottom    (diff four (rem top nine))
         three     (find [is-three _ seven nine] patterns)
         top-left  (diff three nine)
         five      (find [is-five _ top-left] patterns)
         two       (find [is-two _ five three] patterns)
         top-right (diff five (string top-left three))
         six       (find [is-six _ top-right] patterns)
         zero      (find [is-zero _ six nine] patterns))
  (list zero one two three four five six seven eight nine)))

(def is-nine (x four top)
 (and
  (is (len x) 6)
  (is (count [find _ four] x) 4)
  (find top x)))

(def is-three (x seven nine)
 (and
  (is (len x) 5)
  (is (count [find _ seven] x) 3)
  (is (count [find _ nine] x) 5)))

(def is-five (x top-left)
 (and
  (is (len x) 5)
  (find top-left x)))

(def is-two (x five three)
 (and
  (is (len x) 5)
  (isnt x five)
  (isnt x three)))

(def is-six (x top-right)
 (and
  (is (len x) 6)
  (no (find top-right x))))

(def is-zero (x six nine)
 (and
  (is (len x) 6)
  (isnt x six)
  (isnt x nine)))

(def find-num (a configuration)
 (pos [num= a _] configuration))

(def num= (a b)
 (and
  (is (len b) (len a))
  (is (count [pos _ b] a) (len a))))

(def decode-number (seq)
 (let configuration (deduce-configuration (car seq))
  (int:string (map [find-num _ configuration] (cadr seq)))))

(def run-puzzle (e)
 (sum int (map decode-number (split-input (puzzle-input 08 'strs e)))))
