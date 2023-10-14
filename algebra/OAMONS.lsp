
(DECLAIM (NOTINLINE |OrderedAbelianMonoidSup;|)) 

(DEFPARAMETER |OrderedAbelianMonoidSup;AL| 'NIL) 

(DEFUN |OrderedAbelianMonoidSup| ()
  (LET (#:G105)
    (COND (|OrderedAbelianMonoidSup;AL|)
          (T
           (SETQ |OrderedAbelianMonoidSup;AL| (|OrderedAbelianMonoidSup;|)))))) 

(DEFUN |OrderedAbelianMonoidSup;| ()
  (PROG (#1=#:G103)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|OrderedCancellationAbelianMonoid|)
                       (|mkCategory| '(((|sup| ($ $ $)) T)) NIL 'NIL NIL))
               |OrderedAbelianMonoidSup|)
       (SETELT #1# 0 '(|OrderedAbelianMonoidSup|)))))) 

(MAKEPROP '|OrderedAbelianMonoidSup| 'NILADIC T) 
