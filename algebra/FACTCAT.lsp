
(DECLAIM (NOTINLINE |FacetCategory;|)) 

(DEFPARAMETER |FacetCategory;AL| 'NIL) 

(DEFUN |FacetCategory| ()
  (LET (#:G107)
    (COND (|FacetCategory;AL|)
          (T (SETQ |FacetCategory;AL| (|FacetCategory;|)))))) 

(DEFUN |FacetCategory;| ()
  (SPROG ((#1=#:G105 NIL))
         (PROG1
             (LETT #1#
                   (|Join| (|SetCategory|) (|OrderedSet|)
                           (|mkCategory|
                            '(((|getMult| ((|Integer|) $)) T)
                              ((|order| ((|NonNegativeInteger|) $)) T)
                              ((|empty?| ((|Boolean|) $)) T))
                            NIL
                            '((|Boolean|) (|NonNegativeInteger|) (|Integer|))
                            NIL))
                   |FacetCategory|)
           (SETELT #1# 0 '(|FacetCategory|))))) 

(MAKEPROP '|FacetCategory| 'NILADIC T) 