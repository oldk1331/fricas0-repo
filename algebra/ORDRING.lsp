
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |OrderedRing;|)) 

(DEFPARAMETER |OrderedRing;AL| 'NIL) 

(DEFUN |OrderedRing| ()
  (LET (#:G111)
    (COND (|OrderedRing;AL|) (T (SETQ |OrderedRing;AL| (|OrderedRing;|)))))) 

(DEFUN |OrderedRing;| ()
  (PROG (#1=#:G109)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|OrderedAbelianGroup|) (|Ring|) (|CharacteristicZero|)
                       (|Monoid|)
                       (|mkCategory|
                        '(((|positive?| ((|Boolean|) $)) T)
                          ((|negative?| ((|Boolean|) $)) T)
                          ((|sign| ((|Integer|) $)) T) ((|abs| ($ $)) T))
                        NIL '((|Integer|) (|Boolean|)) NIL))
               |OrderedRing|)
       (SETELT #1# 0 '(|OrderedRing|)))))) 

(MAKEPROP '|OrderedRing| 'NILADIC T) 
