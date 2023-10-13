
(/VERSIONCHECK 2) 

(DEFPARAMETER |OpenMath;AL| 'NIL) 

(DEFUN |OpenMath| ()
  (LET (#:G127)
    (COND (|OpenMath;AL|) (T (SETQ |OpenMath;AL| (|OpenMath;|)))))) 

(DEFUN |OpenMath;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join|
                (|mkCategory|
                 '(((|OMwrite| ((|String|) $)) T)
                   ((|OMwrite| ((|String|) $ (|Boolean|))) T)
                   ((|OMwrite| ((|Void|) (|OpenMathDevice|) $)) T)
                   ((|OMwrite| ((|Void|) (|OpenMathDevice|) $ (|Boolean|))) T))
                 NIL '((|Void|) (|OpenMathDevice|) (|Boolean|) (|String|))
                 NIL))
               |OpenMath|)
       (SETELT #1# 0 '(|OpenMath|)))))) 

(MAKEPROP '|OpenMath| 'NILADIC T) 
