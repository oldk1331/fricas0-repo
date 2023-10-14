
(/VERSIONCHECK 2) 

(DEFUN |INTPM;mkalist| (|res| $)
  (SPADCALL (SPADCALL |res| (QREFELT $ 54)) (QREFELT $ 56))) 

(DEFUN |INTPM;splitConstant;FSR;2| (|f| |x| $)
  (PROG (#1=#:G202 |rec| |vv| |v| |cc| #2=#:G204 |g| |nc| |u| #3=#:G203)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (SPADCALL |x| (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 57)))
         (CONS |f| (|spadConstant| $ 45)))
        ('T
         (COND
          ((QEQCAR (SPADCALL |f| (QREFELT $ 60)) 0)
           (CONS (|spadConstant| $ 45) |f|))
          (#4='T
           (SEQ
            (LETT |u| (SPADCALL |f| (QREFELT $ 62))
                  . #5=(|INTPM;splitConstant;FSR;2|))
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ (LETT |cc| (LETT |nc| (|spadConstant| $ 45) . #5#) . #5#)
                    (SEQ (LETT |g| NIL . #5#) (LETT #3# (QCDR |u|) . #5#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |g| (CAR #3#) . #5#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |rec| (SPADCALL |g| |x| (QREFELT $ 64)) . #5#)
                          (LETT |cc|
                                (SPADCALL |cc| (QCAR |rec|) (QREFELT $ 65))
                                . #5#)
                          (EXIT
                           (LETT |nc|
                                 (SPADCALL |nc| (QCDR |rec|) (QREFELT $ 65))
                                 . #5#)))
                         (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |cc| |nc|))))
              (#4#
               (SEQ (LETT |u| (SPADCALL |f| (QREFELT $ 66)) . #5#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ
                        (LETT |rec|
                              (SPADCALL (|SPADfirst| (QCDR |u|)) |x|
                                        (QREFELT $ 64))
                              . #5#)
                        (LETT |cc| (QCAR |rec|) . #5#)
                        (LETT |nc| (QCDR |rec|) . #5#)
                        (SEQ (LETT |g| NIL . #5#)
                             (LETT #2# (CDR (QCDR |u|)) . #5#) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |g| (CAR #2#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |rec| (SPADCALL |g| |x| (QREFELT $ 64))
                                    . #5#)
                              (EXIT
                               (COND
                                ((SPADCALL (QCDR |rec|) |nc| (QREFELT $ 67))
                                 (LETT |cc|
                                       (SPADCALL |cc| (QCAR |rec|)
                                                 (QREFELT $ 68))
                                       . #5#))
                                ((SPADCALL (QCDR |rec|)
                                           (SPADCALL |nc| (QREFELT $ 69))
                                           (QREFELT $ 67))
                                 (LETT |cc|
                                       (SPADCALL |cc| (QCAR |rec|)
                                                 (QREFELT $ 70))
                                       . #5#))
                                ('T
                                 (PROGN
                                  (LETT #1# (CONS (|spadConstant| $ 45) |f|)
                                        . #5#)
                                  (GO #1#))))))
                             (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (CONS |cc| |nc|))))
                      (#4#
                       (SEQ
                        (SEQ (LETT |v| (SPADCALL |f| (QREFELT $ 73)) . #5#)
                             (EXIT
                              (COND
                               ((QEQCAR |v| 0)
                                (SEQ (LETT |vv| (QCDR |v|) . #5#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCDR |vv|) 1 (QREFELT $ 74))
                                        (SEQ
                                         (LETT |rec|
                                               (SPADCALL (QCAR |vv|) |x|
                                                         (QREFELT $ 64))
                                               . #5#)
                                         (EXIT
                                          (PROGN
                                           (LETT #1#
                                                 (CONS
                                                  (SPADCALL (QCAR |rec|)
                                                            (QCDR |vv|)
                                                            (QREFELT $ 75))
                                                  (SPADCALL (QCDR |rec|)
                                                            (QCDR |vv|)
                                                            (QREFELT $ 75)))
                                                 . #5#)
                                           (GO #1#))))))))))))
                        (EXIT
                         (|error|
                          "splitConstant: should not happen"))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTPM;goodlilog?| (|k| |p| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 77))
    (EQL (SPADCALL |p| |k| (QREFELT $ 80)) 1))
   ('T 'NIL))) 

(DEFUN |INTPM;gooddilog?| (|k| |p| |q| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 77))
    (COND
     ((EQL (SPADCALL |p| |k| (QREFELT $ 81)) 1)
      (ZEROP (SPADCALL |q| |k| (QREFELT $ 81))))
     (#1='T 'NIL)))
   (#1# 'NIL))) 

(DEFUN |INTPM;matcherfei| (|f| |x| |comp?| $)
  (PROG (#1=#:G217 |d| |sa| |u| |cc| |da| |a| |l| |res| |pat| |res0|)
    (RETURN
     (SEQ (LETT |res0| (SPADCALL (QREFELT $ 82)) . #2=(|INTPM;matcherfei|))
          (LETT |pat|
                (SPADCALL (QREFELT $ 21)
                          (SPADCALL (SPADCALL (QREFELT $ 16) (QREFELT $ 18))
                                    (QREFELT $ 83))
                          (QREFELT $ 65))
                . #2#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #2#)
              (QREFELT $ 88))
             (COND
              (|comp?| (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)))
              (#3='T (|INTPM;matchei| |f| |x| $))))
            (#3#
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #2#)
                  (LETT |da|
                        (SPADCALL
                         (LETT |a| (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 89))
                               . #2#)
                         |x| (QREFELT $ 90))
                        . #2#)
                  (LETT |d|
                        (SPADCALL
                         (SPADCALL |a|
                                   (LETT |cc|
                                         (SPADCALL |l| (QREFELT $ 15)
                                                   (QREFELT $ 89))
                                         . #2#)
                                   (QREFELT $ 65))
                         |da| (QREFELT $ 47))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 90))
                               (QREFELT $ 91))
                     (VECTOR 1 |a| |d|))
                    (#3#
                     (SEQ
                      (EXIT
                       (SEQ
                        (COND
                         (|comp?|
                          (EXIT
                           (SEQ
                            (LETT |d|
                                  (SPADCALL
                                   (SPADCALL |cc|
                                             (LETT |sa|
                                                   (|INTPM;insqrt|
                                                    (SPADCALL |a|
                                                              (QREFELT $ 69))
                                                    $)
                                                   . #2#)
                                             (QREFELT $ 65))
                                   |da| (QREFELT $ 47))
                                  . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 90))
                                         (QREFELT $ 91))
                               (VECTOR 2 |sa|
                                       (SPADCALL
                                        (SPADCALL |d| (QREFELT $ 44)
                                                  (QREFELT $ 65))
                                        (QREFELT $ 69))))
                              (#3#
                               (VECTOR 0 (|spadConstant| $ 37)
                                       (|spadConstant| $ 37))))))))
                         (#3#
                          (SEQ (LETT |u| (SPADCALL |a| (QREFELT $ 93)) . #2#)
                               (EXIT
                                (COND
                                 ((QEQCAR |u| 0)
                                  (COND
                                   ((< (QCDR |u|) 0)
                                    (PROGN
                                     (LETT #1#
                                           (SEQ
                                            (LETT |d|
                                                  (SPADCALL
                                                   (SPADCALL |cc|
                                                             (LETT |sa|
                                                                   (|INTPM;insqrt|
                                                                    (SPADCALL
                                                                     |a|
                                                                     (QREFELT $
                                                                              69))
                                                                    $)
                                                                   . #2#)
                                                             (QREFELT $ 65))
                                                   |da| (QREFELT $ 47))
                                                  . #2#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |d| |x|
                                                          (QREFELT $ 90))
                                                (QREFELT $ 91))
                                               (VECTOR 2 |sa|
                                                       (SPADCALL
                                                        (SPADCALL |d|
                                                                  (QREFELT $
                                                                           44)
                                                                  (QREFELT $
                                                                           65))
                                                        (QREFELT $ 69))))
                                              (#3#
                                               (VECTOR 0 (|spadConstant| $ 37)
                                                       (|spadConstant| $
                                                                       37))))))
                                           . #2#)
                                     (GO #1#))))))))))
                        (EXIT
                         (VECTOR 0 (|spadConstant| $ 37)
                                 (|spadConstant| $ 37)))))
                      #1# (EXIT #1#))))))))))))) 

(DEFUN |INTPM;matchei| (|f| |x| $)
  (PROG (|d| |cc| |da| |a| |l| |res| |pat| |res0|)
    (RETURN
     (SEQ (LETT |res0| (SPADCALL (QREFELT $ 82)) . #1=(|INTPM;matchei|))
          (LETT |a| (SPADCALL (QREFELT $ 16) (QREFELT $ 18)) . #1#)
          (LETT |pat|
                (SPADCALL
                 (SPADCALL (QREFELT $ 21)
                           (SPADCALL |a| (QREFELT $ 29) (QREFELT $ 94))
                           (QREFELT $ 65))
                 (SPADCALL |a| (QREFELT $ 95)) (QREFELT $ 47))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #1#)
              (QREFELT $ 88))
             (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)))
            (#2='T
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (LETT |da|
                        (SPADCALL
                         (LETT |a| (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 89))
                               . #1#)
                         |x| (QREFELT $ 90))
                        . #1#)
                  (LETT |d|
                        (SPADCALL
                         (LETT |cc|
                               (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89))
                               . #1#)
                         |da| (QREFELT $ 47))
                        . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 90))
                               (QREFELT $ 91))
                     (VECTOR 1
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 45)
                                        (SPADCALL |l| (QREFELT $ 12)
                                                  (QREFELT $ 89))
                                        (QREFELT $ 68))
                              (SPADCALL |a| (QREFELT $ 95)) (QREFELT $ 65))
                             |d|))
                    (#2#
                     (VECTOR 0 (|spadConstant| $ 37)
                             (|spadConstant| $ 37))))))))))))) 

(DEFUN |INTPM;matchdilog| (|f| |x| $)
  (PROG (#1=#:G227 #2=#:G229 |l| #3=#:G230 |k| |df| |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 99)) . #4=(|INTPM;matchdilog|))
            (LETT |df|
                  (SPADCALL (LETT |d| (SPADCALL |f| (QREFELT $ 100)) . #4#)
                            (QREFELT $ 101))
                  . #4#)
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #4#)
                   (LETT #3#
                         (SPADCALL
                          (CONS #'|INTPM;matchdilog!0| (VECTOR $ |d| |n|))
                          (SPADCALL |n| (QREFELT $ 103)) (QREFELT $ 105))
                         . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (NULL
                         (LETT |l| (|INTPM;matchdilog0| |f| |k| |x| |n| |df| $)
                               . #4#)))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |l| . #4#) (GO #2#)) . #4#)
                        (GO #1#))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |INTPM;matchdilog!0| (|x1| $$)
  (PROG (|n| |d| $)
    (LETT |n| (QREFELT $$ 2) . #1=(|INTPM;matchdilog|))
    (LETT |d| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTPM;gooddilog?| |x1| |n| |d| $))))) 

(DEFUN |INTPM;matchdilog0| (|f| |k| |x| |p| |q| $)
  (PROG (|d| |a1| |da| |a|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |da|
               (SPADCALL
                (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT $ 107)))
                      . #1=(|INTPM;matchdilog0|))
                |x| (QREFELT $ 90))
               . #1#)
         (QREFELT $ 91))
        NIL)
       (#2='T
        (SEQ
         (LETT |a1| (SPADCALL (|spadConstant| $ 45) |a| (QREFELT $ 70)) . #1#)
         (LETT |d|
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| |k| (QREFELT $ 109)) 1
                            (QREFELT $ 111))
                  (QREFELT $ 101))
                 |a1| (QREFELT $ 65))
                (SPADCALL |q| |da| (QREFELT $ 65)) (QREFELT $ 47))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 90)) (QREFELT $ 91))
            (LIST |a| |d|
                  (SPADCALL |f|
                            (SPADCALL
                             (SPADCALL (SPADCALL |d| |da| (QREFELT $ 65))
                                       (SPADCALL |k| (QREFELT $ 113))
                                       (QREFELT $ 65))
                             |a1| (QREFELT $ 47))
                            (QREFELT $ 70))))
           (#2# NIL)))))))))) 

(DEFUN |INTPM;matchli| (|f| |x| $)
  (PROG (#1=#:G236 #2=#:G238 |l| #3=#:G239 |k| |d|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 100)) . #4=(|INTPM;matchli|))
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #4#)
                   (LETT #3#
                         (SPADCALL (CONS #'|INTPM;matchli!0| (VECTOR $ |d|))
                                   (SPADCALL |d| (QREFELT $ 103))
                                   (QREFELT $ 105))
                         . #4#)
                   G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (NULL
                         (LETT |l| (|INTPM;matchli0| |f| |k| |x| $) . #4#)))
                       (PROGN
                        (LETT #1# (PROGN (LETT #2# |l| . #4#) (GO #2#)) . #4#)
                        (GO #1#))))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |INTPM;matchli!0| (|x1| $$)
  (PROG (|d| $)
    (LETT |d| (QREFELT $$ 1) . #1=(|INTPM;matchli|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|INTPM;goodlilog?| |x1| |d| $))))) 

(DEFUN |INTPM;matchli0| (|f| |k| |x| $)
  (PROG (|d| |p| |u| |ug| |da| |a| |g| |lg|)
    (RETURN
     (SEQ
      (LETT |g|
            (SPADCALL
             (LETT |lg| (SPADCALL |k| (QREFELT $ 113)) . #1=(|INTPM;matchli0|))
             |f| (QREFELT $ 65))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL
          (LETT |da|
                (SPADCALL
                 (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT $ 107))) . #1#)
                 |x| (QREFELT $ 90))
                . #1#)
          (QREFELT $ 91))
         NIL)
        ((SPADCALL
          (SPADCALL (LETT |d| (SPADCALL |g| |da| (QREFELT $ 47)) . #1#) |x|
                    (QREFELT $ 90))
          (QREFELT $ 91))
         (LIST |a| |d| (|spadConstant| $ 37)))
        ('T
         (SEQ (LETT |ug| (SPADCALL |g| |k| (QREFELT $ 115)) . #1#)
              (LETT |u| (SPADCALL |ug| (QREFELT $ 118)) . #1#)
              (EXIT
               (COND
                ((OR (QEQCAR |u| 1)
                     (OR
                      (SPADCALL
                       (SPADCALL (LETT |p| (QCDR |u|) . #1#) (QREFELT $ 120)) 1
                       (QREFELT $ 121))
                      (NULL
                       (SPADCALL
                        (SPADCALL
                         (LETT |d|
                               (SPADCALL (SPADCALL |p| 0 (QREFELT $ 122)) |da|
                                         (QREFELT $ 47))
                               . #1#)
                         |x| (QREFELT $ 90))
                        (QREFELT $ 91)))))
                 NIL)
                ('T (LIST |a| |d| (SPADCALL |p| (QREFELT $ 123)))))))))))))) 

(DEFUN |INTPM;matchsici| (|f| |x| $)
  (PROG (|d| |nden| |ta| |dna| |na| |a_val| |l| #1=#:G254 |res| |ci0?| |ci?|
         |patci0| |patci| |patsi| |patden| |t| |a| |b| |res0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |res0| (SPADCALL (QREFELT $ 82)) . #2=(|INTPM;matchsici|))
            (LETT |b| (SPADCALL (QREFELT $ 17) (QREFELT $ 18)) . #2#)
            (LETT |t|
                  (SPADCALL
                   (LETT |a| (SPADCALL (QREFELT $ 16) (QREFELT $ 18)) . #2#)
                   (QREFELT $ 129))
                  . #2#)
            (LETT |patsi|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 21) |t| (QREFELT $ 65))
                             (QREFELT $ 127) (QREFELT $ 68))
                   (LETT |patden|
                         (SPADCALL |b|
                                   (SPADCALL (QREFELT $ 128)
                                             (SPADCALL |t| 2 (QREFELT $ 131))
                                             (QREFELT $ 65))
                                   (QREFELT $ 68))
                         . #2#)
                   (QREFELT $ 47))
                  . #2#)
            (LETT |patci|
                  (SPADCALL
                   (SPADCALL (QREFELT $ 21)
                             (SPADCALL
                              (SPADCALL (QREFELT $ 126) (QREFELT $ 18))
                              (SPADCALL |t| 2 (QREFELT $ 131)) (QREFELT $ 65))
                             (QREFELT $ 70))
                   |patden| (QREFELT $ 47))
                  . #2#)
            (LETT |patci0| (SPADCALL (QREFELT $ 21) |patden| (QREFELT $ 47))
                  . #2#)
            (SEQ
             (LETT |ci?|
                   (SPADCALL
                    (LETT |res|
                          (SPADCALL |f| (SPADCALL |patsi| (QREFELT $ 85))
                                    |res0| (QREFELT $ 87))
                          . #2#)
                    (QREFELT $ 88))
                   . #2#)
             (EXIT
              (COND
               (|ci?|
                (SEQ
                 (LETT |ci0?|
                       (SPADCALL
                        (LETT |res|
                              (SPADCALL |f| (SPADCALL |patci| (QREFELT $ 85))
                                        |res0| (QREFELT $ 87))
                              . #2#)
                        (QREFELT $ 88))
                       . #2#)
                 (EXIT
                  (COND
                   (|ci0?|
                    (COND
                     ((SPADCALL
                       (LETT |res|
                             (SPADCALL |f| (SPADCALL |patci0| (QREFELT $ 85))
                                       |res0| (QREFELT $ 87))
                             . #2#)
                       (QREFELT $ 88))
                      (PROGN
                       (LETT #1#
                             (VECTOR 0 (|spadConstant| $ 37)
                                     (|spadConstant| $ 37))
                             . #2#)
                       (GO #1#))))))))))))
            (LETT |l| (|INTPM;mkalist| |res| $) . #2#)
            (LETT |a_val| (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 89)) . #2#)
            (LETT |na|
                  (SPADCALL (SPADCALL 2 (QREFELT $ 46)) |a_val| (QREFELT $ 65))
                  . #2#)
            (LETT |dna| (SPADCALL |na| |x| (QREFELT $ 90)) . #2#)
            (EXIT
             (COND
              ((SPADCALL |dna| (|spadConstant| $ 37) (QREFELT $ 67))
               (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)))
              (#3='T
               (SEQ (LETT |ta| (SPADCALL |a_val| (QREFELT $ 129)) . #2#)
                    (LETT |nden|
                          (SPADCALL |na|
                                    (SPADCALL (SPADCALL |ta| 2 (QREFELT $ 131))
                                              (|spadConstant| $ 45)
                                              (QREFELT $ 68))
                                    (QREFELT $ 65))
                          . #2#)
                    (LETT |d|
                          (COND
                           (|ci?|
                            (COND
                             (|ci0?|
                              (SPADCALL (SPADCALL |f| |nden| (QREFELT $ 65))
                                        |dna| (QREFELT $ 47)))
                             (#3#
                              (SPADCALL (SPADCALL |f| |nden| (QREFELT $ 65))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 45)
                                                   (SPADCALL |ta| 2
                                                             (QREFELT $ 131))
                                                   (QREFELT $ 70))
                                         |dna| (QREFELT $ 65))
                                        (QREFELT $ 47)))))
                           (#3#
                            (SPADCALL (SPADCALL |f| |nden| (QREFELT $ 65))
                                      (SPADCALL |ta| |dna| (QREFELT $ 65))
                                      (QREFELT $ 47))))
                          . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 90))
                                 (QREFELT $ 91))
                       (COND
                        (|ci?|
                         (COND
                          (|ci0?|
                           (VECTOR 6 |na|
                                   (SPADCALL |d| (SPADCALL 2 (QREFELT $ 46))
                                             (QREFELT $ 47))))
                          (#3# (VECTOR 4 |na| |d|))))
                        (#3#
                         (VECTOR 3 |na|
                                 (SPADCALL |d| (SPADCALL 2 (QREFELT $ 46))
                                           (QREFELT $ 47))))))
                      (#3#
                       (VECTOR 0 (|spadConstant| $ 37)
                               (|spadConstant| $ 37)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTPM;matchfresnel| (|f| |x| $)
  (PROG (|prefactor| |newarg| |gamma| |ald| |al| |l| |linpart| |cx?| |resc|
         |sx?| |ress| |patc| |pats| |patden| |t| |a| |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL (QREFELT $ 17) (QREFELT $ 18))
            . #1=(|INTPM;matchfresnel|))
      (LETT |t|
            (SPADCALL (LETT |a| (SPADCALL (QREFELT $ 16) (QREFELT $ 18)) . #1#)
                      (QREFELT $ 129))
            . #1#)
      (LETT |patden|
            (SPADCALL (SPADCALL |t| 2 (QREFELT $ 131)) |b| (QREFELT $ 68))
            . #1#)
      (LETT |pats|
            (SPADCALL (SPADCALL (QREFELT $ 21) |t| (QREFELT $ 65)) |patden|
                      (QREFELT $ 47))
            . #1#)
      (LETT |patc| (SPADCALL (QREFELT $ 21) |patden| (QREFELT $ 47)) . #1#)
      (LETT |ress| (SPADCALL (QREFELT $ 82)) . #1#)
      (LETT |resc| (SPADCALL (QREFELT $ 82)) . #1#)
      (LETT |sx?|
            (SPADCALL
             (LETT |ress|
                   (SPADCALL |f| (SPADCALL |pats| (QREFELT $ 85)) |ress|
                             (QREFELT $ 87))
                   . #1#)
             (QREFELT $ 88))
            . #1#)
      (LETT |cx?|
            (SPADCALL
             (LETT |resc|
                   (SPADCALL |f| (SPADCALL |patc| (QREFELT $ 85)) |resc|
                             (QREFELT $ 87))
                   . #1#)
             (QREFELT $ 88))
            . #1#)
      (COND
       (|sx?|
        (COND
         (|cx?|
          (EXIT
           (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)
                   (|spadConstant| $ 37)))))))
      (EXIT
       (COND
        (|sx?|
         (COND
          (|cx?|
           (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)
                   (|spadConstant| $ 37)))
          (#2='T
           (SEQ (LETT |l| (|INTPM;mkalist| |resc| $) . #1#)
                (LETT |al|
                      (|INTPM;insqrt|
                       (SPADCALL
                        (SPADCALL (SPADCALL 4 (QREFELT $ 46))
                                  (SPADCALL (QREFELT $ 42)) (QREFELT $ 47))
                        (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 89))
                        (QREFELT $ 65))
                       $)
                      . #1#)
                (LETT |ald| (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89)) . #1#)
                (LETT |gamma|
                      (SPADCALL |ald| (SPADCALL |al| |x| (QREFELT $ 132))
                                (QREFELT $ 47))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |gamma| |x| (QREFELT $ 132))
                             (QREFELT $ 91))
                   (SEQ (LETT |newarg| |al| . #1#)
                        (LETT |prefactor|
                              (SPADCALL |gamma| (SPADCALL 2 (QREFELT $ 46))
                                        (QREFELT $ 47))
                              . #1#)
                        (LETT |linpart|
                              (SPADCALL |al| |prefactor| (QREFELT $ 65)) . #1#)
                        (EXIT (VECTOR 8 |newarg| |prefactor| |linpart|))))
                  (#2#
                   (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)
                           (|spadConstant| $ 37)))))))))
        (#2#
         (SEQ (LETT |l| (|INTPM;mkalist| |ress| $) . #1#)
              (LETT |al|
                    (|INTPM;insqrt|
                     (SPADCALL
                      (SPADCALL (SPADCALL 4 (QREFELT $ 46))
                                (SPADCALL (QREFELT $ 42)) (QREFELT $ 47))
                      (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 89))
                      (QREFELT $ 65))
                     $)
                    . #1#)
              (LETT |ald| (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89)) . #1#)
              (LETT |gamma|
                    (SPADCALL |ald| (SPADCALL |al| |x| (QREFELT $ 132))
                              (QREFELT $ 47))
                    . #1#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |gamma| |x| (QREFELT $ 132))
                           (QREFELT $ 91))
                 (SEQ (LETT |newarg| |al| . #1#)
                      (LETT |prefactor|
                            (SPADCALL |gamma| (SPADCALL 2 (QREFELT $ 46))
                                      (QREFELT $ 47))
                            . #1#)
                      (EXIT
                       (VECTOR 7 |newarg| |prefactor| (|spadConstant| $ 37)))))
                (#2#
                 (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)
                         (|spadConstant| $ 37))))))))))))) 

(DEFUN |INTPM;insqrt| (|y| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |y| 2 (QREFELT $ 135)) |INTPM;insqrt|)
          (EXIT
           (COND
            ((EQL (QVELT |rec| 0) 1)
             (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT $ 65)))
            ((SPADCALL (QVELT |rec| 0) 2 (QREFELT $ 136))
             (|error| "insqrt: should not happen"))
            ('T
             (SPADCALL (QVELT |rec| 1)
                       (SPADCALL (QVELT |rec| 2) (QREFELT $ 43))
                       (QREFELT $ 65))))))))) 

(DEFUN |INTPM;pmintegrate;FSU;14| (|f| |x| $)
  (PROG (|cse| |rec2| |rec| |l| |u| |rc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (QCAR
          (LETT |rc| (SPADCALL |f| |x| (QREFELT $ 64))
                . #1=(|INTPM;pmintegrate;FSU;14|)))
         (|spadConstant| $ 45) (QREFELT $ 137))
        (SEQ (LETT |u| (SPADCALL (QCDR |rc|) |x| (QREFELT $ 140)) . #1#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#2='T
                     (SEQ (LETT |rec| (QCDR |u|) . #1#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |rc|) (QCAR |rec|)
                                            (QREFELT $ 65))
                                  (SPADCALL (QCAR |rc|) (QCDR |rec|)
                                            (QREFELT $ 65)))))))))))
       ((NULL (NULL (LETT |l| (|INTPM;matchli| |f| |x| $) . #1#)))
        (CONS 0
              (CONS
               (SPADCALL (SPADCALL |l| (QREFELT $ 141))
                         (SPADCALL (|SPADfirst| |l|) (QREFELT $ 142))
                         (QREFELT $ 65))
               (SPADCALL |l| (QREFELT $ 143)))))
       ((NULL (NULL (LETT |l| (|INTPM;matchdilog| |f| |x| $) . #1#)))
        (CONS 0
              (CONS
               (SPADCALL (SPADCALL |l| (QREFELT $ 141))
                         (SPADCALL (|SPADfirst| |l|) (QREFELT $ 144))
                         (QREFELT $ 65))
               (SPADCALL |l| (QREFELT $ 143)))))
       ('T
        (SEQ
         (LETT |cse|
               (QVELT (LETT |rec| (|INTPM;matcherfei| |f| |x| 'NIL $) . #1#) 0)
               . #1#)
         (EXIT
          (COND
           ((EQL |cse| 1)
            (CONS 0
                  (CONS
                   (SPADCALL (QVELT |rec| 2)
                             (SPADCALL (QVELT |rec| 1) (QREFELT $ 145))
                             (QREFELT $ 65))
                   (|spadConstant| $ 37))))
           ((EQL |cse| 2)
            (CONS 0
                  (CONS
                   (SPADCALL (QVELT |rec| 2)
                             (SPADCALL (QVELT |rec| 1) (QREFELT $ 146))
                             (QREFELT $ 65))
                   (|spadConstant| $ 37))))
           (#2#
            (SEQ
             (LETT |cse|
                   (QVELT (LETT |rec| (|INTPM;matchsici| |f| |x| $) . #1#) 0)
                   . #1#)
             (EXIT
              (COND
               ((EQL |cse| 3)
                (CONS 0
                      (CONS
                       (SPADCALL (QVELT |rec| 2)
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 147))
                                 (QREFELT $ 65))
                       (|spadConstant| $ 37))))
               ((EQL |cse| 4)
                (CONS 0
                      (CONS
                       (SPADCALL (QVELT |rec| 2)
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 148))
                                 (QREFELT $ 65))
                       (|spadConstant| $ 37))))
               ((EQL |cse| 6)
                (CONS 0
                      (CONS
                       (SPADCALL
                        (SPADCALL (QVELT |rec| 2)
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 148))
                                  (QREFELT $ 65))
                        (SPADCALL (QVELT |rec| 2)
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 95))
                                  (QREFELT $ 65))
                        (QREFELT $ 68))
                       (|spadConstant| $ 37))))
               (#2#
                (SEQ
                 (LETT |cse|
                       (QVELT
                        (LETT |rec2| (|INTPM;matchfresnel| |f| |x| $) . #1#) 0)
                       . #1#)
                 (EXIT
                  (COND
                   ((EQL |cse| 7)
                    (CONS 0
                          (CONS
                           (SPADCALL
                            (SPADCALL (QVELT |rec2| 2)
                                      (SPADCALL (QVELT |rec2| 1)
                                                (QREFELT $ 149))
                                      (QREFELT $ 65))
                            (QVELT |rec2| 3) (QREFELT $ 68))
                           (|spadConstant| $ 37))))
                   ((EQL |cse| 8)
                    (CONS 0
                          (CONS
                           (SPADCALL
                            (SPADCALL (QVELT |rec2| 2)
                                      (SPADCALL (QVELT |rec2| 1)
                                                (QREFELT $ 150))
                                      (QREFELT $ 65))
                            (QVELT |rec2| 3) (QREFELT $ 68))
                           (|spadConstant| $ 37))))
                   (#2# (CONS 1 "failed"))))))))))))))))))) 

(DEFUN |INTPM;pmComplexintegrate;FSU;15| (|f| |x| $)
  (PROG (|cse| |rec| |u| |rc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (QCAR
          (LETT |rc| (SPADCALL |f| |x| (QREFELT $ 64))
                . #1=(|INTPM;pmComplexintegrate;FSU;15|)))
         (|spadConstant| $ 45) (QREFELT $ 137))
        (SEQ (LETT |u| (SPADCALL (QCDR |rc|) |x| (QREFELT $ 151)) . #1#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#2='T
                     (SEQ (LETT |rec| (QCDR |u|) . #1#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |rc|) (QCAR |rec|)
                                            (QREFELT $ 65))
                                  (SPADCALL (QCAR |rc|) (QCDR |rec|)
                                            (QREFELT $ 65)))))))))))
       (#2#
        (SEQ
         (LETT |cse|
               (QVELT (LETT |rec| (|INTPM;matcherfei| |f| |x| 'T $) . #1#) 0)
               . #1#)
         (EXIT
          (COND
           ((EQL |cse| 2)
            (CONS 0
                  (CONS
                   (SPADCALL (QVELT |rec| 2)
                             (SPADCALL (QVELT |rec| 1) (QREFELT $ 146))
                             (QREFELT $ 65))
                   (|spadConstant| $ 37))))
           (#2# (CONS 1 "failed"))))))))))) 

(DEFUN |INTPM;formula1| (|f| |x| |t| |cc| $)
  (PROG (#1=#:G311 |mmi| |mm| #2=#:G312 |sgz| |z| |sgs| |ms| |mw| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l| (|INTPM;match1| |f| |x| |t| |cc| $)
               . #3=(|INTPM;formula1|)))
        (CONS 1 "failed"))
       (#4='T
        (SEQ
         (EXIT
          (SEQ (LETT |mw| (|SPADfirst| |l|) . #3#)
               (COND
                ((SPADCALL (LETT |ms| (SPADCALL |l| (QREFELT $ 143)) . #3#)
                           (QREFELT $ 91))
                 (EXIT (CONS 1 #5="failed")))
                (#4#
                 (SEQ (LETT |sgs| (SPADCALL |ms| (QREFELT $ 93)) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |sgs| 1)
                         (PROGN (LETT #2# (CONS 1 #5#) . #3#) (GO #2#))))))))
               (SEQ
                (LETT |sgz|
                      (SPADCALL
                       (LETT |z|
                             (SPADCALL
                              (SPADCALL |mw| (|spadConstant| $ 45)
                                        (QREFELT $ 68))
                              |ms| (QREFELT $ 47))
                             . #3#)
                       (QREFELT $ 93))
                      . #3#)
                (EXIT
                 (COND
                  ((OR (QEQCAR |sgz| 1) (< (QCDR |sgz|) 0))
                   (PROGN (LETT #2# (CONS 1 "failed") . #3#) (GO #2#))))))
               (LETT |mmi|
                     (SPADCALL (LETT |mm| (SPADCALL |l| (QREFELT $ 141)) . #3#)
                               (QREFELT $ 152))
                     . #3#)
               (EXIT
                (CONS 0
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QCDR |sgs|) (SPADCALL |l| (QREFELT $ 153))
                                  (QREFELT $ 154))
                        (SPADCALL |ms| (- (- |mmi|) 1) (QREFELT $ 75))
                        (QREFELT $ 65))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                   (QREFELT $ 155))
                         |x|
                         (PROG1 (LETT #1# |mmi| . #3#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (QREFELT $ 156))
                        (LIST (SPADCALL |x| (QREFELT $ 157))) (LIST |z|)
                        (QREFELT $ 160))
                       (QREFELT $ 65))))))
         #2# (EXIT #2#)))))))) 

(DEFUN |INTPM;match1| (|f| |x| |t| |cc| $)
  (PROG (|l| |res| |pat| |res0|)
    (RETURN
     (SEQ (LETT |res0| (SPADCALL (QREFELT $ 82)) . #1=(|INTPM;match1|))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL |cc|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 95))
                                     (QREFELT $ 41) (QREFELT $ 94))
                           (QREFELT $ 65))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 94))
                            (QREFELT $ 69))
                  (QREFELT $ 83))
                 (QREFELT $ 65))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #1#)
              (QREFELT $ 88)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST (|spadConstant| $ 37)
                         (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 89))
                         (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 89))
                         (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 94))
                           (QREFELT $ 65))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 94))
                            (QREFELT $ 69))
                  (QREFELT $ 83))
                 (QREFELT $ 65))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #1#)
              (QREFELT $ 88)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 89))
                         (|spadConstant| $ 37)
                         (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 89))
                         (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 94))
                           (QREFELT $ 47))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 94))
                            (QREFELT $ 69))
                  (QREFELT $ 83))
                 (QREFELT $ 65))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #1#)
              (QREFELT $ 88)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST
                    (SPADCALL (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 89))
                              (QREFELT $ 69))
                    (|spadConstant| $ 37)
                    (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 89))
                    (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 94))
                            (QREFELT $ 65))
                  (SPADCALL (SPADCALL |t| (QREFELT $ 95)) (QREFELT $ 41)
                            (QREFELT $ 94))
                  (QREFELT $ 65))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 94))
                            (QREFELT $ 69))
                  (QREFELT $ 83))
                 (QREFELT $ 65))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #1#)
              (QREFELT $ 88)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 89))
                         (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 89))
                         (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 89))
                         (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 94))
                            (QREFELT $ 47))
                  (SPADCALL (SPADCALL |t| (QREFELT $ 95)) (QREFELT $ 41)
                            (QREFELT $ 94))
                  (QREFELT $ 65))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 94))
                            (QREFELT $ 69))
                  (QREFELT $ 83))
                 (QREFELT $ 65))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 85)) |res0|
                              (QREFELT $ 87))
                    . #1#)
              (QREFELT $ 88)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST
                    (SPADCALL (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 89))
                              (QREFELT $ 69))
                    (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 89))
                    (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 89))
                    (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 89))))))))
          (EXIT NIL))))) 

(DEFUN |INTPM;pmintegrate;FS2OcU;18| (|f| |x| |a| |b| $)
  (PROG ()
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (QREFELT $ 162))
        (COND
         ((EQL (SPADCALL |b| (QREFELT $ 164)) 1)
          (EXIT
           (|INTPM;formula1| |f| |x|
            (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 165))
            (SPADCALL (QREFELT $ 21)
                      (CONS #'|INTPM;pmintegrate;FS2OcU;18!0| (VECTOR $ |x|))
                      (QREFELT $ 28))
            $))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |INTPM;pmintegrate;FS2OcU;18!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTPM;pmintegrate;FS2OcU;18|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 166)))))) 

(DEFUN |PatternMatchIntegration| (&REST #1=#:G338)
  (PROG ()
    (RETURN
     (PROG (#2=#:G339)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchIntegration|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchIntegration|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternMatchIntegration;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternMatchIntegration|))))))))))) 

(DEFUN |PatternMatchIntegration;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchIntegration|))
       (LETT DV$2 (|devaluate| |#2|) . #1#)
       (LETT |dv$| (LIST '|PatternMatchIntegration| DV$1 DV$2) . #1#)
       (LETT $ (GETREFV 169) . #1#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3
                 (LETT |pv$|
                       (|buildPredVector| 0 0
                                          (LIST
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Integer|))))
                                            (|HasCategory| |#1|
                                                           '(|PatternMatchable|
                                                             (|Integer|)))
                                            (|HasCategory| |#2|
                                                           '(|SpecialFunctionCategory|)))
                                           (AND
                                            (|HasCategory| |#1|
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Integer|))))
                                            (|HasCategory| |#1|
                                                           '(|PatternMatchable|
                                                             (|Integer|)))
                                            (|HasCategory| |#2|
                                                           '(|LiouvillianFunctionCategory|)))))
                       . #1#))
       (|haddProp| |$ConstructorCache| '|PatternMatchIntegration|
                   (LIST DV$1 DV$2) (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 10 (SPADCALL (QREFELT $ 9)))
       (QSETREFV $ 12 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
       (QSETREFV $ 13 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
       (QSETREFV $ 14 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
       (QSETREFV $ 15 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
       (QSETREFV $ 16 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
       (QSETREFV $ 17 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
       (QSETREFV $ 21
                 (SPADCALL (SPADCALL (QREFELT $ 15) (QREFELT $ 18))
                           (QREFELT $ 20)))
       (QSETREFV $ 29
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 12) (QREFELT $ 18))
                            (QREFELT $ 20))
                  (CONS #'|PatternMatchIntegration!0| $) (QREFELT $ 28)))
       (QSETREFV $ 33
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 14) (QREFELT $ 18))
                            (QREFELT $ 20))
                  (CONS #'|PatternMatchIntegration!1| $) (QREFELT $ 28)))
       (QSETREFV $ 41
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 13) (QREFELT $ 18))
                            (QREFELT $ 20))
                  (CONS #'|PatternMatchIntegration!2| $) (QREFELT $ 28)))
       (QSETREFV $ 44 (SPADCALL (SPADCALL (QREFELT $ 42)) (QREFELT $ 43)))
       (QSETREFV $ 48
                 (SPADCALL (|spadConstant| $ 45) (SPADCALL 2 (QREFELT $ 46))
                           (QREFELT $ 47)))
       (QSETREFV $ 49
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT $ 42))
                            (SPADCALL 2 (QREFELT $ 46)) (QREFELT $ 47))
                  (QREFELT $ 43)))
       (QSETREFV $ 50
                 (SPADCALL
                  (SPADCALL (SPADCALL 2 (QREFELT $ 46))
                            (SPADCALL (QREFELT $ 42)) (QREFELT $ 47))
                  (QREFELT $ 43)))
       (COND
        ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
         (COND
          ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
           (PROGN
            (COND
             ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
              (PROGN
               (QSETREFV $ 124 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
               (QSETREFV $ 125 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
               (QSETREFV $ 126 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
               (QSETREFV $ 127
                         (SPADCALL (SPADCALL (QREFELT $ 124) (QREFELT $ 18))
                                   (QREFELT $ 20)))
               (QSETREFV $ 128
                         (SPADCALL (SPADCALL (QREFELT $ 125) (QREFELT $ 18))
                                   (QREFELT $ 20)))
               (QSETREFV $ 140
                         (CONS (|dispatchFunction| |INTPM;pmintegrate;FSU;14|)
                               $))
               (QSETREFV $ 151
                         (CONS
                          (|dispatchFunction|
                           |INTPM;pmComplexintegrate;FSU;15|)
                          $)))))
            (COND
             ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
              (PROGN
               (QSETREFV $ 168
                         (CONS
                          (|dispatchFunction| |INTPM;pmintegrate;FS2OcU;18|)
                          $))))))))))
       $))))) 

(DEFUN |PatternMatchIntegration!2| (|x1| $)
  (PROG (|zz|)
    (RETURN
     (SEQ (LETT |zz| (SPADCALL |x1| (QREFELT $ 35)) NIL)
          (EXIT
           (COND
            ((QEQCAR |zz| 0)
             (SPADCALL (QCDR |zz|) (|spadConstant| $ 39) (QREFELT $ 40)))
            ('T (|spadConstant| $ 32)))))))) 

(DEFUN |PatternMatchIntegration!1| (|x1| $)
  (COND
   ((SPADCALL (SPADCALL |x1| (QREFELT $ 23)) (QREFELT $ 25))
    (SPADCALL |x1| (QREFELT $ 31)))
   ('T (|spadConstant| $ 32)))) 

(DEFUN |PatternMatchIntegration!0| (|x1| $)
  (SPADCALL (SPADCALL |x1| (QREFELT $ 23)) (QREFELT $ 25))) 

(MAKEPROP '|PatternMatchIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) '|pm| (4 . |new|) '|pmw| '|pmm| '|pms| '|pmc| '|pma|
              '|pmb| (9 . |coerce|) (|FunctionSpaceAssertions| 6 7)
              (14 . |optional|) '|c| (|List| 8) (19 . |variables|) (|Boolean|)
              (24 . |empty?|) (|Mapping| 24 7)
              (|FunctionSpaceAttachPredicates| 6 7 7) (29 . |suchThat|) '|w|
              (|TrigonometricManipulations| 6 7) (35 . |real?|) (40 . |false|)
              '|s| (|Union| 38 '#1="failed") (44 . |retractIfCan|)
              (49 . |Zero|) (53 . |Zero|) (|Integer|) (57 . |Zero|) (61 . >=)
              '|m| (67 . |pi|) (71 . |sqrt|) '|spi| (76 . |One|)
              (80 . |coerce|) (85 . /) '|half| '|spio2| '|s2opi|
              (|Record| (|:| |key| 8) (|:| |entry| 7)) (|List| 51)
              (|PatternMatchResult| 38 7) (91 . |destruct|)
              (|AssociationList| 8 7) (96 . |construct|) (101 . |member?|)
              (107 . |One|) (|Union| 112 '#1#) (111 . |retractIfCan|)
              (|Union| 159 '#2="failed") (116 . |isTimes|)
              (|Record| (|:| |const| 7) (|:| |nconst| 7))
              |INTPM;splitConstant;FSR;2| (121 . *) (127 . |isPlus|) (132 . =)
              (138 . +) (144 . -) (149 . -)
              (|Record| (|:| |val| $) (|:| |exponent| 38)) (|Union| 71 '#2#)
              (155 . |isPower|) (160 . ~=) (166 . ^) (|Kernel| 7) (172 . |is?|)
              (|NonNegativeInteger|) (|SparseMultivariatePolynomial| 6 76)
              (178 . |minimumDegree|) (184 . |degree|) (190 . |new|)
              (194 . |exp|) (|Pattern| 38) (199 . |convert|)
              (|PatternMatchResult| 38 $) (204 . |patternMatch|)
              (211 . |failed?|) (216 . |elt|) (222 . |differentiate|)
              (228 . |zero?|) (|ElementaryFunctionSign| 6 7) (233 . |sign|)
              (238 . ^) (244 . |log|) (|Fraction| 38) (249 . |One|)
              (|SparseMultivariatePolynomial| 6 112) (253 . |numer|)
              (258 . |denom|) (263 . |coerce|) (|List| 76) (268 . |variables|)
              (|Mapping| 24 76) (273 . |select!|) (|List| 7) (279 . |argument|)
              (|SparseUnivariatePolynomial| $) (284 . |univariate|)
              (|SparseUnivariatePolynomial| 79) (290 . |coefficient|)
              (|Kernel| $) (296 . |coerce|) (|Fraction| 108)
              (301 . |univariate|) (|Union| 119 '"failed") (|Fraction| 119)
              (307 . |retractIfCan|) (|SparseUnivariatePolynomial| 7)
              (312 . |degree|) (317 . >) (323 . |coefficient|)
              (329 . |leadingCoefficient|) '|pmd| '|pme| '|pmf| '|opt_d|
              '|opt_e| (334 . |tan|) (|PositiveInteger|) (339 . ^) (345 . D)
              (|Record| (|:| |exponent| 78) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 76) 76 6 79 7)
              (351 . |froot|) (357 . ~=) (363 . ~=)
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 138 '"failed") (369 . |pmintegrate|) (375 . |second|)
              (380 . |li|) (385 . |third|) (390 . |dilog|) (395 . |Ei|)
              (400 . |erf|) (405 . |Si|) (410 . |Ci|) (415 . |fresnelS|)
              (420 . |fresnelC|) (425 . |pmComplexintegrate|) (431 . |retract|)
              (436 . |last|) (441 . *) (447 . |Gamma|) (452 . |differentiate|)
              (459 . |kernel|) (|List| 112) (|List| $) (464 . |eval|)
              (|OrderedCompletion| 7) (471 . |zero?|) (|SingleInteger|)
              (476 . |whatInfinity|) (481 . |constant|) (486 . |freeOf?|)
              (|Union| 7 '"failed") (492 . |pmintegrate|))
           '#(|splitConstant| 500 |pmintegrate| 506 |pmComplexintegrate| 520)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 168
                                                 '(0 8 0 9 1 8 0 0 11 1 7 0 8
                                                   18 1 19 7 7 20 1 7 22 0 23 1
                                                   22 24 0 25 2 27 7 7 26 28 1
                                                   30 24 7 31 0 24 0 32 1 7 34
                                                   0 35 0 6 0 36 0 7 0 37 0 38
                                                   0 39 2 38 24 0 0 40 0 7 0 42
                                                   1 7 0 0 43 0 7 0 45 1 7 0 38
                                                   46 2 7 0 0 0 47 1 53 52 0 54
                                                   1 55 0 52 56 2 22 24 8 0 57
                                                   0 6 0 58 1 7 59 0 60 1 7 61
                                                   0 62 2 7 0 0 0 65 1 7 61 0
                                                   66 2 7 24 0 0 67 2 7 0 0 0
                                                   68 1 7 0 0 69 2 7 0 0 0 70 1
                                                   7 72 0 73 2 38 24 0 0 74 2 7
                                                   0 0 38 75 2 76 24 0 8 77 2
                                                   79 78 0 76 80 2 79 78 0 76
                                                   81 0 53 0 82 1 7 0 0 83 1 7
                                                   84 0 85 3 7 86 0 84 86 87 1
                                                   53 24 0 88 2 55 7 0 8 89 2 7
                                                   0 0 8 90 1 7 24 0 91 1 92 34
                                                   7 93 2 7 0 0 0 94 1 7 0 0 95
                                                   0 96 0 97 1 7 98 0 99 1 7 98
                                                   0 100 1 7 0 98 101 1 79 102
                                                   0 103 2 102 0 104 0 105 1 76
                                                   106 0 107 2 79 108 0 76 109
                                                   2 110 79 0 78 111 1 7 0 112
                                                   113 2 7 114 0 112 115 1 117
                                                   116 0 118 1 119 78 0 120 2
                                                   78 24 0 0 121 2 119 7 0 78
                                                   122 1 119 7 0 123 1 7 0 0
                                                   129 2 7 0 0 130 131 2 7 0 0
                                                   8 132 2 134 133 7 78 135 2
                                                   78 24 0 0 136 2 7 24 0 0 137
                                                   2 0 139 7 8 140 1 106 7 0
                                                   141 1 7 0 0 142 1 106 7 0
                                                   143 1 7 0 0 144 1 7 0 0 145
                                                   1 7 0 0 146 1 7 0 0 147 1 7
                                                   0 0 148 1 7 0 0 149 1 7 0 0
                                                   150 2 0 139 7 8 151 1 7 38 0
                                                   152 1 106 7 0 153 2 7 0 38 0
                                                   154 1 7 0 0 155 3 7 0 0 8 78
                                                   156 1 76 0 8 157 3 7 0 0 158
                                                   159 160 1 161 24 0 162 1 161
                                                   163 0 164 1 19 7 7 165 2 7
                                                   24 0 8 166 4 0 167 7 8 161
                                                   161 168 2 0 63 7 8 64 2 2
                                                   139 7 8 140 4 1 167 7 8 161
                                                   161 168 2 2 139 7 8 151)))))
           '|lookupComplete|)) 
