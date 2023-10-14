
(/VERSIONCHECK 2) 

(DEFUN |CTRIGMNP;real;FE;1| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 12))) 

(DEFUN |CTRIGMNP;imag;FE;2| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 10)) (QREFELT $ 14))) 

(DEFUN |CTRIGMNP;rreal?| (|r| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 17)) (QREFELT $ 19))) 

(DEFUN |CTRIGMNP;kreal?| (|k| $)
  (SPADCALL (ELT $ 20) (SPADCALL |k| (QREFELT $ 23)) (QREFELT $ 25))) 

(DEFUN |CTRIGMNP;complexForm;FC;5| (|f| $) (SPADCALL |f| (QREFELT $ 27))) 

(DEFUN |CTRIGMNP;trigs;2F;6| (|f| $)
  (SPADCALL (SPADCALL |f| (QREFELT $ 27)) (QREFELT $ 28))) 

(DEFUN |CTRIGMNP;real?;FB;7| (|f| $)
  (COND
   ((SPADCALL (CONS (|function| |CTRIGMNP;rreal?|) $)
              (SPADCALL (SPADCALL |f| (QREFELT $ 31)) (QREFELT $ 34))
              (QREFELT $ 36))
    (COND
     ((SPADCALL (CONS (|function| |CTRIGMNP;rreal?|) $)
                (SPADCALL (SPADCALL |f| (QREFELT $ 37)) (QREFELT $ 34))
                (QREFELT $ 36))
      (SPADCALL (CONS (|function| |CTRIGMNP;kreal?|) $)
                (SPADCALL |f| (QREFELT $ 39)) (QREFELT $ 42)))
     (#1='T 'NIL)))
   (#1# 'NIL))) 

(DEFUN |CTRIGMNP;localexplogs| (|f| |g| $)
  (PROG (#1=#:G128 |k| #2=#:G127)
    (RETURN
     (SEQ
      (SPADCALL |g|
                (PROGN
                 (LETT #2# NIL . #3=(|CTRIGMNP;localexplogs|))
                 (SEQ (LETT |k| NIL . #3#)
                      (LETT #1# (SPADCALL |f| (QREFELT $ 43)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |k| '|tan| (QREFELT $ 45)) 'T)
                                ('T (SPADCALL |k| '|cot| (QREFELT $ 45))))
                          (LETT #2# (CONS |k| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 46)))))) 

(DEFUN |CTRIGMNP;complexElementary;2F;9| (|f| $)
  (PROG (|g|)
    (RETURN
     (COND
      ((SPADCALL
        (CONS #'|CTRIGMNP;complexElementary;2F;9!0| (VECTOR $ (QREFELT $ 8)))
        (SPADCALL
         (LETT |g| (SPADCALL |f| (QREFELT $ 50))
               |CTRIGMNP;complexElementary;2F;9|)
         (QREFELT $ 52))
        (QREFELT $ 54))
       (|CTRIGMNP;localexplogs| |f| |g| $))
      ('T |g|))))) 

(DEFUN |CTRIGMNP;complexElementary;2F;9!0| (|x| $$)
  (PROG (RTRIG $)
    (LETT RTRIG (QREFELT $$ 1) . #1=(|CTRIGMNP;complexElementary;2F;9|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x| RTRIG (QREFELT $ 48)))))) 

(DEFUN |CTRIGMNP;complexElementary;FSF;10| (|f| |x| $)
  (PROG (#1=#:G137 |g| |k| #2=#:G136)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (CONS #'|CTRIGMNP;complexElementary;FSF;10!0|
               (VECTOR (QREFELT $ 8) $))
         (PROGN
          (LETT #2# NIL . #3=(|CTRIGMNP;complexElementary;FSF;10|))
          (SEQ (LETT |k| NIL . #3#)
               (LETT #1#
                     (SPADCALL
                      (LETT |g| (SPADCALL |f| |x| (QREFELT $ 57)) . #3#)
                      (QREFELT $ 43))
                     . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x|
                             (SPADCALL (SPADCALL |k| (QREFELT $ 59))
                                       (QREFELT $ 61))
                             (QREFELT $ 62))
                   (LETT #2# (CONS |k| #2#) . #3#)))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 63))
        (|CTRIGMNP;localexplogs| |f| |g| $))
       ('T |g|)))))) 

(DEFUN |CTRIGMNP;complexElementary;FSF;10!0| (|y| $$)
  (PROG ($ RTRIG)
    (LETT $ (QREFELT $$ 1) . #1=(|CTRIGMNP;complexElementary;FSF;10|))
    (LETT RTRIG (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 56)) RTRIG (QREFELT $ 48)))))) 

(DEFUN |CTRIGMNP;complexNormalize;FSF;11| (|f| |x| $)
  (PROG (#1=#:G144 |g| |k| #2=#:G143)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (CONS #'|CTRIGMNP;complexNormalize;FSF;11!0| (VECTOR (QREFELT $ 8) $))
         (PROGN
          (LETT #2# NIL . #3=(|CTRIGMNP;complexNormalize;FSF;11|))
          (SEQ (LETT |k| NIL . #3#)
               (LETT #1#
                     (SPADCALL
                      (LETT |g| (SPADCALL |f| |x| (QREFELT $ 57)) . #3#)
                      (QREFELT $ 43))
                     . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x|
                             (SPADCALL (SPADCALL |k| (QREFELT $ 59))
                                       (QREFELT $ 61))
                             (QREFELT $ 62))
                   (LETT #2# (CONS |k| #2#) . #3#)))))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#))))
         (QREFELT $ 63))
        (QVELT
         (SPADCALL (|CTRIGMNP;localexplogs| |f| |g| $) |x| (QREFELT $ 66)) 0))
       ('T (QVELT (SPADCALL |g| |x| (QREFELT $ 66)) 0))))))) 

(DEFUN |CTRIGMNP;complexNormalize;FSF;11!0| (|y| $$)
  (PROG ($ RTRIG)
    (LETT $ (QREFELT $$ 1) . #1=(|CTRIGMNP;complexNormalize;FSF;11|))
    (LETT RTRIG (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 56)) RTRIG (QREFELT $ 48)))))) 

(DEFUN |CTRIGMNP;complexNormalize;2F;12| (|f| $)
  (PROG (|h| |l| |g|)
    (RETURN
     (SEQ
      (LETT |l|
            (SPADCALL
             (LETT |g| (SPADCALL |f| (QREFELT $ 50))
                   . #1=(|CTRIGMNP;complexNormalize;2F;12|))
             (QREFELT $ 61))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL
          (CONS #'|CTRIGMNP;complexNormalize;2F;12!0| (VECTOR $ (QREFELT $ 8)))
          (SPADCALL |g| (QREFELT $ 52)) (QREFELT $ 54))
         (SEQ (LETT |h| (|CTRIGMNP;localexplogs| |f| |g| $) . #1#)
              (EXIT (QVELT (SPADCALL |h| NIL (QREFELT $ 68)) 0))))
        ('T (QVELT (SPADCALL |g| NIL (QREFELT $ 68)) 0)))))))) 

(DEFUN |CTRIGMNP;complexNormalize;2F;12!0| (|y| $$)
  (PROG (RTRIG $)
    (LETT RTRIG (QREFELT $$ 1) . #1=(|CTRIGMNP;complexNormalize;2F;12|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |y| RTRIG (QREFELT $ 48)))))) 

(DECLAIM (NOTINLINE |ComplexTrigonometricManipulations;|)) 

(DEFUN |ComplexTrigonometricManipulations| (&REST #1=#:G150)
  (PROG ()
    (RETURN
     (PROG (#2=#:G151)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ComplexTrigonometricManipulations|)
                                           '|domainEqualList|)
                . #3=(|ComplexTrigonometricManipulations|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |ComplexTrigonometricManipulations;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ComplexTrigonometricManipulations|))))))))))) 

(DEFUN |ComplexTrigonometricManipulations;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ComplexTrigonometricManipulations|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ComplexTrigonometricManipulations| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 70) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ComplexTrigonometricManipulations|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|rtrig|)
      $)))) 

(MAKEPROP '|ComplexTrigonometricManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'RTRIG
              (|Complex| 11) |CTRIGMNP;complexForm;FC;5| (|Expression| 6)
              (0 . |real|) |CTRIGMNP;real;FE;1| (5 . |imag|)
              |CTRIGMNP;imag;FE;2| (|Complex| 6) (10 . |imag|) (|Boolean|)
              (15 . |zero?|) |CTRIGMNP;real?;FB;7| (|List| 7) (|Kernel| 7)
              (20 . |argument|) (|Mapping| 18 7) (25 . |every?|)
              (|InnerTrigonometricManipulations| 6 11 7) (31 . |explogs2trigs|)
              (36 . GF2FG) |CTRIGMNP;trigs;2F;6|
              (|SparseMultivariatePolynomial| 16 58) (41 . |numer|) (|List| 16)
              (|SparseMultivariatePolynomial| 16 22) (46 . |coefficients|)
              (|Mapping| 18 16) (51 . |every?|) (57 . |denom|) (|List| 58)
              (62 . |kernels|) (|Mapping| 18 22) (|List| 22) (67 . |every?|)
              (73 . |tower|) (|Symbol|) (78 . |is?|) (84 . |trigs2explogs|)
              (|BasicOperator|) (90 . |has?|)
              (|ElementaryFunctionStructurePackage| 16 7)
              (96 . |realElementary|) (|List| 47) (101 . |operators|)
              (|Mapping| 18 47) (106 . |any?|)
              |CTRIGMNP;complexElementary;2F;9| (112 . |operator|)
              (117 . |realElementary|) (|Kernel| $) (123 . |coerce|)
              (|List| 44) (128 . |variables|) (133 . |member?|) (139 . |any?|)
              |CTRIGMNP;complexElementary;FSF;10|
              (|Record| (|:| |func| 7) (|:| |kers| 41) (|:| |vals| 21))
              (145 . |rischNormalize|) |CTRIGMNP;complexNormalize;FSF;11|
              (151 . |rischNormalize|) |CTRIGMNP;complexNormalize;2F;12|)
           '#(|trigs| 157 |real?| 162 |real| 167 |imag| 172 |complexNormalize|
              177 |complexForm| 188 |complexElementary| 193)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(1 9 11 0 12 1 9 11 0 14 1 16
                                                   6 0 17 1 6 18 0 19 1 22 21 0
                                                   23 2 21 18 24 0 25 1 26 9 7
                                                   27 1 26 7 9 28 1 7 30 0 31 1
                                                   33 32 0 34 2 32 18 35 0 36 1
                                                   7 30 0 37 1 7 38 0 39 2 41
                                                   18 40 0 42 1 7 38 0 43 2 22
                                                   18 0 44 45 2 26 7 7 41 46 2
                                                   47 18 0 44 48 1 49 7 7 50 1
                                                   7 51 0 52 2 51 18 53 0 54 1
                                                   22 47 0 56 2 49 7 7 44 57 1
                                                   7 0 58 59 1 7 60 0 61 2 60
                                                   18 44 0 62 2 41 18 40 0 63 2
                                                   49 65 7 44 66 2 49 65 7 60
                                                   68 1 0 7 7 29 1 0 18 7 20 1
                                                   0 11 7 13 1 0 11 7 15 2 0 7
                                                   7 44 67 1 0 7 7 69 1 0 9 7
                                                   10 2 0 7 7 44 64 1 0 7 7
                                                   55)))))
           '|lookupComplete|)) 
