
(DEFPARAMETER |MultivariateSkewPolynomialCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MultivariateSkewPolynomialCategory;|)) 

(DEFPARAMETER |MultivariateSkewPolynomialCategory;AL| 'NIL) 

(DEFUN |MultivariateSkewPolynomialCategory| (|t#1| |t#2| |t#3|)
  (LET (#1=#:G105
        (#2=#:G106
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|))))
    (COND
     ((SETQ #1# (|assoc| #2# |MultivariateSkewPolynomialCategory;AL|))
      (CDR #1#))
     (T
      (SETQ |MultivariateSkewPolynomialCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|MultivariateSkewPolynomialCategory;|
                                    #2#)))
               |MultivariateSkewPolynomialCategory;AL|))
      #1#)))) 

(DEFUN |MultivariateSkewPolynomialCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|) (LIST |t#1| |t#2| |t#3|))
                    (COND (|MultivariateSkewPolynomialCategory;CAT|)
                          ('T
                           (LETT |MultivariateSkewPolynomialCategory;CAT|
                                 (|Join|
                                  (|MaybeSkewPolynomialCategory| '|t#1| '|t#2|
                                                                 '|t#3|))
                                 . #2=(|MultivariateSkewPolynomialCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|MultivariateSkewPolynomialCategory| |t#1| |t#2|
                         |t#3|))))) 
