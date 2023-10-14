
(/VERSIONCHECK 2) 

(DEFPARAMETER |MatrixCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MatrixCategory;|)) 

(DEFPARAMETER |MatrixCategory;AL| 'NIL) 

(DEFUN |MatrixCategory| (&REST #1=#:G185)
  (LET (#2=#:G186)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |MatrixCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |MatrixCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|MatrixCategory;| #1#)))
                       |MatrixCategory;AL|))
      #2#)))) 

(DEFUN |MatrixCategory;| (|t#1| |t#2| |t#3|)
  (PROG (#1=#:G184)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2| |t#3|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                            (|devaluate| |t#3|)))
                (COND (|MatrixCategory;CAT|)
                      ('T
                       (LETT |MatrixCategory;CAT|
                             (|Join|
                              (|TwoDimensionalArrayCategory| '|t#1| '|t#2|
                                                             '|t#3|)
                              (|shallowlyMutable|) (|finiteAggregate|)
                              (|mkCategory|
                               '(((|square?| ((|Boolean|) $)) T)
                                 ((|diagonal?| ((|Boolean|) $)) T)
                                 ((|symmetric?| ((|Boolean|) $)) T)
                                 ((|antisymmetric?| ((|Boolean|) $))
                                  (|has| |t#1| (|AbelianGroup|)))
                                 ((|zero|
                                   ($ (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)))
                                  T)
                                 ((|matrix| ($ (|List| (|List| |t#1|)))) T)
                                 ((|matrix|
                                   ($ (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|Mapping| |t#1| (|Integer|) (|Integer|))))
                                  T)
                                 ((|scalarMatrix|
                                   ($ (|NonNegativeInteger|) |t#1|))
                                  T)
                                 ((|diagonalMatrix| ($ (|List| |t#1|))) T)
                                 ((|diagonalMatrix| ($ (|List| $))) T)
                                 ((|kroneckerProduct| ($ $ $)) T)
                                 ((|kroneckerProduct| ($ (|List| $))) T)
                                 ((|kroneckerSum| ($ $ $)) T)
                                 ((|kroneckerSum| ($ (|List| $))) T)
                                 ((|coerce| ($ |t#3|)) T)
                                 ((|transpose| ($ |t#2|)) T)
                                 ((|transpose| ($ $)) T)
                                 ((|squareTop| ($ $)) T)
                                 ((|horizConcat| ($ $ $)) T)
                                 ((|vertConcat| ($ $ $)) T)
                                 ((|listOfLists| ((|List| (|List| |t#1|)) $))
                                  T)
                                 ((|elt|
                                   ($ $ (|List| (|Integer|))
                                    (|List| (|Integer|))))
                                  T)
                                 ((|setelt|
                                   ($ $ (|List| (|Integer|))
                                    (|List| (|Integer|)) $))
                                  T)
                                 ((|swapRows!| ($ $ (|Integer|) (|Integer|)))
                                  T)
                                 ((|swapColumns!|
                                   ($ $ (|Integer|) (|Integer|)))
                                  T)
                                 ((|subMatrix|
                                   ($ $ (|Integer|) (|Integer|) (|Integer|)
                                    (|Integer|)))
                                  T)
                                 ((|setsubMatrix!|
                                   ($ $ (|Integer|) (|Integer|) $))
                                  T)
                                 ((+ ($ $ $)) T)
                                 ((- ($ $ $)) (|has| |t#1| (|AbelianGroup|)))
                                 ((- ($ $)) (|has| |t#1| (|AbelianGroup|)))
                                 ((* ($ (|Integer|) $))
                                  (|has| |t#1| (|AbelianGroup|)))
                                 ((* ($ $ $)) T) ((* ($ |t#1| $)) T)
                                 ((* ($ $ |t#1|)) T) ((* (|t#3| $ |t#3|)) T)
                                 ((* (|t#2| |t#2| $)) T)
                                 ((|positivePower| ($ $ (|Integer|))) T)
                                 ((^ ($ $ (|NonNegativeInteger|)))
                                  (|has| |t#1| (|Monoid|)))
                                 ((|exquo| ((|Union| $ "failed") $ |t#1|))
                                  (|has| |t#1| (|IntegralDomain|)))
                                 ((/ ($ $ |t#1|)) (|has| |t#1| (|Field|)))
                                 ((|rowEchelon| ($ $))
                                  (|has| |t#1| (|EuclideanDomain|)))
                                 ((|columnSpace| ((|List| |t#3|) $))
                                  (|has| |t#1| (|EuclideanDomain|)))
                                 ((|rank| ((|NonNegativeInteger|) $))
                                  (|has| |t#1| (|IntegralDomain|)))
                                 ((|nullity| ((|NonNegativeInteger|) $))
                                  (|has| |t#1| (|IntegralDomain|)))
                                 ((|nullSpace| ((|List| |t#3|) $))
                                  (|has| |t#1| (|IntegralDomain|)))
                                 ((|determinant| (|t#1| $))
                                  (|has| |t#1| (|CommutativeRing|)))
                                 ((|minordet| (|t#1| $))
                                  (|has| |t#1| (|CommutativeRing|)))
                                 ((|Pfaffian| (|t#1| $))
                                  (|has| |t#1| (|CommutativeRing|)))
                                 ((|inverse| ((|Union| $ "failed") $))
                                  (|has| |t#1| (|Field|)))
                                 ((^ ($ $ (|Integer|)))
                                  (|has| |t#1| (|Field|)))
                                 ((|kronecker_prod1|
                                   ((|Void|) $ (|Integer|)
                                    (|List| (|List| (|NonNegativeInteger|)))
                                    (|List| $) (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|Union| |t#1| "one")))
                                  T))
                               NIL
                               '((|Void|) (|Integer|)
                                 (|List| (|List| (|NonNegativeInteger|)))
                                 (|List| $) (|NonNegativeInteger|)
                                 (|List| |t#3|) (|List| (|Integer|))
                                 (|List| (|List| |t#1|)) (|List| |t#1|)
                                 (|Boolean|))
                               NIL))
                             . #2=(|MatrixCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|MatrixCategory| (|devaluate| |t#1|) (|devaluate| |t#2|)
                     (|devaluate| |t#3|))))))) 
