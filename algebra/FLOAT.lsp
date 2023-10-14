
(/VERSIONCHECK 2) 

(DEFUN |FLOAT;writeOMFloat| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 13))
       (SPADCALL |dev| "bigfloat1" "bigfloat" (QREFELT $ 15))
       (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 17)) (QREFELT $ 18))
       (SPADCALL |dev| 2 (QREFELT $ 18))
       (SPADCALL |dev| (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 18))
       (EXIT (SPADCALL |dev| (QREFELT $ 20))))) 

(DEFUN |FLOAT;OMwrite;$S;2| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|FLOAT;OMwrite;$S;2|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 22)) (QREFELT $ 23))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 24)) (|FLOAT;writeOMFloat| |dev| |x| $)
          (SPADCALL |dev| (QREFELT $ 25)) (SPADCALL |dev| (QREFELT $ 26))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |FLOAT;OMwrite;$BS;3| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|FLOAT;OMwrite;$BS;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 22)) (QREFELT $ 23))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 24))))
          (|FLOAT;writeOMFloat| |dev| |x| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 25))))
          (SPADCALL |dev| (QREFELT $ 26))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |FLOAT;OMwrite;Omd$V;4| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 24)) (|FLOAT;writeOMFloat| |dev| |x| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 25))))) 

(DEFUN |FLOAT;OMwrite;Omd$BV;5| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 24))))
       (|FLOAT;writeOMFloat| |dev| |x| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 25))))))) 

(DEFUN |FLOAT;shift2| (|x| |y| $)
  (* (SPADCALL |x| (QREFELT $ 32))
     (ASH (* (SPADCALL |x| (QREFELT $ 32)) |x|) |y|))) 

(DEFUN |FLOAT;asin;2$;7| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
            ((SPADCALL |x| (QREFELT $ 35))
             (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 37))
                       (QREFELT $ 36)))
            ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
             (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
            ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
             (|error| "asin: argument > 1 in magnitude"))
            ('T
             (SEQ (SPADCALL 5 (QREFELT $ 43))
                  (LETT |r|
                        (SPADCALL
                         (SPADCALL |x|
                                   (SPADCALL
                                    (|FLOAT;sub| (|spadConstant| $ 38)
                                     (|FLOAT;times| |x| |x| $) $)
                                    (QREFELT $ 44))
                                   (QREFELT $ 45))
                         (QREFELT $ 46))
                        |FLOAT;asin;2$;7|)
                  (SPADCALL 5 (QREFELT $ 47))
                  (EXIT (SPADCALL |r| (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;acos;2$;8| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (QREFELT $ 33))
        (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
       ((SPADCALL |x| (QREFELT $ 35))
        (SEQ (SPADCALL 3 (QREFELT $ 43))
             (LETT |r|
                   (SPADCALL (SPADCALL (QREFELT $ 40))
                             (SPADCALL (SPADCALL |x| (QREFELT $ 36))
                                       (QREFELT $ 49))
                             (QREFELT $ 50))
                   . #1=(|FLOAT;acos;2$;8|))
             (SPADCALL 3 (QREFELT $ 47)) (EXIT (SPADCALL |r| (QREFELT $ 48)))))
       ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
        (|spadConstant| $ 34))
       ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
        (|error| "acos: argument > 1 in magnitude"))
       ('T
        (SEQ (SPADCALL 5 (QREFELT $ 43))
             (LETT |r|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (|FLOAT;sub| (|spadConstant| $ 38)
                       (|FLOAT;times| |x| |x| $) $)
                      (QREFELT $ 44))
                     |x| (QREFELT $ 45))
                    (QREFELT $ 46))
                   . #1#)
             (SPADCALL 5 (QREFELT $ 47))
             (EXIT (SPADCALL |r| (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;atan;3$;9| (|x| |y| $)
  (PROG (|theta|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
        (COND
         ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 42))
          (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41)))
         ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 51))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41))
                    (QREFELT $ 36)))
         (#1='T (|spadConstant| $ 34))))
       (#1#
        (SEQ
         (LETT |theta|
               (SPADCALL
                (SPADCALL (SPADCALL |y| |x| (QREFELT $ 45)) (QREFELT $ 52))
                (QREFELT $ 46))
               . #2=(|FLOAT;atan;3$;9|))
         (COND
          ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 51))
           (LETT |theta|
                 (SPADCALL (SPADCALL (QREFELT $ 40)) |theta| (QREFELT $ 50))
                 . #2#)))
         (COND
          ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 51))
           (LETT |theta| (SPADCALL |theta| (QREFELT $ 36)) . #2#)))
         (EXIT |theta|)))))))) 

(DEFUN |FLOAT;atan;2$;10| (|x| $)
  (PROG (|t| |i| |k| #1=#:G255 |r|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
             ((SPADCALL |x| (QREFELT $ 35))
              (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 46))
                        (QREFELT $ 36)))
             (#2='T
              (SEQ
               (COND
                ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
                 (SEQ (SPADCALL 4 (QREFELT $ 43))
                      (LETT |r|
                            (COND
                             ((SPADCALL (SPADCALL |x| (QREFELT $ 54))
                                        (QREFELT $ 33))
                              (COND
                               ((SPADCALL |x|
                                          (CONS (SPADCALL (QREFELT $ 55)) 0)
                                          (QREFELT $ 51))
                                (|FLOAT;atanInverse|
                                 (SPADCALL |x| (QREFELT $ 56)) $))
                               (#2#
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 38) |x|
                                           (QREFELT $ 45))
                                 (QREFELT $ 46)))))
                             (#2#
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 38) |x|
                                         (QREFELT $ 45))
                               (QREFELT $ 46))))
                            . #3=(|FLOAT;atan;2$;10|))
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL (SPADCALL (QREFELT $ 40)) 2
                                       (QREFELT $ 41))
                             |r| (QREFELT $ 50))
                            . #3#)
                      (SPADCALL 4 (QREFELT $ 47))
                      (EXIT
                       (PROGN
                        (LETT #1# (SPADCALL |r| (QREFELT $ 48)) . #3#)
                        (GO #1#))))))
               (LETT |k|
                     (QUOTIENT2
                      (SPADCALL (- (SPADCALL (QREFELT $ 55)) 100)
                                (QREFELT $ 58))
                      5)
                     . #3#)
               (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                     . #3#)
               (SPADCALL (SPADCALL 2 |k| (QREFELT $ 60)) (QREFELT $ 43))
               (SEQ (LETT |i| 1 . #3#) G190
                    (COND ((|greater_SI| |i| |k|) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT |x|
                            (SPADCALL |x|
                                      (SPADCALL (|spadConstant| $ 38)
                                                (SPADCALL
                                                 (SPADCALL
                                                  (|spadConstant| $ 38)
                                                  (SPADCALL |x| |x|
                                                            (QREFELT $ 61))
                                                  (QREFELT $ 62))
                                                 (QREFELT $ 44))
                                                (QREFELT $ 62))
                                      (QREFELT $ 45))
                            . #3#)))
                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
               (LETT |t| (|FLOAT;atanSeries| |x| $) . #3#)
               (SPADCALL (SPADCALL 2 |k| (QREFELT $ 60)) (QREFELT $ 47))
               (LETT |t| (SPADCALL |t| |k| (QREFELT $ 63)) . #3#)
               (EXIT (SPADCALL |t| (QREFELT $ 48)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;atanSeries| (|x| $)
  (PROG (|t| |s| |i| |m| |y| |d| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (+
             (+ (SPADCALL (QREFELT $ 55))
                (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
             2)
            . #1=(|FLOAT;atanSeries|))
      (LETT |s| (LETT |d| (ASH 1 |p|) . #1#) . #1#)
      (LETT |y| (|FLOAT;times| |x| |x| $) . #1#)
      (LETT |t|
            (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $))
                  . #1#)
            . #1#)
      (SEQ (LETT |i| 3 . #1#) G190
           (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)) . #1#)
                (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|) . #1#)))
           (LETT |i| (|add_SI| |i| 2) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 61))))))) 

(DEFUN |FLOAT;atanInverse| (|n| $)
  (PROG (|t| |s| |k| |e| |n2|)
    (RETURN
     (SEQ (LETT |n2| (- (* |n| |n|)) . #1=(|FLOAT;atanInverse|))
          (LETT |e|
                (+
                 (+
                  (+ (SPADCALL (QREFELT $ 55))
                     (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
                  (INTEGER-LENGTH |n|))
                 1)
                . #1#)
          (LETT |s| (QUOTIENT2 (ASH 1 |e|) |n|) . #1#)
          (LETT |t| (QUOTIENT2 |s| |n2|) . #1#)
          (SEQ (LETT |k| 3 . #1#) G190
               (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
               (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                    (EXIT (LETT |t| (QUOTIENT2 |t| |n2|) . #1#)))
               (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (CONS |s| (- |e|)) (QREFELT $ 48))))))) 

(DEFUN |FLOAT;sin;2$;13| (|x| $)
  (PROG (|r| |i| #1=#:G280 |k| |s| |p|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 65)) . #2=(|FLOAT;sin;2$;13|))
          (LETT |x| (SPADCALL |x| (QREFELT $ 52)) . #2#)
          (LETT |p| (SPADCALL (QREFELT $ 55)) . #2#)
          (SPADCALL 4 (QREFELT $ 43))
          (COND
           ((SPADCALL |x| (CONS 6 0) (QREFELT $ 42))
            (SEQ (SPADCALL |p| (QREFELT $ 43))
                 (LETT |x|
                       (SPADCALL
                        (SPADCALL 2 (SPADCALL (QREFELT $ 40)) (QREFELT $ 66))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                    (QREFELT $ 45))
                          2 (QREFELT $ 41))
                         (QREFELT $ 54))
                        (QREFELT $ 61))
                       . #2#)
                 (EXIT (SPADCALL |p| (QREFELT $ 67))))))
          (COND
           ((SPADCALL |x| (CONS 3 0) (QREFELT $ 42))
            (SEQ (SPADCALL |p| (QREFELT $ 43)) (LETT |s| (- |s|) . #2#)
                 (LETT |x|
                       (SPADCALL |x| (SPADCALL (QREFELT $ 40)) (QREFELT $ 50))
                       . #2#)
                 (EXIT (SPADCALL |p| (QREFELT $ 67))))))
          (COND
           ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 42))
            (SEQ (SPADCALL |p| (QREFELT $ 43))
                 (LETT |x|
                       (SPADCALL (SPADCALL (QREFELT $ 40)) |x| (QREFELT $ 50))
                       . #2#)
                 (EXIT (SPADCALL |p| (QREFELT $ 47))))))
          (LETT |k|
                (QUOTIENT2
                 (SPADCALL (- (SPADCALL (QREFELT $ 55)) 100) (QREFELT $ 58)) 4)
                . #2#)
          (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59)))) . #2#)
          (COND
           ((SPADCALL |k| 0 (QREFELT $ 68))
            (SEQ (SPADCALL |k| (QREFELT $ 43))
                 (EXIT
                  (LETT |x|
                        (SPADCALL |x|
                                  (EXPT 3
                                        (PROG1 (LETT #1# |k| . #2#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#)))
                                  (QREFELT $ 41))
                        . #2#)))))
          (LETT |r| (|FLOAT;sinSeries| |x| $) . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |k|) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |r|
                       (SPADCALL (|FLOAT;itimes| 3 |r| $)
                                 (SPADCALL (SPADCALL |r| 3 (QREFELT $ 69)) 2
                                           (QREFELT $ 63))
                                 (QREFELT $ 50))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (SPADCALL |p| (QREFELT $ 67))
          (EXIT (SPADCALL |s| |r| (QREFELT $ 70))))))) 

(DEFUN |FLOAT;sinSeries| (|x| $)
  (PROG (|t| |s| |i| |m| |d| |y| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (+
             (+ (SPADCALL (QREFELT $ 55))
                (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
             2)
            . #1=(|FLOAT;sinSeries|))
      (LETT |y| (|FLOAT;times| |x| |x| $) . #1#)
      (LETT |s| (LETT |d| (ASH 1 |p|) . #1#) . #1#)
      (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)) . #1#)
      (LETT |t| (QUOTIENT2 |m| 6) . #1#)
      (SEQ (LETT |i| 4 . #1#) G190
           (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
           (SEQ (LETT |s| (+ |s| |t|) . #1#)
                (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))) . #1#)
                (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #1#)))
           (LETT |i| (|add_SI| |i| 2) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |x| (CONS |s| (- |p|)) (QREFELT $ 61))))))) 

(DEFUN |FLOAT;cos;2$;15| (|x| $)
  (PROG (|r| |i| |k| #1=#:G300 |s| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |s| 1 . #2=(|FLOAT;cos;2$;15|))
            (LETT |x| (SPADCALL |x| (QREFELT $ 52)) . #2#)
            (LETT |p| (SPADCALL (QREFELT $ 55)) . #2#)
            (SPADCALL 4 (QREFELT $ 43))
            (COND
             ((SPADCALL |x| (CONS 6 0) (QREFELT $ 42))
              (SEQ (SPADCALL |p| (QREFELT $ 43))
                   (LETT |x|
                         (SPADCALL
                          (SPADCALL 2 (SPADCALL (QREFELT $ 40)) (QREFELT $ 66))
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                      (QREFELT $ 45))
                            2 (QREFELT $ 41))
                           (QREFELT $ 54))
                          (QREFELT $ 61))
                         . #2#)
                   (EXIT (SPADCALL |p| (QREFELT $ 47))))))
            (COND
             ((SPADCALL |x| (CONS 3 0) (QREFELT $ 42))
              (SEQ (SPADCALL |p| (QREFELT $ 43)) (LETT |s| (- |s|) . #2#)
                   (LETT |x|
                         (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                   (QREFELT $ 50))
                         . #2#)
                   (EXIT (SPADCALL |p| (QREFELT $ 47))))))
            (COND
             ((SPADCALL |x| (CONS 1 0) (QREFELT $ 42))
              (SEQ (SPADCALL |p| (QREFELT $ 43))
                   (LETT |x|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT $ 40)) 2 (QREFELT $ 41))
                          |x| (QREFELT $ 50))
                         . #2#)
                   (SPADCALL |p| (QREFELT $ 67))
                   (LETT |x| (SPADCALL |x| (QREFELT $ 48)) . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL |s| (SPADCALL |x| (QREFELT $ 71))
                                     (QREFELT $ 70))
                           . #2#)
                     (GO #1#))))))
            (LETT |k|
                  (QUOTIENT2
                   (SPADCALL (- (SPADCALL (QREFELT $ 55)) 100) (QREFELT $ 58))
                   3)
                  . #2#)
            (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                  . #2#)
            (COND
             ((SPADCALL |k| 0 (QREFELT $ 68))
              (SEQ
               (SPADCALL (+ |k| (EXPT (INTEGER-LENGTH |k|) 2)) (QREFELT $ 43))
               (EXIT (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 63)) . #2#)))))
            (LETT |r| (|FLOAT;cosSeries| |x| $) . #2#)
            (SEQ (LETT |i| 1 . #2#) G190
                 (COND ((|greater_SI| |i| |k|) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |r|
                         (SPADCALL
                          (SPADCALL (SPADCALL |r| |r| (QREFELT $ 61)) 1
                                    (QREFELT $ 63))
                          (|spadConstant| $ 38) (QREFELT $ 50))
                         . #2#)))
                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
            (SPADCALL |p| (QREFELT $ 67))
            (EXIT (SPADCALL |s| |r| (QREFELT $ 70)))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;cosSeries| (|x| $)
  (PROG (|t| |s| |i| |m| |d| |y| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (+
             (+ (SPADCALL (QREFELT $ 55))
                (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
             1)
            . #1=(|FLOAT;cosSeries|))
      (LETT |y| (|FLOAT;times| |x| |x| $) . #1#)
      (LETT |s| (LETT |d| (ASH 1 |p|) . #1#) . #1#)
      (LETT |m| (- (|FLOAT;shift2| (QCAR |y|) (+ (QCDR |y|) |p|) $)) . #1#)
      (LETT |t| (QUOTIENT2 |m| 2) . #1#)
      (SEQ (LETT |i| 3 . #1#) G190
           (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
           (SEQ (LETT |s| (+ |s| |t|) . #1#)
                (LETT |t| (QUOTIENT2 (* |m| |t|) (* |i| (+ |i| 1))) . #1#)
                (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #1#)))
           (LETT |i| (|add_SI| |i| 2) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 48))))))) 

(DEFUN |FLOAT;tan;2$;17| (|x| $)
  (PROG (|t| |c| |s| |p|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL |x| (QREFELT $ 65)) . #1=(|FLOAT;tan;2$;17|))
          (LETT |x| (SPADCALL |x| (QREFELT $ 52)) . #1#)
          (LETT |p| (SPADCALL (QREFELT $ 55)) . #1#)
          (SPADCALL 6 (QREFELT $ 43))
          (COND
           ((SPADCALL |x| (CONS 3 0) (QREFELT $ 42))
            (SEQ (SPADCALL |p| (QREFELT $ 43))
                 (LETT |x|
                       (SPADCALL (SPADCALL (QREFELT $ 40))
                                 (SPADCALL
                                  (SPADCALL |x| (SPADCALL (QREFELT $ 40))
                                            (QREFELT $ 45))
                                  (QREFELT $ 54))
                                 (QREFELT $ 61))
                       . #1#)
                 (EXIT (SPADCALL |p| (QREFELT $ 47))))))
          (COND
           ((SPADCALL |x| (CONS 3 -1) (QREFELT $ 42))
            (SEQ (SPADCALL |p| (QREFELT $ 43))
                 (LETT |x|
                       (SPADCALL (SPADCALL (QREFELT $ 40)) |x| (QREFELT $ 50))
                       . #1#)
                 (LETT |s| (- |s|) . #1#)
                 (EXIT (SPADCALL |p| (QREFELT $ 47))))))
          (COND
           ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
            (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 72)) . #1#)
                 (EXIT
                  (LETT |t|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 38)
                                    (SPADCALL |c| |c| (QREFELT $ 61))
                                    (QREFELT $ 50))
                          (QREFELT $ 44))
                         |c| (QREFELT $ 45))
                        . #1#))))
           ('T
            (SEQ (LETT |c| (SPADCALL |x| (QREFELT $ 71)) . #1#)
                 (EXIT
                  (LETT |t|
                        (SPADCALL |c|
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 38)
                                             (SPADCALL |c| |c| (QREFELT $ 61))
                                             (QREFELT $ 50))
                                   (QREFELT $ 44))
                                  (QREFELT $ 45))
                        . #1#)))))
          (SPADCALL |p| (QREFELT $ 67))
          (EXIT (SPADCALL |s| |t| (QREFELT $ 70))))))) 

(DEFUN |FLOAT;pi;$;18| ($)
  (COND
   ((SPADCALL (SPADCALL (QREFELT $ 55)) (QCAR (QREFELT $ 74)) (QREFELT $ 76))
    (SPADCALL (QCDR (QREFELT $ 74)) (QREFELT $ 48)))
   ('T
    (QCDR
     (SETELT $ 74 (CONS (SPADCALL (QREFELT $ 55)) (|FLOAT;piRamanujan| $))))))) 

(DEFUN |FLOAT;piRamanujan| ($)
  (PROG (|t| |m| |s| |i| |j| |d| |n|)
    (RETURN
     (SEQ
      (LETT |n|
            (+
             (+ (SPADCALL (QREFELT $ 55))
                (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
             11)
            . #1=(|FLOAT;piRamanujan|))
      (LETT |t| (QUOTIENT2 (ASH 1 |n|) 882) . #1#)
      (LETT |d| (* 4 (SPADCALL 882 2 (QREFELT $ 77))) . #1#) (LETT |s| 0 . #1#)
      (SEQ (LETT |j| 1123 . #1#) (LETT |i| 2 . #1#) G190
           (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
           (SEQ (LETT |s| (+ |s| (SPADCALL |j| |t| (QREFELT $ 79))) . #1#)
                (LETT |m|
                      (-
                       (* (* (- |i| 1) (- (SPADCALL 2 |i| (QREFELT $ 80)) 1))
                          (- (SPADCALL 2 |i| (QREFELT $ 80)) 3)))
                      . #1#)
                (EXIT
                 (LETT |t|
                       (QUOTIENT2 (* |m| |t|)
                                  (* |d| (SPADCALL |i| 3 (QREFELT $ 81))))
                       . #1#)))
           (LETT |i|
                 (PROG1 (|add_SI| |i| 2) (LETT |j| (|add_SI| |j| 21460) . #1#))
                 . #1#)
           (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (|spadConstant| $ 38) (CONS |s| (- (- |n|) 2))
                 (QREFELT $ 45))))))) 

(DEFUN |FLOAT;sinh;2$;20| (|x| $)
  (PROG (|s| |e| |lost|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
            (#1='T
             (SEQ
              (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 59))) 0)
                    . #2=(|FLOAT;sinh;2$;20|))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 60))
                           (SPADCALL (QREFELT $ 55)) (QREFELT $ 68))
                 |x|)
                (#1#
                 (SEQ (SPADCALL (+ 5 |lost|) (QREFELT $ 43))
                      (LETT |e| (SPADCALL |x| (QREFELT $ 82)) . #2#)
                      (LETT |s|
                            (SPADCALL
                             (SPADCALL |e|
                                       (SPADCALL (|spadConstant| $ 38) |e|
                                                 (QREFELT $ 45))
                                       (QREFELT $ 50))
                             2 (QREFELT $ 41))
                            . #2#)
                      (SPADCALL (+ 5 |lost|) (QREFELT $ 47))
                      (EXIT (SPADCALL |s| (QREFELT $ 48)))))))))))))) 

(DEFUN |FLOAT;cosh;2$;21| (|x| $)
  (PROG (|c| |e|)
    (RETURN
     (SEQ (SPADCALL 5 (QREFELT $ 43))
          (LETT |e| (SPADCALL |x| (QREFELT $ 82)) . #1=(|FLOAT;cosh;2$;21|))
          (LETT |c|
                (SPADCALL
                 (SPADCALL |e|
                           (SPADCALL (|spadConstant| $ 38) |e| (QREFELT $ 45))
                           (QREFELT $ 62))
                 2 (QREFELT $ 41))
                . #1#)
          (SPADCALL 5 (QREFELT $ 47)) (EXIT (SPADCALL |c| (QREFELT $ 48))))))) 

(DEFUN |FLOAT;tanh;2$;22| (|x| $)
  (PROG (|t| |e| |lost|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 33)) (|spadConstant| $ 34))
            (#1='T
             (SEQ
              (LETT |lost| (MAX (- (SPADCALL |x| (QREFELT $ 59))) 0)
                    . #2=(|FLOAT;tanh;2$;22|))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL 2 |lost| (QREFELT $ 60))
                           (SPADCALL (QREFELT $ 55)) (QREFELT $ 68))
                 |x|)
                (#1#
                 (SEQ (SPADCALL (+ 6 |lost|) (QREFELT $ 43))
                      (LETT |e| (SPADCALL |x| (QREFELT $ 82)) . #2#)
                      (LETT |e| (SPADCALL |e| |e| (QREFELT $ 61)) . #2#)
                      (LETT |t|
                            (SPADCALL
                             (SPADCALL |e| (|spadConstant| $ 38)
                                       (QREFELT $ 50))
                             (SPADCALL |e| (|spadConstant| $ 38)
                                       (QREFELT $ 62))
                             (QREFELT $ 45))
                            . #2#)
                      (SPADCALL (+ 6 |lost|) (QREFELT $ 47))
                      (EXIT (SPADCALL |t| (QREFELT $ 48)))))))))))))) 

(DEFUN |FLOAT;asinh;2$;23| (|x| $)
  (PROG (|r| #1=#:G340 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 59)))
              . #2=(|FLOAT;asinh;2$;23|))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 33))
              (< (SPADCALL 2 |p| (QREFELT $ 60))
                 (- (SPADCALL (QREFELT $ 55)))))
          (PROGN (LETT #1# |x| . #2#) (GO #1#))))
        (SPADCALL (- 5 |p|) (QREFELT $ 43))
        (LETT |r|
              (SPADCALL
               (SPADCALL |x|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 38)
                                    (SPADCALL |x| |x| (QREFELT $ 61))
                                    (QREFELT $ 62))
                          (QREFELT $ 44))
                         (QREFELT $ 62))
               (QREFELT $ 86))
              . #2#)
        (SPADCALL (- 5 |p|) (QREFELT $ 47))
        (EXIT (SPADCALL |r| (QREFELT $ 48)))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;acosh;2$;24| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 51))
        (|error| "invalid argument to acosh")))
      (SPADCALL 5 (QREFELT $ 43))
      (LETT |r|
            (SPADCALL
             (SPADCALL |x|
                       (SPADCALL
                        (|FLOAT;sub| (|FLOAT;times| |x| |x| $)
                         (|spadConstant| $ 38) $)
                        (QREFELT $ 44))
                       (QREFELT $ 62))
             (QREFELT $ 86))
            |FLOAT;acosh;2$;24|)
      (SPADCALL 5 (QREFELT $ 47)) (EXIT (SPADCALL |r| (QREFELT $ 48))))))) 

(DEFUN |FLOAT;atanh;2$;25| (|x| $)
  (PROG (|r| #1=#:G348 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((OR (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 42))
              (SPADCALL |x| (SPADCALL (|spadConstant| $ 38) (QREFELT $ 36))
                        (QREFELT $ 51)))
          (|error| "invalid argument to atanh")))
        (LETT |p| (MIN 0 (SPADCALL |x| (QREFELT $ 59)))
              . #2=(|FLOAT;atanh;2$;25|))
        (COND
         ((OR (SPADCALL |x| (QREFELT $ 33))
              (< (SPADCALL 2 |p| (QREFELT $ 60))
                 (- (SPADCALL (QREFELT $ 55)))))
          (PROGN (LETT #1# |x| . #2#) (GO #1#))))
        (SPADCALL (- 5 |p|) (QREFELT $ 43))
        (LETT |r|
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 62))
                          (SPADCALL (|spadConstant| $ 38) |x| (QREFELT $ 50))
                          (QREFELT $ 45))
                (QREFELT $ 86))
               2 (QREFELT $ 41))
              . #2#)
        (SPADCALL (- 5 |p|) (QREFELT $ 47))
        (EXIT (SPADCALL |r| (QREFELT $ 48)))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;log;2$;26| (|x| $)
  (PROG (|l| |m| |ek| #1=#:G353 |k| |n| |p|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 35)) (|error| "negative log"))
            ((SPADCALL |x| (QREFELT $ 33)) (|error| "log 0 generated"))
            (#2='T
             (SEQ (LETT |p| (SPADCALL (QREFELT $ 55)) . #3=(|FLOAT;log;2$;26|))
                  (SPADCALL 5 (QREFELT $ 43))
                  (SEQ (LETT |n| (SPADCALL |x| (QREFELT $ 59)) . #3#)
                       (EXIT (COND ((< |n| 0) (LETT |n| (+ |n| 1) . #3#)))))
                  (LETT |l|
                        (COND ((EQL |n| 0) (|spadConstant| $ 34))
                              (#2#
                               (SEQ
                                (LETT |x| (SPADCALL |x| (- |n|) (QREFELT $ 63))
                                      . #3#)
                                (EXIT
                                 (SPADCALL |n| (SPADCALL (QREFELT $ 90))
                                           (QREFELT $ 70))))))
                        . #3#)
                  (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 58)) 3)
                        . #3#)
                  (COND
                   ((SPADCALL |k| 1 (QREFELT $ 68))
                    (SEQ
                     (LETT |k|
                           (MAX 1
                                (+ |k|
                                   (SPADCALL
                                    (SPADCALL |x| (|spadConstant| $ 38)
                                              (QREFELT $ 50))
                                    (QREFELT $ 59))))
                           . #3#)
                     (SPADCALL |k| (QREFELT $ 43))
                     (LETT |ek|
                           (|FLOAT;expInverse|
                            (EXPT 2
                                  (PROG1 (LETT #1# |k| . #3#)
                                    (|check_subtype| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     #1#)))
                            $)
                           . #3#)
                     (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 47))
                     (LETT |m|
                           (SPADCALL (|FLOAT;square| |x| |k| $) (QREFELT $ 59))
                           . #3#)
                     (SPADCALL (QUOTIENT2 |p| 2) (QREFELT $ 43))
                     (LETT |m|
                           (QUOTIENT2 (SPADCALL 6847196937 |m| (QREFELT $ 60))
                                      9878417065)
                           . #3#)
                     (LETT |x|
                           (SPADCALL |x| (SPADCALL |ek| (- |m|) (QREFELT $ 91))
                                     (QREFELT $ 61))
                           . #3#)
                     (EXIT
                      (LETT |l|
                            (SPADCALL |l| (CONS |m| (- |k|)) (QREFELT $ 62))
                            . #3#)))))
                  (LETT |l|
                        (SPADCALL |l| (|FLOAT;logSeries| |x| $) (QREFELT $ 62))
                        . #3#)
                  (SPADCALL |p| (QREFELT $ 67))
                  (EXIT (SPADCALL |l| (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;logSeries| (|x| $)
  (PROG (|t| |s| |i| |m| |z| |d| |y| |p| |g|)
    (RETURN
     (SEQ
      (LETT |p|
            (+ (SPADCALL (QREFELT $ 55))
               (LETT |g| (+ (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))) 3)
                     . #1=(|FLOAT;logSeries|)))
            . #1#)
      (SPADCALL |g| (QREFELT $ 43))
      (LETT |y|
            (SPADCALL (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 50))
                      (SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 62))
                      (QREFELT $ 45))
            . #1#)
      (SPADCALL |g| (QREFELT $ 47))
      (LETT |s| (LETT |d| (ASH 1 |p|) . #1#) . #1#)
      (LETT |z| (|FLOAT;times| |y| |y| $) . #1#)
      (LETT |t|
            (LETT |m| (|FLOAT;shift2| (QCAR |z|) (+ (QCDR |z|) |p|) $) . #1#)
            . #1#)
      (SEQ (LETT |i| 3 . #1#) G190
           (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
           (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |i|)) . #1#)
                (EXIT (LETT |t| (QUOTIENT2 (* |m| |t|) |d|) . #1#)))
           (LETT |i| (|add_SI| |i| 2) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |y| (CONS |s| (- 1 |p|)) (QREFELT $ 61))))))) 

(DEFUN |FLOAT;log2;$;28| ($)
  (PROG (|t| |s| |k| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL (QREFELT $ 55)) . #1=(|FLOAT;log2;$;28|))
          (EXIT
           (COND
            ((SPADCALL |n| (QCAR (QREFELT $ 92)) (QREFELT $ 93))
             (SPADCALL (QCDR (QREFELT $ 92)) (QREFELT $ 48)))
            ('T
             (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 3) . #1#)
                  (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 3) . #1#)
                  (LETT |t| (QUOTIENT2 |s| 9) . #1#)
                  (SEQ (LETT |k| 3 . #1#) G190
                       (COND
                        ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
                       (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                            (EXIT (LETT |t| (QUOTIENT2 |t| 9) . #1#)))
                       (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (SETELT $ 92
                          (CONS (SPADCALL (QREFELT $ 55)) (CONS |s| (- |n|))))
                  (EXIT (SPADCALL (QCDR (QREFELT $ 92)) (QREFELT $ 48))))))))))) 

(DEFUN |FLOAT;log10;$;29| ($)
  (PROG (|t| |s| |k| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL (QREFELT $ 55)) . #1=(|FLOAT;log10;$;29|))
          (EXIT
           (COND
            ((SPADCALL |n| (QCAR (QREFELT $ 94)) (QREFELT $ 93))
             (SPADCALL (QCDR (QREFELT $ 94)) (QREFELT $ 48)))
            ('T
             (SEQ (LETT |n| (+ (+ |n| (INTEGER-LENGTH |n|)) 5) . #1#)
                  (LETT |s| (QUOTIENT2 (ASH 1 (+ |n| 1)) 9) . #1#)
                  (LETT |t| (QUOTIENT2 |s| 81) . #1#)
                  (SEQ (LETT |k| 3 . #1#) G190
                       (COND
                        ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
                       (SEQ (LETT |s| (+ |s| (QUOTIENT2 |t| |k|)) . #1#)
                            (EXIT (LETT |t| (QUOTIENT2 |t| 81) . #1#)))
                       (LETT |k| (|add_SI| |k| 2) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (SPADCALL 2 (QREFELT $ 43))
                  (SETELT $ 94
                          (CONS (SPADCALL (QREFELT $ 55))
                                (SPADCALL (CONS |s| (- |n|))
                                          (SPADCALL 3 (SPADCALL (QREFELT $ 90))
                                                    (QREFELT $ 66))
                                          (QREFELT $ 62))))
                  (SPADCALL 2 (QREFELT $ 47))
                  (EXIT (SPADCALL (QCDR (QREFELT $ 94)) (QREFELT $ 48))))))))))) 

(DEFUN |FLOAT;log2;2$;30| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (SPADCALL 2 (QREFELT $ 43))
          (LETT |r|
                (SPADCALL (SPADCALL |x| (QREFELT $ 86))
                          (SPADCALL (QREFELT $ 90)) (QREFELT $ 45))
                |FLOAT;log2;2$;30|)
          (SPADCALL 2 (QREFELT $ 47)) (EXIT (SPADCALL |r| (QREFELT $ 48))))))) 

(DEFUN |FLOAT;log10;2$;31| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (SPADCALL 2 (QREFELT $ 43))
          (LETT |r|
                (SPADCALL (SPADCALL |x| (QREFELT $ 86))
                          (SPADCALL (QREFELT $ 95)) (QREFELT $ 45))
                |FLOAT;log10;2$;31|)
          (SPADCALL 2 (QREFELT $ 47)) (EXIT (SPADCALL |r| (QREFELT $ 48))))))) 

(DEFUN |FLOAT;exp;2$;32| (|x| $)
  (PROG (|e| |k| #1=#:G385 |e1| |n| |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p| (SPADCALL (QREFELT $ 55)) . #2=(|FLOAT;exp;2$;32|))
            (SPADCALL 5 (QREFELT $ 43)) (LETT |e1| (|spadConstant| $ 38) . #2#)
            (COND
             ((SPADCALL (LETT |n| (SPADCALL |x| (QREFELT $ 56)) . #2#) 0
                        (QREFELT $ 64))
              (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                   (LETT |e1|
                         (SPADCALL (SPADCALL (QREFELT $ 98)) |n|
                                   (QREFELT $ 91))
                         . #2#)
                   (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 47))
                   (EXIT (LETT |x| (SPADCALL |x| (QREFELT $ 54)) . #2#)))))
            (COND
             ((SPADCALL |x| (QREFELT $ 33))
              (SEQ (SPADCALL |p| (QREFELT $ 67))
                   (EXIT
                    (PROGN
                     (LETT #1# (SPADCALL |e1| (QREFELT $ 48)) . #2#)
                     (GO #1#))))))
            (LETT |k| (QUOTIENT2 (SPADCALL (- |p| 100) (QREFELT $ 58)) 3)
                  . #2#)
            (LETT |k| (MAX 0 (+ (+ 2 |k|) (SPADCALL |x| (QREFELT $ 59))))
                  . #2#)
            (COND
             ((SPADCALL |k| 0 (QREFELT $ 68))
              (SEQ (SPADCALL |k| (QREFELT $ 43))
                   (EXIT
                    (LETT |x| (SPADCALL |x| (- |k|) (QREFELT $ 63)) . #2#)))))
            (LETT |e| (|FLOAT;expSeries| |x| $) . #2#)
            (COND
             ((SPADCALL |k| 0 (QREFELT $ 68))
              (LETT |e| (|FLOAT;square| |e| |k| $) . #2#)))
            (SPADCALL |p| (QREFELT $ 67))
            (EXIT (SPADCALL |e| |e1| (QREFELT $ 61)))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;expSeries| (|x| $)
  (PROG (|t| |s| |i| |n| |d| |p|)
    (RETURN
     (SEQ
      (LETT |p|
            (+
             (+ (SPADCALL (QREFELT $ 55))
                (INTEGER-LENGTH (SPADCALL (QREFELT $ 55))))
             1)
            . #1=(|FLOAT;expSeries|))
      (LETT |s| (LETT |d| (ASH 1 |p|) . #1#) . #1#)
      (LETT |t|
            (LETT |n| (|FLOAT;shift2| (QCAR |x|) (+ (QCDR |x|) |p|) $) . #1#)
            . #1#)
      (SEQ (LETT |i| 2 . #1#) G190
           (COND ((NULL (SPADCALL |t| 0 (QREFELT $ 64))) (GO G191)))
           (SEQ (LETT |s| (+ |s| |t|) . #1#)
                (LETT |t| (QUOTIENT2 (* |n| |t|) |i|) . #1#)
                (EXIT (LETT |t| (QUOTIENT2 |t| |d|) . #1#)))
           (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (CONS |s| (- |p|)) (QREFELT $ 48))))))) 

(DEFUN |FLOAT;mat0| (|n0| |bl| |ki| $)
  (PROG (|i| |m22| |m21| |m12| |m11| |#G65| |#G64| |#G63| |#G62|)
    (RETURN
     (SEQ (LETT |m11| 1 . #1=(|FLOAT;mat0|)) (LETT |m12| 0 . #1#)
          (LETT |m21| 0 . #1#) (LETT |m22| 1 . #1#) (LETT |i| |n0| . #1#)
          (SEQ G190 (COND ((NULL (< (INTEGER-LENGTH |m11|) |bl|)) (GO G191)))
               (SEQ
                (PROGN
                 (LETT |#G62| |m21| . #1#)
                 (LETT |#G63| |m22| . #1#)
                 (LETT |#G64| (+ |m11| (* |i| |m21|)) . #1#)
                 (LETT |#G65| (+ |m12| (* |i| |m22|)) . #1#)
                 (LETT |m11| |#G62| . #1#)
                 (LETT |m12| |#G63| . #1#)
                 (LETT |m21| |#G64| . #1#)
                 (LETT |m22| |#G65| . #1#))
                (EXIT (LETT |i| (+ |i| |ki|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (CONS |i|
                 (SPADCALL (LIST (LIST |m11| |m12|) (LIST |m21| |m22|))
                           (QREFELT $ 101)))))))) 

(DEFUN |FLOAT;mat1| (|n0| |bl| |ki| $)
  (PROG (|r2| |bl1| |m1| |r1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |bl| 300 (QREFELT $ 102)) (|FLOAT;mat0| |n0| |bl| |ki| $))
       ('T
        (SEQ (LETT |bl1| (QUOTIENT2 |bl| 2) . #1=(|FLOAT;mat1|))
             (LETT |r1| (|FLOAT;mat1| |n0| |bl1| |ki| $) . #1#)
             (LETT |m1| (QCDR |r1|) . #1#)
             (LETT |bl1|
                   (- |bl|
                      (INTEGER-LENGTH (SPADCALL |m1| 1 1 (QREFELT $ 103))))
                   . #1#)
             (LETT |r2| (|FLOAT;mat1| (QCAR |r1|) |bl1| |ki| $) . #1#)
             (EXIT
              (CONS (QCAR |r2|)
                    (SPADCALL (QCDR |r2|) |m1| (QREFELT $ 104))))))))))) 

(DEFUN |FLOAT;expInverse| (|k| $)
  (PROG (|q1| |p1| |mm0| |l| |ki| |k0| |q0| |p0|)
    (RETURN
     (SEQ
      (LETT |p1| (+ (SPADCALL 2 |k| (QREFELT $ 60)) 1)
            . #1=(|FLOAT;expInverse|))
      (LETT |p0| 1 . #1#)
      (LETT |q1| (- (SPADCALL 2 |k| (QREFELT $ 60)) 1) . #1#)
      (LETT |q0| 1 . #1#) (LETT |k0| (SPADCALL 6 |k| (QREFELT $ 60)) . #1#)
      (LETT |ki| (SPADCALL 4 |k| (QREFELT $ 60)) . #1#)
      (LETT |l| (QUOTIENT2 (+ (SPADCALL (QREFELT $ 55)) 1) 2) . #1#)
      (LETT |mm0|
            (SPADCALL (LIST (LIST |p0| |q0|) (LIST |p1| |q1|)) (QREFELT $ 101))
            . #1#)
      (LETT |mm0|
            (SPADCALL (QCDR (|FLOAT;mat1| |k0| |l| |ki| $)) |mm0|
                      (QREFELT $ 104))
            . #1#)
      (LETT |p1| (SPADCALL |mm0| 2 1 (QREFELT $ 103)) . #1#)
      (LETT |q1| (SPADCALL |mm0| 2 2 (QREFELT $ 103)) . #1#)
      (EXIT (|FLOAT;dvide| (CONS |p1| 0) (CONS |q1| 0) $)))))) 

(DEFUN |FLOAT;exp1;$;37| ($)
  (SEQ
   (COND
    ((SPADCALL (SPADCALL (QREFELT $ 55)) (QCAR (QREFELT $ 105))
               (QREFELT $ 106))
     (SETELT $ 105 (CONS (SPADCALL (QREFELT $ 55)) (|FLOAT;expInverse| 1 $)))))
   (EXIT (SPADCALL (QCDR (QREFELT $ 105)) (QREFELT $ 48))))) 

(DEFUN |FLOAT;sqrt;2$;38| (|x| $)
  (PROG (|i| |p| |l| |e| |m|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 35)) (|error| "negative sqrt"))
            ('T
             (SEQ (LETT |m| (QCAR |x|) . #1=(|FLOAT;sqrt;2$;38|))
                  (LETT |e| (QCDR |x|) . #1#)
                  (LETT |l| (INTEGER-LENGTH |m|) . #1#)
                  (LETT |p| (+ (- (* 2 (SPADCALL (QREFELT $ 55))) |l|) 2)
                        . #1#)
                  (COND ((ODDP (- |e| |l|)) (LETT |p| (- |p| 1) . #1#)))
                  (LETT |i| (|FLOAT;shift2| (QCAR |x|) |p| $) . #1#)
                  (LETT |i| (SPADCALL |i| (QREFELT $ 58)) . #1#)
                  (EXIT
                   (SPADCALL (CONS |i| (QUOTIENT2 (- |e| |p|) 2))
                             (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;bits;Pi;39| ($) (SPADCALL (QREFELT $ 9) (QREFELT $ 107))) 

(DEFUN |FLOAT;bits;2Pi;40| (|n| $)
  (PROG (|t|)
    (RETURN
     (SEQ (LETT |t| (SPADCALL (QREFELT $ 55)) |FLOAT;bits;2Pi;40|)
          (SPADCALL (QREFELT $ 9) |n| (QREFELT $ 108)) (EXIT |t|))))) 

(DEFUN |FLOAT;precision;Pi;41| ($) (SPADCALL (QREFELT $ 55))) 

(DEFUN |FLOAT;precision;2Pi;42| (|n| $) (SPADCALL |n| (QREFELT $ 67))) 

(DEFUN |FLOAT;increasePrecision;IPi;43| (|n| $)
  (PROG (#1=#:G418 |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL (QREFELT $ 55))
            . #2=(|FLOAT;increasePrecision;IPi;43|))
      (SPADCALL
       (PROG1 (LETT #1# (+ |b| |n|) . #2#)
         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
       (QREFELT $ 67))
      (EXIT |b|))))) 

(DEFUN |FLOAT;decreasePrecision;IPi;44| (|n| $)
  (PROG (#1=#:G422 |b|)
    (RETURN
     (SEQ
      (LETT |b| (SPADCALL (QREFELT $ 55))
            . #2=(|FLOAT;decreasePrecision;IPi;44|))
      (SPADCALL
       (PROG1 (LETT #1# (- |b| |n|) . #2#)
         (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
       (QREFELT $ 67))
      (EXIT |b|))))) 

(DEFUN |FLOAT;ceillog10base2| (|n| $)
  (PROG (#1=#:G426)
    (RETURN
     (PROG1
         (LETT #1# (QUOTIENT2 (+ (* 13301 |n|) 4003) 4004)
               |FLOAT;ceillog10base2|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |FLOAT;digits;Pi;46| ($)
  (PROG (#1=#:G429)
    (RETURN
     (PROG1
         (LETT #1#
               (MAX 1
                    (QUOTIENT2
                     (SPADCALL 4004 (- (SPADCALL (QREFELT $ 55)) 1)
                               (QREFELT $ 60))
                     13301))
               |FLOAT;digits;Pi;46|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |FLOAT;digits;2Pi;47| (|n| $)
  (PROG (|t|)
    (RETURN
     (SEQ (LETT |t| (SPADCALL (QREFELT $ 111)) |FLOAT;digits;2Pi;47|)
          (SPADCALL (+ 1 (|FLOAT;ceillog10base2| |n| $)) (QREFELT $ 67))
          (EXIT |t|))))) 

(DEFUN |FLOAT;order;$I;48| (|a| $)
  (- (+ (INTEGER-LENGTH (QCAR |a|)) (QCDR |a|)) 1)) 

(DEFUN |FLOAT;relerror;2$I;49| (|a| |b| $)
  (SPADCALL (SPADCALL (SPADCALL |a| |b| (QREFELT $ 50)) |b| (QREFELT $ 45))
            (QREFELT $ 59))) 

(PUT '|FLOAT;Zero;$;50| '|SPADreplace| '(XLAM NIL (CONS 0 0))) 

(DEFUN |FLOAT;Zero;$;50| ($) (CONS 0 0)) 

(PUT '|FLOAT;One;$;51| '|SPADreplace| '(XLAM NIL (CONS 1 0))) 

(DEFUN |FLOAT;One;$;51| ($) (CONS 1 0)) 

(PUT '|FLOAT;base;Pi;52| '|SPADreplace| '(XLAM NIL 2)) 

(DEFUN |FLOAT;base;Pi;52| ($) 2) 

(PUT '|FLOAT;mantissa;$I;53| '|SPADreplace| 'QCAR) 

(DEFUN |FLOAT;mantissa;$I;53| (|x| $) (QCAR |x|)) 

(PUT '|FLOAT;exponent;$I;54| '|SPADreplace| 'QCDR) 

(DEFUN |FLOAT;exponent;$I;54| (|x| $) (QCDR |x|)) 

(DEFUN |FLOAT;one?;$B;55| (|a| $)
  (SPADCALL |a| (|spadConstant| $ 38) (QREFELT $ 39))) 

(DEFUN |FLOAT;zero?;$B;56| (|a| $) (ZEROP (QCAR |a|))) 

(DEFUN |FLOAT;negative?;$B;57| (|a| $) (MINUSP (QCAR |a|))) 

(DEFUN |FLOAT;positive?;$B;58| (|a| $) (SPADCALL (QCAR |a|) (QREFELT $ 116))) 

(DEFUN |FLOAT;chop| (|x| |p| $)
  (PROG (|e|)
    (RETURN
     (SEQ (LETT |e| (- (INTEGER-LENGTH (QCAR |x|)) |p|) . #1=(|FLOAT;chop|))
          (COND
           ((SPADCALL |e| 0 (QREFELT $ 68))
            (LETT |x|
                  (CONS (|FLOAT;shift2| (QCAR |x|) (- |e|) $)
                        (+ (QCDR |x|) |e|))
                  . #1#)))
          (EXIT |x|))))) 

(DEFUN |FLOAT;float;2I$;60| (|m| |e| $)
  (SPADCALL (CONS |m| |e|) (QREFELT $ 48))) 

(DEFUN |FLOAT;float;2IPi$;61| (|m| |e| |b| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (COND ((EQL |m| 0) (|spadConstant| $ 34))
            ('T
             (SEQ (SPADCALL 4 (QREFELT $ 43))
                  (LETT |r|
                        (SPADCALL |m|
                                  (SPADCALL (CONS |b| 0) |e| (QREFELT $ 91))
                                  (QREFELT $ 70))
                        |FLOAT;float;2IPi$;61|)
                  (SPADCALL 4 (QREFELT $ 47))
                  (EXIT (SPADCALL |r| (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;normalize;2$;62| (|x| $)
  (PROG (|y| |e| |m|)
    (RETURN
     (SEQ (LETT |m| (QCAR |x|) . #1=(|FLOAT;normalize;2$;62|))
          (EXIT
           (COND ((EQL |m| 0) (|spadConstant| $ 34))
                 (#2='T
                  (SEQ
                   (LETT |e| (- (INTEGER-LENGTH |m|) (SPADCALL (QREFELT $ 55)))
                         . #1#)
                   (COND
                    ((SPADCALL |e| 0 (QREFELT $ 68))
                     (SEQ (LETT |y| (|FLOAT;shift2| |m| (- 1 |e|) $) . #1#)
                          (COND
                           ((ODDP |y|)
                            (SEQ
                             (LETT |y|
                                   (QUOTIENT2
                                    (COND
                                     ((SPADCALL |y| 0 (QREFELT $ 68))
                                      (+ |y| 1))
                                     (#2# (- |y| 1)))
                                    2)
                                   . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL (INTEGER-LENGTH |y|)
                                          (SPADCALL (QREFELT $ 55))
                                          (QREFELT $ 106))
                                (SEQ (LETT |y| (QUOTIENT2 |y| 2) . #1#)
                                     (EXIT (LETT |e| (+ |e| 1) . #1#))))))))
                           (#2# (LETT |y| (QUOTIENT2 |y| 2) . #1#)))
                          (EXIT
                           (LETT |x| (CONS |y| (+ (QCDR |x|) |e|)) . #1#)))))
                   (EXIT |x|))))))))) 

(DEFUN |FLOAT;shift;$I$;63| (|x| |n| $) (CONS (QCAR |x|) (+ (QCDR |x|) |n|))) 

(DEFUN |FLOAT;=;2$B;64| (|x| |y| $)
  (COND ((EQL (QCDR |x|) (QCDR |y|)) (EQL (QCAR |x|) (QCAR |y|)))
        ((EQL (SPADCALL |x| (QREFELT $ 59)) (SPADCALL |y| (QREFELT $ 59)))
         (COND
          ((EQL (SPADCALL |x| (QREFELT $ 65)) (SPADCALL |y| (QREFELT $ 65)))
           (SPADCALL (SPADCALL |x| |y| (QREFELT $ 50)) (QREFELT $ 33)))
          (#1='T 'NIL)))
        (#1# 'NIL))) 

(DEFUN |FLOAT;<;2$B;65| (|x| |y| $)
  (SEQ
   (COND ((EQL (QCAR |y|) 0) (< (QCAR |x|) 0))
         ((EQL (QCAR |x|) 0) (SPADCALL (QCAR |y|) 0 (QREFELT $ 68)))
         (#1='T
          (SEQ
           (COND
            ((SPADCALL |x| (QREFELT $ 35))
             (COND ((SPADCALL |y| (QREFELT $ 117)) (EXIT 'T)))))
           (COND
            ((SPADCALL |y| (QREFELT $ 35))
             (COND ((SPADCALL |x| (QREFELT $ 117)) (EXIT 'NIL)))))
           (EXIT
            (COND
             ((< (SPADCALL |x| (QREFELT $ 59)) (SPADCALL |y| (QREFELT $ 59)))
              (SPADCALL |x| (QREFELT $ 117)))
             ((SPADCALL (SPADCALL |x| (QREFELT $ 59))
                        (SPADCALL |y| (QREFELT $ 59)) (QREFELT $ 68))
              (SPADCALL |x| (QREFELT $ 35)))
             (#1#
              (SPADCALL (SPADCALL |x| |y| (QREFELT $ 50))
                        (QREFELT $ 35)))))))))) 

(DEFUN |FLOAT;abs;2$;66| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 35)) (SPADCALL |x| (QREFELT $ 36)))
        ('T (SPADCALL |x| (QREFELT $ 48))))) 

(DEFUN |FLOAT;ceiling;2$;67| (|x| $)
  (PROG (#1=#:G480)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |x| (QREFELT $ 35))
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 120))
                  (QREFELT $ 36))
                 |FLOAT;ceiling;2$;67|)
           (GO #1#))))
        (EXIT
         (COND ((SPADCALL (SPADCALL |x| (QREFELT $ 54)) (QREFELT $ 33)) |x|)
               ('T
                (SPADCALL (SPADCALL |x| (QREFELT $ 121)) (|spadConstant| $ 38)
                          (QREFELT $ 62)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;wholePart;$I;68| (|x| $) (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $)) 

(DEFUN |FLOAT;floor;2$;69| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 35))
    (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (QREFELT $ 122))
              (QREFELT $ 36)))
   ('T (SPADCALL |x| (QREFELT $ 121))))) 

(DEFUN |FLOAT;round;2$;70| (|x| $)
  (PROG (|half|)
    (RETURN
     (SEQ
      (LETT |half| (CONS (SPADCALL |x| (QREFELT $ 65)) -1) |FLOAT;round;2$;70|)
      (EXIT (SPADCALL (SPADCALL |x| |half| (QREFELT $ 62)) (QREFELT $ 121))))))) 

(DEFUN |FLOAT;sign;$I;71| (|x| $) (COND ((< (QCAR |x|) 0) -1) ('T 1))) 

(DEFUN |FLOAT;truncate;2$;72| (|x| $)
  (PROG (#1=#:G492)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((>= (QCDR |x|) 0)
          (PROGN (LETT #1# |x| |FLOAT;truncate;2$;72|) (GO #1#))))
        (EXIT
         (SPADCALL (CONS (|FLOAT;shift2| (QCAR |x|) (QCDR |x|) $) 0)
                   (QREFELT $ 48)))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;recip;$U;73| (|x| $)
  (COND ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39)) (CONS 1 "failed"))
        ('T (CONS 0 (SPADCALL (|spadConstant| $ 38) |x| (QREFELT $ 45)))))) 

(DEFUN |FLOAT;differentiate;2$;74| (|x| $) (|spadConstant| $ 34)) 

(DEFUN |FLOAT;-;2$;75| (|x| $) (SPADCALL (|FLOAT;negate| |x| $) (QREFELT $ 48))) 

(DEFUN |FLOAT;negate| (|x| $) (CONS (- (QCAR |x|)) (QCDR |x|))) 

(DEFUN |FLOAT;+;3$;77| (|x| |y| $)
  (SPADCALL (|FLOAT;plus| |x| |y| $) (QREFELT $ 48))) 

(DEFUN |FLOAT;-;3$;78| (|x| |y| $)
  (SPADCALL (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $) (QREFELT $ 48))) 

(DEFUN |FLOAT;sub| (|x| |y| $) (|FLOAT;plus| |x| (|FLOAT;negate| |y| $) $)) 

(DEFUN |FLOAT;plus| (|x| |y| $)
  (PROG (|mw| |ey| |ex| |my| |mx| |#G124| |#G123| |#G122| |#G121| |de|)
    (RETURN
     (SEQ (LETT |mx| (QCAR |x|) . #1=(|FLOAT;plus|))
          (LETT |my| (QCAR |y|) . #1#)
          (EXIT
           (COND ((EQL |mx| 0) |y|) ((EQL |my| 0) |x|)
                 (#2='T
                  (SEQ (LETT |ex| (QCDR |x|) . #1#)
                       (LETT |ey| (QCDR |y|) . #1#)
                       (EXIT
                        (COND ((EQL |ex| |ey|) (CONS (+ |mx| |my|) |ex|))
                              (#2#
                               (SEQ
                                (LETT |de|
                                      (-
                                       (- (+ |ex| (INTEGER-LENGTH |mx|)) |ey|)
                                       (INTEGER-LENGTH |my|))
                                      . #1#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |de|
                                             (+ (SPADCALL (QREFELT $ 55)) 1)
                                             (QREFELT $ 68))
                                   |x|)
                                  ((< |de| (- (+ (SPADCALL (QREFELT $ 55)) 1)))
                                   |y|)
                                  (#2#
                                   (SEQ
                                    (COND
                                     ((< |ex| |ey|)
                                      (PROGN
                                       (LETT |#G121| |my| . #1#)
                                       (LETT |#G122| |mx| . #1#)
                                       (LETT |#G123| |ey| . #1#)
                                       (LETT |#G124| |ex| . #1#)
                                       (LETT |mx| |#G121| . #1#)
                                       (LETT |my| |#G122| . #1#)
                                       (LETT |ex| |#G123| . #1#)
                                       (LETT |ey| |#G124| . #1#))))
                                    (LETT |mw|
                                          (+ |my|
                                             (|FLOAT;shift2| |mx| (- |ex| |ey|)
                                              $))
                                          . #1#)
                                    (EXIT (CONS |mw| |ey|)))))))))))))))))) 

(DEFUN |FLOAT;*;3$;81| (|x| |y| $)
  (SPADCALL (|FLOAT;times| |x| |y| $) (QREFELT $ 48))) 

(DEFUN |FLOAT;*;I2$;82| (|x| |y| $)
  (COND
   ((SPADCALL (INTEGER-LENGTH |x|) (SPADCALL (QREFELT $ 55)) (QREFELT $ 106))
    (SPADCALL (SPADCALL (CONS |x| 0) (QREFELT $ 48)) |y| (QREFELT $ 61)))
   ('T (SPADCALL (CONS (* |x| (QCAR |y|)) (QCDR |y|)) (QREFELT $ 48))))) 

(DEFUN |FLOAT;/;3$;83| (|x| |y| $)
  (SPADCALL (|FLOAT;dvide| |x| |y| $) (QREFELT $ 48))) 

(DEFUN |FLOAT;/;$I$;84| (|x| |y| $)
  (COND
   ((SPADCALL (INTEGER-LENGTH |y|) (SPADCALL (QREFELT $ 55)) (QREFELT $ 106))
    (SPADCALL |x| (SPADCALL (CONS |y| 0) (QREFELT $ 48)) (QREFELT $ 45)))
   ('T (SPADCALL |x| (CONS |y| 0) (QREFELT $ 45))))) 

(DEFUN |FLOAT;inv;2$;85| (|x| $)
  (SPADCALL (|spadConstant| $ 38) |x| (QREFELT $ 45))) 

(DEFUN |FLOAT;times| (|x| |y| $)
  (CONS (* (QCAR |x|) (QCAR |y|)) (+ (QCDR |x|) (QCDR |y|)))) 

(DEFUN |FLOAT;itimes| (|n| |y| $) (CONS (* |n| (QCAR |y|)) (QCDR |y|))) 

(DEFUN |FLOAT;dvide| (|x| |y| $)
  (PROG (|ew| |mw|)
    (RETURN
     (SEQ
      (LETT |ew|
            (+
             (+ (- (INTEGER-LENGTH (QCAR |y|)) (INTEGER-LENGTH (QCAR |x|)))
                (SPADCALL (QREFELT $ 55)))
             1)
            . #1=(|FLOAT;dvide|))
      (LETT |mw| (QUOTIENT2 (|FLOAT;shift2| (QCAR |x|) |ew| $) (QCAR |y|))
            . #1#)
      (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|) . #1#)
      (EXIT (CONS |mw| |ew|)))))) 

(DEFUN |FLOAT;square| (|x| |n| $)
  (PROG (|ex| |ma| |l| |k|)
    (RETURN
     (SEQ (LETT |ma| (QCAR |x|) . #1=(|FLOAT;square|))
          (LETT |ex| (QCDR |x|) . #1#)
          (SEQ (LETT |k| 1 . #1#) G190
               (COND ((|greater_SI| |k| |n|) (GO G191)))
               (SEQ (LETT |ma| (* |ma| |ma|) . #1#)
                    (LETT |ex| (+ |ex| |ex|) . #1#)
                    (LETT |l|
                          (- (SPADCALL (QREFELT $ 55)) (INTEGER-LENGTH |ma|))
                          . #1#)
                    (LETT |ma| (|FLOAT;shift2| |ma| |l| $) . #1#)
                    (EXIT (LETT |ex| (- |ex| |l|) . #1#)))
               (LETT |k| (|inc_SI| |k|) . #1#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |ma| |ex|)))))) 

(DEFUN |FLOAT;power| (|x| |n| $)
  (PROG (|z| #1=#:G536 |y|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |y| (|spadConstant| $ 38) . #2=(|FLOAT;power|))
            (LETT |z| |x| . #2#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (COND
                    ((ODDP |n|)
                     (LETT |y|
                           (|FLOAT;chop| (|FLOAT;times| |y| |z| $)
                            (SPADCALL (QREFELT $ 55)) $)
                           . #2#)))
                   (SEQ (LETT |n| (QUOTIENT2 |n| 2) . #2#)
                        (EXIT
                         (COND
                          ((EQL |n| 0)
                           (PROGN (LETT #1# |y| . #2#) (GO #1#))))))
                   (EXIT
                    (LETT |z|
                          (|FLOAT;chop| (|FLOAT;times| |z| |z| $)
                           (SPADCALL (QREFELT $ 55)) $)
                          . #2#)))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;^;3$;91| (|x| |y| $)
  (PROG (|r| |p|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
        (COND
         ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 39))
          (|error| "0^0 is undefined"))
         ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 51))
          (|error| "division by 0"))
         ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 42))
          (|spadConstant| $ 34))))
       ((SPADCALL |y| (|spadConstant| $ 34) (QREFELT $ 39))
        (|spadConstant| $ 38))
       ((SPADCALL |y| (|spadConstant| $ 38) (QREFELT $ 39)) |x|)
       ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
        (|spadConstant| $ 38))
       ('T
        (SEQ
         (LETT |p| (+ (ABS (SPADCALL |y| (QREFELT $ 59))) 5)
               . #1=(|FLOAT;^;3$;91|))
         (SPADCALL |p| (QREFELT $ 43))
         (LETT |r|
               (SPADCALL
                (SPADCALL |y| (SPADCALL |x| (QREFELT $ 86)) (QREFELT $ 61))
                (QREFELT $ 82))
               . #1#)
         (SPADCALL |p| (QREFELT $ 47))
         (EXIT (SPADCALL |r| (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;^;$F$;92| (|x| |r| $)
  (PROG (|y| #1=#:G546 |d| |n|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
         (COND
          ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 131))
           (|error| "0^0 is undefined"))
          ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 132))
           (|error| "division by 0"))
          ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 133))
           (|spadConstant| $ 34))))
        ((SPADCALL |r| (|spadConstant| $ 130) (QREFELT $ 131))
         (|spadConstant| $ 38))
        ((SPADCALL |r| (|spadConstant| $ 134) (QREFELT $ 131)) |x|)
        ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
         (|spadConstant| $ 38))
        (#2='T
         (SEQ (LETT |n| (SPADCALL |r| (QREFELT $ 135)) . #3=(|FLOAT;^;$F$;92|))
              (LETT |d| (SPADCALL |r| (QREFELT $ 136)) . #3#)
              (EXIT
               (COND
                ((SPADCALL |x| (QREFELT $ 35))
                 (COND
                  ((ODDP |d|)
                   (COND
                    ((ODDP |n|)
                     (PROGN
                      (LETT #1#
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT $ 36)) |r|
                                       (QREFELT $ 137))
                             (QREFELT $ 36))
                            . #3#)
                      (GO #1#)))
                    (#2#
                     (PROGN
                      (LETT #1#
                            (SPADCALL (SPADCALL |x| (QREFELT $ 36)) |r|
                                      (QREFELT $ 137))
                            . #3#)
                      (GO #1#)))))
                  (#2# (|error| "negative root"))))
                (#2#
                 (SEQ
                  (COND
                   ((EQL |d| 2)
                    (SEQ (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 43))
                         (LETT |y| (SPADCALL |x| (QREFELT $ 44)) . #3#)
                         (LETT |y| (SPADCALL |y| |n| (QREFELT $ 91)) . #3#)
                         (SPADCALL (INTEGER-LENGTH |n|) (QREFELT $ 47))
                         (EXIT
                          (PROGN
                           (LETT #1# (SPADCALL |y| (QREFELT $ 48)) . #3#)
                           (GO #1#))))))
                  (LETT |y| (SPADCALL (CONS |n| 0) (CONS |d| 0) (QREFELT $ 45))
                        . #3#)
                  (EXIT (SPADCALL |x| |y| (QREFELT $ 128)))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;^;$I$;93| (|x| |n| $)
  (PROG (|y| |p|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
        (COND ((EQL |n| 0) (|error| "0^0 is undefined"))
              ((< |n| 0) (|error| "division by 0"))
              ((SPADCALL |n| 0 (QREFELT $ 68)) (|spadConstant| $ 34))))
       ((EQL |n| 0) (|spadConstant| $ 38)) ((EQL |n| 1) |x|)
       ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
        (|spadConstant| $ 38))
       ('T
        (SEQ (LETT |p| (SPADCALL (QREFELT $ 55)) . #1=(|FLOAT;^;$I$;93|))
             (SPADCALL (+ (+ |p| (INTEGER-LENGTH |n|)) 2) (QREFELT $ 67))
             (LETT |y| (|FLOAT;power| |x| (ABS |n|) $) . #1#)
             (COND
              ((< |n| 0)
               (LETT |y| (|FLOAT;dvide| (|spadConstant| $ 38) |y| $) . #1#)))
             (SPADCALL |p| (QREFELT $ 67))
             (EXIT (SPADCALL |y| (QREFELT $ 48)))))))))) 

(DEFUN |FLOAT;convert10| (|x| |d| $)
  (PROG (|h| |r| #1=#:G552 |b| |q| |#G154| |e| |m|)
    (RETURN
     (SEQ (LETT |m| (QCAR |x|) . #2=(|FLOAT;convert10|))
          (LETT |e| (QCDR |x|) . #2#)
          (LETT |b| (SPADCALL (QREFELT $ 55)) . #2#)
          (PROGN
           (LETT |#G154| (DIVIDE2 (ABS |e|) |b|) . #2#)
           (LETT |q| (QCAR |#G154|) . #2#)
           (LETT |r| (QCDR |#G154|) . #2#)
           |#G154|)
          (LETT |b| (EXPT 2 |b|) . #2#)
          (LETT |r|
                (EXPT 2
                      (PROG1 (LETT #1# |r| . #2#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#)))
                . #2#)
          (LETT |h| (|FLOAT;power10| (CONS |b| 0) |q| (+ |d| 5) $) . #2#)
          (LETT |h|
                (|FLOAT;chop10| (CONS (* |r| (QCAR |h|)) (QCDR |h|)) (+ |d| 5)
                 $)
                . #2#)
          (EXIT
           (COND
            ((< |e| 0)
             (LETT |h| (|FLOAT;quotient10| (CONS |m| 0) |h| |d| $) . #2#))
            ('T (|FLOAT;times10| (CONS |m| 0) |h| |d| $)))))))) 

(DEFUN |FLOAT;ceilLength10| (|n| $)
  (+ (QUOTIENT2 (* 146 (INTEGER-LENGTH |n|)) 485) 1)) 

(DEFUN |FLOAT;floorLength10| (|n| $)
  (QUOTIENT2 (* 643 (INTEGER-LENGTH |n|)) 2136)) 

(DEFUN |FLOAT;length10| (|n| $)
  (PROG (|lower| #1=#:G559 |upper| |ln|)
    (RETURN
     (SEQ
      (LETT |ln| (INTEGER-LENGTH (LETT |n| (ABS |n|) . #2=(|FLOAT;length10|)))
            . #2#)
      (LETT |upper| (QUOTIENT2 (* 76573 |ln|) 254370) . #2#)
      (LETT |lower|
            (QUOTIENT2 (SPADCALL 21306 (- |ln| 1) (QREFELT $ 60)) 70777) . #2#)
      (EXIT
       (COND ((EQL |upper| |lower|) (+ |upper| 1))
             ('T
              (SEQ
               (LETT |n|
                     (QUOTIENT2 |n|
                                (EXPT 10
                                      (PROG1 (LETT #1# |lower| . #2#)
                                        (|check_subtype| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         #1#))))
                     . #2#)
               (SEQ G190 (COND ((NULL (>= |n| 10)) (GO G191)))
                    (SEQ (LETT |n| (QUOTIENT2 |n| 10) . #2#)
                         (EXIT (LETT |lower| (+ |lower| 1) . #2#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT (+ |lower| 1)))))))))) 

(DEFUN |FLOAT;chop10| (|x| |p| $)
  (PROG (#1=#:G566 |e|)
    (RETURN
     (SEQ
      (LETT |e| (- (|FLOAT;floorLength10| (QCAR |x|) $) |p|)
            . #2=(|FLOAT;chop10|))
      (COND
       ((SPADCALL |e| 0 (QREFELT $ 68))
        (LETT |x|
              (CONS
               (QUOTIENT2 (QCAR |x|)
                          (EXPT 10
                                (PROG1 (LETT #1# |e| . #2#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))))
               (+ (QCDR |x|) |e|))
              . #2#)))
      (EXIT |x|))))) 

(DEFUN |FLOAT;normalize10| (|x| |p| $)
  (PROG (|ex| |ma| #1=#:G574 |r| |#G164| #2=#:G570 |e|)
    (RETURN
     (SEQ (LETT |ma| (QCAR |x|) . #3=(|FLOAT;normalize10|))
          (LETT |ex| (QCDR |x|) . #3#)
          (LETT |e| (- (|FLOAT;length10| |ma| $) |p|) . #3#)
          (COND
           ((SPADCALL |e| 0 (QREFELT $ 68))
            (SEQ
             (LETT |ma|
                   (QUOTIENT2 |ma|
                              (EXPT 10
                                    (PROG1 (LETT #2# (- |e| 1) . #3#)
                                      (|check_subtype| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))))
                   . #3#)
             (LETT |ex| (+ |ex| |e|) . #3#)
             (PROGN
              (LETT |#G164| (DIVIDE2 |ma| 10) . #3#)
              (LETT |ma| (QCAR |#G164|) . #3#)
              (LETT |r| (QCDR |#G164|) . #3#)
              |#G164|)
             (EXIT
              (COND
               ((SPADCALL |r| 4 (QREFELT $ 68))
                (SEQ (LETT |ma| (+ |ma| 1) . #3#)
                     (EXIT
                      (COND
                       ((EQL |ma|
                             (EXPT 10
                                   (PROG1 (LETT #1# |p| . #3#)
                                     (|check_subtype| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      #1#))))
                        (SEQ (LETT |ma| 1 . #3#)
                             (EXIT (LETT |ex| (+ |ex| |p|) . #3#)))))))))))))
          (EXIT (CONS |ma| |ex|)))))) 

(DEFUN |FLOAT;times10| (|x| |y| |p| $)
  (|FLOAT;normalize10| (|FLOAT;times| |x| |y| $) |p| $)) 

(DEFUN |FLOAT;quotient10| (|x| |y| |p| $)
  (PROG (|ew| |mw| #1=#:G601)
    (RETURN
     (SEQ
      (LETT |ew|
            (+
             (+
              (- (|FLOAT;floorLength10| (QCAR |y|) $)
                 (|FLOAT;ceilLength10| (QCAR |x|) $))
              |p|)
             2)
            . #2=(|FLOAT;quotient10|))
      (COND ((< |ew| 0) (LETT |ew| 0 . #2#)))
      (LETT |mw|
            (QUOTIENT2
             (* (QCAR |x|)
                (EXPT 10
                      (PROG1 (LETT #1# |ew| . #2#)
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))))
             (QCAR |y|))
            . #2#)
      (LETT |ew| (- (- (QCDR |x|) (QCDR |y|)) |ew|) . #2#)
      (EXIT (|FLOAT;normalize10| (CONS |mw| |ew|) |p| $)))))) 

(DEFUN |FLOAT;power10| (|x| |n| |d| $)
  (PROG (|z| #1=#:G609 |e| |y| |p|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |x| (|spadConstant| $ 34) (QREFELT $ 39))
         (|spadConstant| $ 34))
        ((EQL |n| 0) (|spadConstant| $ 38)) ((EQL |n| 1) |x|)
        ((SPADCALL |x| (|spadConstant| $ 38) (QREFELT $ 39))
         (|spadConstant| $ 38))
        ('T
         (SEQ
          (LETT |p| (+ (+ |d| (INTEGER-LENGTH |n|)) 1) . #2=(|FLOAT;power10|))
          (LETT |e| |n| . #2#) (LETT |y| (|spadConstant| $ 38) . #2#)
          (LETT |z| |x| . #2#)
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (COND
                  ((ODDP |e|)
                   (LETT |y| (|FLOAT;chop10| (|FLOAT;times| |y| |z| $) |p| $)
                         . #2#)))
                 (SEQ (LETT |e| (QUOTIENT2 |e| 2) . #2#)
                      (EXIT
                       (COND
                        ((EQL |e| 0) (PROGN (LETT #1# |y| . #2#) (GO #1#))))))
                 (EXIT
                  (LETT |z| (|FLOAT;chop10| (|FLOAT;times| |z| |z| $) |p| $)
                        . #2#)))
                NIL (GO G190) G191 (EXIT NIL)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FLOAT;padFromLeft| (|s| $)
  (PROG (|j| |i| |t| #1=#:G611 |n|)
    (RETURN
     (SEQ
      (COND ((ZEROP (SPADCALL (QREFELT $ 140) (QREFELT $ 147))) |s|)
            ('T
             (SEQ (LETT |n| (- (QCSIZE |s|) 1) . #2=(|FLOAT;padFromLeft|))
                  (LETT |t|
                        (|make_full_CVEC|
                         (PROG1
                             (LETT #1#
                                   (+ (+ |n| 1)
                                      (QUOTIENT2 |n|
                                                 (SPADCALL (QREFELT $ 140)
                                                           (QREFELT $ 147))))
                                   . #2#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (STR_ELT "   " 0))
                        . #2#)
                  (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 148)) . #2#)
                       (LETT |i| 0 . #2#) G190
                       (COND ((|greater_SI| |i| |n|) (GO G191)))
                       (SEQ
                        (SPADCALL |t| |j|
                                  (SPADCALL |s|
                                            (+ |i|
                                               (SPADCALL |s| (QREFELT $ 148)))
                                            (QREFELT $ 150))
                                  (QREFELT $ 151))
                        (EXIT
                         (COND
                          ((EQL
                            (REM (+ |i| 1)
                                 (SPADCALL (QREFELT $ 140) (QREFELT $ 147)))
                            0)
                           (LETT |j| (+ |j| 1) . #2#)))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1) . #2#))
                             . #2#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |t|)))))))) 

(DEFUN |FLOAT;padFromRight| (|s| $)
  (PROG (|j| |i| |t| #1=#:G618 |n|)
    (RETURN
     (SEQ
      (COND ((EQL (SPADCALL (QREFELT $ 140) (QREFELT $ 147)) 0) |s|)
            ('T
             (SEQ (LETT |n| (- (QCSIZE |s|) 1) . #2=(|FLOAT;padFromRight|))
                  (LETT |t|
                        (|make_full_CVEC|
                         (PROG1
                             (LETT #1#
                                   (+ (+ |n| 1)
                                      (QUOTIENT2 |n|
                                                 (SPADCALL (QREFELT $ 140)
                                                           (QREFELT $ 147))))
                                   . #2#)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (STR_ELT "   " 0))
                        . #2#)
                  (SEQ (LETT |j| (SPADCALL |t| (QREFELT $ 152)) . #2#)
                       (LETT |i| |n| . #2#) G190 (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (SPADCALL |t| |j|
                                  (SPADCALL |s|
                                            (+ |i|
                                               (SPADCALL |s| (QREFELT $ 148)))
                                            (QREFELT $ 150))
                                  (QREFELT $ 151))
                        (EXIT
                         (COND
                          ((EQL
                            (REM (+ (- |n| |i|) 1)
                                 (SPADCALL (QREFELT $ 140) (QREFELT $ 147)))
                            0)
                           (LETT |j| (- |j| 1) . #2#)))))
                       (LETT |i| (PROG1 (+ |i| -1) (LETT |j| (+ |j| -1) . #2#))
                             . #2#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |t|)))))))) 

(DEFUN |FLOAT;fixed| (|f| $)
  (PROG (|t| #1=#:G643 |n| |s| #2=#:G639 #3=#:G637 |p| |o| |e| |m| |g| |l| |dd|
         |bl| #4=#:G629 #5=#:G626 |d|)
    (RETURN
     (SEQ
      (LETT |d|
            (COND
             ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
              (SPADCALL (QREFELT $ 111)))
             (#6='T (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
            . #7=(|FLOAT;fixed|))
      (EXIT
       (COND
        ((SPADCALL |f| (QREFELT $ 33))
         (COND ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1) "0.0")
               (#6#
                (STRCONC "0"
                         (STRCONC "."
                                  (|FLOAT;padFromLeft|
                                   (|make_full_CVEC|
                                    (PROG1 (LETT #5# |d| . #7#)
                                      (|check_subtype| (>= #5# 0)
                                                       '(|NonNegativeInteger|)
                                                       #5#))
                                    (|STR_to_CHAR| #8="0"))
                                   $))))))
        ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
         (STRCONC
          (|FLOAT;padFromRight| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17))) $)
          (STRCONC "."
                   (|FLOAT;padFromLeft|
                    (|make_full_CVEC|
                     (PROG1 (LETT #4# |d| . #7#)
                       (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                        #4#))
                     (|STR_to_CHAR| #8#))
                    $))))
        ((SPADCALL |f| (QREFELT $ 35))
         (STRCONC "-" (|FLOAT;fixed| (SPADCALL |f| (QREFELT $ 52)) $)))
        (#6#
         (SEQ (LETT |bl| (+ (INTEGER-LENGTH (QCAR |f|)) (QCDR |f|)) . #7#)
              (LETT |dd|
                    (COND
                     ((OR (EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                          (NULL (SPADCALL |bl| 0 (QREFELT $ 68))))
                      |d|)
                     ('T
                      (+
                       (+ (QUOTIENT2 (SPADCALL 146 |bl| (QREFELT $ 60)) 485) 1)
                       |d|)))
                    . #7#)
              (LETT |g|
                    (|FLOAT;convert10| (SPADCALL |f| (QREFELT $ 52)) |dd| $)
                    . #7#)
              (LETT |m| (QCAR |g|) . #7#) (LETT |e| (QCDR |g|) . #7#)
              (COND
               ((SPADCALL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1
                          (QREFELT $ 64))
                (SEQ (LETT |l| (|FLOAT;length10| |m| $) . #7#)
                     (EXIT
                      (COND
                       ((SPADCALL (- |e|)
                                  (SPADCALL (QREFELT $ 146) (QREFELT $ 153))
                                  (QREFELT $ 68))
                        (COND
                         ((< (- |e|)
                             (SPADCALL 2 (SPADCALL (QREFELT $ 111))
                                       (QREFELT $ 60)))
                          (SEQ
                           (LETT |g|
                                 (|FLOAT;normalize10| |g|
                                  (+ (+ |l| |e|)
                                     (SPADCALL (QREFELT $ 146)
                                               (QREFELT $ 153)))
                                  $)
                                 . #7#)
                           (LETT |m| (QCAR |g|) . #7#)
                           (EXIT (LETT |e| (QCDR |g|) . #7#)))))))))))
              (LETT |s| (STRINGIMAGE |m|) . #7#) (LETT |n| (QCSIZE |s|) . #7#)
              (LETT |o| (+ |e| |n|) . #7#)
              (LETT |p|
                    (COND
                     ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1) |n|)
                     (#6# (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                    . #7#)
              (COND
               ((>= |e| 0)
                (SEQ
                 (LETT |s|
                       (STRCONC |s|
                                (|make_full_CVEC|
                                 (PROG1 (LETT #3# |e| . #7#)
                                   (|check_subtype| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                 (|STR_to_CHAR| #8#)))
                       . #7#)
                 (EXIT (LETT |t| "" . #7#))))
               ((SPADCALL |o| 0 (QREFELT $ 102))
                (SEQ
                 (LETT |t|
                       (STRCONC
                        (|make_full_CVEC|
                         (PROG1 (LETT #2# (- |o|) . #7#)
                           (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                            #2#))
                         (|STR_to_CHAR| #8#))
                        |s|)
                       . #7#)
                 (EXIT (LETT |s| "0" . #7#))))
               (#6#
                (SEQ
                 (LETT |t|
                       (SPADCALL |s|
                                 (SPADCALL
                                  (+ |o| (SPADCALL |s| (QREFELT $ 148)))
                                  (- (+ |n| (SPADCALL |s| (QREFELT $ 148))) 1)
                                  (QREFELT $ 155))
                                 (QREFELT $ 156))
                       . #7#)
                 (EXIT
                  (LETT |s|
                        (SPADCALL |s|
                                  (SPADCALL (SPADCALL |s| (QREFELT $ 148))
                                            (-
                                             (+ |o|
                                                (SPADCALL |s| (QREFELT $ 148)))
                                             1)
                                            (QREFELT $ 155))
                                  (QREFELT $ 156))
                        . #7#)))))
              (LETT |n| (QCSIZE |t|) . #7#)
              (COND
               ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                (SEQ
                 (LETT |t| (SPADCALL |t| (|STR_to_CHAR| #8#) (QREFELT $ 157))
                       . #7#)
                 (EXIT (COND ((EQUAL |t| "") (LETT |t| "0" . #7#))))))
               ((SPADCALL |n| |p| (QREFELT $ 68))
                (LETT |t|
                      (SPADCALL |t|
                                (SPADCALL (SPADCALL |t| (QREFELT $ 148))
                                          (-
                                           (+ |p|
                                              (SPADCALL |t| (QREFELT $ 148)))
                                           1)
                                          (QREFELT $ 155))
                                (QREFELT $ 156))
                      . #7#))
               (#6#
                (LETT |t|
                      (STRCONC |t|
                               (|make_full_CVEC|
                                (PROG1 (LETT #1# (- |p| |n|) . #7#)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (|STR_to_CHAR| #8#)))
                      . #7#)))
              (EXIT
               (STRCONC (|FLOAT;padFromRight| |s| $)
                        (STRCONC "." (|FLOAT;padFromLeft| |t| $)))))))))))) 

(DEFUN |FLOAT;floating| (|f| $)
  (PROG (|s| |o| |n| |e| |m| |g| |d| |t|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 33)) "0.0")
            ((SPADCALL |f| (QREFELT $ 35))
             (STRCONC "-" (|FLOAT;floating| (SPADCALL |f| (QREFELT $ 52)) $)))
            (#1='T
             (SEQ
              (LETT |t|
                    (COND
                     ((ZEROP (SPADCALL (QREFELT $ 140) (QREFELT $ 147))) "E")
                     (#1# " E "))
                    . #2=(|FLOAT;floating|))
              (EXIT
               (COND
                ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                 (SEQ
                  (LETT |s| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17))) . #2#)
                  (EXIT
                   (SPADCALL
                    (LIST "0." (|FLOAT;padFromLeft| |s| $) |t|
                          (STRINGIMAGE (QCSIZE |s|)))
                    (QREFELT $ 159)))))
                (#1#
                 (SEQ
                  (LETT |d|
                        (COND
                         ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                          (SPADCALL (QREFELT $ 111)))
                         (#1# (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                        . #2#)
                  (LETT |g| (|FLOAT;convert10| |f| |d| $) . #2#)
                  (LETT |m| (QCAR |g|) . #2#) (LETT |e| (QCDR |g|) . #2#)
                  (LETT |s| (STRINGIMAGE |m|) . #2#)
                  (LETT |n| (QCSIZE |s|) . #2#) (LETT |o| (+ |e| |n|) . #2#)
                  (LETT |s| (|FLOAT;padFromLeft| |s| $) . #2#)
                  (EXIT
                   (SPADCALL (LIST "0." |s| |t| (STRINGIMAGE |o|))
                             (QREFELT $ 159)))))))))))))) 

(DEFUN |FLOAT;general| (|f| $)
  (PROG (|s| |t| #1=#:G675 #2=#:G668 #3=#:G666 |o| |n| |e| |m| |g| #4=#:G665
         |d|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (QREFELT $ 33)) "0.0")
            ((SPADCALL |f| (QREFELT $ 35))
             (STRCONC "-" (|FLOAT;general| (SPADCALL |f| (QREFELT $ 52)) $)))
            (#5='T
             (SEQ
              (LETT |d|
                    (COND
                     ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
                      (SPADCALL (QREFELT $ 111)))
                     (#5# (SPADCALL (QREFELT $ 146) (QREFELT $ 153))))
                    . #6=(|FLOAT;general|))
              (EXIT
               (COND
                ((ZEROP (SPADCALL |f| (QREFELT $ 19)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |d| (+ |d| 1) . #6#)
                        (LETT |s| (STRINGIMAGE (SPADCALL |f| (QREFELT $ 17)))
                              . #6#)
                        (COND
                         ((SPADCALL (SPADCALL (QREFELT $ 146) (QREFELT $ 153))
                                    -1 (QREFELT $ 64))
                          (SEQ (LETT |e| (QCSIZE |s|) . #6#)
                               (EXIT
                                (COND
                                 ((SPADCALL |e| |d| (QREFELT $ 68))
                                  (PROGN
                                   (LETT #4#
                                         (SEQ
                                          (LETT |t|
                                                (COND
                                                 ((ZEROP
                                                   (SPADCALL (QREFELT $ 140)
                                                             (QREFELT $ 147)))
                                                  "E")
                                                 (#5# " E "))
                                                . #6#)
                                          (EXIT
                                           (SPADCALL
                                            (LIST "0."
                                                  (|FLOAT;padFromLeft| |s| $)
                                                  |t| (STRINGIMAGE |e|))
                                            (QREFELT $ 159))))
                                         . #6#)
                                   (GO #4#))))))))
                        (EXIT (|FLOAT;padFromRight| (STRCONC |s| ".0") $))))
                  #4# (EXIT #4#)))
                (#5#
                 (SEQ (LETT |g| (|FLOAT;convert10| |f| |d| $) . #6#)
                      (LETT |m| (QCAR |g|) . #6#) (LETT |e| (QCDR |g|) . #6#)
                      (LETT |s| (STRINGIMAGE |m|) . #6#)
                      (LETT |n| (QCSIZE |s|) . #6#)
                      (LETT |o| (+ |n| |e|) . #6#)
                      (EXIT
                       (COND
                        ((SPADCALL |o| 0 (QREFELT $ 68))
                         (COND
                          ((SPADCALL |o| (MAX |n| |d|) (QREFELT $ 102))
                           (SEQ
                            (COND
                             ((SPADCALL |o| |n| (QREFELT $ 68))
                              (LETT |s|
                                    (STRCONC |s|
                                             (|make_full_CVEC|
                                              (PROG1
                                                  (LETT #3# (- |o| |n|) . #6#)
                                                (|check_subtype| (>= #3# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 #3#))
                                              (|STR_to_CHAR| #7="0")))
                                    . #6#)))
                            (LETT |t|
                                  (SPADCALL
                                   (SPADCALL |s|
                                             (SPADCALL
                                              (+ |o|
                                                 (SPADCALL |s|
                                                           (QREFELT $ 148)))
                                              (-
                                               (+ |n|
                                                  (SPADCALL |s|
                                                            (QREFELT $ 148)))
                                               1)
                                              (QREFELT $ 155))
                                             (QREFELT $ 156))
                                   (|STR_to_CHAR| #7#) (QREFELT $ 157))
                                  . #6#)
                            (COND ((EQUAL |t| "") (LETT |t| "0" . #6#))
                                  (#5#
                                   (LETT |t| (|FLOAT;padFromLeft| |t| $)
                                         . #6#)))
                            (LETT |s|
                                  (|FLOAT;padFromRight|
                                   (SPADCALL |s|
                                             (SPADCALL
                                              (SPADCALL |s| (QREFELT $ 148))
                                              (-
                                               (+ |o|
                                                  (SPADCALL |s|
                                                            (QREFELT $ 148)))
                                               1)
                                              (QREFELT $ 155))
                                             (QREFELT $ 156))
                                   $)
                                  . #6#)
                            (EXIT (STRCONC |s| (STRCONC "." |t|)))))
                          ((SPADCALL |o| 0 (QREFELT $ 102))
                           (COND
                            ((>= |o| -5)
                             (STRCONC #8="0."
                                      (|FLOAT;padFromLeft|
                                       (STRCONC
                                        (|make_full_CVEC|
                                         (PROG1 (LETT #2# (- |o|) . #6#)
                                           (|check_subtype| (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                         (|STR_to_CHAR| #7#))
                                        (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                  (QREFELT $ 157)))
                                       $)))
                            (#5#
                             (SEQ
                              (LETT |t|
                                    (|FLOAT;padFromLeft|
                                     (SPADCALL |s| (|STR_to_CHAR| #7#)
                                               (QREFELT $ 157))
                                     $)
                                    . #6#)
                              (LETT |s|
                                    (COND
                                     ((ZEROP
                                       (SPADCALL (QREFELT $ 140)
                                                 (QREFELT $ 147)))
                                      #9="E")
                                     (#5# #10=" E "))
                                    . #6#)
                              (EXIT
                               (SPADCALL
                                (LIST #11="0." |t| |s|
                                      (STRINGIMAGE (+ |e| |n|)))
                                (QREFELT $ 159)))))))
                          (#5#
                           (SEQ
                            (LETT |t|
                                  (|FLOAT;padFromLeft|
                                   (SPADCALL |s| (|STR_to_CHAR| #7#)
                                             (QREFELT $ 157))
                                   $)
                                  . #6#)
                            (LETT |s|
                                  (COND
                                   ((ZEROP
                                     (SPADCALL (QREFELT $ 140)
                                               (QREFELT $ 147)))
                                    #9#)
                                   (#5# #10#))
                                  . #6#)
                            (EXIT
                             (SPADCALL
                              (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                              (QREFELT $ 159)))))))
                        ((SPADCALL |o| 0 (QREFELT $ 102))
                         (COND
                          ((>= |o| -5)
                           (STRCONC #8#
                                    (|FLOAT;padFromLeft|
                                     (STRCONC
                                      (|make_full_CVEC|
                                       (PROG1 (LETT #1# (- |o|) . #6#)
                                         (|check_subtype| (>= #1# 0)
                                                          '(|NonNegativeInteger|)
                                                          #1#))
                                       (|STR_to_CHAR| #7#))
                                      (SPADCALL |s| (|STR_to_CHAR| #7#)
                                                (QREFELT $ 157)))
                                     $)))
                          (#5#
                           (SEQ
                            (LETT |t|
                                  (|FLOAT;padFromLeft|
                                   (SPADCALL |s| (|STR_to_CHAR| #7#)
                                             (QREFELT $ 157))
                                   $)
                                  . #6#)
                            (LETT |s|
                                  (COND
                                   ((ZEROP
                                     (SPADCALL (QREFELT $ 140)
                                               (QREFELT $ 147)))
                                    #9#)
                                   (#5# #10#))
                                  . #6#)
                            (EXIT
                             (SPADCALL
                              (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                              (QREFELT $ 159)))))))
                        (#5#
                         (SEQ
                          (LETT |t|
                                (|FLOAT;padFromLeft|
                                 (SPADCALL |s| (|STR_to_CHAR| #7#)
                                           (QREFELT $ 157))
                                 $)
                                . #6#)
                          (LETT |s|
                                (COND
                                 ((ZEROP
                                   (SPADCALL (QREFELT $ 140) (QREFELT $ 147)))
                                  #9#)
                                 (#5# #10#))
                                . #6#)
                          (EXIT
                           (SPADCALL
                            (LIST #11# |t| |s| (STRINGIMAGE (+ |e| |n|)))
                            (QREFELT $ 159)))))))))))))))))) 

(DEFUN |FLOAT;outputSpacing;NniV;108| (|n| $)
  (SPADCALL (QREFELT $ 140) |n| (QREFELT $ 160))) 

(DEFUN |FLOAT;outputFixed;V;109| ($)
  (SEQ (SPADCALL (QREFELT $ 143) "fixed" (QREFELT $ 162))
       (EXIT (SPADCALL (QREFELT $ 146) -1 (QREFELT $ 163))))) 

(DEFUN |FLOAT;outputFixed;NniV;110| (|n| $)
  (SEQ (SPADCALL (QREFELT $ 143) "fixed" (QREFELT $ 162))
       (EXIT (SPADCALL (QREFELT $ 146) |n| (QREFELT $ 163))))) 

(DEFUN |FLOAT;outputGeneral;V;111| ($)
  (SEQ (SPADCALL (QREFELT $ 143) "general" (QREFELT $ 162))
       (EXIT (SPADCALL (QREFELT $ 146) -1 (QREFELT $ 163))))) 

(DEFUN |FLOAT;outputGeneral;NniV;112| (|n| $)
  (SEQ (SPADCALL (QREFELT $ 143) "general" (QREFELT $ 162))
       (EXIT (SPADCALL (QREFELT $ 146) |n| (QREFELT $ 163))))) 

(DEFUN |FLOAT;outputFloating;V;113| ($)
  (SEQ (SPADCALL (QREFELT $ 143) "floating" (QREFELT $ 162))
       (EXIT (SPADCALL (QREFELT $ 146) -1 (QREFELT $ 163))))) 

(DEFUN |FLOAT;outputFloating;NniV;114| (|n| $)
  (SEQ (SPADCALL (QREFELT $ 143) "floating" (QREFELT $ 162))
       (EXIT (SPADCALL (QREFELT $ 146) |n| (QREFELT $ 163))))) 

(DEFUN |FLOAT;convert;$S;115| (|f| $)
  (PROG (#1=#:G705 |s| |b| #2=#:G700)
    (RETURN
     (SEQ
      (LETT |b|
            (SEQ
             (COND
              ((EQL (SPADCALL (QREFELT $ 146) (QREFELT $ 153)) -1)
               (COND
                ((NULL (SPADCALL |f| (QREFELT $ 33)))
                 (EXIT
                  (SPADCALL
                   (PROG1
                       (LETT #2#
                             (INTEGER-LENGTH
                              (ABS (SPADCALL |f| (QREFELT $ 17))))
                             . #3=(|FLOAT;convert;$S;115|))
                     (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                   (QREFELT $ 67)))))))
             (EXIT 0))
            . #3#)
      (LETT |s|
            (COND
             ((EQUAL (SPADCALL (QREFELT $ 143) (QREFELT $ 170)) "fixed")
              (|FLOAT;fixed| |f| $))
             ((EQUAL (SPADCALL (QREFELT $ 143) (QREFELT $ 170)) "floating")
              (|FLOAT;floating| |f| $))
             ((EQUAL (SPADCALL (QREFELT $ 143) (QREFELT $ 170)) "general")
              (|FLOAT;general| |f| $))
             (#4='T (|make_full_CVEC| 0)))
            . #3#)
      (COND
       ((SPADCALL |b| 0 (QREFELT $ 68))
        (SPADCALL
         (PROG1 (LETT #1# |b| . #3#)
           (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
         (QREFELT $ 67))))
      (EXIT
       (COND ((EQUAL |s| (|make_full_CVEC| 0)) (|error| "bad output mode"))
             (#4# |s|))))))) 

(DEFUN |FLOAT;coerce;$Of;116| (|f| $)
  (COND
   ((SPADCALL |f| (|spadConstant| $ 34) (QREFELT $ 172))
    (SPADCALL (SPADCALL |f| (QREFELT $ 171)) (QREFELT $ 174)))
   ('T
    (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 175))
              (QREFELT $ 176))))) 

(DEFUN |FLOAT;convert;$If;117| (|f| $)
  (SPADCALL
   (LIST (SPADCALL '|float| (QREFELT $ 179))
         (SPADCALL (SPADCALL |f| (QREFELT $ 17)) (QREFELT $ 180))
         (SPADCALL (SPADCALL |f| (QREFELT $ 19)) (QREFELT $ 180))
         (SPADCALL (SPADCALL (QREFELT $ 114)) (QREFELT $ 180)))
   (QREFELT $ 181))) 

(PUT '|FLOAT;convert;2$;118| '|SPADreplace| '(XLAM (|x|) |x|)) 

(DEFUN |FLOAT;convert;2$;118| (|x| $) |x|) 

(DEFUN |FLOAT;convert;$Df;119| (|x| $) (|makeSF| (QCAR |x|) (QCDR |x|))) 

(DEFUN |FLOAT;coerce;$Df;120| (|x| $) (SPADCALL |x| (QREFELT $ 186))) 

(DEFUN |FLOAT;convert;Df$;121| (|sf| $)
  (SPADCALL (SPADCALL |sf| (QREFELT $ 188)) (SPADCALL |sf| (QREFELT $ 189))
            (FLOAT-RADIX 0.0) (QREFELT $ 119))) 

(DEFUN |FLOAT;retract;$F;122| (|f| $)
  (PROG (#1=#:G716)
    (RETURN
     (SPADCALL |f|
               (PROG1
                   (LETT #1# (- (SPADCALL (QREFELT $ 55)) 1)
                         |FLOAT;retract;$F;122|)
                 (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
               2 (QREFELT $ 191))))) 

(DEFUN |FLOAT;retractIfCan;$U;123| (|f| $)
  (PROG (#1=#:G722)
    (RETURN
     (CONS 0
           (SPADCALL |f|
                     (PROG1
                         (LETT #1# (- (SPADCALL (QREFELT $ 55)) 1)
                               |FLOAT;retractIfCan;$U;123|)
                       (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                        #1#))
                     2 (QREFELT $ 191)))))) 

(DEFUN |FLOAT;retract;$I;124| (|f| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 56)) |FLOAT;retract;$I;124|)
          (EXIT
           (COND
            ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 195)) (QREFELT $ 39)) |n|)
            ('T (|error| "Not an integer")))))))) 

(DEFUN |FLOAT;retractIfCan;$U;125| (|f| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |f| (QREFELT $ 56)) |FLOAT;retractIfCan;$U;125|)
          (EXIT
           (COND
            ((SPADCALL |f| (SPADCALL |n| (QREFELT $ 195)) (QREFELT $ 39))
             (CONS 0 |n|))
            ('T (CONS 1 "failed")))))))) 

(DEFUN |FLOAT;rationalApproximation;$NniF;126| (|f| |d| $)
  (SPADCALL |f| |d| 10 (QREFELT $ 191))) 

(DEFUN |FLOAT;rationalApproximation;$2NniF;127| (|f| |d| |b| $)
  (PROG (|t| |s| |#G227| |#G226| |q1| |q0| |#G225| |#G224| |p1| |p0| |#G223|
         |#G222| #1=#:G750 |q2| |p2| |r| |q| |#G221| |tol| |de| #2=#:G743
         #3=#:G741 |ex| |nu|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |nu| (QCAR |f|) . #4=(|FLOAT;rationalApproximation;$2NniF;127|))
        (LETT |ex| (QCDR |f|) . #4#)
        (COND
         ((>= |ex| 0)
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (* |nu|
                     (EXPT 2
                           (PROG1 (LETT #3# |ex| . #4#)
                             (|check_subtype| (>= #3# 0)
                                              '(|NonNegativeInteger|) #3#))))
                  1 (QREFELT $ 200))
                 . #4#)
           (GO #1#))))
        (LETT |de|
              (EXPT 2
                    (PROG1 (LETT #2# (- |ex|) . #4#)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|)
                                       #2#)))
              . #4#)
        (COND ((< |b| 2) (|error| "base must be > 1")))
        (LETT |tol| (EXPT |b| |d|) . #4#) (LETT |s| |nu| . #4#)
        (LETT |t| |de| . #4#) (LETT |p0| 0 . #4#) (LETT |p1| 1 . #4#)
        (LETT |q0| 1 . #4#) (LETT |q1| 0 . #4#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (PROGN
                (LETT |#G221| (DIVIDE2 |s| |t|) . #4#)
                (LETT |q| (QCAR |#G221|) . #4#)
                (LETT |r| (QCDR |#G221|) . #4#)
                |#G221|)
               (LETT |p2| (+ (* |q| |p1|) |p0|) . #4#)
               (LETT |q2| (+ (* |q| |q1|) |q0|) . #4#)
               (COND
                ((OR (EQL |r| 0)
                     (<
                      (SPADCALL |tol|
                                (ABS
                                 (- (* |nu| |q2|)
                                    (SPADCALL |de| |p2| (QREFELT $ 60))))
                                (QREFELT $ 79))
                      (SPADCALL |de| (ABS |p2|) (QREFELT $ 60))))
                 (PROGN
                  (LETT #1# (SPADCALL |p2| |q2| (QREFELT $ 200)) . #4#)
                  (GO #1#))))
               (PROGN
                (LETT |#G222| |p1| . #4#)
                (LETT |#G223| |p2| . #4#)
                (LETT |p0| |#G222| . #4#)
                (LETT |p1| |#G223| . #4#))
               (PROGN
                (LETT |#G224| |q1| . #4#)
                (LETT |#G225| |q2| . #4#)
                (LETT |q0| |#G224| . #4#)
                (LETT |q1| |#G225| . #4#))
               (EXIT
                (PROGN
                 (LETT |#G226| |t| . #4#)
                 (LETT |#G227| |r| . #4#)
                 (LETT |s| |#G226| . #4#)
                 (LETT |t| |#G227| . #4#))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |Float| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G763)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Float|) . #2=(|Float|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Float|
                         (LIST (CONS NIL (CONS 1 (|Float;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Float|))))))))))) 

(DEFUN |Float;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Float|) . #1=(|Float|))
      (LETT $ (GETREFV 213) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Float| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (|HasCategory| $ '(|arbitraryPrecision|)) (|augmentPredVector| $ 1))
      (AND (|not| (|HasCategory| $ '(|arbitraryExponent|)))
           (|not| (|HasCategory| $ '(|arbitraryPrecision|)))
           (|augmentPredVector| $ 2))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL 68 (QREFELT $ 8)))
      (QSETREFV $ 10
                (|Record| (|:| |mantissa| (|Integer|))
                          (|:| |exponent| (|Integer|))))
      (QSETREFV $ 74 (CONS 1 (CONS 1 2)))
      (QSETREFV $ 92 (CONS 1 (|spadConstant| $ 38)))
      (QSETREFV $ 94 (CONS 1 (CONS 1 1)))
      (QSETREFV $ 105 (CONS 1 (CONS 1 1)))
      (QSETREFV $ 140 (SPADCALL 10 (QREFELT $ 139)))
      (QSETREFV $ 143 (SPADCALL "general" (QREFELT $ 142)))
      (QSETREFV $ 146 (SPADCALL -1 (QREFELT $ 145)))
      $)))) 

(MAKEPROP '|Float| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|PositiveInteger|) (|Reference| 6)
              (0 . |ref|) 'BITS '|Rep| (|Void|) (|OpenMathDevice|)
              (5 . |OMputApp|) (|String|) (10 . |OMputSymbol|) (|Integer|)
              |FLOAT;mantissa;$I;53| (17 . |OMputInteger|)
              |FLOAT;exponent;$I;54| (23 . |OMputEndApp|) (|OpenMathEncoding|)
              (28 . |OMencodingXML|) (32 . |OMopenString|) (38 . |OMputObject|)
              (43 . |OMputEndObject|) (48 . |OMclose|) |FLOAT;OMwrite;$S;2|
              (|Boolean|) |FLOAT;OMwrite;$BS;3| |FLOAT;OMwrite;Omd$V;4|
              |FLOAT;OMwrite;Omd$BV;5| (53 . |sign|) |FLOAT;zero?;$B;56|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FLOAT;Zero;$;50|) $))
              |FLOAT;negative?;$B;57| |FLOAT;-;2$;75| |FLOAT;asin;2$;7|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FLOAT;One;$;51|) $))
              |FLOAT;=;2$B;64| |FLOAT;pi;$;18| |FLOAT;/;$I$;84| (58 . >)
              |FLOAT;increasePrecision;IPi;43| |FLOAT;sqrt;2$;38|
              |FLOAT;/;3$;83| |FLOAT;atan;2$;10|
              |FLOAT;decreasePrecision;IPi;44| |FLOAT;normalize;2$;62|
              |FLOAT;acos;2$;8| |FLOAT;-;3$;78| |FLOAT;<;2$B;65|
              |FLOAT;abs;2$;66| |FLOAT;atan;3$;9| (64 . |fractionPart|)
              |FLOAT;bits;Pi;39| |FLOAT;wholePart;$I;68| (|IntegerRoots| 16)
              (69 . |approxSqrt|) |FLOAT;order;$I;48| (74 . *) |FLOAT;*;3$;81|
              |FLOAT;+;3$;77| |FLOAT;shift;$I$;63| (80 . ~=) |FLOAT;sign;$I;71|
              (86 . *) |FLOAT;bits;2Pi;40| (92 . >) (98 . ^) |FLOAT;*;I2$;82|
              |FLOAT;sin;2$;13| |FLOAT;cos;2$;15| |FLOAT;tan;2$;17| 'P
              |FLOAT;precision;Pi;41| (104 . <=) (110 . ^)
              (|NonNegativeInteger|) (116 . *) (122 . *) (128 . ^)
              |FLOAT;exp;2$;32| |FLOAT;sinh;2$;20| |FLOAT;cosh;2$;21|
              |FLOAT;tanh;2$;22| |FLOAT;log;2$;26| |FLOAT;asinh;2$;23|
              |FLOAT;acosh;2$;24| |FLOAT;atanh;2$;25| |FLOAT;log2;$;28|
              |FLOAT;^;$I$;93| 'L2 (134 . <=) 'L10 |FLOAT;log10;$;29|
              |FLOAT;log2;2$;30| |FLOAT;log10;2$;31| |FLOAT;exp1;$;37|
              (|List| (|List| 16)) (|Matrix| 16) (140 . |matrix|) (145 . <=)
              (151 . |elt|) (158 . *) 'E (164 . >) (170 . |elt|)
              (175 . |setelt|) |FLOAT;precision;2Pi;42| (181 . |max|)
              |FLOAT;digits;Pi;46| |FLOAT;digits;2Pi;47|
              |FLOAT;relerror;2$I;49| |FLOAT;base;Pi;52| |FLOAT;one?;$B;55|
              (185 . |positive?|) |FLOAT;positive?;$B;58| |FLOAT;float;2I$;60|
              |FLOAT;float;2IPi$;61| |FLOAT;floor;2$;69| |FLOAT;truncate;2$;72|
              |FLOAT;ceiling;2$;67| |FLOAT;round;2$;70| (|Union| $ '"failed")
              |FLOAT;recip;$U;73| |FLOAT;differentiate;2$;74| |FLOAT;inv;2$;85|
              |FLOAT;^;3$;91| (|Fraction| 16) (190 . |Zero|) (194 . =)
              (200 . <) (206 . >) (212 . |One|) (216 . |numer|) (221 . |denom|)
              |FLOAT;^;$F$;92| (|Reference| 78) (226 . |ref|) 'SPACING
              (|Reference| 14) (231 . |ref|) 'OUTMODE (|Reference| 16)
              (236 . |ref|) 'OUTPREC (241 . |elt|) (246 . |minIndex|)
              (|Character|) (251 . |elt|) (257 . |setelt|) (264 . |maxIndex|)
              (269 . |elt|) (|UniversalSegment| 16) (274 . SEGMENT)
              (280 . |elt|) (286 . |rightTrim|) (|List| $) (292 . |concat|)
              (297 . |setelt|) |FLOAT;outputSpacing;NniV;108| (303 . |setelt|)
              (309 . |setelt|) |FLOAT;outputFixed;V;109|
              |FLOAT;outputFixed;NniV;110| |FLOAT;outputGeneral;V;111|
              |FLOAT;outputGeneral;NniV;112| |FLOAT;outputFloating;V;113|
              |FLOAT;outputFloating;NniV;114| (315 . |elt|)
              |FLOAT;convert;$S;115| (320 . >=) (|OutputForm|)
              (326 . |message|) |FLOAT;coerce;$Of;116| (331 . -) (|Symbol|)
              (|InputForm|) (336 . |convert|) (341 . |convert|)
              (346 . |convert|) |FLOAT;convert;$If;117| (|Float|)
              |FLOAT;convert;2$;118| (|DoubleFloat|) |FLOAT;convert;$Df;119|
              |FLOAT;coerce;$Df;120| (351 . |mantissa|) (356 . |exponent|)
              |FLOAT;convert;Df$;121| |FLOAT;rationalApproximation;$2NniF;127|
              |FLOAT;retract;$F;122| (|Union| 129 '"failed")
              |FLOAT;retractIfCan;$U;123| (361 . |coerce|)
              |FLOAT;retract;$I;124| (|Union| 16 '"failed")
              |FLOAT;retractIfCan;$U;125|
              |FLOAT;rationalApproximation;$NniF;126| (366 . /) (|Pattern| 183)
              (|PatternMatchResult| 183 $) (|Factored| $)
              (|Union| 158 '#1="failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 206 '#1#)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 158) (|:| |generator| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|SingleInteger|))
           '#(~= 372 |zero?| 378 |wholePart| 383 |unitNormal| 388
              |unitCanonical| 393 |unit?| 398 |truncate| 403 |toString| 408
              |tanh| 414 |tan| 419 |subtractIfCan| 424 |squareFreePart| 430
              |squareFree| 435 |sqrt| 440 |smaller?| 445 |sizeLess?| 451 |sinh|
              457 |sin| 462 |sign| 467 |shift| 472 |sech| 478 |sec| 483
              |sample| 488 |round| 492 |retractIfCan| 497 |retract| 507 |rem|
              517 |relerror| 523 |recip| 529 |rationalApproximation| 534 |quo|
              547 |principalIdeal| 553 |prime?| 558 |precision| 563 |positive?|
              572 |pi| 577 |patternMatch| 581 |outputSpacing| 588
              |outputGeneral| 593 |outputFloating| 602 |outputFixed| 611
              |order| 620 |one?| 625 |nthRoot| 630 |normalize| 636 |norm| 641
              |negative?| 646 |multiEuclidean| 651 |min| 657 |max| 667
              |mantissa| 677 |log2| 682 |log10| 691 |log| 700 |lcm| 705 |latex|
              716 |inv| 721 |increasePrecision| 726 |hash| 731 |gcdPolynomial|
              736 |gcd| 742 |fractionPart| 753 |floor| 758 |float| 763 |factor|
              776 |extendedEuclidean| 781 |exquo| 794 |expressIdealMember| 800
              |exponent| 806 |exp1| 811 |exp| 815 |euclideanSize| 820 |divide|
              825 |digits| 831 |differentiate| 840 |decreasePrecision| 851
              |csch| 856 |csc| 861 |coth| 866 |cot| 871 |cosh| 876 |cos| 881
              |convert| 886 |coerce| 916 |characteristic| 951 |ceiling| 955
              |bits| 960 |base| 969 |atanh| 973 |atan| 978 |associates?| 989
              |asinh| 995 |asin| 1000 |asech| 1005 |asec| 1010 |acsch| 1015
              |acsc| 1020 |acoth| 1025 |acot| 1030 |acosh| 1035 |acos| 1040
              |abs| 1045 ^ 1050 |Zero| 1080 |One| 1084 |OMwrite| 1088 D 1112 >=
              1123 > 1129 = 1135 <= 1141 < 1147 / 1153 - 1165 + 1176 * 1182)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|FloatingPointSystem&| |RealNumberSystem&| |Field&|
                |EuclideanDomain&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| |IntegralDomain&| |Algebra&|
                |Algebra&| |DifferentialRing&| NIL |OrderedRing&| |Module&| NIL
                NIL |Module&| NIL NIL NIL |Ring&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |TranscendentalFunctionCategory&| NIL |SetCategory&| NIL NIL
                NIL |ElementaryFunctionCategory&| NIL
                |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL NIL
                |RadicalCategory&| |RetractableTo&| |RetractableTo&| NIL NIL
                |PartialOrder&| NIL NIL NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|FloatingPointSystem|) (|RealNumberSystem|) (|Field|)
                 (|EuclideanDomain|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 129) (|Algebra| $$)
                 (|DifferentialRing|) (|CharacteristicZero|) (|OrderedRing|)
                 (|Module| 129) (|EntireRing|) (|CommutativeRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| 129 129)
                 (|BiModule| $$ $$) (|Ring|)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| 129)
                 (|LeftModule| 129) (|LeftModule| $$) (|Rng|)
                 (|RightModule| $$) (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|PatternMatchable| 183) (|Comparable|)
                 (|SemiGroup|) (|AbelianSemiGroup|)
                 (|TranscendentalFunctionCategory|) (|RealConstant|)
                 (|SetCategory|) (|arbitraryExponent|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 178) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|CoercibleTo| 185)
                 (|OpenMath|) (|ConvertibleTo| 14) (|Approximate|)
                 (|ConvertibleTo| 201) (|RadicalCategory|)
                 (|RetractableTo| 129) (|RetractableTo| 16)
                 (|ConvertibleTo| 183) (|ConvertibleTo| 185) (|PartialOrder|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CommutativeStar|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 173))
              (|makeByteWordVec2| 212
                                  '(1 7 0 6 8 1 12 11 0 13 3 12 11 0 14 14 15 2
                                    12 11 0 16 18 1 12 11 0 20 0 21 0 22 2 12 0
                                    14 21 23 1 12 11 0 24 1 12 11 0 25 1 12 11
                                    0 26 1 16 16 0 32 2 0 28 0 0 42 1 0 0 0 54
                                    1 57 16 16 58 2 16 0 6 0 60 2 16 28 0 0 64
                                    2 0 0 6 0 66 2 16 28 0 0 68 2 0 0 0 6 69 2
                                    6 28 0 0 76 2 6 0 0 6 77 2 16 0 78 0 79 2
                                    78 0 6 0 80 2 78 0 0 6 81 2 78 28 0 0 93 1
                                    100 0 99 101 2 16 28 0 0 102 3 100 16 0 16
                                    16 103 2 100 0 0 0 104 2 6 28 0 0 106 1 7 6
                                    0 107 2 7 6 0 6 108 0 0 0 110 1 16 28 0 116
                                    0 129 0 130 2 129 28 0 0 131 2 129 28 0 0
                                    132 2 129 28 0 0 133 0 129 0 134 1 129 16 0
                                    135 1 129 16 0 136 1 138 0 78 139 1 141 0
                                    14 142 1 144 0 16 145 1 138 78 0 147 1 14
                                    16 0 148 2 14 149 0 16 150 3 14 149 0 16
                                    149 151 1 14 16 0 152 1 144 16 0 153 2 154
                                    0 16 16 155 2 14 0 0 154 156 2 14 0 0 149
                                    157 1 14 0 158 159 2 138 78 0 78 160 2 141
                                    14 0 14 162 2 144 16 0 16 163 1 141 14 0
                                    170 2 0 28 0 0 172 1 173 0 14 174 1 173 0 0
                                    176 1 178 0 177 179 1 16 178 0 180 1 178 0
                                    158 181 1 185 16 0 188 1 185 16 0 189 1 0 0
                                    16 195 2 129 0 16 16 200 2 0 28 0 0 1 1 0
                                    28 0 33 1 0 16 0 56 1 0 211 0 1 1 0 0 0 1 1
                                    0 28 0 1 1 0 0 0 121 2 0 14 0 78 1 1 0 0 0
                                    85 1 0 0 0 73 2 0 124 0 0 1 1 0 0 0 1 1 0
                                    203 0 1 1 0 0 0 44 2 0 28 0 0 1 2 0 28 0 0
                                    1 1 0 0 0 83 1 0 0 0 71 1 0 16 0 65 2 0 0 0
                                    16 63 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0 0 0
                                    123 1 0 193 0 194 1 0 197 0 198 1 0 129 0
                                    192 1 0 16 0 196 2 0 0 0 0 1 2 0 16 0 0 113
                                    1 0 124 0 125 3 0 129 0 78 78 191 2 0 129 0
                                    78 199 2 0 0 0 0 1 1 0 209 158 1 1 0 28 0 1
                                    1 1 6 6 109 0 0 6 75 1 0 28 0 117 0 0 0 40
                                    3 0 202 0 201 202 1 1 0 11 78 161 1 0 11 78
                                    167 0 0 11 166 0 0 11 168 1 0 11 78 169 0 0
                                    11 164 1 0 11 78 165 1 0 16 0 59 1 0 28 0
                                    115 2 0 0 0 16 1 1 0 0 0 48 1 0 0 0 1 1 0
                                    28 0 35 2 0 204 158 0 1 0 2 0 1 2 0 0 0 0 1
                                    0 2 0 110 2 0 0 0 0 1 1 0 16 0 17 1 0 0 0
                                    96 0 0 0 90 1 0 0 0 97 0 0 0 95 1 0 0 0 86
                                    2 0 0 0 0 1 1 0 0 158 1 1 0 14 0 1 1 0 0 0
                                    127 1 1 6 16 43 1 0 212 0 1 2 0 210 210 210
                                    1 2 0 0 0 0 1 1 0 0 158 1 1 0 0 0 54 1 0 0
                                    0 120 3 0 0 16 16 6 119 2 0 0 16 16 118 1 0
                                    203 0 1 2 0 205 0 0 1 3 0 207 0 0 0 1 2 0
                                    124 0 0 1 2 0 204 158 0 1 1 0 16 0 19 0 0 0
                                    98 1 0 0 0 82 1 0 78 0 1 2 0 208 0 0 1 1 1
                                    6 6 112 0 0 6 111 1 0 0 0 126 2 0 0 0 78 1
                                    1 1 6 16 47 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 84 1 0 0 0 72 1 0 0 185 190
                                    1 0 178 0 182 1 0 14 0 171 1 0 201 0 1 1 0
                                    185 0 186 1 0 183 0 184 1 0 185 0 187 1 0 0
                                    129 1 1 0 0 16 195 1 0 0 129 1 1 0 0 0 1 1
                                    0 0 16 195 1 0 173 0 175 0 0 78 1 1 0 0 0
                                    122 1 1 6 6 67 0 0 6 55 0 0 6 114 1 0 0 0
                                    89 2 0 0 0 0 53 1 0 0 0 46 2 0 28 0 0 1 1 0
                                    0 0 87 1 0 0 0 37 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    88 1 0 0 0 49 1 0 0 0 52 2 0 0 0 0 128 2 0
                                    0 0 129 137 2 0 0 0 16 91 2 0 0 0 78 1 2 0
                                    0 0 6 69 0 0 0 34 0 0 0 38 2 0 11 12 0 30 3
                                    0 11 12 0 28 31 2 0 14 0 28 29 1 0 14 0 27
                                    1 0 0 0 1 2 0 0 0 78 1 2 0 28 0 0 172 2 0
                                    28 0 0 42 2 0 28 0 0 39 2 0 28 0 0 1 2 0 28
                                    0 0 51 2 0 0 0 16 41 2 0 0 0 0 45 2 0 0 0 0
                                    50 1 0 0 0 36 2 0 0 0 0 62 2 0 0 129 0 1 2
                                    0 0 0 129 1 2 0 0 16 0 70 2 0 0 0 0 61 2 0
                                    0 78 0 1 2 0 0 6 0 66)))))
           '|lookupComplete|)) 

(MAKEPROP '|Float| 'NILADIC T) 
