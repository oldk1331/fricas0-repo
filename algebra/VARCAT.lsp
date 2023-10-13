
(/VERSIONCHECK 2) 

(DEFPARAMETER |VarCat;AL| 'NIL) 

(DEFUN |VarCat| ()
  (LET (#:G127)
    (COND (|VarCat;AL|) (T (SETQ |VarCat;AL| (|VarCat;|)))))) 

(DEFUN |VarCat;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|Type|)
                       (|mkCategory|
                        '(((|var| ($ (|String|))) T)
                          ((|var| ($ (|String|) (|ILogic|))) T)
                          ((|getName| ((|String|) $)) T)
                          ((|getType| ((|ILogic|) $)) T)
                          ((|toString| ((|String|) $)) T)
                          ((|parseVar| ($ (|String|))) T)
                          ((|parseVarTerm|
                            ((|Record| (|:| |rft| $)
                                       (|:| |pout| (|NonNegativeInteger|)))
                             (|String|) (|NonNegativeInteger|)))
                           T)
                          ((= ((|Boolean|) $ $)) T)
                          ((|coerce| ((|OutputForm|) $)) T))
                        NIL
                        '((|OutputForm|) (|Boolean|) (|String|)
                          (|NonNegativeInteger|) (|ILogic|))
                        NIL))
               |VarCat|)
       (SETELT #1# 0 '(|VarCat|)))))) 

(MAKEPROP '|VarCat| 'NILADIC T) 
