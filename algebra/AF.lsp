
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
  (PROG (#1=#:G214 |r| |rx| |d|)
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
  (PROG (|ans| #1=#:G228 |r|)
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

(DEFUN |AF;eqopalg| (|k1| |k2| $)
  (PROG (|lc2| |lc1| |p2| |p1| |pe2| |pe1| |dv2| |dv1| |al2| |al1|)
    (RETURN
     (SEQ (LETT |al1| (SPADCALL |k1| (QREFELT $ 72)) . #1=(|AF;eqopalg|))
          (LETT |al2| (SPADCALL |k2| (QREFELT $ 72)) . #1#)
          (LETT |dv1|
                (SPADCALL (SPADCALL |al1| 2 (QREFELT $ 74)) (QREFELT $ 40))
                . #1#)
          (LETT |dv2|
                (SPADCALL (SPADCALL |al2| 2 (QREFELT $ 74)) (QREFELT $ 40))
                . #1#)
          (LETT |pe1| (SPADCALL |al1| 1 (QREFELT $ 74)) . #1#)
          (LETT |pe2| (SPADCALL |al2| 1 (QREFELT $ 74)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |dv1| |dv2| (QREFELT $ 75))
             (SPADCALL |pe1| |pe2| (QREFELT $ 76)))
            (#2='T
             (SEQ
              (LETT |p1|
                    (SPADCALL (SPADCALL |pe1| (QREFELT $ 78)) |dv1|
                              (QREFELT $ 80))
                    . #1#)
              (LETT |p2|
                    (SPADCALL (SPADCALL |pe2| (QREFELT $ 78)) |dv2|
                              (QREFELT $ 80))
                    . #1#)
              (LETT |lc1| (SPADCALL |p1| (QREFELT $ 82)) . #1#)
              (LETT |lc2| (SPADCALL |p2| (QREFELT $ 82)) . #1#)
              (EXIT
               (COND
                ((SPADCALL |lc1| |lc2| (QREFELT $ 83))
                 (SPADCALL |p1| |p2| (QREFELT $ 84)))
                (#2#
                 (SPADCALL (SPADCALL |lc2| |p1| (QREFELT $ 85))
                           (SPADCALL |lc1| |p2| (QREFELT $ 85))
                           (QREFELT $ 84))))))))))))) 

(DEFUN |AF;lzero| (|l| $) (|spadConstant| $ 53)) 

(DEFUN |AF;droot;LOf;12| (|l| $)
  (PROG (|n| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 21))
            . #1=(|AF;droot;LOf;12|))
      (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 93)) . #1#)
      (EXIT
       (COND ((EQL |n| 2) (SPADCALL |x| (QREFELT $ 94)))
             ('T
              (SPADCALL |x| (SPADCALL |n| (QREFELT $ 95)) (QREFELT $ 96))))))))) 

(DEFUN |AF;dvroot| (|l| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 93))
            |AF;dvroot|)
      (EXIT
       (SPADCALL
        (SPADCALL (|SPADfirst| |l|) (SPADCALL (- 1 |n|) |n| (QREFELT $ 100))
                  (QREFELT $ 101))
        (SPADCALL |n| (QREFELT $ 102)) (QREFELT $ 48))))))) 

(DEFUN |AF;^;FFF;14| (|x| |q| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (LETT |qr|
            (DIVIDE2 (SPADCALL |q| (QREFELT $ 103))
                     (SPADCALL |q| (QREFELT $ 104)))
            |AF;^;FFF;14|)
      (EXIT
       (SPADCALL (SPADCALL |x| (QCAR |qr|) (QREFELT $ 105))
                 (SPADCALL
                  (|AF;inroot|
                   (LIST |x|
                         (SPADCALL (SPADCALL |q| (QREFELT $ 104))
                                   (QREFELT $ 102)))
                   $)
                  (QCDR |qr|) (QREFELT $ 105))
                 (QREFELT $ 106))))))) 

(DEFUN |AF;hackroot| (|x| |n| $)
  (PROG (#1=#:G261 |rx| |dx|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (EQL |n| 1) (SPADCALL |x| (|spadConstant| $ 56) (QREFELT $ 76)))
         |x|)
        ('T
         (SEQ
          (COND
           ((SPADCALL
             (LETT |dx| (SPADCALL |x| (QREFELT $ 107)) . #2=(|AF;hackroot|))
             (|spadConstant| $ 98) (QREFELT $ 108))
            (SEQ (LETT |rx| (SPADCALL |dx| (QREFELT $ 110)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |rx| 0)
                    (COND
                     ((SPADCALL (QCDR |rx|) (QREFELT $ 111))
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (|AF;hackroot|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 78))
                                         (QREFELT $ 112))
                               |n| $)
                              (|AF;hackroot|
                               (SPADCALL (QCDR |rx|) (QREFELT $ 102)) |n| $)
                              (QREFELT $ 48))
                             . #2#)
                       (GO #1#))))))))))
          (COND
           ((SPADCALL |x| (SPADCALL (|spadConstant| $ 56) (QREFELT $ 49))
                      (QREFELT $ 76))
            (COND
             ((EQL |n| 4)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 56) (QREFELT $ 49))
                           (SPADCALL (|spadConstant| $ 113)
                                     (SPADCALL 2 (QREFELT $ 114))
                                     (QREFELT $ 115))
                           (QREFELT $ 101))
                 (|spadConstant| $ 56) (QREFELT $ 116))
                (SPADCALL (SPADCALL 2 (QREFELT $ 102))
                          (SPADCALL (|spadConstant| $ 113)
                                    (SPADCALL 2 (QREFELT $ 114))
                                    (QREFELT $ 115))
                          (QREFELT $ 101))
                (QREFELT $ 48)))))))
          (EXIT
           (SPADCALL (QREFELT $ 14) (LIST |x| (SPADCALL |n| (QREFELT $ 102)))
                     (QREFELT $ 42)))))))
      #1# (EXIT #1#))))) 

(DEFUN |AF;inroot| (|l| $)
  (PROG (|pr| |u| |r| #1=#:G275 |x| |n|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP
         (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 19)) (QREFELT $ 93))
               . #2=(|AF;inroot|)))
        (|error| "root: exponent = 0"))
       (#3='T
        (SEQ
         (EXIT
          (SEQ
           (SEQ (LETT |x| (|SPADfirst| |l|) . #2#)
                (EXIT
                 (COND
                  ((OR (SPADCALL |x| (|spadConstant| $ 56) (QREFELT $ 76))
                       (EQL |n| 1))
                   (PROGN (LETT #1# |x| . #2#) (GO #1#))))))
           (LETT |r| (SPADCALL |x| (QREFELT $ 69)) . #2#)
           (EXIT
            (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |n| (QREFELT $ 117)))
                  (#3#
                   (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 120)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (SEQ (LETT |pr| (QCDR |u|) . #2#)
                                (COND
                                 ((SPADCALL (QCAR |pr|) (QREFELT $ 14)
                                            (QREFELT $ 121))
                                  (COND
                                   ((EQL
                                     (LENGTH
                                      (SPADCALL (QCAR |pr|) (QREFELT $ 72)))
                                     2)
                                    (EXIT
                                     (SPADCALL
                                      (|SPADfirst|
                                       (SPADCALL (QCAR |pr|) (QREFELT $ 72)))
                                      (SPADCALL (QCDR |pr|)
                                                (* |n|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QCAR |pr|)
                                                               (QREFELT $ 72))
                                                     (QREFELT $ 19))
                                                    (QREFELT $ 93)))
                                                (QREFELT $ 100))
                                      (QREFELT $ 101)))))))
                                (EXIT (|AF;inroot0| |x| |n| 'NIL 'NIL $))))
                          (#3# (|AF;inroot0| |x| |n| 'NIL 'NIL $))))))))))
         #1# (EXIT #1#)))))))) 

(DEFUN |AF;inroot0| (|x| |n| |num?| |den?| $)
  (PROG (#1=#:G279 |rec| #2=#:G288 #3=#:G285 #4=#:G281 |rd| |rn|)
    (RETURN
     (SEQ
      (LETT |rn|
            (COND (|num?| (CONS 1 "failed"))
                  (#5='T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 78)) (QREFELT $ 110))))
            . #6=(|AF;inroot0|))
      (LETT |rd|
            (COND (|den?| (CONS 1 "failed"))
                  (#5#
                   (SPADCALL (SPADCALL |x| (QREFELT $ 107)) (QREFELT $ 110))))
            . #6#)
      (COND
       ((QEQCAR |rn| 0)
        (COND
         ((QEQCAR |rd| 0)
          (EXIT
           (SEQ
            (LETT |rec|
                  (SPADCALL (SPADCALL (QCDR |rn|) (QCDR |rd|) (QREFELT $ 100))
                            (PROG1 (LETT #4# |n| . #6#)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            (QREFELT $ 124))
                  . #6#)
            (EXIT
             (SPADCALL (QVELT |rec| 1)
                       (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                       (QREFELT $ 106)))))))))
      (EXIT
       (COND
        ((QEQCAR |rn| 0)
         (SEQ
          (LETT |rec|
                (SPADCALL (SPADCALL (QCDR |rn|) (QREFELT $ 114))
                          (PROG1 (LETT #3# |n| . #6#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#))
                          (QREFELT $ 124))
                . #6#)
          (EXIT
           (SPADCALL (QVELT |rec| 1)
                     (|AF;inroot0|
                      (SPADCALL
                       (SPADCALL (QVELT |rec| 2)
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |n| (QVELT |rec| 0)
                                                     (QREFELT $ 126))
                                           . #6#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (|Integer|)
                                                  #1#))
                                 (QREFELT $ 105))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 107))
                                 (QREFELT $ 112))
                       (QREFELT $ 48))
                      |n| 'T |den?| $)
                     (QREFELT $ 106)))))
        ((QEQCAR |rd| 0)
         (SEQ
          (LETT |rec|
                (SPADCALL (SPADCALL (QCDR |rd|) (QREFELT $ 114))
                          (PROG1 (LETT #2# |n| . #6#)
                            (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                             #2#))
                          (QREFELT $ 124))
                . #6#)
          (EXIT
           (SPADCALL
            (|AF;inroot0|
             (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 78)) (QREFELT $ 112))
                       (SPADCALL (QVELT |rec| 2)
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |n| (QVELT |rec| 0)
                                                     (QREFELT $ 126))
                                           . #6#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (|Integer|)
                                                  #1#))
                                 (QREFELT $ 105))
                       (QREFELT $ 48))
             |n| |num?| 'T $)
            (QVELT |rec| 1) (QREFELT $ 48)))))
        (#5# (|AF;hackroot| |x| |n| $)))))))) 

(DEFUN |AF;iroot;RIF;18| (|r| |n| $)
  (SPADCALL (SPADCALL |r| |n| (QREFELT $ 127)) (QREFELT $ 63))) 

(DEFUN |AF;iroot;RIF;19| (|r| |n| $)
  (SPADCALL (SPADCALL |r| |n| (QREFELT $ 127)) (QREFELT $ 63))) 

(DEFUN |AF;iroot;RIF;20| (|r| |n| $)
  (COND
   ((OR (ODDP |n|) (NULL (SPADCALL |r| (|spadConstant| $ 37) (QREFELT $ 128))))
    (SPADCALL (SPADCALL |r| |n| (QREFELT $ 127)) (QREFELT $ 63)))
   ('T (|AF;iroot0| |r| |n| $)))) 

(DEFUN |AF;iroot;RIF;21| (|r| |n| $) (|AF;iroot0| |r| |n| $)) 

(DEFUN |AF;iroot0| (|r| |n| $)
  (PROG (|rec| #1=#:G300)
    (RETURN
     (SEQ
      (LETT |rec|
            (SPADCALL |r|
                      (PROG1 (LETT #1# |n| . #2=(|AF;iroot0|))
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      (QREFELT $ 129))
            . #2#)
      (EXIT
       (SPADCALL (QVELT |rec| 1)
                 (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                 (QREFELT $ 106))))))) 

(DEFUN |AF;definingPolynomial;2F;23| (|x| $)
  (PROG (|k| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 131))
            . #1=(|AF;definingPolynomial;2F;23|))
      (EXIT
       (COND
        ((QEQCAR |r| 0)
         (COND
          ((SPADCALL (LETT |k| (QCDR |r|) . #1#) (QREFELT $ 13)
                     (QREFELT $ 121))
           (|SPADfirst| (SPADCALL |k| (QREFELT $ 72))))
          ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 121))
           (SPADCALL
            (SPADCALL (QREFELT $ 92)
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 72)) (QREFELT $ 19))
                       (QREFELT $ 93))
                      (QREFELT $ 105))
            (|SPADfirst| (SPADCALL |k| (QREFELT $ 72))) (QREFELT $ 132)))
          (#2='T (SPADCALL (QREFELT $ 92) |x| (QREFELT $ 132)))))
        (#2# (SPADCALL (QREFELT $ 92) |x| (QREFELT $ 132))))))))) 

(DEFUN |AF;minPoly;KSup;24| (|k| $)
  (PROG (#1=#:G311)
    (RETURN
     (COND
      ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 121))
       (SPADCALL
        (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 72)))
                  (SPADCALL
                   (SPADCALL (SPADCALL |k| (QREFELT $ 72)) (QREFELT $ 19))
                   (QREFELT $ 40))
                  (QREFELT $ 31))
        (QREFELT $ 33)))
      ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 121))
       (SPADCALL
        (SPADCALL (|spadConstant| $ 56)
                  (PROG1
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 72))
                                       (QREFELT $ 19))
                             (QREFELT $ 93))
                            |AF;minPoly;KSup;24|)
                    (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                  (QREFELT $ 134))
        (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 72))) (QREFELT $ 135))
        (QREFELT $ 136)))
      ('T
       (SPADCALL (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 134))
                 (SPADCALL (SPADCALL |k| (QREFELT $ 28)) (QREFELT $ 135))
                 (QREFELT $ 136))))))) 

(DEFUN |AF;droot;LOf;25| (|l| $)
  (PROG (|n| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 21))
            . #1=(|AF;droot;LOf;25|))
      (LETT |n| (SPADCALL |l| (QREFELT $ 19)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |n| (SPADCALL 2 (QREFELT $ 102)) (QREFELT $ 76))
         (SPADCALL |x| (QREFELT $ 94)))
        ('T (SPADCALL |x| (SPADCALL |n| (QREFELT $ 21)) (QREFELT $ 96))))))))) 

(DEFUN |AF;minPoly;KSup;26| (|k| $)
  (COND
   ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 121))
    (SPADCALL
     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 72)))
               (SPADCALL
                (SPADCALL (SPADCALL |k| (QREFELT $ 72)) (QREFELT $ 19))
                (QREFELT $ 40))
               (QREFELT $ 31))
     (QREFELT $ 33)))
   ('T
    (SPADCALL (SPADCALL (|spadConstant| $ 56) 1 (QREFELT $ 134))
              (SPADCALL (SPADCALL |k| (QREFELT $ 28)) (QREFELT $ 135))
              (QREFELT $ 136))))) 

(DEFUN |AlgebraicFunction| (&REST #1=#:G324)
  (PROG ()
    (RETURN
     (PROG (#2=#:G325)
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
      (LETT $ (GETREFV 140) . #1#)
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
      (SPADCALL (QREFELT $ 13) (CONS (|function| |AF;ialg|) $) (QREFELT $ 88))
      (SPADCALL (QREFELT $ 13) '|%specialDiff| (CONS (|function| |AF;dvalg|) $)
                (QREFELT $ 90))
      (SPADCALL (QREFELT $ 13) '|%specialDisp| (CONS (|function| |AF;dalg|) $)
                (QREFELT $ 90))
      (SPADCALL (QREFELT $ 13) '|%specialEqual|
                (CONS (|function| |AF;eqopalg|) $) (QREFELT $ 90))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 92 (SPADCALL '|%%var| (QREFELT $ 91)))
         NIL
         NIL
         NIL
         NIL
         NIL
         (QSETREFV $ 97 (CONS (|dispatchFunction| |AF;droot;LOf;12|) $))
         (QSETREFV $ 101 (CONS (|dispatchFunction| |AF;^;FFF;14|) $))
         (COND
          ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
           (QSETREFV $ 117 (CONS (|dispatchFunction| |AF;iroot;RIF;18|) $)))
          ('T
           (PROGN
            (COND
             ((|HasCategory| |#1| '(|RadicalCategory|))
              (COND
               ((|HasSignature| |#1|
                                (LIST '|imaginary| (LIST (|devaluate| |#1|))))
                (QSETREFV $ 117
                          (CONS (|dispatchFunction| |AF;iroot;RIF;19|) $)))
               ('T
                (QSETREFV $ 117
                          (CONS (|dispatchFunction| |AF;iroot;RIF;20|) $)))))
             ('T
              (QSETREFV $ 117
                        (CONS (|dispatchFunction| |AF;iroot;RIF;21|) $)))))))
         (QSETREFV $ 133
                   (CONS (|dispatchFunction| |AF;definingPolynomial;2F;23|) $))
         (QSETREFV $ 137 (CONS (|dispatchFunction| |AF;minPoly;KSup;24|) $))
         (SPADCALL (QREFELT $ 14) (CONS (|function| |AF;inroot|) $)
                   (QREFELT $ 88))
         (SPADCALL (QREFELT $ 14)
                   (LIST (CONS (|function| |AF;dvroot|) $)
                         (CONS (|function| |AF;lzero|) $))
                   (QREFELT $ 139))))
       ('T
        (PROGN
         (QSETREFV $ 97 (CONS (|dispatchFunction| |AF;droot;LOf;25|) $))
         (QSETREFV $ 137 (CONS (|dispatchFunction| |AF;minPoly;KSup;26|) $)))))
      (SPADCALL (QREFELT $ 14) '|%specialDisp| (ELT $ 97) (QREFELT $ 90))
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
              (192 . |monomial|) (198 . +) (204 . |argument|) (|Integer|)
              (209 . |elt|) (215 . =) (221 . =)
              (|SparseMultivariatePolynomial| 6 27) (227 . |numer|)
              (|SparseMultivariatePolynomial| 6 22) (232 . |univariate|)
              (|SparseUnivariatePolynomial| 79) (238 . |leadingCoefficient|)
              (243 . =) (249 . =) (255 . *) (|Mapping| 7 18)
              (|BasicOperatorFunctions1| 7) (261 . |evaluate|) (|None|)
              (267 . |setProperty|) (274 . |coerce|) '|dumvar|
              (279 . |retract|) (284 . |root|) (289 . |coerce|) (294 . |root|)
              (300 . |droot|) (305 . |One|) (|Fraction| 73) (309 . /) (315 . ^)
              (321 . |coerce|) (326 . |numer|) (331 . |denom|) (336 . ^)
              (342 . *) (348 . |denom|) (353 . ~=) (|Union| 73 '"failed")
              (359 . |retractIfCan|) (364 . |positive?|) (369 . |coerce|)
              (374 . |One|) (378 . |coerce|) (383 . /) (389 . +)
              (395 . |iroot|) (|Record| (|:| |var| 27) (|:| |exponent| 73))
              (|Union| 118 '"failed") (401 . |isExpt|) (406 . |is?|)
              (|Record| (|:| |exponent| 35) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 22) 22 6 79 7)
              (412 . |qroot|) (|Union| $ '"failed") (418 . |exquo|)
              (424 . |nthRoot|) (430 . |smaller?|) (436 . |rroot|)
              (|Union| 27 '#1#) (442 . |retractIfCan|) (447 . -)
              (453 . |definingPolynomial|) (458 . |monomial|) (464 . |coerce|)
              (469 . -) (475 . |minPoly|) (|List| 86) (480 . |derivative|))
           '#(|rootOf| 486 |operator| 492 |minPoly| 497 |iroot| 502 |inrootof|
              508 |droot| 514 |definingPolynomial| 519 |belong?| 524 ^ 529)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 139
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
                                                   64 0 0 0 71 1 22 18 0 72 2
                                                   18 7 0 73 74 2 22 15 0 0 75
                                                   2 7 15 0 0 76 1 7 77 0 78 2
                                                   79 61 0 22 80 1 81 79 0 82 2
                                                   79 15 0 0 83 2 81 15 0 0 84
                                                   2 81 0 79 0 85 2 87 9 9 86
                                                   88 3 9 0 0 10 89 90 1 7 0 10
                                                   91 1 7 73 0 93 1 20 0 0 94 1
                                                   73 20 0 95 2 20 0 0 0 96 1 0
                                                   20 18 97 0 79 0 98 2 99 0 73
                                                   73 100 2 0 7 7 99 101 1 7 0
                                                   73 102 1 99 73 0 103 1 99 73
                                                   0 104 2 7 0 0 73 105 2 7 0 0
                                                   0 106 1 7 77 0 107 2 79 15 0
                                                   0 108 1 79 109 0 110 1 73 15
                                                   0 111 1 7 0 77 112 0 99 0
                                                   113 1 99 0 73 114 2 99 0 0 0
                                                   115 2 7 0 0 0 116 2 0 7 6 73
                                                   117 1 7 119 0 120 2 22 15 0
                                                   9 121 2 123 122 99 35 124 2
                                                   73 125 0 0 126 2 6 0 0 73
                                                   127 2 6 15 0 0 128 2 123 122
                                                   6 35 129 1 7 130 0 131 2 7 0
                                                   0 0 132 1 0 7 7 133 2 25 0 7
                                                   35 134 1 25 0 7 135 2 25 0 0
                                                   0 136 1 0 25 22 137 2 87 9 9
                                                   138 139 2 0 7 25 10 39 1 0 9
                                                   9 51 1 1 25 22 137 2 1 7 6
                                                   73 117 2 0 7 25 7 29 1 0 20
                                                   18 97 1 1 7 7 133 1 0 15 9
                                                   17 2 1 7 7 99 101)))))
           '|lookupComplete|)) 
