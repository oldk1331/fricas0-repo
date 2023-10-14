
(DECLAIM (NOTINLINE |SetCategory;|)) 

(DEFPARAMETER |SetCategory;AL| 'NIL) 

(DEFUN |SetCategory| ()
  (LET (#:G106)
    (COND (|SetCategory;AL|) (T (SETQ |SetCategory;AL| (|SetCategory;|)))))) 

(DEFUN |SetCategory;| ()
  (PROG (#1=#:G104)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G103) (LIST '(|OutputForm|)))
                          (|Join| (|BasicType|) (|CoercibleTo| '#2#)
                                  (|mkCategory|
                                   '(((|hash| ((|SingleInteger|) $)) T)
                                     ((|hashUpdate!|
                                       ((|HashState|) (|HashState|) $))
                                      T)
                                     ((|latex| ((|String|) $)) T))
                                   NIL
                                   '((|String|) (|HashState|)
                                     (|SingleInteger|))
                                   NIL)))
               |SetCategory|)
       (SETELT #1# 0 '(|SetCategory|)))))) 

(MAKEPROP '|SetCategory| 'NILADIC T) 
