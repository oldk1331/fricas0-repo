
(/VERSIONCHECK 2) 

(DEFUN |PRS;*;R2V;1| (|r| |v| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 13)) |v| (QREFELT $ 15))) 

(DEFUN |PRS;exquo;VRV;2| (|v| |r| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|PRS;exquo;VRV;2!0| (VECTOR (QREFELT $ 7) $ |r|)) |v|
               (QREFELT $ 20))))) 

(DEFUN |PRS;exquo;VRV;2!0| (|p1| $$)
  (PROG (|r| $ |polR|)
    (LETT |r| (QREFELT $$ 2) . #1=(|PRS;exquo;VRV;2|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |polR| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (#2=#:G302)
        (RETURN
         (PROG2 (LETT #2# (SPADCALL |p1| |r| (QREFELT $ 18)) NIL)
             (QCDR #2#)
           (|check_union| (QEQCAR #2# 0) |polR| #2#)))))))) 

(DEFUN |PRS;pseudoDivide;2polRR;3| (P Q $)
  (PROG (#1=#:G317 |quot| |mon| #2=#:G309 |i| #3=#:G308 |delta| |co| #4=#:G307
         |degQ| |degP| |#G11| |#G10| |lcQ|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL Q (QREFELT $ 23))
         (|error| "PseudoDivide$PRS : division by 0"))
        ((SPADCALL P (QREFELT $ 23))
         (VECTOR (|spadConstant| $ 8) (|spadConstant| $ 24) P))
        (#5='T
         (SEQ
          (LETT |lcQ| (SPADCALL Q (QREFELT $ 25))
                . #6=(|PRS;pseudoDivide;2polRR;3|))
          (PROGN
           (LETT |#G10| (SPADCALL P (QREFELT $ 26)) . #6#)
           (LETT |#G11| (SPADCALL Q (QREFELT $ 26)) . #6#)
           (LETT |degP| |#G10| . #6#)
           (LETT |degQ| |#G11| . #6#))
          (EXIT
           (COND
            ((< |degP| |degQ|)
             (VECTOR (|spadConstant| $ 8) (|spadConstant| $ 24) P))
            (#5#
             (SEQ (LETT Q (SPADCALL Q (QREFELT $ 27)) . #6#)
                  (LETT |i|
                        (PROG1 (LETT #4# (+ (- |degP| |degQ|) 1) . #6#)
                          (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                           #4#))
                        . #6#)
                  (LETT |co| (SPADCALL |lcQ| |i| (QREFELT $ 28)) . #6#)
                  (LETT |quot| (|spadConstant| $ 24) . #6#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (>=
                           (LETT |delta| (- (SPADCALL P (QREFELT $ 26)) |degQ|)
                                 . #6#)
                           0))
                         (GO G191)))
                       (SEQ
                        (LETT |i|
                              (PROG1 (LETT #3# (- |i| 1) . #6#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              . #6#)
                        (LETT |mon|
                              (SPADCALL (SPADCALL P (QREFELT $ 25))
                                        (PROG1 (LETT #2# |delta| . #6#)
                                          (|check_subtype| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           #2#))
                                        (QREFELT $ 11))
                              . #6#)
                        (LETT |quot|
                              (SPADCALL |quot|
                                        (SPADCALL
                                         (SPADCALL |lcQ| |i| (QREFELT $ 28))
                                         |mon| (QREFELT $ 29))
                                        (QREFELT $ 30))
                              . #6#)
                        (EXIT
                         (LETT P
                               (SPADCALL
                                (SPADCALL |lcQ| (SPADCALL P (QREFELT $ 27))
                                          (QREFELT $ 29))
                                (SPADCALL |mon| Q (QREFELT $ 31))
                                (QREFELT $ 32))
                               . #6#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT P
                        (SPADCALL (SPADCALL |lcQ| |i| (QREFELT $ 28)) P
                                  (QREFELT $ 29))
                        . #6#)
                  (EXIT
                   (PROGN
                    (LETT #1# (VECTOR |co| |quot| P) . #6#)
                    (GO #1#)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;divide;2polRR;4| (F G $)
  (PROG (#1=#:G332 |quot| |mon| #2=#:G326 #3=#:G324 |delta| #4=#:G320 |degG|
         |lcG|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lcG| (SPADCALL G (QREFELT $ 25)) . #5=(|PRS;divide;2polRR;4|))
        (LETT |degG| (SPADCALL G (QREFELT $ 26)) . #5#)
        (EXIT
         (COND
          ((ZEROP |degG|)
           (SEQ
            (LETT F
                  (PROG2 (LETT #4# (SPADCALL F |lcG| (QREFELT $ 18)) . #5#)
                      (QCDR #4#)
                    (|check_union| (QEQCAR #4# 0) (QREFELT $ 7) #4#))
                  . #5#)
            (EXIT
             (PROGN
              (LETT #1# (CONS F (|spadConstant| $ 24)) . #5#)
              (GO #1#)))))
          ('T
           (SEQ (LETT G (SPADCALL G (QREFELT $ 27)) . #5#)
                (LETT |quot| (|spadConstant| $ 24) . #5#)
                (SEQ G190
                     (COND
                      ((NULL
                        (>=
                         (LETT |delta| (- (SPADCALL F (QREFELT $ 26)) |degG|)
                               . #5#)
                         0))
                       (GO G191)))
                     (SEQ
                      (LETT |mon|
                            (SPADCALL
                             (PROG2
                                 (LETT #3#
                                       (SPADCALL (SPADCALL F (QREFELT $ 25))
                                                 |lcG| (QREFELT $ 36))
                                       . #5#)
                                 (QCDR #3#)
                               (|check_union| (QEQCAR #3# 0) (QREFELT $ 6)
                                              #3#))
                             (PROG1 (LETT #2# |delta| . #5#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             (QREFELT $ 11))
                            . #5#)
                      (LETT |quot| (SPADCALL |quot| |mon| (QREFELT $ 30))
                            . #5#)
                      (EXIT
                       (LETT F
                             (SPADCALL (SPADCALL F (QREFELT $ 27))
                                       (SPADCALL |mon| G (QREFELT $ 31))
                                       (QREFELT $ 32))
                             . #5#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (PROGN (LETT #1# (CONS |quot| F) . #5#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;resultant_naif;2polRR;5| (P Q $)
  (PROG (|#G23| |#G22| |a| #1=#:G337 U #2=#:G343 |degQ| |degP| |#G21| |#G20|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a| (|spadConstant| $ 8) . #3=(|PRS;resultant_naif;2polRR;5|))
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN (LETT #2# (|spadConstant| $ 35) . #3#) (GO #2#)))
                 ('T
                  (SEQ
                   (PROGN
                    (LETT |#G20| (SPADCALL P (QREFELT $ 26)) . #3#)
                    (LETT |#G21| (SPADCALL Q (QREFELT $ 26)) . #3#)
                    (LETT |degP| |#G20| . #3#)
                    (LETT |degQ| |#G21| . #3#))
                   (COND
                    ((ODDP |degP|)
                     (COND
                      ((ODDP |degQ|)
                       (LETT |a| (SPADCALL |a| (QREFELT $ 39)) . #3#)))))
                   (EXIT
                    (COND
                     ((ZEROP |degQ|)
                      (PROGN
                       (LETT #2#
                             (SPADCALL |a|
                                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                 |degP| (QREFELT $ 28))
                                       (QREFELT $ 40))
                             . #3#)
                       (GO #2#)))
                     ('T
                      (SEQ (LETT U (QCDR (SPADCALL P Q (QREFELT $ 38))) . #3#)
                           (LETT |a|
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL Q (QREFELT $ 25))
                                            (PROG1
                                                (LETT #1#
                                                      (- |degP|
                                                         (SPADCALL U
                                                                   (QREFELT $
                                                                            26)))
                                                      . #3#)
                                              (|check_subtype| (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               #1#))
                                            (QREFELT $ 28))
                                           (QREFELT $ 40))
                                 . #3#)
                           (EXIT
                            (PROGN
                             (LETT |#G22| Q . #3#)
                             (LETT |#G23| U . #3#)
                             (LETT P |#G22| . #3#)
                             (LETT Q |#G23| . #3#))))))))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;resultantEuclidean_naif;2polRR;6| (P Q $)
  (PROG (|cf2| |cf1| |old_cf2| |old_cf1| |#G33| |#G32| |#G31| |#G30| |#G29|
         |#G28| |a| #1=#:G353 |divid| #2=#:G359 #3=#:G348 |degQ| |degP| |#G27|
         |#G26|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a| (|spadConstant| $ 8)
              . #4=(|PRS;resultantEuclidean_naif;2polRR;6|))
        (LETT |old_cf1| (|spadConstant| $ 9) . #4#)
        (LETT |cf1| (|spadConstant| $ 24) . #4#)
        (LETT |old_cf2| (|spadConstant| $ 24) . #4#)
        (LETT |cf2| (|spadConstant| $ 9) . #4#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN
                   (LETT #2#
                         (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                                 (|spadConstant| $ 35))
                         . #4#)
                   (GO #2#)))
                 ('T
                  (SEQ
                   (PROGN
                    (LETT |#G26| (SPADCALL P (QREFELT $ 26)) . #4#)
                    (LETT |#G27| (SPADCALL Q (QREFELT $ 26)) . #4#)
                    (LETT |degP| |#G26| . #4#)
                    (LETT |degQ| |#G27| . #4#))
                   (COND
                    ((ODDP |degP|)
                     (COND
                      ((ODDP |degQ|)
                       (LETT |a| (SPADCALL |a| (QREFELT $ 39)) . #4#)))))
                   (COND
                    ((ZEROP |degQ|)
                     (SEQ
                      (LETT |a|
                            (SPADCALL |a|
                                      (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                (PROG1
                                                    (LETT #3# (- |degP| 1)
                                                          . #4#)
                                                  (|check_subtype| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #3#))
                                                (QREFELT $ 28))
                                      (QREFELT $ 40))
                            . #4#)
                      (EXIT
                       (PROGN
                        (LETT #2#
                              (VECTOR (SPADCALL |a| |cf1| (QREFELT $ 29))
                                      (SPADCALL |a| |cf2| (QREFELT $ 29))
                                      (SPADCALL |a| (SPADCALL Q (QREFELT $ 25))
                                                (QREFELT $ 40)))
                              . #4#)
                        (GO #2#))))))
                   (LETT |divid| (SPADCALL P Q (QREFELT $ 38)) . #4#)
                   (LETT |a|
                         (SPADCALL |a|
                                   (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                             (PROG1
                                                 (LETT #1#
                                                       (- |degP|
                                                          (SPADCALL
                                                           (QCDR |divid|)
                                                           (QREFELT $ 26)))
                                                       . #4#)
                                               (|check_subtype| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                #1#))
                                             (QREFELT $ 28))
                                   (QREFELT $ 40))
                         . #4#)
                   (PROGN
                    (LETT |#G28| Q . #4#)
                    (LETT |#G29| (QCDR |divid|) . #4#)
                    (LETT P |#G28| . #4#)
                    (LETT Q |#G29| . #4#))
                   (EXIT
                    (PROGN
                     (LETT |#G30| |cf1| . #4#)
                     (LETT |#G31| |cf2| . #4#)
                     (LETT |#G32|
                           (SPADCALL |old_cf1|
                                     (SPADCALL (QCAR |divid|) |cf1|
                                               (QREFELT $ 31))
                                     (QREFELT $ 32))
                           . #4#)
                     (LETT |#G33|
                           (SPADCALL |old_cf2|
                                     (SPADCALL (QCAR |divid|) |cf2|
                                               (QREFELT $ 31))
                                     (QREFELT $ 32))
                           . #4#)
                     (LETT |old_cf1| |#G30| . #4#)
                     (LETT |old_cf2| |#G31| . #4#)
                     (LETT |cf1| |#G32| . #4#)
                     (LETT |cf2| |#G33| . #4#))))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;semiResultantEuclidean_naif;2polRR;7| (P Q $)
  (PROG (|cf2| |old_cf2| |#G41| |#G40| |#G39| |#G38| |a| #1=#:G369 |divid|
         #2=#:G375 #3=#:G364 |degQ| |degP| |#G37| |#G36|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |a| (|spadConstant| $ 8)
              . #4=(|PRS;semiResultantEuclidean_naif;2polRR;7|))
        (LETT |old_cf2| (|spadConstant| $ 24) . #4#)
        (LETT |cf2| (|spadConstant| $ 9) . #4#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN
                   (LETT #2# (CONS (|spadConstant| $ 24) (|spadConstant| $ 35))
                         . #4#)
                   (GO #2#)))
                 ('T
                  (SEQ
                   (PROGN
                    (LETT |#G36| (SPADCALL P (QREFELT $ 26)) . #4#)
                    (LETT |#G37| (SPADCALL Q (QREFELT $ 26)) . #4#)
                    (LETT |degP| |#G36| . #4#)
                    (LETT |degQ| |#G37| . #4#))
                   (COND
                    ((ODDP |degP|)
                     (COND
                      ((ODDP |degQ|)
                       (LETT |a| (SPADCALL |a| (QREFELT $ 39)) . #4#)))))
                   (COND
                    ((ZEROP |degQ|)
                     (SEQ
                      (LETT |a|
                            (SPADCALL |a|
                                      (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                (PROG1
                                                    (LETT #3# (- |degP| 1)
                                                          . #4#)
                                                  (|check_subtype| (>= #3# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #3#))
                                                (QREFELT $ 28))
                                      (QREFELT $ 40))
                            . #4#)
                      (EXIT
                       (PROGN
                        (LETT #2#
                              (CONS (SPADCALL |a| |cf2| (QREFELT $ 29))
                                    (SPADCALL |a| (SPADCALL Q (QREFELT $ 25))
                                              (QREFELT $ 40)))
                              . #4#)
                        (GO #2#))))))
                   (LETT |divid| (SPADCALL P Q (QREFELT $ 38)) . #4#)
                   (LETT |a|
                         (SPADCALL |a|
                                   (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                             (PROG1
                                                 (LETT #1#
                                                       (- |degP|
                                                          (SPADCALL
                                                           (QCDR |divid|)
                                                           (QREFELT $ 26)))
                                                       . #4#)
                                               (|check_subtype| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                #1#))
                                             (QREFELT $ 28))
                                   (QREFELT $ 40))
                         . #4#)
                   (PROGN
                    (LETT |#G38| Q . #4#)
                    (LETT |#G39| (QCDR |divid|) . #4#)
                    (LETT P |#G38| . #4#)
                    (LETT Q |#G39| . #4#))
                   (EXIT
                    (PROGN
                     (LETT |#G40| |cf2| . #4#)
                     (LETT |#G41|
                           (SPADCALL |old_cf2|
                                     (SPADCALL (QCAR |divid|) |cf2|
                                               (QREFELT $ 31))
                                     (QREFELT $ 32))
                           . #4#)
                     (LETT |old_cf2| |#G40| . #4#)
                     (LETT |cf2| |#G41| . #4#))))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;Lazard;2RNniR;8| (|x| |y| |n| $)
  (PROG (#1=#:G381 |c| #2=#:G379 |a| #3=#:G387 #4=#:G377 |b|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((ZEROP |n|) (|error| "Lazard$PRS : n = 0")) ((EQL |n| 1) |x|)
             ('T
              (SEQ (LETT |a| 1 . #5=(|PRS;Lazard;2RNniR;8|))
                   (SEQ G190
                        (COND
                         ((NULL
                           (>= |n|
                               (LETT |b| (SPADCALL 2 |a| (QREFELT $ 47))
                                     . #5#)))
                          (GO G191)))
                        (SEQ (EXIT (LETT |a| |b| . #5#))) NIL (GO G190) G191
                        (EXIT NIL))
                   (LETT |c| |x| . #5#)
                   (LETT |n|
                         (PROG1 (LETT #4# (- |n| |a|) . #5#)
                           (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                            #4#))
                         . #5#)
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (EXIT
                           (COND
                            ((EQL |a| 1) (PROGN (LETT #3# |c| . #5#) (GO #3#)))
                            ('T
                             (SEQ (LETT |a| (QUOTIENT2 |a| 2) . #5#)
                                  (LETT |c|
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL
                                                   (SPADCALL |c| |c|
                                                             (QREFELT $ 40))
                                                   |y| (QREFELT $ 36))
                                                  . #5#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 0)
                                                         (QREFELT $ 6) #2#))
                                        . #5#)
                                  (EXIT
                                   (COND
                                    ((>= |n| |a|)
                                     (SEQ
                                      (LETT |c|
                                            (PROG2
                                                (LETT #2#
                                                      (SPADCALL
                                                       (SPADCALL |c| |x|
                                                                 (QREFELT $
                                                                          40))
                                                       |y| (QREFELT $ 36))
                                                      . #5#)
                                                (QCDR #2#)
                                              (|check_union| (QEQCAR #2# 0)
                                                             (QREFELT $ 6)
                                                             #2#))
                                            . #5#)
                                      (EXIT
                                       (LETT |n|
                                             (PROG1
                                                 (LETT #1# (- |n| |a|) . #5#)
                                               (|check_subtype| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                #1#))
                                             . #5#)))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))))))
      #3# (EXIT #3#))))) 

(DEFUN |PRS;Lazard2;polR2RNnipolR;9| (F |x| |y| |n| $)
  (PROG (#1=#:G394 #2=#:G390 #3=#:G388)
    (RETURN
     (SEQ
      (EXIT
       (COND ((ZEROP |n|) (|error| "Lazard2$PRS : n = 0")) ((EQL |n| 1) F)
             ('T
              (SEQ
               (LETT |x|
                     (SPADCALL |x| |y|
                               (PROG1
                                   (LETT #3# (- |n| 1)
                                         . #4=(|PRS;Lazard2;polR2RNnipolR;9|))
                                 (|check_subtype| (>= #3# 0)
                                                  '(|NonNegativeInteger|) #3#))
                               (QREFELT $ 48))
                     . #4#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (PROG2
                           (LETT #2#
                                 (SPADCALL (SPADCALL |x| F (QREFELT $ 29)) |y|
                                           (QREFELT $ 18))
                                 . #4#)
                           (QCDR #2#)
                         (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                       . #4#)
                 (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;Lazard3| (V |x| |y| |n| $)
  (PROG (#1=#:G398 #2=#:G395)
    (RETURN
     (SEQ
      (EXIT
       (COND ((ZEROP |n|) (|error| "Lazard3$prs : n = 0")) ((EQL |n| 1) V)
             ('T
              (SEQ
               (LETT |x|
                     (SPADCALL |x| |y|
                               (PROG1 (LETT #2# (- |n| 1) . #3=(|PRS;Lazard3|))
                                 (|check_subtype| (>= #2# 0)
                                                  '(|NonNegativeInteger|) #2#))
                               (QREFELT $ 48))
                     . #3#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL |x| V (QREFELT $ 16)) |y|
                                 (QREFELT $ 21))
                       . #3#)
                 (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;next_sousResultant2;3polRRpolR;11| (P Q Z |s| $)
  (PROG (#1=#:G409 A #2=#:G400 H #3=#:G410 |i| |#G66| |#G65| |#G64| |e| |d|
         |#G63| |#G62| |se| |c| |lcP| |#G61| |#G60| |#G59|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (PROGN
         (LETT |#G59| (SPADCALL P (QREFELT $ 25))
               . #4=(|PRS;next_sousResultant2;3polRRpolR;11|))
         (LETT |#G60| (SPADCALL Q (QREFELT $ 25)) . #4#)
         (LETT |#G61| (SPADCALL Z (QREFELT $ 25)) . #4#)
         (LETT |lcP| |#G59| . #4#)
         (LETT |c| |#G60| . #4#)
         (LETT |se| |#G61| . #4#))
        (PROGN
         (LETT |#G62| (SPADCALL P (QREFELT $ 26)) . #4#)
         (LETT |#G63| (SPADCALL Q (QREFELT $ 26)) . #4#)
         (LETT |d| |#G62| . #4#)
         (LETT |e| |#G63| . #4#))
        (PROGN
         (LETT |#G64| (SPADCALL P (QREFELT $ 27)) . #4#)
         (LETT |#G65| (SPADCALL Q (QREFELT $ 27)) . #4#)
         (LETT |#G66| (SPADCALL (SPADCALL Z (QREFELT $ 27)) (QREFELT $ 50))
               . #4#)
         (LETT P |#G64| . #4#)
         (LETT Q |#G65| . #4#)
         (LETT H |#G66| . #4#))
        (LETT A (SPADCALL (SPADCALL P |e| (QREFELT $ 51)) H (QREFELT $ 29))
              . #4#)
        (SEQ (LETT |i| (+ |e| 1) . #4#) (LETT #3# (- |d| 1) . #4#) G190
             (COND ((> |i| #3#) (GO G191)))
             (SEQ
              (LETT H
                    (COND
                     ((EQL (SPADCALL H (QREFELT $ 26)) (- |e| 1))
                      (SPADCALL
                       (SPADCALL (QREFELT $ 12) (SPADCALL H (QREFELT $ 27))
                                 (QREFELT $ 31))
                       (PROG2
                           (LETT #2#
                                 (SPADCALL
                                  (SPADCALL (SPADCALL H (QREFELT $ 25)) Q
                                            (QREFELT $ 29))
                                  |c| (QREFELT $ 18))
                                 . #4#)
                           (QCDR #2#)
                         (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                       (QREFELT $ 32)))
                     ('T (SPADCALL (QREFELT $ 12) H (QREFELT $ 31))))
                    . #4#)
              (EXIT
               (LETT A
                     (SPADCALL
                      (SPADCALL (SPADCALL P |i| (QREFELT $ 51)) H
                                (QREFELT $ 29))
                      A (QREFELT $ 30))
                     . #4#)))
             (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL))
        (SEQ G190
             (COND ((NULL (>= (SPADCALL P (QREFELT $ 26)) |e|)) (GO G191)))
             (SEQ (EXIT (LETT P (SPADCALL P (QREFELT $ 27)) . #4#))) NIL
             (GO G190) G191 (EXIT NIL))
        (LETT A (SPADCALL A (SPADCALL |se| P (QREFELT $ 29)) (QREFELT $ 30))
              . #4#)
        (LETT A
              (PROG2 (LETT #2# (SPADCALL A |lcP| (QREFELT $ 18)) . #4#)
                  (QCDR #2#)
                (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
              . #4#)
        (LETT A
              (COND
               ((EQL (SPADCALL H (QREFELT $ 26)) (- |e| 1))
                (SPADCALL
                 (SPADCALL |c|
                           (SPADCALL
                            (SPADCALL (QREFELT $ 12)
                                      (SPADCALL H (QREFELT $ 27))
                                      (QREFELT $ 31))
                            A (QREFELT $ 30))
                           (QREFELT $ 29))
                 (SPADCALL (SPADCALL H (QREFELT $ 25)) Q (QREFELT $ 29))
                 (QREFELT $ 32)))
               (#5='T
                (SPADCALL |c|
                          (SPADCALL (SPADCALL (QREFELT $ 12) H (QREFELT $ 31))
                                    A (QREFELT $ 30))
                          (QREFELT $ 29))))
              . #4#)
        (LETT A
              (PROG2 (LETT #2# (SPADCALL A |s| (QREFELT $ 18)) . #4#)
                  (QCDR #2#)
                (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
              . #4#)
        (EXIT
         (PROGN
          (LETT #1#
                (COND ((ODDP (- |d| |e|)) A) (#5# (SPADCALL A (QREFELT $ 50))))
                . #4#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;next_sousResultant3| (VP VQ |s| |ss| $)
  (PROG (#1=#:G423 #2=#:G415 #3=#:G424 |i| |divid| |rr| |r| |#G77| |#G76|
         #4=#:G411 |delta| |e| |c| |lcP| |#G75| |#G74| Q P |#G73| |#G72|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (PROGN
         (LETT |#G72| (SPADCALL VP 1 (QREFELT $ 54))
               . #5=(|PRS;next_sousResultant3|))
         (LETT |#G73| (SPADCALL VQ 1 (QREFELT $ 54)) . #5#)
         (LETT P |#G72| . #5#)
         (LETT Q |#G73| . #5#))
        (PROGN
         (LETT |#G74| (SPADCALL P (QREFELT $ 25)) . #5#)
         (LETT |#G75| (SPADCALL Q (QREFELT $ 25)) . #5#)
         (LETT |lcP| |#G74| . #5#)
         (LETT |c| |#G75| . #5#))
        (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #5#)
        (SEQ (LETT |delta| (- (SPADCALL P (QREFELT $ 26)) |e|) . #5#)
             (EXIT
              (COND
               ((EQL |delta| 1)
                (SEQ
                 (LETT VP
                       (SPADCALL (SPADCALL |c| VP (QREFELT $ 16))
                                 (SPADCALL (SPADCALL P |e| (QREFELT $ 51)) VQ
                                           (QREFELT $ 16))
                                 (QREFELT $ 55))
                       . #5#)
                 (LETT VP (SPADCALL VP |lcP| (QREFELT $ 21)) . #5#)
                 (LETT VP
                       (SPADCALL
                        (SPADCALL |c|
                                  (SPADCALL VP
                                            (SPADCALL (QREFELT $ 12) VQ
                                                      (QREFELT $ 15))
                                            (QREFELT $ 55))
                                  (QREFELT $ 16))
                        (SPADCALL
                         (SPADCALL Q
                                   (PROG1 (LETT #4# (- |e| 1) . #5#)
                                     (|check_subtype| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      #4#))
                                   (QREFELT $ 51))
                         VQ (QREFELT $ 16))
                        (QREFELT $ 56))
                       . #5#)
                 (EXIT (LETT VP (SPADCALL VP |s| (QREFELT $ 21)) . #5#))))
               (#6='T
                (SEQ
                 (PROGN
                  (LETT |#G76| (SPADCALL |s| |lcP| (QREFELT $ 40)) . #5#)
                  (LETT |#G77| (SPADCALL |ss| |c| (QREFELT $ 40)) . #5#)
                  (LETT |r| |#G76| . #5#)
                  (LETT |rr| |#G77| . #5#))
                 (LETT |divid|
                       (SPADCALL (SPADCALL |rr| P (QREFELT $ 29)) Q
                                 (QREFELT $ 38))
                       . #5#)
                 (SPADCALL VP 1
                           (PROG2
                               (LETT #2#
                                     (SPADCALL (QCDR |divid|) |r|
                                               (QREFELT $ 18))
                                     . #5#)
                               (QCDR #2#)
                             (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                           (QREFELT $ 57))
                 (EXIT
                  (SEQ (LETT |i| 2 . #5#) (LETT #3# (QVSIZE VP) . #5#) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (SPADCALL VP |i|
                                  (SPADCALL
                                   (SPADCALL |rr|
                                             (SPADCALL VP |i| (QREFELT $ 54))
                                             (QREFELT $ 29))
                                   (SPADCALL (SPADCALL VQ |i| (QREFELT $ 54))
                                             (QCAR |divid|) (QREFELT $ 31))
                                   (QREFELT $ 32))
                                  (QREFELT $ 57))
                        (EXIT
                         (SPADCALL VP |i|
                                   (PROG2
                                       (LETT #2#
                                             (SPADCALL
                                              (SPADCALL VP |i| (QREFELT $ 54))
                                              |r| (QREFELT $ 18))
                                             . #5#)
                                       (QCDR #2#)
                                     (|check_union| (QEQCAR #2# 0)
                                                    (QREFELT $ 7) #2#))
                                   (QREFELT $ 57))))
                       (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                       (EXIT NIL))))))))
        (EXIT
         (PROGN
          (LETT #1#
                (COND ((ODDP |delta|) VP) (#6# (SPADCALL VP (QREFELT $ 58))))
                . #5#)
          (GO #1#)))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;algo_new| (P Q $)
  (PROG (|s| |#G84| |#G83| #1=#:G432 Z |delta| #2=#:G426 |#G82| |#G81|
         #3=#:G425)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |delta|
              (PROG1
                  (LETT #3#
                        (- (SPADCALL P (QREFELT $ 26))
                           (SPADCALL Q (QREFELT $ 26)))
                        . #4=(|PRS;algo_new|))
                (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
              . #4#)
        (LETT |s| (SPADCALL (SPADCALL Q (QREFELT $ 25)) |delta| (QREFELT $ 28))
              . #4#)
        (PROGN
         (LETT |#G81| Q . #4#)
         (LETT |#G82| (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 59))
               . #4#)
         (LETT P |#G81| . #4#)
         (LETT Q |#G82| . #4#))
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN (LETT #1# (|spadConstant| $ 35) . #4#) (GO #1#)))
                 ('T
                  (SEQ
                   (LETT |delta|
                         (PROG1
                             (LETT #2#
                                   (- (SPADCALL P (QREFELT $ 26))
                                      (SPADCALL Q (QREFELT $ 26)))
                                   . #4#)
                           (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                            #2#))
                         . #4#)
                   (LETT Z
                         (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s| |delta|
                                   (QREFELT $ 49))
                         . #4#)
                   (EXIT
                    (COND
                     ((ZEROP (SPADCALL Z (QREFELT $ 26)))
                      (PROGN
                       (LETT #1# (SPADCALL Z (QREFELT $ 25)) . #4#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (PROGN
                        (LETT |#G83| Q . #4#)
                        (LETT |#G84| (SPADCALL P Q Z |s| (QREFELT $ 52)) . #4#)
                        (LETT P |#G83| . #4#)
                        (LETT Q |#G84| . #4#))
                       (EXIT
                        (LETT |s| (SPADCALL Z (QREFELT $ 25)) . #4#)))))))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;resultant;2polRR;14| (P Q $)
  (PROG (#1=#:G439 |#G88| |#G87|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (|spadConstant| $ 35))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (PROGN
              (LETT |#G87| Q . #2=(|PRS;resultant;2polRR;14|))
              (LETT |#G88| P . #2#)
              (LETT P |#G87| . #2#)
              (LETT Q |#G88| . #2#))
             (EXIT
              (COND
               ((ODDP (SPADCALL P (QREFELT $ 26)))
                (COND
                 ((ODDP (SPADCALL Q (QREFELT $ 26)))
                  (LETT Q (SPADCALL Q (QREFELT $ 50)) . #2#)))))))))
          (EXIT
           (COND
            ((ZEROP (SPADCALL Q (QREFELT $ 26)))
             (SPADCALL (SPADCALL Q (QREFELT $ 25)) (SPADCALL P (QREFELT $ 26))
                       (QREFELT $ 28)))
            ((|HasCategory| (QREFELT $ 6) '(|Finite|))
             (SPADCALL P Q (QREFELT $ 41)))
            ('T (PROGN (LETT #1# (|PRS;algo_new| P Q $) . #2#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;subResultantEuclidean| (P Q $)
  (PROG (|s| VQ VP |#G94| |#G93| |ss| #1=#:G451 |l| |delta| #2=#:G444 |e|
         |#G92| |#G91| |pdiv| #3=#:G442)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |s|
              (SPADCALL (SPADCALL Q (QREFELT $ 25))
                        (PROG1
                            (LETT #3#
                                  (- (SPADCALL P (QREFELT $ 26))
                                     (SPADCALL Q (QREFELT $ 26)))
                                  . #4=(|PRS;subResultantEuclidean|))
                          (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                           #3#))
                        (QREFELT $ 28))
              . #4#)
        (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9)) . #4#)
        (LETT |pdiv| (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
              . #4#)
        (LETT VQ
              (VECTOR (QVELT |pdiv| 2)
                      (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                      (QVELT |pdiv| 1))
              . #4#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (PROGN
                (LETT |#G91| (SPADCALL VP 1 (QREFELT $ 54)) . #4#)
                (LETT |#G92| (SPADCALL VQ 1 (QREFELT $ 54)) . #4#)
                (LETT P |#G91| . #4#)
                (LETT Q |#G92| . #4#))
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN
                   (LETT #1#
                         (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                                 (|spadConstant| $ 35))
                         . #4#)
                   (GO #1#)))
                 ('T
                  (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #4#)
                       (LETT |delta|
                             (PROG1
                                 (LETT #2# (- (SPADCALL P (QREFELT $ 26)) |e|)
                                       . #4#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             . #4#)
                       (COND
                        ((ZEROP |e|)
                         (SEQ
                          (LETT |l|
                                (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 25))
                                 |s| |delta| $)
                                . #4#)
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (VECTOR (SPADCALL |l| 2 (QREFELT $ 54))
                                          (SPADCALL |l| 3 (QREFELT $ 54))
                                          (SPADCALL
                                           (SPADCALL |l| 1 (QREFELT $ 54))
                                           (QREFELT $ 25)))
                                  . #4#)
                            (GO #1#))))))
                       (LETT |ss|
                             (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s| |delta|
                                       (QREFELT $ 48))
                             . #4#)
                       (PROGN
                        (LETT |#G93| VQ . #4#)
                        (LETT |#G94|
                              (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                              . #4#)
                        (LETT VP |#G93| . #4#)
                        (LETT VQ |#G94| . #4#))
                       (EXIT (LETT |s| |ss| . #4#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;resultantEuclidean;2polRR;16| (P Q $)
  (PROG (#1=#:G464 |s| #2=#:G459 |degP| |l| |e|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL P (QREFELT $ 23)) (SPADCALL Q (QREFELT $ 23)))
         (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                 (|spadConstant| $ 35)))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |e|
                   (COND
                    ((ODDP (SPADCALL P (QREFELT $ 26)))
                     (COND ((ODDP (SPADCALL Q (QREFELT $ 26))) -1) (#3='T 1)))
                    (#3# 1))
                   . #4=(|PRS;resultantEuclidean;2polRR;16|))
             (LETT |l|
                   (SPADCALL Q (SPADCALL |e| P (QREFELT $ 61)) (QREFELT $ 62))
                   . #4#)
             (EXIT
              (PROGN
               (LETT #1#
                     (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 61))
                             (QVELT |l| 0) (QVELT |l| 2))
                     . #4#)
               (GO #1#))))))
          (COND
           ((ZEROP (SPADCALL Q (QREFELT $ 26)))
            (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 26)) . #4#)
                 (EXIT
                  (COND
                   ((ZEROP |degP|)
                    (|error| "resultantEuclidean$PRS : constant polynomials"))
                   (#3#
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1 (LETT #2# (- |degP| 1) . #4#)
                                       (|check_subtype| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        #2#))
                                     (QREFELT $ 28))
                           . #4#)
                     (EXIT
                      (PROGN
                       (LETT #1#
                             (VECTOR (|spadConstant| $ 24)
                                     (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| (SPADCALL Q (QREFELT $ 25))
                                               (QREFELT $ 40)))
                             . #4#)
                       (GO #1#))))))))))
          (EXIT
           (COND
            ((|HasCategory| (QREFELT $ 6) '(|Finite|))
             (SPADCALL P Q (QREFELT $ 43)))
            (#3#
             (PROGN
              (LETT #1# (|PRS;subResultantEuclidean| P Q $) . #4#)
              (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiSubResultantEuclidean| (P Q $)
  (PROG (|s| VQ VP |#G102| |#G101| |ss| #1=#:G476 |l| |delta| #2=#:G469 |e|
         |#G100| |#G99| |pdiv| #3=#:G467)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |s|
              (SPADCALL (SPADCALL Q (QREFELT $ 25))
                        (PROG1
                            (LETT #3#
                                  (- (SPADCALL P (QREFELT $ 26))
                                     (SPADCALL Q (QREFELT $ 26)))
                                  . #4=(|PRS;semiSubResultantEuclidean|))
                          (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                           #3#))
                        (QREFELT $ 28))
              . #4#)
        (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #4#)
        (LETT |pdiv| (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
              . #4#)
        (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #4#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (PROGN
                (LETT |#G99| (SPADCALL VP 1 (QREFELT $ 54)) . #4#)
                (LETT |#G100| (SPADCALL VQ 1 (QREFELT $ 54)) . #4#)
                (LETT P |#G99| . #4#)
                (LETT Q |#G100| . #4#))
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN
                   (LETT #1# (CONS (|spadConstant| $ 24) (|spadConstant| $ 35))
                         . #4#)
                   (GO #1#)))
                 ('T
                  (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #4#)
                       (LETT |delta|
                             (PROG1
                                 (LETT #2# (- (SPADCALL P (QREFELT $ 26)) |e|)
                                       . #4#)
                               (|check_subtype| (>= #2# 0)
                                                '(|NonNegativeInteger|) #2#))
                             . #4#)
                       (COND
                        ((ZEROP |e|)
                         (SEQ
                          (LETT |l|
                                (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 25))
                                 |s| |delta| $)
                                . #4#)
                          (EXIT
                           (PROGN
                            (LETT #1#
                                  (CONS (SPADCALL |l| 2 (QREFELT $ 54))
                                        (SPADCALL
                                         (SPADCALL |l| 1 (QREFELT $ 54))
                                         (QREFELT $ 25)))
                                  . #4#)
                            (GO #1#))))))
                       (LETT |ss|
                             (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s| |delta|
                                       (QREFELT $ 48))
                             . #4#)
                       (PROGN
                        (LETT |#G101| VQ . #4#)
                        (LETT |#G102|
                              (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                              . #4#)
                        (LETT VP |#G101| . #4#)
                        (LETT VQ |#G102| . #4#))
                       (EXIT (LETT |s| |ss| . #4#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiResultantEuclidean2;2polRR;18| (P Q $)
  (PROG (#1=#:G486 |s| #2=#:G480 |degP|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL P (QREFELT $ 23)) (SPADCALL Q (QREFELT $ 23)))
         (CONS (|spadConstant| $ 24) (|spadConstant| $ 35)))
        ('T
         (COND
          ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
           (|error| "semiResultantEuclidean2 : bad degrees"))
          (#3='T
           (SEQ
            (COND
             ((ZEROP (SPADCALL Q (QREFELT $ 26)))
              (SEQ
               (LETT |degP| (SPADCALL P (QREFELT $ 26))
                     . #4=(|PRS;semiResultantEuclidean2;2polRR;18|))
               (EXIT
                (COND
                 ((ZEROP |degP|)
                  (|error| "semiResultantEuclidean2 : constant polynomials"))
                 (#3#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                   (PROG1 (LETT #2# (- |degP| 1) . #4#)
                                     (|check_subtype| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                   (QREFELT $ 28))
                         . #4#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (CONS (SPADCALL |s| (QREFELT $ 13))
                                 (SPADCALL |s| (SPADCALL Q (QREFELT $ 25))
                                           (QREFELT $ 40)))
                           . #4#)
                     (GO #1#))))))))))
            (EXIT
             (COND
              ((|HasCategory| (QREFELT $ 6) '(|Finite|))
               (SPADCALL P Q (QREFELT $ 45)))
              (#3#
               (PROGN
                (LETT #1# (|PRS;semiSubResultantEuclidean| P Q $) . #4#)
                (GO #1#)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiResultantEuclidean1;2polRR;19| (P Q $)
  (PROG (|result|)
    (RETURN
     (SEQ
      (LETT |result| (SPADCALL P Q (QREFELT $ 62))
            |PRS;semiResultantEuclidean1;2polRR;19|)
      (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2))))))) 

(DEFUN |PRS;indiceSubResultant;2polRNnipolR;20| (P Q |i| $)
  (PROG (|s| |#G117| |#G116| #1=#:G512 Z #2=#:G505 |degQ| |degP| |#G115|
         |#G114| |#G113| |#G112| #3=#:G503 #4=#:G498 |delta| #5=#:G496 |#G111|
         |#G110|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (|spadConstant| $ 24))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (PROGN
              (LETT |#G110| Q . #6=(|PRS;indiceSubResultant;2polRNnipolR;20|))
              (LETT |#G111| P . #6#)
              (LETT P |#G110| . #6#)
              (LETT Q |#G111| . #6#))
             (EXIT
              (COND
               ((ODDP (- (SPADCALL P (QREFELT $ 26)) |i|))
                (COND
                 ((ODDP (- (SPADCALL Q (QREFELT $ 26)) |i|))
                  (LETT Q (SPADCALL Q (QREFELT $ 50)) . #6#)))))))))
          (COND
           ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |delta|
                   (PROG1
                       (LETT #5#
                             (- (SPADCALL P (QREFELT $ 26))
                                (SPADCALL Q (QREFELT $ 26)))
                             . #6#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #6#)
             (EXIT
              (COND
               ((ZEROP |delta|)
                (|error| "indiceSubResultant$PRS : bad degrees"))
               (#7='T
                (SEQ
                 (LETT |s|
                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                 (PROG1 (LETT #4# (- |delta| 1) . #6#)
                                   (|check_subtype| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    #4#))
                                 (QREFELT $ 28))
                       . #6#)
                 (EXIT
                  (PROGN
                   (LETT #1# (SPADCALL |s| Q (QREFELT $ 29)) . #6#)
                   (GO #1#))))))))))
          (EXIT
           (COND
            ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
             (|spadConstant| $ 24))
            (#7#
             (SEQ
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 25))
                              (PROG1
                                  (LETT #3#
                                        (- (SPADCALL P (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #6#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (QREFELT $ 28))
                    . #6#)
              (PROGN
               (LETT |#G112| Q . #6#)
               (LETT |#G113|
                     (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 59))
                     . #6#)
               (LETT P |#G112| . #6#)
               (LETT Q |#G113| . #6#))
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G114| (SPADCALL P (QREFELT $ 26)) . #6#)
                      (LETT |#G115| (SPADCALL Q (QREFELT $ 26)) . #6#)
                      (LETT |degP| |#G114| . #6#)
                      (LETT |degQ| |#G115| . #6#))
                     (EXIT
                      (COND
                       ((EQL |i| (- |degP| 1))
                        (PROGN (LETT #1# Q . #6#) (GO #1#)))
                       ((OR (SPADCALL Q (QREFELT $ 23))
                            (SPADCALL |i| |degQ| (QREFELT $ 66)))
                        (PROGN
                         (LETT #1# (|spadConstant| $ 24) . #6#)
                         (GO #1#)))
                       ('T
                        (SEQ
                         (LETT Z
                               (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                         (PROG1
                                             (LETT #2# (- |degP| |degQ|) . #6#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 49))
                               . #6#)
                         (EXIT
                          (COND
                           ((EQL |i| |degQ|)
                            (PROGN (LETT #1# Z . #6#) (GO #1#)))
                           ('T
                            (SEQ
                             (PROGN
                              (LETT |#G116| Q . #6#)
                              (LETT |#G117| (SPADCALL P Q Z |s| (QREFELT $ 52))
                                    . #6#)
                              (LETT P |#G116| . #6#)
                              (LETT Q |#G117| . #6#))
                             (EXIT
                              (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                    . #6#)))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;indiceSubResultantEuclidean;2polRNniR;21| (P Q |i| $)
  (PROG (|s| VQ VP |#G130| |#G129| |ss| #1=#:G537 VZ #2=#:G529 |degQ| |degP|
         |#G128| |#G127| |#G126| |#G125| |pdiv| #3=#:G527 #4=#:G522 |delta|
         #5=#:G520 |l| |e|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                 (|spadConstant| $ 24)))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |e|
                   (COND
                    ((ODDP (- (SPADCALL P (QREFELT $ 26)) |i|))
                     (COND
                      ((ODDP (- (SPADCALL Q (QREFELT $ 26)) |i|))
                       (SPADCALL (|spadConstant| $ 8) (QREFELT $ 39)))
                      (#6='T (|spadConstant| $ 8))))
                    (#6# (|spadConstant| $ 8)))
                   . #7=(|PRS;indiceSubResultantEuclidean;2polRNniR;21|))
             (LETT |l|
                   (SPADCALL Q (SPADCALL |e| P (QREFELT $ 29)) |i|
                             (QREFELT $ 69))
                   . #7#)
             (EXIT
              (PROGN
               (LETT #1#
                     (VECTOR (SPADCALL |e| (QVELT |l| 1) (QREFELT $ 29))
                             (QVELT |l| 0) (QVELT |l| 2))
                     . #7#)
               (GO #1#))))))
          (COND
           ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |delta|
                   (PROG1
                       (LETT #5#
                             (- (SPADCALL P (QREFELT $ 26))
                                (SPADCALL Q (QREFELT $ 26)))
                             . #7#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #7#)
             (EXIT
              (COND
               ((ZEROP |delta|)
                (|error| "indiceSubResultantEuclidean$PRS : bad degrees"))
               (#6#
                (SEQ
                 (LETT |s|
                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                 (PROG1 (LETT #4# (- |delta| 1) . #7#)
                                   (|check_subtype| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    #4#))
                                 (QREFELT $ 28))
                       . #7#)
                 (EXIT
                  (PROGN
                   (LETT #1#
                         (VECTOR (|spadConstant| $ 24)
                                 (SPADCALL |s| (QREFELT $ 13))
                                 (SPADCALL |s| Q (QREFELT $ 29)))
                         . #7#)
                   (GO #1#))))))))))
          (EXIT
           (COND
            ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            (#6#
             (SEQ
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 25))
                              (PROG1
                                  (LETT #3#
                                        (- (SPADCALL P (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #7#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (QREFELT $ 28))
                    . #7#)
              (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                    . #7#)
              (LETT |pdiv|
                    (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                    . #7#)
              (LETT VQ
                    (VECTOR (QVELT |pdiv| 2)
                            (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                            (QVELT |pdiv| 1))
                    . #7#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G125| (SPADCALL VP 1 (QREFELT $ 54)) . #7#)
                      (LETT |#G126| (SPADCALL VQ 1 (QREFELT $ 54)) . #7#)
                      (LETT P |#G125| . #7#)
                      (LETT Q |#G126| . #7#))
                     (EXIT
                      (COND
                       ((SPADCALL Q (QREFELT $ 23))
                        (PROGN
                         (LETT #1#
                               (VECTOR (|spadConstant| $ 24)
                                       (|spadConstant| $ 24)
                                       (|spadConstant| $ 24))
                               . #7#)
                         (GO #1#)))
                       ('T
                        (SEQ
                         (PROGN
                          (LETT |#G127| (SPADCALL P (QREFELT $ 26)) . #7#)
                          (LETT |#G128| (SPADCALL Q (QREFELT $ 26)) . #7#)
                          (LETT |degP| |#G127| . #7#)
                          (LETT |degQ| |#G128| . #7#))
                         (EXIT
                          (COND
                           ((EQL |i| (- |degP| 1))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (SPADCALL VQ 2 (QREFELT $ 54))
                                           (SPADCALL VQ 3 (QREFELT $ 54))
                                           (SPADCALL VQ 1 (QREFELT $ 54)))
                                   . #7#)
                             (GO #1#)))
                           ((SPADCALL |i| |degQ| (QREFELT $ 66))
                            (PROGN
                             (LETT #1#
                                   (VECTOR (|spadConstant| $ 24)
                                           (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                   . #7#)
                             (GO #1#)))
                           ('T
                            (SEQ
                             (LETT VZ
                                   (|PRS;Lazard3| VQ
                                    (SPADCALL Q (QREFELT $ 25)) |s|
                                    (PROG1 (LETT #2# (- |degP| |degQ|) . #7#)
                                      (|check_subtype| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                    $)
                                   . #7#)
                             (EXIT
                              (COND
                               ((EQL |i| |degQ|)
                                (PROGN
                                 (LETT #1#
                                       (VECTOR (SPADCALL VZ 2 (QREFELT $ 54))
                                               (SPADCALL VZ 3 (QREFELT $ 54))
                                               (SPADCALL VZ 1 (QREFELT $ 54)))
                                       . #7#)
                                 (GO #1#)))
                               ('T
                                (SEQ
                                 (LETT |ss|
                                       (SPADCALL (SPADCALL VZ 1 (QREFELT $ 54))
                                                 (QREFELT $ 25))
                                       . #7#)
                                 (PROGN
                                  (LETT |#G129| VQ . #7#)
                                  (LETT |#G130|
                                        (|PRS;next_sousResultant3| VP VQ |s|
                                         |ss| $)
                                        . #7#)
                                  (LETT VP |#G129| . #7#)
                                  (LETT VQ |#G130| . #7#))
                                 (EXIT (LETT |s| |ss| . #7#)))))))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiIndiceSubResultantEuclidean;2polRNniR;22| (P Q |i| $)
  (PROG (|s| VQ VP |#G139| |#G138| |ss| #1=#:G560 VZ #2=#:G550 |degQ| |degP|
         |#G137| |#G136| |#G135| |#G134| |pdiv| #3=#:G548 #4=#:G543 |delta|
         #5=#:G541)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
        ('T
         (COND
          ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
           (|error| "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
          (#6='T
           (SEQ
            (COND
             ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
              (SEQ
               (LETT |delta|
                     (PROG1
                         (LETT #5#
                               (- (SPADCALL P (QREFELT $ 26))
                                  (SPADCALL Q (QREFELT $ 26)))
                               . #7=(|PRS;semiIndiceSubResultantEuclidean;2polRNniR;22|))
                       (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|)
                                        #5#))
                     . #7#)
               (EXIT
                (COND
                 ((ZEROP |delta|)
                  (|error|
                   "semiIndiceSubResultantEuclidean$PRS : bad degrees"))
                 (#6#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                   (PROG1 (LETT #4# (- |delta| 1) . #7#)
                                     (|check_subtype| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      #4#))
                                   (QREFELT $ 28))
                         . #7#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (CONS (SPADCALL |s| (QREFELT $ 13))
                                 (SPADCALL |s| Q (QREFELT $ 29)))
                           . #7#)
                     (GO #1#))))))))))
            (EXIT
             (COND
              ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
               (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
              (#6#
               (SEQ
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL P (QREFELT $ 26))
                                             (SPADCALL Q (QREFELT $ 26)))
                                          . #7#)
                                  (|check_subtype| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   #3#))
                                (QREFELT $ 28))
                      . #7#)
                (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #7#)
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                      . #7#)
                (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #7#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G134| (SPADCALL VP 1 (QREFELT $ 54)) . #7#)
                        (LETT |#G135| (SPADCALL VQ 1 (QREFELT $ 54)) . #7#)
                        (LETT P |#G134| . #7#)
                        (LETT Q |#G135| . #7#))
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT $ 23))
                          (PROGN
                           (LETT #1#
                                 (CONS (|spadConstant| $ 24)
                                       (|spadConstant| $ 24))
                                 . #7#)
                           (GO #1#)))
                         ('T
                          (SEQ
                           (PROGN
                            (LETT |#G136| (SPADCALL P (QREFELT $ 26)) . #7#)
                            (LETT |#G137| (SPADCALL Q (QREFELT $ 26)) . #7#)
                            (LETT |degP| |#G136| . #7#)
                            (LETT |degQ| |#G137| . #7#))
                           (EXIT
                            (COND
                             ((EQL |i| (- |degP| 1))
                              (PROGN
                               (LETT #1#
                                     (CONS (SPADCALL VQ 2 (QREFELT $ 54))
                                           (SPADCALL VQ 1 (QREFELT $ 54)))
                                     . #7#)
                               (GO #1#)))
                             ((SPADCALL |i| |degQ| (QREFELT $ 66))
                              (PROGN
                               (LETT #1#
                                     (CONS (|spadConstant| $ 24)
                                           (|spadConstant| $ 24))
                                     . #7#)
                               (GO #1#)))
                             ('T
                              (SEQ
                               (LETT VZ
                                     (|PRS;Lazard3| VQ
                                      (SPADCALL Q (QREFELT $ 25)) |s|
                                      (PROG1 (LETT #2# (- |degP| |degQ|) . #7#)
                                        (|check_subtype| (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         #2#))
                                      $)
                                     . #7#)
                               (EXIT
                                (COND
                                 ((EQL |i| |degQ|)
                                  (PROGN
                                   (LETT #1#
                                         (CONS (SPADCALL VZ 2 (QREFELT $ 54))
                                               (SPADCALL VZ 1 (QREFELT $ 54)))
                                         . #7#)
                                   (GO #1#)))
                                 ('T
                                  (SEQ
                                   (LETT |ss|
                                         (SPADCALL
                                          (SPADCALL VZ 1 (QREFELT $ 54))
                                          (QREFELT $ 25))
                                         . #7#)
                                   (PROGN
                                    (LETT |#G138| VQ . #7#)
                                    (LETT |#G139|
                                          (|PRS;next_sousResultant3| VP VQ |s|
                                           |ss| $)
                                          . #7#)
                                    (LETT VP |#G138| . #7#)
                                    (LETT VQ |#G139| . #7#))
                                   (EXIT (LETT |s| |ss| . #7#)))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;degreeSubResultant;2polRNnipolR;23| (P Q |i| $)
  (PROG (|s| |#G152| |#G151| Z #1=#:G574 #2=#:G580 |#G150| |#G149| #3=#:G571
         #4=#:G566 |delta| #5=#:G564 |#G148| |#G147|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (|spadConstant| $ 24))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (PROGN
             (LETT |#G147| Q . #6=(|PRS;degreeSubResultant;2polRNnipolR;23|))
             (LETT |#G148| P . #6#)
             (LETT P |#G147| . #6#)
             (LETT Q |#G148| . #6#))))
          (COND
           ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |delta|
                   (PROG1
                       (LETT #5#
                             (- (SPADCALL P (QREFELT $ 26))
                                (SPADCALL Q (QREFELT $ 26)))
                             . #6#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #6#)
             (EXIT
              (COND
               ((ZEROP |delta|)
                (|error| "degreeSubResultant$PRS : bad degrees"))
               (#7='T
                (SEQ
                 (LETT |s|
                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                 (PROG1 (LETT #4# (- |delta| 1) . #6#)
                                   (|check_subtype| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    #4#))
                                 (QREFELT $ 28))
                       . #6#)
                 (EXIT
                  (PROGN
                   (LETT #2# (SPADCALL |s| Q (QREFELT $ 29)) . #6#)
                   (GO #2#))))))))))
          (EXIT
           (COND
            ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
             (|spadConstant| $ 24))
            (#7#
             (SEQ
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 25))
                              (PROG1
                                  (LETT #3#
                                        (- (SPADCALL P (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #6#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (QREFELT $ 28))
                    . #6#)
              (PROGN
               (LETT |#G149| Q . #6#)
               (LETT |#G150|
                     (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 59))
                     . #6#)
               (LETT P |#G149| . #6#)
               (LETT Q |#G150| . #6#))
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (EXIT
                      (COND
                       ((OR (SPADCALL Q (QREFELT $ 23))
                            (SPADCALL |i| (SPADCALL Q (QREFELT $ 26))
                                      (QREFELT $ 66)))
                        (PROGN
                         (LETT #2# (|spadConstant| $ 24) . #6#)
                         (GO #2#)))
                       ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                        (PROGN (LETT #2# Q . #6#) (GO #2#)))
                       ('T
                        (SEQ
                         (LETT Z
                               (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                         (PROG1
                                             (LETT #1#
                                                   (-
                                                    (SPADCALL P (QREFELT $ 26))
                                                    (SPADCALL Q
                                                              (QREFELT $ 26)))
                                                   . #6#)
                                           (|check_subtype| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            #1#))
                                         (QREFELT $ 49))
                               . #6#)
                         (PROGN
                          (LETT |#G151| Q . #6#)
                          (LETT |#G152| (SPADCALL P Q Z |s| (QREFELT $ 52))
                                . #6#)
                          (LETT P |#G151| . #6#)
                          (LETT Q |#G152| . #6#))
                         (EXIT
                          (LETT |s| (SPADCALL Z (QREFELT $ 25)) . #6#)))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;degreeSubResultantEuclidean;2polRNniR;24| (P Q |i| $)
  (PROG (|s| VQ VP |#G162| |#G161| |ss| #1=#:G597 #2=#:G603 |#G160| |#G159|
         |pdiv| #3=#:G593 #4=#:G588 |delta| #5=#:G586 |l|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                 (|spadConstant| $ 24)))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |l| (SPADCALL Q P |i| (QREFELT $ 73))
                   . #6=(|PRS;degreeSubResultantEuclidean;2polRNniR;24|))
             (EXIT
              (PROGN
               (LETT #2# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                     . #6#)
               (GO #2#))))))
          (COND
           ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |delta|
                   (PROG1
                       (LETT #5#
                             (- (SPADCALL P (QREFELT $ 26))
                                (SPADCALL Q (QREFELT $ 26)))
                             . #6#)
                     (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|) #5#))
                   . #6#)
             (EXIT
              (COND
               ((ZEROP |delta|)
                (|error| "degreeSubResultantEuclidean$PRS : bad degrees"))
               (#7='T
                (SEQ
                 (LETT |s|
                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                 (PROG1 (LETT #4# (- |delta| 1) . #6#)
                                   (|check_subtype| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    #4#))
                                 (QREFELT $ 28))
                       . #6#)
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (VECTOR (|spadConstant| $ 24)
                                 (SPADCALL |s| (QREFELT $ 13))
                                 (SPADCALL |s| Q (QREFELT $ 29)))
                         . #6#)
                   (GO #2#))))))))))
          (EXIT
           (COND
            ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))
            (#7#
             (SEQ
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 25))
                              (PROG1
                                  (LETT #3#
                                        (- (SPADCALL P (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #6#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (QREFELT $ 28))
                    . #6#)
              (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                    . #6#)
              (LETT |pdiv|
                    (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                    . #6#)
              (LETT VQ
                    (VECTOR (QVELT |pdiv| 2)
                            (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                            (QVELT |pdiv| 1))
                    . #6#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (PROGN
                      (LETT |#G159| (SPADCALL VP 1 (QREFELT $ 54)) . #6#)
                      (LETT |#G160| (SPADCALL VQ 1 (QREFELT $ 54)) . #6#)
                      (LETT P |#G159| . #6#)
                      (LETT Q |#G160| . #6#))
                     (COND
                      ((OR (SPADCALL Q (QREFELT $ 23))
                           (SPADCALL |i| (SPADCALL Q (QREFELT $ 26))
                                     (QREFELT $ 66)))
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (VECTOR (|spadConstant| $ 24)
                                       (|spadConstant| $ 24)
                                       (|spadConstant| $ 24))
                               . #6#)
                         (GO #2#)))))
                     (EXIT
                      (COND
                       ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                        (PROGN
                         (LETT #2#
                               (VECTOR (SPADCALL VQ 2 (QREFELT $ 54))
                                       (SPADCALL VQ 3 (QREFELT $ 54))
                                       (SPADCALL VQ 1 (QREFELT $ 54)))
                               . #6#)
                         (GO #2#)))
                       ('T
                        (SEQ
                         (LETT |ss|
                               (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s|
                                         (PROG1
                                             (LETT #1#
                                                   (-
                                                    (SPADCALL P (QREFELT $ 26))
                                                    (SPADCALL Q
                                                              (QREFELT $ 26)))
                                                   . #6#)
                                           (|check_subtype| (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            #1#))
                                         (QREFELT $ 48))
                               . #6#)
                         (PROGN
                          (LETT |#G161| VQ . #6#)
                          (LETT |#G162|
                                (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                . #6#)
                          (LETT VP |#G161| . #6#)
                          (LETT VQ |#G162| . #6#))
                         (EXIT (LETT |s| |ss| . #6#)))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;semiDegreeSubResultantEuclidean;2polRNniR;25| (P Q |i| $)
  (PROG (|s| VQ VP |#G169| |#G168| |ss| #1=#:G618 #2=#:G625 |#G167| |#G166|
         |pdiv| #3=#:G614 #4=#:G609 |delta| #5=#:G607)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
        ('T
         (COND
          ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
           (|error| "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
          (#6='T
           (SEQ
            (COND
             ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
              (SEQ
               (LETT |delta|
                     (PROG1
                         (LETT #5#
                               (- (SPADCALL P (QREFELT $ 26))
                                  (SPADCALL Q (QREFELT $ 26)))
                               . #7=(|PRS;semiDegreeSubResultantEuclidean;2polRNniR;25|))
                       (|check_subtype| (>= #5# 0) '(|NonNegativeInteger|)
                                        #5#))
                     . #7#)
               (EXIT
                (COND
                 ((ZEROP |delta|)
                  (|error|
                   "semiDegreeSubResultantEuclidean$PRS : bad degrees"))
                 (#6#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                   (PROG1 (LETT #4# (- |delta| 1) . #7#)
                                     (|check_subtype| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      #4#))
                                   (QREFELT $ 28))
                         . #7#)
                   (EXIT
                    (PROGN
                     (LETT #2#
                           (CONS (SPADCALL |s| (QREFELT $ 13))
                                 (SPADCALL |s| Q (QREFELT $ 29)))
                           . #7#)
                     (GO #2#))))))))))
            (EXIT
             (COND
              ((SPADCALL |i| (SPADCALL Q (QREFELT $ 26)) (QREFELT $ 66))
               (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
              (#6#
               (SEQ
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL P (QREFELT $ 26))
                                             (SPADCALL Q (QREFELT $ 26)))
                                          . #7#)
                                  (|check_subtype| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   #3#))
                                (QREFELT $ 28))
                      . #7#)
                (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #7#)
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                      . #7#)
                (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #7#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G166| (SPADCALL VP 1 (QREFELT $ 54)) . #7#)
                        (LETT |#G167| (SPADCALL VQ 1 (QREFELT $ 54)) . #7#)
                        (LETT P |#G166| . #7#)
                        (LETT Q |#G167| . #7#))
                       (COND
                        ((OR (SPADCALL Q (QREFELT $ 23))
                             (SPADCALL |i| (SPADCALL Q (QREFELT $ 26))
                                       (QREFELT $ 66)))
                         (EXIT
                          (PROGN
                           (LETT #2#
                                 (CONS (|spadConstant| $ 24)
                                       (|spadConstant| $ 24))
                                 . #7#)
                           (GO #2#)))))
                       (EXIT
                        (COND
                         ((EQL |i| (SPADCALL Q (QREFELT $ 26)))
                          (PROGN
                           (LETT #2#
                                 (CONS (SPADCALL VQ 2 (QREFELT $ 54))
                                       (SPADCALL VQ 1 (QREFELT $ 54)))
                                 . #7#)
                           (GO #2#)))
                         ('T
                          (SEQ
                           (LETT |ss|
                                 (SPADCALL (SPADCALL Q (QREFELT $ 25)) |s|
                                           (PROG1
                                               (LETT #1#
                                                     (-
                                                      (SPADCALL P
                                                                (QREFELT $ 26))
                                                      (SPADCALL Q
                                                                (QREFELT $
                                                                         26)))
                                                     . #7#)
                                             (|check_subtype| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              #1#))
                                           (QREFELT $ 48))
                                 . #7#)
                           (PROGN
                            (LETT |#G168| VQ . #7#)
                            (LETT |#G169|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #7#)
                            (LETT VP |#G168| . #7#)
                            (LETT VQ |#G169| . #7#))
                           (EXIT (LETT |s| |ss| . #7#)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;lastSubResultant;3polR;26| (P Q $)
  (PROG (|s| |#G180| |#G179| #1=#:G638 Z #2=#:G631 |#G178| |#G177| #3=#:G630
         |#G176| |#G175|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (|spadConstant| $ 24))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (PROGN
             (LETT |#G175| Q . #4=(|PRS;lastSubResultant;3polR;26|))
             (LETT |#G176| P . #4#)
             (LETT P |#G175| . #4#)
             (LETT Q |#G176| . #4#))))
          (EXIT
           (COND
            ((ZEROP (SPADCALL Q (QREFELT $ 26)))
             (SPADCALL
              (SPADCALL (SPADCALL Q (QREFELT $ 25)) (SPADCALL P (QREFELT $ 26))
                        (QREFELT $ 28))
              (QREFELT $ 13)))
            ('T
             (SEQ
              (LETT |s|
                    (SPADCALL (SPADCALL Q (QREFELT $ 25))
                              (PROG1
                                  (LETT #3#
                                        (- (SPADCALL P (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #4#)
                                (|check_subtype| (>= #3# 0)
                                                 '(|NonNegativeInteger|) #3#))
                              (QREFELT $ 28))
                    . #4#)
              (PROGN
               (LETT |#G177| Q . #4#)
               (LETT |#G178|
                     (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 59))
                     . #4#)
               (LETT P |#G177| . #4#)
               (LETT Q |#G178| . #4#))
              (LETT Z P . #4#)
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL Q (QREFELT $ 23))
                        (PROGN (LETT #1# Z . #4#) (GO #1#)))
                       ('T
                        (SEQ
                         (LETT Z
                               (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) |s|
                                         (PROG1
                                             (LETT #2#
                                                   (-
                                                    (SPADCALL P (QREFELT $ 26))
                                                    (SPADCALL Q
                                                              (QREFELT $ 26)))
                                                   . #4#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (QREFELT $ 49))
                               . #4#)
                         (EXIT
                          (COND
                           ((ZEROP (SPADCALL Z (QREFELT $ 26)))
                            (PROGN (LETT #1# Z . #4#) (GO #1#)))
                           ('T
                            (SEQ
                             (PROGN
                              (LETT |#G179| Q . #4#)
                              (LETT |#G180| (SPADCALL P Q Z |s| (QREFELT $ 52))
                                    . #4#)
                              (LETT P |#G179| . #4#)
                              (LETT Q |#G180| . #4#))
                             (EXIT
                              (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                    . #4#)))))))))))
                    NIL (GO G190) G191 (EXIT NIL)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;lastSubResultantEuclidean;2polRR;27| (P Q $)
  (PROG (|s| VQ VP |#G186| |#G185| |ss| #1=#:G658 VZ #2=#:G652 Z |#G184|
         |#G183| |pdiv| #3=#:G650 #4=#:G645 |degP| |l|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                 (|spadConstant| $ 24)))
        ('T
         (SEQ
          (COND
           ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
            (SEQ
             (LETT |l| (SPADCALL Q P (QREFELT $ 76))
                   . #5=(|PRS;lastSubResultantEuclidean;2polRR;27|))
             (EXIT
              (PROGN
               (LETT #1# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                     . #5#)
               (GO #1#))))))
          (COND
           ((ZEROP (SPADCALL Q (QREFELT $ 26)))
            (SEQ (LETT |degP| (SPADCALL P (QREFELT $ 26)) . #5#)
                 (EXIT
                  (COND
                   ((ZEROP |degP|)
                    (|error|
                     "lastSubResultantEuclidean$PRS : constant polynomials"))
                   ('T
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1 (LETT #4# (- |degP| 1) . #5#)
                                       (|check_subtype| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        #4#))
                                     (QREFELT $ 28))
                           . #5#)
                     (EXIT
                      (PROGN
                       (LETT #1#
                             (VECTOR (|spadConstant| $ 24)
                                     (SPADCALL |s| (QREFELT $ 13))
                                     (SPADCALL |s| Q (QREFELT $ 29)))
                             . #5#)
                       (GO #1#))))))))))
          (LETT |s|
                (SPADCALL (SPADCALL Q (QREFELT $ 25))
                          (PROG1
                              (LETT #3#
                                    (- (SPADCALL P (QREFELT $ 26))
                                       (SPADCALL Q (QREFELT $ 26)))
                                    . #5#)
                            (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                             #3#))
                          (QREFELT $ 28))
                . #5#)
          (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9)) . #5#)
          (LETT |pdiv| (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                . #5#)
          (LETT VQ
                (VECTOR (QVELT |pdiv| 2)
                        (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                        (QVELT |pdiv| 1))
                . #5#)
          (LETT VZ (SPADCALL VP (QREFELT $ 77)) . #5#)
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (PROGN
                  (LETT |#G183| (SPADCALL VQ 1 (QREFELT $ 54)) . #5#)
                  (LETT |#G184| (SPADCALL VZ 1 (QREFELT $ 54)) . #5#)
                  (LETT Q |#G183| . #5#)
                  (LETT Z |#G184| . #5#))
                 (EXIT
                  (COND
                   ((SPADCALL Q (QREFELT $ 23))
                    (PROGN
                     (LETT #1#
                           (VECTOR (SPADCALL VZ 2 (QREFELT $ 54))
                                   (SPADCALL VZ 3 (QREFELT $ 54))
                                   (SPADCALL VZ 1 (QREFELT $ 54)))
                           . #5#)
                     (GO #1#)))
                   ('T
                    (SEQ
                     (LETT VZ
                           (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 25)) |s|
                            (PROG1
                                (LETT #2#
                                      (- (SPADCALL Z (QREFELT $ 26))
                                         (SPADCALL Q (QREFELT $ 26)))
                                      . #5#)
                              (|check_subtype| (>= #2# 0)
                                               '(|NonNegativeInteger|) #2#))
                            $)
                           . #5#)
                     (EXIT
                      (COND
                       ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                        (PROGN
                         (LETT #1#
                               (VECTOR (SPADCALL VZ 2 (QREFELT $ 54))
                                       (SPADCALL VZ 3 (QREFELT $ 54))
                                       (SPADCALL VZ 1 (QREFELT $ 54)))
                               . #5#)
                         (GO #1#)))
                       ('T
                        (SEQ
                         (LETT |ss|
                               (SPADCALL (SPADCALL VZ 1 (QREFELT $ 54))
                                         (QREFELT $ 25))
                               . #5#)
                         (PROGN
                          (LETT |#G185| VQ . #5#)
                          (LETT |#G186|
                                (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                . #5#)
                          (LETT VP |#G185| . #5#)
                          (LETT VQ |#G186| . #5#))
                         (EXIT (LETT |s| |ss| . #5#)))))))))))
                NIL (GO G190) G191 (EXIT NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiLastSubResultantEuclidean;2polRR;28| (P Q $)
  (PROG (|s| VQ VP |#G192| |#G191| |ss| #1=#:G677 VZ #2=#:G670 Z |#G190|
         |#G189| |pdiv| #3=#:G668 #4=#:G663 |degP|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23)))
         (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))
        ('T
         (COND
          ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
           (|error| "semiLastSubResultantEuclidean$PRS : bad degrees"))
          (#5='T
           (SEQ
            (COND
             ((ZEROP (SPADCALL Q (QREFELT $ 26)))
              (SEQ
               (LETT |degP| (SPADCALL P (QREFELT $ 26))
                     . #6=(|PRS;semiLastSubResultantEuclidean;2polRR;28|))
               (EXIT
                (COND
                 ((ZEROP |degP|)
                  (|error|
                   "semiLastSubResultantEuclidean$PRS : constant polynomials"))
                 (#5#
                  (SEQ
                   (LETT |s|
                         (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                   (PROG1 (LETT #4# (- |degP| 1) . #6#)
                                     (|check_subtype| (>= #4# 0)
                                                      '(|NonNegativeInteger|)
                                                      #4#))
                                   (QREFELT $ 28))
                         . #6#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (CONS (SPADCALL |s| (QREFELT $ 13))
                                 (SPADCALL |s| Q (QREFELT $ 29)))
                           . #6#)
                     (GO #1#))))))))))
            (LETT |s|
                  (SPADCALL (SPADCALL Q (QREFELT $ 25))
                            (PROG1
                                (LETT #3#
                                      (- (SPADCALL P (QREFELT $ 26))
                                         (SPADCALL Q (QREFELT $ 26)))
                                      . #6#)
                              (|check_subtype| (>= #3# 0)
                                               '(|NonNegativeInteger|) #3#))
                            (QREFELT $ 28))
                  . #6#)
            (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #6#)
            (LETT |pdiv|
                  (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                  . #6#)
            (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #6#)
            (LETT VZ (SPADCALL VP (QREFELT $ 77)) . #6#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (PROGN
                    (LETT |#G189| (SPADCALL VQ 1 (QREFELT $ 54)) . #6#)
                    (LETT |#G190| (SPADCALL VZ 1 (QREFELT $ 54)) . #6#)
                    (LETT Q |#G189| . #6#)
                    (LETT Z |#G190| . #6#))
                   (EXIT
                    (COND
                     ((SPADCALL Q (QREFELT $ 23))
                      (PROGN
                       (LETT #1#
                             (CONS (SPADCALL VZ 2 (QREFELT $ 54))
                                   (SPADCALL VZ 1 (QREFELT $ 54)))
                             . #6#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT VZ
                             (|PRS;Lazard3| VQ (SPADCALL Q (QREFELT $ 25)) |s|
                              (PROG1
                                  (LETT #2#
                                        (- (SPADCALL Z (QREFELT $ 26))
                                           (SPADCALL Q (QREFELT $ 26)))
                                        . #6#)
                                (|check_subtype| (>= #2# 0)
                                                 '(|NonNegativeInteger|) #2#))
                              $)
                             . #6#)
                       (EXIT
                        (COND
                         ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                          (PROGN
                           (LETT #1#
                                 (CONS (SPADCALL VZ 2 (QREFELT $ 54))
                                       (SPADCALL VZ 1 (QREFELT $ 54)))
                                 . #6#)
                           (GO #1#)))
                         ('T
                          (SEQ
                           (LETT |ss|
                                 (SPADCALL (SPADCALL VZ 1 (QREFELT $ 54))
                                           (QREFELT $ 25))
                                 . #6#)
                           (PROGN
                            (LETT |#G191| VQ . #6#)
                            (LETT |#G192|
                                  (|PRS;next_sousResultant3| VP VQ |s| |ss| $)
                                  . #6#)
                            (LETT VP |#G191| . #6#)
                            (LETT VQ |#G192| . #6#))
                           (EXIT (LETT |s| |ss| . #6#)))))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;chainSubResultants;2polRL;29| (P Q $)
  (PROG (|s| |#G202| |#G201| #1=#:G692 L Z |delta| #2=#:G685 |#G200| |#G199|
         #3=#:G684 |#G198| |#G197|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23))) NIL)
             ('T
              (SEQ
               (COND
                ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                 (SEQ
                  (PROGN
                   (LETT |#G197| Q . #4=(|PRS;chainSubResultants;2polRL;29|))
                   (LETT |#G198| P . #4#)
                   (LETT P |#G197| . #4#)
                   (LETT Q |#G198| . #4#))
                  (EXIT
                   (COND
                    ((ODDP (SPADCALL P (QREFELT $ 26)))
                     (COND
                      ((ODDP (SPADCALL Q (QREFELT $ 26)))
                       (LETT Q (SPADCALL Q (QREFELT $ 50)) . #4#)))))))))
               (LETT L NIL . #4#)
               (EXIT
                (COND ((ZEROP (SPADCALL Q (QREFELT $ 26))) L)
                      ('T
                       (SEQ (LETT L (LIST Q) . #4#)
                            (LETT |s|
                                  (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                            (PROG1
                                                (LETT #3#
                                                      (-
                                                       (SPADCALL P
                                                                 (QREFELT $
                                                                          26))
                                                       (SPADCALL Q
                                                                 (QREFELT $
                                                                          26)))
                                                      . #4#)
                                              (|check_subtype| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               #3#))
                                            (QREFELT $ 28))
                                  . #4#)
                            (PROGN
                             (LETT |#G199| Q . #4#)
                             (LETT |#G200|
                                   (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                             (QREFELT $ 59))
                                   . #4#)
                             (LETT P |#G199| . #4#)
                             (LETT Q |#G200| . #4#))
                            (EXIT
                             (SEQ G190 NIL
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL Q (QREFELT $ 23))
                                      (PROGN (LETT #1# L . #4#) (GO #1#)))
                                     ('T
                                      (SEQ (LETT L (CONS Q L) . #4#)
                                           (LETT |delta|
                                                 (PROG1
                                                     (LETT #2#
                                                           (-
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 26))
                                                            (SPADCALL Q
                                                                      (QREFELT
                                                                       $ 26)))
                                                           . #4#)
                                                   (|check_subtype| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #2#))
                                                 . #4#)
                                           (LETT Z
                                                 (SPADCALL Q
                                                           (SPADCALL Q
                                                                     (QREFELT $
                                                                              25))
                                                           |s| |delta|
                                                           (QREFELT $ 49))
                                                 . #4#)
                                           (COND
                                            ((SPADCALL |delta| 1
                                                       (QREFELT $ 66))
                                             (LETT L (CONS Z L) . #4#)))
                                           (EXIT
                                            (COND
                                             ((ZEROP
                                               (SPADCALL Z (QREFELT $ 26)))
                                              (PROGN
                                               (LETT #1# L . #4#)
                                               (GO #1#)))
                                             ('T
                                              (SEQ
                                               (PROGN
                                                (LETT |#G201| Q . #4#)
                                                (LETT |#G202|
                                                      (SPADCALL P Q Z |s|
                                                                (QREFELT $ 52))
                                                      . #4#)
                                                (LETT P |#G201| . #4#)
                                                (LETT Q |#G202| . #4#))
                                               (EXIT
                                                (LETT |s|
                                                      (SPADCALL Z
                                                                (QREFELT $ 25))
                                                      . #4#)))))))))))
                                  NIL (GO G190) G191 (EXIT NIL)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;schema;2polRL;30| (P Q $)
  (PROG (|s| |#G210| |#G209| #1=#:G705 L Z |delta| #2=#:G698 |e| |#G208|
         |#G207| #3=#:G697 |#G206| |#G205|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((OR (SPADCALL Q (QREFELT $ 23)) (SPADCALL P (QREFELT $ 23))) NIL)
             ('T
              (SEQ
               (COND
                ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                 (PROGN
                  (LETT |#G205| Q . #4=(|PRS;schema;2polRL;30|))
                  (LETT |#G206| P . #4#)
                  (LETT P |#G205| . #4#)
                  (LETT Q |#G206| . #4#))))
               (EXIT
                (COND ((ZEROP (SPADCALL Q (QREFELT $ 26))) (LIST 0))
                      ('T
                       (SEQ (LETT L NIL . #4#)
                            (LETT |s|
                                  (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                            (PROG1
                                                (LETT #3#
                                                      (-
                                                       (SPADCALL P
                                                                 (QREFELT $
                                                                          26))
                                                       (SPADCALL Q
                                                                 (QREFELT $
                                                                          26)))
                                                      . #4#)
                                              (|check_subtype| (>= #3# 0)
                                                               '(|NonNegativeInteger|)
                                                               #3#))
                                            (QREFELT $ 28))
                                  . #4#)
                            (PROGN
                             (LETT |#G207| Q . #4#)
                             (LETT |#G208| (SPADCALL P Q (QREFELT $ 59)) . #4#)
                             (LETT P |#G207| . #4#)
                             (LETT Q |#G208| . #4#))
                            (EXIT
                             (SEQ G190 NIL
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL Q (QREFELT $ 23))
                                      (PROGN (LETT #1# L . #4#) (GO #1#)))
                                     ('T
                                      (SEQ
                                       (LETT |e| (SPADCALL Q (QREFELT $ 26))
                                             . #4#)
                                       (LETT L (CONS |e| L) . #4#)
                                       (LETT |delta|
                                             (PROG1
                                                 (LETT #2#
                                                       (-
                                                        (SPADCALL P
                                                                  (QREFELT $
                                                                           26))
                                                        |e|)
                                                       . #4#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             . #4#)
                                       (LETT Z
                                             (SPADCALL Q
                                                       (SPADCALL Q
                                                                 (QREFELT $
                                                                          25))
                                                       |s| |delta|
                                                       (QREFELT $ 49))
                                             . #4#)
                                       (COND
                                        ((SPADCALL |delta| 1 (QREFELT $ 66))
                                         (LETT L (CONS |e| L) . #4#)))
                                       (EXIT
                                        (COND
                                         ((ZEROP |e|)
                                          (PROGN (LETT #1# L . #4#) (GO #1#)))
                                         ('T
                                          (SEQ
                                           (PROGN
                                            (LETT |#G209| Q . #4#)
                                            (LETT |#G210|
                                                  (SPADCALL P Q Z |s|
                                                            (QREFELT $ 52))
                                                  . #4#)
                                            (LETT P |#G209| . #4#)
                                            (LETT Q |#G210| . #4#))
                                           (EXIT
                                            (LETT |s|
                                                  (SPADCALL Z (QREFELT $ 25))
                                                  . #4#)))))))))))
                                  NIL (GO G190) G191 (EXIT NIL)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;subResultantGcd;3polR;31| (P Q $)
  (PROG (|s| |#G218| |#G217| Z #1=#:G711 #2=#:G720 |#G216| |#G215| #3=#:G710
         |#G214| |#G213|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL P (QREFELT $ 23))
          (COND ((SPADCALL Q (QREFELT $ 23)) (EXIT (|spadConstant| $ 24))))))
        (EXIT
         (COND ((SPADCALL P (QREFELT $ 23)) Q) ((SPADCALL Q (QREFELT $ 23)) P)
               (#4='T
                (SEQ
                 (COND
                  ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                   (PROGN
                    (LETT |#G213| Q . #5=(|PRS;subResultantGcd;3polR;31|))
                    (LETT |#G214| P . #5#)
                    (LETT P |#G213| . #5#)
                    (LETT Q |#G214| . #5#))))
                 (EXIT
                  (COND
                   ((ZEROP (SPADCALL Q (QREFELT $ 26))) (|spadConstant| $ 9))
                   (#4#
                    (SEQ
                     (LETT |s|
                           (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                     (PROG1
                                         (LETT #3#
                                               (- (SPADCALL P (QREFELT $ 26))
                                                  (SPADCALL Q (QREFELT $ 26)))
                                               . #5#)
                                       (|check_subtype| (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        #3#))
                                     (QREFELT $ 28))
                           . #5#)
                     (PROGN
                      (LETT |#G215| Q . #5#)
                      (LETT |#G216|
                            (SPADCALL P (SPADCALL Q (QREFELT $ 50))
                                      (QREFELT $ 59))
                            . #5#)
                      (LETT P |#G215| . #5#)
                      (LETT Q |#G216| . #5#))
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL Q (QREFELT $ 23))
                               (PROGN (LETT #2# P . #5#) (GO #2#)))
                              ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                               (PROGN
                                (LETT #2# (|spadConstant| $ 9) . #5#)
                                (GO #2#)))
                              ('T
                               (SEQ
                                (LETT Z
                                      (SPADCALL Q (SPADCALL Q (QREFELT $ 25))
                                                |s|
                                                (PROG1
                                                    (LETT #1#
                                                          (-
                                                           (SPADCALL P
                                                                     (QREFELT $
                                                                              26))
                                                           (SPADCALL Q
                                                                     (QREFELT $
                                                                              26)))
                                                          . #5#)
                                                  (|check_subtype| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   #1#))
                                                (QREFELT $ 49))
                                      . #5#)
                                (PROGN
                                 (LETT |#G217| Q . #5#)
                                 (LETT |#G218|
                                       (SPADCALL P Q Z |s| (QREFELT $ 52))
                                       . #5#)
                                 (LETT P |#G217| . #5#)
                                 (LETT Q |#G218| . #5#))
                                (EXIT
                                 (LETT |s| (SPADCALL Z (QREFELT $ 25))
                                       . #5#)))))))
                           NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;subResultantGcdEuclidean;2polRR;32| (P Q $)
  (PROG (|s| VQ VP |#G224| |#G223| |ss| #1=#:G729 #2=#:G738 |e| |#G222| |#G221|
         |pdiv| #3=#:G727 |l|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL P (QREFELT $ 23))
          (COND
           ((SPADCALL Q (QREFELT $ 23))
            (EXIT
             (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                     (|spadConstant| $ 24)))))))
        (EXIT
         (COND
          ((SPADCALL P (QREFELT $ 23))
           (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 9) Q))
          ((SPADCALL Q (QREFELT $ 23))
           (VECTOR (|spadConstant| $ 9) (|spadConstant| $ 24) P))
          (#4='T
           (SEQ
            (COND
             ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
              (SEQ
               (LETT |l| (SPADCALL Q P (QREFELT $ 85))
                     . #5=(|PRS;subResultantGcdEuclidean;2polRR;32|))
               (EXIT
                (PROGN
                 (LETT #2# (VECTOR (QVELT |l| 1) (QVELT |l| 0) (QVELT |l| 2))
                       . #5#)
                 (GO #2#))))))
            (EXIT
             (COND
              ((ZEROP (SPADCALL Q (QREFELT $ 26)))
               (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 9) Q))
              (#4#
               (SEQ
                (LETT |s|
                      (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                (PROG1
                                    (LETT #3#
                                          (- (SPADCALL P (QREFELT $ 26))
                                             (SPADCALL Q (QREFELT $ 26)))
                                          . #5#)
                                  (|check_subtype| (>= #3# 0)
                                                   '(|NonNegativeInteger|)
                                                   #3#))
                                (QREFELT $ 28))
                      . #5#)
                (LETT VP (VECTOR Q (|spadConstant| $ 24) (|spadConstant| $ 9))
                      . #5#)
                (LETT |pdiv|
                      (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                      . #5#)
                (LETT VQ
                      (VECTOR (QVELT |pdiv| 2)
                              (SPADCALL (QVELT |pdiv| 0) (QREFELT $ 13))
                              (QVELT |pdiv| 1))
                      . #5#)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (PROGN
                        (LETT |#G221| (SPADCALL VP 1 (QREFELT $ 54)) . #5#)
                        (LETT |#G222| (SPADCALL VQ 1 (QREFELT $ 54)) . #5#)
                        (LETT P |#G221| . #5#)
                        (LETT Q |#G222| . #5#))
                       (EXIT
                        (COND
                         ((SPADCALL Q (QREFELT $ 23))
                          (PROGN
                           (LETT #2#
                                 (VECTOR (SPADCALL VP 2 (QREFELT $ 54))
                                         (SPADCALL VP 3 (QREFELT $ 54)) P)
                                 . #5#)
                           (GO #2#)))
                         ('T
                          (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #5#)
                               (EXIT
                                (COND
                                 ((ZEROP |e|)
                                  (PROGN
                                   (LETT #2#
                                         (VECTOR (SPADCALL VQ 2 (QREFELT $ 54))
                                                 (SPADCALL VQ 3 (QREFELT $ 54))
                                                 Q)
                                         . #5#)
                                   (GO #2#)))
                                 ('T
                                  (SEQ
                                   (LETT |ss|
                                         (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                   |s|
                                                   (PROG1
                                                       (LETT #1#
                                                             (-
                                                              (SPADCALL P
                                                                        (QREFELT
                                                                         $ 26))
                                                              |e|)
                                                             . #5#)
                                                     (|check_subtype|
                                                      (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))
                                                   (QREFELT $ 48))
                                         . #5#)
                                   (PROGN
                                    (LETT |#G223| VQ . #5#)
                                    (LETT |#G224|
                                          (|PRS;next_sousResultant3| VP VQ |s|
                                           |ss| $)
                                          . #5#)
                                    (LETT VP |#G223| . #5#)
                                    (LETT VQ |#G224| . #5#))
                                   (EXIT (LETT |s| |ss| . #5#)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;semiSubResultantGcdEuclidean2;2polRR;33| (P Q $)
  (PROG (|s| VQ VP |#G230| |#G229| |ss| #1=#:G745 #2=#:G756 |e| |#G228| |#G227|
         |pdiv| #3=#:G743)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL P (QREFELT $ 23))
          (COND
           ((SPADCALL Q (QREFELT $ 23))
            (EXIT (CONS (|spadConstant| $ 24) (|spadConstant| $ 24)))))))
        (EXIT
         (COND ((SPADCALL P (QREFELT $ 23)) (CONS (|spadConstant| $ 9) Q))
               ((SPADCALL Q (QREFELT $ 23)) (CONS (|spadConstant| $ 24) P))
               ((< (SPADCALL P (QREFELT $ 26)) (SPADCALL Q (QREFELT $ 26)))
                (|error| "semiSubResultantGcdEuclidean2$PRS : bad degrees"))
               ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                (CONS (|spadConstant| $ 9) Q))
               ('T
                (SEQ
                 (LETT |s|
                       (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                 (PROG1
                                     (LETT #3#
                                           (- (SPADCALL P (QREFELT $ 26))
                                              (SPADCALL Q (QREFELT $ 26)))
                                           . #4=(|PRS;semiSubResultantGcdEuclidean2;2polRR;33|))
                                   (|check_subtype| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                 (QREFELT $ 28))
                       . #4#)
                 (LETT VP (VECTOR Q (|spadConstant| $ 9)) . #4#)
                 (LETT |pdiv|
                       (SPADCALL P (SPADCALL Q (QREFELT $ 50)) (QREFELT $ 34))
                       . #4#)
                 (LETT VQ (VECTOR (QVELT |pdiv| 2) (QVELT |pdiv| 1)) . #4#)
                 (EXIT
                  (SEQ G190 NIL
                       (SEQ
                        (PROGN
                         (LETT |#G227| (SPADCALL VP 1 (QREFELT $ 54)) . #4#)
                         (LETT |#G228| (SPADCALL VQ 1 (QREFELT $ 54)) . #4#)
                         (LETT P |#G227| . #4#)
                         (LETT Q |#G228| . #4#))
                        (EXIT
                         (COND
                          ((SPADCALL Q (QREFELT $ 23))
                           (PROGN
                            (LETT #2# (CONS (SPADCALL VP 2 (QREFELT $ 54)) P)
                                  . #4#)
                            (GO #2#)))
                          ('T
                           (SEQ (LETT |e| (SPADCALL Q (QREFELT $ 26)) . #4#)
                                (EXIT
                                 (COND
                                  ((ZEROP |e|)
                                   (PROGN
                                    (LETT #2#
                                          (CONS (SPADCALL VQ 2 (QREFELT $ 54))
                                                Q)
                                          . #4#)
                                    (GO #2#)))
                                  ('T
                                   (SEQ
                                    (LETT |ss|
                                          (SPADCALL (SPADCALL Q (QREFELT $ 25))
                                                    |s|
                                                    (PROG1
                                                        (LETT #1#
                                                              (-
                                                               (SPADCALL P
                                                                         (QREFELT
                                                                          $
                                                                          26))
                                                               |e|)
                                                              . #4#)
                                                      (|check_subtype|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       #1#))
                                                    (QREFELT $ 48))
                                          . #4#)
                                    (PROGN
                                     (LETT |#G229| VQ . #4#)
                                     (LETT |#G230|
                                           (|PRS;next_sousResultant3| VP VQ |s|
                                            |ss| $)
                                           . #4#)
                                     (LETT VP |#G229| . #4#)
                                     (LETT VQ |#G230| . #4#))
                                    (EXIT (LETT |s| |ss| . #4#)))))))))))
                       NIL (GO G190) G191 (EXIT NIL)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |PRS;semiSubResultantGcdEuclidean1;2polRR;34| (P Q $)
  (PROG (|result|)
    (RETURN
     (SEQ
      (LETT |result| (SPADCALL P Q (QREFELT $ 85))
            |PRS;semiSubResultantGcdEuclidean1;2polRR;34|)
      (EXIT (CONS (QVELT |result| 0) (QVELT |result| 2))))))) 

(DEFUN |PRS;discriminant;polRR;35| (P $)
  (PROG (#1=#:G771 #2=#:G767 #3=#:G764 |d| |r| |dP| |a| #4=#:G762)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |d| (SPADCALL P (QREFELT $ 26))
              . #5=(|PRS;discriminant;polRR;35|))
        (EXIT
         (COND ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
               (#6='T
                (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #5#)
                     (LETT |a|
                           (EXPT -1
                                 (PROG1 (LETT #4# |a| . #5#)
                                   (|check_subtype| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    #4#)))
                           . #5#)
                     (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #5#)
                     (LETT |r| (SPADCALL P |dP| (QREFELT $ 60)) . #5#)
                     (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 26))) 1)
                           . #5#)
                     (EXIT
                      (PROGN
                       (LETT #1#
                             (COND
                              ((ZEROP |d|)
                               (SPADCALL |a|
                                         (PROG2
                                             (LETT #3#
                                                   (SPADCALL |r|
                                                             (SPADCALL P
                                                                       (QREFELT
                                                                        $ 25))
                                                             (QREFELT $ 36))
                                                   . #5#)
                                             (QCDR #3#)
                                           (|check_union| (QEQCAR #3# 0)
                                                          (QREFELT $ 6) #3#))
                                         (QREFELT $ 91)))
                              (#6#
                               (SPADCALL (SPADCALL |a| |r| (QREFELT $ 91))
                                         (SPADCALL (SPADCALL P (QREFELT $ 25))
                                                   (PROG1
                                                       (LETT #2# (- |d| 1)
                                                             . #5#)
                                                     (|check_subtype|
                                                      (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      #2#))
                                                   (QREFELT $ 28))
                                         (QREFELT $ 40))))
                             . #5#)
                       (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;discriminantEuclidean;polRR;36| (P $)
  (PROG (#1=#:G798 |cr| #2=#:G792 |c2| #3=#:G790 |c1| #4=#:G785 #5=#:G778
         #6=#:G775 |d| |rE| |dP| |a| #7=#:G773)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |d| (SPADCALL P (QREFELT $ 26))
              . #8=(|PRS;discriminantEuclidean;polRR;36|))
        (EXIT
         (COND ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
               (#9='T
                (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #8#)
                     (LETT |a|
                           (EXPT -1
                                 (PROG1 (LETT #7# |a| . #8#)
                                   (|check_subtype| (>= #7# 0)
                                                    '(|NonNegativeInteger|)
                                                    #7#)))
                           . #8#)
                     (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #8#)
                     (LETT |rE| (SPADCALL P |dP| (QREFELT $ 62)) . #8#)
                     (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 26))) 1)
                           . #8#)
                     (COND
                      ((ZEROP |d|)
                       (SEQ
                        (LETT |c1|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #6#
                                                  (SPADCALL (QVELT |rE| 0)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 25))
                                                            (QREFELT $ 18))
                                                  . #8#)
                                            (QCDR #6#)
                                          (|check_union| (QEQCAR #6# 0)
                                                         (QREFELT $ 7) #6#))
                                        (QREFELT $ 61))
                              . #8#)
                        (LETT |c2|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #6#
                                                  (SPADCALL (QVELT |rE| 1)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 25))
                                                            (QREFELT $ 18))
                                                  . #8#)
                                            (QCDR #6#)
                                          (|check_union| (QEQCAR #6# 0)
                                                         (QREFELT $ 7) #6#))
                                        (QREFELT $ 61))
                              . #8#)
                        (EXIT
                         (LETT |cr|
                               (SPADCALL |a|
                                         (PROG2
                                             (LETT #5#
                                                   (SPADCALL (QVELT |rE| 2)
                                                             (SPADCALL P
                                                                       (QREFELT
                                                                        $ 25))
                                                             (QREFELT $ 36))
                                                   . #8#)
                                             (QCDR #5#)
                                           (|check_union| (QEQCAR #5# 0)
                                                          (QREFELT $ 6) #5#))
                                         (QREFELT $ 91))
                               . #8#))))
                      (#9#
                       (SEQ
                        (LETT |c1|
                              (SPADCALL
                               (SPADCALL |a| (QVELT |rE| 0) (QREFELT $ 61))
                               (SPADCALL (SPADCALL P (QREFELT $ 25))
                                         (PROG1 (LETT #4# (- |d| 1) . #8#)
                                           (|check_subtype| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            #4#))
                                         (QREFELT $ 28))
                               (QREFELT $ 93))
                              . #8#)
                        (LETT |c2|
                              (SPADCALL
                               (SPADCALL |a| (QVELT |rE| 1) (QREFELT $ 61))
                               (SPADCALL (SPADCALL P (QREFELT $ 25))
                                         (PROG1 (LETT #3# (- |d| 1) . #8#)
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         (QREFELT $ 28))
                               (QREFELT $ 93))
                              . #8#)
                        (EXIT
                         (LETT |cr|
                               (SPADCALL
                                (SPADCALL |a| (QVELT |rE| 2) (QREFELT $ 91))
                                (SPADCALL (SPADCALL P (QREFELT $ 25))
                                          (PROG1 (LETT #2# (- |d| 1) . #8#)
                                            (|check_subtype| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             #2#))
                                          (QREFELT $ 28))
                                (QREFELT $ 40))
                               . #8#)))))
                     (EXIT
                      (PROGN
                       (LETT #1# (VECTOR |c1| |c2| |cr|) . #8#)
                       (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiDiscriminantEuclidean;polRR;37| (P $)
  (PROG (#1=#:G820 |cr| #2=#:G814 |c2| #3=#:G812 #4=#:G805 #5=#:G802 |d| |rE|
         |dP| |a| #6=#:G800)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |d| (SPADCALL P (QREFELT $ 26))
              . #7=(|PRS;semiDiscriminantEuclidean;polRR;37|))
        (EXIT
         (COND ((ZEROP |d|) (|error| "cannot take discriminant of constants"))
               (#8='T
                (SEQ (LETT |a| (QUOTIENT2 (* |d| (- |d| 1)) 2) . #7#)
                     (LETT |a|
                           (EXPT -1
                                 (PROG1 (LETT #6# |a| . #7#)
                                   (|check_subtype| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    #6#)))
                           . #7#)
                     (LETT |dP| (SPADCALL P (QREFELT $ 90)) . #7#)
                     (LETT |rE| (SPADCALL P |dP| (QREFELT $ 63)) . #7#)
                     (LETT |d| (- (- |d| (SPADCALL |dP| (QREFELT $ 26))) 1)
                           . #7#)
                     (COND
                      ((ZEROP |d|)
                       (SEQ
                        (LETT |c2|
                              (SPADCALL |a|
                                        (PROG2
                                            (LETT #5#
                                                  (SPADCALL (QCAR |rE|)
                                                            (SPADCALL P
                                                                      (QREFELT
                                                                       $ 25))
                                                            (QREFELT $ 18))
                                                  . #7#)
                                            (QCDR #5#)
                                          (|check_union| (QEQCAR #5# 0)
                                                         (QREFELT $ 7) #5#))
                                        (QREFELT $ 61))
                              . #7#)
                        (EXIT
                         (LETT |cr|
                               (SPADCALL |a|
                                         (PROG2
                                             (LETT #4#
                                                   (SPADCALL (QCDR |rE|)
                                                             (SPADCALL P
                                                                       (QREFELT
                                                                        $ 25))
                                                             (QREFELT $ 36))
                                                   . #7#)
                                             (QCDR #4#)
                                           (|check_union| (QEQCAR #4# 0)
                                                          (QREFELT $ 6) #4#))
                                         (QREFELT $ 91))
                               . #7#))))
                      (#8#
                       (SEQ
                        (LETT |c2|
                              (SPADCALL
                               (SPADCALL |a| (QCAR |rE|) (QREFELT $ 61))
                               (SPADCALL (SPADCALL P (QREFELT $ 25))
                                         (PROG1 (LETT #3# (- |d| 1) . #7#)
                                           (|check_subtype| (>= #3# 0)
                                                            '(|NonNegativeInteger|)
                                                            #3#))
                                         (QREFELT $ 28))
                               (QREFELT $ 93))
                              . #7#)
                        (EXIT
                         (LETT |cr|
                               (SPADCALL
                                (SPADCALL |a| (QCDR |rE|) (QREFELT $ 91))
                                (SPADCALL (SPADCALL P (QREFELT $ 25))
                                          (PROG1 (LETT #2# (- |d| 1) . #7#)
                                            (|check_subtype| (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             #2#))
                                          (QREFELT $ 28))
                                (QREFELT $ 40))
                               . #7#)))))
                     (EXIT
                      (PROGN (LETT #1# (CONS |c2| |cr|) . #7#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;resultantReduit;2polRR;38| (P Q $)
  (PROG (#1=#:G827 #2=#:G823 |l| |UVs| UV)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT UV (SPADCALL P Q (QREFELT $ 85))
              . #3=(|PRS;resultantReduit;2polRR;38|))
        (LETT |UVs| (QVELT UV 2) . #3#)
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |UVs| (QREFELT $ 26)) 0 (QREFELT $ 66))
           (|spadConstant| $ 35))
          ('T
           (SEQ
            (LETT |l|
                  (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 99))
                            (SPADCALL (QVELT UV 1) (QREFELT $ 99))
                            (QREFELT $ 100))
                  . #3#)
            (EXIT
             (PROGN
              (LETT #1#
                    (PROG2
                        (LETT #2#
                              (SPADCALL (SPADCALL |UVs| (QREFELT $ 25))
                                        (SPADCALL |l| (QREFELT $ 102))
                                        (QREFELT $ 36))
                              . #3#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                    . #3#)
              (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;resultantReduitEuclidean;2polRR;39| (P Q $)
  (PROG (#1=#:G839 |rr| #2=#:G834 |c2| #3=#:G831 |c1| |gl| |l| |UVs| UV)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT UV (SPADCALL P Q (QREFELT $ 85))
              . #4=(|PRS;resultantReduitEuclidean;2polRR;39|))
        (LETT |UVs| (QVELT UV 2) . #4#)
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |UVs| (QREFELT $ 26)) 0 (QREFELT $ 66))
           (VECTOR (|spadConstant| $ 24) (|spadConstant| $ 24)
                   (|spadConstant| $ 35)))
          ('T
           (SEQ
            (LETT |l|
                  (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 99))
                            (SPADCALL (QVELT UV 1) (QREFELT $ 99))
                            (QREFELT $ 100))
                  . #4#)
            (LETT |gl| (SPADCALL |l| (QREFELT $ 102)) . #4#)
            (LETT |c1|
                  (PROG2
                      (LETT #3# (SPADCALL (QVELT UV 0) |gl| (QREFELT $ 18))
                            . #4#)
                      (QCDR #3#)
                    (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                  . #4#)
            (LETT |c2|
                  (PROG2
                      (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 18))
                            . #4#)
                      (QCDR #3#)
                    (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                  . #4#)
            (LETT |rr|
                  (PROG2
                      (LETT #2#
                            (SPADCALL (SPADCALL |UVs| (QREFELT $ 25)) |gl|
                                      (QREFELT $ 36))
                            . #4#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                  . #4#)
            (EXIT
             (PROGN (LETT #1# (VECTOR |c1| |c2| |rr|) . #4#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;semiResultantReduitEuclidean;2polRR;40| (P Q $)
  (PROG (#1=#:G851 |rr| #2=#:G846 |c2| #3=#:G843 |gl| |l| |UVs| UV)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT UV (SPADCALL P Q (QREFELT $ 85))
              . #4=(|PRS;semiResultantReduitEuclidean;2polRR;40|))
        (LETT |UVs| (QVELT UV 2) . #4#)
        (EXIT
         (COND
          ((SPADCALL (SPADCALL |UVs| (QREFELT $ 26)) 0 (QREFELT $ 66))
           (CONS (|spadConstant| $ 24) (|spadConstant| $ 35)))
          ('T
           (SEQ
            (LETT |l|
                  (SPADCALL (SPADCALL (QVELT UV 0) (QREFELT $ 99))
                            (SPADCALL (QVELT UV 1) (QREFELT $ 99))
                            (QREFELT $ 100))
                  . #4#)
            (LETT |gl| (SPADCALL |l| (QREFELT $ 102)) . #4#)
            (LETT |c2|
                  (PROG2
                      (LETT #3# (SPADCALL (QVELT UV 1) |gl| (QREFELT $ 18))
                            . #4#)
                      (QCDR #3#)
                    (|check_union| (QEQCAR #3# 0) (QREFELT $ 7) #3#))
                  . #4#)
            (LETT |rr|
                  (PROG2
                      (LETT #2#
                            (SPADCALL (SPADCALL |UVs| (QREFELT $ 25)) |gl|
                                      (QREFELT $ 36))
                            . #4#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 0) (QREFELT $ 6) #2#))
                  . #4#)
            (EXIT (PROGN (LETT #1# (CONS |c2| |rr|) . #4#) (GO #1#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;gcd_naif| (P Q $)
  (PROG (|#G250| |#G249| #1=#:G860 #2=#:G853)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL P (QREFELT $ 23))
         (PROG2
             (LETT #2# (SPADCALL Q (SPADCALL Q (QREFELT $ 25)) (QREFELT $ 18))
                   . #3=(|PRS;gcd_naif|))
             (QCDR #2#)
           (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#)))
        ('T
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL Q (QREFELT $ 23))
                  (PROGN
                   (LETT #1#
                         (PROG2
                             (LETT #2#
                                   (SPADCALL P (SPADCALL P (QREFELT $ 25))
                                             (QREFELT $ 18))
                                   . #3#)
                             (QCDR #2#)
                           (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                         . #3#)
                   (GO #1#)))
                 ((ZEROP (SPADCALL Q (QREFELT $ 26)))
                  (PROGN (LETT #1# (|spadConstant| $ 9) . #3#) (GO #1#)))
                 ('T
                  (PROGN
                   (LETT |#G249| Q . #3#)
                   (LETT |#G250| (QCDR (SPADCALL P Q (QREFELT $ 38))) . #3#)
                   (LETT P |#G249| . #3#)
                   (LETT Q |#G250| . #3#))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |PRS;gcd;3polR;42| (P Q $)
  (PROG (#1=#:G867 G #2=#:G862 |cQ| |cP|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((|HasCategory| (QREFELT $ 6) '(|Finite|)) (|PRS;gcd_naif| P Q $))
             ((SPADCALL P (QREFELT $ 23)) Q) ((SPADCALL Q (QREFELT $ 23)) P)
             ('T
              (SEQ
               (LETT |cP| (SPADCALL P (QREFELT $ 108))
                     . #3=(|PRS;gcd;3polR;42|))
               (LETT |cQ| (SPADCALL Q (QREFELT $ 108)) . #3#)
               (LETT P
                     (PROG2 (LETT #2# (SPADCALL P |cP| (QREFELT $ 18)) . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                     . #3#)
               (LETT Q
                     (PROG2 (LETT #2# (SPADCALL Q |cQ| (QREFELT $ 18)) . #3#)
                         (QCDR #2#)
                       (|check_union| (QEQCAR #2# 0) (QREFELT $ 7) #2#))
                     . #3#)
               (LETT G (SPADCALL P Q (QREFELT $ 83)) . #3#)
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL |cP| |cQ| (QREFELT $ 109))
                                 (SPADCALL G (QREFELT $ 110)) (QREFELT $ 29))
                       . #3#)
                 (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |PseudoRemainderSequence| (&REST #1=#:G868)
  (PROG ()
    (RETURN
     (PROG (#2=#:G869)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PseudoRemainderSequence|)
                                           '|domainEqualList|)
                . #3=(|PseudoRemainderSequence|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PseudoRemainderSequence;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PseudoRemainderSequence|))))))))))) 

(DEFUN |PseudoRemainderSequence;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PseudoRemainderSequence|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|PseudoRemainderSequence| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 112) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|GcdDomain|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|PseudoRemainderSequence|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12 (SPADCALL (|spadConstant| $ 8) 1 (QREFELT $ 11)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 103
                   (CONS (|dispatchFunction| |PRS;resultantReduit;2polRR;38|)
                         $))
         (QSETREFV $ 105
                   (CONS
                    (|dispatchFunction|
                     |PRS;resultantReduitEuclidean;2polRR;39|)
                    $))
         (QSETREFV $ 107
                   (CONS
                    (|dispatchFunction|
                     |PRS;semiResultantReduitEuclidean;2polRR;40|)
                    $))
         (QSETREFV $ 111 (CONS (|dispatchFunction| |PRS;gcd;3polR;42|) $)))))
      $)))) 

(MAKEPROP '|PseudoRemainderSequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |One|)
              (4 . |One|) (|NonNegativeInteger|) (8 . |monomial|) 'X
              (14 . |coerce|) (|Vector| 7) (19 . *) |PRS;*;R2V;1|
              (|Union| $ '"failed") (25 . |exquo|) (|Mapping| 7 7) (31 . |map|)
              |PRS;exquo;VRV;2| (|Boolean|) (37 . |zero?|) (42 . |Zero|)
              (46 . |leadingCoefficient|) (51 . |degree|) (56 . |reductum|)
              (61 . ^) (67 . *) (73 . +) (79 . *) (85 . -)
              (|Record| (|:| |coef| 6) (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;pseudoDivide;2polRR;3| (91 . |Zero|) (95 . |exquo|)
              (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              |PRS;divide;2polRR;4| (101 . -) (106 . *)
              |PRS;resultant_naif;2polRR;5|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |resultant| 6))
              |PRS;resultantEuclidean_naif;2polRR;6|
              (|Record| (|:| |coef2| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean_naif;2polRR;7| (|PositiveInteger|)
              (112 . *) |PRS;Lazard;2RNniR;8| |PRS;Lazard2;polR2RNnipolR;9|
              (118 . -) (123 . |coefficient|)
              |PRS;next_sousResultant2;3polRRpolR;11| (|Integer|) (129 . |elt|)
              (135 . -) (141 . +) (147 . |setelt|) (154 . -)
              (159 . |pseudoRemainder|) |PRS;resultant;2polRR;14| (165 . *)
              |PRS;resultantEuclidean;2polRR;16|
              |PRS;semiResultantEuclidean2;2polRR;18|
              (|Record| (|:| |coef1| 7) (|:| |resultant| 6))
              |PRS;semiResultantEuclidean1;2polRR;19| (171 . >)
              |PRS;indiceSubResultant;2polRNnipolR;20|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;indiceSubResultantEuclidean;2polRNniR;21|
              (|Record| (|:| |coef2| 7) (|:| |subResultant| 7))
              |PRS;semiIndiceSubResultantEuclidean;2polRNniR;22|
              |PRS;degreeSubResultant;2polRNnipolR;23|
              |PRS;degreeSubResultantEuclidean;2polRNniR;24|
              |PRS;semiDegreeSubResultantEuclidean;2polRNniR;25|
              |PRS;lastSubResultant;3polR;26|
              |PRS;lastSubResultantEuclidean;2polRR;27| (177 . |copy|)
              |PRS;semiLastSubResultantEuclidean;2polRR;28| (|List| 7)
              |PRS;chainSubResultants;2polRL;29| (|List| 10)
              |PRS;schema;2polRL;30| |PRS;subResultantGcd;3polR;31|
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;subResultantGcdEuclidean;2polRR;32|
              (|Record| (|:| |coef2| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean2;2polRR;33|
              (|Record| (|:| |coef1| 7) (|:| |gcd| 7))
              |PRS;semiSubResultantGcdEuclidean1;2polRR;34|
              (182 . |differentiate|) (187 . *) |PRS;discriminant;polRR;35|
              (193 . *)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;discriminantEuclidean;polRR;36|
              (|Record| (|:| |coef2| 7) (|:| |discriminant| 6))
              |PRS;semiDiscriminantEuclidean;polRR;37| (|List| 6)
              (199 . |coefficients|) (204 . |concat|) (|List| $) (210 . |gcd|)
              (215 . |resultantReduit|)
              (|Record| (|:| |coef1| 7) (|:| |coef2| 7)
                        (|:| |resultantReduit| 6))
              (221 . |resultantReduitEuclidean|)
              (|Record| (|:| |coef2| 7) (|:| |resultantReduit| 6))
              (227 . |semiResultantReduitEuclidean|) (233 . |content|)
              (238 . |gcd|) (244 . |primitivePart|) (249 . |gcd|))
           '#(|subResultantGcdEuclidean| 255 |subResultantGcd| 261
              |semiSubResultantGcdEuclidean2| 267
              |semiSubResultantGcdEuclidean1| 273
              |semiResultantReduitEuclidean| 279 |semiResultantEuclidean_naif|
              285 |semiResultantEuclidean2| 291 |semiResultantEuclidean1| 297
              |semiLastSubResultantEuclidean| 303
              |semiIndiceSubResultantEuclidean| 309 |semiDiscriminantEuclidean|
              316 |semiDegreeSubResultantEuclidean| 321 |schema| 328
              |resultant_naif| 334 |resultantReduitEuclidean| 340
              |resultantReduit| 346 |resultantEuclidean_naif| 352
              |resultantEuclidean| 358 |resultant| 364 |pseudoDivide| 370
              |next_sousResultant2| 376 |lastSubResultantEuclidean| 384
              |lastSubResultant| 390 |indiceSubResultantEuclidean| 396
              |indiceSubResultant| 403 |gcd| 410 |exquo| 416 |divide| 422
              |discriminantEuclidean| 428 |discriminant| 433
              |degreeSubResultantEuclidean| 438 |degreeSubResultant| 445
              |chainSubResultants| 452 |Lazard2| 458 |Lazard| 466 * 473)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 111
                                                 '(0 6 0 8 0 7 0 9 2 7 0 6 10
                                                   11 1 7 0 6 13 2 14 0 7 0 15
                                                   2 7 17 0 6 18 2 14 0 19 0 20
                                                   1 7 22 0 23 0 7 0 24 1 7 6 0
                                                   25 1 7 10 0 26 1 7 0 0 27 2
                                                   6 0 0 10 28 2 7 0 6 0 29 2 7
                                                   0 0 0 30 2 7 0 0 0 31 2 7 0
                                                   0 0 32 0 6 0 35 2 6 17 0 0
                                                   36 1 6 0 0 39 2 6 0 0 0 40 2
                                                   10 0 46 0 47 1 7 0 0 50 2 7
                                                   6 0 10 51 2 14 7 0 53 54 2
                                                   14 0 0 0 55 2 14 0 0 0 56 3
                                                   14 7 0 53 7 57 1 14 0 0 58 2
                                                   7 0 0 0 59 2 7 0 53 0 61 2
                                                   10 22 0 0 66 1 14 0 0 77 1 7
                                                   0 0 90 2 6 0 53 0 91 2 7 0 0
                                                   6 93 1 7 98 0 99 2 98 0 0 0
                                                   100 1 6 0 101 102 2 0 6 7 7
                                                   103 2 0 104 7 7 105 2 0 106
                                                   7 7 107 1 7 6 0 108 2 6 0 0
                                                   0 109 1 7 0 0 110 2 0 7 7 7
                                                   111 2 0 84 7 7 85 2 0 7 7 7
                                                   83 2 0 86 7 7 87 2 0 88 7 7
                                                   89 2 1 106 7 7 107 2 0 44 7
                                                   7 45 2 0 44 7 7 63 2 0 64 7
                                                   7 65 2 0 70 7 7 78 3 0 70 7
                                                   7 10 71 1 0 96 7 97 3 0 70 7
                                                   7 10 74 2 0 81 7 7 82 2 0 6
                                                   7 7 41 2 1 104 7 7 105 2 1 6
                                                   7 7 103 2 0 42 7 7 43 2 0 42
                                                   7 7 62 2 0 6 7 7 60 2 0 33 7
                                                   7 34 4 0 7 7 7 7 6 52 2 0 68
                                                   7 7 76 2 0 7 7 7 75 3 0 68 7
                                                   7 10 69 3 0 7 7 7 10 67 2 1
                                                   7 7 7 111 2 0 14 14 6 21 2 0
                                                   37 7 7 38 1 0 94 7 95 1 0 6
                                                   7 92 3 0 68 7 7 10 73 3 0 7
                                                   7 7 10 72 2 0 79 7 7 80 4 0
                                                   7 7 6 6 10 49 3 0 6 6 6 10
                                                   48 2 0 14 6 14 16)))))
           '|lookupComplete|)) 
