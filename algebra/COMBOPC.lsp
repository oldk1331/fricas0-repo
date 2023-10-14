
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |CombinatorialOpsCategory;|)) 

(DEFPARAMETER |CombinatorialOpsCategory;AL| 'NIL) 

(DEFUN |CombinatorialOpsCategory| ()
  (LET (#:G129)
    (COND (|CombinatorialOpsCategory;AL|)
          (T
           (SETQ |CombinatorialOpsCategory;AL|
                   (|CombinatorialOpsCategory;|)))))) 

(DEFUN |CombinatorialOpsCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|CombinatorialFunctionCategory|)
                       (|mkCategory|
                        '(((|factorials| ($ $)) T)
                          ((|factorials| ($ $ (|Symbol|))) T)
                          ((|summation| ($ $ (|Symbol|))) T)
                          ((|summation| ($ $ (|SegmentBinding| $))) T)
                          ((|product| ($ $ (|Symbol|))) T)
                          ((|product| ($ $ (|SegmentBinding| $))) T))
                        NIL '((|SegmentBinding| $) (|Symbol|)) NIL))
               |CombinatorialOpsCategory|)
       (SETELT #1# 0 '(|CombinatorialOpsCategory|)))))) 

(MAKEPROP '|CombinatorialOpsCategory| 'NILADIC T) 
