
(/VERSIONCHECK 2) 

(DEFUN |AF;belong?;BoB;1| (|op| $)
  (COND ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 17)) 'T)
        ('T (SPADCALL |op| '|%root_sum| (QREFELT $ 18))))) 

(DEFUN |AF;dalg| (|l| $)
  (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 23))) 

(DEFUN |AF;rootOf;SupSF;3| (|p| |x| $)
  (PROG (|n| |f| |r| |k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 25)) . #1=(|AF;rootOf;SupSF;3|))
          (LETT |r| (SPADCALL |p| (QREFELT $ 28)) . #1#)
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (SPADCALL |p| (SPADCALL |k| (QREFELT $ 30)) (QREFELT $ 31)))
            (#2='T
             (SEQ
              (LETT |n|
                    (SPADCALL
                     (LETT |f| (SPADCALL (QCDR |r|) |k| (QREFELT $ 33)) . #1#)
                     (QREFELT $ 35))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL
                  (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 38)) 0
                  (QREFELT $ 40))
                 (|error| "roofOf: variable appears in denom"))
                (#2#
                 (SPADCALL |n| (SPADCALL |k| (QREFELT $ 30))
                           (QREFELT $ 31))))))))))))) 

(DEFUN |AF;dvalg| (|l| |x| $)
  (PROG (|alpha| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL
             (SPADCALL (|SPADfirst| |l|)
                       (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 42))
                       (QREFELT $ 33))
             (QREFELT $ 35))
            . #1=(|AF;dvalg|))
      (LETT |alpha| (SPADCALL (QREFELT $ 13) |l| (QREFELT $ 44)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL
          (SPADCALL (CONS #'|AF;dvalg!0| (VECTOR $ |x|)) |p| (QREFELT $ 47))
          |alpha| (QREFELT $ 48))
         (SPADCALL (SPADCALL |p| (QREFELT $ 49)) |alpha| (QREFELT $ 48))
         (QREFELT $ 50))
        (QREFELT $ 51))))))) 

(DEFUN |AF;dvalg!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|AF;dvalg|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 45)))))) 

(DEFUN |AF;ialg| (|l| $)
  (PROG (|f| |x| |p|)
    (RETURN
     (SEQ
      (LETT |f|
            (SPADCALL (LETT |p| (|SPADfirst| |l|) . #1=(|AF;ialg|))
                      (SPADCALL (LETT |x| (SPADCALL |l| (QREFELT $ 21)) . #1#)
                                (QREFELT $ 42))
                      (QREFELT $ 33))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 38)) 0
                   (QREFELT $ 40))
         (|error| "roofOf: variable appears in denom"))
        ('T (SPADCALL (SPADCALL |f| (QREFELT $ 35)) |x| (QREFELT $ 31))))))))) 

(DEFUN |AF;operator;2Bo;6| (|op| $)
  (COND ((SPADCALL |op| '|rootOf| (QREFELT $ 18)) (QREFELT $ 13))
        ((SPADCALL |op| '|nthRoot| (QREFELT $ 18)) (QREFELT $ 14))
        ((SPADCALL |op| '|%root_sum| (QREFELT $ 18)) (QREFELT $ 15))
        ('T (|error| "Unknown operator")))) 

(DEFUN |AF;inrootof;Sup2F;7| (|q| |x| $)
  (PROG (#1=#:G196 |r| |rx| |d|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |q| (QREFELT $ 53)) (|spadConstant| $ 54))
            (#2='T
             (SEQ
              (LETT |d| (SPADCALL |q| (QREFELT $ 38))
                    . #3=(|AF;inrootof;Sup2F;7|))
              (EXIT
               (COND
                ((SPADCALL |d| 0 (QREFELT $ 55))
                 (|error| "rootOf: constant polynomial"))
                ((EQL |d| 1)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 58)) (QREFELT $ 59))
                   (SPADCALL |q| (QREFELT $ 59)) (QREFELT $ 50))
                  (QREFELT $ 51)))
                (#2#
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ (LETT |rx| (SPADCALL |x| (QREFELT $ 61)) . #3#)
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
                                                      (QREFELT $ 63))
                                            (QREFELT $ 64))
                                           . #3#)
                                     (GO #1#))))))))))
                    (EXIT
                     (SPADCALL (QREFELT $ 13)
                               (LIST (SPADCALL |q| |x| (QREFELT $ 48)) |x|)
                               (QREFELT $ 44)))))
                  #1# (EXIT #1#)))))))))))) 

(DEFUN |AF;UP2R| (|p| $)
  (PROG (|ans| #1=#:G210 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| (|spadConstant| $ 66) . #2=(|AF;UP2R|))
            (SEQ G190
                 (COND
                  ((NULL (SPADCALL |p| (|spadConstant| $ 67) (QREFELT $ 68)))
                   (GO G191)))
                 (SEQ
                  (LETT |r|
                        (SPADCALL (SPADCALL |p| (QREFELT $ 59)) (QREFELT $ 70))
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
                                                (SPADCALL |p| (QREFELT $ 38))
                                                (QREFELT $ 71))
                                      (QREFELT $ 72))
                            . #2#)
                      (EXIT
                       (LETT |p| (SPADCALL |p| (QREFELT $ 58)) . #2#)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |AF;inrootof;Sup2F;9| (|q| |x| $)
  (PROG (|d|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |q| (QREFELT $ 53)) (|spadConstant| $ 54))
            (#1='T
             (SEQ
              (LETT |d| (SPADCALL |q| (QREFELT $ 38)) |AF;inrootof;Sup2F;9|)
              (EXIT
               (COND
                ((SPADCALL |d| 0 (QREFELT $ 55))
                 (|error| "rootOf: constant polynomial"))
                ((EQL |d| 1)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 58)) (QREFELT $ 59))
                   (SPADCALL |q| (QREFELT $ 59)) (QREFELT $ 50))
                  (QREFELT $ 51)))
                (#1#
                 (SPADCALL (QREFELT $ 13)
                           (LIST (SPADCALL |q| |x| (QREFELT $ 48)) |x|)
                           (QREFELT $ 44)))))))))))) 

(DEFUN |AF;eqopalg| (|k1| |k2| $)
  (PROG (|lc2| |lc1| |p2| |p1| |pe2| |pe1| |dv2| |dv1| |al2| |al1|)
    (RETURN
     (SEQ (LETT |al1| (SPADCALL |k1| (QREFELT $ 73)) . #1=(|AF;eqopalg|))
          (LETT |al2| (SPADCALL |k2| (QREFELT $ 73)) . #1#)
          (LETT |dv1|
                (SPADCALL (SPADCALL |al1| 2 (QREFELT $ 75)) (QREFELT $ 42))
                . #1#)
          (LETT |dv2|
                (SPADCALL (SPADCALL |al2| 2 (QREFELT $ 75)) (QREFELT $ 42))
                . #1#)
          (LETT |pe1| (SPADCALL |al1| 1 (QREFELT $ 75)) . #1#)
          (LETT |pe2| (SPADCALL |al2| 1 (QREFELT $ 75)) . #1#)
          (EXIT
           (COND
            ((SPADCALL |dv1| |dv2| (QREFELT $ 76))
             (SPADCALL |pe1| |pe2| (QREFELT $ 77)))
            (#2='T
             (SEQ
              (LETT |p1|
                    (SPADCALL (SPADCALL |pe1| (QREFELT $ 79)) |dv1|
                              (QREFELT $ 81))
                    . #1#)
              (LETT |p2|
                    (SPADCALL (SPADCALL |pe2| (QREFELT $ 79)) |dv2|
                              (QREFELT $ 81))
                    . #1#)
              (LETT |lc1| (SPADCALL |p1| (QREFELT $ 83)) . #1#)
              (LETT |lc2| (SPADCALL |p2| (QREFELT $ 83)) . #1#)
              (EXIT
               (COND
                ((SPADCALL |lc1| |lc2| (QREFELT $ 84))
                 (SPADCALL |p1| |p2| (QREFELT $ 85)))
                (#2#
                 (SPADCALL (SPADCALL |lc2| |p1| (QREFELT $ 86))
                           (SPADCALL |lc1| |p2| (QREFELT $ 86))
                           (QREFELT $ 85))))))))))))) 

(DEFUN |AF;root_sum1| (|expr| |p| |x| $)
  (PROG (|nexpr| |res| #1=#:G235 |i| |xs| |k|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |expr| (|spadConstant| $ 54) (QREFELT $ 77))
        (|spadConstant| $ 54))
       (#2='T
        (SEQ
         (LETT |nexpr|
               (SPADCALL |expr|
                         (LETT |k| (SPADCALL |x| (QREFELT $ 42))
                               . #3=(|AF;root_sum1|))
                         |p| (QREFELT $ 93))
               . #3#)
         (LETT |xs| (SPADCALL |x| (QREFELT $ 94)) . #3#)
         (EXIT
          (COND
           ((SPADCALL (CONS #'|AF;root_sum1!0| (VECTOR $ |xs|))
                      (SPADCALL |nexpr| (QREFELT $ 96)) (QREFELT $ 98))
            (SEQ (LETT |res| (|spadConstant| $ 54) . #3#)
                 (SEQ (LETT |i| 0 . #3#)
                      (LETT #1# (- (SPADCALL |p| (QREFELT $ 38)) 1) . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (LETT |nexpr| (SPADCALL |nexpr| |p| (QREFELT $ 99))
                             . #3#)
                       (LETT |res|
                             (SPADCALL |res|
                                       (SPADCALL |nexpr| |i| (QREFELT $ 100))
                                       (QREFELT $ 101))
                             . #3#)
                       (EXIT
                        (LETT |nexpr|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 57) 1
                                         (QREFELT $ 102))
                               |nexpr| (QREFELT $ 103))
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT NIL))
                 (EXIT |res|)))
           (#2#
            (SPADCALL (QREFELT $ 15)
                      (LIST (SPADCALL |nexpr| |x| (QREFELT $ 48)) |x|
                            (SPADCALL |p| |x| (QREFELT $ 48)))
                      (QREFELT $ 44)))))))))))) 

(DEFUN |AF;root_sum1!0| (|c| $$)
  (PROG (|xs| $)
    (LETT |xs| (QREFELT $$ 1) . #1=(|AF;root_sum1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |c| |xs| (QREFELT $ 95)) (|spadConstant| $ 54)
                (QREFELT $ 77)))))) 

(DEFUN |AF;rootSum;FSupSF;12| (|expr| |p| |s| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |s| (QREFELT $ 25)) |AF;rootSum;FSupSF;12|)
          (EXIT (|AF;root_sum1| |expr| |p| (SPADCALL |k| (QREFELT $ 30)) $)))))) 

(DEFUN |AF;irootsum| (|l| $)
  (PROG (|p| |x|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL
             (LETT |p| (SPADCALL |l| 3 (QREFELT $ 75)) . #1=(|AF;irootsum|))
             (SPADCALL (LETT |x| (SPADCALL |l| 2 (QREFELT $ 75)) . #1#)
                       (QREFELT $ 42))
             (QREFELT $ 33))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 36)) (QREFELT $ 38)) 0
                   (QREFELT $ 40))
         (|error| "roofSum: variable appears in denom of p"))
        ('T
         (|AF;root_sum1| (SPADCALL |l| 1 (QREFELT $ 75))
          (SPADCALL |p| (QREFELT $ 35)) |x| $)))))))) 

(DEFUN |AF;drootsum| (|l| $)
  (PROG (|p| |dv|)
    (RETURN
     (SEQ
      (LETT |dv| (SPADCALL (SPADCALL |l| 2 (QREFELT $ 75)) (QREFELT $ 42))
            . #1=(|AF;drootsum|))
      (LETT |p|
            (SPADCALL (SPADCALL (SPADCALL |l| 3 (QREFELT $ 75)) (QREFELT $ 79))
                      |dv| (QREFELT $ 81))
            . #1#)
      (EXIT
       (SPADCALL (SPADCALL (SPADCALL |l| 1 (QREFELT $ 75)) (QREFELT $ 23))
                 (SPADCALL
                  (SPADCALL |p| (SPADCALL |dv| (QREFELT $ 105))
                            (QREFELT $ 106))
                  (SPADCALL 0 (QREFELT $ 107)) (QREFELT $ 108))
                 (QREFELT $ 109))))))) 

(DEFUN |AF;dvrootsum| (|l| |x| $)
  (PROG (|nexpr| |expr| |dalpha| |p| |dvs| |dv| |alpha|)
    (RETURN
     (SEQ (SPADCALL "dvrootsum" (QREFELT $ 111))
          (SPADCALL (SPADCALL |l| (QREFELT $ 112)) (QREFELT $ 111))
          (LETT |dv|
                (SPADCALL
                 (LETT |alpha| (SPADCALL |l| 2 (QREFELT $ 75))
                       . #1=(|AF;dvrootsum|))
                 (QREFELT $ 42))
                . #1#)
          (LETT |dvs| (SPADCALL |alpha| (QREFELT $ 94)) . #1#)
          (LETT |p|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| 3 (QREFELT $ 75)) |dv| (QREFELT $ 33))
                 (QREFELT $ 35))
                . #1#)
          (SPADCALL (SPADCALL |p| (QREFELT $ 113)) (QREFELT $ 111))
          (LETT |dalpha|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (CONS #'|AF;dvrootsum!0| (VECTOR $ |x|)) |p|
                             (QREFELT $ 47))
                   |alpha| (QREFELT $ 48))
                  (SPADCALL (SPADCALL |p| (QREFELT $ 49)) |alpha|
                            (QREFELT $ 48))
                  (QREFELT $ 50))
                 (QREFELT $ 51))
                . #1#)
          (LETT |expr| (SPADCALL |l| 1 (QREFELT $ 75)) . #1#)
          (LETT |nexpr|
                (SPADCALL
                 (SPADCALL |dalpha| (SPADCALL |expr| |dvs| (QREFELT $ 45))
                           (QREFELT $ 114))
                 (SPADCALL |expr| |x| (QREFELT $ 45)) (QREFELT $ 101))
                . #1#)
          (SPADCALL (SPADCALL |nexpr| (QREFELT $ 23)) (QREFELT $ 111))
          (EXIT
           (COND
            ((SPADCALL |nexpr| (|spadConstant| $ 54) (QREFELT $ 77))
             (|spadConstant| $ 54))
            ('T (|AF;root_sum1| |nexpr| |p| |alpha| $)))))))) 

(DEFUN |AF;dvrootsum!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|AF;dvrootsum|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 45)))))) 

(DEFUN |AF;lzero| (|l| $) (|spadConstant| $ 54)) 

(DEFUN |AF;droot;LOf;17| (|l| $)
  (PROG (|n| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 23))
            . #1=(|AF;droot;LOf;17|))
      (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 117)) . #1#)
      (EXIT
       (COND ((EQL |n| 2) (SPADCALL |x| (QREFELT $ 118)))
             ('T
              (SPADCALL |x| (SPADCALL |n| (QREFELT $ 107))
                        (QREFELT $ 119))))))))) 

(DEFUN |AF;dvroot| (|l| $)
  (PROG (|n|)
    (RETURN
     (SEQ
      (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 117))
            |AF;dvroot|)
      (EXIT
       (SPADCALL
        (SPADCALL (|SPADfirst| |l|) (SPADCALL (- 1 |n|) |n| (QREFELT $ 123))
                  (QREFELT $ 124))
        (SPADCALL |n| (QREFELT $ 125)) (QREFELT $ 50))))))) 

(DEFUN |AF;^;FFF;19| (|x| |q| $)
  (PROG (|qr|)
    (RETURN
     (SEQ
      (LETT |qr|
            (DIVIDE2 (SPADCALL |q| (QREFELT $ 126))
                     (SPADCALL |q| (QREFELT $ 127)))
            |AF;^;FFF;19|)
      (EXIT
       (SPADCALL (SPADCALL |x| (QCAR |qr|) (QREFELT $ 128))
                 (SPADCALL
                  (|AF;inroot|
                   (LIST |x|
                         (SPADCALL (SPADCALL |q| (QREFELT $ 127))
                                   (QREFELT $ 125)))
                   $)
                  (QCDR |qr|) (QREFELT $ 128))
                 (QREFELT $ 114))))))) 

(DEFUN |AF;hackroot| (|x| |n| $)
  (PROG (#1=#:G377 |rx| |dx|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (EQL |n| 1) (SPADCALL |x| (|spadConstant| $ 57) (QREFELT $ 77)))
         |x|)
        ('T
         (SEQ
          (COND
           ((SPADCALL
             (LETT |dx| (SPADCALL |x| (QREFELT $ 129)) . #2=(|AF;hackroot|))
             (|spadConstant| $ 121) (QREFELT $ 130))
            (SEQ (LETT |rx| (SPADCALL |dx| (QREFELT $ 132)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |rx| 0)
                    (COND
                     ((SPADCALL (QCDR |rx|) (QREFELT $ 133))
                      (PROGN
                       (LETT #1#
                             (SPADCALL
                              (|AF;hackroot|
                               (SPADCALL (SPADCALL |x| (QREFELT $ 79))
                                         (QREFELT $ 134))
                               |n| $)
                              (|AF;hackroot|
                               (SPADCALL (QCDR |rx|) (QREFELT $ 125)) |n| $)
                              (QREFELT $ 50))
                             . #2#)
                       (GO #1#))))))))))
          (COND
           ((SPADCALL |x| (SPADCALL (|spadConstant| $ 57) (QREFELT $ 51))
                      (QREFELT $ 77))
            (COND
             ((EQL |n| 4)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 57) (QREFELT $ 51))
                           (SPADCALL (|spadConstant| $ 135)
                                     (SPADCALL 2 (QREFELT $ 136))
                                     (QREFELT $ 137))
                           (QREFELT $ 124))
                 (|spadConstant| $ 57) (QREFELT $ 101))
                (SPADCALL (SPADCALL 2 (QREFELT $ 125))
                          (SPADCALL (|spadConstant| $ 135)
                                    (SPADCALL 2 (QREFELT $ 136))
                                    (QREFELT $ 137))
                          (QREFELT $ 124))
                (QREFELT $ 50)))))))
          (EXIT
           (SPADCALL (QREFELT $ 14) (LIST |x| (SPADCALL |n| (QREFELT $ 125)))
                     (QREFELT $ 44)))))))
      #1# (EXIT #1#))))) 

(DEFUN |AF;inroot| (|l| $)
  (PROG (|pr| |u| |r| #1=#:G391 |x| |n|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP
         (LETT |n| (SPADCALL (SPADCALL |l| (QREFELT $ 21)) (QREFELT $ 117))
               . #2=(|AF;inroot|)))
        (|error| "root: exponent = 0"))
       (#3='T
        (SEQ
         (EXIT
          (SEQ
           (SEQ (LETT |x| (|SPADfirst| |l|) . #2#)
                (EXIT
                 (COND
                  ((OR (SPADCALL |x| (|spadConstant| $ 57) (QREFELT $ 77))
                       (EQL |n| 1))
                   (PROGN (LETT #1# |x| . #2#) (GO #1#))))))
           (LETT |r| (SPADCALL |x| (QREFELT $ 70)) . #2#)
           (EXIT
            (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) |n| (QREFELT $ 138)))
                  (#3#
                   (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 141)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 0)
                           (SEQ (LETT |pr| (QCDR |u|) . #2#)
                                (COND
                                 ((SPADCALL (QCAR |pr|) (QREFELT $ 14)
                                            (QREFELT $ 142))
                                  (COND
                                   ((EQL
                                     (LENGTH
                                      (SPADCALL (QCAR |pr|) (QREFELT $ 73)))
                                     2)
                                    (EXIT
                                     (SPADCALL
                                      (|SPADfirst|
                                       (SPADCALL (QCAR |pr|) (QREFELT $ 73)))
                                      (SPADCALL (QCDR |pr|)
                                                (* |n|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL (QCAR |pr|)
                                                               (QREFELT $ 73))
                                                     (QREFELT $ 21))
                                                    (QREFELT $ 117)))
                                                (QREFELT $ 123))
                                      (QREFELT $ 124)))))))
                                (EXIT (|AF;inroot0| |x| |n| 'NIL 'NIL $))))
                          (#3# (|AF;inroot0| |x| |n| 'NIL 'NIL $))))))))))
         #1# (EXIT #1#)))))))) 

(DEFUN |AF;inroot0| (|x| |n| |num?| |den?| $)
  (PROG (#1=#:G395 |rec| #2=#:G404 #3=#:G401 #4=#:G397 |rd| |rn|)
    (RETURN
     (SEQ
      (LETT |rn|
            (COND (|num?| (CONS 1 "failed"))
                  (#5='T
                   (SPADCALL (SPADCALL |x| (QREFELT $ 79)) (QREFELT $ 132))))
            . #6=(|AF;inroot0|))
      (LETT |rd|
            (COND (|den?| (CONS 1 "failed"))
                  (#5#
                   (SPADCALL (SPADCALL |x| (QREFELT $ 129)) (QREFELT $ 132))))
            . #6#)
      (COND
       ((QEQCAR |rn| 0)
        (COND
         ((QEQCAR |rd| 0)
          (EXIT
           (SEQ
            (LETT |rec|
                  (SPADCALL (SPADCALL (QCDR |rn|) (QCDR |rd|) (QREFELT $ 123))
                            (PROG1 (LETT #4# |n| . #6#)
                              (|check_subtype| (>= #4# 0)
                                               '(|NonNegativeInteger|) #4#))
                            (QREFELT $ 145))
                  . #6#)
            (EXIT
             (SPADCALL (QVELT |rec| 1)
                       (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                       (QREFELT $ 114)))))))))
      (EXIT
       (COND
        ((QEQCAR |rn| 0)
         (SEQ
          (LETT |rec|
                (SPADCALL (SPADCALL (QCDR |rn|) (QREFELT $ 136))
                          (PROG1 (LETT #3# |n| . #6#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#))
                          (QREFELT $ 145))
                . #6#)
          (EXIT
           (SPADCALL (QVELT |rec| 1)
                     (|AF;inroot0|
                      (SPADCALL
                       (SPADCALL (QVELT |rec| 2)
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |n| (QVELT |rec| 0)
                                                     (QREFELT $ 147))
                                           . #6#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (|Integer|)
                                                  #1#))
                                 (QREFELT $ 128))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 129))
                                 (QREFELT $ 134))
                       (QREFELT $ 50))
                      |n| 'T |den?| $)
                     (QREFELT $ 114)))))
        ((QEQCAR |rd| 0)
         (SEQ
          (LETT |rec|
                (SPADCALL (SPADCALL (QCDR |rd|) (QREFELT $ 136))
                          (PROG1 (LETT #2# |n| . #6#)
                            (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                             #2#))
                          (QREFELT $ 145))
                . #6#)
          (EXIT
           (SPADCALL
            (|AF;inroot0|
             (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 79)) (QREFELT $ 134))
                       (SPADCALL (QVELT |rec| 2)
                                 (PROG2
                                     (LETT #1#
                                           (SPADCALL |n| (QVELT |rec| 0)
                                                     (QREFELT $ 147))
                                           . #6#)
                                     (QCDR #1#)
                                   (|check_union| (QEQCAR #1# 0) (|Integer|)
                                                  #1#))
                                 (QREFELT $ 128))
                       (QREFELT $ 50))
             |n| |num?| 'T $)
            (QVELT |rec| 1) (QREFELT $ 50)))))
        (#5# (|AF;hackroot| |x| |n| $)))))))) 

(DEFUN |AF;iroot;RIF;23| (|r| |n| $)
  (SPADCALL (SPADCALL |r| |n| (QREFELT $ 148)) (QREFELT $ 64))) 

(DEFUN |AF;iroot;RIF;24| (|r| |n| $)
  (SPADCALL (SPADCALL |r| |n| (QREFELT $ 148)) (QREFELT $ 64))) 

(DEFUN |AF;iroot;RIF;25| (|r| |n| $)
  (COND
   ((OR (ODDP |n|) (NULL (SPADCALL |r| (|spadConstant| $ 39) (QREFELT $ 149))))
    (SPADCALL (SPADCALL |r| |n| (QREFELT $ 148)) (QREFELT $ 64)))
   ('T (|AF;iroot0| |r| |n| $)))) 

(DEFUN |AF;iroot;RIF;26| (|r| |n| $) (|AF;iroot0| |r| |n| $)) 

(DEFUN |AF;iroot0| (|r| |n| $)
  (PROG (|rec| #1=#:G416)
    (RETURN
     (SEQ
      (LETT |rec|
            (SPADCALL |r|
                      (PROG1 (LETT #1# |n| . #2=(|AF;iroot0|))
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      (QREFELT $ 150))
            . #2#)
      (EXIT
       (SPADCALL (QVELT |rec| 1)
                 (|AF;hackroot| (QVELT |rec| 2) (QVELT |rec| 0) $)
                 (QREFELT $ 114))))))) 

(DEFUN |AF;definingPolynomial;2F;28| (|x| $)
  (PROG (|k| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 152))
            . #1=(|AF;definingPolynomial;2F;28|))
      (EXIT
       (COND
        ((QEQCAR |r| 0)
         (COND
          ((SPADCALL (LETT |k| (QCDR |r|) . #1#) (QREFELT $ 13)
                     (QREFELT $ 142))
           (|SPADfirst| (SPADCALL |k| (QREFELT $ 73))))
          ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 142))
           (SPADCALL
            (SPADCALL (QREFELT $ 116)
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 73)) (QREFELT $ 21))
                       (QREFELT $ 117))
                      (QREFELT $ 128))
            (|SPADfirst| (SPADCALL |k| (QREFELT $ 73))) (QREFELT $ 153)))
          (#2='T (SPADCALL (QREFELT $ 116) |x| (QREFELT $ 153)))))
        (#2# (SPADCALL (QREFELT $ 116) |x| (QREFELT $ 153))))))))) 

(DEFUN |AF;minPoly;KSup;29| (|k| $)
  (PROG (#1=#:G427)
    (RETURN
     (COND
      ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 142))
       (SPADCALL
        (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 73)))
                  (SPADCALL
                   (SPADCALL (SPADCALL |k| (QREFELT $ 73)) (QREFELT $ 21))
                   (QREFELT $ 42))
                  (QREFELT $ 33))
        (QREFELT $ 35)))
      ((SPADCALL |k| (QREFELT $ 14) (QREFELT $ 142))
       (SPADCALL
        (SPADCALL (|spadConstant| $ 57)
                  (PROG1
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (SPADCALL |k| (QREFELT $ 73))
                                       (QREFELT $ 21))
                             (QREFELT $ 117))
                            |AF;minPoly;KSup;29|)
                    (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                  (QREFELT $ 102))
        (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 73))) (QREFELT $ 155))
        (QREFELT $ 156)))
      ('T
       (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 102))
                 (SPADCALL (SPADCALL |k| (QREFELT $ 30)) (QREFELT $ 155))
                 (QREFELT $ 156))))))) 

(DEFUN |AF;droot;LOf;30| (|l| $)
  (PROG (|n| |x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 23))
            . #1=(|AF;droot;LOf;30|))
      (LETT |n| (SPADCALL |l| (QREFELT $ 21)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |n| (SPADCALL 2 (QREFELT $ 125)) (QREFELT $ 77))
         (SPADCALL |x| (QREFELT $ 118)))
        ('T (SPADCALL |x| (SPADCALL |n| (QREFELT $ 23)) (QREFELT $ 119))))))))) 

(DEFUN |AF;minPoly;KSup;31| (|k| $)
  (COND
   ((SPADCALL |k| (QREFELT $ 13) (QREFELT $ 142))
    (SPADCALL
     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 73)))
               (SPADCALL
                (SPADCALL (SPADCALL |k| (QREFELT $ 73)) (QREFELT $ 21))
                (QREFELT $ 42))
               (QREFELT $ 33))
     (QREFELT $ 35)))
   ('T
    (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 102))
              (SPADCALL (SPADCALL |k| (QREFELT $ 30)) (QREFELT $ 155))
              (QREFELT $ 156))))) 

(DECLAIM (NOTINLINE |AlgebraicFunction;|)) 

(DEFUN |AlgebraicFunction| (&REST #1=#:G440)
  (PROG ()
    (RETURN
     (PROG (#2=#:G441)
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
      (LETT $ (GETREFV 160) . #1#)
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
      (QSETREFV $ 15 (SPADCALL '|%root_sum| (QREFELT $ 12)))
      (COND
       ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
        (PROGN
         (QSETREFV $ 31 (CONS (|dispatchFunction| |AF;inrootof;Sup2F;7|) $))))
       ('T
        (QSETREFV $ 31 (CONS (|dispatchFunction| |AF;inrootof;Sup2F;9|) $))))
      (SPADCALL (QREFELT $ 13) (CONS (|function| |AF;ialg|) $) (QREFELT $ 89))
      (SPADCALL (QREFELT $ 13) '|%specialDiff| (CONS (|function| |AF;dvalg|) $)
                (QREFELT $ 91))
      (SPADCALL (QREFELT $ 13) '|%specialDisp| (CONS (|function| |AF;dalg|) $)
                (QREFELT $ 91))
      (SPADCALL (QREFELT $ 13) '|%specialEqual|
                (CONS (|function| |AF;eqopalg|) $) (QREFELT $ 91))
      (SPADCALL (QREFELT $ 15) (CONS (|function| |AF;irootsum|) $)
                (QREFELT $ 89))
      (SPADCALL (QREFELT $ 15) '|%specialDiff|
                (CONS (|function| |AF;dvrootsum|) $) (QREFELT $ 91))
      (SPADCALL (QREFELT $ 15) '|%specialDisp|
                (CONS (|function| |AF;drootsum|) $) (QREFELT $ 91))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 116 (SPADCALL '|%%var| (QREFELT $ 115)))
         NIL
         NIL
         NIL
         NIL
         NIL
         (QSETREFV $ 120 (CONS (|dispatchFunction| |AF;droot;LOf;17|) $))
         (QSETREFV $ 124 (CONS (|dispatchFunction| |AF;^;FFF;19|) $))
         (COND
          ((|HasCategory| |#1| '(|AlgebraicallyClosedField|))
           (QSETREFV $ 138 (CONS (|dispatchFunction| |AF;iroot;RIF;23|) $)))
          ('T
           (PROGN
            (COND
             ((|HasCategory| |#1| '(|RadicalCategory|))
              (COND
               ((|HasSignature| |#1|
                                (LIST '|imaginary| (LIST (|devaluate| |#1|))))
                (QSETREFV $ 138
                          (CONS (|dispatchFunction| |AF;iroot;RIF;24|) $)))
               ('T
                (QSETREFV $ 138
                          (CONS (|dispatchFunction| |AF;iroot;RIF;25|) $)))))
             ('T
              (QSETREFV $ 138
                        (CONS (|dispatchFunction| |AF;iroot;RIF;26|) $)))))))
         (QSETREFV $ 154
                   (CONS (|dispatchFunction| |AF;definingPolynomial;2F;28|) $))
         (QSETREFV $ 157 (CONS (|dispatchFunction| |AF;minPoly;KSup;29|) $))
         (SPADCALL (QREFELT $ 14) (CONS (|function| |AF;inroot|) $)
                   (QREFELT $ 89))
         (SPADCALL (QREFELT $ 14)
                   (LIST (CONS (|function| |AF;dvroot|) $)
                         (CONS (|function| |AF;lzero|) $))
                   (QREFELT $ 159))))
       ('T
        (PROGN
         (QSETREFV $ 120 (CONS (|dispatchFunction| |AF;droot;LOf;30|) $))
         (QSETREFV $ 157 (CONS (|dispatchFunction| |AF;minPoly;KSup;31|) $)))))
      (SPADCALL (QREFELT $ 14) '|%specialDisp| (ELT $ 120) (QREFELT $ 91))
      $)))) 

(MAKEPROP '|AlgebraicFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opalg| '|oproot| '|oprootsum| (|Boolean|) (5 . |has?|)
              (11 . |is?|) |AF;belong?;BoB;1| (|List| 7) (17 . |second|)
              (|OutputForm|) (22 . |coerce|) (|Kernel| 7) (27 . |kernel|)
              (|Union| 7 '"failed") (|SparseUnivariatePolynomial| 7)
              (32 . |retractIfCan|) (|Kernel| $) (37 . |coerce|)
              (42 . |inrootof|) (|Fraction| 62) (48 . |univariate|)
              (|Fraction| 27) (54 . |numer|) (59 . |denom|)
              (|NonNegativeInteger|) (64 . |degree|) (69 . |Zero|) (73 . >)
              |AF;rootOf;SupSF;3| (79 . |retract|) (|List| $) (84 . |kernel|)
              (90 . |differentiate|) (|Mapping| 7 7) (96 . |map|) (102 . |elt|)
              (108 . |differentiate|) (113 . /) (119 . -) |AF;operator;2Bo;6|
              (124 . |monomial?|) (129 . |Zero|) (133 . <=) (139 . |One|)
              (143 . |One|) (147 . |reductum|) (152 . |leadingCoefficient|)
              (|Union| 10 '#1="failed") (157 . |retractIfCan|)
              (|SparseUnivariatePolynomial| $) (162 . |rootOf|)
              (168 . |coerce|) (|SparseUnivariatePolynomial| 6) (173 . |Zero|)
              (177 . |Zero|) (181 . ~=) (|Union| 6 '#1#) (187 . |retractIfCan|)
              (192 . |monomial|) (198 . +) (204 . |argument|) (|Integer|)
              (209 . |elt|) (215 . =) (221 . =)
              (|SparseMultivariatePolynomial| 6 29) (227 . |numer|)
              (|SparseMultivariatePolynomial| 6 24) (232 . |univariate|)
              (|SparseUnivariatePolynomial| 80) (238 . |leadingCoefficient|)
              (243 . =) (249 . =) (255 . *) (|Mapping| 7 20)
              (|BasicOperatorFunctions1| 7) (261 . |evaluate|) (|None|)
              (267 . |setProperty|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 24) 24
                                                     6 80 7)
              (274 . |univariate|) (281 . |retract|) (286 . D)
              (292 . |coefficients|) (|Mapping| 16 7) (297 . |every?|)
              (303 . |rem|) (309 . |coefficient|) (315 . +) (321 . |monomial|)
              (327 . *) |AF;rootSum;FSupSF;12| (333 . |coerce|)
              (338 . |outputForm|) (344 . |coerce|) (349 . =) (355 . |sum|)
              (|Void|) (361 . |print|) (366 . |coerce|) (371 . |coerce|)
              (376 . *) (382 . |coerce|) '|dumvar| (387 . |retract|)
              (392 . |root|) (397 . |root|) (403 . |droot|) (408 . |One|)
              (|Fraction| 74) (412 . /) (418 . ^) (424 . |coerce|)
              (429 . |numer|) (434 . |denom|) (439 . ^) (445 . |denom|)
              (450 . ~=) (|Union| 74 '"failed") (456 . |retractIfCan|)
              (461 . |positive?|) (466 . |coerce|) (471 . |One|)
              (475 . |coerce|) (480 . /) (486 . |iroot|)
              (|Record| (|:| |var| 29) (|:| |exponent| 74))
              (|Union| 139 '"failed") (492 . |isExpt|) (497 . |is?|)
              (|Record| (|:| |exponent| 37) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 24) 24 6 80 7)
              (503 . |qroot|) (|Union| $ '"failed") (509 . |exquo|)
              (515 . |nthRoot|) (521 . |smaller?|) (527 . |rroot|)
              (|Union| 29 '#1#) (533 . |retractIfCan|) (538 . -)
              (544 . |definingPolynomial|) (549 . |coerce|) (554 . -)
              (560 . |minPoly|) (|List| 87) (565 . |derivative|))
           '#(|rootSum| 571 |rootOf| 578 |operator| 584 |minPoly| 589 |iroot|
              594 |inrootof| 600 |droot| 606 |definingPolynomial| 611 |belong?|
              616 ^ 621)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 159
                                                 '(1 11 9 10 12 2 9 16 0 10 17
                                                   2 9 16 0 10 18 1 20 7 0 21 1
                                                   7 22 0 23 1 24 0 10 25 1 27
                                                   26 0 28 1 7 0 29 30 2 0 7 27
                                                   7 31 2 7 32 0 29 33 1 34 27
                                                   0 35 1 34 27 0 36 1 27 37 0
                                                   38 0 6 0 39 2 37 16 0 0 40 1
                                                   7 29 0 42 2 7 0 9 43 44 2 7
                                                   0 0 10 45 2 27 0 46 0 47 2
                                                   27 7 0 7 48 1 27 0 0 49 2 7
                                                   0 0 0 50 1 7 0 0 51 1 27 16
                                                   0 53 0 7 0 54 2 37 16 0 0 55
                                                   0 6 0 56 0 7 0 57 1 27 0 0
                                                   58 1 27 7 0 59 1 7 60 0 61 2
                                                   6 0 62 10 63 1 7 0 6 64 0 65
                                                   0 66 0 27 0 67 2 27 16 0 0
                                                   68 1 7 69 0 70 2 65 0 6 37
                                                   71 2 65 0 0 0 72 1 24 20 0
                                                   73 2 20 7 0 74 75 2 24 16 0
                                                   0 76 2 7 16 0 0 77 1 7 78 0
                                                   79 2 80 62 0 24 81 1 82 80 0
                                                   83 2 80 16 0 0 84 2 82 16 0
                                                   0 85 2 82 0 80 0 86 2 88 9 9
                                                   87 89 3 9 0 0 10 90 91 3 92
                                                   27 7 24 27 93 1 7 10 0 94 2
                                                   7 0 0 10 95 1 27 20 0 96 2
                                                   20 16 97 0 98 2 27 0 0 0 99
                                                   2 27 7 0 37 100 2 7 0 0 0
                                                   101 2 27 0 7 37 102 2 27 0 0
                                                   0 103 1 24 22 0 105 2 82 22
                                                   0 22 106 1 74 22 0 107 2 22
                                                   0 0 0 108 2 22 0 0 0 109 1
                                                   22 110 0 111 1 20 22 0 112 1
                                                   27 22 0 113 2 7 0 0 0 114 1
                                                   7 0 10 115 1 7 74 0 117 1 22
                                                   0 0 118 2 22 0 0 0 119 1 0
                                                   22 20 120 0 80 0 121 2 122 0
                                                   74 74 123 2 0 7 7 122 124 1
                                                   7 0 74 125 1 122 74 0 126 1
                                                   122 74 0 127 2 7 0 0 74 128
                                                   1 7 78 0 129 2 80 16 0 0 130
                                                   1 80 131 0 132 1 74 16 0 133
                                                   1 7 0 78 134 0 122 0 135 1
                                                   122 0 74 136 2 122 0 0 0 137
                                                   2 0 7 6 74 138 1 7 140 0 141
                                                   2 24 16 0 9 142 2 144 143
                                                   122 37 145 2 74 146 0 0 147
                                                   2 6 0 0 74 148 2 6 16 0 0
                                                   149 2 144 143 6 37 150 1 7
                                                   151 0 152 2 7 0 0 0 153 1 0
                                                   7 7 154 1 27 0 7 155 2 27 0
                                                   0 0 156 1 0 27 24 157 2 88 9
                                                   9 158 159 3 0 7 7 27 10 104
                                                   2 0 7 27 10 41 1 0 9 9 52 1
                                                   1 27 24 157 2 1 7 6 74 138 2
                                                   0 7 27 7 31 1 0 22 20 120 1
                                                   1 7 7 154 1 0 16 9 19 2 1 7
                                                   7 122 124)))))
           '|lookupComplete|)) 
