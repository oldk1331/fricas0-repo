
(/VERSIONCHECK 2) 

(DEFUN |DEFINTEF;innerint;FS2OcBU;1| (|f| |x| |a| |b| |ignor?| $)
  (PROG (#1=#:G134 |v| |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u| (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)
               . #2=(|DEFINTEF;innerint;FS2OcBU;1|))
         (EXIT
          (COND
           ((OR (QEQCAR |u| 0) (QEQCAR |u| 1))
            (PROGN (LETT #1# |u| . #2#) (GO #1#)))
           ('T
            (SEQ (LETT |v| (SPADCALL |f| |x| |a| |b| (QREFELT $ 12)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (PROGN (LETT #1# |u| . #2#) (GO #1#))))))))))
        (EXIT (CONS 0 (SPADCALL (QCDR |v|) (QREFELT $ 13))))))
      #1# (EXIT #1#))))) 

(DEFUN |DEFINTEF;innerint;FS2OcBU;2| (|f| |x| |a| |b| |ignor?| $)
  (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)) 

(DEFUN |DEFINTEF;innerint;FS2OcBU;3| (|f| |x| |a| |b| |ignor?| $)
  (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)) 

(DEFUN |DEFINTEF;innerint;FS2OcBU;4| (|f| |x| |a| |b| |ignor?| $)
  (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| $)) 

(DEFUN |DEFINTEF;integrate;FSbU;5| (|f| |s| $)
  (SPADCALL |f| (SPADCALL |s| (QREFELT $ 18))
            (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 21))
            (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 22)) 'NIL
            (QREFELT $ 16))) 

(DEFUN |DEFINTEF;integrate;FSbSU;6| (|f| |s| |str| $)
  (SPADCALL |f| (SPADCALL |s| (QREFELT $ 18))
            (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 21))
            (SPADCALL (SPADCALL |s| (QREFELT $ 20)) (QREFELT $ 22))
            (SPADCALL |str| (QREFELT $ 26)) (QREFELT $ 16))) 

(DEFUN |DEFINTEF;int| (|f| |x| |a| |b| |ignor?| $)
  (PROG (|z| |k|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| |b| (QREFELT $ 28)) (CONS 0 (|spadConstant| $ 29)))
            (#1='T
             (SEQ
              (LETT |k| (SPADCALL |x| (QREFELT $ 31)) . #2=(|DEFINTEF;int|))
              (LETT |z| (|DEFINTEF;checkForPole| |f| |x| |k| |a| |b| $) . #2#)
              (EXIT
               (COND
                ((QEQCAR |z| 1)
                 (COND (|ignor?| (|DEFINTEF;nopole| |f| |x| |k| |a| |b| $))
                       (#1# (CONS 3 "potentialPole"))))
                ((QCDR |z|) (|error| "integrate: pole in path of integration"))
                (#1# (|DEFINTEF;nopole| |f| |x| |k| |a| |b| $))))))))))) 

(DEFUN |DEFINTEF;checkForPole| (|f| |x| |k| |a| |b| $)
  (PROG (#1=#:G179 |u| |d|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u|
               (|DEFINTEF;checkFor0|
                (LETT |d| (SPADCALL |f| (QREFELT $ 33))
                      . #2=(|DEFINTEF;checkForPole|))
                |k| |a| |b| $)
               . #2#)
         (EXIT
          (COND
           ((OR (QEQCAR |u| 1) (QCDR |u|))
            (PROGN (LETT #1# |u| . #2#) (GO #1#))))))
        (SEQ (LETT |u| (|DEFINTEF;checkSMP| |d| |x| |k| |a| |b| $) . #2#)
             (EXIT
              (COND
               ((OR (QEQCAR |u| 1) (QCDR |u|))
                (PROGN (LETT #1# |u| . #2#) (GO #1#))))))
        (EXIT
         (|DEFINTEF;checkSMP| (SPADCALL |f| (QREFELT $ 34)) |x| |k| |a| |b|
          $))))
      #1# (EXIT #1#))))) 

(DEFUN |DEFINTEF;checkFor0| (|p| |x| |a| |b| $)
  (PROG (#1=#:G201 |w| |k| |z| #2=#:G191 #3=#:G206 #4=#:G207 |t| |v| |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |u| (|DEFINTEF;polyIfCan| |p| |x| $) . #5=(|DEFINTEF;checkFor0|))
        (EXIT
         (COND
          ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |a| |b| 'NIL (QREFELT $ 37)))
          (#6='T
           (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 40)) . #5#)
                (EXIT
                 (COND
                  ((QEQCAR |v| 0)
                   (SEQ
                    (SEQ
                     (EXIT
                      (SEQ (LETT |t| NIL . #5#) (LETT #4# (QCDR |v|) . #5#)
                           G190
                           (COND
                            ((OR (ATOM #4#)
                                 (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |w| (|DEFINTEF;checkFor0| |t| |x| |a| |b| $)
                                  . #5#)
                            (EXIT
                             (COND
                              ((OR (QEQCAR |w| 1) (QCDR |w|))
                               (PROGN
                                (LETT #2# (PROGN (LETT #3# |w| . #5#) (GO #3#))
                                      . #5#)
                                (GO #2#))))))
                           (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                           (EXIT NIL)))
                     #2# (EXIT #2#))
                    (EXIT (CONS 0 'NIL))))
                  (#6#
                   (SEQ (LETT |z| (SPADCALL |p| (QREFELT $ 43)) . #5#)
                        (EXIT
                         (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                               (#6#
                                (SEQ (LETT |k| (QCAR (QCDR |z|)) . #5#)
                                     (COND
                                      ((OR (SPADCALL |k| '|exp| (QREFELT $ 44))
                                           (OR
                                            (SPADCALL |k| '|acot|
                                                      (QREFELT $ 44))
                                            (SPADCALL |k| '|cosh|
                                                      (QREFELT $ 44))))
                                       (EXIT (CONS 0 'NIL))))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |k| '|log| (QREFELT $ 44))
                                        (SEQ
                                         (EXIT
                                          (SEQ
                                           (SEQ
                                            (LETT |w|
                                                  (|DEFINTEF;moreThan| |b|
                                                   (|spadConstant| $ 46) $)
                                                  . #5#)
                                            (EXIT
                                             (COND
                                              ((OR (QEQCAR |w| 1)
                                                   (NULL (QCDR |w|)))
                                               (PROGN
                                                (LETT #1# |w| . #5#)
                                                (GO #1#))))))
                                           (EXIT
                                            (|DEFINTEF;moreThan|
                                             (SPADCALL |a| (QREFELT $ 47))
                                             (SPADCALL (|spadConstant| $ 46)
                                                       (QREFELT $ 50))
                                             $))))
                                         #1# (EXIT #1#)))
                                       (#6# (CONS 1 "failed"))))))))))))))))))
      #3# (EXIT #3#))))) 

(DEFUN |DEFINTEF;moreThan| (|a| |b| $)
  (PROG (|u| |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |a| (QREFELT $ 51)) . #1=(|DEFINTEF;moreThan|))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (CONS 0
                   (SPADCALL (SPADCALL |a| (QREFELT $ 53)) 0 (QREFELT $ 55))))
            (#2='T
             (SEQ (LETT |u| (SPADCALL (QCDR |r|) (QREFELT $ 57)) . #1#)
                  (EXIT
                   (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                         (#2#
                          (CONS 0
                                (SPADCALL (QCDR |u|) |b|
                                          (QREFELT $ 58)))))))))))))) 

(DEFUN |DEFINTEF;checkSMP| (|p| |x| |k| |a| |b| $)
  (PROG (#1=#:G264 |w| #2=#:G262 #3=#:G251 |f| |kk| |z| |n| #4=#:G272 #5=#:G274
         |t| |v| #6=#:G230 #7=#:G273 |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |u| (|DEFINTEF;polyIfCan| |p| |k| $) . #8=(|DEFINTEF;checkSMP|))
        (EXIT
         (COND ((QEQCAR |u| 0) (CONS 0 'NIL))
               (#9='T
                (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 40)) . #8#)
                     (EXIT
                      (COND
                       ((QEQCAR |v| 0)
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |t| NIL . #8#)
                                (LETT #7# (QCDR |v|) . #8#) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |t| (CAR #7#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |w|
                                       (|DEFINTEF;checkSMP| |t| |x| |k| |a| |b|
                                        $)
                                       . #8#)
                                 (EXIT
                                  (COND
                                   ((OR (QEQCAR |w| 1) (QCDR |w|))
                                    (PROGN
                                     (LETT #6#
                                           (PROGN
                                            (LETT #4# |w| . #8#)
                                            (GO #4#))
                                           . #8#)
                                     (GO #6#))))))
                                (LETT #7# (CDR #7#) . #8#) (GO G190) G191
                                (EXIT NIL)))
                          #6# (EXIT #6#))
                         (EXIT (CONS 0 'NIL))))
                       (#9#
                        (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 59)) . #8#)
                             (EXIT
                              (COND
                               ((QEQCAR |v| 0)
                                (SEQ (LETT |n| (|spadConstant| $ 54) . #8#)
                                     (SEQ (LETT |t| NIL . #8#)
                                          (LETT #5# (QCDR |v|) . #8#) G190
                                          (COND
                                           ((OR (ATOM #5#)
                                                (PROGN
                                                 (LETT |t| (CAR #5#) . #8#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |w|
                                                 (|DEFINTEF;checkSMP| |t| |x|
                                                  |k| |a| |b| $)
                                                 . #8#)
                                           (EXIT
                                            (COND
                                             ((QEQCAR |w| 1)
                                              (PROGN
                                               (LETT #4# |w| . #8#)
                                               (GO #4#)))
                                             ((QCDR |w|)
                                              (LETT |n|
                                                    (SPADCALL |n|
                                                              (|spadConstant| $
                                                                              48)
                                                              (QREFELT $ 60))
                                                    . #8#)))))
                                          (LETT #5# (CDR #5#) . #8#) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |n| (QREFELT $ 61))
                                        (CONS 0 'NIL))
                                       ((SPADCALL |n| (|spadConstant| $ 48)
                                                  (QREFELT $ 62))
                                        (CONS 0 'T))
                                       (#9# (CONS 1 "failed"))))))
                               (#9#
                                (SEQ
                                 (LETT |z| (SPADCALL |p| (QREFELT $ 43)) . #8#)
                                 (EXIT
                                  (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                                        (#9#
                                         (SEQ
                                          (LETT |kk| (QCAR (QCDR |z|)) . #8#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |kk| (QREFELT $ 64))
                                              (QREFELT $ 65))
                                             (CONS 0 'NIL))
                                            (#9#
                                             (SEQ
                                              (LETT |f|
                                                    (|SPADfirst|
                                                     (SPADCALL |kk|
                                                               (QREFELT $ 67)))
                                                    . #8#)
                                              (COND
                                               ((OR
                                                 (SPADCALL |kk| '|exp|
                                                           (QREFELT $ 44))
                                                 (OR
                                                  (SPADCALL |kk| '|sin|
                                                            (QREFELT $ 44))
                                                  (OR
                                                   (SPADCALL |kk| '|cos|
                                                             (QREFELT $ 44))
                                                   (OR
                                                    (SPADCALL |kk| '|sinh|
                                                              (QREFELT $ 44))
                                                    (OR
                                                     (SPADCALL |kk| '|cosh|
                                                               (QREFELT $ 44))
                                                     (OR
                                                      (SPADCALL |kk| '|tanh|
                                                                (QREFELT $ 44))
                                                      (OR
                                                       (SPADCALL |kk| '|sech|
                                                                 (QREFELT $
                                                                          44))
                                                       (OR
                                                        (SPADCALL |kk| '|atan|
                                                                  (QREFELT $
                                                                           44))
                                                        (OR
                                                         (SPADCALL |kk| '|acot|
                                                                   (QREFELT $
                                                                            44))
                                                         (SPADCALL |kk|
                                                                   '|asinh|
                                                                   (QREFELT $
                                                                            44)))))))))))
                                                (EXIT
                                                 (|DEFINTEF;checkForPole| |f|
                                                  |x| |k| |a| |b| $))))
                                              (COND
                                               ((OR
                                                 (SPADCALL |kk| '|asin|
                                                           (QREFELT $ 44))
                                                 (OR
                                                  (SPADCALL |kk| '|acos|
                                                            (QREFELT $ 44))
                                                  (SPADCALL |kk| '|atanh|
                                                            (QREFELT $ 44))))
                                                (EXIT
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;checkForPole|
                                                            |f| |x| |k| |a| |b|
                                                            $)
                                                           . #8#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #3# |w| . #8#)
                                                         (GO #3#))))))
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;posit|
                                                            (SPADCALL |f|
                                                                      (|spadConstant|
                                                                       $ 49)
                                                                      (QREFELT
                                                                       $ 68))
                                                            |x| |k| |a| |b| $)
                                                           . #8#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #3# |w| . #8#)
                                                         (GO #3#))))))
                                                    (EXIT
                                                     (|DEFINTEF;negat|
                                                      (SPADCALL |f|
                                                                (|spadConstant|
                                                                 $ 49)
                                                                (QREFELT $ 69))
                                                      |x| |k| |a| |b| $))))
                                                  #3# (EXIT #3#)))))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |kk| '|acosh|
                                                           (QREFELT $ 44))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;checkForPole|
                                                            |f| |x| |k| |a| |b|
                                                            $)
                                                           . #8#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #2# |w| . #8#)
                                                         (GO #2#))))))
                                                    (EXIT
                                                     (|DEFINTEF;negat|
                                                      (SPADCALL |f|
                                                                (|spadConstant|
                                                                 $ 49)
                                                                (QREFELT $ 68))
                                                      |x| |k| |a| |b| $))))
                                                  #2# (EXIT #2#)))
                                                ((SPADCALL |kk| '|log|
                                                           (QREFELT $ 44))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (SEQ
                                                     (LETT |w|
                                                           (|DEFINTEF;checkForPole|
                                                            |f| |x| |k| |a| |b|
                                                            $)
                                                           . #8#)
                                                     (EXIT
                                                      (COND
                                                       ((OR (QEQCAR |w| 1)
                                                            (QCDR |w|))
                                                        (PROGN
                                                         (LETT #1# |w| . #8#)
                                                         (GO #1#))))))
                                                    (EXIT
                                                     (|DEFINTEF;negat| |f| |x|
                                                      |k| |a| |b| $))))
                                                  #1# (EXIT #1#)))
                                                (#9#
                                                 (CONS 1
                                                       "failed"))))))))))))))))))))))))))
      #4# (EXIT #4#))))) 

(DEFUN |DEFINTEF;posit| (|f| |x| |k| |a| |b| $)
  (PROG (#1=#:G289 |w| #2=#:G290 #3=#:G282 |b2| |z| |r| |b1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |z|
              (SEQ
               (LETT |r| (SPADCALL |a| (QREFELT $ 51)) . #4=(|DEFINTEF;posit|))
               (EXIT
                (COND ((QEQCAR |r| 1) (SPADCALL |f| |x| |a| (QREFELT $ 72)))
                      (#5='T
                       (SPADCALL |f| |x| (QCDR |r|) "right" (QREFELT $ 73))))))
              . #4#)
        (SEQ (LETT |b1| (QEQCAR |z| 0) . #4#)
             (EXIT
              (COND
               (|b1|
                (COND
                 ((SPADCALL
                   (PROG2 (LETT #3# |z| . #4#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (|Integer|) #3#))
                   0 (QREFELT $ 76))
                  (PROGN (LETT #2# (CONS 0 'T) . #4#) (GO #2#))))))))
        (LETT |z|
              (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 51)) . #4#)
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1) (SPADCALL |f| |x| |b| (QREFELT $ 72)))
                     (#5#
                      (SPADCALL |f| |x| (QCDR |r|) "left" (QREFELT $ 73))))))
              . #4#)
        (SEQ (LETT |b2| (QEQCAR |z| 0) . #4#)
             (EXIT
              (COND
               (|b2|
                (COND
                 ((SPADCALL
                   (PROG2 (LETT #3# |z| . #4#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (|Integer|) #3#))
                   0 (QREFELT $ 76))
                  (PROGN (LETT #2# (CONS 0 'T) . #4#) (GO #2#))))))))
        (COND
         (|b1|
          (COND
           (|b2|
            (EXIT
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |w|
                       (|DEFINTEF;checkFor0| (SPADCALL |f| (QREFELT $ 34)) |k|
                        |a| |b| $)
                       . #4#)
                 (EXIT
                  (COND
                   ((OR (QEQCAR |w| 1) (QCDR |w|))
                    (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#))))))
                (EXIT (CONS 0 'NIL))))
              #1# (EXIT #1#)))))))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |DEFINTEF;negat| (|f| |x| |k| |a| |b| $)
  (PROG (#1=#:G306 |w| #2=#:G307 #3=#:G299 |b2| |z| |r| |b1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |z|
              (SEQ
               (LETT |r| (SPADCALL |a| (QREFELT $ 51)) . #4=(|DEFINTEF;negat|))
               (EXIT
                (COND ((QEQCAR |r| 1) (SPADCALL |f| |x| |a| (QREFELT $ 72)))
                      (#5='T
                       (SPADCALL |f| |x| (QCDR |r|) "right" (QREFELT $ 73))))))
              . #4#)
        (SEQ (LETT |b1| (QEQCAR |z| 0) . #4#)
             (EXIT
              (COND
               (|b1|
                (COND
                 ((<
                   (PROG2 (LETT #3# |z| . #4#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (|Integer|) #3#))
                   0)
                  (PROGN (LETT #2# (CONS 0 'T) . #4#) (GO #2#))))))))
        (LETT |z|
              (SEQ (LETT |r| (SPADCALL |b| (QREFELT $ 51)) . #4#)
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1) (SPADCALL |f| |x| |b| (QREFELT $ 72)))
                     (#5#
                      (SPADCALL |f| |x| (QCDR |r|) "left" (QREFELT $ 73))))))
              . #4#)
        (SEQ (LETT |b2| (QEQCAR |z| 0) . #4#)
             (EXIT
              (COND
               (|b2|
                (COND
                 ((<
                   (PROG2 (LETT #3# |z| . #4#)
                       (QCDR #3#)
                     (|check_union| (QEQCAR #3# 0) (|Integer|) #3#))
                   0)
                  (PROGN (LETT #2# (CONS 0 'T) . #4#) (GO #2#))))))))
        (COND
         (|b1|
          (COND
           (|b2|
            (EXIT
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |w|
                       (|DEFINTEF;checkFor0| (SPADCALL |f| (QREFELT $ 34)) |k|
                        |a| |b| $)
                       . #4#)
                 (EXIT
                  (COND
                   ((OR (QEQCAR |w| 1) (QCDR |w|))
                    (PROGN (LETT #1# (CONS 1 "failed") . #4#) (GO #1#))))))
                (EXIT (CONS 0 'NIL))))
              #1# (EXIT #1#)))))))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |DEFINTEF;polyIfCan| (|p| |x| $)
  (PROG (|q| |ans| #1=#:G316 |c|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |q| (SPADCALL |p| |x| (QREFELT $ 78))
              . #2=(|DEFINTEF;polyIfCan|))
        (LETT |ans| (|spadConstant| $ 79) . #2#)
        (SEQ G190
             (COND
              ((NULL (SPADCALL |q| (|spadConstant| $ 81) (QREFELT $ 82)))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x|
                           (SPADCALL
                            (LETT |c|
                                  (SPADCALL (SPADCALL |q| (QREFELT $ 83))
                                            (QREFELT $ 84))
                                  . #2#)
                            (QREFELT $ 86))
                           (QREFELT $ 88))
                 (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
                ('T
                 (SEQ
                  (LETT |ans|
                        (SPADCALL |ans|
                                  (SPADCALL |c| (SPADCALL |q| (QREFELT $ 90))
                                            (QREFELT $ 91))
                                  (QREFELT $ 92))
                        . #2#)
                  (EXIT (LETT |q| (SPADCALL |q| (QREFELT $ 93)) . #2#)))))))
             NIL (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |ans|))))
      #1# (EXIT #1#))))) 

(DEFUN |DEFINTEF;nopole| (|f| |x| |k| |a| |b| $)
  (PROG (|ans| #1=#:G332 |v| #2=#:G333 |g| |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |u| (SPADCALL |f| |x| (QREFELT $ 96)) . #3=(|DEFINTEF;nopole|))
        (EXIT
         (COND
          ((QEQCAR |u| 0)
           (SEQ
            (LETT |v| (SPADCALL |k| (QCDR |u|) |a| |b| 'NIL (QREFELT $ 98))
                  . #3#)
            (EXIT
             (COND ((QEQCAR |v| 1) (CONS 2 #4="failed"))
                   (#5='T (CONS 0 (QCDR |v|)))))))
          (#5#
           (SEQ (LETT |ans| NIL . #3#)
                (SEQ (LETT |g| NIL . #3#) (LETT #2# (QCDR |u|) . #3#) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |v| (SPADCALL |k| |g| |a| |b| 'NIL (QREFELT $ 98))
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |v| 1)
                         (PROGN (LETT #1# (CONS 2 #4#) . #3#) (GO #1#)))
                        ('T
                         (LETT |ans|
                               (SPADCALL |ans| (LIST (QCDR |v|))
                                         (QREFELT $ 100))
                               . #3#)))))
                     (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 |ans|))))))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionDefiniteIntegration;|)) 

(DEFUN |ElementaryFunctionDefiniteIntegration| (&REST #1=#:G334)
  (PROG ()
    (RETURN
     (PROG (#2=#:G335)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionDefiniteIntegration|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionDefiniteIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |ElementaryFunctionDefiniteIntegration;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ElementaryFunctionDefiniteIntegration|))))))))))) 

(DEFUN |ElementaryFunctionDefiniteIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ElementaryFunctionDefiniteIntegration|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunctionDefiniteIntegration| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 101) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunctionDefiniteIntegration|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
        (COND
         ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
          (COND
           ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
            (PROGN
             (QSETREFV $ 16
                       (CONS (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;1|)
                             $))))
           ('T
            (QSETREFV $ 16
                      (CONS (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;2|)
                            $)))))
         ('T
          (QSETREFV $ 16
                    (CONS (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;3|)
                          $)))))
       ('T
        (QSETREFV $ 16
                  (CONS (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;4|)
                        $))))
      $)))) 

(MAKEPROP '|ElementaryFunctionDefiniteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| 7 '"failed") (|Symbol|) (|OrderedCompletion| 7)
              (|PatternMatchIntegration| 6 7) (0 . |pmintegrate|)
              (8 . |coerce|)
              (|Union| (|:| |f1| 10) (|:| |f2| 99) (|:| |fail| '"failed")
                       (|:| |pole| '"potentialPole"))
              (|Boolean|) (13 . |innerint|) (|SegmentBinding| 10)
              (22 . |variable|) (|Segment| 10) (27 . |segment|) (32 . |lo|)
              (37 . |hi|) |DEFINTEF;integrate;FSbU;5| (|String|)
              (|DefiniteIntegrationTools| 6 7) (42 . |ignore?|)
              |DEFINTEF;integrate;FSbSU;6| (47 . =) (53 . |Zero|) (|Kernel| 7)
              (57 . |kernel|) (|SparseMultivariatePolynomial| 6 (|Kernel| $))
              (62 . |denom|) (67 . |numer|) (|Union| 15 '"failed")
              (|SparseUnivariatePolynomial| 7) (72 . |checkForZero|)
              (|Union| (|List| $) '#1="failed")
              (|SparseMultivariatePolynomial| 6 30) (80 . |isTimes|)
              (|Record| (|:| |var| 30) (|:| |exponent| 89)) (|Union| 41 '#1#)
              (85 . |isExpt|) (90 . |is?|) (|Fraction| 75) (96 . |One|)
              (100 . -) (105 . |One|) (109 . |One|) (113 . -)
              (118 . |retractIfCan|) (|SingleInteger|) (123 . |whatInfinity|)
              (128 . |Zero|) (132 . >) (|Union| 45 '"failed")
              (138 . |retractIfCan|) (143 . >) (149 . |isPlus|) (154 . +)
              (160 . |zero?|) (165 . =) (|BasicOperator|) (171 . |operator|)
              (176 . |nullary?|) (|List| 7) (181 . |argument|) (186 . -)
              (192 . +) (|Union| 75 '"failed") (|ElementaryFunctionSign| 6 7)
              (198 . |sign|) (205 . |sign|) (213 . |Zero|) (|Integer|)
              (217 . >) (|SparseUnivariatePolynomial| $) (223 . |univariate|)
              (229 . |Zero|) (|SparseUnivariatePolynomial| 39) (233 . |Zero|)
              (237 . ~=) (243 . |leadingCoefficient|) (248 . |coerce|)
              (|List| (|Kernel| $)) (253 . |tower|) (|List| 30)
              (258 . |member?|) (|NonNegativeInteger|) (264 . |degree|)
              (269 . |monomial|) (275 . +) (281 . |reductum|) (|Union| 7 66)
              (|FunctionSpaceIntegration| 6 7) (286 . |integrate|)
              (|Union| 10 '"failed") (292 . |computeInt|) (|List| 10)
              (301 . |concat!|))
           '#(|integrate| 307 |innerint| 320) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 100
                                                 '(4 11 8 7 9 10 10 12 1 10 0 7
                                                   13 5 0 14 7 9 10 10 15 16 1
                                                   17 9 0 18 1 17 19 0 20 1 19
                                                   10 0 21 1 19 10 0 22 1 25 15
                                                   24 26 2 10 15 0 0 28 0 10 0
                                                   29 1 30 0 9 31 1 7 32 0 33 1
                                                   7 32 0 34 4 25 35 36 10 10
                                                   15 37 1 39 38 0 40 1 39 42 0
                                                   43 2 30 15 0 9 44 0 45 0 46
                                                   1 10 0 0 47 0 6 0 48 0 7 0
                                                   49 1 45 0 0 50 1 10 8 0 51 1
                                                   10 52 0 53 0 6 0 54 2 52 15
                                                   0 0 55 1 7 56 0 57 2 45 15 0
                                                   0 58 1 39 38 0 59 2 6 0 0 0
                                                   60 1 6 15 0 61 2 6 15 0 0 62
                                                   1 30 63 0 64 1 63 15 0 65 1
                                                   30 66 0 67 2 7 0 0 0 68 2 7
                                                   0 0 0 69 3 71 70 7 9 10 72 4
                                                   71 70 7 9 7 24 73 0 7 0 74 2
                                                   75 15 0 0 76 2 39 77 0 30 78
                                                   0 36 0 79 0 80 0 81 2 80 15
                                                   0 0 82 1 80 39 0 83 1 7 0 32
                                                   84 1 7 85 0 86 2 87 15 30 0
                                                   88 1 80 89 0 90 2 36 0 7 89
                                                   91 2 36 0 0 0 92 1 80 0 0 93
                                                   2 95 94 7 9 96 5 25 97 30 7
                                                   10 10 15 98 2 99 0 0 0 100 2
                                                   0 14 7 17 23 3 0 14 7 17 24
                                                   27 5 0 14 7 9 10 10 15
                                                   16)))))
           '|lookupComplete|)) 
