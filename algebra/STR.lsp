
(/VERSIONCHECK 2) 

(DEFUN |STR;qelt| (|m| |i| |j| $)
  (PROG (#1=#:G107)
    (RETURN
     (QAREF1
      (QAREF1
       (PROG2 (LETT #1# |m| |STR;qelt|)
           (QCDR #1#)
         (|check_union| (QEQCAR #1# 0)
                        (|PrimitiveArray| (|PrimitiveArray| (|DoubleFloat|)))
                        #1#))
       |i|)
      |j|)))) 

(DEFUN |STR;stransform;L$;2| (|m| $)
  (PROG (|j| |i| |arr|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL (QREFELT $ 6) (|SCartesian| 2))
        (SEQ
         (LETT |arr| (MAKEARR1 3 (MAKE-ARRAY 0)) . #1=(|STR;stransform;L$;2|))
         (SEQ (LETT |i| 0 . #1#) G190 (COND ((|greater_SI| |i| 2) (GO G191)))
              (SEQ (QSETAREF1 |arr| |i| (MAKEARR1 3 0.0))
                   (EXIT
                    (SEQ (LETT |j| 0 . #1#) G190
                         (COND ((|greater_SI| |j| 2) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 (QAREF1 |arr| |i|) |j|
                                      (SPADCALL
                                       (SPADCALL |m| (+ |i| 1) (QREFELT $ 11))
                                       (+ |j| 1) (QREFELT $ 13)))))
                         (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                         (EXIT NIL))))
              (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
         (EXIT (CONS 0 |arr|))))
       ((EQUAL (QREFELT $ 6) (|SCartesian| 3))
        (SEQ (LETT |arr| (MAKEARR1 4 (MAKE-ARRAY 0)) . #1#)
             (SEQ (LETT |i| 0 . #1#) G190
                  (COND ((|greater_SI| |i| 3) (GO G191)))
                  (SEQ (QSETAREF1 |arr| |i| (MAKEARR1 4 0.0))
                       (EXIT
                        (SEQ (LETT |j| 0 . #1#) G190
                             (COND ((|greater_SI| |j| 3) (GO G191)))
                             (SEQ
                              (EXIT
                               (QSETAREF1 (QAREF1 |arr| |i|) |j|
                                          (SPADCALL
                                           (SPADCALL |m| (+ |i| 1)
                                                     (QREFELT $ 11))
                                           (+ |j| 1) (QREFELT $ 13)))))
                             (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                             (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
             (EXIT (CONS 0 |arr|))))
       ('T
        (SEQ (|error| "invalid point type in transform constructor")
             (EXIT (SPADCALL (QREFELT $ 14)))))))))) 

(PUT '|STR;stransform;M$;3| '|SPADreplace| '(XLAM (|gen|) (CONS 1 |gen|))) 

(DEFUN |STR;stransform;M$;3| (|gen| $) (CONS 1 |gen|)) 

(DEFUN |STR;stransform;M$;4| (|cpx| $)
  (PROG (|pp|)
    (RETURN
     (SEQ
      (LETT |pp| (CONS #'|STR;stransform;M$;4!0| (VECTOR |cpx| $))
            |STR;stransform;M$;4|)
      (EXIT (CONS 1 |pp|)))))) 

(DEFUN |STR;stransform;M$;4!0| (|x| $$)
  (PROG ($ |cpx|)
    (LETT $ (QREFELT $$ 1) . #1=(|STR;stransform;M$;4|))
    (LETT |cpx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 20)) |cpx|)
                (QREFELT $ 21)))))) 

(DEFUN |STR;stransform;L$;5| (|m| $) (CONS 2 (SPADCALL |m| (QREFELT $ 25)))) 

(DEFUN |STR;stranslate;6Df$;6|
       (|offsetx| |offsety| |offsetz| |scalex| |scaley| |scalez| $)
  (PROG (#1=#:G144 |pp| |trConf| CA |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((EQUAL (QREFELT $ 6) (|SCartesian| 2))
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (LIST (LIST |scalex| 0.0 |offsetx|)
                        (LIST 0.0 |scaley| |offsety|) (LIST 0.0 0.0 1.0))
                  (QREFELT $ 15))
                 . #2=(|STR;stranslate;6Df$;6|))
           (GO #1#))))
        (COND
         ((EQUAL (QREFELT $ 6) (|SCartesian| 3))
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (LIST (LIST |scalex| 0.0 0.0 |offsetx|)
                        (LIST 0.0 |scaley| 0.0 |offsety|)
                        (LIST 0.0 0.0 |scalez| |offsetz|)
                        (LIST 0.0 0.0 0.0 1.0))
                  (QREFELT $ 15))
                 . #2#)
           (GO #1#))))
        (COND
         ((EQUAL (QREFELT $ 6) (|SConformal| 2))
          (SEQ
           (LETT |m|
                 (SPADCALL
                  (LIST (LIST 0.0 1.0 0.0 0.0) (LIST 1.0 0.0 0.0 0.0)
                        (LIST 0.0 0.0 1.0 0.0) (LIST 0.0 0.0 0.0 1.0))
                  (QREFELT $ 30))
                 . #2#)
           (LETT CA
                 (|CliffordAlgebra| 4 (|DoubleFloat|)
                                    (SPADCALL |m| (QREFELT $ 32)))
                 . #2#)
           (LETT |trConf|
                 (SPADCALL
                  (LIST 1.0 0.0 0.0 0.0 0.0 0.0
                        (|mul_DF| |offsetx|
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 35))
                                            (QREFELT $ 36)))
                        0.0 0.0 0.0
                        (|mul_DF| |offsety|
                                  (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 35))
                                            (QREFELT $ 36)))
                        0.0 0.0 0.0 0.0 0.0)
                  (|compiledLookupCheck| '|multivector|
                                         (LIST '$
                                               (LIST '|List|
                                                     (LIST '|DoubleFloat|)))
                                         CA))
                 . #2#)
           (EXIT (PROGN (LETT #1# (CONS 2 |trConf|) . #2#) (GO #1#))))))
        (COND
         ((EQUAL (QREFELT $ 6) (|SArgand|))
          (SEQ
           (LETT |pp|
                 (CONS #'|STR;stranslate;6Df$;6!0|
                       (VECTOR |offsety| |offsetx| $))
                 . #2#)
           (EXIT (PROGN (LETT #1# (CONS 1 |pp|) . #2#) (GO #1#))))))
        (EXIT (SPADCALL (QREFELT $ 14)))))
      #1# (EXIT #1#))))) 

(DEFUN |STR;stranslate;6Df$;6!0| (|x| $$)
  (PROG ($ |offsetx| |offsety|)
    (LETT $ (QREFELT $$ 2) . #1=(|STR;stranslate;6Df$;6|))
    (LETT |offsetx| (QREFELT $$ 1) . #1#)
    (LETT |offsety| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (SPADCALL |x| (QREFELT $ 20))
                 (SPADCALL |offsetx| |offsety| (QREFELT $ 37)) (QREFELT $ 38))
       (QREFELT $ 21)))))) 

(PUT '|STR;identity;$;7| '|SPADreplace| '(XLAM NIL (CONS 3 "iden"))) 

(DEFUN |STR;identity;$;7| ($) (CONS 3 "iden")) 

(DEFUN |STR;applyTransPt2| (|tr| |inpt| $)
  (PROG (|b| #1=#:G107 |a| |vin| #2=#:G152)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |tr| 3)
          (PROGN (LETT #2# |inpt| . #3=(|STR;applyTransPt2|)) (GO #2#))))
        (COND
         ((QEQCAR |tr| 1)
          (SEQ
           (SPADCALL
            (SPADCALL "can't transform Euclidean point using general function"
                      (QREFELT $ 42))
            (QREFELT $ 43))
           (EXIT (PROGN (LETT #2# |inpt| . #3#) (GO #2#))))))
        (LETT |vin| (SPADCALL |inpt| (QREFELT $ 45)) . #3#)
        (LETT |a|
              (|add_DF|
               (|add_DF|
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   0)
                  0)
                 (SPADCALL |vin| 1 (QREFELT $ 13)))
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   0)
                  1)
                 (SPADCALL |vin| 2 (QREFELT $ 13))))
               (|mul_DF|
                (QAREF1
                 (QAREF1
                  (PROG2 (LETT #1# |tr| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|PrimitiveArray|
                                    (|PrimitiveArray| (|DoubleFloat|)))
                                   #1#))
                  0)
                 2)
                (SPADCALL |vin| 3 (QREFELT $ 13))))
              . #3#)
        (LETT |b|
              (|add_DF|
               (|add_DF|
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   1)
                  0)
                 (SPADCALL |vin| 1 (QREFELT $ 13)))
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   1)
                  1)
                 (SPADCALL |vin| 2 (QREFELT $ 13))))
               (|mul_DF|
                (QAREF1
                 (QAREF1
                  (PROG2 (LETT #1# |tr| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|PrimitiveArray|
                                    (|PrimitiveArray| (|DoubleFloat|)))
                                   #1#))
                  1)
                 2)
                (SPADCALL |vin| 3 (QREFELT $ 13))))
              . #3#)
        (EXIT (SPADCALL |a| |b| (QREFELT $ 49)))))
      #2# (EXIT #2#))))) 

(DEFUN |STR;applyTransPt3| (|tr| |inpt| $)
  (PROG (|c| #1=#:G107 |b| |a| |vin| #2=#:G159)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |tr| 3)
          (PROGN (LETT #2# |inpt| . #3=(|STR;applyTransPt3|)) (GO #2#))))
        (COND
         ((QEQCAR |tr| 1)
          (SEQ
           (SPADCALL
            (SPADCALL "can't transform Euclidean point using general function"
                      (QREFELT $ 42))
            (QREFELT $ 43))
           (EXIT (PROGN (LETT #2# |inpt| . #3#) (GO #2#))))))
        (LETT |vin| (SPADCALL |inpt| (QREFELT $ 51)) . #3#)
        (LETT |a|
              (|add_DF|
               (|add_DF|
                (|add_DF|
                 (|mul_DF|
                  (QAREF1
                   (QAREF1
                    (PROG2 (LETT #1# |tr| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|PrimitiveArray|
                                      (|PrimitiveArray| (|DoubleFloat|)))
                                     #1#))
                    0)
                   0)
                  (SPADCALL |vin| 1 (QREFELT $ 13)))
                 (|mul_DF|
                  (QAREF1
                   (QAREF1
                    (PROG2 (LETT #1# |tr| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|PrimitiveArray|
                                      (|PrimitiveArray| (|DoubleFloat|)))
                                     #1#))
                    0)
                   1)
                  (SPADCALL |vin| 2 (QREFELT $ 13))))
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   0)
                  2)
                 (SPADCALL |vin| 3 (QREFELT $ 13))))
               (|mul_DF|
                (QAREF1
                 (QAREF1
                  (PROG2 (LETT #1# |tr| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|PrimitiveArray|
                                    (|PrimitiveArray| (|DoubleFloat|)))
                                   #1#))
                  0)
                 3)
                (SPADCALL |vin| 4 (QREFELT $ 13))))
              . #3#)
        (LETT |b|
              (|add_DF|
               (|add_DF|
                (|add_DF|
                 (|mul_DF|
                  (QAREF1
                   (QAREF1
                    (PROG2 (LETT #1# |tr| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|PrimitiveArray|
                                      (|PrimitiveArray| (|DoubleFloat|)))
                                     #1#))
                    1)
                   0)
                  (SPADCALL |vin| 1 (QREFELT $ 13)))
                 (|mul_DF|
                  (QAREF1
                   (QAREF1
                    (PROG2 (LETT #1# |tr| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|PrimitiveArray|
                                      (|PrimitiveArray| (|DoubleFloat|)))
                                     #1#))
                    1)
                   1)
                  (SPADCALL |vin| 2 (QREFELT $ 13))))
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   1)
                  2)
                 (SPADCALL |vin| 3 (QREFELT $ 13))))
               (|mul_DF|
                (QAREF1
                 (QAREF1
                  (PROG2 (LETT #1# |tr| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|PrimitiveArray|
                                    (|PrimitiveArray| (|DoubleFloat|)))
                                   #1#))
                  1)
                 3)
                (SPADCALL |vin| 4 (QREFELT $ 13))))
              . #3#)
        (LETT |c|
              (|add_DF|
               (|add_DF|
                (|add_DF|
                 (|mul_DF|
                  (QAREF1
                   (QAREF1
                    (PROG2 (LETT #1# |tr| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|PrimitiveArray|
                                      (|PrimitiveArray| (|DoubleFloat|)))
                                     #1#))
                    2)
                   0)
                  (SPADCALL |vin| 1 (QREFELT $ 13)))
                 (|mul_DF|
                  (QAREF1
                   (QAREF1
                    (PROG2 (LETT #1# |tr| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|PrimitiveArray|
                                      (|PrimitiveArray| (|DoubleFloat|)))
                                     #1#))
                    2)
                   1)
                  (SPADCALL |vin| 2 (QREFELT $ 13))))
                (|mul_DF|
                 (QAREF1
                  (QAREF1
                   (PROG2 (LETT #1# |tr| . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0)
                                    (|PrimitiveArray|
                                     (|PrimitiveArray| (|DoubleFloat|)))
                                    #1#))
                   2)
                  2)
                 (SPADCALL |vin| 3 (QREFELT $ 13))))
               (|mul_DF|
                (QAREF1
                 (QAREF1
                  (PROG2 (LETT #1# |tr| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 0)
                                   (|PrimitiveArray|
                                    (|PrimitiveArray| (|DoubleFloat|)))
                                   #1#))
                  2)
                 3)
                (SPADCALL |vin| 4 (QREFELT $ 13))))
              . #3#)
        (EXIT (SPADCALL |a| |b| |c| (QREFELT $ 52)))))
      #2# (EXIT #2#))))) 

(DEFUN |STR;applyTransCx| (|tr| |inpt| $)
  (PROG (|res| |f| #1=#:G108 #2=#:G162)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |tr| 3)
          (PROGN (LETT #2# |inpt| . #3=(|STR;applyTransCx|)) (GO #2#))))
        (COND
         ((QEQCAR |tr| 0)
          (SEQ
           (SPADCALL
            (SPADCALL "can't transform complex using matrix" (QREFELT $ 42))
            (QREFELT $ 43))
           (SPADCALL (SPADCALL |tr| (QREFELT $ 53)) (QREFELT $ 42))
           (EXIT (PROGN (LETT #2# |inpt| . #3#) (GO #2#))))))
        (LETT |f|
              (PROG2 (LETT #1# |tr| . #3#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 1)
                               (|Mapping| (QREFELT $ 6) (QREFELT $ 6)) #1#))
              . #3#)
        (LETT |res| (SPADCALL |inpt| |f|) . #3#) (EXIT |res|)))
      #2# (EXIT #2#))))) 

(DEFUN |STR;applyTransConf2| (|tr| |inpt| $)
  (PROG (|res| |conjugation| |trConf| #1=#:G109 |ptConf| CA |m| #2=#:G165)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |tr| 3)
          (PROGN (LETT #2# |inpt| . #3=(|STR;applyTransConf2|)) (GO #2#))))
        (COND
         ((NULL (QEQCAR |tr| 2))
          (SEQ
           (SPADCALL
            (SPADCALL "this transform not compatible with conformal"
                      (QREFELT $ 42))
            (QREFELT $ 43))
           (SPADCALL (SPADCALL |tr| (QREFELT $ 53)) (QREFELT $ 42))
           (EXIT (PROGN (LETT #2# |inpt| . #3#) (GO #2#))))))
        (LETT |m|
              (SPADCALL
               (LIST (LIST 0.0 1.0 0.0 0.0) (LIST 1.0 0.0 0.0 0.0)
                     (LIST 0.0 0.0 1.0 0.0) (LIST 0.0 0.0 0.0 1.0))
               (QREFELT $ 30))
              . #3#)
        (LETT CA
              (|CliffordAlgebra| 4 (|DoubleFloat|)
                                 (SPADCALL |m| (QREFELT $ 32)))
              . #3#)
        (LETT |ptConf| |inpt| . #3#)
        (LETT |trConf|
              (PROG2 (LETT #1# |tr| . #3#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 2)
                               (|PrimitiveArray| (|DoubleFloat|)) #1#))
              . #3#)
        (LETT |conjugation|
              (SPADCALL
               (SPADCALL |trConf| |ptConf|
                         (|compiledLookupCheck| '* (LIST '$ '$ '$) CA))
               (SPADCALL |trConf|
                         (|compiledLookupCheck| '|reverse| (LIST '$ '$) CA))
               (|compiledLookupCheck| '* (LIST '$ '$ '$) CA))
              . #3#)
        (LETT |res| |conjugation| . #3#)
        (EXIT (SPADCALL |res| (QREFELT $ 55)))))
      #2# (EXIT #2#))))) 

(DEFUN |STR;xform;$2PT;12| (|tr| |inpt| $)
  (SEQ
   (COND
    ((EQUAL (QREFELT $ 6) (|SCartesian| 2))
     (|STR;applyTransPt2| |tr| |inpt| $))
    ((EQUAL (QREFELT $ 6) (|SCartesian| 3))
     (|STR;applyTransPt3| |tr| |inpt| $))
    ((EQUAL (QREFELT $ 6) (|SArgand|)) (|STR;applyTransCx| |tr| |inpt| $))
    ((EQUAL (QREFELT $ 6) (|SConformal| 2))
     (|STR;applyTransConf2| |tr| |inpt| $))
    ('T
     (SEQ (|error| "invalid point type in transform")
          (EXIT (SPADCALL 0.0 0.0 (QREFELT $ 49)))))))) 

(DEFUN |STR;compound2| (|tr| |inpt| $)
  (PROG (#1=#:G176 #2=#:G107 |j| |i| |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arr| (MAKEARR1 3 (MAKE-ARRAY 0)) . #3=(|STR;compound2|))
            (SEQ (LETT |i| 0 . #3#) G190
                 (COND ((|greater_SI| |i| 2) (GO G191)))
                 (SEQ (QSETAREF1 |arr| |i| (MAKEARR1 3 0.0))
                      (EXIT
                       (SEQ (LETT |j| 0 . #3#) G190
                            (COND ((|greater_SI| |j| 2) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF1 (QAREF1 |arr| |i|) |j|
                                         (|add_DF|
                                          (|add_DF|
                                           (|mul_DF|
                                            (QAREF1
                                             (QAREF1
                                              (PROG2 (LETT #2# |tr| . #3#)
                                                  (QCDR #2#)
                                                (|check_union| (QEQCAR #2# 0)
                                                               (|PrimitiveArray|
                                                                (|PrimitiveArray|
                                                                 (|DoubleFloat|)))
                                                               #2#))
                                              0)
                                             |j|)
                                            (QAREF1
                                             (QAREF1
                                              (PROG2 (LETT #2# |inpt| . #3#)
                                                  (QCDR #2#)
                                                (|check_union| (QEQCAR #2# 0)
                                                               (|PrimitiveArray|
                                                                (|PrimitiveArray|
                                                                 (|DoubleFloat|)))
                                                               #2#))
                                              |i|)
                                             0))
                                           (|mul_DF|
                                            (QAREF1
                                             (QAREF1
                                              (PROG2 (LETT #2# |tr| . #3#)
                                                  (QCDR #2#)
                                                (|check_union| (QEQCAR #2# 0)
                                                               (|PrimitiveArray|
                                                                (|PrimitiveArray|
                                                                 (|DoubleFloat|)))
                                                               #2#))
                                              1)
                                             |j|)
                                            (QAREF1
                                             (QAREF1
                                              (PROG2 (LETT #2# |inpt| . #3#)
                                                  (QCDR #2#)
                                                (|check_union| (QEQCAR #2# 0)
                                                               (|PrimitiveArray|
                                                                (|PrimitiveArray|
                                                                 (|DoubleFloat|)))
                                                               #2#))
                                              |i|)
                                             1)))
                                          (|mul_DF|
                                           (QAREF1
                                            (QAREF1
                                             (PROG2 (LETT #2# |tr| . #3#)
                                                 (QCDR #2#)
                                               (|check_union| (QEQCAR #2# 0)
                                                              (|PrimitiveArray|
                                                               (|PrimitiveArray|
                                                                (|DoubleFloat|)))
                                                              #2#))
                                             2)
                                            |j|)
                                           (QAREF1
                                            (QAREF1
                                             (PROG2 (LETT #2# |inpt| . #3#)
                                                 (QCDR #2#)
                                               (|check_union| (QEQCAR #2# 0)
                                                              (|PrimitiveArray|
                                                               (|PrimitiveArray|
                                                                (|DoubleFloat|)))
                                                              #2#))
                                             |i|)
                                            2))))))
                            (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (PROGN (LETT #1# (CONS 0 |arr|) . #3#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |STR;compound3| (|tr| |inpt| $)
  (PROG (#1=#:G185 #2=#:G107 |j| |i| |arr|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |arr| (MAKEARR1 4 (MAKE-ARRAY 0)) . #3=(|STR;compound3|))
            (SEQ (LETT |i| 0 . #3#) G190
                 (COND ((|greater_SI| |i| 3) (GO G191)))
                 (SEQ (QSETAREF1 |arr| |i| (MAKEARR1 4 0.0))
                      (EXIT
                       (SEQ (LETT |j| 0 . #3#) G190
                            (COND ((|greater_SI| |j| 3) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF1 (QAREF1 |arr| |i|) |j|
                                         (|add_DF|
                                          (|add_DF|
                                           (|add_DF|
                                            (|mul_DF|
                                             (QAREF1
                                              (QAREF1
                                               (PROG2 (LETT #2# |tr| . #3#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|PrimitiveArray|
                                                                 (|PrimitiveArray|
                                                                  (|DoubleFloat|)))
                                                                #2#))
                                               0)
                                              |j|)
                                             (QAREF1
                                              (QAREF1
                                               (PROG2 (LETT #2# |inpt| . #3#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|PrimitiveArray|
                                                                 (|PrimitiveArray|
                                                                  (|DoubleFloat|)))
                                                                #2#))
                                               |i|)
                                              0))
                                            (|mul_DF|
                                             (QAREF1
                                              (QAREF1
                                               (PROG2 (LETT #2# |tr| . #3#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|PrimitiveArray|
                                                                 (|PrimitiveArray|
                                                                  (|DoubleFloat|)))
                                                                #2#))
                                               1)
                                              |j|)
                                             (QAREF1
                                              (QAREF1
                                               (PROG2 (LETT #2# |inpt| . #3#)
                                                   (QCDR #2#)
                                                 (|check_union| (QEQCAR #2# 0)
                                                                (|PrimitiveArray|
                                                                 (|PrimitiveArray|
                                                                  (|DoubleFloat|)))
                                                                #2#))
                                               |i|)
                                              1)))
                                           (|mul_DF|
                                            (QAREF1
                                             (QAREF1
                                              (PROG2 (LETT #2# |tr| . #3#)
                                                  (QCDR #2#)
                                                (|check_union| (QEQCAR #2# 0)
                                                               (|PrimitiveArray|
                                                                (|PrimitiveArray|
                                                                 (|DoubleFloat|)))
                                                               #2#))
                                              2)
                                             |j|)
                                            (QAREF1
                                             (QAREF1
                                              (PROG2 (LETT #2# |inpt| . #3#)
                                                  (QCDR #2#)
                                                (|check_union| (QEQCAR #2# 0)
                                                               (|PrimitiveArray|
                                                                (|PrimitiveArray|
                                                                 (|DoubleFloat|)))
                                                               #2#))
                                              |i|)
                                             2)))
                                          (|mul_DF|
                                           (QAREF1
                                            (QAREF1
                                             (PROG2 (LETT #2# |tr| . #3#)
                                                 (QCDR #2#)
                                               (|check_union| (QEQCAR #2# 0)
                                                              (|PrimitiveArray|
                                                               (|PrimitiveArray|
                                                                (|DoubleFloat|)))
                                                              #2#))
                                             3)
                                            |j|)
                                           (QAREF1
                                            (QAREF1
                                             (PROG2 (LETT #2# |inpt| . #3#)
                                                 (QCDR #2#)
                                               (|check_union| (QEQCAR #2# 0)
                                                              (|PrimitiveArray|
                                                               (|PrimitiveArray|
                                                                (|DoubleFloat|)))
                                                              #2#))
                                             |i|)
                                            3))))))
                            (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (PROGN (LETT #1# (CONS 0 |arr|) . #3#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |STR;compoundConf2| (|tr| |inpt| $)
  (PROG (#1=#:G187 |resConf| |inptConf| #2=#:G109 |trConf| CA |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |m|
              (SPADCALL
               (LIST (LIST 0.0 1.0 0.0 0.0) (LIST 1.0 0.0 0.0 0.0)
                     (LIST 0.0 0.0 1.0 0.0) (LIST 0.0 0.0 0.0 1.0))
               (QREFELT $ 30))
              . #3=(|STR;compoundConf2|))
        (LETT CA
              (|CliffordAlgebra| 4 (|DoubleFloat|)
                                 (SPADCALL |m| (QREFELT $ 32)))
              . #3#)
        (LETT |trConf|
              (PROG2 (LETT #2# |tr| . #3#)
                  (QCDR #2#)
                (|check_union| (QEQCAR #2# 2)
                               (|PrimitiveArray| (|DoubleFloat|)) #2#))
              . #3#)
        (LETT |inptConf|
              (PROG2 (LETT #2# |inpt| . #3#)
                  (QCDR #2#)
                (|check_union| (QEQCAR #2# 2)
                               (|PrimitiveArray| (|DoubleFloat|)) #2#))
              . #3#)
        (LETT |resConf|
              (SPADCALL |trConf| |inptConf|
                        (|compiledLookupCheck| '* (LIST '$ '$ '$) CA))
              . #3#)
        (EXIT (PROGN (LETT #1# (CONS 2 |resConf|) . #3#) (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |STR;compound;3$;16| (|tr| |inpt| $)
  (PROG (#1=#:G197 |fn| |in2| |in1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |tr| 3)
          (PROGN (LETT #1# |inpt| . #2=(|STR;compound;3$;16|)) (GO #1#))))
        (COND ((QEQCAR |inpt| 3) (PROGN (LETT #1# |tr| . #2#) (GO #1#))))
        (COND
         ((QEQCAR |tr| 0)
          (COND
           ((QEQCAR |inpt| 0)
            (SEQ
             (COND
              ((EQUAL (QREFELT $ 6) (|SCartesian| 2))
               (PROGN
                (LETT #1# (|STR;compound2| |tr| |inpt| $) . #2#)
                (GO #1#))))
             (EXIT
              (COND
               ((EQUAL (QREFELT $ 6) (|SCartesian| 3))
                (PROGN
                 (LETT #1# (|STR;compound3| |tr| |inpt| $) . #2#)
                 (GO #1#))))))))))
        (COND
         ((QEQCAR |tr| 1)
          (COND
           ((QEQCAR |inpt| 1)
            (SEQ (LETT |in1| (CDR |tr|) . #2#) (LETT |in2| (CDR |inpt|) . #2#)
                 (LETT |fn| (SPADCALL |in1| |in2| (QREFELT $ 58)) . #2#)
                 (EXIT (PROGN (LETT #1# (CONS 1 |fn|) . #2#) (GO #1#))))))))
        (COND
         ((QEQCAR |tr| 2)
          (COND
           ((QEQCAR |inpt| 2)
            (PROGN
             (LETT #1# (|STR;compoundConf2| |tr| |inpt| $) . #2#)
             (GO #1#))))))
        (EXIT (SPADCALL (QREFELT $ 14)))))
      #1# (EXIT #1#))))) 

(DEFUN |STR;outputArray| (|x| $)
  (PROG (#1=#:G206 |i| #2=#:G205 |m|)
    (RETURN
     (SEQ (LETT |m| (QVSIZE |x|) . #3=(|STR;outputArray|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |m| 1) . #3#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS (SPADCALL (QAREF1 |x| |i|) (QREFELT $ 60)) #2#)
                          . #3#)))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 62))))))) 

(DEFUN |STR;outputMatrix| (|x| $)
  (PROG (|l| #1=#:G218 |j| #2=#:G217 #3=#:G216 |i| #4=#:G215 |m|)
    (RETURN
     (SEQ (LETT |m| (QVSIZE |x|) . #5=(|STR;outputMatrix|))
          (LETT |l|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |i| 0 . #5#) (LETT #3# (- |m| 1) . #5#) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #5#)
                                (SEQ (LETT |j| 0 . #5#)
                                     (LETT #1# (- |m| 1) . #5#) G190
                                     (COND ((|greater_SI| |j| #1#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL
                                               (QAREF1 (QAREF1 |x| |i|) |j|)
                                               (QREFELT $ 60))
                                              #2#)
                                             . #5#)))
                                     (LETT |j| (|inc_SI| |j|) . #5#) (GO G190)
                                     G191 (EXIT (NREVERSE #2#))))
                               #4#)
                              . #5#)))
                      (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT (SPADCALL |l| (QREFELT $ 64))))))) 

(DEFUN |STR;coerce;$Of;19| (|tr| $)
  (PROG (#1=#:G109 #2=#:G220 #3=#:G107)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |tr| 3)
          (PROGN (LETT #2# "iden" . #4=(|STR;coerce;$Of;19|)) (GO #2#))))
        (COND
         ((QEQCAR |tr| 1)
          (PROGN (LETT #2# "function as transform" . #4#) (GO #2#))))
        (COND
         ((QEQCAR |tr| 0)
          (PROGN
           (LETT #2#
                 (SPADCALL "mtx"
                           (|STR;outputMatrix|
                            (PROG2 (LETT #3# |tr| . #4#)
                                (QCDR #3#)
                              (|check_union| (QEQCAR #3# 0)
                                             (|PrimitiveArray|
                                              (|PrimitiveArray|
                                               (|DoubleFloat|)))
                                             #3#))
                            $)
                           (QREFELT $ 65))
                 . #4#)
           (GO #2#))))
        (EXIT
         (SPADCALL "multiv"
                   (|STR;outputArray|
                    (PROG2 (LETT #1# |tr| . #4#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 2)
                                     (|PrimitiveArray| (|DoubleFloat|)) #1#))
                    $)
                   (QREFELT $ 65)))))
      #2# (EXIT #2#))))) 

(DECLAIM (NOTINLINE |STransform;|)) 

(DEFUN |STransform| (#1=#:G221)
  (PROG ()
    (RETURN
     (PROG (#2=#:G222)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|STransform|)
                                           '|domainEqualList|)
                . #3=(|STransform|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|STransform;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|STransform|))))))))))) 

(DEFUN |STransform;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|STransform|))
      (LETT |dv$| (LIST '|STransform| DV$1) . #1#)
      (LETT $ (GETREFV 66) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|STransform| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union|
                 (|:| |mtx|
                      (|PrimitiveArray| (|PrimitiveArray| (|DoubleFloat|))))
                 (|:| |general| (|Mapping| |#1| |#1|))
                 (|:| |multiv| (|PrimitiveArray| (|DoubleFloat|)))
                 (|:| |iden| "iden")))
      $)))) 

(MAKEPROP '|STransform| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 12)
              (|Integer|) (|List| 8) (0 . |elt|) (|DoubleFloat|) (6 . |elt|)
              |STR;identity;$;7| |STR;stransform;L$;2| (|Mapping| 6 6)
              |STR;stransform;M$;3| (|Complex| 12) (|SArgand|) (12 . |coerce|)
              (17 . |coerce|) (|Mapping| 18 18) |STR;stransform;M$;4|
              (|PrimitiveArray| 12) (22 . |construct|) |STR;stransform;L$;5|
              (27 . |Zero|) (31 . |One|) (|Matrix| 12) (35 . |matrix|)
              (|SquareMatrix| '4 12) (40 . |squareMatrix|) (|PositiveInteger|)
              (|Float|) (45 . |float|) (52 . |coerce|) (57 . |complex|)
              (63 . +) |STR;stranslate;6Df$;6| (|Void|) (|OutputForm|)
              (69 . |print|) (74 . |coerce|) (|SCartesian| '2)
              (79 . |extendedCoords|) (|Fraction| 9) (84 . |Zero|) (88 . |One|)
              (92 . |spnt|) (|SCartesian| '3) (98 . |extendedCoords|)
              (103 . |spnt|) |STR;coerce;$Of;19| (|SConformal| '2)
              (110 . |normalisePoint|) |STR;xform;$2PT;12|
              (|MappingPackage3| 6 6 6) (115 . *) |STR;compound;3$;16|
              (121 . |coerce|) (|List| $) (126 . |bracket|) (|List| 61)
              (131 . |matrix|) (136 . |hconcat|))
           '#(|xform| 142 |stranslate| 148 |stransform| 158 |identity| 178
              |compound| 182 |coerce| 188)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(2 10 8 0 9 11 2 8 12 0 9 13
                                                   1 19 18 0 20 1 19 0 18 21 1
                                                   24 0 8 25 0 12 0 27 0 12 0
                                                   28 1 29 0 10 30 1 31 0 29 32
                                                   3 34 0 9 9 33 35 1 34 12 0
                                                   36 2 18 0 12 12 37 2 18 0 0
                                                   0 38 1 41 40 0 42 1 40 41 0
                                                   43 1 44 8 0 45 0 46 0 47 0
                                                   46 0 48 2 44 0 12 12 49 1 50
                                                   8 0 51 3 50 0 12 12 12 52 1
                                                   54 0 0 55 2 57 16 16 16 58 1
                                                   12 41 0 60 1 41 0 61 62 1 41
                                                   0 63 64 2 41 0 0 0 65 2 0 6
                                                   0 6 56 6 0 0 12 12 12 12 12
                                                   12 39 1 0 0 16 17 1 0 0 10
                                                   15 1 0 0 8 26 1 0 0 22 23 0
                                                   0 0 14 2 0 0 0 0 59 1 0 41 0
                                                   53)))))
           '|lookupComplete|)) 
