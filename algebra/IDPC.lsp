
(DEFPARAMETER |IndexedDirectProductCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IndexedDirectProductCategory;|)) 

(DEFPARAMETER |IndexedDirectProductCategory;AL| 'NIL) 

(DEFUN |IndexedDirectProductCategory| (&REST #1=#:G105)
  (LET (#2=#:G106)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |IndexedDirectProductCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |IndexedDirectProductCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2# (APPLY #'|IndexedDirectProductCategory;| #1#)))
               |IndexedDirectProductCategory;AL|))
      #2#)))) 

(DEFUN |IndexedDirectProductCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G104 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|IndexedDirectProductCategory;CAT|)
                          ('T
                           (LETT |IndexedDirectProductCategory;CAT|
                                 (|Join| (|AbelianProductCategory| '|t#1|)
                                         (|mkCategory|
                                          '(((|map|
                                              ($ (|Mapping| |t#1| |t#1|) $))
                                             T)
                                            ((|monomial| ($ |t#1| |t#2|)) T)
                                            ((|monomial?| ((|Boolean|) $)) T)
                                            ((|construct|
                                              ($
                                               (|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))))
                                             T)
                                            ((|listOfTerms|
                                              ((|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))
                                               $))
                                             T)
                                            ((|numberOfMonomials|
                                              ((|NonNegativeInteger|) $))
                                             T)
                                            ((|leadingMonomial| ($ $))
                                             (|has| |t#2| (|Comparable|)))
                                            ((|leadingCoefficient| (|t#1| $))
                                             (|has| |t#2| (|Comparable|)))
                                            ((|leadingSupport| (|t#2| $))
                                             (|has| |t#2| (|Comparable|)))
                                            ((|reductum| ($ $))
                                             (|has| |t#2| (|Comparable|)))
                                            ((|constructOrdered|
                                              ($
                                               (|List|
                                                (|Record| (|:| |k| |t#2|)
                                                          (|:| |c| |t#1|)))))
                                             (|has| |t#2| (|Comparable|)))
                                            ((|leadingTerm|
                                              ((|Record| (|:| |k| |t#2|)
                                                         (|:| |c| |t#1|))
                                               $))
                                             (|has| |t#2| (|Comparable|))))
                                          '(((|Comparable|)
                                             (AND (|has| |t#2| (|Comparable|))
                                                  (|has| |t#1|
                                                         (|Comparable|))))
                                            ((|OrderedAbelianMonoid|)
                                             (AND
                                              (|has| |t#1|
                                                     (|OrderedAbelianMonoid|))
                                              (|has| |t#2| (|OrderedSet|))))
                                            ((|OrderedAbelianMonoidSup|)
                                             (AND
                                              (|has| |t#1|
                                                     (|OrderedAbelianMonoidSup|))
                                              (|has| |t#2| (|OrderedSet|)))))
                                          '((|List|
                                             (|Record| (|:| |k| |t#2|)
                                                       (|:| |c| |t#1|)))
                                            (|NonNegativeInteger|) (|Boolean|))
                                          NIL))
                                 . #2=(|IndexedDirectProductCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|IndexedDirectProductCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
