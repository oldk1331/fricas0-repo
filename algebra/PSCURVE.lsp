
(/VERSIONCHECK 2) 

(DEFPARAMETER |PlottableSpaceCurveCategory;AL| 'NIL) 

(DEFUN |PlottableSpaceCurveCategory| ()
  (LET (#:G128)
    (COND (|PlottableSpaceCurveCategory;AL|)
          (T
           (SETQ |PlottableSpaceCurveCategory;AL|
                   (|PlottableSpaceCurveCategory;|)))))) 

(DEFUN |PlottableSpaceCurveCategory;| ()
  (PROG (#1=#:G126)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(#2=#:G125) (LIST '(|OutputForm|)))
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
