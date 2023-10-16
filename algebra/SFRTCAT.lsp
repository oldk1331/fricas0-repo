
(DEFPARAMETER |SquareFreeRegularTriangularSetCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SquareFreeRegularTriangularSetCategory;|)) 

(DEFPARAMETER |SquareFreeRegularTriangularSetCategory;AL| 'NIL) 

(DEFUN |SquareFreeRegularTriangularSetCategory| (|t#1| |t#2| |t#3| |t#4|)
  (LET (#1=#:G105
        (#2=#:G106
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|)
               (|devaluate| |t#4|))))
    (COND
     ((SETQ #1# (|assoc| #2# |SquareFreeRegularTriangularSetCategory;AL|))
      (CDR #1#))
     (T
      (SETQ |SquareFreeRegularTriangularSetCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|SquareFreeRegularTriangularSetCategory;|
                                    #2#)))
               |SquareFreeRegularTriangularSetCategory;AL|))
      #1#)))) 

(DEFUN |SquareFreeRegularTriangularSetCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST |t#1| |t#2| |t#3| |t#4|))
                    (COND (|SquareFreeRegularTriangularSetCategory;CAT|)
                          ('T
                           (LETT |SquareFreeRegularTriangularSetCategory;CAT|
                                 (|Join|
                                  (|RegularTriangularSetCategory| '|t#1| '|t#2|
                                                                  '|t#3|
                                                                  '|t#4|)))))))
           (SETELT #1# 0
                   (LIST '|SquareFreeRegularTriangularSetCategory| |t#1| |t#2|
                         |t#3| |t#4|))))) 
