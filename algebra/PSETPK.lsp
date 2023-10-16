
(SDEFUN |PSETPK;removeAssociates| ((|lp| |List| P) ($ |List| P))
        (SPROG ((#1=#:G213 NIL) (|p| NIL) (#2=#:G212 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 10)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 12))))) 

(SDEFUN |PSETPK;selectPolynomials;MLR;2|
        ((|pred?| |Mapping| (|Boolean|) P) (|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPROG ((|bps| (|List| P)) (|gps| (|List| P)) (|p| (P)))
               (SEQ (LETT |gps| NIL) (LETT |bps| NIL)
                    (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                         (SEQ (LETT |p| (|SPADfirst| |ps|))
                              (LETT |ps| (CDR |ps|))
                              (EXIT
                               (COND
                                ((SPADCALL |p| |pred?|)
                                 (LETT |gps| (CONS |p| |gps|)))
                                ('T (LETT |bps| (CONS |p| |bps|))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |gps| (SPADCALL (ELT $ 14) |gps| (QREFELT $ 16)))
                    (LETT |bps| (SPADCALL (ELT $ 14) |bps| (QREFELT $ 16)))
                    (EXIT (CONS |gps| |bps|))))) 

(SDEFUN |PSETPK;selectOrPolynomials;LLR;3|
        ((|lpred?| . #1=(|List| (|Mapping| (|Boolean|) P))) (|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPROG
         ((|bps| (|List| P)) (|gps| (|List| P)) (|clpred?| #1#) (|p| (P)))
         (SEQ (LETT |gps| NIL) (LETT |bps| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |ps|)) (LETT |ps| (CDR |ps|))
                        (LETT |clpred?| |lpred?|)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |clpred?|) NIL)
                                      ('T
                                       (NULL
                                        (SPADCALL |p|
                                                  (|SPADfirst| |clpred?|))))))
                               (GO G191)))
                             (SEQ (EXIT (LETT |clpred?| (CDR |clpred?|)))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND ((NULL |clpred?|) (LETT |bps| (CONS |p| |bps|)))
                               ('T (LETT |gps| (CONS |p| |gps|))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |gps| (SPADCALL (ELT $ 14) |gps| (QREFELT $ 16)))
              (LETT |bps| (SPADCALL (ELT $ 14) |bps| (QREFELT $ 16)))
              (EXIT (CONS |gps| |bps|))))) 

(SDEFUN |PSETPK;selectAndPolynomials;LLR;4|
        ((|lpred?| . #1=(|List| (|Mapping| (|Boolean|) P))) (|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPROG
         ((|bps| (|List| P)) (|gps| (|List| P)) (|clpred?| #1#) (|p| (P)))
         (SEQ (LETT |gps| NIL) (LETT |bps| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |ps|)) (LETT |ps| (CDR |ps|))
                        (LETT |clpred?| |lpred?|)
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND ((NULL |clpred?|) NIL)
                                      ('T
                                       (SPADCALL |p|
                                                 (|SPADfirst| |clpred?|)))))
                               (GO G191)))
                             (SEQ (EXIT (LETT |clpred?| (CDR |clpred?|)))) NIL
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND ((NULL |clpred?|) (LETT |gps| (CONS |p| |gps|)))
                               ('T (LETT |bps| (CONS |p| |bps|))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |gps| (SPADCALL (ELT $ 14) |gps| (QREFELT $ 16)))
              (LETT |bps| (SPADCALL (ELT $ 14) |bps| (QREFELT $ 16)))
              (EXIT (CONS |gps| |bps|))))) 

(SDEFUN |PSETPK;linear?;PB;5| ((|p| P) ($ |Boolean|))
        (COND ((SPADCALL |p| (QREFELT $ 23)) NIL)
              ('T (EQL (SPADCALL |p| (QREFELT $ 25)) 1)))) 

(SDEFUN |PSETPK;linearPolynomials;LR;6|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 27) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;univariate?;PB;7| ((|p| P) ($ |Boolean|))
        (SPROG ((|tp| (P)))
               (SEQ
                (COND
                 ((OR (SPADCALL |p| (QREFELT $ 23))
                      (NULL
                       (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                 (QREFELT $ 23))))
                  NIL)
                 ('T
                  (SEQ (LETT |tp| (SPADCALL |p| (QREFELT $ 30)))
                       (EXIT
                        (COND ((SPADCALL |tp| (QREFELT $ 23)) 'T)
                              ((NULL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                                          (SPADCALL |tp| (QREFELT $ 31))
                                          (QREFELT $ 32)))
                               NIL)
                              ('T (SPADCALL |tp| (QREFELT $ 33))))))))))) 

(SDEFUN |PSETPK;univariatePolynomials;LR;8|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 33) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;bivariate?;PB;9| ((|p| P) ($ |Boolean|))
        (SPROG ((|vip| (V)) (|vtp| (V)) (|vp| (V)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 23)) NIL)
                      ((SPADCALL (SPADCALL |p| (QREFELT $ 30)) (QREFELT $ 23))
                       (SPADCALL (SPADCALL |p| (QREFELT $ 29)) (QREFELT $ 33)))
                      (#1='T
                       (SEQ (LETT |vp| (SPADCALL |p| (QREFELT $ 31)))
                            (LETT |vtp|
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                            (QREFELT $ 31)))
                            (COND
                             ((SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                        (QREFELT $ 23))
                              (COND
                               ((SPADCALL |vp| |vtp| (QREFELT $ 32))
                                (EXIT
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                           (QREFELT $ 35)))))))
                            (COND
                             ((SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                        (QREFELT $ 23))
                              (COND
                               ((SPADCALL |vp| |vtp| (QREFELT $ 36))
                                (EXIT
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                           (QREFELT $ 33)))))))
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                         (QREFELT $ 33)))
                              (EXIT NIL)))
                            (LETT |vip|
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 29))
                                            (QREFELT $ 31)))
                            (EXIT
                             (COND ((SPADCALL |vip| |vtp| (QREFELT $ 36)) NIL)
                                   ((SPADCALL |vip| |vtp| (QREFELT $ 32))
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                              (QREFELT $ 33)))
                                   ((SPADCALL |vtp| |vp| (QREFELT $ 37)) NIL)
                                   (#1#
                                    (COND
                                     ((ZEROP
                                       (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                                 |vip| (QREFELT $ 38)))
                                      (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                                (QREFELT $ 33)))
                                     (#1#
                                      (SPADCALL (SPADCALL |p| (QREFELT $ 30))
                                                (QREFELT $ 35))))))))))))) 

(SDEFUN |PSETPK;bivariatePolynomials;LR;10|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 35) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;quasiMonicPolynomials;LR;11|
        ((|ps| |List| P)
         ($ |Record| (|:| |goodPols| (|List| P)) (|:| |badPols| (|List| P))))
        (SPADCALL (ELT $ 40) |ps| (QREFELT $ 19))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInPols;2LBL;12|
        ((|lp| |List| P) (|lf| |List| P) (|opt| |Boolean|) ($ |List| P))
        (SPROG
         ((|newlp| (|List| P)) (|stop| (|Boolean|)) (|p| (P)) (#1=#:G284 NIL)
          (|test| (|Union| P "failed")) (|copylf| (|List| P)) (|f| (P)))
         (SEQ
          (COND ((NULL |lp|) |lp|)
                (#2='T
                 (SEQ (LETT |newlp| NIL) (LETT |stop| NIL)
                      (LETT |lp| (SPADCALL (ELT $ 42) |lp| (QREFELT $ 43)))
                      (LETT |lf| (SPADCALL (ELT $ 14) |lf| (QREFELT $ 16)))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (OR (NULL |lp|) |stop|))) (GO G191)))
                           (SEQ (LETT |p| (|SPADfirst| |lp|))
                                (LETT |lp| (CDR |lp|)) (LETT |copylf| |lf|)
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (COND
                                         ((OR (NULL |copylf|)
                                              (SPADCALL |p| (QREFELT $ 23)))
                                          NIL)
                                         ('T
                                          (NULL
                                           (SPADCALL
                                            (SPADCALL |p| (QREFELT $ 31))
                                            (SPADCALL (|SPADfirst| |copylf|)
                                                      (QREFELT $ 31))
                                            (QREFELT $ 37))))))
                                       (GO G191)))
                                     (SEQ (LETT |f| (|SPADfirst| |copylf|))
                                          (LETT |copylf| (CDR |copylf|))
                                          (EXIT
                                           (SEQ G190
                                                (COND
                                                 ((NULL
                                                   (QEQCAR
                                                    (LETT |test|
                                                          (SPADCALL |p| |f|
                                                                    (QREFELT $
                                                                             45)))
                                                    0))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |p|
                                                        (PROG2
                                                            (LETT #1# |test|)
                                                            (QCDR #1#)
                                                          (|check_union2|
                                                           (QEQCAR #1# 0)
                                                           (QREFELT $ 9)
                                                           (|Union|
                                                            (QREFELT $ 9)
                                                            "failed")
                                                           #1#)))))
                                                NIL (GO G190) G191
                                                (EXIT NIL))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (LETT |stop|
                                      (COND
                                       (|opt| (SPADCALL |p| (QREFELT $ 23)))
                                       ('T NIL)))
                                (EXIT
                                 (LETT |newlp|
                                       (CONS (SPADCALL |p| (QREFELT $ 46))
                                             |newlp|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND (|stop| (LIST (|spadConstant| $ 47)))
                             (#2# |newlp|))))))))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInPol;PLP;13|
        ((|p| P) (|lf| |List| P) ($ P))
        (SPROG ((|lp| (|List| P)))
               (SEQ
                (COND ((SPADCALL |p| (QREFELT $ 42)) |p|)
                      ('T
                       (SEQ (LETT |lp| (LIST |p|))
                            (EXIT
                             (|SPADfirst|
                              (SPADCALL |lp| |lf| 'T (QREFELT $ 48)))))))))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInPols;3L;14|
        ((|lp| |List| P) (|lf| |List| P) ($ |List| P))
        (SPADCALL |lp| |lf| 'NIL (QREFELT $ 48))) 

(SDEFUN |PSETPK;possiblyNewVariety?;LLB;15|
        ((|newlp| |List| P) (|llp| |List| (|List| P)) ($ |Boolean|))
        (SEQ
         (SEQ G190
              (COND
               ((NULL
                 (COND ((NULL |llp|) NIL)
                       ('T
                        (NULL
                         (SPADCALL |newlp| (|SPADfirst| |llp|)
                                   (QREFELT $ 51))))))
                (GO G191)))
              (SEQ (EXIT (LETT |llp| (CDR |llp|)))) NIL (GO G190) G191
              (EXIT NIL))
         (EXIT (NULL |llp|)))) 

(SDEFUN |PSETPK;certainlySubVariety?;2LB;16|
        ((|lp| |List| P) (|lq| |List| P) ($ |Boolean|))
        (SPROG ((|gs| (|GeneralPolynomialSet| R E V P)))
               (SEQ (LETT |gs| (SPADCALL |lp| (QREFELT $ 55)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lq|) NIL)
                                  ('T
                                   (SPADCALL
                                    (QVELT
                                     (SPADCALL (|SPADfirst| |lq|) |gs|
                                               (QREFELT $ 57))
                                     1)
                                    (QREFELT $ 42)))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |lq| (CDR |lq|)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT (NULL |lq|))))) 

(SDEFUN |PSETPK;probablyZeroDim?;LB;17| ((|lp| |List| P) ($ |Boolean|))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|lv| (|List| V))
          (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (LENGTH |lp|))
              (LETT |lv| (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 59)))
              (SEQ G190
                   (COND
                    ((NULL (NULL (NULL (LETT |lp| (CDR |lp|))))) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |lv|
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 59)) |lv|
                            (QREFELT $ 60)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |n| (LENGTH (SPADCALL |lv| (QREFELT $ 61))))
              (EXIT (NULL (SPADCALL |n| |m| (QREFELT $ 62))))))) 

(SDEFUN |PSETPK;interReduce;2L;18| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|rs| (|List| P)) (|ps| (|List| P)) (#1=#:G327 NIL) (|r| (P))
          (|p| (P)))
         (SEQ
          (EXIT
           (SEQ (LETT |ps| |lp|) (LETT |rs| NIL)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL |ps|) (PROGN (LETT #1# |rs|) (GO #2=#:G326)))
                         ('T
                          (SEQ
                           (LETT |ps|
                                 (SPADCALL (ELT $ 64) |ps| (QREFELT $ 16)))
                           (LETT |p| (|SPADfirst| |ps|)) (LETT |ps| (CDR |ps|))
                           (LETT |r|
                                 (QVELT
                                  (SPADCALL |p| (SPADCALL |ps| (QREFELT $ 55))
                                            (QREFELT $ 57))
                                  1))
                           (EXIT
                            (COND ((SPADCALL |r| (QREFELT $ 42)) "iterate")
                                  ((SPADCALL |r| (QREFELT $ 23))
                                   (PROGN (LETT #1# NIL) (GO #2#)))
                                  ((SPADCALL |r| |p| (QREFELT $ 65))
                                   (LETT |rs| (CONS |r| |rs|)))
                                  ('T
                                   (SEQ
                                    (LETT |ps|
                                          (SPADCALL |ps| (CONS |r| |rs|)
                                                    (QREFELT $ 66)))
                                    (EXIT (LETT |rs| NIL)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |PSETPK;roughRed?| ((|p| P) (|q| P) ($ |Boolean|))
        (COND ((SPADCALL |p| (QREFELT $ 23)) NIL)
              ((SPADCALL |q| (QREFELT $ 23)) 'T)
              ('T
               (SPADCALL (SPADCALL |p| (QREFELT $ 31))
                         (SPADCALL |q| (QREFELT $ 31)) (QREFELT $ 36))))) 

(SDEFUN |PSETPK;roughBasicSet;LU;20|
        ((|lp| |List| P)
         ($ |Union|
          (|Record| (|:| |bas| (|GeneralTriangularSet| R E V P))
                    (|:| |top| (|List| P)))
          "failed"))
        (SPADCALL |lp| (CONS (|function| |PSETPK;roughRed?|) $) (QREFELT $ 71))) 

(SDEFUN |PSETPK;autoRemainder|
        ((|ts| |GeneralTriangularSet| R E V P) ($ |List| P))
        (SPROG ((|lp| (|List| P)) (|newlp| (|List| P)) (|p| (P)))
               (SEQ
                (COND
                 ((SPADCALL |ts| (QREFELT $ 75))
                  (SPADCALL |ts| (QREFELT $ 76)))
                 ('T
                  (SEQ
                   (LETT |lp|
                         (SPADCALL (ELT $ 14)
                                   (REVERSE (SPADCALL |ts| (QREFELT $ 76)))
                                   (QREFELT $ 16)))
                   (LETT |newlp|
                         (LIST (SPADCALL (|SPADfirst| |lp|) (QREFELT $ 10))))
                   (LETT |lp| (CDR |lp|))
                   (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                        (SEQ
                         (LETT |p|
                               (QVELT
                                (SPADCALL (|SPADfirst| |lp|)
                                          (SPADCALL |newlp| (QREFELT $ 55))
                                          (QREFELT $ 57))
                                1))
                         (EXIT
                          (COND
                           ((SPADCALL |p| (QREFELT $ 42))
                            (LETT |lp| (CDR |lp|)))
                           ((SPADCALL |p| (QREFELT $ 23))
                            (SEQ (LETT |newlp| (LIST (|spadConstant| $ 47)))
                                 (EXIT (LETT |lp| NIL))))
                           ('T
                            (SEQ (LETT |newlp| (CONS |p| |newlp|))
                                 (EXIT (LETT |lp| (CDR |lp|))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |newlp|))))))) 

(SDEFUN |PSETPK;crushedSet;2L;22| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|finished| #1=(|Boolean|)) (#2=#:G356 NIL) (|contradiction| #1#)
          (|rec|
           (|Union|
            (|Record| (|:| |bas| #3=(|GeneralTriangularSet| R E V P))
                      (|:| |top| #4=(|List| P)))
            #5="failed"))
          (|rs| #4#) (|bs| #3#))
         (SEQ (LETT |rec| (SPADCALL |lp| (QREFELT $ 74)))
              (LETT |contradiction| (QEQCAR |rec| 1)) (LETT |finished| NIL)
              (SEQ G190
                   (COND
                    ((NULL (NULL (OR |finished| |contradiction|))) (GO G191)))
                   (SEQ
                    (LETT |bs|
                          (QCAR
                           (PROG2 (LETT #2# |rec|)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Record|
                                              (|:| |bas|
                                                   (|GeneralTriangularSet|
                                                    (QREFELT $ 6) (QREFELT $ 7)
                                                    (QREFELT $ 8)
                                                    (QREFELT $ 9)))
                                              (|:| |top|
                                                   (|List| (QREFELT $ 9))))
                                             (|Union|
                                              (|Record|
                                               (|:| |bas|
                                                    (|GeneralTriangularSet|
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)
                                                     (QREFELT $ 8)
                                                     (QREFELT $ 9)))
                                               (|:| |top|
                                                    (|List| (QREFELT $ 9))))
                                              #5#)
                                             #2#))))
                    (LETT |rs|
                          (QCDR
                           (PROG2 (LETT #2# |rec|)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|Record|
                                              (|:| |bas|
                                                   (|GeneralTriangularSet|
                                                    (QREFELT $ 6) (QREFELT $ 7)
                                                    (QREFELT $ 8)
                                                    (QREFELT $ 9)))
                                              (|:| |top|
                                                   (|List| (QREFELT $ 9))))
                                             (|Union|
                                              (|Record|
                                               (|:| |bas|
                                                    (|GeneralTriangularSet|
                                                     (QREFELT $ 6)
                                                     (QREFELT $ 7)
                                                     (QREFELT $ 8)
                                                     (QREFELT $ 9)))
                                               (|:| |top|
                                                    (|List| (QREFELT $ 9))))
                                              #5#)
                                             #2#))))
                    (LETT |rs| (SPADCALL |rs| |bs| (QREFELT $ 77)))
                    (LETT |contradiction|
                          (COND ((NULL |rs|) NIL)
                                ('T
                                 (SPADCALL (|SPADfirst| |rs|)
                                           (|spadConstant| $ 47)
                                           (QREFELT $ 78)))))
                    (EXIT
                     (COND
                      ((NULL |contradiction|)
                       (SEQ
                        (LETT |rs|
                              (SPADCALL |rs| (|PSETPK;autoRemainder| |bs| $)
                                        (QREFELT $ 66)))
                        (LETT |rec| (SPADCALL |rs| (QREFELT $ 74)))
                        (LETT |contradiction| (QEQCAR |rec| 1))
                        (EXIT
                         (COND
                          ((NULL |contradiction|)
                           (LETT |finished|
                                 (NULL
                                  (SPADCALL
                                   (QCAR
                                    (PROG2 (LETT #2# |rec|)
                                        (QCDR #2#)
                                      (|check_union2| (QEQCAR #2# 0)
                                                      (|Record|
                                                       (|:| |bas|
                                                            (|GeneralTriangularSet|
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7)
                                                             (QREFELT $ 8)
                                                             (QREFELT $ 9)))
                                                       (|:| |top|
                                                            (|List|
                                                             (QREFELT $ 9))))
                                                      (|Union|
                                                       (|Record|
                                                        (|:| |bas|
                                                             (|GeneralTriangularSet|
                                                              (QREFELT $ 6)
                                                              (QREFELT $ 7)
                                                              (QREFELT $ 8)
                                                              (QREFELT $ 9)))
                                                        (|:| |top|
                                                             (|List|
                                                              (QREFELT $ 9))))
                                                       #5#)
                                                      #2#)))
                                   |bs| (QREFELT $ 79))))))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|contradiction| (LIST (|spadConstant| $ 47)))
                     ('T |rs|)))))) 

(SDEFUN |PSETPK;rewriteSetByReducingWithParticularGenerators;LMMML;23|
        ((|ps| |List| P) (|pred?| |Mapping| (|Boolean|) P)
         (|redOp?| |Mapping| (|Boolean|) P P) (|redOp| |Mapping| P P P)
         ($ |List| P))
        (SPROG
         ((|rs| (|List| P)) (|contradiction| #1=(|Boolean|)) (#2=#:G373 NIL)
          (|stop| #1#) (|bs1| (|GeneralTriangularSet| R E V P))
          (|bs2| (|GeneralTriangularSet| R E V P)) (#3=#:G372 NIL)
          (|ar| (|Union| (|GeneralTriangularSet| R E V P) (|List| P)))
          (#4=#:G369 NIL)
          (|rec|
           (|Union|
            (|Record| (|:| |bas| (|GeneralTriangularSet| R E V P))
                      (|:| |top| (|List| P)))
            "failed")))
         (SEQ (LETT |rs| (SPADCALL (ELT $ 42) |ps| (QREFELT $ 43)))
              (EXIT
               (COND
                ((SPADCALL (ELT $ 23) |rs| (QREFELT $ 81))
                 (LIST (|spadConstant| $ 47)))
                ('T
                 (SEQ (LETT |contradiction| NIL)
                      (LETT |bs1| (SPADCALL (QREFELT $ 82))) (LETT |stop| NIL)
                      (SEQ G190
                           (COND
                            ((NULL (NULL (OR |contradiction| |stop|)))
                             (GO G191)))
                           (SEQ
                            (LETT |rec|
                                  (SPADCALL |rs| |pred?| |redOp?|
                                            (QREFELT $ 83)))
                            (LETT |bs2|
                                  (QCAR
                                   (PROG2 (LETT #4# |rec|)
                                       (QCDR #4#)
                                     (|check_union2| (QEQCAR #4# 0)
                                                     (|Record|
                                                      (|:| |bas|
                                                           (|GeneralTriangularSet|
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)
                                                            (QREFELT $ 8)
                                                            (QREFELT $ 9)))
                                                      (|:| |top|
                                                           (|List|
                                                            (QREFELT $ 9))))
                                                     (|Union|
                                                      (|Record|
                                                       (|:| |bas|
                                                            (|GeneralTriangularSet|
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7)
                                                             (QREFELT $ 8)
                                                             (QREFELT $ 9)))
                                                       (|:| |top|
                                                            (|List|
                                                             (QREFELT $ 9))))
                                                      #5="failed")
                                                     #4#))))
                            (LETT |rs|
                                  (QCDR
                                   (PROG2 (LETT #4# |rec|)
                                       (QCDR #4#)
                                     (|check_union2| (QEQCAR #4# 0)
                                                     (|Record|
                                                      (|:| |bas|
                                                           (|GeneralTriangularSet|
                                                            (QREFELT $ 6)
                                                            (QREFELT $ 7)
                                                            (QREFELT $ 8)
                                                            (QREFELT $ 9)))
                                                      (|:| |top|
                                                           (|List|
                                                            (QREFELT $ 9))))
                                                     (|Union|
                                                      (|Record|
                                                       (|:| |bas|
                                                            (|GeneralTriangularSet|
                                                             (QREFELT $ 6)
                                                             (QREFELT $ 7)
                                                             (QREFELT $ 8)
                                                             (QREFELT $ 9)))
                                                       (|:| |top|
                                                            (|List|
                                                             (QREFELT $ 9))))
                                                      #5#)
                                                     #4#))))
                            (LETT |ar| (CONS 0 |bs2|))
                            (COND
                             ((QEQCAR |ar| 0)
                              (SEQ
                               (LETT |bs2|
                                     (PROG2 (LETT #3# |ar|)
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (|GeneralTriangularSet|
                                                        (QREFELT $ 6)
                                                        (QREFELT $ 7)
                                                        (QREFELT $ 8)
                                                        (QREFELT $ 9))
                                                       (|Union|
                                                        (|GeneralTriangularSet|
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 9))
                                                        (|List| (QREFELT $ 9)))
                                                       #3#)))
                               (COND
                                ((SPADCALL |bs2| |bs1| (QREFELT $ 79))
                                 (SEQ
                                  (LETT |rs|
                                        (SPADCALL |rs| |bs2| |redOp| |redOp?|
                                                  (QREFELT $ 85)))
                                  (EXIT (LETT |bs1| |bs2|))))
                                ('T (LETT |stop| 'T)))
                               (EXIT
                                (LETT |rs|
                                      (SPADCALL (SPADCALL |bs2| (QREFELT $ 76))
                                                |rs| (QREFELT $ 66))))))
                             ('T
                              (LETT |rs|
                                    (SPADCALL
                                     (PROG2 (LETT #2# |ar|)
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 1)
                                                       (|List| (QREFELT $ 9))
                                                       (|Union|
                                                        (|GeneralTriangularSet|
                                                         (QREFELT $ 6)
                                                         (QREFELT $ 7)
                                                         (QREFELT $ 8)
                                                         (QREFELT $ 9))
                                                        (|List| (QREFELT $ 9)))
                                                       #2#))
                                     |rs| (QREFELT $ 66)))))
                            (EXIT
                             (COND
                              ((SPADCALL (ELT $ 23) |rs| (QREFELT $ 81))
                               (SEQ (LETT |contradiction| 'T)
                                    (EXIT
                                     (LETT |rs|
                                           (LIST (|spadConstant| $ 47)))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |rs|)))))))) 

(SDEFUN |PSETPK;removeRedundantFactors;2LML;24|
        ((|lp| |List| P) (|lq| |List| P)
         (|remOp| |Mapping| (|List| P) (|List| P)) ($ |List| P))
        (SEQ (LETT |lq| (SPADCALL |lq| |lp| NIL (QREFELT $ 48)))
             (LETT |lq| (SPADCALL |lq| |remOp|))
             (EXIT
              (SPADCALL (ELT $ 14) (SPADCALL |lp| |lq| (QREFELT $ 66))
                        (QREFELT $ 16))))) 

(SDEFUN |PSETPK;removeRedundantFactors;3L;25|
        ((|lp| |List| P) (|lq| |List| P) ($ |List| P))
        (SEQ (LETT |lq| (SPADCALL |lq| |lp| NIL (QREFELT $ 48)))
             (LETT |lq| (SPADCALL |lq| (QREFELT $ 89)))
             (EXIT
              (SPADCALL (ELT $ 14) (SPADCALL |lp| |lq| (QREFELT $ 66))
                        (QREFELT $ 16))))) 

(SDEFUN |PSETPK;irreducibleFactors;2L;26| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|newlp| (|List| P)) (|lf| (|List| P)) (#1=#:G410 NIL) (|rrz| NIL)
          (#2=#:G409 NIL)
          (|lrrz|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fp| (|Factored| P)) (|p| (P)))
         (SEQ (LETT |newlp| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |lp|)) (LETT |lp| (CDR |lp|))
                        (LETT |fp| (SPADCALL |p| (QREFELT $ 93)))
                        (LETT |lrrz| (SPADCALL |fp| (QREFELT $ 97)))
                        (LETT |lf|
                              (SPADCALL (ELT $ 23)
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |rrz| NIL)
                                              (LETT #1# |lrrz|) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |rrz| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS (QVELT |rrz| 1)
                                                            #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 43)))
                        (EXIT
                         (LETT |newlp|
                               (SPADCALL |lf| |newlp| (QREFELT $ 66)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |newlp| (QREFELT $ 12)))))) 

(SDEFUN |PSETPK;lazyIrreducibleFactors;2L;27| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|newlp| (|List| P)) (|lf| (|List| P)) (#1=#:G420 NIL) (|rrz| NIL)
          (#2=#:G419 NIL)
          (|lrrz|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fp| (|Factored| P)) (|p| (P)))
         (SEQ (LETT |lp| (SPADCALL |lp| (QREFELT $ 89))) (LETT |newlp| NIL)
              (SEQ G190 (COND ((NULL (NULL (NULL |lp|))) (GO G191)))
                   (SEQ (LETT |p| (|SPADfirst| |lp|)) (LETT |lp| (CDR |lp|))
                        (LETT |fp| (SPADCALL |p| (QREFELT $ 93)))
                        (LETT |lrrz| (SPADCALL |fp| (QREFELT $ 97)))
                        (LETT |lf|
                              (SPADCALL (ELT $ 23)
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |rrz| NIL)
                                              (LETT #1# |lrrz|) G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |rrz| (CAR #1#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS (QVELT |rrz| 1)
                                                            #2#))))
                                              (LETT #1# (CDR #1#)) (GO G190)
                                              G191 (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 43)))
                        (EXIT
                         (LETT |newlp|
                               (SPADCALL |lf| |newlp| (QREFELT $ 66)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |newlp|)))) 

(SDEFUN |PSETPK;removeIrreducibleRedundantFactors;3L;28|
        ((|lp| |List| P) (|lq| |List| P) ($ |List| P))
        (SEQ (LETT |lq| (SPADCALL |lq| |lp| NIL (QREFELT $ 48)))
             (LETT |lq| (SPADCALL |lq| (QREFELT $ 98)))
             (EXIT
              (SPADCALL (ELT $ 14) (SPADCALL |lp| |lq| (QREFELT $ 66))
                        (QREFELT $ 16))))) 

(SDEFUN |PSETPK;squareFreeFactors;PL;29| ((|p| P) ($ |List| P))
        (SPROG
         ((|lsf| (|List| P)) (#1=#:G430 NIL) (|foo| NIL) (#2=#:G429 NIL)
          (|sfp| (|Factored| P)))
         (SEQ (LETT |sfp| (SPADCALL |p| (QREFELT $ 102)))
              (LETT |lsf|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |foo| NIL)
                          (LETT #1# (SPADCALL |sfp| (QREFELT $ 97))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |foo| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS (QVELT |foo| 1) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT |lsf|)))) 

(SDEFUN |PSETPK;univariatePolynomialsGcds;LBL;30|
        ((|ps| |List| P) (|opt| |Boolean|) ($ |List| P))
        (SPROG
         ((|lg| (|List| P)) (|stop| (|Boolean|)) (|g| (P)) (|pInV| (|List| P))
          (|p| (P)) (|v| (V)))
         (SEQ (LETT |lg| NIL) (LETT |stop| NIL)
              (LETT |ps| (SPADCALL (ELT $ 14) |ps| (QREFELT $ 16)))
              (SEQ G190
                   (COND ((NULL (NULL (OR (NULL |ps|) |stop|))) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |ps|) NIL)
                                  ('T
                                   (NULL
                                    (SPADCALL (LETT |p| (|SPADfirst| |ps|))
                                              (QREFELT $ 33))))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |ps| (CDR |ps|)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL (NULL |ps|))
                       (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 31)))
                            (LETT |pInV| (LIST |p|))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |ps|) NIL)
                                          ('T
                                           (SPADCALL
                                            (SPADCALL
                                             (LETT |p| (|SPADfirst| |ps|))
                                             (QREFELT $ 31))
                                            |v| (QREFELT $ 32)))))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((SPADCALL |p| (QREFELT $ 33))
                                    (LETT |pInV| (CONS |p| |pInV|))))
                                  (EXIT (LETT |ps| (CDR |ps|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (LETT |g| (SPADCALL |pInV| (QREFELT $ 105)))
                            (LETT |stop|
                                  (COND (|opt| (SPADCALL |g| (QREFELT $ 23)))
                                        ('T NIL)))
                            (EXIT (LETT |lg| (CONS |g| |lg|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (COND (|stop| (LIST (|spadConstant| $ 47))) ('T |lg|)))))) 

(SDEFUN |PSETPK;univariatePolynomialsGcds;2L;31| ((|ps| |List| P) ($ |List| P))
        (SPADCALL |ps| NIL (QREFELT $ 106))) 

(SDEFUN |PSETPK;removeSquaresIfCan;2L;32| ((|lp| |List| P) ($ |List| P))
        (SPROG ((#1=#:G451 NIL) (|p| NIL) (#2=#:G450 NIL))
               (SEQ
                (COND ((NULL |lp|) |lp|)
                      ('T
                       (SPADCALL
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 108))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 12))))))) 

(SDEFUN |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;33|
        ((|ps| |List| P) (|redOp?| |Mapping| (|Boolean|) P P)
         (|redOp| |Mapping| P P P) ($ |List| P))
        (SPROG ((|ups| (|List| P)))
               (SEQ
                (LETT |ups|
                      (SPADCALL (SPADCALL |ps| 'T (QREFELT $ 106))
                                (QREFELT $ 109)))
                (LETT |ps|
                      (SPADCALL (SPADCALL |ups| |ps| (QREFELT $ 66))
                                (QREFELT $ 12)))
                (EXIT
                 (SPADCALL |ps| (ELT $ 40) |redOp?| |redOp| (QREFELT $ 86)))))) 

(SDEFUN |PSETPK;removeRoughlyRedundantFactorsInContents;3L;34|
        ((|ps| |List| P) (|lf| |List| P) ($ |List| P))
        (SPROG
         ((|newps| (|List| P)) (|newp| (P)) (|newcp| (P)) (#1=#:G460 NIL)
          (|test| (|Union| P "failed")) (|copylf| (|List| P)) (|f| (P))
          (#2=#:G477 NIL) (#3=#:G476 NIL) (|cp| (P)) (|p| (P)))
         (SEQ
          (COND ((NULL |ps|) |ps|)
                ('T
                 (SEQ (LETT |newps| NIL)
                      (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                           (SEQ (LETT |p| (|SPADfirst| |ps|))
                                (LETT |ps| (CDR |ps|))
                                (LETT |cp| (SPADCALL |p| (QREFELT $ 111)))
                                (LETT |newcp| (SPADCALL |cp| (QREFELT $ 108)))
                                (LETT |newp|
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL |p| |cp|
                                                          (QREFELT $ 45)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT $ 9)
                                                        (|Union| (QREFELT $ 9)
                                                                 #4="failed")
                                                        #1#)))
                                (COND
                                 ((NULL (SPADCALL |newcp| (QREFELT $ 23)))
                                  (SEQ
                                   (LETT |copylf|
                                         (PROGN
                                          (LETT #3# NIL)
                                          (SEQ (LETT |f| NIL) (LETT #2# |lf|)
                                               G190
                                               (COND
                                                ((OR (ATOM #2#)
                                                     (PROGN
                                                      (LETT |f| (CAR #2#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |f|
                                                              (QREFELT $ 31))
                                                    (SPADCALL |newcp|
                                                              (QREFELT $ 31))
                                                    (QREFELT $ 112))
                                                   (LETT #3#
                                                         (CONS |f| #3#))))))
                                               (LETT #2# (CDR #2#)) (GO G190)
                                               G191 (EXIT (NREVERSE #3#)))))
                                   (EXIT
                                    (SEQ G190
                                         (COND
                                          ((NULL
                                            (COND ((NULL |copylf|) NIL)
                                                  ('T
                                                   (NULL
                                                    (SPADCALL |newcp|
                                                              (QREFELT $
                                                                       23))))))
                                           (GO G191)))
                                         (SEQ (LETT |f| (|SPADfirst| |copylf|))
                                              (LETT |copylf| (CDR |copylf|))
                                              (LETT |test|
                                                    (SPADCALL |newcp| |f|
                                                              (QREFELT $ 45)))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |test| 0)
                                                 (LETT |newcp|
                                                       (PROG2 (LETT #1# |test|)
                                                           (QCDR #1#)
                                                         (|check_union2|
                                                          (QEQCAR #1# 0)
                                                          (QREFELT $ 9)
                                                          (|Union|
                                                           (QREFELT $ 9) #4#)
                                                          #1#)))))))
                                         NIL (GO G190) G191 (EXIT NIL))))))
                                (COND
                                 ((SPADCALL |newcp| (QREFELT $ 23))
                                  (LETT |newp|
                                        (SPADCALL |newp| (QREFELT $ 46))))
                                 ('T
                                  (LETT |newp|
                                        (SPADCALL
                                         (SPADCALL |newp| |newcp|
                                                   (QREFELT $ 113))
                                         (QREFELT $ 46)))))
                                (EXIT (LETT |newps| (CONS |newp| |newps|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |newps|))))))) 

(SDEFUN |PSETPK;removeRedundantFactorsInContents;3L;35|
        ((|ps| |List| P) (|lf| . #1=(|List| P)) ($ |List| P))
        (SPROG
         ((|newps| (|List| P)) (|newp| (P)) (|newcp| (P)) (#2=#:G480 NIL)
          (|g| (P)) (|copylf| #1#) (|f| (P)) (|cp| (P)) (|p| (P)))
         (SEQ
          (COND ((NULL |ps|) |ps|)
                ('T
                 (SEQ (LETT |newps| NIL)
                      (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                           (SEQ (LETT |p| (|SPADfirst| |ps|))
                                (LETT |ps| (CDR |ps|))
                                (LETT |cp| (SPADCALL |p| (QREFELT $ 111)))
                                (LETT |newcp| (SPADCALL |cp| (QREFELT $ 108)))
                                (LETT |newp|
                                      (PROG2
                                          (LETT #2#
                                                (SPADCALL |p| |cp|
                                                          (QREFELT $ 45)))
                                          (QCDR #2#)
                                        (|check_union2| (QEQCAR #2# 0)
                                                        (QREFELT $ 9)
                                                        (|Union| (QREFELT $ 9)
                                                                 #3="failed")
                                                        #2#)))
                                (COND
                                 ((NULL (SPADCALL |newcp| (QREFELT $ 23)))
                                  (SEQ (LETT |copylf| |lf|)
                                       (EXIT
                                        (SEQ G190
                                             (COND
                                              ((NULL
                                                (COND ((NULL |copylf|) NIL)
                                                      ('T
                                                       (NULL
                                                        (SPADCALL |newcp|
                                                                  (QREFELT $
                                                                           23))))))
                                               (GO G191)))
                                             (SEQ
                                              (LETT |f| (|SPADfirst| |copylf|))
                                              (LETT |copylf| (CDR |copylf|))
                                              (LETT |g|
                                                    (SPADCALL |newcp| |f|
                                                              (QREFELT $ 115)))
                                              (EXIT
                                               (COND
                                                ((NULL
                                                  (SPADCALL |g|
                                                            (QREFELT $ 23)))
                                                 (LETT |newcp|
                                                       (PROG2
                                                           (LETT #2#
                                                                 (SPADCALL
                                                                  |newcp| |g|
                                                                  (QREFELT $
                                                                           45)))
                                                           (QCDR #2#)
                                                         (|check_union2|
                                                          (QEQCAR #2# 0)
                                                          (QREFELT $ 9)
                                                          (|Union|
                                                           (QREFELT $ 9) #3#)
                                                          #2#)))))))
                                             NIL (GO G190) G191 (EXIT NIL))))))
                                (COND
                                 ((SPADCALL |newcp| (QREFELT $ 23))
                                  (LETT |newp|
                                        (SPADCALL |newp| (QREFELT $ 46))))
                                 ('T
                                  (LETT |newp|
                                        (SPADCALL
                                         (SPADCALL |newp| |newcp|
                                                   (QREFELT $ 113))
                                         (QREFELT $ 46)))))
                                (EXIT (LETT |newps| (CONS |newp| |newps|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |newps|))))))) 

(SDEFUN |PSETPK;removeRedundantFactorsInPols;3L;36|
        ((|ps| |List| P) (|lf| . #1=(|List| P)) ($ |List| P))
        (SPROG
         ((|newps| (|List| P)) (|newp| (P)) (#2=#:G496 NIL) (|g| (P))
          (|newcp| (P)) (|copylf| #1#) (|f| (P)) (|cp| (P)) (|p| (P)))
         (SEQ
          (COND ((NULL |ps|) |ps|)
                ('T
                 (SEQ (LETT |newps| NIL)
                      (SEQ G190 (COND ((NULL (NULL (NULL |ps|))) (GO G191)))
                           (SEQ (LETT |p| (|SPADfirst| |ps|))
                                (LETT |ps| (CDR |ps|))
                                (LETT |cp| (SPADCALL |p| (QREFELT $ 111)))
                                (LETT |newcp| (SPADCALL |cp| (QREFELT $ 108)))
                                (LETT |newp|
                                      (PROG2
                                          (LETT #2#
                                                (SPADCALL |p| |cp|
                                                          (QREFELT $ 45)))
                                          (QCDR #2#)
                                        (|check_union2| (QEQCAR #2# 0)
                                                        (QREFELT $ 9)
                                                        (|Union| (QREFELT $ 9)
                                                                 #3="failed")
                                                        #2#)))
                                (LETT |newp| (SPADCALL |newp| (QREFELT $ 108)))
                                (LETT |copylf| |lf|)
                                (SEQ G190
                                     (COND
                                      ((NULL (NULL (NULL |copylf|)))
                                       (GO G191)))
                                     (SEQ (LETT |f| (|SPADfirst| |copylf|))
                                          (LETT |copylf| (CDR |copylf|))
                                          (COND
                                           ((NULL
                                             (SPADCALL |newcp| (QREFELT $ 23)))
                                            (SEQ
                                             (LETT |g|
                                                   (SPADCALL |newcp| |f|
                                                             (QREFELT $ 115)))
                                             (EXIT
                                              (COND
                                               ((NULL
                                                 (SPADCALL |g| (QREFELT $ 23)))
                                                (LETT |newcp|
                                                      (PROG2
                                                          (LETT #2#
                                                                (SPADCALL
                                                                 |newcp| |g|
                                                                 (QREFELT $
                                                                          45)))
                                                          (QCDR #2#)
                                                        (|check_union2|
                                                         (QEQCAR #2# 0)
                                                         (QREFELT $ 9)
                                                         (|Union| (QREFELT $ 9)
                                                                  #3#)
                                                         #2#)))))))))
                                          (EXIT
                                           (COND
                                            ((NULL
                                              (SPADCALL |newp| (QREFELT $ 23)))
                                             (SEQ
                                              (LETT |g|
                                                    (SPADCALL |newp| |f|
                                                              (QREFELT $ 115)))
                                              (EXIT
                                               (COND
                                                ((NULL
                                                  (SPADCALL |g|
                                                            (QREFELT $ 23)))
                                                 (LETT |newp|
                                                       (PROG2
                                                           (LETT #2#
                                                                 (SPADCALL
                                                                  |newp| |g|
                                                                  (QREFELT $
                                                                           45)))
                                                           (QCDR #2#)
                                                         (|check_union2|
                                                          (QEQCAR #2# 0)
                                                          (QREFELT $ 9)
                                                          (|Union|
                                                           (QREFELT $ 9) #3#)
                                                          #2#)))))))))))
                                     NIL (GO G190) G191 (EXIT NIL))
                                (COND
                                 ((SPADCALL |newcp| (QREFELT $ 23))
                                  (LETT |newp|
                                        (SPADCALL |newp| (QREFELT $ 46))))
                                 ('T
                                  (LETT |newp|
                                        (SPADCALL
                                         (SPADCALL |newp| |newcp|
                                                   (QREFELT $ 113))
                                         (QREFELT $ 46)))))
                                (EXIT (LETT |newps| (CONS |newp| |newps|))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |newps|))))))) 

(SDEFUN |PSETPK;removeRedundantFactors;2PL;37| ((|a| P) (|b| P) ($ |List| P))
        (SPROG ((#1=#:G515 NIL) (|#G88| (P)) (|#G87| (P)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (SPADCALL |a| (QREFELT $ 108))
                                  (QREFELT $ 10)))
                  (LETT |b|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 108))
                                  (QREFELT $ 10)))
                  (COND
                   ((NULL (SPADCALL |a| |b| (QREFELT $ 14)))
                    (PROGN
                     (LETT |#G87| |b|)
                     (LETT |#G88| |a|)
                     (LETT |a| |#G87|)
                     (LETT |b| |#G88|))))
                  (EXIT
                   (COND
                    ((SPADCALL |a| (QREFELT $ 23))
                     (COND
                      ((SPADCALL |b| (QREFELT $ 23))
                       (PROGN (LETT #1# NIL) (GO #2=#:G514)))
                      (#3='T (PROGN (LETT #1# (LIST |b|)) (GO #2#)))))
                    ((SPADCALL |b| (QREFELT $ 23))
                     (PROGN (LETT #1# (LIST |a|)) (GO #2#)))
                    (#3#
                     (PROGN
                      (LETT #1# (SPADCALL |a| |b| (QREFELT $ 118)))
                      (GO #2#)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |PSETPK;unprotectedRemoveRedundantFactors;2PL;38|
        ((|a| P) (|b| P) ($ |List| P))
        (SPROG
         ((#1=#:G523 NIL) (#2=#:G517 NIL) (|g| (P)) (|d| (P))
          (|c| (|Union| P #3="failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |c| (SPADCALL |b| |a| (QREFELT $ 45)))
                (EXIT
                 (COND
                  ((QEQCAR |c| 0)
                   (SEQ
                    (LETT |d|
                          (PROG2 (LETT #2# |c|)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) #3#) #2#)))
                    (EXIT
                     (COND
                      ((SPADCALL |d| (QREFELT $ 23))
                       (PROGN (LETT #1# (LIST |a|)) (GO #4=#:G522)))
                      (#5='T (PROGN (LETT #1# (LIST |a| |d|)) (GO #4#)))))))
                  (#5#
                   (SEQ (LETT |g| (SPADCALL |a| |b| (QREFELT $ 115)))
                        (EXIT
                         (COND
                          ((SPADCALL |g| (QREFELT $ 23))
                           (PROGN (LETT #1# (LIST |a| |b|)) (GO #4#)))
                          (#5#
                           (PROGN
                            (LETT #1#
                                  (LIST |g|
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |a| |g|
                                                            (QREFELT $ 45)))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (QREFELT $ 9)
                                                          (|Union|
                                                           (QREFELT $ 9) #3#)
                                                          #2#))
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |b| |g|
                                                            (QREFELT $ 45)))
                                            (QCDR #2#)
                                          (|check_union2| (QEQCAR #2# 0)
                                                          (QREFELT $ 9)
                                                          (|Union|
                                                           (QREFELT $ 9) #3#)
                                                          #2#))))
                            (GO #4#)))))))))))
          #4# (EXIT #1#)))) 

(PUT '|PSETPK;removeSquaresIfCan;2L;39| '|SPADreplace| '(XLAM (|lp|) |lp|)) 

(SDEFUN |PSETPK;removeSquaresIfCan;2L;39| ((|lp| |List| P) ($ |List| P)) |lp|) 

(SDEFUN |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;40|
        ((|ps| |List| P) (|redOp?| |Mapping| (|Boolean|) P P)
         (|redOp| |Mapping| P P P) ($ |List| P))
        (SPADCALL |ps| (ELT $ 40) |redOp?| |redOp| (QREFELT $ 86))) 

(SDEFUN |PSETPK;removeRedundantFactors;2PL;41| ((|a| P) (|b| P) ($ |List| P))
        (SPROG ((#1=#:G536 NIL) (|#G98| (P)) (|#G97| (P)))
               (SEQ
                (EXIT
                 (SEQ (LETT |a| (SPADCALL |a| (QREFELT $ 10)))
                      (LETT |b| (SPADCALL |b| (QREFELT $ 10)))
                      (COND
                       ((NULL (SPADCALL |a| |b| (QREFELT $ 14)))
                        (PROGN
                         (LETT |#G97| |b|)
                         (LETT |#G98| |a|)
                         (LETT |a| |#G97|)
                         (LETT |b| |#G98|))))
                      (EXIT
                       (COND
                        ((SPADCALL |a| (QREFELT $ 23))
                         (COND
                          ((SPADCALL |b| (QREFELT $ 23))
                           (PROGN (LETT #1# NIL) (GO #2=#:G535)))
                          (#3='T (PROGN (LETT #1# (LIST |b|)) (GO #2#)))))
                        ((SPADCALL |b| (QREFELT $ 23))
                         (PROGN (LETT #1# (LIST |a|)) (GO #2#)))
                        (#3#
                         (PROGN
                          (LETT #1# (SPADCALL |a| |b| (QREFELT $ 118)))
                          (GO #2#)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |PSETPK;unprotectedRemoveRedundantFactors;2PL;42|
        ((|a| P) (|b| P) ($ |List| P))
        (SPROG
         ((#1=#:G545 NIL) (|d| (P)) (|#G102| (P)) (|#G101| (P)) (#2=#:G538 NIL)
          (|c| (|Union| P #3="failed")))
         (SEQ
          (EXIT
           (SEQ (LETT |c| (SPADCALL |b| |a| (QREFELT $ 45)))
                (EXIT
                 (COND
                  ((QEQCAR |c| 0)
                   (SEQ
                    (LETT |d|
                          (PROG2 (LETT #2# |c|)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (QREFELT $ 9)
                                            (|Union| (QREFELT $ 9) #3#) #2#)))
                    (EXIT
                     (COND
                      ((SPADCALL |d| (QREFELT $ 23))
                       (PROGN (LETT #1# (LIST |a|)) (GO #4=#:G544)))
                      (#5='T
                       (SEQ
                        (COND
                         ((SPADCALL |d| |a| (QREFELT $ 14))
                          (PROGN
                           (LETT |#G101| |d|)
                           (LETT |#G102| |a|)
                           (LETT |a| |#G101|)
                           (LETT |d| |#G102|))))
                        (EXIT
                         (PROGN
                          (LETT #1# (SPADCALL |a| |d| (QREFELT $ 118)))
                          (GO #4#)))))))))
                  (#5# (PROGN (LETT #1# (LIST |a| |b|)) (GO #4#)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |PSETPK;removeRedundantFactors;2L;43| ((|lp| |List| P) ($ |List| P))
        (SPROG
         ((|top| (|List| P)) (|base| (|List| P)) (|p| (P)) (#1=#:G561 NIL)
          (#2=#:G560 NIL) (#3=#:G559 NIL) (#4=#:G558 NIL))
         (SEQ (LETT |lp| (SPADCALL (ELT $ 23) |lp| (QREFELT $ 43)))
              (LETT |lp|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |p| NIL) (LETT #3# |lp|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS (SPADCALL |p| (QREFELT $ 10)) #4#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (QREFELT $ 12)))
              (LETT |lp| (SPADCALL |lp| (QREFELT $ 109)))
              (LETT |lp|
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |p| NIL) (LETT #1# |lp|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |p| (QREFELT $ 46)) #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 12)))
              (EXIT
               (COND ((OR (NULL |lp|) (SPADCALL |lp| 1 (QREFELT $ 120))) |lp|)
                     ('T
                      (SEQ
                       (LETT |lp| (SPADCALL (ELT $ 14) |lp| (QREFELT $ 16)))
                       (LETT |p| (|SPADfirst| |lp|)) (LETT |lp| (CDR |lp|))
                       (LETT |base|
                             (SPADCALL |p| (|SPADfirst| |lp|) (QREFELT $ 118)))
                       (LETT |top| (CDR |lp|))
                       (SEQ G190 (COND ((NULL (NULL (NULL |top|))) (GO G191)))
                            (SEQ (LETT |p| (|SPADfirst| |top|))
                                 (LETT |base|
                                       (SPADCALL |base| |p| (QREFELT $ 121)))
                                 (EXIT (LETT |top| (CDR |top|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |base|)))))))) 

(SDEFUN |PSETPK;removeRedundantFactors;LPL;44|
        ((|lp| |List| P) (|a| P) ($ |List| P))
        (SPROG
         ((|toSave| (|List| P)) (|e| (P)) (|rrf| (|List| P)) (|d| (P))
          (|toSee| (|List| P)) (|c| (P)) (|#G111| (P)) (|#G110| (P))
          (|#G109| (P)) (|#G108| (P)) (|b| (P)))
         (SEQ (LETT |lp| (SPADCALL (ELT $ 23) |lp| (QREFELT $ 43)))
              (LETT |lp| (SPADCALL (ELT $ 14) |lp| (QREFELT $ 16)))
              (EXIT
               (COND ((SPADCALL |a| (QREFELT $ 23)) |lp|)
                     ((NULL |lp|) (LIST |a|))
                     ('T
                      (SEQ (LETT |toSee| |lp|) (LETT |toSave| NIL)
                           (SEQ G190
                                (COND ((NULL (NULL (NULL |toSee|))) (GO G191)))
                                (SEQ (LETT |b| (|SPADfirst| |toSee|))
                                     (LETT |toSee| (CDR |toSee|))
                                     (COND
                                      ((SPADCALL |b| |a| (QREFELT $ 14))
                                       (PROGN
                                        (LETT |#G108| |b|)
                                        (LETT |#G109| |a|)
                                        (LETT |c| |#G108|)
                                        (LETT |d| |#G109|)))
                                      ('T
                                       (PROGN
                                        (LETT |#G110| |a|)
                                        (LETT |#G111| |b|)
                                        (LETT |c| |#G110|)
                                        (LETT |d| |#G111|))))
                                     (LETT |rrf|
                                           (SPADCALL |c| |d| (QREFELT $ 118)))
                                     (EXIT
                                      (COND
                                       ((NULL |rrf|)
                                        (|error|
                                         "in removeRedundantFactors : (LP,P) -> LP from PSETPK"))
                                       ('T
                                        (SEQ (LETT |c| (|SPADfirst| |rrf|))
                                             (LETT |rrf| (CDR |rrf|))
                                             (COND
                                              ((NULL |rrf|)
                                               (COND
                                                ((SPADCALL |c| |b|
                                                           (QREFELT $ 65))
                                                 (SEQ
                                                  (LETT |toSave|
                                                        (SPADCALL |toSave|
                                                                  |toSee|
                                                                  (QREFELT $
                                                                           66)))
                                                  (LETT |a| |b|)
                                                  (EXIT (LETT |toSee| NIL))))
                                                ('T
                                                 (SEQ (LETT |a| |c|)
                                                      (LETT |toSee|
                                                            (SPADCALL |toSave|
                                                                      |toSee|
                                                                      (QREFELT
                                                                       $ 66)))
                                                      (EXIT
                                                       (LETT |toSave| NIL))))))
                                              ('T
                                               (SEQ
                                                (LETT |d| (|SPADfirst| |rrf|))
                                                (LETT |rrf| (CDR |rrf|))
                                                (EXIT
                                                 (COND
                                                  ((NULL |rrf|)
                                                   (COND
                                                    ((SPADCALL |c| |b|
                                                               (QREFELT $ 65))
                                                     (SEQ
                                                      (LETT |toSave|
                                                            (SPADCALL |toSave|
                                                                      (LIST
                                                                       |b|)
                                                                      (QREFELT
                                                                       $ 66)))
                                                      (EXIT (LETT |a| |d|))))
                                                    ((SPADCALL |d| |b|
                                                               (QREFELT $ 65))
                                                     (SEQ
                                                      (LETT |toSave|
                                                            (SPADCALL |toSave|
                                                                      (LIST
                                                                       |b|)
                                                                      (QREFELT
                                                                       $ 66)))
                                                      (EXIT (LETT |a| |c|))))
                                                    ('T
                                                     (SEQ
                                                      (LETT |toSave|
                                                            (SPADCALL |toSave|
                                                                      |c|
                                                                      (QREFELT
                                                                       $ 121)))
                                                      (EXIT (LETT |a| |d|))))))
                                                  ('T
                                                   (SEQ
                                                    (LETT |e|
                                                          (|SPADfirst| |rrf|))
                                                    (COND
                                                     ((NULL (NULL (CDR |rrf|)))
                                                      (EXIT
                                                       (|error|
                                                        "in removeRedundantFactors:(LP,P)->LP from PSETPK"))))
                                                    (LETT |toSave|
                                                          (SPADCALL |toSave|
                                                                    |c|
                                                                    (QREFELT $
                                                                             121)))
                                                    (LETT |toSave|
                                                          (SPADCALL |toSave|
                                                                    |d|
                                                                    (QREFELT $
                                                                             121)))
                                                    (EXIT
                                                     (LETT |a| |e|)))))))))
                                             (EXIT
                                              (COND
                                               ((NULL |toSee|)
                                                (LETT |toSave|
                                                      (SPADCALL (ELT $ 14)
                                                                (CONS |a|
                                                                      |toSave|)
                                                                (QREFELT $
                                                                         16)))))))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |toSave|)))))))) 

(DECLAIM (NOTINLINE |PolynomialSetUtilitiesPackage;|)) 

(DEFUN |PolynomialSetUtilitiesPackage| (&REST #1=#:G588)
  (SPROG NIL
         (PROG (#2=#:G589)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialSetUtilitiesPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PolynomialSetUtilitiesPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialSetUtilitiesPackage|)))))))))) 

(DEFUN |PolynomialSetUtilitiesPackage;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialSetUtilitiesPackage| DV$1 DV$2 DV$3 DV$4))
    (LETT $ (GETREFV 122))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (|HasCategory| |#1| '(|GcdDomain|))))))
    (|haddProp| |$ConstructorCache| '|PolynomialSetUtilitiesPackage|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (PROGN
         (QSETREFV $ 98
                   (CONS (|dispatchFunction| |PSETPK;irreducibleFactors;2L;26|)
                         $))
         (QSETREFV $ 99
                   (CONS
                    (|dispatchFunction| |PSETPK;lazyIrreducibleFactors;2L;27|)
                    $))
         (QSETREFV $ 100
                   (CONS
                    (|dispatchFunction|
                     |PSETPK;removeIrreducibleRedundantFactors;3L;28|)
                    $)))))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV $ 103
                 (CONS (|dispatchFunction| |PSETPK;squareFreeFactors;PL;29|)
                       $))
       (QSETREFV $ 106
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;univariatePolynomialsGcds;LBL;30|)
                  $))
       (QSETREFV $ 107
                 (CONS
                  (|dispatchFunction| |PSETPK;univariatePolynomialsGcds;2L;31|)
                  $))
       (QSETREFV $ 109
                 (CONS (|dispatchFunction| |PSETPK;removeSquaresIfCan;2L;32|)
                       $))
       (QSETREFV $ 110
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;33|)
                  $))
       (QSETREFV $ 114
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;removeRoughlyRedundantFactorsInContents;3L;34|)
                  $))
       (QSETREFV $ 116
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;removeRedundantFactorsInContents;3L;35|)
                  $))
       (QSETREFV $ 117
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;removeRedundantFactorsInPols;3L;36|)
                  $))
       (QSETREFV $ 119
                 (CONS
                  (|dispatchFunction| |PSETPK;removeRedundantFactors;2PL;37|)
                  $))
       (QSETREFV $ 118
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;unprotectedRemoveRedundantFactors;2PL;38|)
                  $))))
     ('T
      (PROGN
       (QSETREFV $ 109
                 (CONS (|dispatchFunction| |PSETPK;removeSquaresIfCan;2L;39|)
                       $))
       (QSETREFV $ 110
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;rewriteIdealWithQuasiMonicGenerators;LMML;40|)
                  $))
       (QSETREFV $ 119
                 (CONS
                  (|dispatchFunction| |PSETPK;removeRedundantFactors;2PL;41|)
                  $))
       (QSETREFV $ 118
                 (CONS
                  (|dispatchFunction|
                   |PSETPK;unprotectedRemoveRedundantFactors;2PL;42|)
                  $)))))
    $))) 

(MAKEPROP '|PolynomialSetUtilitiesPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |primPartElseUnitCanonical|)
              (|List| 9) (5 . |removeDuplicates|) (|Boolean|)
              (10 . |infRittWu?|) (|Mapping| 13 9 9) (16 . |sort|)
              (|Record| (|:| |goodPols| 11) (|:| |badPols| 11))
              (|Mapping| 13 9) |PSETPK;selectPolynomials;MLR;2| (|List| 18)
              |PSETPK;selectOrPolynomials;LLR;3|
              |PSETPK;selectAndPolynomials;LLR;4| (22 . |ground?|)
              (|NonNegativeInteger|) (27 . |mdeg|) (32 . |One|)
              |PSETPK;linear?;PB;5| |PSETPK;linearPolynomials;LR;6|
              (36 . |init|) (41 . |tail|) (46 . |mvar|) (51 . =)
              |PSETPK;univariate?;PB;7| |PSETPK;univariatePolynomials;LR;8|
              |PSETPK;bivariate?;PB;9| (57 . >) (63 . <) (69 . |degree|)
              |PSETPK;bivariatePolynomials;LR;10| (75 . |quasiMonic?|)
              |PSETPK;quasiMonicPolynomials;LR;11| (80 . |zero?|)
              (85 . |remove|) (|Union| $ '"failed") (91 . |exquo|)
              (97 . |unitCanonical|) (102 . |One|)
              |PSETPK;removeRoughlyRedundantFactorsInPols;2LBL;12|
              |PSETPK;removeRoughlyRedundantFactorsInPol;PLP;13|
              |PSETPK;removeRoughlyRedundantFactorsInPols;3L;14|
              |PSETPK;certainlySubVariety?;2LB;16| (|List| 11)
              |PSETPK;possiblyNewVariety?;LLB;15|
              (|GeneralPolynomialSet| 6 7 8 9) (106 . |construct|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (111 . |remainder|) (|List| 8) (117 . |variables|)
              (122 . |concat|) (128 . |removeDuplicates|) (133 . >)
              |PSETPK;probablyZeroDim?;LB;17| (139 . |supRittWu?|)
              (145 . |associates?|) (151 . |concat|) |PSETPK;interReduce;2L;18|
              (|Record| (|:| |bas| $) (|:| |top| 11)) (|Union| 68 '"failed")
              (|GeneralTriangularSet| 6 7 8 9) (157 . |basicSet|)
              (|Record| (|:| |bas| 70) (|:| |top| 11)) (|Union| 72 '"failed")
              |PSETPK;roughBasicSet;LU;20| (163 . |empty?|) (168 . |members|)
              (173 . |rewriteIdealWithRemainder|) (179 . =)
              (185 . |infRittWu?|) |PSETPK;crushedSet;2L;22| (191 . |any?|)
              (197 . |empty|) (201 . |basicSet|) (|Mapping| 9 9 9)
              (208 . |rewriteSetWithReduction|)
              |PSETPK;rewriteSetByReducingWithParticularGenerators;LMMML;23|
              (|Mapping| 11 11) |PSETPK;removeRedundantFactors;2LML;24|
              |PSETPK;removeRedundantFactors;2L;43|
              |PSETPK;removeRedundantFactors;3L;25| (|Factored| 9)
              (|MultivariateFactorize| 8 7 6 9) (216 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 94) (|:| |factor| 9) (|:| |exponent| 24))
              (|List| 95) (221 . |factorList|) (226 . |irreducibleFactors|)
              (231 . |lazyIrreducibleFactors|)
              (236 . |removeIrreducibleRedundantFactors|) (|Factored| $)
              (242 . |squareFree|) (247 . |squareFreeFactors|) (|List| $)
              (252 . |gcd|) (257 . |univariatePolynomialsGcds|)
              (263 . |univariatePolynomialsGcds|) (268 . |squareFreePart|)
              (273 . |removeSquaresIfCan|)
              (278 . |rewriteIdealWithQuasiMonicGenerators|)
              (285 . |mainContent|) (290 . <=) (296 . *)
              (302 . |removeRoughlyRedundantFactorsInContents|) (308 . |gcd|)
              (314 . |removeRedundantFactorsInContents|)
              (320 . |removeRedundantFactorsInPols|)
              (326 . |unprotectedRemoveRedundantFactors|)
              (332 . |removeRedundantFactors|) (338 . |size?|)
              |PSETPK;removeRedundantFactors;LPL;44|)
           '#(|unprotectedRemoveRedundantFactors| 344
              |univariatePolynomialsGcds| 350 |univariatePolynomials| 361
              |univariate?| 366 |squareFreeFactors| 371 |selectPolynomials| 376
              |selectOrPolynomials| 382 |selectAndPolynomials| 388
              |roughBasicSet| 394
              |rewriteSetByReducingWithParticularGenerators| 399
              |rewriteIdealWithQuasiMonicGenerators| 407 |removeSquaresIfCan|
              414 |removeRoughlyRedundantFactorsInPols| 419
              |removeRoughlyRedundantFactorsInPol| 432
              |removeRoughlyRedundantFactorsInContents| 438
              |removeRedundantFactorsInPols| 444
              |removeRedundantFactorsInContents| 450 |removeRedundantFactors|
              456 |removeIrreducibleRedundantFactors| 486
              |quasiMonicPolynomials| 492 |probablyZeroDim?| 497
              |possiblyNewVariety?| 502 |linearPolynomials| 508 |linear?| 513
              |lazyIrreducibleFactors| 518 |irreducibleFactors| 523
              |interReduce| 528 |crushedSet| 533 |certainlySubVariety?| 538
              |bivariatePolynomials| 544 |bivariate?| 549)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 121
                                                 '(1 9 0 0 10 1 11 0 0 12 2 9
                                                   13 0 0 14 2 11 0 15 0 16 1 9
                                                   13 0 23 1 9 24 0 25 0 6 0 26
                                                   1 9 0 0 29 1 9 0 0 30 1 9 8
                                                   0 31 2 8 13 0 0 32 2 8 13 0
                                                   0 36 2 8 13 0 0 37 2 9 24 0
                                                   8 38 1 9 13 0 40 1 9 13 0 42
                                                   2 11 0 18 0 43 2 9 44 0 0 45
                                                   1 9 0 0 46 0 9 0 47 1 54 0
                                                   11 55 2 54 56 9 0 57 1 9 58
                                                   0 59 2 58 0 0 0 60 1 58 0 0
                                                   61 2 24 13 0 0 62 2 9 13 0 0
                                                   64 2 9 13 0 0 65 2 11 0 0 0
                                                   66 2 70 69 11 15 71 1 70 13
                                                   0 75 1 70 11 0 76 2 70 11 11
                                                   0 77 2 9 13 0 0 78 2 70 13 0
                                                   0 79 2 11 13 18 0 81 0 70 0
                                                   82 3 70 69 11 18 15 83 4 70
                                                   11 11 0 84 15 85 1 92 91 9
                                                   93 1 91 96 0 97 1 0 11 11 98
                                                   1 0 11 11 99 2 0 11 11 11
                                                   100 1 9 101 0 102 1 0 11 9
                                                   103 1 9 0 104 105 2 0 11 11
                                                   13 106 1 0 11 11 107 1 9 0 0
                                                   108 1 0 11 11 109 3 0 11 11
                                                   15 84 110 1 9 0 0 111 2 8 13
                                                   0 0 112 2 9 0 0 0 113 2 0 11
                                                   11 11 114 2 9 0 0 0 115 2 0
                                                   11 11 11 116 2 0 11 11 11
                                                   117 2 0 11 9 9 118 2 0 11 9
                                                   9 119 2 11 13 0 24 120 2 0
                                                   11 9 9 118 1 2 11 11 107 2 2
                                                   11 11 13 106 1 0 17 11 34 1
                                                   0 13 9 33 1 2 11 9 103 2 0
                                                   17 18 11 19 2 0 17 20 11 21
                                                   2 0 17 20 11 22 1 0 73 11 74
                                                   4 0 11 11 18 15 84 86 3 0 11
                                                   11 15 84 110 1 0 11 11 109 3
                                                   0 11 11 11 13 48 2 0 11 11
                                                   11 50 2 0 9 9 11 49 2 2 11
                                                   11 11 114 2 2 11 11 11 117 2
                                                   2 11 11 11 116 2 0 11 9 9
                                                   119 1 0 11 11 89 2 0 11 11
                                                   11 90 2 0 11 11 9 121 3 0 11
                                                   11 11 87 88 2 1 11 11 11 100
                                                   1 0 17 11 41 1 0 13 11 63 2
                                                   0 13 11 52 53 1 0 17 11 28 1
                                                   0 13 9 27 1 1 11 11 99 1 1
                                                   11 11 98 1 0 11 11 67 1 0 11
                                                   11 80 2 0 13 11 11 51 1 0 17
                                                   11 39 1 0 13 9 35)))))
           '|lookupComplete|)) 
