
(/VERSIONCHECK 2) 

(DEFUN |INBFF;inv;2V;1| (|a| $)
  (PROG (|erg| |b| #1=#:G120)
    (RETURN
     (SEQ
      (LETT |b|
            (SPADCALL
             (SPADCALL |a|
                       (SPADCALL
                        (PROG1
                            (LETT #1# (- (QVSIZE |a|) 1)
                                  . #2=(|INBFF;inv;2V;1|))
                          (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                           #1#))
                        (QREFELT $ 15))
                       1 (QREFELT $ 19))
             1 (QREFELT $ 20))
            . #2#)
      (EXIT
       (LETT |erg|
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |a| |b| (QREFELT $ 21)) 1 (QREFELT $ 22))
                (QREFELT $ 12) (QREFELT $ 23))
               (QREFELT $ 24))
              |b| (QREFELT $ 25))
             . #2#)))))) 

(DEFUN |INBFF;^;VIV;2| (|a| |ex| $)
  (PROG (|mult| |k| |expT| |logqe| |q1| |e1| |e| #1=#:G129 #2=#:G128)
    (RETURN
     (SEQ
      (LETT |e|
            (PROG1
                (LETT #1#
                      (SPADCALL |ex|
                                (-
                                 (SPADCALL (QREFELT $ 9)
                                           (PROG1
                                               (LETT #2# (QVSIZE |a|)
                                                     . #3=(|INBFF;^;VIV;2|))
                                             (|check_subtype| (> #2# 0)
                                                              '(|PositiveInteger|)
                                                              #2#))
                                           (QREFELT $ 28))
                                 1)
                                (QREFELT $ 29))
                      . #3#)
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #3#)
      (EXIT
       (COND ((ZEROP |e|) (MAKEARR1 (QVSIZE |a|) (QREFELT $ 12)))
             ((EQL |e| 1) (SPADCALL |a| (QREFELT $ 30)))
             (#4='T
              (SEQ
               (LETT |e1| (SPADCALL (INTEGER-LENGTH |e|) (QREFELT $ 15)) . #3#)
               (EXIT
                (COND
                 ((SPADCALL (QREFELT $ 9) 11 (QREFELT $ 32))
                  (SEQ
                   (LETT |q1|
                         (SPADCALL (INTEGER-LENGTH (QREFELT $ 9))
                                   (QREFELT $ 15))
                         . #3#)
                   (LETT |logqe| (|add_SI| (|quo_SI| |e1| |q1|) 1) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL (* 10 (- (+ |logqe| (QREFELT $ 9)) 2))
                                (|mul_SI| 15 |e1|) (QREFELT $ 32))
                      (SPADCALL |a| |e| (QREFELT $ 33)))
                     (#4# (SPADCALL |a| |e| 1 (QREFELT $ 34)))))))
                 (#4#
                  (SEQ
                   (LETT |logqe|
                         (|add_SI|
                          (|quo_SI| (|mul_SI| 10 |e1|)
                                    (SPADCALL (QREFELT $ 16) (QREFELT $ 9)
                                              (QREFELT $ 36)))
                          1)
                         . #3#)
                   (LETT |k| 1 . #3#)
                   (LETT |expT|
                         (SPADCALL (QREFELT $ 17) (QREFELT $ 9) (QREFELT $ 38))
                         . #3#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((SPADCALL |logqe|
                                       (SPADCALL |expT| |k| (QREFELT $ 36))
                                       (QREFELT $ 39))
                             (COND
                              ((|zero?_SI|
                                (SPADCALL |expT| |k| (QREFELT $ 36)))
                               'NIL)
                              ('T 'T)))
                            ('T 'NIL)))
                          (GO G191)))
                        (SEQ (EXIT (LETT |k| (|add_SI| |k| 1) . #3#))) NIL
                        (GO G190) G191 (EXIT NIL))
                   (LETT |mult|
                         (-
                          (+
                           (* (- (QREFELT $ 9) 1)
                              (EXPT (QREFELT $ 9) (|sub_SI| |k| 1)))
                           (|quo_SI| (|sub_SI| (|add_SI| |logqe| |k|) 1) |k|))
                          2)
                         . #3#)
                   (EXIT
                    (COND
                     ((>= (SPADCALL 10 |mult| (QREFELT $ 40))
                          (SPADCALL 15 |e1| (QREFELT $ 40)))
                      (SPADCALL |a| |e| (QREFELT $ 33)))
                     (#4# (SPADCALL |a| |e| |k| (QREFELT $ 34))))))))))))))))) 

(DEFUN |INBFF;repSq;VNniV;3| (|b| |e| $)
  (PROG (|a|)
    (RETURN
     (SEQ (LETT |a| (SPADCALL |b| (QREFELT $ 30)) |INBFF;repSq;VNniV;3|)
          (EXIT
           (COND ((EQL |e| 1) |a|)
                 ((ODDP |e|)
                  (SPADCALL |a|
                            (SPADCALL (SPADCALL |a| |a| (QREFELT $ 21))
                                      (QUOTIENT2 |e| 2) (QREFELT $ 33))
                            (QREFELT $ 21)))
                 ('T
                  (SPADCALL (SPADCALL |a| |a| (QREFELT $ 21)) (QUOTIENT2 |e| 2)
                            (QREFELT $ 33))))))))) 

(DEFUN |INBFF;dAndcExp;VNniSiV;4| (|a| |e| |k| $)
  (PROG (|i| |erg| #1=#:G153 |j| |ex| |l| |plist| |b| #2=#:G152 |qk|)
    (RETURN
     (SEQ
      (LETT |plist| (LIST (SPADCALL |a| (QREFELT $ 30)))
            . #3=(|INBFF;dAndcExp;VNniSiV;4|))
      (LETT |qk| (EXPT (QREFELT $ 9) |k|) . #3#)
      (SEQ (LETT |j| 2 . #3#) (LETT #2# (- |qk| 1) . #3#) G190
           (COND ((|greater_SI| |j| #2#) (GO G191)))
           (SEQ
            (COND
             ((EQL (SPADCALL |j| (QREFELT $ 9) (QREFELT $ 29)) 0)
              (LETT |b|
                    (SPADCALL
                     (SPADCALL |plist| (QUOTIENT2 |j| (QREFELT $ 9))
                               (QREFELT $ 43))
                     1 (QREFELT $ 20))
                    . #3#))
             ('T
              (LETT |b|
                    (SPADCALL |a| (SPADCALL |plist| (QREFELT $ 44))
                              (QREFELT $ 21))
                    . #3#)))
            (EXIT (LETT |plist| (SPADCALL |plist| |b| (QREFELT $ 45)) . #3#)))
           (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |l| NIL . #3#) (LETT |ex| |e| . #3#)
      (SEQ G190 (COND ((NULL (COND ((EQL |ex| 0) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |l|
                  (SPADCALL |l| (SPADCALL |ex| |qk| (QREFELT $ 29))
                            (QREFELT $ 48))
                  . #3#)
            (EXIT (LETT |ex| (QUOTIENT2 |ex| |qk|) . #3#)))
           NIL (GO G190) G191 (EXIT NIL))
      (COND
       ((EQL (|SPADfirst| |l|) 0)
        (LETT |erg| (MAKEARR1 (QVSIZE |a|) (QREFELT $ 12)) . #3#))
       ('T
        (LETT |erg| (SPADCALL |plist| (|SPADfirst| |l|) (QREFELT $ 43))
              . #3#)))
      (LETT |i| |k| . #3#)
      (SEQ (LETT |j| NIL . #3#) (LETT #1# (CDR |l|) . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |j| (CAR #1#) . #3#) NIL)) (GO G191)))
           (SEQ
            (COND
             ((SPADCALL |j| 0 (QREFELT $ 49))
              (LETT |erg|
                    (SPADCALL |erg|
                              (SPADCALL (SPADCALL |plist| |j| (QREFELT $ 43))
                                        |i| (QREFELT $ 20))
                              (QREFELT $ 21))
                    . #3#)))
            (EXIT (LETT |i| (|add_SI| |i| |k|) . #3#)))
           (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |erg|))))) 

(DEFUN |INBFF;*;3V;5| (|a| |b| $)
  (PROG (|k| |x| |y| #1=#:G166 |t| |j| #2=#:G165 |i| #3=#:G164 |erg| |e|)
    (RETURN
     (SEQ
      (LETT |e| (SPADCALL (QVSIZE |a|) (QREFELT $ 15)) . #4=(|INBFF;*;3V;5|))
      (LETT |erg| (SPADCALL (QVSIZE |a|) (QREFELT $ 50)) . #4#)
      (SEQ (LETT |t| NIL . #4#)
           (LETT #3# (SPADCALL (QREFELT $ 11) 1 (QREFELT $ 54)) . #4#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#) . #4#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#) G190
                  (COND ((|greater_SI| |j| |e|) (GO G191)))
                  (SEQ (LETT |y| (QCAR |t|) . #4#) (LETT |x| (QCDR |t|) . #4#)
                       (LETT |k|
                             (|add_SI|
                              (|addmod_SI| |x| (SPADCALL |j| (QREFELT $ 15))
                                           |e|)
                              1)
                             . #4#)
                       (EXIT
                        (SPADCALL |erg| |k|
                                  (SPADCALL (SPADCALL |erg| |k| (QREFELT $ 22))
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |a| |j| (QREFELT $ 22))
                                              (SPADCALL |b| |j| (QREFELT $ 22))
                                              (QREFELT $ 23))
                                             |y| (QREFELT $ 23))
                                            (QREFELT $ 55))
                                  (QREFELT $ 56))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |i| 1 . #4#) (LETT #2# (|sub_SI| |e| 1) . #4#) G190
           (COND ((|greater_SI| |i| #2#) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| (+ |i| 1) . #4#) G190
                  (COND ((> |j| |e|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |t| NIL . #4#)
                         (LETT #1#
                               (SPADCALL (QREFELT $ 11) (+ (- |j| |i|) 1)
                                         (QREFELT $ 54))
                               . #4#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ (LETT |y| (QCAR |t|) . #4#)
                              (LETT |x| (QCDR |t|) . #4#)
                              (LETT |k|
                                    (|add_SI|
                                     (|addmod_SI| |x|
                                                  (SPADCALL |i| (QREFELT $ 15))
                                                  |e|)
                                     1)
                                    . #4#)
                              (EXIT
                               (SPADCALL |erg| |k|
                                         (SPADCALL
                                          (SPADCALL |erg| |k| (QREFELT $ 22))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |a| |i| (QREFELT $ 22))
                                             (SPADCALL |b| |j| (QREFELT $ 22))
                                             (QREFELT $ 23))
                                            (SPADCALL
                                             (SPADCALL |a| |j| (QREFELT $ 22))
                                             (SPADCALL |b| |i| (QREFELT $ 22))
                                             (QREFELT $ 23))
                                            (QREFELT $ 55))
                                           |y| (QREFELT $ 23))
                                          (QREFELT $ 55))
                                         (QREFELT $ 56))))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (+ |j| 1) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |erg|))))) 

(DEFUN |INBFF;lookup;VPi;6| (|x| $)
  (PROG (#1=#:G169 #2=#:G168 |erg| |j|)
    (RETURN
     (SEQ (LETT |erg| 0 . #3=(|INBFF;lookup;VPi;6|))
          (SEQ (LETT |j| (QVSIZE |x|) . #3#) G190 (COND ((< |j| 1) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |erg|
                       (+ (* |erg| (QREFELT $ 9))
                          (REM
                           (SPADCALL (SPADCALL |x| |j| (QREFELT $ 22))
                                     (QREFELT $ 57))
                           (QREFELT $ 9)))
                       . #3#)))
               (LETT |j| (+ |j| -1) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((EQL |erg| 0)
             (PROG1 (LETT #2# (EXPT (QREFELT $ 9) (QVSIZE |x|)) . #3#)
               (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#)))
            ('T
             (PROG1 (LETT #1# |erg| . #3#)
               (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))))))) 

(DEFUN |INBFF;norm;VPiV;7| (|a| |d| $)
  (PROG (|r| |dSI|)
    (RETURN
     (SEQ (LETT |dSI| (SPADCALL |d| (QREFELT $ 15)) . #1=(|INBFF;norm;VPiV;7|))
          (LETT |r|
                (SPADCALL (SPADCALL (QVSIZE |a|) (QREFELT $ 15)) |dSI|
                          (QREFELT $ 60))
                . #1#)
          (COND
           ((NULL (|eql_SI| (QCDR |r|) 0))
            (EXIT (|error| "norm: 2.arg must divide extdeg"))))
          (EXIT (SPADCALL |a| (QCAR |r|) |dSI| (QREFELT $ 19))))))) 

(DEFUN |INBFF;expPot;V2SiV;8| (|a| |e| |d| $)
  (PROG (|qpot| |erg| |k2| |y| #1=#:G185 |k| |deg|)
    (RETURN
     (SEQ
      (LETT |deg| (SPADCALL (QVSIZE |a|) (QREFELT $ 15))
            . #2=(|INBFF;expPot;V2SiV;8|))
      (EXIT
       (COND ((|eql_SI| |e| 1) (SPADCALL |a| (QREFELT $ 30)))
             (#3='T
              (SEQ (LETT |k2| |d| . #2#)
                   (LETT |y| (SPADCALL |a| (QREFELT $ 30)) . #2#)
                   (COND
                    ((SPADCALL |e| 0 (QREFELT $ 62))
                     (SEQ (LETT |erg| (SPADCALL |y| (QREFELT $ 30)) . #2#)
                          (EXIT (LETT |qpot| |k2| . #2#))))
                    (#3#
                     (SEQ
                      (LETT |erg|
                            (MAKEARR1 (QVSIZE |a|)
                                      (SPADCALL (QREFELT $ 12) (QREFELT $ 24)))
                            . #2#)
                      (EXIT (LETT |qpot| 0 . #2#)))))
                   (SEQ (LETT |k| 1 . #2#)
                        (LETT #1# (INTEGER-LENGTH |e|) . #2#) G190
                        (COND ((|greater_SI| |k| #1#) (GO G191)))
                        (SEQ
                         (LETT |y|
                               (SPADCALL |y| (SPADCALL |y| |k2| (QREFELT $ 20))
                                         (QREFELT $ 21))
                               . #2#)
                         (LETT |k2| (|addmod_SI| |k2| |k2| |deg|) . #2#)
                         (EXIT
                          (COND
                           ((SPADCALL |e| |k| (QREFELT $ 63))
                            (SEQ
                             (LETT |erg|
                                   (SPADCALL |erg|
                                             (SPADCALL |y| |qpot|
                                                       (QREFELT $ 20))
                                             (QREFELT $ 21))
                                   . #2#)
                             (EXIT
                              (LETT |qpot| (|addmod_SI| |qpot| |k2| |deg|)
                                    . #2#)))))))
                        (LETT |k| (|inc_SI| |k|) . #2#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |erg|))))))))) 

(DEFUN |INBFF;qPot;VIV;9| (|e| |n| $)
  (PROG (|i| |e1| |m| |ei|)
    (RETURN
     (SEQ
      (LETT |ei| (SPADCALL (QVSIZE |e|) (QREFELT $ 15))
            . #1=(|INBFF;qPot;VIV;9|))
      (LETT |m| (SPADCALL (SPADCALL |n| (QREFELT $ 15)) |ei| (QREFELT $ 64))
            . #1#)
      (EXIT
       (COND ((|zero?_SI| |m|) |e|)
             ('T
              (SEQ (LETT |e1| (SPADCALL (QVSIZE |e|) (QREFELT $ 50)) . #1#)
                   (SEQ (LETT |i| (|add_SI| |m| 1) . #1#) G190
                        (COND ((|greater_SI| |i| |ei|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |e1| |i|
                                    (SPADCALL |e| (|sub_SI| |i| |m|)
                                              (QREFELT $ 22))
                                    (QREFELT $ 56))))
                        (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                        (EXIT NIL))
                   (SEQ (LETT |i| 1 . #1#) G190
                        (COND ((|greater_SI| |i| |m|) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |e1| |i|
                                    (SPADCALL |e| (- (+ |ei| |i|) |m|)
                                              (QREFELT $ 22))
                                    (QREFELT $ 56))))
                        (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |e1|))))))))) 

(DEFUN |INBFF;trace;VPiV;10| (|a| |d| $)
  (PROG (#1=#:G197 |j| |i| |sSI| |v| |r| |dSI|)
    (RETURN
     (SEQ
      (LETT |dSI| (SPADCALL |d| (QREFELT $ 15)) . #2=(|INBFF;trace;VPiV;10|))
      (LETT |r|
            (SPADCALL (SPADCALL (QVSIZE |a|) (QREFELT $ 15)) |dSI|
                      (QREFELT $ 60))
            . #2#)
      (COND
       ((NULL (|eql_SI| (QCDR |r|) 0))
        (EXIT (|error| "trace: 2.arg must divide extdeg"))))
      (LETT |v|
            (SPADCALL
             (SPADCALL |a| (SPADCALL 1 |dSI| (QREFELT $ 66)) (QREFELT $ 67))
             (QREFELT $ 30))
            . #2#)
      (LETT |sSI| (QCAR |r|) . #2#)
      (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |dSI|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #2#) (LETT #1# (|sub_SI| |sSI| 1) . #2#) G190
                  (COND ((|greater_SI| |j| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |v| |i|
                              (SPADCALL (SPADCALL |v| |i| (QREFELT $ 22))
                                        (SPADCALL |a|
                                                  (+ |i|
                                                     (|mul_SI|
                                                      (SPADCALL |j|
                                                                (QREFELT $ 15))
                                                      |dSI|))
                                                  (QREFELT $ 22))
                                        (QREFELT $ 55))
                              (QREFELT $ 56))))
                  (LETT |j| (|inc_SI| |j|) . #2#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |v|))))) 

(DEFUN |INBFF;random;PiV;11| (|n| $)
  (PROG (|i| |v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |n| (QREFELT $ 50)) . #1=(|INBFF;random;PiV;11|))
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |v| |i| (SPADCALL (QREFELT $ 69)) (QREFELT $ 56))))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |v|))))) 

(DEFUN |INBFF;xn;NniSup;12| (|m| $)
  (SPADCALL (SPADCALL (|spadConstant| $ 10) |m| (QREFELT $ 72))
            (|spadConstant| $ 73) (QREFELT $ 74))) 

(DEFUN |INBFF;normal?;VB;13| (|x| $)
  (COND
   ((SPADCALL
     (SPADCALL (SPADCALL (QVSIZE |x|) (QREFELT $ 75))
               (SPADCALL |x| (QREFELT $ 76)) (QREFELT $ 77))
     (|spadConstant| $ 73) (QREFELT $ 78))
    'T)
   ('T 'NIL))) 

(DEFUN |INBFF;/;3V;14| (|x| |y| $)
  (SPADCALL |x| (SPADCALL |y| (QREFELT $ 26)) (QREFELT $ 21))) 

(DEFUN |INBFF;setFieldInfo;VGFV;15| (|m| |n| $)
  (SEQ (SETELT $ 11 |m|) (SETELT $ 12 |n|) (EXIT (SPADCALL (QREFELT $ 82))))) 

(DEFUN |INBFF;minimalPolynomial;VSup;16| (|x| $)
  (PROG (|v| |y| #1=#:G214 |k| |j| |dy| #2=#:G213 |i| |m| |dx|)
    (RETURN
     (SEQ (LETT |dx| (QVSIZE |x|) . #3=(|INBFF;minimalPolynomial;VSup;16|))
          (LETT |y|
                (MAKEARR1 (QVSIZE |x|)
                          (SPADCALL (QREFELT $ 12) (QREFELT $ 24)))
                . #3#)
          (LETT |m| (SPADCALL |dx| (+ |dx| 1) (QREFELT $ 85)) . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #2# (+ |dx| 1) . #3#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (LETT |dy| (QVSIZE |y|) . #3#)
                    (SEQ (LETT |j| 1 . #3#) G190
                         (COND ((|greater_SI| |j| |dy|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |k| 0 . #3#)
                                (LETT #1# (- (QUOTIENT2 |dx| |dy|) 1) . #3#)
                                G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |m| (+ |j| (* |k| |dy|)) |i|
                                              (SPADCALL |y| |j| (QREFELT $ 22))
                                              1 1)))
                                (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT (LETT |y| (SPADCALL |y| |x| (QREFELT $ 21)) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |v| (|SPADfirst| (SPADCALL |m| (QREFELT $ 86))) . #3#)
          (EXIT (SPADCALL |v| (QREFELT $ 76))))))) 

(DEFUN |INBFF;basis;PiV;17| (|n| $)
  (PROG (|uniti| |i| |bas|)
    (RETURN
     (SEQ
      (LETT |bas| (MAKEARR1 |n| (SPADCALL |n| (QREFELT $ 50)))
            . #1=(|INBFF;basis;PiV;17|))
      (SEQ (LETT |i| 1 . #1#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |uniti| (SPADCALL |n| (QREFELT $ 50)) . #1#)
                (QSETAREF1O |uniti| |i| (|spadConstant| $ 10) 1)
                (EXIT (QSETAREF1O |bas| |i| |uniti| 1)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |bas|))))) 

(DEFUN |INBFF;normalElement;PiV;18| (|n| $)
  (PROG (|v|)
    (RETURN
     (SEQ (LETT |v| (SPADCALL |n| (QREFELT $ 50)) |INBFF;normalElement;PiV;18|)
          (QSETAREF1O |v| 1 (|spadConstant| $ 10) 1) (EXIT |v|))))) 

(DEFUN |INBFF;index;2PiV;19| (|degm| |n| $)
  (PROG (|m| |j| |erg|)
    (RETURN
     (SEQ
      (LETT |m| (REM |n| (SPADCALL (QREFELT $ 9) |degm| (QREFELT $ 28)))
            . #1=(|INBFF;index;2PiV;19|))
      (LETT |erg| (SPADCALL |degm| (QREFELT $ 50)) . #1#)
      (SEQ (LETT |j| 1 . #1#) G190 (COND ((|greater_SI| |j| |degm|) (GO G191)))
           (SEQ
            (SPADCALL |erg| |j|
                      (SPADCALL (+ (QREFELT $ 9) (REM |m| (QREFELT $ 9)))
                                (QREFELT $ 91))
                      (QREFELT $ 56))
            (EXIT (LETT |m| (QUOTIENT2 |m| (QREFELT $ 9)) . #1#)))
           (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT |erg|))))) 

(DEFUN |INBFF;pol;VSup;20| (|x| $)
  (PROG (#1=#:G226 #2=#:G225 #3=#:G227 #4=#:G228 #5=#:G230 |i|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #6=(|INBFF;pol;VSup;20|))
       (SEQ (LETT |i| 1 . #6#) (LETT #5# (QVSIZE |x|) . #6#) G190
            (COND ((|greater_SI| |i| #5#) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (SPADCALL |x| |i| (QREFELT $ 22))
                               (PROG1 (LETT #4# (- |i| 1) . #6#)
                                 (|check_subtype| (>= #4# 0)
                                                  '(|NonNegativeInteger|) #4#))
                               (QREFELT $ 72))
                     . #6#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 93)) . #6#))
                     ('T (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
            (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 94)))))))) 

(DECLAIM (NOTINLINE |InnerNormalBasisFieldFunctions;|)) 

(DEFUN |InnerNormalBasisFieldFunctions| (#1=#:G231)
  (PROG ()
    (RETURN
     (PROG (#2=#:G232)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|InnerNormalBasisFieldFunctions|)
                                           '|domainEqualList|)
                . #3=(|InnerNormalBasisFieldFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|InnerNormalBasisFieldFunctions;| #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|InnerNormalBasisFieldFunctions|))))))))))) 

(DEFUN |InnerNormalBasisFieldFunctions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|InnerNormalBasisFieldFunctions|))
      (LETT |dv$| (LIST '|InnerNormalBasisFieldFunctions| DV$1) . #1#)
      (LETT $ (GETREFV 95) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|InnerNormalBasisFieldFunctions|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
      (QSETREFV $ 11 (MAKEARR1 1 NIL))
      (QSETREFV $ 12 (|spadConstant| $ 10))
      (QSETREFV $ 16
                (LIST 0 (SPADCALL 10 (QREFELT $ 15))
                      (SPADCALL 16 (QREFELT $ 15)) (SPADCALL 20 (QREFELT $ 15))
                      (SPADCALL 23 (QREFELT $ 15)) 0
                      (SPADCALL 28 (QREFELT $ 15)) (SPADCALL 30 (QREFELT $ 15))
                      (SPADCALL 32 (QREFELT $ 15)) 0
                      (SPADCALL 35 (QREFELT $ 15))))
      (QSETREFV $ 17
                (LIST NIL
                      (LIST (SPADCALL 4 (QREFELT $ 15))
                            (SPADCALL 12 (QREFELT $ 15))
                            (SPADCALL 48 (QREFELT $ 15))
                            (SPADCALL 160 (QREFELT $ 15))
                            (SPADCALL 480 (QREFELT $ 15)) 0)
                      (LIST (SPADCALL 8 (QREFELT $ 15))
                            (SPADCALL 72 (QREFELT $ 15))
                            (SPADCALL 432 (QREFELT $ 15)) 0)
                      (LIST (SPADCALL 18 (QREFELT $ 15))
                            (SPADCALL 216 (QREFELT $ 15)) 0)
                      (LIST (SPADCALL 32 (QREFELT $ 15))
                            (SPADCALL 480 (QREFELT $ 15)) 0)
                      NIL (LIST (SPADCALL 72 (QREFELT $ 15)) 0)
                      (LIST (SPADCALL 98 (QREFELT $ 15)) 0)
                      (LIST (SPADCALL 128 (QREFELT $ 15)) 0) NIL
                      (LIST (SPADCALL 200 (QREFELT $ 15)) 0)))
      $)))) 

(MAKEPROP '|InnerNormalBasisFieldFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |size|) '|sizeGF| (4 . |One|) '|multTable| '|trGen|
              (|Integer|) (|SingleInteger|) (8 . |coerce|) '|logq| '|expTable|
              (|Vector| 6) |INBFF;expPot;V2SiV;8| |INBFF;qPot;VIV;9|
              |INBFF;*;3V;5| (13 . |elt|) (19 . *) (25 . |inv|) (30 . *)
              |INBFF;inv;2V;1| (|PositiveInteger|) (36 . ^)
              (42 . |positiveRemainder|) (48 . |copy|) (|Boolean|) (53 . >)
              |INBFF;repSq;VNniV;3| |INBFF;dAndcExp;VNniSiV;4| (|List| 14)
              (59 . |elt|) (|List| 35) (65 . |elt|) (71 . >=) (77 . *)
              |INBFF;^;VIV;2| (|List| 18) (83 . |elt|) (89 . |last|)
              (94 . |concat|) (100 . |Zero|) (|List| 7) (104 . |concat|)
              (110 . ~=) (116 . |zero|)
              (|Record| (|:| |value| 6) (|:| |index| 14)) (|List| 51)
              (|Vector| 52) (121 . |elt|) (127 . +) (133 . |setelt|)
              (140 . |lookup|) |INBFF;lookup;VPi;6|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (145 . |divide|) |INBFF;norm;VPiV;7| (151 . |bit?|)
              (157 . |bit?|) (163 . |positiveRemainder|)
              (|UniversalSegment| 13) (169 . SEGMENT) (175 . |elt|)
              |INBFF;trace;VPiV;10| (181 . |random|) |INBFF;random;PiV;11|
              (|SparseUnivariatePolynomial| 6) (185 . |monomial|) (191 . |One|)
              (195 . -) |INBFF;xn;NniSup;12| |INBFF;pol;VSup;20| (201 . |gcd|)
              (207 . =) |INBFF;normal?;VB;13| |INBFF;/;3V;14| (|Void|)
              (213 . |void|) |INBFF;setFieldInfo;VGFV;15| (|Matrix| 6)
              (217 . |zero|) (223 . |nullSpace|)
              |INBFF;minimalPolynomial;VSup;16| (|Vector| 18)
              |INBFF;basis;PiV;17| |INBFF;normalElement;PiV;18| (228 . |index|)
              |INBFF;index;2PiV;19| (233 . +) (239 . |Zero|))
           '#(|xn| 243 |trace| 248 |setFieldInfo| 254 |repSq| 260 |random| 266
              |qPot| 271 |pol| 277 |normalElement| 282 |normal?| 287 |norm| 292
              |minimalPolynomial| 298 |lookup| 303 |inv| 308 |index| 313
              |expPot| 319 |dAndcExp| 326 |basis| 333 ^ 338 / 344 * 350)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 94
                                                 '(0 6 7 8 0 6 0 10 1 14 0 13
                                                   15 2 18 6 0 13 22 2 6 0 0 0
                                                   23 1 6 0 0 24 2 18 0 6 0 25
                                                   2 7 0 0 27 28 2 13 0 0 0 29
                                                   1 18 0 0 30 2 13 31 0 0 32 2
                                                   35 14 0 13 36 2 37 35 0 13
                                                   38 2 14 31 0 0 39 2 13 0 27
                                                   0 40 2 42 18 0 13 43 1 42 18
                                                   0 44 2 42 0 0 18 45 0 6 0 46
                                                   2 47 0 0 7 48 2 7 31 0 0 49
                                                   1 18 0 7 50 2 53 52 0 13 54
                                                   2 6 0 0 0 55 3 18 6 0 13 6
                                                   56 1 6 27 0 57 2 14 59 0 0
                                                   60 2 14 31 0 0 62 2 13 31 0
                                                   0 63 2 14 0 0 0 64 2 65 0 13
                                                   13 66 2 18 0 0 65 67 0 6 0
                                                   69 2 71 0 6 7 72 0 71 0 73 2
                                                   71 0 0 0 74 2 71 0 0 0 77 2
                                                   71 31 0 0 78 0 81 0 82 2 84
                                                   0 7 7 85 1 84 42 0 86 1 6 0
                                                   27 91 2 71 0 0 0 93 0 71 0
                                                   94 1 0 71 7 75 2 0 18 18 27
                                                   68 2 0 81 53 6 83 2 0 18 18
                                                   7 33 1 0 18 27 70 2 0 18 18
                                                   13 20 1 0 71 18 76 1 0 18 27
                                                   90 1 0 31 18 79 2 0 18 18 27
                                                   61 1 0 71 18 87 1 0 27 18 58
                                                   1 0 18 18 26 2 0 18 27 27 92
                                                   3 0 18 18 14 14 19 3 0 18 18
                                                   7 14 34 1 0 88 27 89 2 0 18
                                                   18 13 41 2 0 18 18 18 80 2 0
                                                   18 18 18 21)))))
           '|lookupComplete|)) 
