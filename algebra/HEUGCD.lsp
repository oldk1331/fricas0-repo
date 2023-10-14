
(/VERSIONCHECK 2) 

(DEFUN |HEUGCD;myNextPrime| (|val| |bound| $) (SPADCALL |val| (QREFELT $ 10))) 

(DEFUN |HEUGCD;constNotZero| (|f| $)
  (COND
   ((EQL (SPADCALL |f| (QREFELT $ 12)) 0)
    (COND ((SPADCALL |f| (QREFELT $ 14)) 'NIL) (#1='T 'T)))
   (#1# 'NIL))) 

(DEFUN |HEUGCD;negShiftz| (|n| |Modulus| $)
  (COND ((< |n| 0) (LETT |n| (+ |n| |Modulus|) |HEUGCD;negShiftz|))
        ((SPADCALL |n| (QUOTIENT2 |Modulus| 2) (QREFELT $ 16))
         (- |n| |Modulus|))
        ('T |n|))) 

(DEFUN |HEUGCD;height| (|f| $)
  (PROG (|k| #1=#:G150)
    (RETURN
     (SEQ (LETT |k| 1 . #2=(|HEUGCD;height|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |f| (|spadConstant| $ 15) (QREFELT $ 17)))
                 (GO G191)))
               (SEQ
                (LETT |k|
                      (MAX |k|
                           (PROG1
                               (LETT #1# (ABS (SPADCALL |f| (QREFELT $ 18)))
                                     . #2#)
                             (|check_subtype| (> #1# 0) '(|PositiveInteger|)
                                              #1#)))
                      . #2#)
                (EXIT (LETT |f| (SPADCALL |f| (QREFELT $ 19)) . #2#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |k|))))) 

(DEFUN |HEUGCD;genpoly| (|dval| |value| $)
  (PROG (|val| |d| |val1| |i|)
    (RETURN
     (SEQ (LETT |d| (|spadConstant| $ 15) . #1=(|HEUGCD;genpoly|))
          (LETT |val| |dval| . #1#)
          (SEQ (LETT |i| 0 . #1#) G190
               (COND ((NULL (SPADCALL |val| 0 (QREFELT $ 20))) (GO G191)))
               (SEQ
                (LETT |val1| (|HEUGCD;negShiftz| (REM |val| |value|) |value| $)
                      . #1#)
                (LETT |d|
                      (SPADCALL |d| (SPADCALL |val1| |i| (QREFELT $ 21))
                                (QREFELT $ 22))
                      . #1#)
                (EXIT (LETT |val| (QUOTIENT2 (- |val| |val1|) |value|) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT |d|))))) 

(DEFUN |HEUGCD;smallest_to_front| (|l| $)
  (PROG (|ress| |smallest| #1=#:G163 |p|)
    (RETURN
     (SEQ (LETT |ress| NIL . #2=(|HEUGCD;smallest_to_front|))
          (LETT |smallest| (|SPADfirst| |l|) . #2#)
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((< |p| |smallest|)
                   (SEQ (LETT |ress| (CONS |smallest| |ress|) . #2#)
                        (EXIT (LETT |smallest| |p| . #2#))))
                  ('T (LETT |ress| (CONS |p| |ress|) . #2#)))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |smallest| |ress|)))))) 

(DEFUN |HEUGCD;lintgcd;LI;7| (|lval| $)
  (PROG (|val| #1=#:G169 |val1|)
    (RETURN
     (SEQ
      (COND ((NULL |lval|) 0) ((SPADCALL 1 |lval| (QREFELT $ 25)) 1)
            ('T
             (SEQ
              (LETT |lval| (|HEUGCD;smallest_to_front| |lval| $)
                    . #2=(|HEUGCD;lintgcd;LI;7|))
              (LETT |val| (|SPADfirst| |lval|) . #2#)
              (SEQ (LETT |val1| NIL . #2#) (LETT #1# (CDR |lval|) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |val1| (CAR #1#) . #2#) NIL)
                         (NULL (SPADCALL |val| 1 (QREFELT $ 20))))
                     (GO G191)))
                   (SEQ (EXIT (LETT |val| (GCD |val| |val1|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |val|)))))))) 

(DEFUN |HEUGCD;content;LL;8| (|listf| $)
  (PROG (#1=#:G173 |f| #2=#:G172)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|HEUGCD;content;LL;8|))
       (SEQ (LETT |f| NIL . #3#) (LETT #1# |listf| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (SPADCALL (SPADCALL |f| (QREFELT $ 27)) (QREFELT $ 26))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |HEUGCD;contprim| (|listf| $)
  (PROG (#1=#:G176 |c| #2=#:G181 |f| #3=#:G180)
    (RETURN
     (SEQ
      (PROGN
       (LETT #3# NIL . #4=(|HEUGCD;contprim|))
       (SEQ (LETT |f| NIL . #4#) (LETT #2# |listf| . #4#) G190
            (COND
             ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #3#
                    (CONS
                     (CONS
                      (LETT |c|
                            (SPADCALL (SPADCALL |f| (QREFELT $ 27))
                                      (QREFELT $ 26))
                            . #4#)
                      (PROG2 (LETT #1# (SPADCALL |f| |c| (QREFELT $ 31)) . #4#)
                          (QCDR #1#)
                        (|check_union| (QEQCAR #1# 0) (QREFELT $ 6) #1#)))
                     #3#)
                    . #4#)))
            (LETT #2# (CDR #2#) . #4#) (GO G190) G191
            (EXIT (NREVERSE #3#)))))))) 

(DEFUN |HEUGCD;constcase| (|listdeg| |listf| $)
  (PROG (#1=#:G197 |lcf| #2=#:G196 |d| |lclistf| #3=#:G195 |f| #4=#:G194
         #5=#:G185 #6=#:G184 #7=#:G186 #8=#:G193 |n| |lind|)
    (RETURN
     (SEQ
      (LETT |lind|
            (SPADCALL (CONS (|function| |HEUGCD;constNotZero|) $) |listf|
                      (QREFELT $ 33))
            . #9=(|HEUGCD;constcase|))
      (EXIT
       (COND
        ((NULL |lind|)
         (COND
          ((SPADCALL 1 |listdeg| (QREFELT $ 35))
           (|HEUGCD;lincase| |listdeg| |listf| $))
          (#10='T (|HEUGCD;localgcd| |listf| $))))
        ((PROGN
          (LETT #5# NIL . #9#)
          (SEQ (LETT |n| NIL . #9#) (LETT #8# |listdeg| . #9#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |n| (CAR #8#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (PROGN
                  (LETT #7# (SPADCALL |n| 0 (QREFELT $ 36)) . #9#)
                  (COND (#5# (LETT #6# (COND (#6# 'T) ('T #7#)) . #9#))
                        ('T
                         (PROGN (LETT #6# #7# . #9#) (LETT #5# 'T . #9#)))))))
               (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
          (COND (#5# #6#) (#10# 'NIL)))
         (CONS (|spadConstant| $ 23) |listf|))
        (#10#
         (SEQ
          (LETT |lclistf|
                (PROGN
                 (LETT #4# NIL . #9#)
                 (SEQ (LETT |f| NIL . #9#) (LETT #3# |listf| . #9#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |f| (QREFELT $ 18)) #4#)
                              . #9#)))
                      (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #9#)
          (LETT |d| (SPADCALL |lclistf| (QREFELT $ 26)) . #9#)
          (EXIT
           (COND ((EQL |d| 1) (CONS (|spadConstant| $ 23) |listf|))
                 (#10#
                  (CONS (SPADCALL |d| (QREFELT $ 37))
                        (PROGN
                         (LETT #2# NIL . #9#)
                         (SEQ (LETT |lcf| NIL . #9#) (LETT #1# |lclistf| . #9#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |lcf| (CAR #1#) . #9#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL (QUOTIENT2 |lcf| |d|)
                                                 (QREFELT $ 37))
                                       #2#)
                                      . #9#)))
                              (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))))))))))))) 

(DEFUN |HEUGCD;testDivide| (|listf| |g| $)
  (PROG (|result| #1=#:G208 |f1| #2=#:G209 |f|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |result| NIL . #3=(|HEUGCD;testDivide|))
            (SEQ (LETT |f| NIL . #3#) (LETT #2# |listf| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 38)) . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |f1| 1)
                          (PROGN
                           (LETT #1# (CONS 1 "failed") . #3#)
                           (GO #1#))))))
                  (EXIT (LETT |result| (CONS (QCDR |f1|) |result|) . #3#)))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |result|)))))
      #1# (EXIT #1#))))) 

(DEFUN |HEUGCD;lincase| (|listdeg| |listf| $)
  (PROG (|result| #1=#:G221 |f1| #2=#:G222 |f| |g| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |n| (SPADCALL 1 |listdeg| (QREFELT $ 41))
              . #3=(|HEUGCD;lincase|))
        (LETT |g| (SPADCALL |listf| |n| (QREFELT $ 42)) . #3#)
        (LETT |result| (LIST |g|) . #3#)
        (SEQ (LETT |f| NIL . #3#) (LETT #2# |listf| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 38)) . #3#)
                   (EXIT
                    (COND
                     ((QEQCAR |f1| 1)
                      (PROGN
                       (LETT #1# (CONS (|spadConstant| $ 23) |listf|) . #3#)
                       (GO #1#))))))
              (EXIT (LETT |result| (CONS (QCDR |f1|) |result|) . #3#)))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (REVERSE |result|))))
      #1# (EXIT #1#))))) 

(DEFUN |HEUGCD;mindegpol| (|f| |g| $)
  (COND ((< (SPADCALL |g| (QREFELT $ 12)) (SPADCALL |f| (QREFELT $ 12))) |g|)
        ('T |f|))) 

(DEFUN |HEUGCD;localgcd| (|listf| $)
  (PROG (#1=#:G239 #2=#:G257 |f| #3=#:G256 |gg| |answr| #4=#:G244 |nvalue|
         #5=#:G250 |result| |flag| |f1| #6=#:G255 |d| |contd| |dd| |dval|
         |listval| #7=#:G254 #8=#:G253 |k| |minf| #9=#:G235 #10=#:G234
         #11=#:G236 #12=#:G252 |hgt| #13=#:G231 #14=#:G230 #15=#:G232
         #16=#:G251)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |hgt|
              (PROGN
               (LETT #13# NIL . #17=(|HEUGCD;localgcd|))
               (SEQ (LETT |f| NIL . #17#) (LETT #16# |listf| . #17#) G190
                    (COND
                     ((OR (ATOM #16#) (PROGN (LETT |f| (CAR #16#) . #17#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((COND ((SPADCALL |f| (QREFELT $ 14)) 'NIL) (#18='T 'T))
                        (PROGN
                         (LETT #15# (|HEUGCD;height| |f| $) . #17#)
                         (COND (#13# (LETT #14# (MIN #14# #15#) . #17#))
                               ('T
                                (PROGN
                                 (LETT #14# #15# . #17#)
                                 (LETT #13# 'T . #17#)))))))))
                    (LETT #16# (CDR #16#) . #17#) (GO G190) G191 (EXIT NIL))
               (COND (#13# #14#) (#18# (|IdentityError| '|min|))))
              . #17#)
        (LETT |answr| (+ 2 (* 2 |hgt|)) . #17#)
        (LETT |minf|
              (PROGN
               (LETT #9# NIL . #17#)
               (SEQ (LETT |f| NIL . #17#) (LETT #12# |listf| . #17#) G190
                    (COND
                     ((OR (ATOM #12#) (PROGN (LETT |f| (CAR #12#) . #17#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((COND ((SPADCALL |f| (QREFELT $ 14)) 'NIL) (#18# 'T))
                        (PROGN
                         (LETT #11# |f| . #17#)
                         (COND
                          (#9#
                           (LETT #10# (|HEUGCD;mindegpol| #10# #11# $) . #17#))
                          ('T
                           (PROGN
                            (LETT #10# #11# . #17#)
                            (LETT #9# 'T . #17#)))))))))
                    (LETT #12# (CDR #12#) . #17#) (GO G190) G191 (EXIT NIL))
               (COND (#9# #10#) (#18# (|IdentityError| '|mindegpol|))))
              . #17#)
        (LETT |result| (|HEUGCD;testDivide| |listf| |minf| $) . #17#)
        (EXIT
         (COND ((QEQCAR |result| 0) (CONS |minf| (QCDR |result|)))
               (#18#
                (SEQ
                 (SEQ (LETT |k| 1 . #17#) G190
                      (COND ((|greater_SI| |k| 10) (GO G191)))
                      (SEQ
                       (LETT |listval|
                             (PROGN
                              (LETT #8# NIL . #17#)
                              (SEQ (LETT |f| NIL . #17#)
                                   (LETT #7# |listf| . #17#) G190
                                   (COND
                                    ((OR (ATOM #7#)
                                         (PROGN
                                          (LETT |f| (CAR #7#) . #17#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #8#
                                           (CONS
                                            (SPADCALL |f| |answr|
                                                      (QREFELT $ 44))
                                            #8#)
                                           . #17#)))
                                   (LETT #7# (CDR #7#) . #17#) (GO G190) G191
                                   (EXIT (NREVERSE #8#))))
                             . #17#)
                       (LETT |dval| (SPADCALL |listval| (QREFELT $ 26)) . #17#)
                       (LETT |dd| (|HEUGCD;genpoly| |dval| |answr| $) . #17#)
                       (LETT |contd| (SPADCALL |dd| (QREFELT $ 45)) . #17#)
                       (LETT |d|
                             (PROG2
                                 (LETT #1#
                                       (SPADCALL |dd| |contd| (QREFELT $ 31))
                                       . #17#)
                                 (QCDR #1#)
                               (|check_union| (QEQCAR #1# 0) (QREFELT $ 6)
                                              #1#))
                             . #17#)
                       (LETT |result| (LIST |d|) . #17#)
                       (LETT |flag| 'T . #17#)
                       (SEQ (LETT |f| NIL . #17#) (LETT #6# |listf| . #17#)
                            G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |f| (CAR #6#) . #17#) NIL)
                                  (NULL |flag|))
                              (GO G191)))
                            (SEQ
                             (LETT |f1| (SPADCALL |f| |d| (QREFELT $ 38))
                                   . #17#)
                             (EXIT
                              (COND ((QEQCAR |f1| 1) (LETT |flag| 'NIL . #17#))
                                    ('T
                                     (LETT |result| (CONS (QCDR |f1|) |result|)
                                           . #17#)))))
                            (LETT #6# (CDR #6#) . #17#) (GO G190) G191
                            (EXIT NIL))
                       (COND
                        (|flag|
                         (PROGN
                          (LETT #5# (REVERSE |result|) . #17#)
                          (GO #5#))))
                       (LETT |nvalue| (QUOTIENT2 (* |answr| 832040) 317811)
                             . #17#)
                       (COND
                        ((EQL (REM (+ |nvalue| |answr|) 2) 0)
                         (LETT |nvalue| (+ |nvalue| 1) . #17#)))
                       (EXIT
                        (LETT |answr|
                              (PROG1 (LETT #4# |nvalue| . #17#)
                                (|check_subtype| (> #4# 0) '(|PositiveInteger|)
                                                 #4#))
                              . #17#)))
                      (LETT |k| (|inc_SI| |k|) . #17#) (GO G190) G191
                      (EXIT NIL))
                 (LETT |gg| (SPADCALL |listf| (QREFELT $ 46)) . #17#)
                 (EXIT
                  (CONS |gg|
                        (PROGN
                         (LETT #3# NIL . #17#)
                         (SEQ (LETT |f| NIL . #17#) (LETT #2# |listf| . #17#)
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |f| (CAR #2#) . #17#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL |f| |gg|
                                                           (QREFELT $ 38))
                                                 . #17#)
                                           (QCDR #1#)
                                         (|check_union| (QEQCAR #1# 0)
                                                        (QREFELT $ 6) #1#))
                                       #3#)
                                      . #17#)))
                              (LETT #2# (CDR #2#) . #17#) (GO G190) G191
                              (EXIT (NREVERSE #3#))))))))))))
      #5# (EXIT #5#))))) 

(DEFUN |HEUGCD;internal| (|flag| |listf| $)
  (PROG (|ans| #1=#:G300 |p| #2=#:G301 |q| #3=#:G299 |result| |#G53| |#G52|
         #4=#:G288 |fa| |ga| #5=#:G280 |lcg| #6=#:G298 |g| |f| |listdeg|
         #7=#:G297 #8=#:G296 |minpol| #9=#:G295 |term| #10=#:G294 |contgcd|
         |Cgcd| #11=#:G293 #12=#:G292 |contlistf| #13=#:G267 #14=#:G291
         #15=#:G290 |minpol1| |mdeg| #16=#:G264 #17=#:G263 #18=#:G265
         #19=#:G289 |nlf|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |listf| NIL (QREFELT $ 47)) (LIST (|spadConstant| $ 23)))
        (#20='T
         (SEQ (LETT |nlf| (LENGTH |listf|) . #21=(|HEUGCD;internal|))
              (EXIT
               (COND
                ((EQL |nlf| 1)
                 (LIST (|SPADfirst| |listf|) (|spadConstant| $ 23)))
                (#20#
                 (SEQ (LETT |minpol| (|spadConstant| $ 23) . #21#)
                      (LETT |mdeg|
                            (PROGN
                             (LETT #16# NIL . #21#)
                             (SEQ (LETT |f| NIL . #21#)
                                  (LETT #19# |listf| . #21#) G190
                                  (COND
                                   ((OR (ATOM #19#)
                                        (PROGN
                                         (LETT |f| (CAR #19#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #18# (SPADCALL |f| (QREFELT $ 48))
                                           . #21#)
                                     (COND
                                      (#16# (LETT #17# (MIN #17# #18#) . #21#))
                                      ('T
                                       (PROGN
                                        (LETT #17# #18# . #21#)
                                        (LETT #16# 'T . #21#)))))))
                                  (LETT #19# (CDR #19#) . #21#) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#16# #17#)
                                   (#20# (|IdentityError| '|min|))))
                            . #21#)
                      (COND
                       ((SPADCALL |mdeg| 0 (QREFELT $ 36))
                        (SEQ
                         (LETT |minpol1| (SPADCALL 1 |mdeg| (QREFELT $ 21))
                               . #21#)
                         (LETT |listf|
                               (PROGN
                                (LETT #15# NIL . #21#)
                                (SEQ (LETT |f| NIL . #21#)
                                     (LETT #14# |listf| . #21#) G190
                                     (COND
                                      ((OR (ATOM #14#)
                                           (PROGN
                                            (LETT |f| (CAR #14#) . #21#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #15#
                                             (CONS
                                              (PROG2
                                                  (LETT #13#
                                                        (SPADCALL |f| |minpol1|
                                                                  (QREFELT $
                                                                           38))
                                                        . #21#)
                                                  (QCDR #13#)
                                                (|check_union| (QEQCAR #13# 0)
                                                               (QREFELT $ 6)
                                                               #13#))
                                              #15#)
                                             . #21#)))
                                     (LETT #14# (CDR #14#) . #21#) (GO G190)
                                     G191 (EXIT (NREVERSE #15#))))
                               . #21#)
                         (EXIT
                          (LETT |minpol|
                                (SPADCALL |minpol| |minpol1| (QREFELT $ 49))
                                . #21#)))))
                      (LETT |Cgcd| NIL . #21#) (LETT |contgcd| 1 . #21#)
                      (COND
                       ((OR (QEQCAR |flag| 1) (QEQCAR |flag| 3))
                        (SEQ
                         (LETT |contlistf| (|HEUGCD;contprim| |listf| $)
                               . #21#)
                         (LETT |Cgcd|
                               (PROGN
                                (LETT #12# NIL . #21#)
                                (SEQ (LETT |term| NIL . #21#)
                                     (LETT #11# |contlistf| . #21#) G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN
                                            (LETT |term| (CAR #11#) . #21#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #12# (CONS (QCAR |term|) #12#)
                                             . #21#)))
                                     (LETT #11# (CDR #11#) . #21#) (GO G190)
                                     G191 (EXIT (NREVERSE #12#))))
                               . #21#)
                         (LETT |contgcd| (SPADCALL |Cgcd| (QREFELT $ 26))
                               . #21#)
                         (LETT |listf|
                               (PROGN
                                (LETT #10# NIL . #21#)
                                (SEQ (LETT |term| NIL . #21#)
                                     (LETT #9# |contlistf| . #21#) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN
                                            (LETT |term| (CAR #9#) . #21#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10# (CONS (QCDR |term|) #10#)
                                             . #21#)))
                                     (LETT #9# (CDR #9#) . #21#) (GO G190) G191
                                     (EXIT (NREVERSE #10#))))
                               . #21#)
                         (EXIT
                          (LETT |minpol|
                                (SPADCALL |contgcd| |minpol| (QREFELT $ 50))
                                . #21#)))))
                      (LETT |listdeg|
                            (PROGN
                             (LETT #8# NIL . #21#)
                             (SEQ (LETT |f| NIL . #21#)
                                  (LETT #7# |listf| . #21#) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN
                                         (LETT |f| (CAR #7#) . #21#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #8#
                                          (CONS (SPADCALL |f| (QREFELT $ 12))
                                                #8#)
                                          . #21#)))
                                  (LETT #7# (CDR #7#) . #21#) (GO G190) G191
                                  (EXIT (NREVERSE #8#))))
                            . #21#)
                      (LETT |f| (|SPADfirst| |listf|) . #21#)
                      (COND
                       ((SPADCALL
                         (SPADCALL (SPADCALL |f| (QREFELT $ 18)) (QREFELT $ 7)
                                   (QREFELT $ 51))
                         0 (QREFELT $ 20))
                        (SEQ
                         (LETT |fa|
                               (SPADCALL (SPADCALL |f| (QREFELT $ 53))
                                         (QREFELT $ 7) (QREFELT $ 56))
                               . #21#)
                         (EXIT
                          (SEQ
                           (EXIT
                            (SEQ (LETT |g| NIL . #21#)
                                 (LETT #6# (CDR |listf|) . #21#) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |g| (CAR #6#) . #21#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lcg| (SPADCALL |g| (QREFELT $ 18))
                                        . #21#)
                                  (COND
                                   ((EQL
                                     (SPADCALL |lcg| (QREFELT $ 7)
                                               (QREFELT $ 51))
                                     0)
                                    (PROGN
                                     (LETT #5# |$NoValue| . #21#)
                                     (GO #5#))))
                                  (LETT |ga|
                                        (SPADCALL (SPADCALL |g| (QREFELT $ 53))
                                                  (QREFELT $ 7) (QREFELT $ 56))
                                        . #21#)
                                  (LETT |fa|
                                        (SPADCALL |fa| |ga| (QREFELT $ 7)
                                                  (QREFELT $ 57))
                                        . #21#)
                                  (EXIT
                                   (COND
                                    ((EQL (SPADCALL |fa| (QREFELT $ 58)) 0)
                                     (PROGN
                                      (LETT #4# (CONS |minpol| |listf|) . #21#)
                                      (GO #4#))))))
                                 (LETT #6# (CDR #6#) . #21#) (GO G190) G191
                                 (EXIT NIL)))
                           #5# (EXIT #5#))))))
                      (LETT |ans|
                            (COND
                             ((SPADCALL 0 |listdeg| (QREFELT $ 35))
                              (|HEUGCD;constcase| |listdeg| |listf| $))
                             ((SPADCALL 1 |listdeg| (QREFELT $ 35))
                              (|HEUGCD;lincase| |listdeg| |listf| $))
                             (#20# (|HEUGCD;localgcd| |listf| $)))
                            . #21#)
                      (PROGN
                       (LETT |#G52|
                             (SPADCALL (|SPADfirst| |ans|) |minpol|
                                       (QREFELT $ 49))
                             . #21#)
                       (LETT |#G53| (CDR |ans|) . #21#)
                       (LETT |result| |#G52| . #21#)
                       (LETT |ans| |#G53| . #21#))
                      (COND
                       ((QEQCAR |flag| 3)
                        (LETT |ans|
                              (PROGN
                               (LETT #3# NIL . #21#)
                               (SEQ (LETT |q| NIL . #21#)
                                    (LETT #2# |ans| . #21#)
                                    (LETT |p| NIL . #21#)
                                    (LETT #1# |Cgcd| . #21#) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |p| (CAR #1#) . #21#)
                                           NIL)
                                          (ATOM #2#)
                                          (PROGN
                                           (LETT |q| (CAR #2#) . #21#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL
                                              (QUOTIENT2 |p| |contgcd|) |q|
                                              (QREFELT $ 50))
                                             #3#)
                                            . #21#)))
                                    (LETT #1#
                                          (PROG1 (CDR #1#)
                                            (LETT #2# (CDR #2#) . #21#))
                                          . #21#)
                                    (GO G190) G191 (EXIT (NREVERSE #3#))))
                              . #21#)))
                      (EXIT (CONS |result| |ans|))))))))))
      #4# (EXIT #4#))))) 

(DEFUN |HEUGCD;gcdprim;LBP;16| (|listf| $)
  (|SPADfirst| (|HEUGCD;internal| (CONS 0 "gcdprim") |listf| $))) 

(DEFUN |HEUGCD;gcdcofactprim;2L;17| (|listf| $)
  (|HEUGCD;internal| (CONS 2 "gcdcofactprim") |listf| $)) 

(DEFUN |HEUGCD;gcd;LBP;18| (|listf| $)
  (|SPADfirst| (|HEUGCD;internal| (CONS 1 "gcd") |listf| $))) 

(DEFUN |HEUGCD;gcdcofact;2L;19| (|listf| $)
  (|HEUGCD;internal| (CONS 3 "gcdcofact") |listf| $)) 

(DECLAIM (NOTINLINE |HeuGcd;|)) 

(DEFUN |HeuGcd| (#1=#:G326)
  (PROG ()
    (RETURN
     (PROG (#2=#:G327)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|HeuGcd|)
                                           '|domainEqualList|)
                . #3=(|HeuGcd|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|HeuGcd;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|HeuGcd|))))))))))) 

(DEFUN |HeuGcd;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|HeuGcd|))
      (LETT |dv$| (LIST '|HeuGcd| DV$1) . #1#)
      (LETT $ (GETREFV 65) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|HeuGcd| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 4010021)
      (QSETREFV $ 43
                (|InnerModularGcd| (|Integer|) |#1| 67108859
                                   (CONS (|function| |HEUGCD;myNextPrime|) $)))
      $)))) 

(MAKEPROP '|HeuGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|bigPrime| (|Integer|)
              (|IntegerPrimesPackage| 8) (0 . |nextPrime|)
              (|NonNegativeInteger|) (5 . |degree|) (|Boolean|) (10 . |zero?|)
              (15 . |Zero|) (19 . >) (25 . ~=) (31 . |leadingCoefficient|)
              (36 . |reductum|) (41 . ~=) (47 . |monomial|) (53 . +)
              (59 . |One|) (|List| 8) (63 . |member?|) |HEUGCD;lintgcd;LI;7|
              (69 . |coefficients|) (|List| 6) |HEUGCD;content;LL;8|
              (|Union| $ '"failed") (74 . |exquo|) (|Mapping| 13 6)
              (80 . |select|) (|List| 11) (86 . |member?|) (92 . >)
              (98 . |coerce|) (103 . |exquo|) (|PositiveInteger|) (109 . |One|)
              (113 . |position|) (119 . |elt|) 'IMG (125 . |elt|)
              (131 . |content|) (136 . |modularGcdPrimitive|) (141 . =)
              (147 . |minimumDegree|) (152 . *) (158 . *)
              (164 . |positiveRemainder|) (|SparseUnivariatePolynomial| 8)
              (170 . |makeSUP|) (|U32Vector|) (|U32VectorPolynomialOperations|)
              (175 . |to_mod_pa|) (181 . |gcd|) (188 . |degree|) (193 . |Zero|)
              (197 . |One|) |HEUGCD;gcdprim;LBP;16|
              |HEUGCD;gcdcofactprim;2L;17| |HEUGCD;gcd;LBP;18|
              |HEUGCD;gcdcofact;2L;19|)
           '#(|lintgcd| 201 |gcdprim| 206 |gcdcofactprim| 211 |gcdcofact| 216
              |gcd| 221 |content| 226)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 64
                                                 '(1 9 8 8 10 1 6 11 0 12 1 6
                                                   13 0 14 0 6 0 15 2 8 13 0 0
                                                   16 2 6 13 0 0 17 1 6 8 0 18
                                                   1 6 0 0 19 2 8 13 0 0 20 2 6
                                                   0 8 11 21 2 6 0 0 0 22 0 6 0
                                                   23 2 24 13 8 0 25 1 6 24 0
                                                   27 2 6 30 0 8 31 2 28 0 32 0
                                                   33 2 34 13 11 0 35 2 11 13 0
                                                   0 36 1 6 0 8 37 2 6 30 0 0
                                                   38 0 39 0 40 2 34 8 11 0 41
                                                   2 28 6 0 8 42 2 6 8 0 8 44 1
                                                   6 8 0 45 1 43 6 28 46 2 28
                                                   13 0 0 47 1 6 11 0 48 2 6 0
                                                   0 0 49 2 6 0 8 0 50 2 8 0 0
                                                   0 51 1 6 52 0 53 2 55 54 52
                                                   8 56 3 55 54 54 54 8 57 1 55
                                                   8 54 58 0 52 0 59 0 52 0 60
                                                   1 0 8 24 26 1 0 6 28 61 1 0
                                                   28 28 62 1 0 28 28 64 1 0 6
                                                   28 63 1 0 24 28 29)))))
           '|lookupComplete|)) 
