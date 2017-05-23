;; These two lines sets the number of binary digits used to represent a float
;; in Lisp. This is necessary because you'll be working with tiny numbers
;; TL;DR ignore these two lines
(setf (EXT:LONG-FLOAT-DIGITS) 35000)
(setf *read-default-float-format* 'long-float)

;; This method rounds a number to a certain precision
;; It takes two arguments: the number to round
;;                          and the number of digits to round in decimals
;; Example: (roundToPrecision 10.0044 3) -> 10.004
(defun roundToPrecision (number precision)
  (let
    ((p (expt 10 precision)))
    (/ (round (* number p)) p)
  )
)

;; Exercise
(defun nextA(a b)
  (setf a (/ (+ a b) 2 ))
)

(defun nextB(a b)
  (setf b (sqrt (* a b )))
)

(defun nextT(t0 a nextA p)
  (setf t0(- (* (expt (- a nextA) 2) p ) t0))
)

(defun nextP(p)
  (setf p (* 2 p))
)

(defun myPi (a b t0 p );newPi

  (let (
    (nextA (nextA a b))
    (nextB (nextB a b ))
    (nextT (nextT t0 a p (nextA a b)))
    (nextP (nextP p))
    )
    (let (
      (newPi( / (expt (+ (nextA nextB)) 2 ) (* 4 nextT)))
      ))
      (write(newPi))
  )

;(if (equal (myPi newPi))
;  nil
)   ; base case - previously calculated pi value is equal to the next pi value you get
    ; ellers print ellers kald myPi med nextA, nextB,osv.
  ;(write (myPi nextA nextB nextT nextP ));newPi

(write (myPi 1L0(/ 1L0(sqrt 2L0)) (/ 1L0 4L0) 1L0)) ; calling myPi function

