
(DEFPARAMETER |DirectProductCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DirectProductCategory;|)) 

(DEFPARAMETER |DirectProductCategory;AL| 'NIL) 

(DEFUN |DirectProductCategory| (&REST #1=#:G108)
  (LET (#2=#:G109)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |DirectProductCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |DirectProductCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|DirectProductCategory;| #1#)))
               |DirectProductCategory;AL|))
      #2#)))) 

(DEFUN |DirectProductCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G107 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|sublisV|
                     (PAIR '(#2=#:G105 #3=#:G106)
                           (LIST '(|Integer|) '(|Vector| |t#2|)))
                     (COND (|DirectProductCategory;CAT|)
                           ('T
                            (LETT |DirectProductCategory;CAT|
                                  (|Join| (|IndexedAggregate| '#2# '|t#2|)
                                          (|CoercibleTo| '#3#)
                                          (|finiteAggregate|)
                                          (|mkCategory|
                                           '(((|directProduct|
                                               ($ (|Vector| |t#2|)))
                                              T)
                                             ((|unitVector|
                                               ($ (|PositiveInteger|)))
                                              (|has| |t#2| (|Ring|)))
                                             ((|dot| (|t#2| $ $))
                                              (|has| |t#2| (|Ring|)))
                                             ((* ($ |t#2| $))
                                              (|has| |t#2| (|Monoid|)))
                                             ((* ($ $ |t#2|))
                                              (|has| |t#2| (|Monoid|))))
                                           '(((|FullyRetractableTo| |t#2|)
                                              (|has| |t#2| (|SetCategory|)))
                                             ((|BiModule| |t#2| |t#2|)
                                              (|has| |t#2| (|Ring|)))
                                             ((|DifferentialExtension| |t#2|)
                                              (|has| |t#2| (|Ring|)))
                                             ((|FullyLinearlyExplicitRingOver|
                                               |t#2|)
                                              (|has| |t#2| (|Ring|)))
                                             ((|AbelianSemiGroup|)
                                              (|has| |t#2|
                                                     (|AbelianSemiGroup|)))
                                             ((|CancellationAbelianMonoid|)
                                              (|has| |t#2|
                                                     (|CancellationAbelianMonoid|)))
                                             ((|Monoid|)
                                              (|has| |t#2| (|Monoid|)))
                                             ((|Finite|)
                                              (|has| |t#2| (|Finite|)))
                                             ((|Algebra| |t#2|)
                                              (|has| |t#2|
                                                     (|CommutativeRing|)))
                                             ((|CommutativeRing|)
                                              (|has| |t#2|
                                                     (|CommutativeRing|)))
                                             ((|unitsKnown|)
                                              (|has| |t#2| (|unitsKnown|)))
                                             ((|OrderedRing|)
                                              (|has| |t#2| (|OrderedRing|)))
                                             ((|OrderedAbelianMonoidSup|)
                                              (|has| |t#2|
                                                     (|OrderedAbelianMonoidSup|)))
                                             ((|VectorSpace| |t#2|)
                                              (|has| |t#2| (|Field|))))
                                           '((|PositiveInteger|)
                                             (|Vector| |t#2|))
                                           NIL))
                                  . #4=(|DirectProductCategory|))))))
                   . #4#)
           (SETELT #1# 0
                   (LIST '|DirectProductCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
