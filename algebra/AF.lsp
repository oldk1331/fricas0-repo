
(/VERSIONCHECK 2) 

(DEFUN |AF;belong?;BoB;1| (|op| $) (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 16))) 

(DEFUN |AF;dalg| (|l| $)
  (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 21))) 

(DEFUN |AF;rootOf;SupSF;3| (|p| |x| $)
  (PROG (|n| |f| |r| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 23)) . #1=(|AF;rootOf;SupSF;3|))
          (LETT |r| (SPADCALL |p| (QREFELT $ 26)) . #1#)
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (SPADCALL |p| (SPADCALL |k| (QREFELT $ 28)) (QREFELT $ 29)))
            (#2='T
             (SEQ
              (LETT |n|
                    (SPADCALL
                     (LETT |f| (SPADCALL (QCDR |r|) |k| (QREFELT $ 31)) . #1#)
                     (QREFELT $ 33))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |f| (QREFELT $ 34)) (QREFELT $ 36)) 0
                  (QREFELT $ 38))
                 (|error| "roofOf: variable appears in denom"))
                (#2#
                 (SPADCALL |n| (SPADCALL |k| (QREFELT $ 28))
                           (QREFELT $ 29))))))))))))) 

(DEFUN |AF;dvalg| (|l| |x| $)
  (PROG (|alpha| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL
             (SPADCALL (|SPADfirst| |l|)
                       (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 40))
                       (QREFELT $ 31))
             (QREFELT $ 33))
            . #1=(|AF;dvalg|))
      (LETT |alpha| (SPADCALL (QREFELT $ 13) |l| (QREFELT $ 42)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL
          (SPADCALL (CONS #'|AF;dvalg!0| (VECTOR $ |x|)) |p| (QREFELT $ 45))
          |alpha| (QREFELT $ 46))
         (SPADCALL (SPADCALL |p| (QREFELT $ 47)) |alpha| (QREFELT $ 46))
         (QREFELT $ 48))
        (QREFELT $ 49))))))) 

(DEFUN |AF;dvalg!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|AF;dvalg|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 43)))))) 

(DEFUN |AF;ialg| (|l| $)
  (PROG (|f| |x| |p|)
    (RETURN
     (SEQ
      (LETT |f|
            (SPADCALL (LETT |p| (|SPADfirst| |l|) . #1=(|AF;ialg|))
                      (SPADCALL (LETT |x| (SPADCALL |l| (QREFELT $ 19)) . #1#)
                                (QREFELT $ 40))
                      (QREFELT $ 31))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 34)) (QREFELT $ 36)) 0
                   (QREFELT $ 38))
         (|error| "roofOf: variable appears in denom"))
        ('T (SPADCALL (SPADCALL |f| (QREFELT $ 33)) |x| (QREFELT $ 29))))))))) 

(DEFUN |AF;operator;2Bo;6| (|op| $)
  (COND ((SPADCALL |op| '|rootOf| (QREFELT $ 50)) (QREFELT $ 13))
        ((SPADCALL |op| '|nthRoot| (QREFELT $ 50)) (QREFELT $ 14))
        ('T (|error| "Unknown operator")))) 

(DEFUN |AF;inrootof;Sup2F;7| (|q| |x| $)
  (PROG (#1=#:G212 |r| |rx| |d|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |q| (QREFELT $ 52)) (|spadConstant| $ 53))
            (#2='T
             (SEQ
              (LETT |d| (SPADCALL |q| (QREFELT $ 36))
                    . #3=(|AF;inrootof;Sup2F;7|))
              (EXIT
               (COND
                ((SPADCALL |d| 0 (QREFELT $ 54))
                 (|error| "rootOf: constant polynomial"))
                ((EQL |d| 1)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 57)) (QREFELT $ 58))
                   (SPADCALL |q| (QREFELT $ 58)) (QREFELT $ 48))
                  (QREFELT $ 49)))
                (#2#
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 60)) . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |rx| 0)
                            (SEQ (LETT |r| (|AF;UP2R| |q| $) . #3#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |r| 0)
                                    (PROGN
                                     (LETT #1#
                                           (SPADCALL
                                            (SPADCALL (QCDR |r|) (QCDR |rx|)
                                                      (QREFELT $ 62))
                                            (QREFELT $ 63))
                                           . #3#)
                                     (GO #1#))))))))))
                    (EXIT
                     (SPADCALL (QREFELT $ 13)
                               (LIST (SPADCALL |q| |x| (QREFELT $ 46)) |x|)
                               (QREFELT $ 42)))))
                  #1# (EXIT #1#)))))))))))) 

(DEFUN |AF;UP2R| (|p| $)
  (PROG (|ans| #1=#:G226 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| (|spadConstant| $ 65) . #2=(|AF;UP2R|))
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 66) (QREFELT $ 67)))
                   (GO G191)))
                 (SEQ
                  (LETT |r|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 69))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |r| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                    ('T
                     (SEQ
                      (LETT |ans|
                            (SPADCALL |ans|
                                      (SPADCALL (QCDR |r|)
                                                (SPADCALL |p| (QREFELT $ 36))
                                                (QREFELT $ 70))
                                      (QREFELT $ 71))
                            . #2#)
                      (EXIT
                       (LETT |p| (SPADCALL |p| (QREFELT $ 57)) . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |AF;inrootof;Sup2F;9| (|q| |x| $)
  (PROG (|d|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |q| (QREFELT $ 52)) (|spadConstant| $ 53))
            (#1='T
             (SEQ
              (LETT |d| (SPADCALL |q| (QREFELT $ 36)) |AF;inrootof;Sup2F;9|)
              (EXIT
               (COND
                ((SPADCALL |d| 0 (QREFELT $ 54))
                 (|error| "rootOf: constant polynomial"))
                ((EQL |d| 1)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 57)) (QREFELT $ 58))
                   (SPADCALL |q| (QREFELT $ 58)) (QREFELT $ 48))
                  (QREFELT $ 49)))
                (#1#
                 (SPADCALL (QREFELT $ 13)
                           (LIST (SPADCALL |q| |x| (QREFELT $ 46)) |x|)
                           (QREFELT $ 42)))))))))))) 

(DEFUN |AF;lzero| (|l| $) (|spadConstant| $ 53)) 

(DEFUN |AF;droot;LOf;11| (|l| $)
  (PROG (|n| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 21))
            . #1=(|AF;droot;LOf;11|))
      (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 80)) . #1#)
      (EXIT
       (COND ((EQL |n| 2) (SPADCALL |x| (QREFELT $ 81)))
             ('T
              (SPADCALL |x| (SPADCALL |n| (QREFELT $ 82)) (QREFELT $ 83))))))))) 

(DEFUN |AF;dvroot| (|l| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 80))
            |AF;dvroot|)
      (EXIT
       (SPADCALL
        (SPADCALL (|SPADfirst| |l|) (SPADCALL (- 1 |n|) |n| (QREFELT $ 88))
                  (QREFELT $ 89))
        (SPADCALL |n| (QREFELT $ 90)) (QREFELT $ 48))))))) 

(DEFUN |AF;^;FFF;13| (|x| |q| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (LETT |qr|
            (DIVIDE2 (SPADCALL |q| (QREFELT $ 91))
                     (SPADCALL |q| (QREFELT $ 92)))
            |AF;^;FFF;13|)
      (EXIT
       (SPADCALL (SPADCALL |x| (QCAR |qr|) (QREFELT $ 93))
                 (SPADCALL
                  (|AF;inroot|
                   (LIST |x|
                         (SPADCALL (SPADCALL |q| (QREFELT $ 92))
                                   (QREFELT $ 90)))
                   $)
                  (QCDR |qr|) (QREFELT $ 93))
                 (QREFELT $ 94))))))) 

(DEFUN |AF;hackroot| (|x| |n| $)
  (PROG (#1=#:G252 |rx| |dx|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (EQL |n| 1) (SPADCALL |x| (|spadConstant| $ 56) (QREFELT $ 95)))
         |x|)
        ('T
         (SEQ
          (COND
           ((SPADCALL
             (LETT |dx| (SPADCALL |x| (QREFELT $ 97)) . #2=(|AF;hackroot|))
             (|spadConstant| $ 86) (QREFELT $ 98))
            (SEQ (LETT |rx| (SPADCALL |dx| (QREFELT $ 100)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |rx| 0)
                    (COND
                     ((SPADCALL (QCDR |rx|) (QREFELT $ 101))
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (|AF;hackroot|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 102))
                                         (QREFELT $ 103))
                               |n| $)
                              (|AF;hackroot|
                               (SPADCALL (QCDR |rx|) (QREFELT $ 90)) |n| $)
                              (QREFELT $ 48))
                             . #2#)
                       (GO #1#))))))))))
          (COND
           ((SPADCALL |x| (SPADCALL (|spadConstant| $ 56) (QREFELT $ 49))
                      (QREFELT $ 95))
            (COND
             ((EQL |n| 4)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 56) (QREFELT $ 49))
                           (SPADCALL (|spadConstant| $ 104)
                                     (SPADCALL 2 (QREFELT $ 105))
                                     (QREFELT $ 106))
                           (QREFELT $ 89))
                 (|spadConstant| $ 56) (QREFELT $ 107))
                (SPADCALL (SPADCALL 2 (QREFELT $ 90))
                          (SPADCALL (|spadConstant| $ 104)
                                    (SPADCALL 2 (QREFELT $ 105))
                                    (QREFELT $ 106))
                          (QREFELT $ 89))
                (QREFELT $ 48)))))))
          (EXIT
           (SPADCALL (QREFELT $ 14) (LIST |x| (SPADCALL |n| (QREFELT $ 90)))
                     (QREFELT $ 42)))))))
      #1# (EXIT #1#))))) 

(DEFUN |AF;inroot| (|l| $)
  (PROG (|pr| |u| |r| #1=#:G266 |x| |n|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP
         (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 80))
               . #2=(|AF;inroot|)))
        (|error| "root: exponent = 0"))
       (#3='T
        (SEQ
         (EXIT
          (SEQ
           (SEQ (LETT |x| (|SPADfirst| |l|) . #2#)
                (EXIT
                 (COND
                  ((OR (SPADCALL |x| (|spadConstant| $ 56) (QREFELT $ 95))
                       (EQL |n| 1))
                   (PROGN (LETT #1# |x| . #2#) (GO #1#))))))
           (LETT |r| (SPADCALL |x| (QREFELT $ 69)) . #2#)
           (EXIT
            (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |n| (QREFELT $ 108)))
                  (#3#
                   (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 111)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (SEQ (LETT |pr| (QCDR |u|) . #2#)
                                (COND
                                 ((SPADCALL (QCAR |pr|) (QREFELT $ 14)
                                            (QREFELT $ 112))
                                  (COND
                                   ((EQL
                                     (LENGTH
                                      (SPADCALL (QCAR |pr|) (QREFELT $ 113)))
                                     2)
                                    (EXIT
                                     (SPADCALL
                                      (|SPADfirst|
                                       (SPADCALL (QCAR |pr|) (QREFELT $ 113)))
                                      (SPADCALL (QCDR |pr|)
                                                (* |n|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QCAR |pr|)
                                                               (QREFELT $ 113))
                                                     (QREFELT $ 19))
                                                    (QREFELT $ 80)))
                                                (QREFELT $ 88))
                                      (QREFELT $ 89)))))))
                                (EXIT (|AF;inroot0| |x| |n| 'NIL 'NIL $))))
                          (#3# (|AF;inroot0| |x| |n| 'NIL 'NIL $))))))))))
         #1# (EXIT #1#)))))))) 

(DEFUN |AF;inroot0| (|x| |n| |num?| |den?| $)
  (PROG (#1=#:G270 |rec| #2=#:G279 #3=#:G276 #4=#:G272 |rd| |rn|)
    (RETURN
     (SEQ
      (LETT |rn|
            (COND (|num?| (CONS 1 "failed"))
                  (#5='T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 102)) (QREFELT $ 100))))
            . #6=(|AF;inroot0|))
      (LETT |rd|
            (COND (|den?| (CONS 1 "failed"))
                  (#5#
                   (SPADCALL (SPADCALL |x| (QREFELT $ 97)) (QREFELT $ 100))))
            . #6#)
      (COND
       ((QEQCAR |rn| 0)
        (COND
         ((QEQCAR |rd| 0)
          (EXIT
           (SEQ
            (LETT |rec|
                  (SPADCALL (SPADCALL (QCDR |rn|) (QCDR |rd|) (QREFELT $ 88))
                            (PROG1 (LETT #4# |n| . #6#)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            (QREFELT $ 116))
                  . #6#)
            (EXIT
             (SPADCALL (QVELT |rec| 1)
                       (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                       (QREFELT $ 94)))))))))
      (EXIT
       (COND
        ((QEQCAR |rn| 0)
         (SEQ
          (LETT |rec|
                (SPADCALL (SPADCALL (QCDR |rn|) (QREFELT $ 105))
                          (PROG1 (LETT #3# |n| . #6#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#))
                          (QREFELT $ 116))
                . #6#)
          (EXIT
           (SPADCALL (QVELT |rec| 1)
                     (|AF;inroot0|
                      (SPADCALL
                       (SPADCALL (QVELT |rec| 2)
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |n| (QVELT |rec| 0)
                                                     (QREFELT $ 118))
                                           . #6#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (|Integer|)
                                                  #1#))
                                 (QREFELT $ 93))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 97)) (QREFELT $ 103))
                       (QREFELT $ 48))
                      |n| 'T |den?| $)
                     (QREFELT $ 94)))))
        ((QEQCAR |rd| 0)
         (SEQ
          (LETT |rec|
                (SPADCALL (SPADCALL (QCDR |rd|) (QREFELT $ 105))
                          (PROG1 (LETT #2# |n| . #6#)
                            (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                             #2#))
                          (QREFELT $ 116))
                . #6#)
          (EXIT
           (SPADCALL
            (|AF;inroot0|
             (SPADCALL
              (SPADCALL (SPADCALL |x| (QREFELT $ 102)) (QREFELT $ 103))
              (SPADCALL (QVELT |rec| 2)
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |n| (QVELT |rec| 0)
                                            (QREFELT $ 118))
                                  . #6#)
                            (QCDR #1#)
                          (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                        (QREFELT $ 93))
              (QREFELT $ 48))
             |n| |num?| 'T $)
            (QVELT |rec| 1) (QREFELT $ 48)))))
        (#5# (|AF;hackroot| |x| |n| $)))))))) 

(DEFUN |AF;iroot;RIF;17| (|r| |n| $)
  (SPADCALL (SPADCALL |r| |n| (QREFELT $ 119)) (QREFELT $ 63))) 

(DEFUN |AF;iroot;RIF;18| (|r| |n| $)
  (SPADCALL (SPADCALL |r| |n| (QREFELT $ 119)) (QREFELT $ 63))) 

(DEFUN |AF;iroot;RIF;19| (|r| |n| $)
  (COND
   ((OR (ODDP |n|) (NULL (SPADCALL |r| (|spadConstant| $ 37) (QREFELT $ 120))))
    (SPADCALL (SPADCALL |r| |n| (QREFELT $ 119)) (QREFELT $ 63)))
   ('T (|AF;iroot0| |r| |n| $)))) 

(DEFUN |AF;iroot;RIF;20| (|r| |n| $) (|AF;iroot0| |r| |n| $)) 

(DEFUN |AF;iroot0| (|r| |n| $)
  (PROG (|rec| #1=#:G291)
    (RETURN
     (SEQ
      (LETT |rec|
            (SPADCALL |r|
                      (PROG1 (LETT #1# |n| . #2=(|AF;iroot0|))
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      (QREFELT $ 121))
            . #2#)
      (EXIT
       (SPADCALL (QVELT |rec| 1)
                 (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                 (QREFELT $ 94))))))) 

(DEFUN |AF;definingPolynomial;2F;22| (|x| $)
  (PROG (|k| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 123))
            . #1=(|AF;definingPolynomial;2F;22|))
      (EXIT
       (COND
        ((QEQCAR |r| 0)
         (COND
          ((SPADCALL (LETT |k| (QCDR |r|) . #1#) (QREFELT $ 13)
                     (QREFELT $ 112))
           (|SPADfirst| (SPADCALL |k| (QREFELT $ 113))))
          ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 112))
           (SPADCALL
            (SPADCALL (QREFELT $ 78)
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 113)) (QREFELT $ 19))
                       (QREFELT $ 80))
                      (QREFELT $ 93))
            (|SPADfirst| (SPADCALL |k| (QREFELT $ 113))) (QREFELT $ 124)))
          (#2='T (SPADCALL (QREFELT $ 78) |x| (QREFELT $ 124)))))
        (#2# (SPADCALL (QREFELT $ 78) |x| (QREFELT $ 124))))))))) 

(DEFUN |AF;minPoly;KSup;23| (|k| $)
  (PROG (#1=#:G302)
    (RETURN
     (COND
      ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 112))
       (SPADCALL
        (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 113)))
                  (SPADCALL
                   (SPADCALL (SPADCALL |k| (QREFELT $ 113)) (QREFELT $ 19))
                   (QREFELT $ 40))
                  (QREFELT $ 31))
        (QREFELT $ 33)))
      ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 112))
       (SPADCALL
        (SPADCALL (|spadConstant| $ 56)
                  (PROG1
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 113))
                                       (QREFELT $ 19))
                             (QREFELT $ 80))
                            |AF;minPoly;KSup;23|)
                    (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                  (QREFELT $ 126))
        (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 113))) (QREFELT $ 127))
        (QREFELT $ 128)))
      ('T
       (SPADCALL (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 126))
                 (SPADCALL (SPADCALL |k| (QREFELT $ 28)) (QREFELT $ 127))
                 (QREFELT $ 128))))))) 

(DEFUN |AF;droot;LOf;24| (|l| $)
  (PROG (|n| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 21))
            . #1=(|AF;droot;LOf;24|))
      (LETT |n| (SPADCALL |l| (QREFELT $ 19)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |n| (SPADCALL 2 (QREFELT $ 90)) (QREFELT $ 95))
         (SPADCALL |x| (QREFELT $ 81)))
        ('T (SPADCALL |x| (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 83))))))))) 

(DEFUN |AF;minPoly;KSup;25| (|k| $)
  (COND
   ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 112))
    (SPADCALL
     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 113)))
               (SPADCALL
                (SPADCALL (SPADCALL |k| (QREFELT $ 113)) (QREFELT $ 19))
                (QREFELT $ 40))
               (QREFELT $ 31))
     (QREFELT $ 33)))
   ('T
    (SPADCALL (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 126))
              (SPADCALL (SPADCALL |k| (QREFELT $ 28)) (QREFELT $ 127))
              (QREFELT $ 128))))) 

(DEFUN |AlgebraicFunction| (&REST #1=#:G315)
  (PROG ()
    (RETURN
     (PROG (#2=#:G316)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AlgebraicFunction|)
                                           '|domainEqualList|)
                . #3=(|AlgebraicFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AlgebraicFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|AlgebraicFunction|))))))))))) 

(DEFUN |AlgebraicFunction;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AlgebraicFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|AlgebraicFunction| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 132) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|AlgebraicFunction| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|%alg|)
      (QSETREFV $ 13 (SPADCALL '|rootOf| (QREFELT $ 12)))
      (QSETREFV $ 14 (SPADCALL '|nthRoot| (QREFELT $ 12)))
      (COND
       ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
        (PROGN
         (QSETREFV $ 29 (CONS (|dispatchFunction| |AF;inrootof;Sup2F;7|) $))))
       ('T
        (QSETREFV $ 29 (CONS (|dispatchFunction| |AF;inrootof;Sup2F;9|) $))))
      (SPADCALL (QREFELT $ 13) (CONS (|function| |AF;ialg|) $) (QREFELT $ 74))
      (SPADCALL (QREFELT $ 13) '|%specialDiff| (CONS (|function| |AF;dvalg|) $)
                (QREFELT $ 76))
      (SPADCALL (QREFELT $ 13) '|%specialDisp| (CONS (|function| |AF;dalg|) $)
                (QREFELT $ 76))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 78 (SPADCALL '|%%var| (QREFELT $ 77)))
         NIL
         NIL
         NIL
         NIL
         NIL
         (QSETREFV $ 84 (CONS (|dispatchFunction| |AF;droot;LOf;11|) $))
         (QSETREFV $ 89 (CONS (|dispatchFunction| |AF;^;FFF;13|) $))
         (COND
          ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
           (QSETREFV $ 108 (CONS (|dispatchFunction| |AF;iroot;RIF;17|) $)))
          ('T
           (PROGN
            (COND
             ((|HasCategory| |#1| '(|RadicalCategory|))
              (COND
               ((|HasSignature| |#1|
                                (LIST '|imaginary| (LIST (|devaluate| |#1|))))
                (QSETREFV $ 108
                          (CONS (|dispatchFunction| |AF;iroot;RIF;18|) $)))
               ('T
                (QSETREFV $ 108
                          (CONS (|dispatchFunction| |AF;iroot;RIF;19|) $)))))
             ('T
              (QSETREFV $ 108
                        (CONS (|dispatchFunction| |AF;iroot;RIF;20|) $)))))))
         (QSETREFV $ 125
                   (CONS (|dispatchFunction| |AF;definingPolynomial;2F;22|) $))
         (QSETREFV $ 129 (CONS (|dispatchFunction| |AF;minPoly;KSup;23|) $))
         (SPADCALL (QREFELT $ 14) (CONS (|function| |AF;inroot|) $)
                   (QREFELT $ 74))
         (SPADCALL (QREFELT $ 14)
                   (LIST (CONS (|function| |AF;dvroot|) $)
                         (CONS (|function| |AF;lzero|) $))
                   (QREFELT $ 131))))
       ('T
        (PROGN
         (QSETREFV $ 84 (CONS (|dispatchFunction| |AF;droot;LOf;24|) $))
         (QSETREFV $ 129 (CONS (|dispatchFunction| |AF;minPoly;KSup;25|) $)))))
      (SPADCALL (QREFELT $ 14) '|%specialDisp| (ELT $ 84) (QREFELT $ 76))
      $)))) 

(MAKEPROP '|AlgebraicFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opalg| '|oproot| (|Boolean|) (5 . |has?|) |AF;belong?;BoB;1|
              (|List| 7) (11 . |second|) (|OutputForm|) (16 . |coerce|)
              (|Kernel| 7) (21 . |kernel|) (|Union| 7 '"failed")
              (|SparseUnivariatePolynomial| 7) (26 . |retractIfCan|)
              (|Kernel| $) (31 . |coerce|) (36 . |inrootof|) (|Fraction| 61)
              (42 . |univariate|) (|Fraction| 25) (48 . |numer|) (53 . |denom|)
              (|NonNegativeInteger|) (58 . |degree|) (63 . |Zero|) (67 . >)
              |AF;rootOf;SupSF;3| (73 . |retract|) (|List| $) (78 . |kernel|)
              (84 . |differentiate|) (|Mapping| 7 7) (90 . |map|) (96 . |elt|)
              (102 . |differentiate|) (107 . /) (113 . -) (118 . |is?|)
              |AF;operator;2Bo;6| (124 . |monomial?|) (129 . |Zero|) (133 . <=)
              (139 . |One|) (143 . |One|) (147 . |reductum|)
              (152 . |leadingCoefficient|) (|Union| 10 '#1="failed")
              (157 . |retractIfCan|) (|SparseUnivariatePolynomial| $)
              (162 . |rootOf|) (168 . |coerce|)
              (|SparseUnivariatePolynomial| 6) (173 . |Zero|) (177 . |Zero|)
              (181 . ~=) (|Union| 6 '#1#) (187 . |retractIfCan|)
              (192 . |monomial|) (198 . +) (|Mapping| 7 18)
              (|BasicOperatorFunctions1| 7) (204 . |evaluate|) (|None|)
              (210 . |setProperty|) (217 . |coerce|) '|dumvar| (|Integer|)
              (222 . |retract|) (227 . |root|) (232 . |coerce|) (237 . |root|)
              (243 . |droot|) (|SparseMultivariatePolynomial| 6 22)
              (248 . |One|) (|Fraction| 79) (252 . /) (258 . ^)
              (264 . |coerce|) (269 . |numer|) (274 . |denom|) (279 . ^)
              (285 . *) (291 . =) (|SparseMultivariatePolynomial| 6 27)
              (297 . |denom|) (302 . ~=) (|Union| 79 '"failed")
              (308 . |retractIfCan|) (313 . |positive?|) (318 . |numer|)
              (323 . |coerce|) (328 . |One|) (332 . |coerce|) (337 . /)
              (343 . +) (349 . |iroot|)
              (|Record| (|:| |var| 27) (|:| |exponent| 79))
              (|Union| 109 '"failed") (355 . |isExpt|) (360 . |is?|)
              (366 . |argument|)
              (|Record| (|:| |exponent| 35) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 22) 22 6 85 7)
              (371 . |qroot|) (|Union| $ '"failed") (377 . |exquo|)
              (383 . |nthRoot|) (389 . |smaller?|) (395 . |rroot|)
              (|Union| 27 '#1#) (401 . |retractIfCan|) (406 . -)
              (412 . |definingPolynomial|) (417 . |monomial|) (423 . |coerce|)
              (428 . -) (434 . |minPoly|) (|List| 72) (439 . |derivative|))
           '#(|rootOf| 445 |operator| 451 |minPoly| 456 |iroot| 461 |inrootof|
              467 |droot| 473 |definingPolynomial| 478 |belong?| 483 ^ 488)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 131
                                                 '(1 11 9 10 12 2 9 15 0 10 16
                                                   1 18 7 0 19 1 7 20 0 21 1 22
                                                   0 10 23 1 25 24 0 26 1 7 0
                                                   27 28 2 0 7 25 7 29 2 7 30 0
                                                   27 31 1 32 25 0 33 1 32 25 0
                                                   34 1 25 35 0 36 0 6 0 37 2
                                                   35 15 0 0 38 1 7 27 0 40 2 7
                                                   0 9 41 42 2 7 0 0 10 43 2 25
                                                   0 44 0 45 2 25 7 0 7 46 1 25
                                                   0 0 47 2 7 0 0 0 48 1 7 0 0
                                                   49 2 9 15 0 10 50 1 25 15 0
                                                   52 0 7 0 53 2 35 15 0 0 54 0
                                                   6 0 55 0 7 0 56 1 25 0 0 57
                                                   1 25 7 0 58 1 7 59 0 60 2 6
                                                   0 61 10 62 1 7 0 6 63 0 64 0
                                                   65 0 25 0 66 2 25 15 0 0 67
                                                   1 7 68 0 69 2 64 0 6 35 70 2
                                                   64 0 0 0 71 2 73 9 9 72 74 3
                                                   9 0 0 10 75 76 1 7 0 10 77 1
                                                   7 79 0 80 1 20 0 0 81 1 79
                                                   20 0 82 2 20 0 0 0 83 1 0 20
                                                   18 84 0 85 0 86 2 87 0 79 79
                                                   88 2 0 7 7 87 89 1 7 0 79 90
                                                   1 87 79 0 91 1 87 79 0 92 2
                                                   7 0 0 79 93 2 7 0 0 0 94 2 7
                                                   15 0 0 95 1 7 96 0 97 2 85
                                                   15 0 0 98 1 85 99 0 100 1 79
                                                   15 0 101 1 7 96 0 102 1 7 0
                                                   96 103 0 87 0 104 1 87 0 79
                                                   105 2 87 0 0 0 106 2 7 0 0 0
                                                   107 2 0 7 6 79 108 1 7 110 0
                                                   111 2 22 15 0 9 112 1 22 18
                                                   0 113 2 115 114 87 35 116 2
                                                   79 117 0 0 118 2 6 0 0 79
                                                   119 2 6 15 0 0 120 2 115 114
                                                   6 35 121 1 7 122 0 123 2 7 0
                                                   0 0 124 1 0 7 7 125 2 25 0 7
                                                   35 126 1 25 0 7 127 2 25 0 0
                                                   0 128 1 0 25 22 129 2 73 9 9
                                                   130 131 2 0 7 25 10 39 1 0 9
                                                   9 51 1 1 25 22 129 2 1 7 6
                                                   79 108 2 0 7 25 7 29 1 0 20
                                                   18 84 1 1 7 7 125 1 0 15 9
                                                   17 2 1 7 7 87 89)))))
           '|lookupComplete|)) 
