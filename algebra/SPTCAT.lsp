
(/VERSIONCHECK 2) 

(DEFPARAMETER |SPointCategory;AL| 'NIL) 

(DEFUN |SPointCategory| ()
  (LET (#:G129)
    (COND (|SPointCategory;AL|)
          (T (SETQ |SPointCategory;AL| (|SPointCategory;|)))))) 

(DEFUN |SPointCategory;| ()
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|Join| (|SetCategory|)
                       (|mkCategory|
                        '(((|spnt| ($ (|DoubleFloat|) (|DoubleFloat|))) T)
                          ((|sipnt| ($ (|Integer|) (|Integer|))) T)
                          ((|spnt|
                            ($ (|DoubleFloat|) (|DoubleFloat|)
                             (|DoubleFloat|)))
                           T)
                          ((|sipnt| ($ (|Integer|) (|Integer|) (|Integer|))) T)
                          ((|svec| ($ (|DoubleFloat|) (|DoubleFloat|))) T)
                          ((|sivec| ($ (|Integer|) (|Integer|))) T)
                          ((|svec|
                            ($ (|DoubleFloat|) (|DoubleFloat|)
                             (|DoubleFloat|)))
                           T)
                          ((|sivec| ($ (|Integer|) (|Integer|) (|Integer|))) T)
                          ((|min| ($ $ $)) T) ((|max| ($ $ $)) T)
                          ((|dimension| ((|PositiveInteger|) $)) T)
                          ((|Pnan?| ((|Boolean|) $)) T)
                          ((|unitVector| ($ $)) T)
                          ((|distanceSquared| ((|DoubleFloat|) $ $)) T)
                          ((|distance| ((|DoubleFloat|) $ $)) T)
                          ((|parallel| ((|DoubleFloat|) $ $)) T)
                          ((|colinearity| ((|DoubleFloat|) $ $)) T)
                          ((|perpendicular| ($ $ $)) T) ((+ ($ $ $)) T)
                          ((- ($ $ $)) T) ((* ($ (|DoubleFloat|) $)) T)
                          ((|toPoint| ($ $)) T) ((|toVector| ($ $)) T)
                          ((|isPoint?| ((|Boolean|) $)) T)
                          ((|isVector?| ((|Boolean|) $)) T)
                          ((|inBounds?| ((|Boolean|) $ $ $)) T)
                          ((|screenCoordX| ((|DoubleFloat|) $)) T)
                          ((|screenCoordY| ((|DoubleFloat|) $)) T)
                          ((|screenCoordZ| ((|DoubleFloat|) $)) T)
                          ((|screenCoords| ((|List| (|DoubleFloat|)) $)) T)
                          ((|extendedCoords| ((|List| (|DoubleFloat|)) $)) T)
                          ((|coerce| ((|OutputForm|) $)) T))
                        NIL
                        '((|OutputForm|) (|List| (|DoubleFloat|))
                          (|DoubleFloat|) (|Boolean|) (|PositiveInteger|)
                          (|Integer|))
                        NIL))
               |SPointCategory|)
       (SETELT #1# 0 '(|SPointCategory|)))))) 

(MAKEPROP '|SPointCategory| 'NILADIC T) 
