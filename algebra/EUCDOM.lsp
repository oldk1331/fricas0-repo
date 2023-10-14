
(/VERSIONCHECK 2) 

(DEFPARAMETER |EuclideanDomain;AL| 'NIL) 

(DEFUN |EuclideanDomain| ()
  (LET (#:G146)
    (COND (|EuclideanDomain;AL|)
          (T (SETQ |EuclideanDomain;AL| (|EuclideanDomain;|)))))) 

(DEFUN |EuclideanDomain;| ()
  (PROG (#1=#:G144)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|PrincipalIdealDomain|)
                       (|mkCategory|
                        '(((|sizeLess?| ((|Boolean|) $ $)) T)
                          ((|euclideanSize| ((|NonNegativeInteger|) $)) T)
                          ((|divide|
                            ((|Record| (|:| |quotient| $) (|:| |remainder| $))
                             $ $))
                           T)
                          ((|quo| ($ $ $)) T) ((|rem| ($ $ $)) T)
                          ((|extendedEuclidean|
                            ((|Record| (|:| |coef1| $) (|:| |coef2| $)
                                       (|:| |generator| $))
                             $ $))
                           T)
                          ((|extendedEuclidean|
                            ((|Union|
                              (|Record| (|:| |coef1| $) (|:| |coef2| $))
                              "failed")
                             $ $ $))
                           T)
                          ((|multiEuclidean|
                            ((|Union| (|List| $) "failed") (|List| $) $))
                           T))
                        NIL '((|List| $) (|NonNegativeInteger|) (|Boolean|))
                        NIL))
               |EuclideanDomain|)
       (SETELT #1# 0 '(|EuclideanDomain|)))))) 

(MAKEPROP '|EuclideanDomain| 'NILADIC T) 
