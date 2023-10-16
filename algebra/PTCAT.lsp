
(DEFPARAMETER |PointCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PointCategory;|)) 

(DEFPARAMETER |PointCategory;AL| 'NIL) 

(DEFUN |PointCategory| (|t#1|)
  (LET (#1=#:G105 (#2=#:G106 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |PointCategory;AL|)) (CDR #1#))
          (T
           (SETQ |PointCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|PointCategory;| #2#)))
                            |PointCategory;AL|))
           #1#)))) 

(DEFUN |PointCategory;| (|t#1|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST |t#1|))
                              (COND (|PointCategory;CAT|)
                                    ('T
                                     (LETT |PointCategory;CAT|
                                           (|Join| (|VectorCategory| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|point|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|dimension|
                                                        ((|PositiveInteger|)
                                                         $))
                                                       T)
                                                      ((|convert|
                                                        ($ (|List| |t#1|)))
                                                       T)
                                                      ((|cross| ($ $ $)) T)
                                                      ((|extend|
                                                        ($ $ (|List| |t#1|)))
                                                       T))
                                                    NIL
                                                    '((|List| |t#1|)
                                                      (|PositiveInteger|))
                                                    NIL))
                                           . #2=(|PointCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|PointCategory| (|devaluate| |t#1|)))))) 
