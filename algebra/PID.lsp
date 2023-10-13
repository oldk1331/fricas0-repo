
(/VERSIONCHECK 2) 

(DEFPARAMETER |PrincipalIdealDomain;AL| 'NIL) 

(DEFUN |PrincipalIdealDomain| ()
  (LET (#:G127)
    (COND (|PrincipalIdealDomain;AL|)
          (T (SETQ |PrincipalIdealDomain;AL| (|PrincipalIdealDomain;|)))))) 

(DEFUN |PrincipalIdealDomain;| ()
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|GcdDomain|)
                       (|mkCategory|
                        '(((|principalIdeal|
                            ((|Record| (|:| |coef| (|List| $))
                                       (|:| |generator| $))
                             (|List| $)))
                           T)
                          ((|expressIdealMember|
                            ((|Union| (|List| $) "failed") (|List| $) $))
                           T))
                        NIL '((|List| $)) NIL))
               |PrincipalIdealDomain|)
       (SETELT #1# 0 '(|PrincipalIdealDomain|)))))) 

(MAKEPROP '|PrincipalIdealDomain| 'NILADIC T) 
