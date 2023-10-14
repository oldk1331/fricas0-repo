
(/VERSIONCHECK 2) 

(DECLAIM (NOTINLINE |PlottableSpaceCurveCategory;|)) 

(DEFPARAMETER |PlottableSpaceCurveCategory;AL| 'NIL) 

(DEFUN |PlottableSpaceCurveCategory| ()
  (LET (#:G130)
    (COND (|PlottableSpaceCurveCategory;AL|)
          (T
           (SETQ |PlottableSpaceCurveCategory;AL|
                   (|PlottableSpaceCurveCategory;|)))))) 

(DEFUN |PlottableSpaceCurveCategory;| ()
  (PROG (#1=#:G128)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G127) (LIST '(|OutputForm|)))
                          (|Join| (|CoercibleTo| '#2#)
                                  (|mkCategory|
                                   '(((|listBranches|
                                       ((|List|
                                         (|List| (|Point| (|DoubleFloat|))))
                                        $))
                                      T)
                                     ((|xRange|
                                       ((|Segment| (|DoubleFloat|)) $))
                                      T)
                                     ((|yRange|
                                       ((|Segment| (|DoubleFloat|)) $))
                                      T)
                                     ((|zRange|
                                       ((|Segment| (|DoubleFloat|)) $))
                                      T))
                                   NIL
                                   '((|Segment| (|DoubleFloat|))
                                     (|List|
                                      (|List| (|Point| (|DoubleFloat|)))))
                                   NIL)))
               |PlottableSpaceCurveCategory|)
       (SETELT #1# 0 '(|PlottableSpaceCurveCategory|)))))) 

(MAKEPROP '|PlottableSpaceCurveCategory| 'NILADIC T) 
