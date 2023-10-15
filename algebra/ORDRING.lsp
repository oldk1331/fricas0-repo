
(DECLAIM (NOTINLINE |OrderedRing;|)) 

(DEFPARAMETER |OrderedRing;AL| 'NIL) 

(DEFUN |OrderedRing| ()
  (LET (#:G112)
    (COND (|OrderedRing;AL|) (T (SETQ |OrderedRing;AL| (|OrderedRing;|)))))) 

(DEFUN |OrderedRing;| ()
  (SPROG ((#1=#:G110 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|OrderedAbelianGroup|) (|Ring|)
                           (|CharacteristicZero|)
                           (|mkCategory|
                            '(((|positive?| ((|Boolean|) $)) T)
                              ((|negative?| ((|Boolean|) $)) T)
                              ((|sign| ((|Integer|) $)) T) ((|abs| ($ $)) T))
                            NIL '((|Integer|) (|Boolean|)) NIL))
                   |OrderedRing|)
           (SETELT #1# 0 '(|OrderedRing|))))) 

(MAKEPROP '|OrderedRing| 'NILADIC T) 
