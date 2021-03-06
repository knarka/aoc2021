; https://github.com/knarka
; licensed under the MIT license - see LICENSE

(load "lib/strings.arc")

(def caddr (seq)
  (car (cdr (cdr seq))))

#|
Gets puzzle input for some integer `day` from the data folder.
If `example` is true, gets the example puzzle input instead.
Format can be:
- `strs` to return a list of strings, split on the newlines.
- `syms` to return a list of all valid Arc symbols in the data.
- `syml` to return a list of lines of Arc symbols (combines the former two options)
- `chrs` to return a blob of raw characters.
|#
(def puzzle-input (day format (o example))
  (if (< day 10) (= day (string '0 day)))
  (let fname (string "data/day" day (if example "e") ".data")
   (w/infile inf fname
    (case format
      strs (drain (readline inf))
      syms (readall inf)
      syml (map readall (drain (readline inf)))
      chrs (allchars inf)))))

#|
Runs the given day and part if a suitable file exists,
creates a template if it does not exist.
Assumes the day/part has a function called run-puzzle.
|#
(def run (day part (o e nil))
  (if (< day 10) (= day (string '0 day)))
  (= filename (string "day" day "p" part ".arc"))
  (if (file-exists filename)
      (do
	(load filename)
	(time (run-puzzle e)))
      (do
	(w/outfile outf filename (disp (string "(def run-puzzle (e)\n (puzzle-input " day " 'strs e))") outf))
	(prn "file " filename " created. good luck!"))))
