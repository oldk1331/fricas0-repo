
(/VERSIONCHECK 2) 

(DEFPARAMETER |PrimitiveFunctionCategory;AL| 'NIL) 

(DEFUN |PrimitiveFunctionCategory| ()
  (LET (#:G127)
    (COND (|PrimitiveFunctionCategory;AL|)
          (T
           (SETQ |PrimitiveFunctionCategory;AL|
                   (|PrimitiveFunctionCategory;|)))))) 

(DEFUN |PrimitiveFunctionCategory;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|integral| ($ $ (|Symbol|))) T)
                   ((|integral| ($ $ (|SegmentBinding| $))) T))
                 NIL '((|SegmentBinding| $) (|Symbol|)) NIL))
               |PrimitiveFunctionCategory|)
       (SETELT #1# 0 '(|PrimitiveFunctionCategory|)))))) 

(MAKEPROP '|PrimitiveFunctionCategory| 'NILADIC T) 
