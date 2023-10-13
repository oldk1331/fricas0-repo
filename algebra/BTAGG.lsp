
(/VERSIONCHECK 2) 

(DEFPARAMETER |BitAggregate;AL| 'NIL) 

(DEFUN |BitAggregate| ()
  (LET (#:G128)
    (COND (|BitAggregate;AL|) (T (SETQ |BitAggregate;AL| (|BitAggregate;|)))))) 

(DEFUN |BitAggregate;| ()
  (PROG (#1=#:G126)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G125) (LIST '(|Boolean|)))
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
