
(DECLAIM (NOTINLINE |OrderedSet;|)) 

(DEFPARAMETER |OrderedSet;AL| 'NIL) 

(DEFUN |OrderedSet| ()
  (LET (#:G105)
    (COND (|OrderedSet;AL|) (T (SETQ |OrderedSet;AL| (|OrderedSet;|)))))) 

(DEFUN |OrderedSet;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Comparable|) (|PartialOrder|)
                       (|mkCategory| '(((|max| ($ $ $)) T) ((|min| ($ $ $)) T))
                                     NIL 'NIL NIL))
               |OrderedSet|)
       (SETELT #1# 0 '(|OrderedSet|)))))) 

(MAKEPROP '|OrderedSet| 'NILADIC T) 
