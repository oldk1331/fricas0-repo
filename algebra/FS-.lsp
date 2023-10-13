
(/VERSIONCHECK 2) 

(DEFUN |FS-;ground?;SB;1| (|x| $) (QEQCAR (SPADCALL |x| (QREFELT $ 18)) 0)) 

(DEFUN |FS-;ground;SR;2| (|x| $) (SPADCALL |x| (QREFELT $ 21))) 

(DEFUN |FS-;coerce;SS;3| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 26))) 

(DEFUN |FS-;retract;SS;4| (|x| $)
  (PROG (#1=#:G181)
    (RETURN
     (PROG2
         (LETT #1# (SPADCALL (SPADCALL |x| (QREFELT $ 28)) (QREFELT $ 30))
               |FS-;retract;SS;4|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))))) 

(DEFUN |FS-;applyQuote;S2S;5| (|s| |x| $)
  (SPADCALL |s| (LIST |x|) (QREFELT $ 33))) 

(DEFUN |FS-;applyQuote;S3S;6| (|s| |x| |y| $)
  (SPADCALL |s| (LIST |x| |y|) (QREFELT $ 33))) 

(DEFUN |FS-;applyQuote;S4S;7| (|s| |x| |y| |z| $)
  (SPADCALL |s| (LIST |x| |y| |z|) (QREFELT $ 33))) 

(DEFUN |FS-;applyQuote;S5S;8| (|s| |x| |y| |z| |t| $)
  (SPADCALL |s| (LIST |x| |y| |z| |t|) (QREFELT $ 33))) 

(DEFUN |FS-;applyQuote;SLS;9| (|s| |l| $)
  (SPADCALL (QREFELT $ 16) (CONS (SPADCALL |s| (QREFELT $ 38)) |l|)
            (QREFELT $ 39))) 

(DEFUN |FS-;belong?;BoB;10| (|op| $)
  (COND
   ((SPADCALL |op| '|any| (QREFELT $ 41))
    (COND ((SPADCALL |op| '|%diff| (QREFELT $ 42)) 'T)
          (#1='T (SPADCALL |op| '|%quote| (QREFELT $ 42)))))
   (#1# 'NIL))) 

(DEFUN |FS-;subs| (|fn| |k| $)
  (PROG (#1=#:G195 |x| #2=#:G194)
    (RETURN
     (SEQ
      (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                (PROGN
                 (LETT #2# NIL . #3=(|FS-;subs|))
                 (SEQ (LETT |x| NIL . #3#)
                      (LETT #1# (SPADCALL |k| (QREFELT $ 46)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (SPADCALL |x| |fn|) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 47)))))) 

(DEFUN |FS-;operator;2Bo;12| (|op| $)
  (COND ((SPADCALL |op| '|%diff| (QREFELT $ 42)) (QREFELT $ 15))
        ((SPADCALL |op| '|%quote| (QREFELT $ 42)) (QREFELT $ 16))
        ('T
         (|error|
          (SPADCALL
           (STRCONC "Unknown operator 4: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 48)) (QREFELT $ 50)))
           (QREFELT $ 52)))))) 

(DEFUN |FS-;differentiand| (|l| $)
  (SPADCALL (|SPADfirst| |l|)
            (SPADCALL (SPADCALL |l| (QREFELT $ 54)) (QREFELT $ 28))
            (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 56))) 

(DEFUN |FS-;pint| (|l| $)
  (SPADCALL (CONS (SPADCALL 'D (QREFELT $ 58)) |l|) (QREFELT $ 59))) 

(DEFUN |FS-;indiff| (|l| $)
  (PROG (|r2|)
    (RETURN
     (SEQ
      (LETT |r2|
            (SPADCALL
             (LIST (SPADCALL '|::| (QREFELT $ 58))
                   (SPADCALL (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 60))
                   (SPADCALL '|Symbol| (QREFELT $ 58)))
             (QREFELT $ 59))
            |FS-;indiff|)
      (EXIT
       (|FS-;pint|
        (LIST (SPADCALL (|FS-;differentiand| |l| $) (QREFELT $ 60)) |r2|)
        $)))))) 

(DEFUN |FS-;eval;SSS;16| (|f| |s| $) (SPADCALL |f| (LIST |s|) (QREFELT $ 62))) 

(DEFUN |FS-;eval;SBoSSS;17| (|f| |s| |g| |x| $)
  (SPADCALL |f| (LIST |s|) (LIST |g|) |x| (QREFELT $ 65))) 

(DEFUN |FS-;eval;SLLSS;18| (|f| |ls| |lg| |x| $)
  (PROG (#1=#:G209 |g| #2=#:G208)
    (RETURN
     (SEQ
      (SPADCALL |f| |ls|
                (PROGN
                 (LETT #2# NIL . #3=(|FS-;eval;SLLSS;18|))
                 (SEQ (LETT |g| NIL . #3#) (LETT #1# |lg| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |g| |x| (QREFELT $ 69)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 72)))))) 

(DEFUN |FS-;variables;SL;19| (|x| $)
  (PROG (|l| |s| #1=#:G219 |k|)
    (RETURN
     (SEQ (LETT |l| NIL . #2=(|FS-;variables;SL;19|))
          (SEQ (LETT |k| NIL . #2#)
               (LETT #1# (SPADCALL |x| (QREFELT $ 77)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |s| (SPADCALL |k| (QREFELT $ 30)) . #2#)
                    (EXIT
                     (COND
                      ((QEQCAR |s| 0)
                       (LETT |l| (CONS (QCDR |s|) |l|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |l|)))))) 

(DEFUN |FS-;retractIfCan;SU;20| (|x| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |x| (QREFELT $ 80)) |FS-;retractIfCan;SU;20|)
          (EXIT
           (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |k|) (QREFELT $ 30))))))))) 

(DEFUN |FS-;characteristic;Nni;21| ($) (SPADCALL (QREFELT $ 84))) 

(DEFUN |FS-;coerce;KS;22| (|k| $)
  (SPADCALL (SPADCALL |k| (QREFELT $ 87)) (QREFELT $ 89))) 

(DEFUN |FS-;symsub| (|sy| |i| $)
  (SPADCALL (STRCONC (SPADCALL |sy| (QREFELT $ 50)) (STRINGIMAGE |i|))
            (QREFELT $ 91))) 

(DEFUN |FS-;numerator;2S;24| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 89))) 

(DEFUN |FS-;eval;SSNniMS;25| (|x| |s| |n| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL |x| (LIST |s|) (LIST |n|)
               (LIST (CONS #'|FS-;eval;SSNniMS;25!0| (VECTOR |f| $)))
               (QREFELT $ 98))))) 

(DEFUN |FS-;eval;SSNniMS;25!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SSNniMS;25|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

(DEFUN |FS-;eval;SSNniMS;26| (|x| |s| |n| |f| $)
  (SPADCALL |x| (LIST |s|) (LIST |n|) (LIST |f|) (QREFELT $ 98))) 

(DEFUN |FS-;eval;SLLS;27| (|x| |l| |f| $)
  (SPADCALL |x| |l| (SPADCALL (LENGTH |l|) 1 (QREFELT $ 101)) |f|
            (QREFELT $ 98))) 

(DEFUN |FS-;elt;BoLS;28| (|op| |args| $)
  (PROG (#1=#:G251 |x| |od?|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |op| (QREFELT $ 103))
          (SEQ
           (LETT |od?| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41))
                 . #2=(|FS-;elt;BoLS;28|))
           (EXIT
            (COND
             ((OR |od?| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 41)))
              (COND
               ((SPADCALL
                 (SPADCALL (SPADCALL (|SPADfirst| |args|) (QREFELT $ 92))
                           (QREFELT $ 104))
                 (|spadConstant| $ 105) (QREFELT $ 106))
                (PROGN
                 (LETT #1#
                       (SEQ
                        (LETT |x|
                              (SPADCALL |op|
                                        (SPADCALL (|SPADfirst| |args|)
                                                  (QREFELT $ 107))
                                        (QREFELT $ 108))
                              . #2#)
                        (EXIT
                         (COND (|od?| (SPADCALL |x| (QREFELT $ 107)))
                               ('T |x|))))
                       . #2#)
                 (GO #1#))))))))))
        (EXIT (SPADCALL |op| |args| (QREFELT $ 110)))))
      #1# (EXIT #1#))))) 

(DEFUN |FS-;eval;SLLLS;29| (|x| |s| |n| |l| $)
  (PROG (#1=#:G257 |f| #2=#:G256)
    (RETURN
     (SEQ
      (SPADCALL |x| |s| |n|
                (PROGN
                 (LETT #2# NIL . #3=(|FS-;eval;SLLLS;29|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|FS-;eval;SLLLS;29!0| (VECTOR |f| $))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 98)))))) 

(DEFUN |FS-;eval;SLLLS;29!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SLLLS;29|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

(DEFUN |FS-;smprep| (|lop| |lexp| |lfunc| |p| $)
  (PROG (|q| |a| |t2| |t1| |qr| |m| |e| |f| |n| |g| |arg| #1=#:G280 #2=#:G279
         |op| |k| |v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 114)) . #3=(|FS-;smprep|))
          (EXIT
           (COND ((QEQCAR |v| 1) (SPADCALL |p| (QREFELT $ 89)))
                 (#4='T
                  (SEQ (LETT |k| (QCDR |v|) . #3#)
                       (LETT |g|
                             (SPADCALL
                              (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #3#)
                              (LETT |arg|
                                    (PROGN
                                     (LETT #2# NIL . #3#)
                                     (SEQ (LETT |a| NIL . #3#)
                                          (LETT #1#
                                                (SPADCALL |k| (QREFELT $ 46))
                                                . #3#)
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |a| (CAR #1#) . #3#)
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (SPADCALL |a| |lop| |lexp|
                                                             |lfunc|
                                                             (QREFELT $ 98))
                                                   #2#)
                                                  . #3#)))
                                          (LETT #1# (CDR #1#) . #3#) (GO G190)
                                          G191 (EXIT (NREVERSE #2#))))
                                    . #3#)
                              (QREFELT $ 39))
                             . #3#)
                       (LETT |q|
                             (SPADCALL
                              (CONS #'|FS-;smprep!0|
                                    (VECTOR |lfunc| |lexp| |lop| $))
                              (SPADCALL |p| |k| (QREFELT $ 116))
                              (QREFELT $ 121))
                             . #3#)
                       (EXIT
                        (COND
                         ((<
                           (LETT |n|
                                 (SPADCALL (SPADCALL |op| (QREFELT $ 48)) |lop|
                                           (QREFELT $ 123))
                                 . #3#)
                           (SPADCALL |lop| (QREFELT $ 124)))
                          (SPADCALL |q| |g| (QREFELT $ 125)))
                         (#4#
                          (SEQ (LETT |a| (|spadConstant| $ 126) . #3#)
                               (LETT |f|
                                     (SPADCALL
                                      (SPADCALL |arg|
                                                (SPADCALL |lfunc| |n|
                                                          (QREFELT $ 129)))
                                      |lop| |lexp| |lfunc| (QREFELT $ 98))
                                     . #3#)
                               (LETT |e| (SPADCALL |lexp| |n| (QREFELT $ 130))
                                     . #3#)
                               (SEQ G190
                                    (COND
                                     ((NULL
                                       (SPADCALL |q| (|spadConstant| $ 131)
                                                 (QREFELT $ 132)))
                                      (GO G191)))
                                    (SEQ
                                     (LETT |m| (SPADCALL |q| (QREFELT $ 133))
                                           . #3#)
                                     (LETT |qr| (DIVIDE2 |m| |e|) . #3#)
                                     (LETT |t1|
                                           (SPADCALL |f| (QCAR |qr|)
                                                     (QREFELT $ 134))
                                           . #3#)
                                     (LETT |t2|
                                           (SPADCALL |g| (QCDR |qr|)
                                                     (QREFELT $ 134))
                                           . #3#)
                                     (LETT |a|
                                           (SPADCALL |a|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |q|
                                                                 (QREFELT $
                                                                          135))
                                                       |t1| (QREFELT $ 136))
                                                      |t2| (QREFELT $ 136))
                                                     (QREFELT $ 137))
                                           . #3#)
                                     (EXIT
                                      (LETT |q| (SPADCALL |q| (QREFELT $ 138))
                                            . #3#)))
                                    NIL (GO G190) G191 (EXIT NIL))
                               (EXIT |a|))))))))))))) 

(DEFUN |FS-;smprep!0| (|y| $$)
  (PROG ($ |lop| |lexp| |lfunc|)
    (LETT $ (QREFELT $$ 3) . #1=(|FS-;smprep|))
    (LETT |lop| (QREFELT $$ 2) . #1#)
    (LETT |lexp| (QREFELT $$ 1) . #1#)
    (LETT |lfunc| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |y| (QREFELT $ 89)) |lop| |lexp| |lfunc|
                (QREFELT $ 98)))))) 

(DEFUN |FS-;dispdiff| (|l| $)
  (PROG (|m| #1=#:G292 |x| #2=#:G291 |i| |rec| |a| |k| |t| |s|)
    (RETURN
     (SEQ
      (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 54)) (QREFELT $ 139))
            . #3=(|FS-;dispdiff|))
      (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 139)) . #3#)
      (LETT |a|
            (SPADCALL
             (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
             (QREFELT $ 46))
            . #3#)
      (EXIT
       (COND
        ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 140))
         (SEQ (LETT |rec| (|FS-;dispdiff| |a| $) . #3#)
              (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT $ 142)) . #3#)
              (SPADCALL (QVELT |rec| 2) |i| |t| (QREFELT $ 143))
              (EXIT
               (VECTOR (QVELT |rec| 0)
                       (SPADCALL (QVELT |rec| 1)
                                 (SPADCALL (SPADCALL '|,| (QREFELT $ 144))
                                           (SPADCALL
                                            (- (+ |i| 1)
                                               (SPADCALL |a| (QREFELT $ 147)))
                                            (QREFELT $ 148))
                                           (QREFELT $ 149))
                                 (QREFELT $ 149))
                       (QVELT |rec| 2) (QVELT |rec| 3)
                       (COND ((ZEROP (QVELT |rec| 4)) 0)
                             (#4='T (+ (QVELT |rec| 4) 1)))))))
        (#4#
         (SEQ
          (LETT |i|
                (SPADCALL (SPADCALL |l| (QREFELT $ 54)) |a| (QREFELT $ 150))
                . #3#)
          (LETT |m|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |x| NIL . #3#) (LETT #1# |a| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 139)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (SPADCALL |m| |i| |t| (QREFELT $ 143))
          (EXIT
           (VECTOR
            (SPADCALL (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 48))
                      (QREFELT $ 144))
            (SPADCALL (SPADCALL '|,| (QREFELT $ 144))
                      (SPADCALL (- (+ |i| 1) (SPADCALL |a| (QREFELT $ 147)))
                                (QREFELT $ 148))
                      (QREFELT $ 149))
            |m| (SPADCALL |k| (QREFELT $ 44))
            (COND ((NULL (CDR |a|)) 1) (#4# 0)))))))))))) 

(DEFUN |FS-;ddiff| (|l| $)
  (PROG (|f| |opname| |rec|)
    (RETURN
     (SEQ (LETT |rec| (|FS-;dispdiff| |l| $) . #1=(|FS-;ddiff|))
          (LETT |opname|
                (COND
                 ((ZEROP (QVELT |rec| 4))
                  (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1) (QREFELT $ 151)))
                 (#2='T
                  (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4) (QREFELT $ 152))))
                . #1#)
          (LETT |f| (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT $ 154))
                . #1#)
          (EXIT
           (COND
            ((QEQCAR |f| 0)
             (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
            (#2# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT $ 155))))))))) 

(DEFUN |FS-;substArg| (|op| |l| |i| |g| $)
  (PROG (|z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL |l| (QREFELT $ 156)) |FS-;substArg|)
          (SPADCALL |z| |i| |g| (QREFELT $ 157))
          (EXIT (SPADCALL |op| |z| (QREFELT $ 47))))))) 

(DEFUN |FS-;diffdiff| (|l| |x| $)
  (PROG (|f|)
    (RETURN
     (SEQ
      (LETT |f| (SPADCALL (QREFELT $ 15) |l| (QREFELT $ 47)) |FS-;diffdiff|)
      (EXIT
       (|FS-;diffdiff0| |l| |x| |f| (SPADCALL |f| (QREFELT $ 28)) NIL $)))))) 

(DEFUN |FS-;diffdiff0| (|l| |x| |expr| |kd| |done| $)
  (PROG (|ans| |g| |bp| #1=#:G314 |i| #2=#:G315 |b| |arg| |u| |gg| |op| |k|)
    (RETURN
     (SEQ
      (LETT |op|
            (SPADCALL
             (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28))
                   . #3=(|FS-;diffdiff0|))
             (QREFELT $ 44))
            . #3#)
      (LETT |gg| (SPADCALL |l| (QREFELT $ 54)) . #3#)
      (LETT |u| (SPADCALL |l| (QREFELT $ 55)) . #3#)
      (LETT |arg| (SPADCALL |k| (QREFELT $ 46)) . #3#)
      (LETT |ans| (|spadConstant| $ 126) . #3#)
      (COND
       ((NULL (SPADCALL |u| |done| (QREFELT $ 158)))
        (COND
         ((SPADCALL (LETT |ans| (SPADCALL |u| |x| (QREFELT $ 159)) . #3#)
                    (|spadConstant| $ 126) (QREFELT $ 160))
          (LETT |ans|
                (SPADCALL |ans|
                          (SPADCALL (QREFELT $ 15)
                                    (LIST
                                     (SPADCALL |expr| (LIST |kd|)
                                               (LIST
                                                (SPADCALL (QREFELT $ 15)
                                                          (LIST
                                                           (|SPADfirst| |l|)
                                                           |gg| |gg|)
                                                          (QREFELT $ 47)))
                                               (QREFELT $ 161))
                                     |gg| |u|)
                                    (QREFELT $ 47))
                          (QREFELT $ 136))
                . #3#)))))
      (LETT |done| (CONS |gg| |done|) . #3#)
      (EXIT
       (COND
        ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 140))
         (SPADCALL |ans| (|FS-;diffdiff0| |arg| |x| |expr| |k| |done| $)
                   (QREFELT $ 137)))
        ('T
         (SEQ
          (SEQ (LETT |b| NIL . #3#) (LETT #2# |arg| . #3#)
               (LETT |i| (SPADCALL |arg| (QREFELT $ 147)) . #3#)
               (LETT #1# (SPADCALL |arg| (QREFELT $ 162)) . #3#) G190
               (COND
                ((OR (> |i| #1#) (ATOM #2#)
                     (PROGN (LETT |b| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL |b| |done| (QREFELT $ 158)))
                   (COND
                    ((SPADCALL
                      (LETT |bp| (SPADCALL |b| |x| (QREFELT $ 159)) . #3#)
                      (|spadConstant| $ 126) (QREFELT $ 160))
                     (SEQ
                      (LETT |g|
                            (SPADCALL (|FS-;symsub| (QREFELT $ 82) |i| $)
                                      (QREFELT $ 38))
                            . #3#)
                      (EXIT
                       (LETT |ans|
                             (SPADCALL |ans|
                                       (SPADCALL |bp|
                                                 (SPADCALL (QREFELT $ 15)
                                                           (LIST
                                                            (SPADCALL |expr|
                                                                      (LIST
                                                                       |kd|)
                                                                      (LIST
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         $ 15)
                                                                        (LIST
                                                                         (|FS-;substArg|
                                                                          |op|
                                                                          |arg|
                                                                          |i|
                                                                          |g|
                                                                          $)
                                                                         |gg|
                                                                         |u|)
                                                                        (QREFELT
                                                                         $
                                                                         47)))
                                                                      (QREFELT
                                                                       $ 161))
                                                            |g| |b|)
                                                           (QREFELT $ 47))
                                                 (QREFELT $ 136))
                                       (QREFELT $ 137))
                             . #3#)))))))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |ans|))))))))) 

(DEFUN |FS-;dfeval| (|l| |g| $)
  (PROG (#1=#:G317)
    (RETURN
     (SPADCALL
      (SPADCALL (|SPADfirst| |l|)
                (PROG2 (LETT #1# (SPADCALL |g| (QREFELT $ 30)) |FS-;dfeval|)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
                (QREFELT $ 159))
      |g| (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 56))))) 

(DEFUN |FS-;diffEval| (|l| $)
  (PROG (|d| |n| |nl| |ss| |dumm| |ud| |op| #1=#:G345 |k| |u| |g|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT $ 54)) (QREFELT $ 28))
              . #2=(|FS-;diffEval|))
        (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 80)) . #2#)
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#) (GO #1#)))
               ((QEQCAR |u| 0)
                (COND
                 ((QEQCAR (SPADCALL (LETT |k| (QCDR |u|) . #2#) (QREFELT $ 30))
                          0)
                  (PROGN
                   (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                   (GO #1#))))))))
        (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #2#)
        (LETT |ud| (SPADCALL |op| (QREFELT $ 165)) . #2#)
        (EXIT
         (COND
          ((QEQCAR |ud| 1)
           (SEQ
            (LETT |dumm|
                  (SPADCALL (|FS-;symsub| (QREFELT $ 82) 1 $) (QREFELT $ 38))
                  . #2#)
            (LETT |ss|
                  (SPADCALL (SPADCALL |l| 1 (QREFELT $ 166))
                            (SPADCALL (SPADCALL |l| 2 (QREFELT $ 166)) |dumm|
                                      (QREFELT $ 168))
                            (QREFELT $ 170))
                  . #2#)
            (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT $ 166)))
                  . #2#)
            (EXIT (SPADCALL (QREFELT $ 15) |nl| (QREFELT $ 47)))))
          ((<
            (LETT |n|
                  (SPADCALL (SPADCALL |l| (QREFELT $ 54))
                            (SPADCALL |k| (QREFELT $ 46)) (QREFELT $ 150))
                  . #2#)
            (SPADCALL |l| (QREFELT $ 147)))
           (|FS-;dfeval| |l| |g| $))
          ('T
           (SEQ (LETT |d| (QCDR |ud|) . #2#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |k| (QREFELT $ 46))
                            (SPADCALL |d| |n| (QREFELT $ 129)))
                  |g| (SPADCALL |l| (QREFELT $ 55)) (QREFELT $ 56)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS-;diffArg| (|l| |op| |i| $)
  (PROG (|g| |z| |n|)
    (RETURN
     (SEQ
      (LETT |n| (+ (- |i| 1) (SPADCALL |l| (QREFELT $ 147)))
            . #1=(|FS-;diffArg|))
      (LETT |z| (SPADCALL |l| (QREFELT $ 156)) . #1#)
      (SPADCALL |z| |n|
                (LETT |g|
                      (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
                                (QREFELT $ 38))
                      . #1#)
                (QREFELT $ 157))
      (EXIT
       (LIST (SPADCALL |op| |z| (QREFELT $ 47)) |g|
             (SPADCALL |l| |n| (QREFELT $ 166)))))))) 

(DEFUN |FS-;opderiv| (|op| |n| $)
  (PROG (|i| #1=#:G356 |g|)
    (RETURN
     (SEQ
      (COND
       ((EQL |n| 1)
        (SEQ
         (LETT |g|
               (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $) (QREFELT $ 38))
               . #2=(|FS-;opderiv|))
         (EXIT
          (LIST (CONS #'|FS-;opderiv!0| (VECTOR $ |g| |op| (QREFELT $ 15)))))))
       ('T
        (PROGN
         (LETT #1# NIL . #2#)
         (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
              (SEQ
               (EXIT
                (LETT #1#
                      (CONS
                       (CONS #'|FS-;opderiv!1|
                             (VECTOR $ |i| |op| (QREFELT $ 15)))
                       #1#)
                      . #2#)))
              (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
              (EXIT (NREVERSE #1#)))))))))) 

(DEFUN |FS-;opderiv!1| (|x| $$)
  (PROG (|opdiff| |op| |i| $)
    (LETT |opdiff| (QREFELT $$ 3) . #1=(|FS-;opderiv|))
    (LETT |op| (QREFELT $$ 2) . #1#)
    (LETT |i| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |opdiff| (|FS-;diffArg| |x| |op| |i| $) (QREFELT $ 47)))))) 

(DEFUN |FS-;opderiv!0| (|x| $$)
  (PROG (|opdiff| |op| |g| $)
    (LETT |opdiff| (QREFELT $$ 3) . #1=(|FS-;opderiv|))
    (LETT |op| (QREFELT $$ 2) . #1#)
    (LETT |g| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL |opdiff|
                (LIST (SPADCALL |op| |g| (QREFELT $ 171)) |g|
                      (SPADCALL |x| (QREFELT $ 94)))
                (QREFELT $ 47)))))) 

(DEFUN |FS-;kderiv| (|k| $)
  (PROG (#1=#:G368 |g| #2=#:G367 |grad| |u| |op| |n| |args|)
    (RETURN
     (SEQ
      (COND
       ((ZEROP
         (LETT |n|
               (LENGTH
                (LETT |args| (SPADCALL |k| (QREFELT $ 46))
                      . #3=(|FS-;kderiv|)))
               . #3#))
        NIL)
       (#4='T
        (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #3#)
             (LETT |grad|
                   (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 165)) . #3#)
                        (EXIT
                         (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                               (#4# (QCDR |u|)))))
                   . #3#)
             (COND
              ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 172))
               (LETT |grad| (|FS-;opderiv| |op| |n| $) . #3#)))
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |g| NIL . #3#) (LETT #1# |grad| . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT (LETT #2# (CONS (SPADCALL |args| |g|) #2#) . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |FS-;kerderiv| (|k| |x| $)
  (PROG (#1=#:G378 #2=#:G377 #3=#:G379 #4=#:G383 |g| #5=#:G384 |y| |fn| |v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 30)) . #6=(|FS-;kerderiv|))
          (EXIT
           (COND
            ((QEQCAR |v| 0)
             (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 145))
                   (#7='T (|spadConstant| $ 126))))
            (#7#
             (SEQ
              (LETT |fn|
                    (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 10)
                              (QREFELT $ 154))
                    . #6#)
              (EXIT
               (COND
                ((QEQCAR |fn| 0)
                 (SPADCALL (SPADCALL |k| (QREFELT $ 46)) |x| (QCDR |fn|)))
                (#7#
                 (PROGN
                  (LETT #1# NIL . #6#)
                  (SEQ (LETT |y| NIL . #6#)
                       (LETT #5# (SPADCALL |k| (QREFELT $ 46)) . #6#)
                       (LETT |g| NIL . #6#)
                       (LETT #4# (|FS-;kderiv| |k| $) . #6#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #6#) NIL)
                             (ATOM #5#) (PROGN (LETT |y| (CAR #5#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (SPADCALL |g|
                                          (SPADCALL |y| |x| (QREFELT $ 159))
                                          (QREFELT $ 136))
                                . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 137))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| $ 126))))))))))))))) 

(DEFUN |FS-;smpderiv| (|p| |x| $)
  (PROG (#1=#:G404 #2=#:G403 #3=#:G405 #4=#:G407 |k|)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL
        (SPADCALL (CONS #'|FS-;smpderiv!0| (VECTOR |x| $)) |p| (QREFELT $ 178))
        (QREFELT $ 89))
       (PROGN
        (LETT #1# NIL . #5=(|FS-;smpderiv|))
        (SEQ (LETT |k| NIL . #5#)
             (LETT #4# (SPADCALL |p| (QREFELT $ 180)) . #5#) G190
             (COND
              ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (PROGN
                (LETT #3#
                      (SPADCALL
                       (SPADCALL (SPADCALL |p| |k| (QREFELT $ 181))
                                 (QREFELT $ 89))
                       (|FS-;kerderiv| |k| |x| $) (QREFELT $ 136))
                      . #5#)
                (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 137)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
             (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
        (COND (#1# #2#) ('T (|spadConstant| $ 126))))
       (QREFELT $ 137)))))) 

(DEFUN |FS-;smpderiv!0| (|s| $$)
  (PROG ($ |x|)
    (LETT $ (QREFELT $$ 1) . #1=(|FS-;smpderiv|))
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 174)) |x| (QREFELT $ 175))
                (QREFELT $ 176)))))) 

(DEFUN |FS-;coerce;PS;43| (|p| $)
  (SPADCALL (ELT $ 38) (ELT $ 182) |p| (QREFELT $ 186))) 

(DEFUN |FS-;worse?| (|k1| |k2| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (SPADCALL (SPADCALL (SPADCALL |k1| (QREFELT $ 44)) (QREFELT $ 48))
                      (SPADCALL (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 48))
                      (QREFELT $ 190))
            |FS-;worse?|)
      (EXIT
       (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT $ 191)))
             ('T (QCDR |u|)))))))) 

(DEFUN |FS-;bestKernel| (|l| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
            (#1='T
             (SEQ (LETT |a| (|FS-;bestKernel| (CDR |l|) $) |FS-;bestKernel|)
                  (EXIT
                   (COND ((|FS-;worse?| (|SPADfirst| |l|) |a| $) |a|)
                         (#1# (|SPADfirst| |l|))))))))))) 

(DEFUN |FS-;smp2O| (|p| $)
  (PROG (|a| #1=#:G421 |r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 192)) . #2=(|FS-;smp2O|))
          (EXIT
           (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 193)))
                 (#3='T
                  (SEQ
                   (LETT |a|
                         (COND
                          ((SPADCALL (QREFELT $ 194))
                           (|FS-;bestKernel| (SPADCALL |p| (QREFELT $ 180)) $))
                          (#3#
                           (PROG2
                               (LETT #1# (SPADCALL |p| (QREFELT $ 114)) . #2#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0)
                                            (|Kernel| (QREFELT $ 6)) #1#))))
                         . #2#)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (ELT $ 89) (SPADCALL |p| |a| (QREFELT $ 116))
                               (QREFELT $ 121))
                     (SPADCALL |a| (QREFELT $ 195)) (QREFELT $ 196))))))))))) 

(DEFUN |FS-;smpsubst| (|p| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FS-;smpsubst!2| (VECTOR $ |lv| |lk|)) (ELT $ 182) |p|
               (QREFELT $ 201))))) 

(DEFUN |FS-;smpsubst!2| (|x| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) . #1=(|FS-;smpsubst|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |lk| |lv| |x|
                   (|FS-;notfound|
                    (CONS #'|FS-;smpsubst!1| (VECTOR |lk| |lv| $)) |lk| $)
                   (QREFELT $ 199)))))))) 

(DEFUN |FS-;smpsubst!1| (|z| $$)
  (PROG ($ |lv| |lk|)
    (LETT $ (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT |lk| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (|FS-;subs| (CONS #'|FS-;smpsubst!0| (VECTOR $ |lv| |lk|)) |z| $))))))) 

(DEFUN |FS-;smpsubst!0| (|s| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 161)))))) 

(DEFUN |FS-;smpeval| (|p| |lk| |lv| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|FS-;smpeval!2| (VECTOR $ |lv| |lk|)) (ELT $ 182) |p|
               (QREFELT $ 201))))) 

(DEFUN |FS-;smpeval!2| (|x| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) . #1=(|FS-;smpeval|))
    (LETT |lv| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL |lk| |lv| |x|
                   (|FS-;notfound|
                    (CONS #'|FS-;smpeval!1| (VECTOR |lk| |lv| $)) |lk| $)
                   (QREFELT $ 199)))))))) 

(DEFUN |FS-;smpeval!1| (|z| $$)
  (PROG ($ |lv| |lk|)
    (LETT $ (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT |lk| (QREFELT $$ 0) NIL)
    (RETURN
     (PROGN
      (PROG ()
        (RETURN
         (SPADCALL (CONS #'|FS-;smpeval!0| (VECTOR $ |lv| |lk|)) |z|
                   (QREFELT $ 203)))))))) 

(DEFUN |FS-;smpeval!0| (|s| $$)
  (PROG (|lk| |lv| $)
    (LETT |lk| (QREFELT $$ 2) NIL)
    (LETT |lv| (QREFELT $$ 1) NIL)
    (LETT $ (QREFELT $$ 0) NIL)
    (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 202)))))) 

(DEFUN |FS-;notfound| (|fn| |lk| $)
  (PROG () (RETURN (CONS #'|FS-;notfound!0| (VECTOR |fn| |lk| $))))) 

(DEFUN |FS-;notfound!0| (|k| $$)
  (PROG ($ |lk| |fn|)
    (LETT $ (QREFELT $$ 2) . #1=(|FS-;notfound|))
    (LETT |lk| (QREFELT $$ 1) . #1#)
    (LETT |fn| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (PROG (|f|)
        (RETURN
         (COND
          ((SPADCALL
            (SPADCALL
             (SPADCALL (LETT |f| (SPADCALL |k| (QREFELT $ 26)) NIL)
                       (QREFELT $ 77))
             |lk| (QREFELT $ 204))
            (QREFELT $ 205))
           |f|)
          ('T (SPADCALL |k| |fn|))))))))) 

(DEFUN |FS-;pushunq| (|l| |arg| $)
  (PROG (#1=#:G478 |a| #2=#:G477 #3=#:G476 #4=#:G475)
    (RETURN
     (SEQ
      (COND
       ((NULL |l|)
        (PROGN
         (LETT #4# NIL . #5=(|FS-;pushunq|))
         (SEQ (LETT |a| NIL . #5#) (LETT #3# |arg| . #5#) G190
              (COND
               ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 206)) #4#) . #5#)))
              (LETT #3# (CDR #3#) . #5#) (GO G190) G191
              (EXIT (NREVERSE #4#)))))
       ('T
        (PROGN
         (LETT #2# NIL . #5#)
         (SEQ (LETT |a| NIL . #5#) (LETT #1# |arg| . #5#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #2# (CONS (SPADCALL |a| |l| (QREFELT $ 62)) #2#) . #5#)))
              (LETT #1# (CDR #1#) . #5#) (GO G190) G191
              (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |FS-;kunq| (|k| |l| |givenlist?| $)
  (PROG (#1=#:G518 |a| #2=#:G517 |s|)
    (RETURN
     (SEQ
      (COND
       (|givenlist?| (COND ((NULL |l|) (EXIT (SPADCALL |k| (QREFELT $ 26)))))))
      (COND
       ((SPADCALL |k| (QREFELT $ 16) (QREFELT $ 140))
        (COND
         ((OR
           (SPADCALL
            (LETT |s|
                  (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 46)))
                            (QREFELT $ 207))
                  . #3=(|FS-;kunq|))
            |l| (QREFELT $ 208))
           (NULL |l|))
          (EXIT
           (SPADCALL
            (SPADCALL
             (CONS (SPADCALL |s| (QREFELT $ 58))
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |a| NIL . #3#)
                         (LETT #1#
                               (|FS-;pushunq| |l|
                                (CDR (SPADCALL |k| (QREFELT $ 46))) $)
                               . #3#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (SPADCALL |a| (QREFELT $ 60)) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))
             (QREFELT $ 59))
            (QREFELT $ 210)))))))
      (EXIT
       (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                 (|FS-;pushunq| |l| (SPADCALL |k| (QREFELT $ 46)) $)
                 (QREFELT $ 39))))))) 

(DEFUN |FS-;smpunq| (|p| |l| |givenlist?| $)
  (PROG ()
    (RETURN
     (SEQ
      (COND
       (|givenlist?| (COND ((NULL |l|) (EXIT (SPADCALL |p| (QREFELT $ 89)))))))
      (EXIT
       (SPADCALL (CONS #'|FS-;smpunq!0| (VECTOR $ |givenlist?| |l|))
                 (ELT $ 182) |p| (QREFELT $ 201))))))) 

(DEFUN |FS-;smpunq!0| (|x| $$)
  (PROG (|l| |givenlist?| $)
    (LETT |l| (QREFELT $$ 2) . #1=(|FS-;smpunq|))
    (LETT |givenlist?| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|FS-;kunq| |x| |l| |givenlist?| $))))) 

(DEFUN |FS-;smpret| (|p| $)
  (PROG (#1=#:G527 #2=#:G526 #3=#:G528 #4=#:G535 |k|)
    (RETURN
     (SEQ
      (COND
       ((PROGN
         (LETT #1# NIL . #5=(|FS-;smpret|))
         (SEQ (LETT |k| NIL . #5#)
              (LETT #4# (SPADCALL |p| (QREFELT $ 180)) . #5#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3# (QEQCAR (SPADCALL |k| (QREFELT $ 30)) 1) . #5#)
                 (COND (#1# (LETT #2# (COND (#2# 'T) ('T #3#)) . #5#))
                       ('T
                        (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
              (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#6='T 'NIL)))
        (CONS 1 "failed"))
       (#6#
        (CONS 0
              (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 174) |p|
                        (QREFELT $ 215))))))))) 

(DEFUN |FS-;smpret!0| (|x| $)
  (PROG (#1=#:G530)
    (RETURN
     (SPADCALL
      (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) NIL)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0) (|Symbol|) #1#))
      (QREFELT $ 211))))) 

(DEFUN |FS-;isExpt;SBoU;54| (|x| |op| $)
  (PROG (|v| |u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 218)) . #1=(|FS-;isExpt;SBoU;54|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #1#)
                       (COND
                        ((SPADCALL |v| |op| (QREFELT $ 140))
                         (COND
                          ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                           (EXIT |u|)))))
                       (EXIT (CONS 1 "failed")))))))))) 

(DEFUN |FS-;isExpt;SSU;55| (|x| |sy| $)
  (PROG (|v| |u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 218)) . #1=(|FS-;isExpt;SSU;55|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #1#)
                       (COND
                        ((SPADCALL |v| |sy| (QREFELT $ 220))
                         (COND
                          ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                           (EXIT |u|)))))
                       (EXIT (CONS 1 "failed")))))))))) 

(DEFUN |FS-;smpIsMult| (|p| $)
  (PROG (#1=#:G572 |n| |r| |q| |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |u| (SPADCALL |p| (QREFELT $ 114)) . #2=(|FS-;smpIsMult|))
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((EQL
                   (SPADCALL
                    (LETT |q| (SPADCALL |p| (QCDR |u|) (QREFELT $ 116)) . #2#)
                    (QREFELT $ 222))
                   1)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |q| (QREFELT $ 223)) (QREFELT $ 224))
                     (QREFELT $ 225))
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |q| (QREFELT $ 224))
                                     (QREFELT $ 192))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 0)
                        (SEQ
                         (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 227)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |n| 0)
                            (PROGN
                             (LETT #1# (CONS 0 (CONS (QCDR |n|) (QCDR |u|)))
                                   . #2#)
                             (GO #1#))))))))))))))))))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(PUT '|FS-;debugA| '|SPADreplace| '(XLAM (|a1| |a2| |t|) |t|)) 

(DEFUN |FS-;debugA| (|a1| |a2| |t| $) |t|) 

(DEFUN |FS-;equaldiff| (|k1| |k2| $)
  (PROG (|res| |a2| |a1|)
    (RETURN
     (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT $ 46)) . #1=(|FS-;equaldiff|))
          (LETT |a2| (SPADCALL |k2| (QREFELT $ 46)) . #1#)
          (LETT |res|
                (SPADCALL (SPADCALL |k1| (QREFELT $ 44))
                          (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 229))
                . #1#)
          (EXIT
           (COND
            (|res|
             (SEQ
              (LETT |res|
                    (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 166))
                              (SPADCALL |a2| 3 (QREFELT $ 166))
                              (QREFELT $ 230))
                    . #1#)
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (COND
                         ((SPADCALL (SPADCALL |a1| 1 (QREFELT $ 166))
                                    (SPADCALL |a2| 1 (QREFELT $ 166))
                                    (QREFELT $ 230))
                          (SPADCALL (SPADCALL |a1| 2 (QREFELT $ 166))
                                    (SPADCALL |a2| 2 (QREFELT $ 166))
                                    (QREFELT $ 230)))
                         (#2='T 'NIL))
                        . #1#)
                  (EXIT
                   (COND (|res| (|FS-;debugA| |a1| |a2| |res| $))
                         ((SPADCALL
                           (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 166))
                                     (LIST
                                      (SPADCALL
                                       (SPADCALL |a1| 2 (QREFELT $ 166))
                                       (QREFELT $ 28)))
                                     (LIST (SPADCALL |a2| 2 (QREFELT $ 166)))
                                     (QREFELT $ 161))
                           (SPADCALL |a2| 1 (QREFELT $ 166)) (QREFELT $ 230))
                          (|FS-;debugA| |a1| |a2| 'T $))
                         (#2# (|FS-;debugA| |a1| |a2| 'NIL $))))))
                (#2# (|FS-;debugA| |a1| |a2| |res| $))))))
            (#2# (|FS-;debugA| |a1| |a2| |res| $)))))))) 

(DEFUN |FS-;mainKernel;SU;59| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 114))) 

(DEFUN |FS-;kernels;SL;60| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 180))) 

(DEFUN |FS-;retract;SR;61| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 233))) 

(DEFUN |FS-;retract;SP;62| (|x| $)
  (PROG (#1=#:G599)
    (RETURN
     (PROG2
         (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
               |FS-;retract;SP;62|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7)) #1#))))) 

(DEFUN |FS-;retractIfCan;SU;63| (|x| $)
  (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 233)))) 

(DEFUN |FS-;retractIfCan;SU;64| (|x| $)
  (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)) 

(DEFUN |FS-;eval;SLLS;65| (|x| |lk| |lv| $)
  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(DEFUN |FS-;subst;SLLS;66| (|x| |lk| |lv| $)
  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(DEFUN |FS-;differentiate;SSS;67| (|x| |s| $)
  (|FS-;smpderiv| (SPADCALL |x| (QREFELT $ 92)) |s| $)) 

(DEFUN |FS-;coerce;SOf;68| (|x| $)
  (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)) 

(DEFUN |FS-;eval;SLS;69| (|f| |l| $)
  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)) 

(DEFUN |FS-;eval;2S;70| (|f| $)
  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL 'NIL $)) 

(DEFUN |FS-;eval;SLLLS;71| (|x| |s| |n| |f| $)
  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)) 

(DEFUN |FS-;isPlus;SU;72| (|x| $)
  (PROG (#1=#:G630 |p| #2=#:G629 |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 247))
            . #3=(|FS-;isPlus;SU;72|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T
              (CONS 0
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |p| NIL . #3#) (LETT #1# (QCDR |u|) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 89)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |FS-;isTimes;SU;73| (|x| $)
  (PROG (#1=#:G641 |p| #2=#:G640 |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 249))
            . #3=(|FS-;isTimes;SU;73|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T
              (CONS 0
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |p| NIL . #3#) (LETT #1# (QCDR |u|) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 89)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |FS-;isExpt;SU;74| (|x| $)
  (PROG (|r| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 253))
            . #1=(|FS-;isExpt;SU;74|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |r| (QCDR |u|) . #1#)
                   (EXIT (CONS 0 (CONS (QCAR |r|) (QCDR |r|)))))))))))) 

(DEFUN |FS-;isPower;SU;75| (|x| $)
  (PROG (|r| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 253))
            . #1=(|FS-;isPower;SU;75|))
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |r| (QCDR |u|) . #1#)
                   (EXIT
                    (CONS 0
                          (CONS (SPADCALL (QCAR |r|) (QREFELT $ 26))
                                (QCDR |r|)))))))))))) 

(DEFUN |FS-;convert;SP;76| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 259))) 

(DEFUN |FS-;convert;SP;77| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 262))) 

(DEFUN |FS-;isMult;SU;78| (|x| $)
  (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)) 

(DEFUN |FS-;*;R2S;79| (|r| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 267)) (QREFELT $ 89)) |x|
            (QREFELT $ 136))) 

(DEFUN |FS-;mainKernel;SU;80| (|x| $) (SPADCALL |x| (QREFELT $ 270))) 

(DEFUN |FS-;kernels;SL;81| (|x| $) (SPADCALL |x| (QREFELT $ 271))) 

(DEFUN |FS-;univariate;SKF;82| (|x| |k| $) (SPADCALL |x| |k| (QREFELT $ 273))) 

(DEFUN |FS-;isPlus;SU;83| (|x| $) (SPADCALL |x| (QREFELT $ 277))) 

(DEFUN |FS-;isTimes;SU;84| (|x| $) (SPADCALL |x| (QREFELT $ 278))) 

(DEFUN |FS-;isExpt;SU;85| (|x| $) (SPADCALL |x| (QREFELT $ 281))) 

(DEFUN |FS-;isPower;SU;86| (|x| $) (SPADCALL |x| (QREFELT $ 284))) 

(DEFUN |FS-;denominator;2S;87| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 285)) (QREFELT $ 89))) 

(DEFUN |FS-;coerce;FS;88| (|q| $)
  (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 288)) (QREFELT $ 267))
            (SPADCALL (SPADCALL |q| (QREFELT $ 289)) (QREFELT $ 267))
            (QREFELT $ 290))) 

(DEFUN |FS-;coerce;FS;89| (|q| $)
  (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 293)) (QREFELT $ 294))
            (SPADCALL (SPADCALL |q| (QREFELT $ 295)) (QREFELT $ 294))
            (QREFELT $ 296))) 

(DEFUN |FS-;coerce;FS;90| (|q| $)
  (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 300)) (QREFELT $ 301))
            (SPADCALL (SPADCALL |q| (QREFELT $ 302)) (QREFELT $ 301))
            (QREFELT $ 296))) 

(DEFUN |FS-;retract;SP;91| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 304)) (QREFELT $ 305))) 

(DEFUN |FS-;retract;SF;92| (|x| $)
  (PROG (#1=#:G710)
    (RETURN
     (SPADCALL
      (PROG2
          (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                . #2=(|FS-;retract;SF;92|))
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7)) #1#))
      (PROG2 (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 285)) $) . #2#)
          (QCDR #1#)
        (|check_union| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7)) #1#))
      (QREFELT $ 306))))) 

(DEFUN |FS-;retract;SR;93| (|x| $)
  (PROG (#1=#:G714)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL
                (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 233))
                (SPADCALL (SPADCALL |x| (QREFELT $ 285)) (QREFELT $ 233))
                (QREFELT $ 309))
               |FS-;retract;SR;93|)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))) 

(DEFUN |FS-;coerce;SOf;94| (|x| $)
  (COND
   ((SPADCALL (SPADCALL |x| (QREFELT $ 285)) (|spadConstant| $ 310)
              (QREFELT $ 311))
    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $))
   ('T
    (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)
              (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 285)) $) (QREFELT $ 312))))) 

(DEFUN |FS-;retractIfCan;SU;95| (|x| $)
  (PROG (#1=#:G725 |r| |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 192))
               . #2=(|FS-;retractIfCan;SU;95|))
         (EXIT
          (COND
           ((QEQCAR |n| 1)
            (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #1#)))
           (#4='T
            (SEQ
             (LETT |d|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 285)) (QREFELT $ 192))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |d| 1) (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #1#)))
               (#4#
                (SEQ
                 (LETT |r| (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 309))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |r| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #1#))))))))))))))
        (EXIT (CONS 0 (QCDR |r|)))))
      #1# (EXIT #1#))))) 

(DEFUN |FS-;eval;SLS;96| (|f| |l| $)
  (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)
            (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 285)) |l| 'T $)
            (QREFELT $ 296))) 

(DEFUN |FS-;eval;2S;97| (|f| $)
  (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL 'NIL $)
            (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 285)) NIL 'NIL $)
            (QREFELT $ 296))) 

(DEFUN |FS-;eval;SLLLS;98| (|x| |s| |n| |f| $)
  (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)
            (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 285)) $)
            (QREFELT $ 296))) 

(DEFUN |FS-;differentiate;SSS;99| (|f| |x| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 92)) |x| $)
              (SPADCALL (SPADCALL |f| (QREFELT $ 285)) (QREFELT $ 89))
              (QREFELT $ 136))
    (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 92)) (QREFELT $ 89))
              (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 285)) |x| $)
              (QREFELT $ 136))
    (QREFELT $ 313))
   (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 285)) (QREFELT $ 89)) 2
             (QREFELT $ 314))
   (QREFELT $ 296))) 

(DEFUN |FS-;eval;SLLS;100| (|x| |lk| |lv| $)
  (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
            (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 285)) |lk| |lv| $)
            (QREFELT $ 296))) 

(DEFUN |FS-;subst;SLLS;101| (|x| |lk| |lv| $)
  (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
            (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 285)) |lk| |lv| $)
            (QREFELT $ 296))) 

(DEFUN |FS-;par| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)) |FS-;par|)
          (EXIT
           (COND ((QEQCAR |r| 0) |x|) ('T (SPADCALL |x| (QREFELT $ 315))))))))) 

(DEFUN |FS-;convert;FS;103| (|x| $)
  (PROG (#1=#:G749 #2=#:G748 #3=#:G750 #4=#:G752 |f|)
    (RETURN
     (SEQ
      (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 317)) $)
                (PROGN
                 (LETT #1# NIL . #5=(|FS-;convert;FS;103|))
                 (SEQ (LETT |f| NIL . #5#)
                      (LETT #4# (SPADCALL |x| (QREFELT $ 320)) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (|FS-;par| (QCAR |f|) $) (QCDR |f|)
                                         (QREFELT $ 314))
                               . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 136)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 145))))
                (QREFELT $ 136)))))) 

(DEFUN |FS-;retractIfCan;SU;104| (|x| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 324)) |FS-;retractIfCan;SU;104|)
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T (SPADCALL (QCDR |u|) (QREFELT $ 325))))))))) 

(DEFUN |FS-;retractIfCan;SU;105| (|x| $)
  (PROG (|d| |n|)
    (RETURN
     (SEQ
      (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
            . #1=(|FS-;retractIfCan;SU;105|))
      (EXIT
       (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
             (#2='T
              (SEQ
               (LETT |d| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 285)) $) . #1#)
               (EXIT
                (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                      (#2#
                       (CONS 0
                             (SPADCALL (QCDR |n|) (QCDR |d|)
                                       (QREFELT $ 306)))))))))))))) 

(DEFUN |FS-;coerce;PS;106| (|p| $)
  (SPADCALL (ELT $ 38) (ELT $ 327) |p| (QREFELT $ 330))) 

(DEFUN |FS-;coerce;FS;107| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 333)) (QREFELT $ 334))
            (SPADCALL (SPADCALL |x| (QREFELT $ 335)) (QREFELT $ 334))
            (QREFELT $ 290))) 

(DEFUN |FS-;isMult;SU;108| (|x| $)
  (PROG (|q| |r| #1=#:G785 |w| |v| |u|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |u| (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)
               . #2=(|FS-;isMult;SU;108|))
         (EXIT
          (COND
           ((QEQCAR |u| 1)
            (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #1#)))
           (#4='T
            (SEQ
             (LETT |v|
                   (SPADCALL (SPADCALL |x| (QREFELT $ 285)) (QREFELT $ 192))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |v| 1) (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #1#)))
               (#4#
                (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 227)) . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |w| 1)
                        (PROGN
                         (LETT #1# (CONS 1 #3#) . #2#)
                         (GO #1#))))))))))))))
        (LETT |r| (QCDR |u|) . #2#)
        (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 337)) . #2#)
        (EXIT
         (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
               (#4# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FS-;convert;SP;109| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 259))
            (SPADCALL (SPADCALL |x| (QREFELT $ 285)) (QREFELT $ 259))
            (QREFELT $ 338))) 

(DEFUN |FS-;convert;SP;110| (|x| $)
  (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 262))
            (SPADCALL (SPADCALL |x| (QREFELT $ 285)) (QREFELT $ 262))
            (QREFELT $ 339))) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpace&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 343) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2|
                                                         '(|AbelianSemiGroup|))
                                          (|HasCategory| |#2| '(|Group|))
                                          (|HasCategory| |#2| '(|SemiGroup|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|odd|)
      (QSETREFV $ 9 '|even|)
      (QSETREFV $ 10 '|%specialDiff|)
      (QSETREFV $ 15 (SPADCALL '|%diff| (QREFELT $ 14)))
      (QSETREFV $ 16 (SPADCALL '|%quote| (QREFELT $ 14)))
      (COND
       ((|testBitVector| |pv$| 11)
        (PROGN
         (QSETREFV $ 63 (CONS (|dispatchFunction| |FS-;eval;SSS;16|) $))
         (QSETREFV $ 66 (CONS (|dispatchFunction| |FS-;eval;SBoSSS;17|) $))
         (QSETREFV $ 73 (CONS (|dispatchFunction| |FS-;eval;SLLSS;18|) $))
         (SPADCALL (QREFELT $ 15) '|%specialInput|
                   (CONS (|function| |FS-;indiff|) $) (QREFELT $ 75)))))
      (COND
       ((|testBitVector| |pv$| 6)
        (PROGN
         (QSETREFV $ 82 '%%0)
         (QSETREFV $ 85
                   (CONS (|dispatchFunction| |FS-;characteristic;Nni;21|) $))
         (QSETREFV $ 90 (CONS (|dispatchFunction| |FS-;coerce;KS;22|) $))
         (QSETREFV $ 93 (CONS (|dispatchFunction| |FS-;numerator;2S;24|) $))
         (QSETREFV $ 99 (CONS (|dispatchFunction| |FS-;eval;SSNniMS;25|) $))
         (QSETREFV $ 100 (CONS (|dispatchFunction| |FS-;eval;SSNniMS;26|) $))
         (QSETREFV $ 102 (CONS (|dispatchFunction| |FS-;eval;SLLS;27|) $))
         (QSETREFV $ 111 (CONS (|dispatchFunction| |FS-;elt;BoLS;28|) $))
         (QSETREFV $ 112 (CONS (|dispatchFunction| |FS-;eval;SLLLS;29|) $))
         (QSETREFV $ 187 (CONS (|dispatchFunction| |FS-;coerce;PS;43|) $))
         (COND ((|testBitVector| |pv$| 11)))
         (QSETREFV $ 219 (CONS (|dispatchFunction| |FS-;isExpt;SBoU;54|) $))
         (QSETREFV $ 221 (CONS (|dispatchFunction| |FS-;isExpt;SSU;55|) $))
         (COND ((|testBitVector| |pv$| 1)))
         (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                   (QREFELT $ 228))
         (SPADCALL (QREFELT $ 15) '|%specialEqual|
                   (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 75))
         (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                   (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 75))
         (SPADCALL (QREFELT $ 15) '|%specialDisp|
                   (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 75))
         (COND ((|testBitVector| |pv$| 2))
               ('T
                (PROGN
                 (QSETREFV $ 231
                           (CONS (|dispatchFunction| |FS-;mainKernel;SU;59|)
                                 $))
                 (QSETREFV $ 232
                           (CONS (|dispatchFunction| |FS-;kernels;SL;60|) $))
                 (QSETREFV $ 234
                           (CONS (|dispatchFunction| |FS-;retract;SR;61|) $))
                 (QSETREFV $ 235
                           (CONS (|dispatchFunction| |FS-;retract;SP;62|) $))
                 (QSETREFV $ 236
                           (CONS (|dispatchFunction| |FS-;retractIfCan;SU;63|)
                                 $))
                 (QSETREFV $ 238
                           (CONS (|dispatchFunction| |FS-;retractIfCan;SU;64|)
                                 $))
                 (QSETREFV $ 239
                           (CONS (|dispatchFunction| |FS-;eval;SLLS;65|) $))
                 (QSETREFV $ 240
                           (CONS (|dispatchFunction| |FS-;subst;SLLS;66|) $))
                 (QSETREFV $ 241
                           (CONS
                            (|dispatchFunction| |FS-;differentiate;SSS;67|) $))
                 (QSETREFV $ 242
                           (CONS (|dispatchFunction| |FS-;coerce;SOf;68|) $))
                 (COND
                  ((|testBitVector| |pv$| 11)
                   (PROGN
                    (QSETREFV $ 243
                              (CONS (|dispatchFunction| |FS-;eval;SLS;69|) $))
                    (QSETREFV $ 244
                              (CONS (|dispatchFunction| |FS-;eval;2S;70|)
                                    $)))))
                 (QSETREFV $ 245
                           (CONS (|dispatchFunction| |FS-;eval;SLLLS;71|) $))
                 (QSETREFV $ 248
                           (CONS (|dispatchFunction| |FS-;isPlus;SU;72|) $))
                 (QSETREFV $ 250
                           (CONS (|dispatchFunction| |FS-;isTimes;SU;73|) $))
                 (QSETREFV $ 254
                           (CONS (|dispatchFunction| |FS-;isExpt;SU;74|) $))
                 (QSETREFV $ 257
                           (CONS (|dispatchFunction| |FS-;isPower;SU;75|) $))
                 (COND
                  ((|HasCategory| |#2|
                                  '(|ConvertibleTo| (|Pattern| (|Integer|))))
                   (QSETREFV $ 260
                             (CONS (|dispatchFunction| |FS-;convert;SP;76|)
                                   $))))
                 (COND
                  ((|HasCategory| |#2|
                                  '(|ConvertibleTo| (|Pattern| (|Float|))))
                   (QSETREFV $ 263
                             (CONS (|dispatchFunction| |FS-;convert;SP;77|)
                                   $))))
                 (COND
                  ((|testBitVector| |pv$| 1)
                   (QSETREFV $ 266
                             (CONS (|dispatchFunction| |FS-;isMult;SU;78|)
                                   $))))))))))
      (COND
       ((|testBitVector| |pv$| 3)
        (QSETREFV $ 268 (CONS (|dispatchFunction| |FS-;*;R2S;79|) $))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 231 (CONS (|dispatchFunction| |FS-;mainKernel;SU;80|) $))
         (QSETREFV $ 232 (CONS (|dispatchFunction| |FS-;kernels;SL;81|) $))
         (QSETREFV $ 275 (CONS (|dispatchFunction| |FS-;univariate;SKF;82|) $))
         (QSETREFV $ 248 (CONS (|dispatchFunction| |FS-;isPlus;SU;83|) $))
         (QSETREFV $ 250 (CONS (|dispatchFunction| |FS-;isTimes;SU;84|) $))
         (QSETREFV $ 254 (CONS (|dispatchFunction| |FS-;isExpt;SU;85|) $))
         (QSETREFV $ 257 (CONS (|dispatchFunction| |FS-;isPower;SU;86|) $))
         (QSETREFV $ 286 (CONS (|dispatchFunction| |FS-;denominator;2S;87|) $))
         (QSETREFV $ 291 (CONS (|dispatchFunction| |FS-;coerce;FS;88|) $))
         (QSETREFV $ 297 (CONS (|dispatchFunction| |FS-;coerce;FS;89|) $))
         (QSETREFV $ 303 (CONS (|dispatchFunction| |FS-;coerce;FS;90|) $))
         (QSETREFV $ 235 (CONS (|dispatchFunction| |FS-;retract;SP;91|) $))
         (QSETREFV $ 307 (CONS (|dispatchFunction| |FS-;retract;SF;92|) $))
         (QSETREFV $ 234 (CONS (|dispatchFunction| |FS-;retract;SR;93|) $))
         (QSETREFV $ 242 (CONS (|dispatchFunction| |FS-;coerce;SOf;94|) $))
         (QSETREFV $ 236
                   (CONS (|dispatchFunction| |FS-;retractIfCan;SU;95|) $))
         (QSETREFV $ 243 (CONS (|dispatchFunction| |FS-;eval;SLS;96|) $))
         (COND
          ((|testBitVector| |pv$| 11)
           (PROGN
            (QSETREFV $ 244 (CONS (|dispatchFunction| |FS-;eval;2S;97|) $))
            (QSETREFV $ 245
                      (CONS (|dispatchFunction| |FS-;eval;SLLLS;98|) $)))))
         (QSETREFV $ 241
                   (CONS (|dispatchFunction| |FS-;differentiate;SSS;99|) $))
         (QSETREFV $ 239 (CONS (|dispatchFunction| |FS-;eval;SLLS;100|) $))
         (QSETREFV $ 240 (CONS (|dispatchFunction| |FS-;subst;SLLS;101|) $))
         (QSETREFV $ 322 (CONS (|dispatchFunction| |FS-;convert;FS;103|) $))
         (QSETREFV $ 238
                   (CONS (|dispatchFunction| |FS-;retractIfCan;SU;104|) $))
         (QSETREFV $ 326
                   (CONS (|dispatchFunction| |FS-;retractIfCan;SU;105|) $))
         (QSETREFV $ 331 (CONS (|dispatchFunction| |FS-;coerce;PS;106|) $))
         (COND
          ((|testBitVector| |pv$| 1)
           (PROGN
            (QSETREFV $ 336 (CONS (|dispatchFunction| |FS-;coerce;FS;107|) $))
            (QSETREFV $ 266
                      (CONS (|dispatchFunction| |FS-;isMult;SU;108|) $)))))
         (COND
          ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
           (QSETREFV $ 260
                     (CONS (|dispatchFunction| |FS-;convert;SP;109|) $))))
         (COND
          ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
           (QSETREFV $ 263
                     (CONS (|dispatchFunction| |FS-;convert;SP;110|) $)))))))
      $)))) 

(MAKEPROP '|FunctionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ODD 'EVEN
              'SPECIALDIFF (|BasicOperator|) (|Symbol|) (|CommonOperators|)
              (0 . |operator|) '|opdiff| '|opquote| (|Union| 7 '#1="failed")
              (5 . |retractIfCan|) (|Boolean|) |FS-;ground?;SB;1|
              (10 . |retract|) |FS-;ground;SR;2| (|Kernel| 6) (15 . |kernel|)
              (|Kernel| $) (20 . |coerce|) |FS-;coerce;SS;3| (25 . |retract|)
              (|Union| 12 '"failed") (30 . |symbolIfCan|) |FS-;retract;SS;4|
              (|List| $) (35 . |applyQuote|) |FS-;applyQuote;S2S;5|
              |FS-;applyQuote;S3S;6| |FS-;applyQuote;S4S;7|
              |FS-;applyQuote;S5S;8| (41 . |coerce|) (46 . |elt|)
              |FS-;applyQuote;SLS;9| (52 . |has?|) (58 . |is?|)
              |FS-;belong?;BoB;10| (64 . |operator|) (|List| 6)
              (69 . |argument|) (74 . |kernel|) (80 . |name|) (|String|)
              (85 . |string|) (|OutputForm|) (90 . |coerce|)
              |FS-;operator;2Bo;12| (95 . |second|) (100 . |third|)
              (105 . |eval|) (|InputForm|) (112 . |convert|) (117 . |convert|)
              (122 . |convert|) (|List| 12) (127 . |eval|) (133 . |eval|)
              (|List| 11) (139 . |eval|) (147 . |eval|) (|Mapping| 6 6)
              (|MakeUnaryCompiledFunction| 6 6 6) (155 . |compiledFunction|)
              (|Mapping| $ $) (|List| 70) (161 . |eval|) (168 . |eval|)
              (|None|) (176 . |setProperty|) (|List| 25) (183 . |tower|)
              |FS-;variables;SL;19| (|Union| 25 '#1#) (188 . |retractIfCan|)
              |FS-;retractIfCan;SU;20| '|gendiff| (|NonNegativeInteger|)
              (193 . |characteristic|) (197 . |characteristic|)
              (|SparseMultivariatePolynomial| 7 23) (201 . |coerce|)
              (|SparseMultivariatePolynomial| 7 25) (206 . |coerce|)
              (211 . |coerce|) (216 . |coerce|) (221 . |numer|)
              (226 . |numerator|) (231 . |first|) (|List| 83) (|Mapping| $ 32)
              (|List| 96) (236 . |eval|) (244 . |eval|) (252 . |eval|)
              (260 . |new|) (266 . |eval|) (273 . |unary?|)
              (278 . |leadingCoefficient|) (283 . |Zero|) (287 . |smaller?|)
              (293 . -) (298 . |elt|) (|ExpressionSpace&| 6) (304 . |elt|)
              (310 . |elt|) (316 . |eval|) (|Union| 23 '#2="failed")
              (324 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (329 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 86) (|SparseUnivariatePolynomial| 86)
              (|SparseUnivariatePolynomialFunctions2| 86 6) (335 . |map|)
              (|Integer|) (341 . |position|) (347 . |minIndex|) (352 . |elt|)
              (358 . |Zero|) (|Mapping| 6 45) (|List| 127) (362 . |elt|)
              (368 . |elt|) (374 . |Zero|) (378 . ~=) (384 . |degree|)
              (389 . ^) (395 . |leadingCoefficient|) (400 . *) (406 . +)
              (412 . |reductum|) (417 . |coerce|) (422 . |is?|) (|List| 51)
              (428 . |position|) (434 . |setelt|) (441 . |coerce|)
              (446 . |One|) (450 . |One|) (454 . |minIndex|) (459 . |coerce|)
              (464 . |hconcat|) (470 . |position|) (476 . |sub|)
              (482 . |differentiate|) (|Union| 74 '"failed") (488 . |property|)
              (494 . |prefix|) (500 . |copy|) (505 . |setelt|)
              (512 . |member?|) (518 . |differentiate|) (524 . ~=)
              (530 . |subst|) (537 . |maxIndex|) (|Union| 128 '"failed")
              (|BasicOperatorFunctions1| 6) (542 . |derivative|) (547 . |elt|)
              (|Equation| 6) (553 . =) (|Equation| $) (559 . |subst|)
              (565 . |kernel|) (571 . ~=) (|Polynomial| 7) (577 . |coerce|)
              (582 . |differentiate|) (588 . |retract|) (|Mapping| 7 7)
              (593 . |map|) (|List| 23) (599 . |variables|)
              (604 . |differentiate|) (610 . |coerce|) (|Mapping| 6 12)
              (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 173 6)
              (615 . |map|) (622 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (627 . |less?|) (633 . <)
              (639 . |retractIfCan|) (644 . |coerce|) (649 . |userOrdered?|)
              (653 . |coerce|) (658 . |outputForm|) (|Mapping| 6 23)
              (|ListToMap| 23 6) (664 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 6)
              (672 . |map|) (679 . |eval|) (686 . |map|)
              (692 . |setIntersection|) (698 . |empty?|) (703 . |eval|)
              (708 . |retract|) (713 . |member?|) (|InputFormFunctions1| 6)
              (719 . |interpret|) (724 . |coerce|) (|Mapping| 173 23)
              (|Mapping| 173 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 173)
              (729 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 122))
              (|Union| 216 '"failed") (736 . |isExpt|) (741 . |isExpt|)
              (747 . |is?|) (753 . |isExpt|) (759 . |degree|)
              (764 . |reductum|) (769 . |leadingCoefficient|) (774 . |zero?|)
              (|Union| 122 '#1#) (779 . |retractIfCan|) (784 . |evaluate|)
              (790 . =) (796 . =) (802 . |mainKernel|) (807 . |kernels|)
              (812 . |retract|) (817 . |retract|) (822 . |retract|)
              (827 . |retractIfCan|) (|Union| 173 '"failed")
              (832 . |retractIfCan|) (837 . |eval|) (844 . |subst|)
              (851 . |differentiate|) (857 . |coerce|) (862 . |eval|)
              (868 . |eval|) (873 . |eval|) (|Union| 32 '#2#) (881 . |isPlus|)
              (886 . |isPlus|) (891 . |isTimes|) (896 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 83)) (|Union| 251 '#2#)
              (901 . |isExpt|) (906 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 122))
              (|Union| 255 '"failed") (911 . |isPower|) (|Pattern| 122)
              (916 . |convert|) (921 . |convert|) (|Pattern| (|Float|))
              (926 . |convert|) (931 . |convert|)
              (|Record| (|:| |coef| 122) (|:| |var| 25))
              (|Union| 264 '"failed") (936 . |isMult|) (941 . |coerce|)
              (946 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 86 6)
              (952 . |mainVariable|) (957 . |variables|) (|Fraction| 117)
              (962 . |univariate|) (|Fraction| 115) (968 . |univariate|)
              (|Union| 45 '"failed") (974 . |isPlus|) (979 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 122))
              (|Union| 279 '"failed") (984 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 122))
              (|Union| 282 '"failed") (989 . |isPower|) (994 . |denom|)
              (999 . |denominator|) (|Fraction| 7) (1004 . |numer|)
              (1009 . |denom|) (1014 . /) (1020 . |coerce|) (|Fraction| 173)
              (1025 . |numer|) (1030 . |coerce|) (1035 . |denom|) (1040 . /)
              (1046 . |coerce|) (|Polynomial| 287) (|Fraction| 298)
              (1051 . |numer|) (1056 . |coerce|) (1061 . |denom|)
              (1066 . |coerce|) (1071 . |retract|) (1076 . |retract|)
              (1081 . /) (1087 . |retract|) (|Union| $ '"failed")
              (1092 . |exquo|) (1098 . |One|) (1102 . =) (1108 . /) (1114 . -)
              (1120 . ^) (1126 . |paren|) (|Factored| 6) (1131 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 122)) (|List| 318)
              (1136 . |factors|) (|Factored| $) (1141 . |convert|)
              (|Union| 292 '#1#) (1146 . |retractIfCan|)
              (1151 . |retractIfCan|) (1156 . |retractIfCan|) (1161 . |coerce|)
              (|Mapping| 6 287)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 287 298
                                           6)
              (1166 . |map|) (1173 . |coerce|) (|Fraction| 122)
              (1178 . |numer|) (1183 . |coerce|) (1188 . |denom|)
              (1193 . |coerce|) (1198 . |exquo|) (1204 . /) (1210 . /)
              (|PositiveInteger|) (|Union| 332 '#1#) (|List| 169))
           '#(|variables| 1216 |univariate| 1221 |subst| 1227 |retractIfCan|
              1234 |retract| 1254 |operator| 1274 |numerator| 1279 |mainKernel|
              1284 |kernels| 1289 |isTimes| 1294 |isPower| 1299 |isPlus| 1304
              |isMult| 1309 |isExpt| 1314 |ground?| 1331 |ground| 1336 |eval|
              1341 |elt| 1420 |differentiate| 1426 |denominator| 1432 |convert|
              1437 |coerce| 1452 |characteristic| 1497 |belong?| 1501
              |applyQuote| 1506 * 1542)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 339
                                                 '(1 13 11 12 14 1 6 17 0 18 1
                                                   6 7 0 21 1 23 0 12 24 1 6 0
                                                   25 26 1 6 25 0 28 1 23 29 0
                                                   30 2 6 0 12 32 33 1 6 0 12
                                                   38 2 6 0 11 32 39 2 11 19 0
                                                   12 41 2 11 19 0 12 42 1 23
                                                   11 0 44 1 23 45 0 46 2 6 0
                                                   11 32 47 1 11 12 0 48 1 12
                                                   49 0 50 1 49 51 0 52 1 45 6
                                                   0 54 1 45 6 0 55 3 6 0 0 25
                                                   0 56 1 12 57 0 58 1 57 0 32
                                                   59 1 6 57 0 60 2 6 0 0 61 62
                                                   2 0 0 0 12 63 4 6 0 0 64 32
                                                   12 65 4 0 0 0 11 0 12 66 2
                                                   68 67 6 12 69 3 6 0 0 64 71
                                                   72 4 0 0 0 64 32 12 73 3 11
                                                   0 0 12 74 75 1 6 76 0 77 1 6
                                                   79 0 80 0 7 83 84 0 0 83 85
                                                   1 86 0 23 87 1 6 0 88 89 1 0
                                                   0 25 90 1 12 0 49 91 1 6 88
                                                   0 92 1 0 0 0 93 1 45 6 0 94
                                                   4 6 0 0 61 95 97 98 4 0 0 0
                                                   12 83 70 99 4 0 0 0 12 83 96
                                                   100 2 95 0 83 83 101 3 0 0 0
                                                   61 97 102 1 11 19 0 103 1 86
                                                   7 0 104 0 7 0 105 2 7 19 0 0
                                                   106 1 6 0 0 107 2 6 0 11 0
                                                   108 2 109 0 11 32 110 2 0 0
                                                   11 32 111 4 0 0 0 61 95 71
                                                   112 1 86 113 0 114 2 86 115
                                                   0 23 116 2 120 117 118 119
                                                   121 2 61 122 12 0 123 1 61
                                                   122 0 124 2 117 6 0 6 125 0
                                                   6 0 126 2 128 127 0 122 129
                                                   2 95 83 0 122 130 0 117 0
                                                   131 2 117 19 0 0 132 1 117
                                                   83 0 133 2 6 0 0 83 134 1
                                                   117 6 0 135 2 6 0 0 0 136 2
                                                   6 0 0 0 137 1 117 0 0 138 1
                                                   6 51 0 139 2 23 19 0 11 140
                                                   2 141 122 51 0 142 3 141 51
                                                   0 122 51 143 1 12 51 0 144 0
                                                   6 0 145 0 7 0 146 1 45 122 0
                                                   147 1 122 51 0 148 2 51 0 0
                                                   0 149 2 45 122 6 0 150 2 51
                                                   0 0 0 151 2 51 0 0 83 152 2
                                                   11 153 0 12 154 2 51 0 0 32
                                                   155 1 45 0 0 156 3 45 6 0
                                                   122 6 157 2 45 19 6 0 158 2
                                                   6 0 0 12 159 2 6 19 0 0 160
                                                   3 6 0 0 76 32 161 1 45 122 0
                                                   162 1 164 163 11 165 2 45 6
                                                   0 122 166 2 167 0 6 6 168 2
                                                   6 0 0 169 170 2 6 0 11 0 171
                                                   2 83 19 0 0 172 1 173 0 7
                                                   174 2 173 0 0 12 175 1 173 7
                                                   0 176 2 86 0 177 0 178 1 86
                                                   179 0 180 2 86 0 0 23 181 1
                                                   6 0 7 182 3 185 6 183 184
                                                   173 186 1 0 0 173 187 2 189
                                                   188 12 12 190 2 23 19 0 0
                                                   191 1 86 17 0 192 1 7 51 0
                                                   193 0 189 19 194 1 23 51 0
                                                   195 2 117 51 0 51 196 4 198
                                                   6 179 45 23 197 199 3 200 6
                                                   197 184 86 201 3 6 0 0 76 32
                                                   202 2 6 0 70 25 203 2 179 0
                                                   0 0 204 1 179 19 0 205 1 6 0
                                                   0 206 1 6 12 0 207 2 61 19
                                                   12 0 208 1 209 6 57 210 1
                                                   173 0 12 211 3 214 173 212
                                                   213 86 215 1 6 217 0 218 2 0
                                                   217 0 11 219 2 23 19 0 12
                                                   220 2 0 217 0 12 221 1 119
                                                   83 0 222 1 119 0 0 223 1 119
                                                   86 0 224 1 86 19 0 225 1 7
                                                   226 0 227 2 164 11 11 127
                                                   228 2 11 19 0 0 229 2 6 19 0
                                                   0 230 1 0 79 0 231 1 0 76 0
                                                   232 1 86 7 0 233 1 0 7 0 234
                                                   1 0 173 0 235 1 0 17 0 236 1
                                                   0 237 0 238 3 0 0 0 76 32
                                                   239 3 0 0 0 76 32 240 2 0 0
                                                   0 12 241 1 0 51 0 242 2 0 0
                                                   0 61 243 1 0 0 0 244 4 0 0 0
                                                   61 95 97 245 1 86 246 0 247
                                                   1 0 246 0 248 1 86 246 0 249
                                                   1 0 246 0 250 1 86 252 0 253
                                                   1 0 217 0 254 1 0 256 0 257
                                                   1 86 258 0 259 1 0 258 0 260
                                                   1 86 261 0 262 1 0 261 0 263
                                                   1 0 265 0 266 1 86 0 7 267 2
                                                   0 0 7 0 268 1 269 113 6 270
                                                   1 269 179 6 271 2 269 272 6
                                                   23 273 2 0 274 0 25 275 1
                                                   269 276 6 277 1 269 276 6
                                                   278 1 269 280 6 281 1 269
                                                   283 6 284 1 6 88 0 285 1 0 0
                                                   0 286 1 287 7 0 288 1 287 7
                                                   0 289 2 6 0 88 88 290 1 0 0
                                                   287 291 1 292 173 0 293 1 6
                                                   0 173 294 1 292 173 0 295 2
                                                   6 0 0 0 296 1 0 0 292 297 1
                                                   299 298 0 300 1 6 0 298 301
                                                   1 299 298 0 302 1 0 0 299
                                                   303 1 6 292 0 304 1 292 173
                                                   0 305 2 292 0 173 173 306 1
                                                   0 292 0 307 2 7 308 0 0 309
                                                   0 86 0 310 2 86 19 0 0 311 2
                                                   51 0 0 0 312 2 6 0 0 0 313 2
                                                   6 0 0 122 314 1 6 0 0 315 1
                                                   316 6 0 317 1 316 319 0 320
                                                   1 0 0 321 322 1 6 323 0 324
                                                   1 292 237 0 325 1 0 323 0
                                                   326 1 6 0 287 327 3 329 6
                                                   183 328 298 330 1 0 0 298
                                                   331 1 332 122 0 333 1 86 0
                                                   122 334 1 332 122 0 335 1 0
                                                   0 332 336 2 122 308 0 0 337
                                                   2 258 0 0 0 338 2 261 0 0 0
                                                   339 1 0 61 0 78 2 0 274 0 25
                                                   275 3 0 0 0 76 32 240 1 0
                                                   237 0 238 1 0 323 0 326 1 0
                                                   17 0 236 1 0 29 0 81 1 0 173
                                                   0 235 1 0 292 0 307 1 0 7 0
                                                   234 1 0 12 0 31 1 0 11 11 53
                                                   1 0 0 0 93 1 0 79 0 231 1 0
                                                   76 0 232 1 0 246 0 250 1 0
                                                   256 0 257 1 0 246 0 248 1 0
                                                   265 0 266 2 0 217 0 11 219 2
                                                   0 217 0 12 221 1 0 217 0 254
                                                   1 0 19 0 20 1 0 7 0 22 4 0 0
                                                   0 12 83 70 99 4 0 0 0 61 95
                                                   97 245 4 0 0 0 12 83 96 100
                                                   4 0 0 0 61 95 71 112 4 0 0 0
                                                   64 32 12 73 1 0 0 0 244 4 0
                                                   0 0 11 0 12 66 2 0 0 0 12 63
                                                   2 0 0 0 61 243 3 0 0 0 61 97
                                                   102 3 0 0 0 76 32 239 2 0 0
                                                   11 32 111 2 0 0 0 12 241 1 0
                                                   0 0 286 1 0 0 321 322 1 0
                                                   261 0 263 1 0 258 0 260 1 0
                                                   0 173 187 1 0 0 332 336 1 0
                                                   0 292 297 1 0 0 298 331 1 0
                                                   0 299 303 1 0 0 287 291 1 0
                                                   0 12 27 1 0 51 0 242 1 0 0
                                                   25 90 0 0 83 85 1 0 19 11 43
                                                   5 0 0 12 0 0 0 0 37 2 0 0 12
                                                   32 40 4 0 0 12 0 0 0 36 2 0
                                                   0 12 0 34 3 0 0 12 0 0 35 2
                                                   0 0 7 0 268)))))
           '|lookupComplete|)) 
