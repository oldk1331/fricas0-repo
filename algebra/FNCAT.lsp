
(/VERSIONCHECK 2) 

(DEFPARAMETER |FileNameCategory;AL| 'NIL) 

(DEFUN |FileNameCategory| ()
  (LET (#:G129)
    (COND (|FileNameCategory;AL|)
          (T (SETQ |FileNameCategory;AL| (|FileNameCategory;|)))))) 

(DEFUN |FileNameCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((|coerce| ($ (|String|))) T)
                          ((|coerce| ((|String|) $)) T)
                          ((|filename| ($ (|String|) (|String|) (|String|))) T)
                          ((|directory| ((|String|) $)) T)
                          ((|name| ((|String|) $)) T)
                          ((|extension| ((|String|) $)) T)
                          ((|exists?| ((|Boolean|) $)) T)
                          ((|readable?| ((|Boolean|) $)) T)
                          ((|writable?| ((|Boolean|) $)) T)
                          ((|new| ($ (|String|) (|String|) (|String|))) T))
                        NIL '((|String|) (|Boolean|)) NIL))
               |FileNameCategory|)
       (SETELT #1# 0 '(|FileNameCategory|)))))) 

(MAKEPROP '|FileNameCategory| 'NILADIC T) 
