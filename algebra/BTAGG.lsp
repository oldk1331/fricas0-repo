
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |BitAggregate;|)) 

(DEFPARAMETER |BitAggregate;AL| 'NIL) 

(DEFUN |BitAggregate| ()
  (LET (#:G130)
    (COND (|BitAggregate;AL|) (T (SETQ |BitAggregate;AL| (|BitAggregate;|)))))) 

(DEFUN |BitAggregate;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G127) (LIST '(|Boolean|)))
                          (|Join| (|OrderedSet|) (|Logic|)
                                  (|OneDimensionalArrayAggregate| '#2#)
                                  (|mkCategory|
                                   '(((|not| ($ $)) T) ((|nand| ($ $ $)) T)
                                     ((|nor| ($ $ $)) T) ((|and| ($ $ $)) T)
                                     ((|or| ($ $ $)) T) ((|xor| ($ $ $)) T))
                                   NIL 'NIL NIL)))
               |BitAggregate|)
       (SETELT #1# 0 '(|BitAggregate|)))))) 

(MAKEPROP '|BitAggregate| 'NILADIC T) 
