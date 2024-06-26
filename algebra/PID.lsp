
(DECLAIM (NOTINLINE |PrincipalIdealDomain;|)) 

(DEFPARAMETER |PrincipalIdealDomain;AL| 'NIL) 

(DEFUN |PrincipalIdealDomain| ()
  (COND (|PrincipalIdealDomain;AL|)
        (T (SETQ |PrincipalIdealDomain;AL| (|PrincipalIdealDomain;|))))) 

(DEFUN |PrincipalIdealDomain;| ()
  (SPROG ((#1=#:G0 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|GcdDomain|)
                           (|mkCategory|
                            '(((|principalIdeal|
                                ((|Record| (|:| |coef| (|List| %))
                                           (|:| |generator| %))
                                 (|List| %)))
                               T)
                              ((|expressIdealMember|
                                ((|Union| (|List| %) "failed") (|List| %) %))
                               T))
                            NIL NIL NIL)))
           (SETELT #1# 0 '(|PrincipalIdealDomain|))))) 
