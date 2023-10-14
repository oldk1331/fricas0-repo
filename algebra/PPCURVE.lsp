
(/VERSIONCHECK 2) 

(DEFPARAMETER |PlottablePlaneCurveCategory;AL| 'NIL) 

(DEFUN |PlottablePlaneCurveCategory| ()
  (LET (#:G130)
    (COND (|PlottablePlaneCurveCategory;AL|)
          (T
           (SETQ |PlottablePlaneCurveCategory;AL|
                   (|PlottablePlaneCurveCategory;|)))))) 

(DEFUN |PlottablePlaneCurveCategory;| ()
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
                                      T))
                                   NIL
                                   '((|Segment| (|DoubleFloat|))
                                     (|List|
                                      (|List| (|Point| (|DoubleFloat|)))))
                                   NIL)))
               |PlottablePlaneCurveCategory|)
       (SETELT #1# 0 '(|PlottablePlaneCurveCategory|)))))) 

(MAKEPROP '|PlottablePlaneCurveCategory| 'NILADIC T) 
