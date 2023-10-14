
(/VERSIONCHECK 2) 

(DEFUN |INTPM;mkalist| (|res| $)
  (SPADCALL (SPADCALL |res| (QREFELT $ 52)) (QREFELT $ 54))) 

(DEFUN |INTPM;splitConstant;FSR;2| (|f| |x| $)
  (PROG (#1=#:G200 |rec| |vv| |v| |cc| #2=#:G202 |g| |nc| |u| #3=#:G201)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (SPADCALL |x| (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 55)))
         (CONS |f| (|spadConstant| $ 45)))
        ('T
         (COND
          ((QEQCAR (SPADCALL |f| (QREFELT $ 58)) 0)
           (CONS (|spadConstant| $ 45) |f|))
          (#4='T
           (SEQ
            (LETT |u| (SPADCALL |f| (QREFELT $ 60))
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
                          (LETT |rec| (SPADCALL |g| |x| (QREFELT $ 62)) . #5#)
                          (LETT |cc|
                                (SPADCALL |cc| (QCAR |rec|) (QREFELT $ 63))
                                . #5#)
                          (EXIT
                           (LETT |nc|
                                 (SPADCALL |nc| (QCDR |rec|) (QREFELT $ 63))
                                 . #5#)))
                         (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                    (EXIT (CONS |cc| |nc|))))
              (#4#
               (SEQ (LETT |u| (SPADCALL |f| (QREFELT $ 64)) . #5#)
                    (EXIT
                     (COND
                      ((QEQCAR |u| 0)
                       (SEQ
                        (LETT |rec|
                              (SPADCALL (|SPADfirst| (QCDR |u|)) |x|
                                        (QREFELT $ 62))
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
                              (LETT |rec| (SPADCALL |g| |x| (QREFELT $ 62))
                                    . #5#)
                              (EXIT
                               (COND
                                ((SPADCALL (QCDR |rec|) |nc| (QREFELT $ 65))
                                 (LETT |cc|
                                       (SPADCALL |cc| (QCAR |rec|)
                                                 (QREFELT $ 66))
                                       . #5#))
                                ((SPADCALL (QCDR |rec|)
                                           (SPADCALL |nc| (QREFELT $ 67))
                                           (QREFELT $ 65))
                                 (LETT |cc|
                                       (SPADCALL |cc| (QCAR |rec|)
                                                 (QREFELT $ 68))
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
                        (SEQ (LETT |v| (SPADCALL |f| (QREFELT $ 71)) . #5#)
                             (EXIT
                              (COND
                               ((QEQCAR |v| 0)
                                (SEQ (LETT |vv| (QCDR |v|) . #5#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QCDR |vv|) 1 (QREFELT $ 72))
                                        (SEQ
                                         (LETT |rec|
                                               (SPADCALL (QCAR |vv|) |x|
                                                         (QREFELT $ 62))
                                               . #5#)
                                         (EXIT
                                          (PROGN
                                           (LETT #1#
                                                 (CONS
                                                  (SPADCALL (QCAR |rec|)
                                                            (QCDR |vv|)
                                                            (QREFELT $ 73))
                                                  (SPADCALL (QCDR |rec|)
                                                            (QCDR |vv|)
                                                            (QREFELT $ 73)))
                                                 . #5#)
                                           (GO #1#))))))))))))
                        (EXIT
                         (|error|
                          "splitConstant: should not happen"))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |INTPM;goodlilog?| (|k| |p| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 75))
    (EQL (SPADCALL |p| |k| (QREFELT $ 78)) 1))
   ('T 'NIL))) 

(DEFUN |INTPM;gooddilog?| (|k| |p| |q| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 75))
    (COND
     ((EQL (SPADCALL |p| |k| (QREFELT $ 79)) 1)
      (ZEROP (SPADCALL |q| |k| (QREFELT $ 79))))
     (#1='T 'NIL)))
   (#1# 'NIL))) 

(DEFUN |INTPM;matcherfei| (|f| |x| |comp?| $)
  (PROG (#1=#:G215 |d| |sa| |u| |cc| |da| |a| |l| |res| |pat| |res0|)
    (RETURN
     (SEQ (LETT |res0| (SPADCALL (QREFELT $ 80)) . #2=(|INTPM;matcherfei|))
          (LETT |pat|
                (SPADCALL (QREFELT $ 21)
                          (SPADCALL (SPADCALL (QREFELT $ 16) (QREFELT $ 18))
                                    (QREFELT $ 81))
                          (QREFELT $ 63))
                . #2#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #2#)
              (QREFELT $ 86))
             (COND
              (|comp?| (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)))
              (#3='T (|INTPM;matchei| |f| |x| $))))
            (#3#
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #2#)
                  (LETT |da|
                        (SPADCALL
                         (LETT |a| (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 87))
                               . #2#)
                         |x| (QREFELT $ 88))
                        . #2#)
                  (LETT |d|
                        (SPADCALL
                         (SPADCALL |a|
                                   (LETT |cc|
                                         (SPADCALL |l| (QREFELT $ 15)
                                                   (QREFELT $ 87))
                                         . #2#)
                                   (QREFELT $ 63))
                         |da| (QREFELT $ 47))
                        . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 88))
                               (QREFELT $ 89))
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
                                                              (QREFELT $ 67))
                                                    $)
                                                   . #2#)
                                             (QREFELT $ 63))
                                   |da| (QREFELT $ 47))
                                  . #2#)
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 88))
                                         (QREFELT $ 89))
                               (VECTOR 2 |sa|
                                       (SPADCALL
                                        (SPADCALL |d| (QREFELT $ 44)
                                                  (QREFELT $ 63))
                                        (QREFELT $ 67))))
                              (#3#
                               (VECTOR 0 (|spadConstant| $ 37)
                                       (|spadConstant| $ 37))))))))
                         (#3#
                          (SEQ (LETT |u| (SPADCALL |a| (QREFELT $ 91)) . #2#)
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
                                                                              67))
                                                                    $)
                                                                   . #2#)
                                                             (QREFELT $ 63))
                                                   |da| (QREFELT $ 47))
                                                  . #2#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |d| |x|
                                                          (QREFELT $ 88))
                                                (QREFELT $ 89))
                                               (VECTOR 2 |sa|
                                                       (SPADCALL
                                                        (SPADCALL |d|
                                                                  (QREFELT $
                                                                           44)
                                                                  (QREFELT $
                                                                           63))
                                                        (QREFELT $ 67))))
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
     (SEQ (LETT |res0| (SPADCALL (QREFELT $ 80)) . #1=(|INTPM;matchei|))
          (LETT |a| (SPADCALL (QREFELT $ 16) (QREFELT $ 18)) . #1#)
          (LETT |pat|
                (SPADCALL
                 (SPADCALL (QREFELT $ 21)
                           (SPADCALL |a| (QREFELT $ 29) (QREFELT $ 92))
                           (QREFELT $ 63))
                 (SPADCALL |a| (QREFELT $ 93)) (QREFELT $ 47))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #1#)
              (QREFELT $ 86))
             (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)))
            (#2='T
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (LETT |da|
                        (SPADCALL
                         (LETT |a| (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 87))
                               . #1#)
                         |x| (QREFELT $ 88))
                        . #1#)
                  (LETT |d|
                        (SPADCALL
                         (LETT |cc|
                               (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 87))
                               . #1#)
                         |da| (QREFELT $ 47))
                        . #1#)
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 88))
                               (QREFELT $ 89))
                     (VECTOR 1
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 45)
                                        (SPADCALL |l| (QREFELT $ 12)
                                                  (QREFELT $ 87))
                                        (QREFELT $ 66))
                              (SPADCALL |a| (QREFELT $ 93)) (QREFELT $ 63))
                             |d|))
                    (#2#
                     (VECTOR 0 (|spadConstant| $ 37)
                             (|spadConstant| $ 37))))))))))))) 

(DEFUN |INTPM;matchdilog| (|f| |x| $)
  (PROG (#1=#:G225 #2=#:G227 |l| #3=#:G228 |k| |df| |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 97)) . #4=(|INTPM;matchdilog|))
            (LETT |df|
                  (SPADCALL (LETT |d| (SPADCALL |f| (QREFELT $ 98)) . #4#)
                            (QREFELT $ 99))
                  . #4#)
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #4#)
                   (LETT #3#
                         (SPADCALL
                          (CONS #'|INTPM;matchdilog!0| (VECTOR $ |d| |n|))
                          (SPADCALL |n| (QREFELT $ 101)) (QREFELT $ 103))
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
                (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT $ 105)))
                      . #1=(|INTPM;matchdilog0|))
                |x| (QREFELT $ 88))
               . #1#)
         (QREFELT $ 89))
        NIL)
       (#2='T
        (SEQ
         (LETT |a1| (SPADCALL (|spadConstant| $ 45) |a| (QREFELT $ 68)) . #1#)
         (LETT |d|
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |p| |k| (QREFELT $ 107)) 1
                            (QREFELT $ 109))
                  (QREFELT $ 99))
                 |a1| (QREFELT $ 63))
                (SPADCALL |q| |da| (QREFELT $ 63)) (QREFELT $ 47))
               . #1#)
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 88)) (QREFELT $ 89))
            (LIST |a| |d|
                  (SPADCALL |f|
                            (SPADCALL
                             (SPADCALL (SPADCALL |d| |da| (QREFELT $ 63))
                                       (SPADCALL |k| (QREFELT $ 111))
                                       (QREFELT $ 63))
                             |a1| (QREFELT $ 47))
                            (QREFELT $ 68))))
           (#2# NIL)))))))))) 

(DEFUN |INTPM;matchli| (|f| |x| $)
  (PROG (#1=#:G234 #2=#:G236 |l| #3=#:G237 |k| |d|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |d| (SPADCALL |f| (QREFELT $ 98)) . #4=(|INTPM;matchli|))
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #4#)
                   (LETT #3#
                         (SPADCALL (CONS #'|INTPM;matchli!0| (VECTOR $ |d|))
                                   (SPADCALL |d| (QREFELT $ 101))
                                   (QREFELT $ 103))
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
             (LETT |lg| (SPADCALL |k| (QREFELT $ 111)) . #1=(|INTPM;matchli0|))
             |f| (QREFELT $ 63))
            . #1#)
      (EXIT
       (COND
        ((SPADCALL
          (LETT |da|
                (SPADCALL
                 (LETT |a| (|SPADfirst| (SPADCALL |k| (QREFELT $ 105))) . #1#)
                 |x| (QREFELT $ 88))
                . #1#)
          (QREFELT $ 89))
         NIL)
        ((SPADCALL
          (SPADCALL (LETT |d| (SPADCALL |g| |da| (QREFELT $ 47)) . #1#) |x|
                    (QREFELT $ 88))
          (QREFELT $ 89))
         (LIST |a| |d| (|spadConstant| $ 37)))
        ('T
         (SEQ (LETT |ug| (SPADCALL |g| |k| (QREFELT $ 113)) . #1#)
              (LETT |u| (SPADCALL |ug| (QREFELT $ 116)) . #1#)
              (EXIT
               (COND
                ((OR (QEQCAR |u| 1)
                     (OR
                      (SPADCALL
                       (SPADCALL (LETT |p| (QCDR |u|) . #1#) (QREFELT $ 118)) 1
                       (QREFELT $ 119))
                      (NULL
                       (SPADCALL
                        (SPADCALL
                         (LETT |d|
                               (SPADCALL (SPADCALL |p| 0 (QREFELT $ 120)) |da|
                                         (QREFELT $ 47))
                               . #1#)
                         |x| (QREFELT $ 88))
                        (QREFELT $ 89)))))
                 NIL)
                ('T (LIST |a| |d| (SPADCALL |p| (QREFELT $ 121)))))))))))))) 

(DEFUN |INTPM;matchsici| (|f| |x| $)
  (PROG (|d| |nden| |ta| |dna| |na| |a_val| |l| #1=#:G252 |res| |ci0?| |ci?|
         |patci0| |patci| |patsi| |patden| |t| |a| |b| |res0|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |res0| (SPADCALL (QREFELT $ 80)) . #2=(|INTPM;matchsici|))
            (LETT |b| (SPADCALL (QREFELT $ 17) (QREFELT $ 18)) . #2#)
            (LETT |t|
                  (SPADCALL
                   (LETT |a| (SPADCALL (QREFELT $ 16) (QREFELT $ 18)) . #2#)
                   (QREFELT $ 127))
                  . #2#)
            (LETT |patsi|
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT $ 21) |t| (QREFELT $ 63))
                             (QREFELT $ 125) (QREFELT $ 66))
                   (LETT |patden|
                         (SPADCALL |b|
                                   (SPADCALL (QREFELT $ 126)
                                             (SPADCALL |t| 2 (QREFELT $ 129))
                                             (QREFELT $ 63))
                                   (QREFELT $ 66))
                         . #2#)
                   (QREFELT $ 47))
                  . #2#)
            (LETT |patci|
                  (SPADCALL
                   (SPADCALL (QREFELT $ 21)
                             (SPADCALL
                              (SPADCALL (QREFELT $ 124) (QREFELT $ 18))
                              (SPADCALL |t| 2 (QREFELT $ 129)) (QREFELT $ 63))
                             (QREFELT $ 68))
                   |patden| (QREFELT $ 47))
                  . #2#)
            (LETT |patci0| (SPADCALL (QREFELT $ 21) |patden| (QREFELT $ 47))
                  . #2#)
            (SEQ
             (LETT |ci?|
                   (SPADCALL
                    (LETT |res|
                          (SPADCALL |f| (SPADCALL |patsi| (QREFELT $ 83))
                                    |res0| (QREFELT $ 85))
                          . #2#)
                    (QREFELT $ 86))
                   . #2#)
             (EXIT
              (COND
               (|ci?|
                (SEQ
                 (LETT |ci0?|
                       (SPADCALL
                        (LETT |res|
                              (SPADCALL |f| (SPADCALL |patci| (QREFELT $ 83))
                                        |res0| (QREFELT $ 85))
                              . #2#)
                        (QREFELT $ 86))
                       . #2#)
                 (EXIT
                  (COND
                   (|ci0?|
                    (COND
                     ((SPADCALL
                       (LETT |res|
                             (SPADCALL |f| (SPADCALL |patci0| (QREFELT $ 83))
                                       |res0| (QREFELT $ 85))
                             . #2#)
                       (QREFELT $ 86))
                      (PROGN
                       (LETT #1#
                             (VECTOR 0 (|spadConstant| $ 37)
                                     (|spadConstant| $ 37))
                             . #2#)
                       (GO #1#))))))))))))
            (LETT |l| (|INTPM;mkalist| |res| $) . #2#)
            (LETT |a_val| (SPADCALL |l| (QREFELT $ 16) (QREFELT $ 87)) . #2#)
            (LETT |na|
                  (SPADCALL (SPADCALL 2 (QREFELT $ 46)) |a_val| (QREFELT $ 63))
                  . #2#)
            (LETT |dna| (SPADCALL |na| |x| (QREFELT $ 88)) . #2#)
            (EXIT
             (COND
              ((SPADCALL |dna| (|spadConstant| $ 37) (QREFELT $ 65))
               (VECTOR 0 (|spadConstant| $ 37) (|spadConstant| $ 37)))
              (#3='T
               (SEQ (LETT |ta| (SPADCALL |a_val| (QREFELT $ 127)) . #2#)
                    (LETT |nden|
                          (SPADCALL |na|
                                    (SPADCALL (SPADCALL |ta| 2 (QREFELT $ 129))
                                              (|spadConstant| $ 45)
                                              (QREFELT $ 66))
                                    (QREFELT $ 63))
                          . #2#)
                    (LETT |d|
                          (COND
                           (|ci?|
                            (COND
                             (|ci0?|
                              (SPADCALL (SPADCALL |f| |nden| (QREFELT $ 63))
                                        |dna| (QREFELT $ 47)))
                             (#3#
                              (SPADCALL (SPADCALL |f| |nden| (QREFELT $ 63))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 45)
                                                   (SPADCALL |ta| 2
                                                             (QREFELT $ 129))
                                                   (QREFELT $ 68))
                                         |dna| (QREFELT $ 63))
                                        (QREFELT $ 47)))))
                           (#3#
                            (SPADCALL (SPADCALL |f| |nden| (QREFELT $ 63))
                                      (SPADCALL |ta| |dna| (QREFELT $ 63))
                                      (QREFELT $ 47))))
                          . #2#)
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |d| |x| (QREFELT $ 88))
                                 (QREFELT $ 89))
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

(DEFUN |INTPM;insqrt| (|y| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (SPADCALL |y| 2 (QREFELT $ 132)) |INTPM;insqrt|)
          (EXIT
           (COND
            ((EQL (QVELT |rec| 0) 1)
             (SPADCALL (QVELT |rec| 1) (QVELT |rec| 2) (QREFELT $ 63)))
            ((SPADCALL (QVELT |rec| 0) 2 (QREFELT $ 133))
             (|error| "insqrt: should not happen"))
            ('T
             (SPADCALL (QVELT |rec| 1)
                       (SPADCALL (QVELT |rec| 2) (QREFELT $ 43))
                       (QREFELT $ 63))))))))) 

(DEFUN |INTPM;pmintegrate;FSU;13| (|f| |x| $)
  (PROG (|cse| |rec| |l| |u| |rc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (QCAR
          (LETT |rc| (SPADCALL |f| |x| (QREFELT $ 62))
                . #1=(|INTPM;pmintegrate;FSU;13|)))
         (|spadConstant| $ 45) (QREFELT $ 134))
        (SEQ (LETT |u| (SPADCALL (QCDR |rc|) |x| (QREFELT $ 137)) . #1#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#2='T
                     (SEQ (LETT |rec| (QCDR |u|) . #1#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |rc|) (QCAR |rec|)
                                            (QREFELT $ 63))
                                  (SPADCALL (QCAR |rc|) (QCDR |rec|)
                                            (QREFELT $ 63)))))))))))
       ((NULL (NULL (LETT |l| (|INTPM;matchli| |f| |x| $) . #1#)))
        (CONS 0
              (CONS
               (SPADCALL (SPADCALL |l| (QREFELT $ 138))
                         (SPADCALL (|SPADfirst| |l|) (QREFELT $ 139))
                         (QREFELT $ 63))
               (SPADCALL |l| (QREFELT $ 140)))))
       ((NULL (NULL (LETT |l| (|INTPM;matchdilog| |f| |x| $) . #1#)))
        (CONS 0
              (CONS
               (SPADCALL (SPADCALL |l| (QREFELT $ 138))
                         (SPADCALL (|SPADfirst| |l|) (QREFELT $ 141))
                         (QREFELT $ 63))
               (SPADCALL |l| (QREFELT $ 140)))))
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
                             (SPADCALL (QVELT |rec| 1) (QREFELT $ 142))
                             (QREFELT $ 63))
                   (|spadConstant| $ 37))))
           ((EQL |cse| 2)
            (CONS 0
                  (CONS
                   (SPADCALL (QVELT |rec| 2)
                             (SPADCALL (QVELT |rec| 1) (QREFELT $ 143))
                             (QREFELT $ 63))
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
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 144))
                                 (QREFELT $ 63))
                       (|spadConstant| $ 37))))
               ((EQL |cse| 4)
                (CONS 0
                      (CONS
                       (SPADCALL (QVELT |rec| 2)
                                 (SPADCALL (QVELT |rec| 1) (QREFELT $ 145))
                                 (QREFELT $ 63))
                       (|spadConstant| $ 37))))
               ((EQL |cse| 6)
                (CONS 0
                      (CONS
                       (SPADCALL
                        (SPADCALL (QVELT |rec| 2)
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 145))
                                  (QREFELT $ 63))
                        (SPADCALL (QVELT |rec| 2)
                                  (SPADCALL (QVELT |rec| 1) (QREFELT $ 93))
                                  (QREFELT $ 63))
                        (QREFELT $ 66))
                       (|spadConstant| $ 37))))
               (#2# (CONS 1 "failed"))))))))))))))) 

(DEFUN |INTPM;pmComplexintegrate;FSU;14| (|f| |x| $)
  (PROG (|cse| |rec| |u| |rc|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (QCAR
          (LETT |rc| (SPADCALL |f| |x| (QREFELT $ 62))
                . #1=(|INTPM;pmComplexintegrate;FSU;14|)))
         (|spadConstant| $ 45) (QREFELT $ 134))
        (SEQ (LETT |u| (SPADCALL (QCDR |rc|) |x| (QREFELT $ 146)) . #1#)
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#2='T
                     (SEQ (LETT |rec| (QCDR |u|) . #1#)
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |rc|) (QCAR |rec|)
                                            (QREFELT $ 63))
                                  (SPADCALL (QCAR |rc|) (QCDR |rec|)
                                            (QREFELT $ 63)))))))))))
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
                             (SPADCALL (QVELT |rec| 1) (QREFELT $ 143))
                             (QREFELT $ 63))
                   (|spadConstant| $ 37))))
           (#2# (CONS 1 "failed"))))))))))) 

(DEFUN |INTPM;formula1| (|f| |x| |t| |cc| $)
  (PROG (#1=#:G300 |mmi| |mm| #2=#:G301 |sgz| |z| |sgs| |ms| |mw| |l|)
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
                ((SPADCALL (LETT |ms| (SPADCALL |l| (QREFELT $ 140)) . #3#)
                           (QREFELT $ 89))
                 (EXIT (CONS 1 #5="failed")))
                (#4#
                 (SEQ (LETT |sgs| (SPADCALL |ms| (QREFELT $ 91)) . #3#)
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
                                        (QREFELT $ 66))
                              |ms| (QREFELT $ 47))
                             . #3#)
                       (QREFELT $ 91))
                      . #3#)
                (EXIT
                 (COND
                  ((OR (QEQCAR |sgz| 1) (< (QCDR |sgz|) 0))
                   (PROGN (LETT #2# (CONS 1 "failed") . #3#) (GO #2#))))))
               (LETT |mmi|
                     (SPADCALL (LETT |mm| (SPADCALL |l| (QREFELT $ 138)) . #3#)
                               (QREFELT $ 147))
                     . #3#)
               (EXIT
                (CONS 0
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QCDR |sgs|) (SPADCALL |l| (QREFELT $ 148))
                                  (QREFELT $ 149))
                        (SPADCALL |ms| (- (- |mmi|) 1) (QREFELT $ 73))
                        (QREFELT $ 63))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT $ 18))
                                   (QREFELT $ 150))
                         |x|
                         (PROG1 (LETT #1# |mmi| . #3#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (QREFELT $ 151))
                        (LIST (SPADCALL |x| (QREFELT $ 152))) (LIST |z|)
                        (QREFELT $ 155))
                       (QREFELT $ 63))))))
         #2# (EXIT #2#)))))))) 

(DEFUN |INTPM;match1| (|f| |x| |t| |cc| $)
  (PROG (|l| |res| |pat| |res0|)
    (RETURN
     (SEQ (LETT |res0| (SPADCALL (QREFELT $ 80)) . #1=(|INTPM;match1|))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL |cc|
                           (SPADCALL (SPADCALL |t| (QREFELT $ 93))
                                     (QREFELT $ 41) (QREFELT $ 92))
                           (QREFELT $ 63))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 92))
                            (QREFELT $ 67))
                  (QREFELT $ 81))
                 (QREFELT $ 63))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #1#)
              (QREFELT $ 86)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST (|spadConstant| $ 37)
                         (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 87))
                         (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 87))
                         (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 87))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 92))
                           (QREFELT $ 63))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 92))
                            (QREFELT $ 67))
                  (QREFELT $ 81))
                 (QREFELT $ 63))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #1#)
              (QREFELT $ 86)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 87))
                         (|spadConstant| $ 37)
                         (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 87))
                         (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 87))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 92))
                           (QREFELT $ 47))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 92))
                            (QREFELT $ 67))
                  (QREFELT $ 81))
                 (QREFELT $ 63))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #1#)
              (QREFELT $ 86)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST
                    (SPADCALL (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 87))
                              (QREFELT $ 67))
                    (|spadConstant| $ 37)
                    (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 87))
                    (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 87))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 92))
                            (QREFELT $ 63))
                  (SPADCALL (SPADCALL |t| (QREFELT $ 93)) (QREFELT $ 41)
                            (QREFELT $ 92))
                  (QREFELT $ 63))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 92))
                            (QREFELT $ 67))
                  (QREFELT $ 81))
                 (QREFELT $ 63))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #1#)
              (QREFELT $ 86)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 87))
                         (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 87))
                         (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 87))
                         (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 87))))))))
          (LETT |pat|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |cc| (SPADCALL |t| (QREFELT $ 29) (QREFELT $ 92))
                            (QREFELT $ 47))
                  (SPADCALL (SPADCALL |t| (QREFELT $ 93)) (QREFELT $ 41)
                            (QREFELT $ 92))
                  (QREFELT $ 63))
                 (SPADCALL
                  (SPADCALL (SPADCALL |t| (QREFELT $ 33) (QREFELT $ 92))
                            (QREFELT $ 67))
                  (QREFELT $ 81))
                 (QREFELT $ 63))
                . #1#)
          (COND
           ((NULL
             (SPADCALL
              (LETT |res|
                    (SPADCALL |f| (SPADCALL |pat| (QREFELT $ 83)) |res0|
                              (QREFELT $ 85))
                    . #1#)
              (QREFELT $ 86)))
            (EXIT
             (SEQ (LETT |l| (|INTPM;mkalist| |res| $) . #1#)
                  (EXIT
                   (LIST
                    (SPADCALL (SPADCALL |l| (QREFELT $ 12) (QREFELT $ 87))
                              (QREFELT $ 67))
                    (SPADCALL |l| (QREFELT $ 13) (QREFELT $ 87))
                    (SPADCALL |l| (QREFELT $ 14) (QREFELT $ 87))
                    (SPADCALL |l| (QREFELT $ 15) (QREFELT $ 87))))))))
          (EXIT NIL))))) 

(DEFUN |INTPM;pmintegrate;FS2OcU;17| (|f| |x| |a| |b| $)
  (PROG ()
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (QREFELT $ 157))
        (COND
         ((EQL (SPADCALL |b| (QREFELT $ 159)) 1)
          (EXIT
           (|INTPM;formula1| |f| |x|
            (SPADCALL (SPADCALL |x| (QREFELT $ 18)) (QREFELT $ 160))
            (SPADCALL (QREFELT $ 21)
                      (CONS #'|INTPM;pmintegrate;FS2OcU;17!0| (VECTOR $ |x|))
                      (QREFELT $ 28))
            $))))))
      (EXIT (CONS 1 "failed")))))) 

(DEFUN |INTPM;pmintegrate;FS2OcU;17!0| (|x1| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|INTPM;pmintegrate;FS2OcU;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 161)))))) 

(DEFUN |PatternMatchIntegration| (&REST #1=#:G327)
  (PROG ()
    (RETURN
     (PROG (#2=#:G328)
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
       (LETT $ (GETREFV 164) . #1#)
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
       (COND
        ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
         (COND
          ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
           (PROGN
            (COND
             ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
              (PROGN
               (QSETREFV $ 122 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
               (QSETREFV $ 123 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
               (QSETREFV $ 124 (SPADCALL (QREFELT $ 10) (QREFELT $ 11)))
               (QSETREFV $ 125
                         (SPADCALL (SPADCALL (QREFELT $ 122) (QREFELT $ 18))
                                   (QREFELT $ 20)))
               (QSETREFV $ 126
                         (SPADCALL (SPADCALL (QREFELT $ 123) (QREFELT $ 18))
                                   (QREFELT $ 20)))
               (QSETREFV $ 137
                         (CONS (|dispatchFunction| |INTPM;pmintegrate;FSU;13|)
                               $))
               (QSETREFV $ 146
                         (CONS
                          (|dispatchFunction|
                           |INTPM;pmComplexintegrate;FSU;14|)
                          $)))))
            (COND
             ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
              (PROGN
               (QSETREFV $ 163
                         (CONS
                          (|dispatchFunction| |INTPM;pmintegrate;FS2OcU;17|)
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
              (80 . |coerce|) (85 . /) '|half|
              (|Record| (|:| |key| 8) (|:| |entry| 7)) (|List| 49)
              (|PatternMatchResult| 38 7) (91 . |destruct|)
              (|AssociationList| 8 7) (96 . |construct|) (101 . |member?|)
              (107 . |One|) (|Union| 110 '#1#) (111 . |retractIfCan|)
              (|Union| 154 '#2="failed") (116 . |isTimes|)
              (|Record| (|:| |const| 7) (|:| |nconst| 7))
              |INTPM;splitConstant;FSR;2| (121 . *) (127 . |isPlus|) (132 . =)
              (138 . +) (144 . -) (149 . -)
              (|Record| (|:| |val| $) (|:| |exponent| 38)) (|Union| 69 '#2#)
              (155 . |isPower|) (160 . ~=) (166 . ^) (|Kernel| 7) (172 . |is?|)
              (|NonNegativeInteger|) (|SparseMultivariatePolynomial| 6 74)
              (178 . |minimumDegree|) (184 . |degree|) (190 . |new|)
              (194 . |exp|) (|Pattern| 38) (199 . |convert|)
              (|PatternMatchResult| 38 $) (204 . |patternMatch|)
              (211 . |failed?|) (216 . |elt|) (222 . |differentiate|)
              (228 . |zero?|) (|ElementaryFunctionSign| 6 7) (233 . |sign|)
              (238 . ^) (244 . |log|) (|Fraction| 38) (249 . |One|)
              (|SparseMultivariatePolynomial| 6 110) (253 . |numer|)
              (258 . |denom|) (263 . |coerce|) (|List| 74) (268 . |variables|)
              (|Mapping| 24 74) (273 . |select!|) (|List| 7) (279 . |argument|)
              (|SparseUnivariatePolynomial| $) (284 . |univariate|)
              (|SparseUnivariatePolynomial| 77) (290 . |coefficient|)
              (|Kernel| $) (296 . |coerce|) (|Fraction| 106)
              (301 . |univariate|) (|Union| 117 '"failed") (|Fraction| 117)
              (307 . |retractIfCan|) (|SparseUnivariatePolynomial| 7)
              (312 . |degree|) (317 . >) (323 . |coefficient|)
              (329 . |leadingCoefficient|) '|pmd| '|pme| '|pmf| '|opt_d|
              '|opt_e| (334 . |tan|) (|PositiveInteger|) (339 . ^)
              (|Record| (|:| |exponent| 76) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 74) 74 6 77 7)
              (345 . |froot|) (351 . ~=) (357 . ~=)
              (|Record| (|:| |special| 7) (|:| |integrand| 7))
              (|Union| 135 '"failed") (363 . |pmintegrate|) (369 . |second|)
              (374 . |li|) (379 . |third|) (384 . |dilog|) (389 . |Ei|)
              (394 . |erf|) (399 . |Si|) (404 . |Ci|)
              (409 . |pmComplexintegrate|) (415 . |retract|) (420 . |last|)
              (425 . *) (431 . |Gamma|) (436 . |differentiate|)
              (443 . |kernel|) (|List| 110) (|List| $) (448 . |eval|)
              (|OrderedCompletion| 7) (455 . |zero?|) (|SingleInteger|)
              (460 . |whatInfinity|) (465 . |constant|) (470 . |freeOf?|)
              (|Union| 7 '"failed") (476 . |pmintegrate|))
           '#(|splitConstant| 484 |pmintegrate| 490 |pmComplexintegrate| 504)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 163
                                                 '(0 8 0 9 1 8 0 0 11 1 7 0 8
                                                   18 1 19 7 7 20 1 7 22 0 23 1
                                                   22 24 0 25 2 27 7 7 26 28 1
                                                   30 24 7 31 0 24 0 32 1 7 34
                                                   0 35 0 6 0 36 0 7 0 37 0 38
                                                   0 39 2 38 24 0 0 40 0 7 0 42
                                                   1 7 0 0 43 0 7 0 45 1 7 0 38
                                                   46 2 7 0 0 0 47 1 51 50 0 52
                                                   1 53 0 50 54 2 22 24 8 0 55
                                                   0 6 0 56 1 7 57 0 58 1 7 59
                                                   0 60 2 7 0 0 0 63 1 7 59 0
                                                   64 2 7 24 0 0 65 2 7 0 0 0
                                                   66 1 7 0 0 67 2 7 0 0 0 68 1
                                                   7 70 0 71 2 38 24 0 0 72 2 7
                                                   0 0 38 73 2 74 24 0 8 75 2
                                                   77 76 0 74 78 2 77 76 0 74
                                                   79 0 51 0 80 1 7 0 0 81 1 7
                                                   82 0 83 3 7 84 0 82 84 85 1
                                                   51 24 0 86 2 53 7 0 8 87 2 7
                                                   0 0 8 88 1 7 24 0 89 1 90 34
                                                   7 91 2 7 0 0 0 92 1 7 0 0 93
                                                   0 94 0 95 1 7 96 0 97 1 7 96
                                                   0 98 1 7 0 96 99 1 77 100 0
                                                   101 2 100 0 102 0 103 1 74
                                                   104 0 105 2 77 106 0 74 107
                                                   2 108 77 0 76 109 1 7 0 110
                                                   111 2 7 112 0 110 113 1 115
                                                   114 0 116 1 117 76 0 118 2
                                                   76 24 0 0 119 2 117 7 0 76
                                                   120 1 117 7 0 121 1 7 0 0
                                                   127 2 7 0 0 128 129 2 131
                                                   130 7 76 132 2 76 24 0 0 133
                                                   2 7 24 0 0 134 2 0 136 7 8
                                                   137 1 104 7 0 138 1 7 0 0
                                                   139 1 104 7 0 140 1 7 0 0
                                                   141 1 7 0 0 142 1 7 0 0 143
                                                   1 7 0 0 144 1 7 0 0 145 2 0
                                                   136 7 8 146 1 7 38 0 147 1
                                                   104 7 0 148 2 7 0 38 0 149 1
                                                   7 0 0 150 3 7 0 0 8 76 151 1
                                                   74 0 8 152 3 7 0 0 153 154
                                                   155 1 156 24 0 157 1 156 158
                                                   0 159 1 19 7 7 160 2 7 24 0
                                                   8 161 4 0 162 7 8 156 156
                                                   163 2 0 61 7 8 62 2 2 136 7
                                                   8 137 4 1 162 7 8 156 156
                                                   163 2 2 136 7 8 146)))))
           '|lookupComplete|)) 
