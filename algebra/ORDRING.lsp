
(/VERSIONCHECK 2) 

(DEFPARAMETER |OrderedRing;AL| 'NIL) 

(DEFUN |OrderedRing| ()
  (LET (#:G135)
    (COND (|OrderedRing;AL|) (T (SETQ |OrderedRing;AL| (|OrderedRing;|)))))) 

(DEFUN |OrderedRing;| ()
  (PROG (#1=#:G133)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|OrderedAbelianGroup|) (|Ring|) (|Monoid|)
                       (|mkCategory|
                        '(((|positive?| ((|Boolean|) $)) T)
                          ((|negative?| ((|Boolean|) $)) T)
                          ((|sign| ((|Integer|) $)) T) ((|abs| ($ $)) T))
                        NIL '((|Integer|) (|Boolean|)) NIL))
               |OrderedRing|)
       (SETELT #1# 0 '(|OrderedRing|)))))) 

(MAKEPROP '|OrderedRing| 'NILADIC T) 
