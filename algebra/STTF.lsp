
(/VERSIONCHECK 2) 

(DEFUN |STTF;expre| (|r| |e| |dx| $)
  (PROG ()
    (RETURN
     (SPADCALL |r| (CONS #'|STTF;expre!0| (VECTOR $ |dx| |e|))
               (QREFELT $ 20))))) 

(DEFUN |STTF;expre!0| ($$)
  (PROG (|e| |dx| $)
    (LETT |e| (QREFELT $$ 2) . #1=(|STTF;expre|))
    (LETT |dx| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |e| |dx| (QREFELT $ 18)))))) 

(DEFUN |STTF;exp;2S;2| (|z| $)
  (PROG (|coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24)))
       (#1='T
        (SEQ (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) |STTF;exp;2S;2|)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                (SPADCALL (CONS #'|STTF;exp;2S;2!0| (VECTOR |z| $))
                          (QREFELT $ 31)))
               ((QREFELT $ 7)
                (SPADCALL (CONS #'|STTF;exp;2S;2!1| (VECTOR |z| $ |coef|))
                          (QREFELT $ 31)))
               (#1#
                (|error|
                 (SPADCALL (STRCONC "exp: " (QREFELT $ 8))
                           (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;exp;2S;2!1| (|y| $$)
  (PROG (|coef| $ |z|)
    (LETT |coef| (QREFELT $$ 2) . #1=(|STTF;exp;2S;2|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;expre| (SPADCALL |coef| (QREFELT $ 32)) |y|
       (SPADCALL |z| (QREFELT $ 28)) $))))) 

(DEFUN |STTF;exp;2S;2!0| (|y| $$)
  (PROG ($ |z|)
    (LETT $ (QREFELT $$ 1) . #1=(|STTF;exp;2S;2|))
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;expre| (|spadConstant| $ 23) |y| (SPADCALL |z| (QREFELT $ 28))
       $))))) 

(DEFUN |STTF;log;2S;3| (|z| $)
  (PROG (|coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (|error| "log: constant coefficient should not be 0"))
       (#1='T
        (SEQ (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) |STTF;log;2S;3|)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                (|error| "log: constant coefficient should not be 0"))
               ((SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                (SPADCALL (|spadConstant| $ 26)
                          (CONS #'|STTF;log;2S;3!0| (VECTOR $ |z|))
                          (QREFELT $ 20)))
               ((QREFELT $ 7)
                (SPADCALL (SPADCALL |coef| (QREFELT $ 38))
                          (CONS #'|STTF;log;2S;3!1| (VECTOR $ |z|))
                          (QREFELT $ 20)))
               (#1#
                (|error|
                 (SPADCALL (STRCONC "log: " (QREFELT $ 8))
                           (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;log;2S;3!1| ($$)
  (PROG (|z| $)
    (LETT |z| (QREFELT $$ 1) . #1=(|STTF;log;2S;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |z| (QREFELT $ 28)) |z| (QREFELT $ 37)))))) 

(DEFUN |STTF;log;2S;3!0| ($$)
  (PROG (|z| $)
    (LETT |z| (QREFELT $$ 1) . #1=(|STTF;log;2S;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |z| (QREFELT $ 28)) |z| (QREFELT $ 37)))))) 

(DEFUN |STTF;^;3S;4| (|z1| |z2| $)
  (SPADCALL (SPADCALL |z2| (SPADCALL |z1| (QREFELT $ 39)) (QREFELT $ 18))
            (QREFELT $ 36))) 

(DEFUN |STTF;sincosre| (|rs| |rc| |sc| |dx| |sign| $)
  (PROG ()
    (RETURN
     (LIST
      (SPADCALL |rs| (CONS #'|STTF;sincosre!0| (VECTOR |dx| $ |sc|))
                (QREFELT $ 20))
      (SPADCALL |rc| (CONS #'|STTF;sincosre!1| (VECTOR |dx| $ |sc| |sign|))
                (QREFELT $ 20)))))) 

(DEFUN |STTF;sincosre!1| ($$)
  (PROG (|sign| |sc| $ |dx|)
    (LETT |sign| (QREFELT $$ 3) . #1=(|STTF;sincosre|))
    (LETT |sc| (QREFELT $$ 2) . #1#)
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL (SPADCALL |sign| (SPADCALL |sc| (QREFELT $ 43)) (QREFELT $ 44))
                |dx| (QREFELT $ 18)))))) 

(DEFUN |STTF;sincosre!0| ($$)
  (PROG (|sc| $ |dx|)
    (LETT |sc| (QREFELT $$ 2) . #1=(|STTF;sincosre|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |sc| (QREFELT $ 42)) |dx| (QREFELT $ 18)))))) 

(DEFUN |STTF;sincos;SR;6| (|z| $)
  (PROG (|l| |coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (CONS (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24))
              (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))))
       (#1='T
        (SEQ
         (LETT |l|
               (SEQ
                (LETT |coef| (SPADCALL |z| (QREFELT $ 25))
                      . #2=(|STTF;sincos;SR;6|))
                (EXIT
                 (COND
                  ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                   (SPADCALL (CONS #'|STTF;sincos;SR;6!0| (VECTOR |z| $)) 2
                             (QREFELT $ 48)))
                  ((QREFELT $ 7)
                   (SPADCALL
                    (CONS #'|STTF;sincos;SR;6!1| (VECTOR |z| $ |coef|)) 2
                    (QREFELT $ 48)))
                  (#1#
                   (|error|
                    (SPADCALL (STRCONC "sincos: " (QREFELT $ 8))
                              (QREFELT $ 35)))))))
               . #2#)
         (EXIT (CONS (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 42))))))))))) 

(DEFUN |STTF;sincos;SR;6!1| (|y| $$)
  (PROG (|coef| $ |z|)
    (LETT |coef| (QREFELT $$ 2) . #1=(|STTF;sincos;SR;6|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;sincosre| (SPADCALL |coef| (QREFELT $ 49))
       (SPADCALL |coef| (QREFELT $ 50)) |y| (SPADCALL |z| (QREFELT $ 28))
       (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45)) $))))) 

(DEFUN |STTF;sincos;SR;6!0| (|y| $$)
  (PROG ($ |z|)
    (LETT $ (QREFELT $$ 1) . #1=(|STTF;sincos;SR;6|))
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;sincosre| (|spadConstant| $ 26) (|spadConstant| $ 23) |y|
       (SPADCALL |z| (QREFELT $ 28))
       (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45)) $))))) 

(DEFUN |STTF;sin;2S;7| (|z| $) (QCAR (SPADCALL |z| (QREFELT $ 53)))) 

(DEFUN |STTF;cos;2S;8| (|z| $) (QCDR (SPADCALL |z| (QREFELT $ 53)))) 

(DEFUN |STTF;tanre| (|r| |t| |dx| |sign| $)
  (PROG ()
    (RETURN
     (SPADCALL |r| (CONS #'|STTF;tanre!0| (VECTOR |dx| |t| |sign| $))
               (QREFELT $ 20))))) 

(DEFUN |STTF;tanre!0| ($$)
  (PROG ($ |sign| |t| |dx|)
    (LETT $ (QREFELT $$ 3) . #1=(|STTF;tanre|))
    (LETT |sign| (QREFELT $$ 2) . #1#)
    (LETT |t| (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                 (SPADCALL (SPADCALL |sign| |t| (QREFELT $ 44)) |t|
                           (QREFELT $ 18))
                 (QREFELT $ 62))
       |dx| (QREFELT $ 18)))))) 

(DEFUN |STTF;tan;2S;10| (|z| $)
  (PROG (|coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24)))
       (#1='T
        (SEQ (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) |STTF;tan;2S;10|)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                (SPADCALL (CONS #'|STTF;tan;2S;10!0| (VECTOR |z| $))
                          (QREFELT $ 31)))
               ((QREFELT $ 7)
                (SPADCALL (CONS #'|STTF;tan;2S;10!1| (VECTOR |z| $ |coef|))
                          (QREFELT $ 31)))
               (#1#
                (|error|
                 (SPADCALL (STRCONC "tan: " (QREFELT $ 8))
                           (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;tan;2S;10!1| (|y| $$)
  (PROG (|coef| $ |z|)
    (LETT |coef| (QREFELT $$ 2) . #1=(|STTF;tan;2S;10|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;tanre| (SPADCALL |coef| (QREFELT $ 63)) |y|
       (SPADCALL |z| (QREFELT $ 28)) (|spadConstant| $ 23) $))))) 

(DEFUN |STTF;tan;2S;10!0| (|y| $$)
  (PROG ($ |z|)
    (LETT $ (QREFELT $$ 1) . #1=(|STTF;tan;2S;10|))
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;tanre| (|spadConstant| $ 26) |y| (SPADCALL |z| (QREFELT $ 28))
       (|spadConstant| $ 23) $))))) 

(DEFUN |STTF;cotre| (|r| |t| |dx| $)
  (PROG ()
    (RETURN
     (SPADCALL |r| (CONS #'|STTF;cotre!0| (VECTOR |dx| |t| $))
               (QREFELT $ 20))))) 

(DEFUN |STTF;cotre!0| ($$)
  (PROG ($ |t| |dx|)
    (LETT $ (QREFELT $$ 2) . #1=(|STTF;cotre|))
    (LETT |t| (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL
        (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                  (SPADCALL |t| |t| (QREFELT $ 18)) (QREFELT $ 62))
        |dx| (QREFELT $ 18))
       (QREFELT $ 65)))))) 

(DEFUN |STTF;cot;2S;12| (|z| $)
  (PROG (|coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22)) (|error| "cot: cot(0) is undefined"))
       (#1='T
        (SEQ (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) |STTF;cot;2S;12|)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                (|error|
                 (SPADCALL (STRCONC "cot: " (QREFELT $ 9)) (QREFELT $ 35))))
               ((QREFELT $ 7)
                (SPADCALL (CONS #'|STTF;cot;2S;12!0| (VECTOR |z| $ |coef|))
                          (QREFELT $ 31)))
               (#1#
                (|error|
                 (SPADCALL (STRCONC "cot: " (QREFELT $ 8))
                           (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;cot;2S;12!0| (|y| $$)
  (PROG (|coef| $ |z|)
    (LETT |coef| (QREFELT $$ 2) . #1=(|STTF;cot;2S;12|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;cotre| (SPADCALL |coef| (QREFELT $ 66)) |y|
       (SPADCALL |z| (QREFELT $ 28)) $))))) 

(DEFUN |STTF;sec;2S;13| (|z| $)
  (PROG (#1=#:G225 |cosz|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24)))
       ((SPADCALL (SPADCALL |z| (QREFELT $ 25)) (|spadConstant| $ 26)
                  (QREFELT $ 27))
        (PROG2
            (LETT #1# (SPADCALL (SPADCALL |z| (QREFELT $ 55)) (QREFELT $ 69))
                  . #2=(|STTF;sec;2S;13|))
            (QCDR #1#)
          (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#)))
       ((QREFELT $ 7)
        (SEQ (LETT |cosz| (SPADCALL |z| (QREFELT $ 55)) . #2#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |cosz| (QREFELT $ 70))
                          (|spadConstant| $ 26) (QREFELT $ 27))
                (|error|
                 (SPADCALL (STRCONC "sec: " (QREFELT $ 9)) (QREFELT $ 35))))
               (#3='T
                (PROG2 (LETT #1# (SPADCALL |cosz| (QREFELT $ 69)) . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                                 #1#)))))))
       (#3#
        (|error|
         (SPADCALL (STRCONC "sec: " (QREFELT $ 8)) (QREFELT $ 35))))))))) 

(DEFUN |STTF;csc;2S;14| (|z| $)
  (PROG (#1=#:G232 |sinz|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22)) (|error| "csc: csc(0) is undefined"))
       ((QREFELT $ 7)
        (SEQ
         (LETT |sinz| (SPADCALL |z| (QREFELT $ 54)) . #2=(|STTF;csc;2S;14|))
         (EXIT
          (COND
           ((SPADCALL (SPADCALL |sinz| (QREFELT $ 70)) (|spadConstant| $ 26)
                      (QREFELT $ 27))
            (|error|
             (SPADCALL (STRCONC "csc: " (QREFELT $ 9)) (QREFELT $ 35))))
           (#3='T
            (PROG2 (LETT #1# (SPADCALL |sinz| (QREFELT $ 69)) . #2#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#)))))))
       (#3#
        (|error|
         (SPADCALL (STRCONC "csc: " (QREFELT $ 8)) (QREFELT $ 35))))))))) 

(DEFUN |STTF;orderOrFailed| (|x| $)
  (PROG (#1=#:G245 |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |n| 0 . #2=(|STTF;orderOrFailed|)) G190
             (COND ((|greater_SI| |n| 1000) (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x| (QREFELT $ 22))
                 (PROGN (LETT #1# (CONS 0 -1) . #2#) (GO #1#)))
                ((NULL (SPADCALL (SPADCALL |x| (QREFELT $ 25)) (QREFELT $ 73)))
                 (PROGN (LETT #1# (CONS 0 |n|) . #2#) (GO #1#)))
                ('T (LETT |x| (SPADCALL |x| (QREFELT $ 74)) . #2#)))))
             (LETT |n| (|inc_SI| |n|) . #2#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;asin;2S;16| (|z| $)
  (PROG (|quot| |squirt| #1=#:G264 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24)))
        (#2='T
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #3=(|STTF;asin;2S;16|))
          (EXIT
           (COND
            ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
             (SPADCALL (|spadConstant| $ 26)
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                   (QREFELT $ 76))
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                          (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 77))
                         (QREFELT $ 78))
                        (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 18))
                       (QREFELT $ 79)))
            ((QREFELT $ 7)
             (COND
              ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                   (SPADCALL |coef|
                             (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                             (QREFELT $ 27)))
               (SEQ
                (LETT |x|
                      (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                                (SPADCALL |z| |z| (QREFELT $ 18))
                                (QREFELT $ 77))
                      . #3#)
                (LETT |ord| (|STTF;orderOrFailed| |x| $) . #3#)
                (EXIT
                 (COND
                  ((QEQCAR |ord| 1)
                   (|error|
                    (SPADCALL (STRCONC "asin: " (QREFELT $ 11))
                              (QREFELT $ 35))))
                  ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                   (PROGN
                    (LETT #1#
                          (SPADCALL (SPADCALL |coef| (QREFELT $ 80))
                                    (QREFELT $ 24))
                          . #3#)
                    (GO #1#)))
                  ((ODDP |order|)
                   (|error|
                    (SPADCALL (STRCONC "asin: " (QREFELT $ 10))
                              (QREFELT $ 35))))
                  (#2#
                   (SEQ
                    (LETT |squirt|
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                    (QREFELT $ 78))
                          . #3#)
                    (LETT |quot|
                          (SPADCALL (SPADCALL |z| (QREFELT $ 28)) |squirt|
                                    (QREFELT $ 81))
                          . #3#)
                    (EXIT
                     (COND
                      ((QEQCAR |quot| 1)
                       (|error|
                        (SPADCALL (STRCONC "asin: " (QREFELT $ 15))
                                  (QREFELT $ 35))))
                      (#2#
                       (SPADCALL (SPADCALL |coef| (QREFELT $ 80)) (QCDR |quot|)
                                 (QREFELT $ 79)))))))))))
              ('T
               (SPADCALL (SPADCALL |coef| (QREFELT $ 80))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                     (QREFELT $ 76))
                           (SPADCALL
                            (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                            (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 77))
                           (QREFELT $ 78))
                          (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 18))
                         (QREFELT $ 79)))))
            (#2#
             (|error|
              (SPADCALL (STRCONC "asin: " (QREFELT $ 8))
                        (QREFELT $ 35))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;acos;2S;17| (|z| $)
  (PROG (|quot| |squirt| #1=#:G282 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (COND
          ((QREFELT $ 7)
           (SPADCALL (SPADCALL (|spadConstant| $ 26) (QREFELT $ 83))
                     (QREFELT $ 24)))
          (#2='T
           (|error|
            (SPADCALL (STRCONC "acos: " (QREFELT $ 8)) (QREFELT $ 35))))))
        ((QREFELT $ 7)
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #3=(|STTF;acos;2S;17|))
          (COND
           ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                (SPADCALL |coef|
                          (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                          (QREFELT $ 27)))
            (EXIT
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 77))
                    . #3#)
              (LETT |ord| (|STTF;orderOrFailed| |x| $) . #3#)
              (EXIT
               (COND
                ((QEQCAR |ord| 1)
                 (|error|
                  (SPADCALL (STRCONC "acos: " (QREFELT $ 11)) (QREFELT $ 35))))
                ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |coef| (QREFELT $ 83))
                                  (QREFELT $ 24))
                        . #3#)
                  (GO #1#)))
                ((ODDP |order|)
                 (|error|
                  (SPADCALL (STRCONC "acos: " (QREFELT $ 10)) (QREFELT $ 35))))
                (#2#
                 (SEQ
                  (LETT |squirt|
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                  (QREFELT $ 78))
                        . #3#)
                  (LETT |quot|
                        (SPADCALL
                         (SPADCALL (SPADCALL |z| (QREFELT $ 28))
                                   (QREFELT $ 65))
                         |squirt| (QREFELT $ 81))
                        . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |quot| 1)
                     (|error|
                      (SPADCALL (STRCONC "acos: " (QREFELT $ 15))
                                (QREFELT $ 35))))
                    (#2#
                     (SPADCALL (SPADCALL |coef| (QREFELT $ 83)) (QCDR |quot|)
                               (QREFELT $ 79)))))))))))))
          (EXIT
           (SPADCALL (SPADCALL |coef| (QREFELT $ 83))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) (QREFELT $ 76))
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                         (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 77))
                        (QREFELT $ 78))
                       (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 18))
                      (QREFELT $ 65))
                     (QREFELT $ 79)))))
        (#2#
         (|error|
          (SPADCALL (STRCONC "acos: " (QREFELT $ 8)) (QREFELT $ 35))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;atan;2S;18| (|z| $)
  (PROG (|y| #1=#:G284 |coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24)))
       (#2='T
        (SEQ
         (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #3=(|STTF;atan;2S;18|))
         (EXIT
          (COND
           ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
            (SPADCALL (|spadConstant| $ 26)
                      (SPADCALL
                       (PROG2
                           (LETT #1#
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 23)
                                             (QREFELT $ 24))
                                   (SPADCALL |z| |z| (QREFELT $ 18))
                                   (QREFELT $ 62))
                                  (QREFELT $ 69))
                                 . #3#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                                        #1#))
                       (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 18))
                      (QREFELT $ 79)))
           ((QREFELT $ 7)
            (SEQ
             (LETT |y|
                   (SPADCALL
                    (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 62))
                    (QREFELT $ 69))
                   . #3#)
             (EXIT
              (COND
               ((QEQCAR |y| 1)
                (|error|
                 (SPADCALL (STRCONC "atan: " (QREFELT $ 12)) (QREFELT $ 35))))
               (#2#
                (SPADCALL (SPADCALL |coef| (QREFELT $ 85))
                          (SPADCALL (QCDR |y|) (SPADCALL |z| (QREFELT $ 28))
                                    (QREFELT $ 18))
                          (QREFELT $ 79)))))))
           (#2#
            (|error|
             (SPADCALL (STRCONC "atan: " (QREFELT $ 8))
                       (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;acot;2S;19| (|z| $)
  (PROG (|y|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (COND
         ((QREFELT $ 7)
          (SPADCALL (SPADCALL (|spadConstant| $ 26) (QREFELT $ 87))
                    (QREFELT $ 24)))
         (#1='T
          (|error|
           (SPADCALL (STRCONC "acot: " (QREFELT $ 8)) (QREFELT $ 35))))))
       ((QREFELT $ 7)
        (SEQ
         (LETT |y|
               (SPADCALL
                (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                          (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 62))
                (QREFELT $ 69))
               |STTF;acot;2S;19|)
         (EXIT
          (COND
           ((QEQCAR |y| 1)
            (|error|
             (SPADCALL (STRCONC "acot: " (QREFELT $ 12)) (QREFELT $ 35))))
           (#1#
            (SPADCALL (SPADCALL (SPADCALL |z| (QREFELT $ 25)) (QREFELT $ 87))
                      (SPADCALL
                       (SPADCALL (QCDR |y|) (SPADCALL |z| (QREFELT $ 28))
                                 (QREFELT $ 18))
                       (QREFELT $ 65))
                      (QREFELT $ 79)))))))
       (#1#
        (|error|
         (SPADCALL (STRCONC "acot: " (QREFELT $ 8)) (QREFELT $ 35))))))))) 

(DEFUN |STTF;asec;2S;20| (|z| $)
  (PROG (|quot2| |quot| |squirt| #1=#:G316 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (|error| "asec: constant coefficient should not be 0"))
        ((QREFELT $ 7)
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #2=(|STTF;asec;2S;20|))
          (EXIT
           (COND
            ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
             (|error| "asec: constant coefficient should not be 0"))
            ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                 (SPADCALL |coef|
                           (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                           (QREFELT $ 27)))
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                              (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (QREFELT $ 77))
                    . #2#)
              (LETT |ord| (|STTF;orderOrFailed| |x| $) . #2#)
              (EXIT
               (COND
                ((QEQCAR |ord| 1)
                 (|error|
                  (SPADCALL (STRCONC "asec: " (QREFELT $ 11)) (QREFELT $ 35))))
                ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |coef| (QREFELT $ 89))
                                  (QREFELT $ 24))
                        . #2#)
                  (GO #1#)))
                ((ODDP |order|)
                 (|error|
                  (SPADCALL (STRCONC "asec: " (QREFELT $ 10)) (QREFELT $ 35))))
                (#3='T
                 (SEQ
                  (LETT |squirt|
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                  (QREFELT $ 78))
                        . #2#)
                  (LETT |quot|
                        (SPADCALL (SPADCALL |z| (QREFELT $ 28)) |squirt|
                                  (QREFELT $ 81))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |quot| 1)
                     (|error|
                      (SPADCALL (STRCONC "asec: " (QREFELT $ 15))
                                (QREFELT $ 35))))
                    (#3#
                     (SEQ
                      (LETT |quot2| (SPADCALL (QCDR |quot|) |z| (QREFELT $ 81))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |quot2| 1)
                         (|error|
                          (SPADCALL (STRCONC "asec: " (QREFELT $ 15))
                                    (QREFELT $ 35))))
                        (#3#
                         (SPADCALL (SPADCALL |coef| (QREFELT $ 89))
                                   (QCDR |quot2|) (QREFELT $ 79)))))))))))))))
            ('T
             (SPADCALL (SPADCALL |coef| (QREFELT $ 89))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                    (QREFELT $ 76))
                          (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                                    (SPADCALL (|spadConstant| $ 23)
                                              (QREFELT $ 24))
                                    (QREFELT $ 77))
                          (QREFELT $ 78))
                         (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 18))
                        |z| (QREFELT $ 37))
                       (QREFELT $ 79)))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "asec: " (QREFELT $ 8)) (QREFELT $ 35))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;acsc;2S;21| (|z| $)
  (PROG (|quot2| |quot| |squirt| #1=#:G337 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (|error| "acsc: constant coefficient should not be zero"))
        ((QREFELT $ 7)
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #2=(|STTF;acsc;2S;21|))
          (EXIT
           (COND
            ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
             (|error| "acsc: constant coefficient should not be zero"))
            ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                 (SPADCALL |coef|
                           (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                           (QREFELT $ 27)))
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                              (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (QREFELT $ 77))
                    . #2#)
              (LETT |ord| (|STTF;orderOrFailed| |x| $) . #2#)
              (EXIT
               (COND
                ((QEQCAR |ord| 1)
                 (|error|
                  (SPADCALL (STRCONC "acsc: " (QREFELT $ 11)) (QREFELT $ 35))))
                ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |coef| (QREFELT $ 91))
                                  (QREFELT $ 24))
                        . #2#)
                  (GO #1#)))
                ((ODDP |order|)
                 (|error|
                  (SPADCALL (STRCONC "acsc: " (QREFELT $ 10)) (QREFELT $ 35))))
                (#3='T
                 (SEQ
                  (LETT |squirt|
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                  (QREFELT $ 78))
                        . #2#)
                  (LETT |quot|
                        (SPADCALL
                         (SPADCALL (SPADCALL |z| (QREFELT $ 28))
                                   (QREFELT $ 65))
                         |squirt| (QREFELT $ 81))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |quot| 1)
                     (|error|
                      (SPADCALL (STRCONC "acsc: " (QREFELT $ 15))
                                (QREFELT $ 35))))
                    (#3#
                     (SEQ
                      (LETT |quot2| (SPADCALL (QCDR |quot|) |z| (QREFELT $ 81))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |quot2| 1)
                         (|error|
                          (SPADCALL (STRCONC "acsc: " (QREFELT $ 15))
                                    (QREFELT $ 35))))
                        (#3#
                         (SPADCALL (SPADCALL |coef| (QREFELT $ 91))
                                   (QCDR |quot2|) (QREFELT $ 79)))))))))))))))
            ('T
             (SPADCALL (SPADCALL |coef| (QREFELT $ 91))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                     (QREFELT $ 76))
                           (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                                     (SPADCALL (|spadConstant| $ 23)
                                               (QREFELT $ 24))
                                     (QREFELT $ 77))
                           (QREFELT $ 78))
                          (SPADCALL |z| (QREFELT $ 28)) (QREFELT $ 18))
                         |z| (QREFELT $ 37))
                        (QREFELT $ 65))
                       (QREFELT $ 79)))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "acsc: " (QREFELT $ 8)) (QREFELT $ 35))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;sinhcosh;SR;22| (|z| $)
  (PROG (|l| |coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (CONS (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24))
              (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))))
       (#1='T
        (SEQ
         (LETT |l|
               (SEQ
                (LETT |coef| (SPADCALL |z| (QREFELT $ 25))
                      . #2=(|STTF;sinhcosh;SR;22|))
                (EXIT
                 (COND
                  ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                   (SPADCALL (CONS #'|STTF;sinhcosh;SR;22!0| (VECTOR |z| $)) 2
                             (QREFELT $ 48)))
                  ((QREFELT $ 7)
                   (SPADCALL
                    (CONS #'|STTF;sinhcosh;SR;22!1| (VECTOR |z| $ |coef|)) 2
                    (QREFELT $ 48)))
                  (#1#
                   (|error|
                    (SPADCALL (STRCONC "sinhcosh: " (QREFELT $ 8))
                              (QREFELT $ 35)))))))
               . #2#)
         (EXIT (CONS (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 42))))))))))) 

(DEFUN |STTF;sinhcosh;SR;22!1| (|y| $$)
  (PROG (|coef| $ |z|)
    (LETT |coef| (QREFELT $$ 2) . #1=(|STTF;sinhcosh;SR;22|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;sincosre| (SPADCALL |coef| (QREFELT $ 93))
       (SPADCALL |coef| (QREFELT $ 94)) |y| (SPADCALL |z| (QREFELT $ 28))
       (|spadConstant| $ 23) $))))) 

(DEFUN |STTF;sinhcosh;SR;22!0| (|y| $$)
  (PROG ($ |z|)
    (LETT $ (QREFELT $$ 1) . #1=(|STTF;sinhcosh;SR;22|))
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;sincosre| (|spadConstant| $ 26) (|spadConstant| $ 23) |y|
       (SPADCALL |z| (QREFELT $ 28)) (|spadConstant| $ 23) $))))) 

(DEFUN |STTF;sinh;2S;23| (|z| $) (QCAR (SPADCALL |z| (QREFELT $ 96)))) 

(DEFUN |STTF;cosh;2S;24| (|z| $) (QCDR (SPADCALL |z| (QREFELT $ 96)))) 

(DEFUN |STTF;tanh;2S;25| (|z| $)
  (PROG (|coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24)))
       (#1='T
        (SEQ (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) |STTF;tanh;2S;25|)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                (SPADCALL (CONS #'|STTF;tanh;2S;25!0| (VECTOR |z| $))
                          (QREFELT $ 31)))
               ((QREFELT $ 7)
                (SPADCALL (CONS #'|STTF;tanh;2S;25!1| (VECTOR |z| $ |coef|))
                          (QREFELT $ 31)))
               (#1#
                (|error|
                 (SPADCALL (STRCONC "tanh: " (QREFELT $ 8))
                           (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;tanh;2S;25!1| (|y| $$)
  (PROG (|coef| $ |z|)
    (LETT |coef| (QREFELT $$ 2) . #1=(|STTF;tanh;2S;25|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;tanre| (SPADCALL |coef| (QREFELT $ 99)) |y|
       (SPADCALL |z| (QREFELT $ 28))
       (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45)) $))))) 

(DEFUN |STTF;tanh;2S;25!0| (|y| $$)
  (PROG ($ |z|)
    (LETT $ (QREFELT $$ 1) . #1=(|STTF;tanh;2S;25|))
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|STTF;tanre| (|spadConstant| $ 26) |y| (SPADCALL |z| (QREFELT $ 28))
       (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45)) $))))) 

(DEFUN |STTF;coth;2S;26| (|z| $)
  (PROG (#1=#:G356 |tanhz|)
    (RETURN
     (SEQ
      (LETT |tanhz| (SPADCALL |z| (QREFELT $ 100)) . #2=(|STTF;coth;2S;26|))
      (EXIT
       (COND
        ((SPADCALL |tanhz| (QREFELT $ 22))
         (|error| "coth: coth(0) is undefined"))
        ((SPADCALL (SPADCALL |tanhz| (QREFELT $ 25)) (|spadConstant| $ 26)
                   (QREFELT $ 27))
         (|error| (SPADCALL (STRCONC "coth: " (QREFELT $ 9)) (QREFELT $ 35))))
        ('T
         (PROG2 (LETT #1# (SPADCALL |tanhz| (QREFELT $ 69)) . #2#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))))))))) 

(DEFUN |STTF;sech;2S;27| (|z| $)
  (PROG (#1=#:G364 |coshz|)
    (RETURN
     (SEQ (LETT |coshz| (SPADCALL |z| (QREFELT $ 98)) . #2=(|STTF;sech;2S;27|))
          (COND
           ((OR (SPADCALL |coshz| (QREFELT $ 22))
                (SPADCALL (SPADCALL |coshz| (QREFELT $ 25))
                          (|spadConstant| $ 26) (QREFELT $ 27)))
            (EXIT
             (|error|
              (SPADCALL (STRCONC "sech: " (QREFELT $ 9)) (QREFELT $ 35))))))
          (EXIT
           (PROG2 (LETT #1# (SPADCALL |coshz| (QREFELT $ 69)) . #2#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))))))) 

(DEFUN |STTF;csch;2S;28| (|z| $)
  (PROG (#1=#:G371 |sinhz|)
    (RETURN
     (SEQ (LETT |sinhz| (SPADCALL |z| (QREFELT $ 97)) . #2=(|STTF;csch;2S;28|))
          (COND
           ((OR (SPADCALL |sinhz| (QREFELT $ 22))
                (SPADCALL (SPADCALL |sinhz| (QREFELT $ 25))
                          (|spadConstant| $ 26) (QREFELT $ 27)))
            (EXIT
             (|error|
              (SPADCALL (STRCONC "csch: " (QREFELT $ 9)) (QREFELT $ 35))))))
          (EXIT
           (PROG2 (LETT #1# (SPADCALL |sinhz| (QREFELT $ 69)) . #2#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6)) #1#))))))) 

(DEFUN |STTF;asinh;2S;29| (|z| $)
  (PROG (#1=#:G383 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24)))
        (#2='T
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #3=(|STTF;asinh;2S;29|))
          (EXIT
           (COND
            ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
             (SPADCALL
              (SPADCALL |z|
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 23)
                                             (QREFELT $ 24))
                                   (SPADCALL |z| |z| (QREFELT $ 18))
                                   (QREFELT $ 62))
                                  (QREFELT $ 78))
                        (QREFELT $ 62))
              (QREFELT $ 39)))
            ((QREFELT $ 7)
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 62))
                    . #3#)
              (LETT |ord| (|STTF;orderOrFailed| |x| $) . #3#)
              (EXIT
               (COND
                ((QEQCAR |ord| 1)
                 (|error|
                  (SPADCALL (STRCONC "asinh: " (QREFELT $ 11))
                            (QREFELT $ 35))))
                ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |coef| (QREFELT $ 104))
                                  (QREFELT $ 24))
                        . #3#)
                  (GO #1#)))
                ((ODDP |order|)
                 (|error|
                  (SPADCALL (STRCONC "asinh: " (QREFELT $ 10))
                            (QREFELT $ 35))))
                (#2#
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                      (QREFELT $ 78))
                            (QREFELT $ 62))
                  (QREFELT $ 39)))))))
            (#2#
             (|error|
              (SPADCALL (STRCONC "asinh: " (QREFELT $ 8))
                        (QREFELT $ 35))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;acosh;2S;30| (|z| $)
  (PROG (#1=#:G396 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (COND
          ((QREFELT $ 7)
           (SPADCALL (SPADCALL (|spadConstant| $ 26) (QREFELT $ 106))
                     (QREFELT $ 24)))
          (#2='T
           (|error|
            (SPADCALL (STRCONC "acosh: " (QREFELT $ 8)) (QREFELT $ 35))))))
        ((QREFELT $ 7)
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #3=(|STTF;acosh;2S;30|))
          (COND
           ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                (SPADCALL |coef|
                          (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                          (QREFELT $ 27)))
            (EXIT
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                              (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (QREFELT $ 77))
                    . #3#)
              (LETT |ord| (|STTF;orderOrFailed| |x| $) . #3#)
              (EXIT
               (COND
                ((QEQCAR |ord| 1)
                 (|error|
                  (SPADCALL (STRCONC "acosh: " (QREFELT $ 11))
                            (QREFELT $ 35))))
                ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |coef| (QREFELT $ 106))
                                  (QREFELT $ 24))
                        . #3#)
                  (GO #1#)))
                ((ODDP |order|)
                 (|error|
                  (SPADCALL (STRCONC "acosh: " (QREFELT $ 10))
                            (QREFELT $ 35))))
                (#2#
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                      (QREFELT $ 78))
                            (QREFELT $ 62))
                  (QREFELT $ 39)))))))))
          (EXIT
           (SPADCALL
            (SPADCALL |z|
                      (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                                          (SPADCALL (|spadConstant| $ 23)
                                                    (QREFELT $ 24))
                                          (QREFELT $ 77))
                                (QREFELT $ 78))
                      (QREFELT $ 62))
            (QREFELT $ 39)))))
        (#2#
         (|error|
          (SPADCALL (STRCONC "acosh: " (QREFELT $ 8)) (QREFELT $ 35))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;atanh;2S;31| (|z| $)
  (PROG (|coef|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 22))
        (SPADCALL (|spadConstant| $ 26) (QREFELT $ 24)))
       (#1='T
        (SEQ (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) |STTF;atanh;2S;31|)
             (EXIT
              (COND
               ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL 2 (QREFELT $ 108)) (QREFELT $ 109))
                  (QREFELT $ 110))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                             |z| (QREFELT $ 62))
                   (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                             |z| (QREFELT $ 77))
                   (QREFELT $ 37))
                  (QREFELT $ 39))
                 (QREFELT $ 44)))
               ((QREFELT $ 7)
                (COND
                 ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                      (SPADCALL |coef|
                                (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                                (QREFELT $ 27)))
                  (|error|
                   (SPADCALL (STRCONC "atanh: " (QREFELT $ 12))
                             (QREFELT $ 35))))
                 ('T
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL 2 (QREFELT $ 108)) (QREFELT $ 109))
                    (QREFELT $ 110))
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                               |z| (QREFELT $ 62))
                     (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                               |z| (QREFELT $ 77))
                     (QREFELT $ 37))
                    (QREFELT $ 39))
                   (QREFELT $ 44)))))
               (#1#
                (|error|
                 (SPADCALL (STRCONC "atanh: " (QREFELT $ 8))
                           (QREFELT $ 35))))))))))))) 

(DEFUN |STTF;acoth;2S;32| (|z| $)
  (COND
   ((SPADCALL |z| (QREFELT $ 22))
    (COND
     ((QREFELT $ 7)
      (SPADCALL (SPADCALL (|spadConstant| $ 26) (QREFELT $ 112))
                (QREFELT $ 24)))
     (#1='T
      (|error| (SPADCALL (STRCONC "acoth: " (QREFELT $ 8)) (QREFELT $ 35))))))
   ((QREFELT $ 7)
    (COND
     ((OR
       (SPADCALL (SPADCALL |z| (QREFELT $ 25)) (|spadConstant| $ 23)
                 (QREFELT $ 27))
       (SPADCALL (SPADCALL |z| (QREFELT $ 25))
                 (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                 (QREFELT $ 27)))
      (|error| (SPADCALL (STRCONC "acoth: " (QREFELT $ 12)) (QREFELT $ 35))))
     ('T
      (SPADCALL
       (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 108)) (QREFELT $ 109))
                 (QREFELT $ 110))
       (SPADCALL
        (SPADCALL
         (SPADCALL |z| (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                   (QREFELT $ 62))
         (SPADCALL |z| (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                   (QREFELT $ 77))
         (QREFELT $ 37))
        (QREFELT $ 39))
       (QREFELT $ 44)))))
   (#1# (|error| (SPADCALL (STRCONC "acoth: " (QREFELT $ 8)) (QREFELT $ 35)))))) 

(DEFUN |STTF;asech;2S;33| (|z| $)
  (PROG (#1=#:G420 |order| |ord| |x| |coef|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (|error| "asech: asech(0) is undefined"))
        ((QREFELT $ 7)
         (SEQ
          (LETT |coef| (SPADCALL |z| (QREFELT $ 25)) . #2=(|STTF;asech;2S;33|))
          (EXIT
           (COND
            ((SPADCALL |coef| (|spadConstant| $ 26) (QREFELT $ 27))
             (|error|
              (SPADCALL (STRCONC "asech: " (QREFELT $ 13)) (QREFELT $ 35))))
            ((OR (SPADCALL |coef| (|spadConstant| $ 23) (QREFELT $ 27))
                 (SPADCALL |coef|
                           (SPADCALL (|spadConstant| $ 23) (QREFELT $ 45))
                           (QREFELT $ 27)))
             (SEQ
              (LETT |x|
                    (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                              (SPADCALL |z| |z| (QREFELT $ 18)) (QREFELT $ 77))
                    . #2#)
              (LETT |ord| (|STTF;orderOrFailed| |x| $) . #2#)
              (EXIT
               (COND
                ((QEQCAR |ord| 1)
                 (|error|
                  (SPADCALL (STRCONC "asech: " (QREFELT $ 11))
                            (QREFELT $ 35))))
                ((EQL (LETT |order| (QCDR |ord|) . #2#) -1)
                 (PROGN
                  (LETT #1#
                        (SPADCALL (SPADCALL |coef| (QREFELT $ 114))
                                  (QREFELT $ 24))
                        . #2#)
                  (GO #1#)))
                ((ODDP |order|)
                 (|error|
                  (SPADCALL (STRCONC "asech: " (QREFELT $ 10))
                            (QREFELT $ 35))))
                (#3='T
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                             (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                       (QREFELT $ 78))
                             (QREFELT $ 62))
                   |z| (QREFELT $ 37))
                  (QREFELT $ 39)))))))
            ('T
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                         (SPADCALL (SPADCALL 1 2 (QREFELT $ 75))
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| $ 23)
                                              (QREFELT $ 24))
                                    (SPADCALL |z| |z| (QREFELT $ 18))
                                    (QREFELT $ 77))
                                   (QREFELT $ 78))
                         (QREFELT $ 62))
               |z| (QREFELT $ 37))
              (QREFELT $ 39)))))))
        (#3#
         (|error|
          (SPADCALL (STRCONC "asech: " (QREFELT $ 8)) (QREFELT $ 35))))))
      #1# (EXIT #1#))))) 

(DEFUN |STTF;acsch;2S;34| (|z| $)
  (PROG (#1=#:G429 |order| |ord| |x|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (QREFELT $ 22))
         (|error| "acsch: acsch(0) is undefined"))
        ((QREFELT $ 7)
         (COND
          ((SPADCALL (SPADCALL |z| (QREFELT $ 25)) (|spadConstant| $ 26)
                     (QREFELT $ 27))
           (|error|
            (SPADCALL (STRCONC "acsch: " (QREFELT $ 13)) (QREFELT $ 35))))
          (#2='T
           (SEQ
            (LETT |x|
                  (SPADCALL (SPADCALL |z| |z| (QREFELT $ 18))
                            (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                            (QREFELT $ 62))
                  . #3=(|STTF;acsch;2S;34|))
            (LETT |ord| (|STTF;orderOrFailed| |x| $) . #3#)
            (EXIT
             (COND
              ((QEQCAR |ord| 1)
               (|error|
                (SPADCALL (STRCONC "acsc: " (QREFELT $ 11)) (QREFELT $ 35))))
              ((EQL (LETT |order| (QCDR |ord|) . #3#) -1)
               (PROGN
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (SPADCALL |z| (QREFELT $ 25)) (QREFELT $ 116))
                       (QREFELT $ 24))
                      . #3#)
                (GO #1#)))
              ((ODDP |order|)
               (|error|
                (SPADCALL (STRCONC "acsch: " (QREFELT $ 10)) (QREFELT $ 35))))
              (#2#
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| $ 23) (QREFELT $ 24))
                           (SPADCALL (SPADCALL 1 2 (QREFELT $ 75)) |x|
                                     (QREFELT $ 78))
                           (QREFELT $ 62))
                 |z| (QREFELT $ 37))
                (QREFELT $ 39)))))))))
        (#2#
         (|error|
          (SPADCALL (STRCONC "acsch: " (QREFELT $ 8)) (QREFELT $ 35))))))
      #1# (EXIT #1#))))) 

(DEFUN |StreamTranscendentalFunctions| (#1=#:G430)
  (PROG ()
    (RETURN
     (PROG (#2=#:G431)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|StreamTranscendentalFunctions|)
                                           '|domainEqualList|)
                . #3=(|StreamTranscendentalFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|StreamTranscendentalFunctions;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|StreamTranscendentalFunctions|))))))))))) 

(DEFUN |StreamTranscendentalFunctions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|StreamTranscendentalFunctions|))
      (LETT |dv$| (LIST '|StreamTranscendentalFunctions| DV$1) . #1#)
      (LETT $ (GETREFV 118) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|StreamTranscendentalFunctions|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|HasCategory| |#1| '(|TranscendentalFunctionCategory|)))
      (QSETREFV $ 8 "series expansion involves transcendental constants")
      (QSETREFV $ 9 "series expansion has terms of negative degree")
      (QSETREFV $ 10 "series expansion has terms of fractional degree")
      (QSETREFV $ 11 "series expansion may have terms of fractional degree")
      (QSETREFV $ 12 "series expansion has logarithmic term")
      (QSETREFV $ 13
                "series expansion has terms of negative degree or logarithmic term")
      (QSETREFV $ 14
                "series expansion has terms of fractional degree or logarithmic term")
      (QSETREFV $ 15 "leading coefficient not invertible")
      $)))) 

(MAKEPROP '|StreamTranscendentalFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'TRANSFCN 'TRCONST
              'NPOWERS 'FPOWERS 'MAYFPOW 'LOGS 'NPOWLOG 'FPOWLOG 'NOTINV
              (|Stream| 6) (|StreamTaylorSeriesOperations| 6) (0 . *)
              (|Mapping| 16) (6 . |lazyIntegrate|) (|Boolean|) (12 . |empty?|)
              (17 . |One|) (21 . |coerce|) (26 . |frst|) (31 . |Zero|) (35 . =)
              (41 . |deriv|) (|Mapping| 16 16)
              (|ParadoxicalCombinatorsForStreams| 6) (46 . Y) (51 . |exp|)
              (|OutputForm|) (|String|) (56 . |coerce|) |STTF;exp;2S;2|
              (61 . /) (67 . |log|) |STTF;log;2S;3| |STTF;^;3S;4| (|List| 16)
              (72 . |second|) (77 . |first|) (82 . *) (88 . -)
              (|Mapping| 41 41) (|Integer|) (93 . Y) (99 . |sin|) (104 . |cos|)
              (109 . |One|) (|Record| (|:| |sin| 16) (|:| |cos| 16))
              |STTF;sincos;SR;6| |STTF;sin;2S;7| |STTF;cos;2S;8|
              (|PositiveInteger|) (113 . |One|) (|NonNegativeInteger|)
              (117 . |One|) (|Fraction| 47) (121 . |One|) (125 . +)
              (131 . |tan|) |STTF;tan;2S;10| (136 . -) (141 . |cot|)
              |STTF;cot;2S;12| (|Union| 16 '"failed") (146 . |recip|)
              (151 . |first|) |STTF;sec;2S;13| |STTF;csc;2S;14| (156 . |zero?|)
              (161 . |rst|) (166 . /) (172 . -) (177 . -) (183 . |powern|)
              (189 . |integrate|) (195 . |asin|) (200 . |exquo|)
              |STTF;asin;2S;16| (206 . |acos|) |STTF;acos;2S;17| (211 . |atan|)
              |STTF;atan;2S;18| (216 . |acot|) |STTF;acot;2S;19| (221 . |asec|)
              |STTF;asec;2S;20| (226 . |acsc|) |STTF;acsc;2S;21| (231 . |sinh|)
              (236 . |cosh|) (|Record| (|:| |sinh| 16) (|:| |cosh| 16))
              |STTF;sinhcosh;SR;22| |STTF;sinh;2S;23| |STTF;cosh;2S;24|
              (241 . |tanh|) |STTF;tanh;2S;25| |STTF;coth;2S;26|
              |STTF;sech;2S;27| |STTF;csch;2S;28| (246 . |asinh|)
              |STTF;asinh;2S;29| (251 . |acosh|) |STTF;acosh;2S;30|
              (256 . |coerce|) (261 . |inv|) (266 . |coerce|)
              |STTF;atanh;2S;31| (271 . |acoth|) |STTF;acoth;2S;32|
              (276 . |asech|) |STTF;asech;2S;33| (281 . |acsch|)
              |STTF;acsch;2S;34|)
           '#(|tanh| 286 |tan| 291 |sinhcosh| 296 |sinh| 301 |sincos| 306 |sin|
              311 |sech| 316 |sec| 321 |log| 326 |exp| 331 |csch| 336 |csc| 341
              |coth| 346 |cot| 351 |cosh| 356 |cos| 361 |atanh| 366 |atan| 371
              |asinh| 376 |asin| 381 |asech| 386 |asec| 391 |acsch| 396 |acsc|
              401 |acoth| 406 |acot| 411 |acosh| 416 |acos| 421 ^ 426)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 117
                                                 '(2 17 16 16 16 18 2 17 16 6
                                                   19 20 1 16 21 0 22 0 6 0 23
                                                   1 17 16 6 24 1 16 6 0 25 0 6
                                                   0 26 2 6 21 0 0 27 1 17 16
                                                   16 28 1 30 16 29 31 1 6 0 0
                                                   32 1 34 33 0 35 2 17 16 16
                                                   16 37 1 6 0 0 38 1 41 16 0
                                                   42 1 41 16 0 43 2 17 16 6 16
                                                   44 1 6 0 0 45 2 30 41 46 47
                                                   48 1 6 0 0 49 1 6 0 0 50 0
                                                   47 0 51 0 56 0 57 0 58 0 59
                                                   0 60 0 61 2 17 16 16 16 62 1
                                                   6 0 0 63 1 17 16 16 65 1 6 0
                                                   0 66 1 17 68 16 69 1 16 6 0
                                                   70 1 6 21 0 73 1 16 0 0 74 2
                                                   60 0 47 47 75 1 60 0 0 76 2
                                                   17 16 16 16 77 2 17 16 60 16
                                                   78 2 17 16 6 16 79 1 6 0 0
                                                   80 2 17 68 16 16 81 1 6 0 0
                                                   83 1 6 0 0 85 1 6 0 0 87 1 6
                                                   0 0 89 1 6 0 0 91 1 6 0 0 93
                                                   1 6 0 0 94 1 6 0 0 99 1 6 0
                                                   0 104 1 6 0 0 106 1 60 0 47
                                                   108 1 60 0 0 109 1 6 0 60
                                                   110 1 6 0 0 112 1 6 0 0 114
                                                   1 6 0 0 116 1 0 16 16 100 1
                                                   0 16 16 64 1 0 95 16 96 1 0
                                                   16 16 97 1 0 52 16 53 1 0 16
                                                   16 54 1 0 16 16 102 1 0 16
                                                   16 71 1 0 16 16 39 1 0 16 16
                                                   36 1 0 16 16 103 1 0 16 16
                                                   72 1 0 16 16 101 1 0 16 16
                                                   67 1 0 16 16 98 1 0 16 16 55
                                                   1 0 16 16 111 1 0 16 16 86 1
                                                   0 16 16 105 1 0 16 16 82 1 0
                                                   16 16 115 1 0 16 16 90 1 0
                                                   16 16 117 1 0 16 16 92 1 0
                                                   16 16 113 1 0 16 16 88 1 0
                                                   16 16 107 1 0 16 16 84 2 0
                                                   16 16 16 40)))))
           '|lookupComplete|)) 
