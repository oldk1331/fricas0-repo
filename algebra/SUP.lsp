
(PUT '|SUP;makeSUP;2%;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;makeSUP;2%;1| ((|p| (%)) (% (|SparseUnivariatePolynomial| R))) |p|) 

(PUT '|SUP;unmakeSUP;2%;2| '|SPADreplace| '(XLAM (|sp|) |sp|)) 

(SDEFUN |SUP;unmakeSUP;2%;2| ((|sp| (|SparseUnivariatePolynomial| R)) (% (%)))
        |sp|) 

(SDEFUN |SUP;^;%Pi%;3| ((|p| (%)) (|np| (|PositiveInteger|)) (% (%)))
        (SPADCALL |p| |np| (QREFELT % 12))) 

(SDEFUN |SUP;^;%Nni%;4| ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|rn| #1=(|NonNegativeInteger|)) (|qn| #2=(|NonNegativeInteger|))
          (|rec| (|Record| (|:| |quotient| #2#) (|:| |remainder| #1#)))
          (#3=#:G161 NIL) (|t| NIL) (#4=#:G160 NIL) (#5=#:G159 NIL) (|y| (%))
          (|cc| (R)))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|spadConstant| % 15))
                 ((NULL |p|) (|spadConstant| % 16)) ((EQL |n| 1) |p|)
                 (#6='T
                  (COND
                   ((NULL (CDR |p|))
                    (COND
                     ((SPADCALL
                       (LETT |cc|
                             (SPADCALL (QCDR (|SPADfirst| |p|)) |n|
                                       (QREFELT % 17)))
                       (QREFELT % 19))
                      (|spadConstant| % 16))
                     (#6#
                      (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
                   ((< (SPADCALL (QREFELT % 20)) 3)
                    (SPADCALL |p| |n| (QREFELT % 22)))
                   (#6#
                    (SEQ (LETT |y| (|spadConstant| % 15))
                         (LETT |rec| (DIVIDE2 |n| (SPADCALL (QREFELT % 20))))
                         (LETT |qn| (QCAR |rec|)) (LETT |rn| (QCDR |rec|))
                         (SEQ G190 NIL
                              (SEQ
                               (COND
                                ((EQL |rn| 1)
                                 (LETT |y| (SPADCALL |y| |p| (QREFELT % 23)))))
                               (COND
                                ((> |rn| 1)
                                 (LETT |y|
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (LIST (|SPADfirst| |p|))
                                                  (CDR |p|) |rn|
                                                  (QREFELT % 24))
                                                 (QREFELT % 23)))))
                               (EXIT
                                (COND
                                 ((ZEROP |qn|)
                                  (PROGN (LETT #5# |y|) (GO #7=#:G158)))
                                 ('T
                                  (SEQ
                                   (LETT |p|
                                         (PROGN
                                          (LETT #4# NIL)
                                          (SEQ (LETT |t| NIL) (LETT #3# |p|)
                                               G190
                                               (COND
                                                ((OR (ATOM #3#)
                                                     (PROGN
                                                      (LETT |t| (CAR #3#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #4#
                                                       (CONS
                                                        (CONS
                                                         (* (QCAR |t|)
                                                            (SPADCALL
                                                             (QREFELT % 20)))
                                                         (SPADCALL (QCDR |t|)
                                                                   (QREFELT %
                                                                            25)))
                                                        #4#))))
                                               (LETT #3# (CDR #3#)) (GO G190)
                                               G191 (EXIT (NREVERSE #4#)))))
                                   (LETT |rec|
                                         (DIVIDE2 |qn|
                                                  (SPADCALL (QREFELT % 20))))
                                   (LETT |qn| (QCAR |rec|))
                                   (EXIT (LETT |rn| (QCDR |rec|))))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT |y|)))))))
          #7# (EXIT #5#)))) 

(PUT '|SUP;zero?;%B;5| '|SPADreplace| 'NULL) 

(SDEFUN |SUP;zero?;%B;5| ((|p| (%)) (% (|Boolean|))) (NULL |p|)) 

(SDEFUN |SUP;one?;%B;6| ((|p| (%)) (% (|Boolean|)))
        (COND
         ((OR (OR (NULL |p|) (NULL (NULL (CDR |p|))))
              (NULL (ZEROP (QCAR (|SPADfirst| |p|)))))
          NIL)
         ('T
          (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| % 27)
                    (QREFELT % 28))))) 

(SDEFUN |SUP;ground?;%B;7| ((|p| (%)) (% (|Boolean|)))
        (COND ((NULL |p|) 'T)
              ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|)))) ('T NIL))) 

(SDEFUN |SUP;multiplyExponents;%Nni%;8|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G177 NIL) (|u| NIL) (#2=#:G176 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |u| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (* (QCAR |u|) |n|) (QCDR |u|))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SUP;divideExponents;%NniU;9|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (|Union| % #1="failed")))
        (SPROG
         ((#2=#:G185 NIL) (|u| (|Union| % #1#))
          (|m| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND ((NULL |p|) (CONS 0 |p|))
                (#3='T
                 (SEQ
                  (LETT |m|
                        (SPADCALL (QCAR (|SPADfirst| |p|)) |n| (QREFELT % 34)))
                  (EXIT
                   (COND ((QEQCAR |m| 1) (CONS 1 "failed"))
                         (#3#
                          (SEQ
                           (LETT |u| (SPADCALL (CDR |p|) |n| (QREFELT % 35)))
                           (EXIT
                            (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                  (#3#
                                   (CONS 0
                                         (CONS
                                          (CONS
                                           (PROG1 (LETT #2# (QCDR |m|))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QCDR (|SPADfirst| |p|)))
                                          (QCDR |u|)))))))))))))))) 

(SDEFUN |SUP;karatsubaDivide;%NniR;10|
        ((|p| (%)) (|n| (|NonNegativeInteger|))
         (% (|Record| (|:| |quotient| . #1=(%)) (|:| |remainder| . #1#))))
        (SPROG
         ((|highp| (|Rep|)) (#2=#:G196 NIL) (|lowp| (|Rep|)) (#3=#:G204 NIL)
          (|t| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
         (SEQ
          (COND ((ZEROP |n|) (CONS |p| (|spadConstant| % 16)))
                ('T
                 (SEQ (LETT |lowp| |p|) (LETT |highp| NIL)
                      (SEQ
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (COND
                               ((NULL |lowp|)
                                (PROGN (LETT #3# 1) (GO #4=#:G199))))
                              (LETT |t| (|SPADfirst| |lowp|))
                              (COND
                               ((< (QCAR |t|) |n|)
                                (PROGN (LETT #3# 1) (GO #4#))))
                              (LETT |lowp| (CDR |lowp|))
                              (EXIT
                               (LETT |highp|
                                     (CONS
                                      (CONS
                                       (PROG2
                                           (LETT #2#
                                                 (SPADCALL (QCAR |t|) |n|
                                                           (QREFELT % 37)))
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|NonNegativeInteger|)
                                                         (|Union|
                                                          (|NonNegativeInteger|)
                                                          "failed")
                                                         #2#))
                                       (QCDR |t|))
                                      |highp|))))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #4# (EXIT #3#))
                      (EXIT (CONS (REVERSE |highp|) |lowp|)))))))) 

(SDEFUN |SUP;shiftRight;%Nni%;11|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G208 NIL) (#2=#:G213 NIL) (|t| NIL) (#3=#:G212 NIL))
               (SEQ
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |t| NIL) (LETT #2# |p|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (CONS
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL (QCAR |t|) |n|
                                                    (QREFELT % 37)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|NonNegativeInteger|)
                                                  (|Union|
                                                   (|NonNegativeInteger|)
                                                   "failed")
                                                  #1#))
                                (QCDR |t|))
                               #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SUP;shiftLeft;%Nni%;12|
        ((|p| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G219 NIL) (|t| NIL) (#2=#:G218 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (+ (QCAR |t|) |n|) (QCDR |t|))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|SUP;univariate;2%;13| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;univariate;2%;13| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        |p|) 

(PUT '|SUP;multivariate;%Saos%;14| '|SPADreplace| '(XLAM (|sup| |v|) |sup|)) 

(SDEFUN |SUP;multivariate;%Saos%;14|
        ((|sup| (|SparseUnivariatePolynomial| R))
         (|v| (|SingletonAsOrderedSet|)) (% (%)))
        |sup|) 

(SDEFUN |SUP;univariate;%SaosSup;15|
        ((|p| (%)) (|v| (|SingletonAsOrderedSet|))
         (% (|SparseUnivariatePolynomial| %)))
        (COND ((SPADCALL |p| (QREFELT % 26)) (|spadConstant| % 46))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT % 47)) (QREFELT % 48))
                 (SPADCALL |p| (QREFELT % 49)) (QREFELT % 50))
                (SPADCALL (SPADCALL |p| (QREFELT % 51)) |v| (QREFELT % 53))
                (QREFELT % 54))))) 

(SDEFUN |SUP;multivariate;SupSaos%;16|
        ((|supp| (|SparseUnivariatePolynomial| %))
         (|v| (|SingletonAsOrderedSet|)) (% (%)))
        (SPROG ((|lc| (%)))
               (SEQ
                (COND ((SPADCALL |supp| (QREFELT % 55)) (|spadConstant| % 16))
                      (#1='T
                       (SEQ (LETT |lc| (SPADCALL |supp| (QREFELT % 56)))
                            (EXIT
                             (COND
                              ((> (SPADCALL |lc| (QREFELT % 49)) 0)
                               (|error| "bad form polynomial"))
                              (#1#
                               (SPADCALL
                                (SPADCALL (SPADCALL |lc| (QREFELT % 47))
                                          (SPADCALL |supp| (QREFELT % 57))
                                          (QREFELT % 58))
                                (SPADCALL (SPADCALL |supp| (QREFELT % 59)) |v|
                                          (QREFELT % 60))
                                (QREFELT % 61))))))))))) 

(SDEFUN |SUP;squareFreePolynomial;SupF;17|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPADCALL |pp| (QREFELT % 64))) 

(SDEFUN |SUP;factorPolynomial;SupF;18|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPADCALL |pp| (QREFELT % 70))) 

(SDEFUN |SUP;factorSquareFreePolynomial;SupF;19|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPADCALL |pp| (QREFELT % 70))) 

(SDEFUN |SUP;factor;%F;20| ((|p| (%)) (% (|Factored| %)))
        (SPADCALL |p| (QREFELT % 75))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;21|
        ((|lpp| #1=(|List| #2=(|SparseUnivariatePolynomial| %))) (|pp| #2#)
         (% (|Union| #1# "failed")))
        (SPADCALL |lpp| |pp| (QREFELT % 81))) 

(SDEFUN |SUP;init_one| ((% (|Void|)))
        (SEQ
         (COND ((QREFELT % 87) "done")
               ('T
                (SEQ (QREFELT % 85)
                     (COND
                      ((|HasCategory| (QREFELT % 6) '(|Ring|))
                       (SETELT % 85
                               (SPADCALL (|spadConstant| % 27)
                                         (QREFELT % 88)))))
                     (QREFELT % 86)
                     (COND
                      ((|HasCategory| (QREFELT % 6) '(|Monoid|))
                       (SETELT % 86 (|spadConstant| % 27))))
                     (EXIT (SETELT % 87 'T))))))) 

(SDEFUN |SUP;toutput|
        ((|t1| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))
         (|v| #1=(|OutputForm|)) (% (|OutputForm|)))
        (SPROG ((|mon| #1#))
               (SEQ (COND ((NULL (QREFELT % 87)) (|SUP;init_one| %)))
                    (EXIT
                     (COND
                      ((EQL (QCAR |t1|) 0)
                       (SPADCALL (QCDR |t1|) (QREFELT % 90)))
                      (#2='T
                       (SEQ
                        (COND ((EQL (QCAR |t1|) 1) (LETT |mon| |v|))
                              (#2#
                               (LETT |mon|
                                     (SPADCALL |v|
                                               (SPADCALL (QCAR |t1|)
                                                         (QREFELT % 91))
                                               (QREFELT % 92)))))
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |t1|) (|spadConstant| % 36)
                                     (QREFELT % 28))
                           (SPADCALL (QREFELT % 93)))
                          ((SPADCALL (QCDR |t1|) (QREFELT % 86) (QREFELT % 28))
                           |mon|)
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |t1|) (QREFELT % 85)
                                        (QREFELT % 28))
                              (COND
                               ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT % 90))
                                          (SPADCALL -1 (QREFELT % 94))
                                          (QREFELT % 95))
                                (EXIT (SPADCALL |mon| (QREFELT % 96)))))))
                            (EXIT
                             (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT % 90))
                                       |mon| (QREFELT % 97)))))))))))))) 

(SDEFUN |SUP;outputForm;%2Of;24|
        ((|p| (%)) (|v| (|OutputForm|)) (% (|OutputForm|)))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (#1=#:G262 NIL) (|t| NIL)
          (#2=#:G261 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (|SUP;toutput| |t| |v| %) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (COND ((NULL |l|) (SPADCALL 0 (QREFELT % 94)))
                 ('T (SPADCALL (ELT % 98) |l| (QREFELT % 101)))))))) 

(SDEFUN |SUP;coerce;%Of;25| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL "?" (QREFELT % 104)) (QREFELT % 102))) 

(SDEFUN |SUP;elt;%2R;26| ((|p| (%)) (|val| (R)) (% (R)))
        (SPROG
         ((#1=#:G269 NIL) (|co| (R)) (#2=#:G266 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G273 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| % 36))
                (#4='T
                 (SEQ (LETT |co| (QCDR (|SPADfirst| |p|)))
                      (LETT |n| (QCAR (|SPADfirst| |p|)))
                      (SEQ (LETT |tm| NIL) (LETT #3# (CDR |p|)) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |co|
                                   (SPADCALL
                                    (SPADCALL |co|
                                              (SPADCALL |val|
                                                        (PROG1
                                                            (LETT #2#
                                                                  (- |n|
                                                                     (LETT |n|
                                                                           (QCAR
                                                                            |tm|))))
                                                          (|check_subtype2|
                                                           (> #2# 0)
                                                           '(|PositiveInteger|)
                                                           '(|Integer|) #2#))
                                                        (QREFELT % 106))
                                              (QREFELT % 107))
                                    (QCDR |tm|) (QREFELT % 108)))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |n| 0) |co|)
                             (#4#
                              (SPADCALL |co|
                                        (SPADCALL |val|
                                                  (PROG1 (LETT #1# |n|)
                                                    (|check_subtype2| (> #1# 0)
                                                                      '(|PositiveInteger|)
                                                                      '(|NonNegativeInteger|)
                                                                      #1#))
                                                  (QREFELT % 106))
                                        (QREFELT % 107))))))))))) 

(SDEFUN |SUP;elt;3%;27| ((|p| (%)) (|val| (%)) (% (%)))
        (SPROG
         ((#1=#:G279 NIL) (|coef| (%)) (#2=#:G276 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G283 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| % 16))
                (#4='T
                 (SEQ
                  (LETT |coef|
                        (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT % 48)))
                  (LETT |n| (QCAR (|SPADfirst| |p|)))
                  (SEQ (LETT |tm| NIL) (LETT #3# (CDR |p|)) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |tm| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |coef|
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|))))
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT % 14))
                                          (QREFELT % 23))
                                (SPADCALL (QCDR |tm|) (QREFELT % 48))
                                (QREFELT % 61)))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |coef|)
                         (#4#
                          (SPADCALL |coef|
                                    (SPADCALL |val|
                                              (PROG1 (LETT #1# |n|)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT % 14))
                                    (QREFELT % 23))))))))))) 

(SDEFUN |SUP;monicDivide;2%R;28|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |quotient| . #1=(%)) (|:| |remainder| . #1#))))
        (SPROG
         ((|rout| (|Rep|)) (#2=#:G300 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
                ((SPADCALL (SPADCALL |p2| (QREFELT % 47)) (|spadConstant| % 27)
                           (QREFELT % 111))
                 (|error| "Divisor Not Monic"))
                ((SPADCALL |p2| (|spadConstant| % 15) (QREFELT % 112))
                 (CONS |p1| (|spadConstant| % 16)))
                (#3='T
                 (COND
                  ((NULL |p1|)
                   (CONS (|spadConstant| % 16) (|spadConstant| % 16)))
                  ((< (SPADCALL |p1| (QREFELT % 49))
                      (LETT |n| (SPADCALL |p2| (QREFELT % 49))))
                   (CONS (|spadConstant| % 16) |p1|))
                  (#3#
                   (SEQ (LETT |rout| NIL) (LETT |p2| (CDR |p2|))
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND ((NULL (NULL (NULL |p1|))) (GO G191)))
                               (SEQ
                                (LETT |u|
                                      (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                                (QREFELT % 37)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |u| 1)
                                   (PROGN (LETT #2# 1) (GO #4=#:G293)))
                                  ('T
                                   (SEQ
                                    (LETT |rout|
                                          (CONS
                                           (CONS (QCDR |u|)
                                                 (QCDR (|SPADfirst| |p1|)))
                                           |rout|))
                                    (EXIT
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|)
                                                     (QCAR
                                                      (|SPADfirst| |rout|))
                                                     (QCDR
                                                      (|SPADfirst| |rout|))
                                                     |p2|
                                                     (QREFELT % 113)))))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #4# (EXIT #2#))
                        (EXIT (CONS (NREVERSE |rout|) |p1|)))))))))) 

(SDEFUN |SUP;discriminant;%R;29| ((|p| (%)) (% (R)))
        (SPADCALL |p| (QREFELT % 116))) 

(SDEFUN |SUP;subResultantGcd;3%;30| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 118))) 

(SDEFUN |SUP;resultant;2%R;31| ((|p1| (%)) (|p2| (%)) (% (R)))
        (SPADCALL |p1| |p2| (QREFELT % 120))) 

(SDEFUN |SUP;content;%R;32| ((|p| (%)) (% (R)))
        (SPROG
         ((#1=#:G306 NIL) (#2=#:G305 (R)) (#3=#:G307 (R)) (#4=#:G310 NIL)
          (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| % 36))
                (#5='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |tm| NIL) (LETT #4# |p|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |tm| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3# (QCDR |tm|))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 122))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| % 36))))))))) 

(SDEFUN |SUP;primitivePart;2%;33| ((|p| (%)) (% (%)))
        (SPROG ((#1=#:G313 NIL) (|ct| (R)))
               (SEQ
                (COND ((NULL |p|) |p|)
                      ('T
                       (SEQ (LETT |ct| (SPADCALL |p| (QREFELT % 123)))
                            (EXIT
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL |p| |ct| (QREFELT % 124)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) %
                                                (|Union| % "failed") #1#))
                              (QREFELT % 125))))))))) 

(SDEFUN |SUP;gcd;3%;34| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 127))) 

(SDEFUN |SUP;divide;2%R;35|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |quotient| . #1=(%)) (|:| |remainder| . #1#))))
        (SPROG
         ((|rout| (%)) (#2=#:G332 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|ct| (R)))
         (SEQ
          (COND ((SPADCALL |p2| (QREFELT % 26)) (|error| "Division by 0"))
                ((SPADCALL |p2| (|spadConstant| % 15) (QREFELT % 112))
                 (CONS |p1| (|spadConstant| % 16)))
                ('T
                 (SEQ
                  (LETT |ct|
                        (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT % 129)))
                  (LETT |n| (QCAR (|SPADfirst| |p2|))) (LETT |p2| (CDR |p2|))
                  (LETT |rout| NIL)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| % 16)
                                      (QREFELT % 130)))
                           (GO G191)))
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                          (QREFELT % 37)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #2# 1) (GO #3=#:G328)))
                            ('T
                             (SEQ
                              (LETT |rout|
                                    (CONS
                                     (CONS (QCDR |u|)
                                           (SPADCALL |ct|
                                                     (QCDR (|SPADfirst| |p1|))
                                                     (QREFELT % 107)))
                                     |rout|))
                              (EXIT
                               (LETT |p1|
                                     (SPADCALL (CDR |p1|)
                                               (QCAR (|SPADfirst| |rout|))
                                               (QCDR (|SPADfirst| |rout|)) |p2|
                                               (QREFELT % 113)))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #3# (EXIT #2#))
                  (EXIT (CONS (NREVERSE |rout|) |p1|)))))))) 

(SDEFUN |SUP;/;%R%;36| ((|p| (%)) (|co| (R)) (% (%)))
        (SPADCALL (SPADCALL |co| (QREFELT % 129)) |p| (QREFELT % 132))) 

(DECLAIM (NOTINLINE |SparseUnivariatePolynomial;|)) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G387)
  (SPROG NIL
         (PROG (#2=#:G388)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SparseUnivariatePolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariatePolynomial|)))))))))) 

(DEFUN |SparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G386 NIL) (|pv$| NIL) (#2=#:G377 NIL) (#3=#:G379 NIL) (#4=#:G378 NIL)
    (#5=#:G380 NIL) (#6=#:G381 NIL) (#7=#:G382 NIL) (#8=#:G383 NIL)
    (#9=#:G384 NIL) (#10=#:G385 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1))
    (LETT % (GETREFV 180))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #10# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #4# #10#) (AND #4# #9#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 140737488355328))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 144115188075855872))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7
              (|List|
               (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#1| '(|FieldOfPrimeCharacteristic|))
      (PROGN
       (QSETREFV % 14 (CONS (|dispatchFunction| |SUP;^;%Pi%;3|) %))
       (QSETREFV % 12 (CONS (|dispatchFunction| |SUP;^;%Nni%;4|) %)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV % 29 (CONS (|dispatchFunction| |SUP;one?;%B;6|) %))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV % 66
                   (CONS
                    (|dispatchFunction| |SUP;squareFreePolynomial;SupF;17|) %))
         (QSETREFV % 71
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;18|)
                         %))
         (QSETREFV % 72
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;19|)
                    %))
         (QSETREFV % 77 (CONS (|dispatchFunction| |SUP;factor;%F;20|) %))
         (QSETREFV % 84
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;21|)
                    %)))))))
    (QSETREFV % 85 (|spadConstant| % 36))
    (QSETREFV % 86 (|spadConstant| % 36))
    (QSETREFV % 87 NIL)
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 114 (CONS (|dispatchFunction| |SUP;monicDivide;2%R;28|) %))))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV % 117 (CONS (|dispatchFunction| |SUP;discriminant;%R;29|) %))
       (QSETREFV % 119
                 (CONS (|dispatchFunction| |SUP;subResultantGcd;3%;30|) %))
       (QSETREFV % 121 (CONS (|dispatchFunction| |SUP;resultant;2%R;31|) %)))))
    (COND
     ((|testBitVector| |pv$| 17)
      (PROGN
       (QSETREFV % 123 (CONS (|dispatchFunction| |SUP;content;%R;32|) %))
       (QSETREFV % 126 (CONS (|dispatchFunction| |SUP;primitivePart;2%;33|) %))
       (QSETREFV % 128 (CONS (|dispatchFunction| |SUP;gcd;3%;34|) %)))))
    (COND
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV % 131 (CONS (|dispatchFunction| |SUP;divide;2%R;35|) %))
       (QSETREFV % 133 (CONS (|dispatchFunction| |SUP;/;%R%;36|) %)))))
    %))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|) '|Rep|
              (|SparseUnivariatePolynomial| 6) |SUP;makeSUP;2%;1|
              |SUP;unmakeSUP;2%;2| (|NonNegativeInteger|) (0 . ^)
              (|PositiveInteger|) (6 . ^) (12 . |One|) (16 . |Zero|) (20 . ^)
              (|Boolean|) (26 . |zero?|) (31 . |characteristic|)
              (|RepeatedSquaring| $$) (35 . |expt|) (41 . *)
              (47 . |binomThmExpt|) (54 . |primeFrobenius|) |SUP;zero?;%B;5|
              (59 . |One|) (63 . =) (69 . |one?|) |SUP;ground?;%B;7|
              |SUP;multiplyExponents;%Nni%;8| (|Union| % '"failed") (|Integer|)
              (74 . |exquo|) |SUP;divideExponents;%NniU;9| (80 . |Zero|)
              (84 . |subtractIfCan|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              |SUP;karatsubaDivide;%NniR;10| |SUP;shiftRight;%Nni%;11|
              |SUP;shiftLeft;%Nni%;12| |SUP;univariate;2%;13|
              (|SingletonAsOrderedSet|) |SUP;multivariate;%Saos%;14|
              (|SparseUnivariatePolynomial| $$) (90 . |Zero|)
              (94 . |leadingCoefficient|) (99 . |coerce|) (104 . |degree|)
              (109 . |monomial|) (115 . |reductum|)
              (|SparseUnivariatePolynomial| %) |SUP;univariate;%SaosSup;15|
              (120 . +) (126 . |zero?|) (131 . |leadingCoefficient|)
              (136 . |degree|) (141 . |monomial|) (147 . |reductum|)
              |SUP;multivariate;SupSaos%;16| (152 . +) (|Factored| 45)
              (|UnivariatePolynomialSquareFree| $$ 45) (158 . |squareFree|)
              (|Factored| 52) (163 . |squareFreePolynomial|) (|Factored| 68)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (168 . |generalTwoFactor|) (173 . |factorPolynomial|)
              (178 . |factorSquareFreePolynomial|) (|Factored| $$)
              (|UnivariateFiniteFieldFactorize| 6 $$) (183 . |factor|)
              (|Factored| %) (188 . |factor|) (|Union| 79 '"failed")
              (|List| 45) (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 45)
              (193 . |solveLinearPolynomialEquation|) (|Union| 83 '#1="failed")
              (|List| 52) (199 . |solveLinearPolynomialEquation|) '|mm_one|
              '|m_one| '|one_inited| (205 . -) (|OutputForm|) (210 . |coerce|)
              (215 . |coerce|) (220 . ^) (226 . |empty|) (230 . |coerce|)
              (235 . =) (241 . -) (246 . *) (252 . +) (|Mapping| 89 89 89)
              (|List| 89) (258 . |reduce|) |SUP;outputForm;%2Of;24| (|String|)
              (264 . |message|) |SUP;coerce;%Of;25| (269 . ^) (275 . *)
              (281 . +) |SUP;elt;%2R;26| |SUP;elt;3%;27| (287 . ~=) (293 . =)
              (299 . |fmecg|) (307 . |monicDivide|)
              (|PseudoRemainderSequence| 6 $$) (313 . |discriminant|)
              (318 . |discriminant|) (323 . |subResultantGcd|)
              (329 . |subResultantGcd|) (335 . |resultant|) (341 . |resultant|)
              (347 . |gcd|) (353 . |content|) (358 . |exquo|)
              (364 . |unitCanonical|) (369 . |primitivePart|)
              (374 . |gcdPolynomial|) (380 . |gcd|) (386 . |inv|) (391 . ~=)
              (397 . |divide|) (403 . *) (409 . /) (|Union| 142 '#1#)
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 33)
              (|HashState|) (|SingleInteger|)
              (|Record| (|:| |mat| 143) (|:| |vec| (|Vector| 33))) (|Vector| %)
              (|Matrix| 33) (|List| 146) (|List| 11) (|Symbol|)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 33 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 33) (|Record| (|:| |k| 11) (|:| |c| 6)) (|List| 151)
              (|Mapping| 6 11) (|Record| (|:| |coef| 155) (|:| |generator| %))
              (|List| %) (|Union| 155 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 158 '"failed") (|Fraction| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 160 '"failed") (|Union| 150 '#2="failed")
              (|Union| 33 '#2#) (|Mapping| 6 6) (|List| 43) (|Matrix| 6)
              (|Record| (|:| |mat| 169) (|:| |vec| 176)) (|Union| 43 '#2#)
              (|List| 173) (|Equation| %)
              (|Record| (|:| |var| 43) (|:| |exponent| 11))
              (|Union| 174 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 11 11)
              (|Union| 6 '#2#))
           '#(~= 415 |zero?| 421 |vectorise| 426 |variables| 432 |unvectorise|
              437 |unmakeSUP| 442 |univariate| 447 |unitNormal| 458
              |unitCanonical| 463 |unit?| 468 |totalDegreeSorted| 473
              |totalDegree| 479 |support| 490 |subtractIfCan| 495
              |subResultantGcd| 501 |squareFreePolynomial| 507 |squareFreePart|
              512 |squareFree| 517 |solveLinearPolynomialEquation| 522
              |smaller?| 528 |sizeLess?| 534 |shiftRight| 540 |shiftLeft| 546
              |separate| 552 |sample| 558 |rightRecip| 562 |rightPower| 567
              |retractIfCan| 579 |retract| 599 |resultant| 619 |rem| 632
              |reductum| 638 |reducedSystem| 643 |recip| 665 |quo| 670
              |pseudoRemainder| 676 |pseudoQuotient| 682 |pseudoDivide| 688
              |principalIdeal| 694 |primitivePart| 699 |primitiveMonomials| 710
              |prime?| 715 |pomopo!| 720 |plenaryPower| 728 |patternMatch| 734
              |outputForm| 748 |order| 754 |opposite?| 760 |one?| 766
              |numberOfMonomials| 771 |nextItem| 776 |multivariate| 781
              |multiplyExponents| 793 |multiEuclidean| 799 |monomials| 805
              |monomial?| 810 |monomial| 815 |monicDivide| 835 |minimumDegree|
              848 |mapExponents| 865 |map| 871 |makeSUP| 877 |mainVariable| 882
              |listOfTerms| 887 |linearExtend| 892 |leftRecip| 898 |leftPower|
              903 |leadingTerm| 915 |leadingSupport| 920 |leadingMonomial| 925
              |leadingCoefficient| 930 |lcmCoef| 935 |lcm| 941 |latex| 952
              |karatsubaDivide| 957 |isTimes| 963 |isPlus| 968 |isExpt| 973
              |integrate| 978 |init| 983 |hashUpdate!| 987 |hash| 993 |ground?|
              998 |ground| 1003 |gcdPolynomial| 1008 |gcd| 1014 |fmecg| 1025
              |factorSquareFreePolynomial| 1033 |factorPolynomial| 1038
              |factor| 1043 |extendedEuclidean| 1048 |exquo| 1061
              |expressIdealMember| 1073 |eval| 1079 |euclideanSize| 1133 |elt|
              1138 |divideExponents| 1168 |divide| 1174 |discriminant| 1180
              |differentiate| 1191 |degree| 1274 |convert| 1291 |content| 1306
              |constructOrdered| 1317 |construct| 1322 |conditionP| 1327
              |composite| 1332 |commutator| 1344 |coerce| 1350 |coefficients|
              1380 |coefficient| 1385 |charthRoot| 1405 |characteristic| 1410
              |binomThmExpt| 1414 |associator| 1421 |associates?| 1428
              |antiCommutator| 1434 |annihilate?| 1440 ^ 1446 |Zero| 1458 |One|
              1462 D 1466 = 1542 / 1548 - 1554 + 1565 * 1571)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 0 10 14 0 10 14 0 18 22 21 17 4 1 2 3 21
                                  4 23 19 25 4 26 0 1 21 13 23 26 0 0 1 5 4 23
                                  0 0 0 1 4 4 40 0 0 0 0 0 1 1 40 26 15 46 13
                                  13 0 0 45 13 0 0 0 9 30 32 24 0 0 6 7 12 13
                                  13 23 0 0 0 0 0 0 0 0 4 6 7 8 34 36 11 13 13
                                  14 23 16 20))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL NIL NIL
                |DifferentialExtension&| |Algebra&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&| |Rng&|
                NIL NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&|
                NIL NIL NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |FullyRetractableTo&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL |RetractableTo&|
                |SetCategory&| |RetractableTo&| |RetractableTo&| |Hashable&|
                |Evalable&| |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 11 43)
                 (|MaybeSkewPolynomialCategory| 6 11 43)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 11)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Algebra| 150)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 43) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 146) (|DifferentialRing|) (|Ring|)
                 (|FreeModuleCategory| 6 11) (|NonAssociativeAlgebra| 150)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 11) (|Module| 150)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6) (|Module| $$)
                 (|IndexedProductCategory| 6 11) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 150 150) (|NonAssociativeRing|)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 33)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 150) (|RightModule| 150) (|RightModule| 33)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 33)
                 (|StepThrough|) (|RetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 150) (|RetractableTo| 33) (|Hashable|)
                 (|Evalable| $$) (|RetractableTo| 43) (|CommutativeStar|)
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 43 $$)
                 (|InnerEvalable| 43 6) (|CoercibleFrom| 6) (|BasicType|)
                 (|CoercibleTo| 89) (|unitsKnown|) (|CoercibleFrom| 150)
                 (|CoercibleFrom| 33) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 137) (|ConvertibleTo| 138)
                 (|ConvertibleTo| 136) (|InnerEvalable| $$ $$)
                 (|CoercibleFrom| 43) (|additiveValuation|) (|TwoSidedRecip|)
                 (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 179
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 2 6 0 0 11 17 1 6 18 0 19 0 6 11 20 2 21
                                    2 2 13 22 2 0 0 0 0 23 3 0 0 0 0 11 24 1 6
                                    0 0 25 0 6 0 27 2 6 18 0 0 28 1 0 18 0 29 2
                                    33 32 0 0 34 0 6 0 36 2 11 32 0 0 37 0 45 0
                                    46 1 0 6 0 47 1 0 0 6 48 1 0 11 0 49 2 45 0
                                    2 11 50 1 0 0 0 51 2 45 0 0 0 54 1 45 18 0
                                    55 1 45 2 0 56 1 45 11 0 57 2 0 0 6 11 58 1
                                    45 0 0 59 2 0 0 0 0 61 1 63 62 45 64 1 0 65
                                    52 66 1 69 67 68 70 1 0 65 52 71 1 0 65 52
                                    72 1 74 73 2 75 1 0 76 0 77 2 80 78 79 45
                                    81 2 0 82 83 52 84 1 6 0 0 88 1 6 89 0 90 1
                                    11 89 0 91 2 89 0 0 0 92 0 89 0 93 1 33 89
                                    0 94 2 89 18 0 0 95 1 89 0 0 96 2 89 0 0 0
                                    97 2 89 0 0 0 98 2 100 89 99 0 101 1 89 0
                                    103 104 2 6 0 0 13 106 2 6 0 0 0 107 2 6 0
                                    0 0 108 2 6 18 0 0 111 2 0 18 0 0 112 4 0 0
                                    0 11 6 0 113 2 0 38 0 0 114 1 115 6 2 116 1
                                    0 6 0 117 2 115 2 2 2 118 2 0 0 0 0 119 2
                                    115 6 2 2 120 2 0 6 0 0 121 2 6 0 0 0 122 1
                                    0 6 0 123 2 0 32 0 6 124 1 0 0 0 125 1 0 0
                                    0 126 2 6 52 52 52 127 2 0 0 0 0 128 1 6 0
                                    0 129 2 0 18 0 0 130 2 0 38 0 0 131 2 0 0 6
                                    0 132 2 0 0 0 6 133 2 0 18 0 0 130 1 56 18
                                    0 26 2 0 176 0 11 1 1 0 168 0 1 1 0 0 176 1
                                    1 0 0 8 10 2 0 52 0 43 53 1 0 8 0 42 1 50
                                    149 0 1 1 50 0 0 125 1 50 18 0 1 2 0 11 0
                                    168 1 2 0 11 0 168 1 1 0 11 0 1 1 0 145 0 1
                                    2 57 32 0 0 1 2 20 0 0 0 119 1 10 65 52 66
                                    1 17 0 0 1 1 17 76 0 1 2 10 82 83 52 84 2 9
                                    18 0 0 1 2 14 18 0 0 1 2 4 0 0 11 40 2 0 0
                                    0 11 41 2 17 162 0 0 1 0 56 0 1 1 54 32 0 1
                                    2 54 0 0 11 1 2 0 0 0 13 1 1 6 165 0 1 1 7
                                    166 0 1 1 13 171 0 1 1 0 179 0 1 1 6 150 0
                                    1 1 7 33 0 1 1 13 43 0 1 1 0 6 0 1 2 5 6 0
                                    0 121 3 5 0 0 0 43 1 2 14 0 0 0 1 1 27 0 0
                                    51 2 39 141 135 142 1 1 39 143 135 1 1 4
                                    169 135 1 2 4 170 135 142 1 1 54 32 0 1 2
                                    14 0 0 0 1 2 4 0 0 0 1 2 20 0 0 0 1 2 20
                                    163 0 0 1 1 14 154 155 1 2 17 0 0 43 1 1 17
                                    0 0 126 1 13 155 0 1 1 10 18 0 1 4 0 0 0 6
                                    11 0 1 2 51 0 0 13 1 3 29 147 0 137 147 1 3
                                    31 148 0 138 148 1 2 0 89 0 89 102 2 20 11
                                    0 0 1 2 56 18 0 0 1 1 54 18 0 29 1 0 11 0 1
                                    1 24 32 0 1 2 0 0 52 43 60 2 0 0 8 43 44 2
                                    0 0 0 11 31 2 14 156 155 0 1 1 0 155 0 1 1
                                    0 18 0 1 3 0 0 0 43 11 1 3 0 0 0 168 145 1
                                    2 0 0 6 11 58 2 4 38 0 0 114 3 4 38 0 0 43
                                    1 2 0 145 0 168 1 2 0 11 0 43 1 1 0 11 0 1
                                    2 0 0 178 0 1 2 0 0 167 0 1 1 0 8 0 9 1 0
                                    171 0 1 1 0 152 0 1 2 5 6 153 0 1 1 54 32 0
                                    1 2 54 0 0 11 1 2 0 0 0 13 1 1 27 151 0 1 1
                                    27 11 0 1 1 27 0 0 1 1 27 6 0 47 2 17 161 0
                                    0 1 2 17 0 0 0 1 1 17 0 155 1 1 0 103 0 1 2
                                    4 38 0 11 39 1 13 156 0 1 1 0 156 0 1 1 13
                                    175 0 1 1 1 0 0 1 0 24 0 1 2 12 139 139 0 1
                                    1 12 140 0 1 1 0 18 0 30 1 0 6 0 1 2 17 52
                                    52 52 1 1 17 0 155 1 2 17 0 0 0 128 4 4 0 0
                                    11 6 0 113 1 10 65 52 72 1 10 65 52 71 1 10
                                    76 0 77 2 14 157 0 0 1 3 14 159 0 0 0 1 2
                                    50 32 0 0 1 2 16 32 0 6 124 2 14 156 155 0
                                    1 3 13 0 0 0 0 1 3 13 0 0 155 155 1 2 13 0
                                    0 172 1 2 13 0 0 173 1 3 0 0 0 168 155 1 3
                                    0 0 0 168 177 1 3 0 0 0 43 0 1 3 0 0 0 43 6
                                    1 1 14 11 0 1 2 14 6 160 6 1 2 20 160 0 160
                                    1 2 20 160 160 160 1 2 0 6 0 6 109 2 0 0 0
                                    0 110 2 0 32 0 11 35 2 14 38 0 0 131 1 5 6
                                    0 117 2 5 0 0 43 1 3 37 0 0 146 11 1 3 37 0
                                    0 144 145 1 2 37 0 0 146 1 2 37 0 0 144 1 1
                                    4 0 0 1 2 4 0 0 11 1 3 4 0 0 167 11 1 2 4 0
                                    0 167 1 3 4 0 0 167 0 1 2 4 0 0 43 1 3 4 0
                                    0 43 11 1 2 4 0 0 168 1 3 4 0 0 168 145 1 2
                                    0 145 0 168 1 2 0 11 0 43 1 1 0 11 0 49 1
                                    11 136 0 1 1 33 137 0 1 1 35 138 0 1 2 17 0
                                    0 43 1 1 17 6 0 123 1 27 0 152 1 1 0 0 152
                                    1 1 48 134 135 1 2 20 164 160 0 1 2 20 32 0
                                    0 1 2 55 0 0 0 1 1 52 0 0 1 1 53 0 33 1 1
                                    28 0 150 1 1 13 0 43 1 1 0 0 6 48 1 0 89 0
                                    105 1 0 177 0 1 3 0 0 0 168 145 1 3 0 0 0
                                    43 11 1 2 0 6 0 11 1 1 49 32 0 1 0 55 11 1
                                    3 47 0 0 0 11 24 3 55 0 0 0 0 1 2 50 18 0 0
                                    1 2 0 0 0 0 1 2 55 18 0 0 1 2 54 0 0 11 12
                                    2 0 0 0 13 14 0 56 0 16 0 54 0 15 3 37 0 0
                                    144 145 1 3 37 0 0 146 11 1 2 37 0 0 146 1
                                    2 37 0 0 144 1 1 4 0 0 1 2 4 0 0 11 1 2 4 0
                                    0 167 1 3 4 0 0 167 11 1 2 4 0 0 43 1 3 4 0
                                    0 43 11 1 2 4 0 0 168 1 3 4 0 0 168 145 1 2
                                    0 18 0 0 112 2 14 0 0 6 133 2 58 0 0 0 1 1
                                    58 0 0 1 2 0 0 0 0 61 2 39 0 0 33 1 2 58 0
                                    33 0 1 2 56 0 11 0 1 2 1 0 150 0 1 2 1 0 0
                                    150 1 2 0 0 0 6 1 2 0 0 6 0 132 2 0 0 0 0
                                    23 2 0 0 13 0 1)))))
           '|lookupComplete|)) 
