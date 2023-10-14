
(/VERSIONCHECK 2) 

(DEFUN |EFSTRUC;realElem| (|f| |l| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EFSTRUC;realElem!0| (VECTOR $ |l|)) |f|
               (QREFELT $ 18))))) 

(DEFUN |EFSTRUC;realElem!0| (|k| $$)
  (PROG (|l| $)
    (LETT |l| (QREFELT $$ 1) . #1=(|EFSTRUC;realElem|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|EFSTRUC;k2Elem| |k| |l| $))))) 

(DEFUN |EFSTRUC;realElementary;FSF;2| (|f| |x| $)
  (|EFSTRUC;realElem| |f| (LIST |x|) $)) 

(DEFUN |EFSTRUC;realElementary;2F;3| (|f| $)
  (|EFSTRUC;realElem| |f| (SPADCALL |f| (QREFELT $ 22)) $)) 

(DEFUN |EFSTRUC;realLiouvillian;2F;4| (|f| $)
  (SPADCALL (CONS (|function| |EFSTRUC;k_to_liou|) $) |f| (QREFELT $ 18))) 

(DEFUN |EFSTRUC;realLiouvillian;FSF;5| (|f| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EFSTRUC;realLiouvillian;FSF;5!0| (VECTOR $ |x|)) |f|
               (QREFELT $ 18))))) 

(DEFUN |EFSTRUC;realLiouvillian;FSF;5!0| (|k| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|EFSTRUC;realLiouvillian;FSF;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|EFSTRUC;k_to_liou1| |k| |x| $))))) 

(DEFUN |EFSTRUC;toY| (|ker| $)
  (PROG (|func| #1=#:G249 |k| #2=#:G248)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toY|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoY| |k| $) . #3#)
                          (|spadConstant| $ 26) (QREFELT $ 28))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;toZ| (|ker| $)
  (PROG (|func| #1=#:G253 |k| #2=#:G252)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toZ|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoZ| |k| $) . #3#)
                          (|spadConstant| $ 26) (QREFELT $ 28))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;toU| (|ker| $)
  (PROG (|func| #1=#:G257 |k| #2=#:G256)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toU|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoU| |k| $) . #3#)
                          (|spadConstant| $ 26) (QREFELT $ 28))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;toV| (|ker| $)
  (PROG (|func| #1=#:G261 |k| #2=#:G260)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toV|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |ker| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((SPADCALL (LETT |func| (|EFSTRUC;ktoV| |k| $) . #3#)
                          (|spadConstant| $ 26) (QREFELT $ 28))
                (LETT #2# (CONS |func| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;rtNormalize| (|f| $) (QVELT (|EFSTRUC;rootNormalize0| |f| $) 0)) 

(DEFUN |EFSTRUC;toR| (|ker| |x| $)
  (PROG ()
    (RETURN
     (SPADCALL (CONS #'|EFSTRUC;toR!0| (VECTOR |x| $)) |ker| (QREFELT $ 38))))) 

(DEFUN |EFSTRUC;toR!0| (|s| $$)
  (PROG ($ |x|)
    (LETT $ (QREFELT $$ 1) . #1=(|EFSTRUC;toR|))
    (LETT |x| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (COND
       ((SPADCALL |s| '|nthRoot| (QREFELT $ 30))
        (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 32)) (QREFELT $ 33)) |x|
                  (QREFELT $ 34)))
       ('T (|spadConstant| $ 35))))))) 

(DEFUN |EFSTRUC;tanQ;F2F;12| (|c| |x| $)
  (PROG (#1=#:G268)
    (RETURN
     (SPADCALL
      (SPADCALL
       (SPADCALL
        (SPADCALL |x|
                  (PROG1
                      (LETT #1# (SPADCALL |c| (QREFELT $ 40))
                            |EFSTRUC;tanQ;F2F;12|)
                    (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                  (QREFELT $ 44))
        (QREFELT $ 46))
       (QREFELT $ 48))
      (SPADCALL |c| (QREFELT $ 49)) (QREFELT $ 50))))) 

(DEFUN |EFSTRUC;tanQ;F2F;13| (|c| |x| $)
  (PROG (#1=#:G271)
    (RETURN
     (SPADCALL
      (SPADCALL
       (SPADCALL |x|
                 (PROG1
                     (LETT #1# (SPADCALL |c| (QREFELT $ 40))
                           |EFSTRUC;tanQ;F2F;13|)
                   (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                 (QREFELT $ 44))
       (QREFELT $ 46))
      (SPADCALL |c| (QREFELT $ 49)) (QREFELT $ 50))))) 

(DEFUN |EFSTRUC;tanSum| (|c| |l| $)
  (PROG (#1=#:G278 |r| |k|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |k| (SPADCALL |c| (QREFELT $ 16) (QREFELT $ 15))
              . #2=(|EFSTRUC;tanSum|))
        (SEQ (LETT |r| (SPADCALL |k| (QREFELT $ 53)) . #2#)
             (EXIT
              (COND
               ((QEQCAR |r| 0)
                (COND
                 ((ODDP (QCDR |r|))
                  (PROGN
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |l| (QREFELT $ 54))
                                    (QREFELT $ 55))
                          (QREFELT $ 14))
                         . #2#)
                   (GO #1#))))))))
        (EXIT
         (SPADCALL (CONS (SPADCALL |c| (QREFELT $ 56)) |l|) (QREFELT $ 54)))))
      #1# (EXIT #1#))))) 

(DEFUN |EFSTRUC;rootNormalize0| (|f| $)
  (PROG (#1=#:G288 #2=#:G292 |rn| |rec| |u| |i| #3=#:G293 |kk| |n| |ker|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ker|
              (SPADCALL (CONS #'|EFSTRUC;rootNormalize0!0| $)
                        (SPADCALL |f| (QREFELT $ 59)) (QREFELT $ 60))
              . #4=(|EFSTRUC;rootNormalize0|))
        (EXIT
         (COND ((NULL |ker|) (VECTOR |f| NIL NIL))
               (#5='T
                (SEQ (LETT |n| (- (LENGTH |ker|) 1) . #4#)
                     (EXIT
                      (COND ((< |n| 1) (VECTOR |f| NIL NIL))
                            (#5#
                             (SEQ
                              (SEQ
                               (EXIT
                                (SEQ (LETT |kk| NIL . #4#)
                                     (LETT #3# (CDR |ker|) . #4#)
                                     (LETT |i| 1 . #4#) G190
                                     (COND
                                      ((OR (|greater_SI| |i| |n|) (ATOM #3#)
                                           (PROGN
                                            (LETT |kk| (CAR #3#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |u|
                                            (|EFSTRUC;rootKernelNormalize| |f|
                                             (SPADCALL |ker| |i|
                                                       (QREFELT $ 64))
                                             |kk| $)
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |u| 0)
                                         (PROGN
                                          (LETT #1#
                                                (SEQ
                                                 (LETT |rec| (QCDR |u|) . #4#)
                                                 (LETT |rn|
                                                       (|EFSTRUC;rootNormalize0|
                                                        (QVELT |rec| 0) $)
                                                       . #4#)
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #2#
                                                         (VECTOR (QVELT |rn| 0)
                                                                 (SPADCALL
                                                                  (QVELT |rec|
                                                                         1)
                                                                  (QVELT |rn|
                                                                         1)
                                                                  (QREFELT $
                                                                           65))
                                                                 (SPADCALL
                                                                  (QVELT |rec|
                                                                         2)
                                                                  (QVELT |rn|
                                                                         2)
                                                                  (QREFELT $
                                                                           66)))
                                                         . #4#)
                                                   (GO #2#))))
                                                . #4#)
                                          (GO #1#))))))
                                     (LETT |i|
                                           (PROG1 (|inc_SI| |i|)
                                             (LETT #3# (CDR #3#) . #4#))
                                           . #4#)
                                     (GO G190) G191 (EXIT NIL)))
                               #1# (EXIT #1#))
                              (EXIT (VECTOR |f| NIL NIL))))))))))))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;rootNormalize0!0| (|x| $)
  (COND
   ((SPADCALL |x| '|nthRoot| (QREFELT $ 30))
    (SPADCALL
     (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 33))
               (QREFELT $ 22))
     (QREFELT $ 57)))
   ('T (|spadConstant| $ 35)))) 

(DEFUN |EFSTRUC;findQRelation| (|lv| |lpar| |lk| |ker| $)
  (PROG (|u| |j| #1=#:G314 |k| |i| #2=#:G313 |var| |mat| |isconstant| #3=#:G312
         |v| |lvv| |m| #4=#:G311 |n|)
    (RETURN
     (SEQ
      (COND ((NULL |lk|) (CONS 2 'T))
            (#5='T
             (SEQ (LETT |isconstant| 'T . #6=(|EFSTRUC;findQRelation|))
                  (LETT |m| (LENGTH |lv|) . #6#) (LETT |lvv| |lv| . #6#)
                  (LETT |n| (LENGTH |lk|) . #6#)
                  (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)) . #6#)
                  (SEQ (LETT |var| NIL . #6#) (LETT #4# |lv| . #6#)
                       (LETT |i| 1 . #6#) G190
                       (COND
                        ((OR (|greater_SI| |i| |m|) (ATOM #4#)
                             (PROGN (LETT |var| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (SPADCALL |v| |i| (SPADCALL |ker| |var| (QREFELT $ 68))
                                  (QREFELT $ 70))
                        (EXIT
                         (COND
                          (|isconstant|
                           (LETT |isconstant|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 71))
                                           (|spadConstant| $ 26)
                                           (QREFELT $ 34))
                                 . #6#)))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#) . #6#))
                             . #6#)
                       (GO G190) G191 (EXIT NIL))
                  (COND
                   (|isconstant|
                    (SEQ (LETT |m| (LENGTH |lpar|) . #6#)
                         (LETT |lvv| |lpar| . #6#)
                         (LETT |v| (MAKEARR1 |m| (|spadConstant| $ 26)) . #6#)
                         (EXIT
                          (SEQ (LETT |var| NIL . #6#) (LETT #3# |lpar| . #6#)
                               (LETT |i| 1 . #6#) G190
                               (COND
                                ((OR (|greater_SI| |i| |m|) (ATOM #3#)
                                     (PROGN (LETT |var| (CAR #3#) . #6#) NIL))
                                 (GO G191)))
                               (SEQ
                                (SPADCALL |v| |i|
                                          (SPADCALL |ker| |var| (QREFELT $ 68))
                                          (QREFELT $ 70))
                                (EXIT
                                 (COND
                                  (|isconstant|
                                   (LETT |isconstant|
                                         (SPADCALL
                                          (SPADCALL |v| |i| (QREFELT $ 71))
                                          (|spadConstant| $ 26) (QREFELT $ 34))
                                         . #6#)))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #3# (CDR #3#) . #6#))
                                     . #6#)
                               (GO G190) G191 (EXIT NIL))))))
                  (EXIT
                   (COND
                    (|isconstant|
                     (SEQ
                      (SPADCALL (SPADCALL |ker| (QREFELT $ 73)) (QREFELT $ 75))
                      (EXIT (|error| "Hidden constant detected"))))
                    (#5#
                     (SEQ
                      (LETT |mat|
                            (SPADCALL |m| |n| (|spadConstant| $ 26)
                                      (QREFELT $ 77))
                            . #6#)
                      (SEQ (LETT |var| NIL . #6#) (LETT #2# |lvv| . #6#)
                           (LETT |i| 1 . #6#) G190
                           (COND
                            ((OR (|greater_SI| |i| |m|) (ATOM #2#)
                                 (PROGN (LETT |var| (CAR #2#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |k| NIL . #6#) (LETT #1# |lk| . #6#)
                                  (LETT |j| 1 . #6#) G190
                                  (COND
                                   ((OR (|greater_SI| |j| |n|) (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#) . #6#) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |mat| |i| |j|
                                              (SPADCALL |k| |var|
                                                        (QREFELT $ 68))
                                              (QREFELT $ 78))))
                                  (LETT |j|
                                        (PROG1 (|inc_SI| |j|)
                                          (LETT #1# (CDR #1#) . #6#))
                                        . #6#)
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #2# (CDR #2#) . #6#))
                                 . #6#)
                           (GO G190) G191 (EXIT NIL))
                      (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 81)) . #6#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                             (#5# (CONS 2 'T))))))))))))))) 

(DEFUN |EFSTRUC;findLinearRelation1| (|lk| |ker| $)
  (PROG (|u| |j| #1=#:G322 |k| |v| |mat| |n|)
    (RETURN
     (SEQ
      (COND ((NULL |lk|) (CONS 2 'T))
            (#2='T
             (SEQ (LETT |n| (LENGTH |lk|) . #3=(|EFSTRUC;findLinearRelation1|))
                  (LETT |mat|
                        (SPADCALL 1 |n| (|spadConstant| $ 26) (QREFELT $ 77))
                        . #3#)
                  (LETT |v| (MAKEARR1 1 |ker|) . #3#)
                  (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#)
                       (LETT |j| 1 . #3#) G190
                       (COND
                        ((OR (|greater_SI| |j| |n|) (ATOM #1#)
                             (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |k| (QREFELT $ 22)))
                           (SPADCALL |mat| 1 |j| |k| (QREFELT $ 78)))
                          ('T
                           (SPADCALL |mat| 1 |j| (|spadConstant| $ 26)
                                     (QREFELT $ 78))))))
                       (LETT |j|
                             (PROG1 (|inc_SI| |j|) (LETT #1# (CDR #1#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (LETT |u| (SPADCALL |mat| |v| (QREFELT $ 81)) . #3#)
                  (EXIT
                   (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                         (#2# (CONS 2 'T))))))))))) 

(DEFUN |EFSTRUC;transkers| (|x| $)
  (PROG (#1=#:G327 |k| #2=#:G326)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;transkers|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |x| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND
                 ((SPADCALL (SPADCALL |k| (QREFELT $ 85)) (QREFELT $ 83)
                            (QREFELT $ 86))
                  'NIL)
                 ('T 'T))
                (LETT #2# (CONS |k| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;ktoQ| (|ker| $)
  (PROG (|qu| |z|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |ker| '|log| (QREFELT $ 30))
        (COND
         ((|HasCategory| (QREFELT $ 7)
                         (LIST '|RetractableTo|
                               (LIST '|Fraction| '(|Integer|))))
          (EXIT
           (SEQ
            (LETT |z|
                  (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1 (QREFELT $ 87))
                  . #1=(|EFSTRUC;ktoQ|))
            (LETT |qu| (SPADCALL |z| (QREFELT $ 89)) . #1#)
            (EXIT
             (COND ((QEQCAR |qu| 0) (QCDR |qu|))
                   ('T (|spadConstant| $ 82))))))))))
      (EXIT (|spadConstant| $ 82)))))) 

(DEFUN |EFSTRUC;toQ| (|lk| $)
  (PROG (#1=#:G339 |k| #2=#:G338)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|EFSTRUC;toQ|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((COND ((SPADCALL |k| '|log| (QREFELT $ 30)) 'T)
                      ('T (SPADCALL |k| '|exp| (QREFELT $ 30))))
                (LETT #2# (CONS (|EFSTRUC;ktoQ| |k| $) #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |EFSTRUC;findLinearRelation2| (|lk| |lz| |ker| $)
  (PROG (|nz| |ly| #1=#:G379 |x| #2=#:G378 #3=#:G377 #4=#:G376 |lpars1f|
         #5=#:G375 |s| #6=#:G374 |lpars1| #7=#:G373 |k| #8=#:G372 |lpars0|
         #9=#:G370 |vv| |lz1tonq| |kertond| |nd| |nq| |qratio| |fratio|
         |Fratio| #10=#:G371 |z1| |i| |m| |kerF| |u| |q| |zkers| |z|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |z| (SPADCALL (SPADCALL |ker| (QREFELT $ 32)) 1 (QREFELT $ 87))
              . #11=(|EFSTRUC;findLinearRelation2|))
        (LETT |zkers| (|EFSTRUC;transkers| (SPADCALL |z| (QREFELT $ 90)) $)
              . #11#)
        (EXIT
         (COND
          ((NULL |zkers|)
           (SEQ (LETT |q| (|EFSTRUC;ktoQ| |ker| $) . #11#)
                (COND
                 ((NULL (SPADCALL |q| (|spadConstant| $ 82) (QREFELT $ 91)))
                  (COND
                   ((NULL
                     (SPADCALL |q|
                               (SPADCALL (|spadConstant| $ 82) (QREFELT $ 92))
                               (QREFELT $ 91)))
                    (EXIT
                     (SEQ
                      (LETT |u|
                            (SPADCALL (|EFSTRUC;toQ| |lk| $) |q|
                                      (QREFELT $ 95))
                            . #11#)
                      (EXIT
                       (COND ((QEQCAR |u| 0) (CONS 0 (QCDR |u|)))
                             (#12='T (CONS 2 'T))))))))))
                (LETT |kerF| (SPADCALL |ker| (QREFELT $ 97)) . #11#)
                (COND
                 ((|domainEqual| (QREFELT $ 7) (|Expression| (QREFELT $ 6)))
                  (COND
                   ((|HasCategory| (QREFELT $ 6)
                                   (LIST '|ConvertibleTo| '(|Float|)))
                    (COND
                     ((|HasCategory| (QREFELT $ 6) '(|IntegralDomain|))
                      (COND
                       ((|HasCategory| (QREFELT $ 6) '(|OrderedSet|))
                        (EXIT
                         (SEQ (LETT |m| (LENGTH |lz|) . #11#)
                              (SEQ (LETT |i| 1 . #11#) (LETT |z1| NIL . #11#)
                                   (LETT #10# |lz| . #11#) G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN
                                          (LETT |z1| (CAR #10#) . #11#)
                                          NIL)
                                         (|greater_SI| |i| |m|))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |Fratio|
                                          (SPADCALL |kerF|
                                                    (SPADCALL |z1|
                                                              (QREFELT $ 98))
                                                    (QREFELT $ 15))
                                          . #11#)
                                    (LETT |fratio|
                                          (SPADCALL |Fratio| 20
                                                    (QREFELT $ 102))
                                          . #11#)
                                    (EXIT
                                     (COND
                                      ((QEQCAR |fratio| 0)
                                       (SEQ
                                        (LETT |qratio|
                                              (SPADCALL (QCDR |fratio|) 8
                                                        (QREFELT $ 104))
                                              . #11#)
                                        (COND
                                         ((OR
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QCDR |fratio|)
                                                        (SPADCALL |qratio|
                                                                  (QREFELT $
                                                                           105))
                                                        (QREFELT $ 106))
                                              (SPADCALL 1 0 10 (QREFELT $ 107))
                                              (QREFELT $ 108))
                                             (QREFELT $ 109))
                                            (SPADCALL 1 -16 10 (QREFELT $ 107))
                                            (QREFELT $ 110))
                                           (OR
                                            (SPADCALL
                                             (ABS
                                              (LETT |nq|
                                                    (SPADCALL |qratio|
                                                              (QREFELT $ 49))
                                                    . #11#))
                                             100 (QREFELT $ 111))
                                            (SPADCALL
                                             (ABS
                                              (LETT |nd|
                                                    (SPADCALL |qratio|
                                                              (QREFELT $ 40))
                                                    . #11#))
                                             100 (QREFELT $ 111))))
                                          (EXIT "iterate")))
                                        (LETT |kertond|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |ker| (QREFELT $ 32))
                                                1 (QREFELT $ 87))
                                               |nd| (QREFELT $ 112))
                                              . #11#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |nq| 0 (QREFELT $ 111))
                                           (SEQ
                                            (LETT |lz1tonq|
                                                  (SPADCALL |z1| |nq|
                                                            (QREFELT $ 112))
                                                  . #11#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |kertond| |lz1tonq|
                                                         (QREFELT $ 34))
                                               (SEQ
                                                (LETT |vv|
                                                      (SPADCALL |m|
                                                                (QREFELT $
                                                                         114))
                                                      . #11#)
                                                (QSETAREF1O |vv| |i| |qratio|
                                                            1)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #9# (CONS 0 |vv|)
                                                        . #11#)
                                                  (GO #9#)))))))))
                                          ('T
                                           (SEQ
                                            (LETT |lz1tonq|
                                                  (SPADCALL |z1| (- |nq|)
                                                            (QREFELT $ 112))
                                                  . #11#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |kertond| |lz1tonq|
                                                          (QREFELT $ 115))
                                                (|spadConstant| $ 62)
                                                (QREFELT $ 34))
                                               (SEQ
                                                (LETT |vv|
                                                      (SPADCALL |m|
                                                                (QREFELT $
                                                                         114))
                                                      . #11#)
                                                (QSETAREF1O |vv| |i| |qratio|
                                                            1)
                                                (EXIT
                                                 (PROGN
                                                  (LETT #9# (CONS 0 |vv|)
                                                        . #11#)
                                                  (GO #9#))))))))))))))))
                                   (LETT #10#
                                         (PROG1 (CDR #10#)
                                           (LETT |i| (|inc_SI| |i|) . #11#))
                                         . #11#)
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT (CONS 2 'T))))))))))))
                (EXIT (CONS 2 'T))))
          (#12#
           (SEQ (LETT |lpars0| (|EFSTRUC;transkers| |lk| $) . #11#)
                (LETT |lpars1|
                      (PROGN
                       (LETT #8# NIL . #11#)
                       (SEQ (LETT |k| NIL . #11#) (LETT #7# |lpars0| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #7#)
                                  (PROGN (LETT |k| (CAR #7#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #8# (CONS (SPADCALL (QREFELT $ 116)) #8#)
                                    . #11#)))
                            (LETT #7# (CDR #7#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #8#))))
                      . #11#)
                (LETT |lpars1f|
                      (PROGN
                       (LETT #6# NIL . #11#)
                       (SEQ (LETT |s| NIL . #11#) (LETT #5# |lpars1| . #11#)
                            G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |s| (CAR #5#) . #11#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS
                                     (SPADCALL (SPADCALL |s| (QREFELT $ 117))
                                               (QREFELT $ 97))
                                     #6#)
                                    . #11#)))
                            (LETT #5# (CDR #5#) . #11#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #11#)
                (COND
                 ((SPADCALL |ker| '|log| (QREFELT $ 30))
                  (SEQ
                   (LETT |ly|
                         (PROGN
                          (LETT #4# NIL . #11#)
                          (SEQ (LETT |x| NIL . #11#) (LETT #3# |lz| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |x| (CAR #3#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |x| |lpars0| |lpars1f|
                                                   (QREFELT $ 119))
                                         (QREFELT $ 98))
                                        #4#)
                                       . #11#)))
                               (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         . #11#)
                   (EXIT
                    (LETT |nz|
                          (SPADCALL
                           (SPADCALL |z| |lpars0| |lpars1f| (QREFELT $ 119))
                           (QREFELT $ 98))
                          . #11#))))
                 ((NULL (SPADCALL |ker| '|atan| (QREFELT $ 30)))
                  (|error|
                   "findLinearRelation2: kernel should be log or atan"))
                 ('T
                  (SEQ
                   (LETT |ly|
                         (PROGN
                          (LETT #2# NIL . #11#)
                          (SEQ (LETT |x| NIL . #11#) (LETT #1# |lz| . #11#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |x| (CAR #1#) . #11#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |x| |lpars0| |lpars1f|
                                                   (QREFELT $ 119))
                                         (QREFELT $ 120))
                                        #2#)
                                       . #11#)))
                               (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #11#)
                   (EXIT
                    (LETT |nz|
                          (SPADCALL
                           (SPADCALL |z| |lpars0| |lpars1f| (QREFELT $ 119))
                           (QREFELT $ 120))
                          . #11#)))))
                (EXIT (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
      #9# (EXIT #9#))))) 

(DEFUN |EFSTRUC;findRelation| (|lv| |lpar| |lk| |ker| $)
  (PROG (#1=#:G399 |x| #2=#:G398)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |ker| '|log| (QREFELT $ 30))
            (SPADCALL |ker| '|exp| (QREFELT $ 30)))
        (COND
         ((NULL (SPADCALL (SPADCALL |ker| (QREFELT $ 97)) (QREFELT $ 22)))
          (COND
           ((SPADCALL |ker| '|exp| (QREFELT $ 30))
            (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toY| |lk| $)
             (|EFSTRUC;ktoY| |ker| $) $))
           (#3='T
            (|EFSTRUC;findLinearRelation2| |lk| (|EFSTRUC;toZ| |lk| $) |ker|
             $))))
         (#3#
          (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toY| |lk| $)
           (|EFSTRUC;ktoY| |ker| $) $))))
       ((OR (SPADCALL |ker| '|atan| (QREFELT $ 30))
            (SPADCALL |ker| '|tan| (QREFELT $ 30)))
        (COND
         ((NULL (SPADCALL (SPADCALL |ker| (QREFELT $ 97)) (QREFELT $ 22)))
          (COND
           ((SPADCALL |ker| '|tan| (QREFELT $ 30))
            (|EFSTRUC;findLinearRelation1| (|EFSTRUC;toU| |lk| $)
             (|EFSTRUC;ktoU| |ker| $) $))
           (#3#
            (|EFSTRUC;findLinearRelation2| |lk| (|EFSTRUC;toV| |lk| $) |ker|
             $))))
         (#3#
          (|EFSTRUC;findQRelation| |lv| |lpar| (|EFSTRUC;toU| |lk| $)
           (|EFSTRUC;ktoU| |ker| $) $))))
       ('T
        (COND
         ((SPADCALL |ker| '|nthRoot| (QREFELT $ 30))
          (|EFSTRUC;rootDep| |lk| |ker| $))
         (#3#
          (SEQ
           (COND
            ((QREFELT $ 10)
             (COND
              ((SPADCALL |ker| '|factorial| (QREFELT $ 30))
               (EXIT
                (|EFSTRUC;factdeprel|
                 (PROGN
                  (LETT #2# NIL . #4=(|EFSTRUC;findRelation|))
                  (SEQ (LETT |x| NIL . #4#) (LETT #1# |lk| . #4#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((COND
                            ((SPADCALL |x| '|factorial| (QREFELT $ 30))
                             (SPADCALL |x| |ker| (QREFELT $ 121)))
                            (#3# 'NIL))
                           (LETT #2# (CONS |x| #2#) . #4#)))))
                       (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 |ker| $))))))
           (EXIT (CONS 2 'T))))))))))) 

(DEFUN |EFSTRUC;ktoY| (|k| $)
  (COND ((SPADCALL |k| '|log| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 97)))
        ((SPADCALL |k| '|exp| (QREFELT $ 30))
         (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
        ('T (|spadConstant| $ 26)))) 

(DEFUN |EFSTRUC;ktoZ| (|k| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 30))
    (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
   ((SPADCALL |k| '|exp| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 97)))
   ('T (|spadConstant| $ 26)))) 

(DEFUN |EFSTRUC;ktoU| (|k| $)
  (COND ((SPADCALL |k| '|atan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 97)))
        ((SPADCALL |k| '|tan| (QREFELT $ 30))
         (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
        ('T (|spadConstant| $ 26)))) 

(DEFUN |EFSTRUC;ktoV| (|k| $)
  (COND ((SPADCALL |k| '|tan| (QREFELT $ 30)) (SPADCALL |k| (QREFELT $ 97)))
        ((SPADCALL |k| '|atan| (QREFELT $ 30))
         (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))))
        ('T (|spadConstant| $ 26)))) 

(DEFUN |EFSTRUC;smp_map| (|f| |p| $)
  (SPADCALL |f| (ELT $ 122) |p| (QREFELT $ 126))) 

(DEFUN |EFSTRUC;rmap;M2F;28| (|f| |e| $)
  (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 128)) $)
            (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 129)) $)
            (QREFELT $ 15))) 

(DEFUN |EFSTRUC;k2Elem0| (|k| |op| |args| $)
  (PROG (|tz2| |iez| |ez| |z|)
    (RETURN
     (SEQ (LETT |z| (|SPADfirst| |args|) . #1=(|EFSTRUC;k2Elem0|))
          (EXIT
           (COND
            ((SPADCALL |op| '|%power| (QREFELT $ 135))
             (COND ((SPADCALL |z| (QREFELT $ 136)) (|spadConstant| $ 26))
                   (#2='T
                    (SPADCALL
                     (SPADCALL (SPADCALL |args| (QREFELT $ 137))
                               (SPADCALL |z| (QREFELT $ 98)) (QREFELT $ 115))
                     (QREFELT $ 138)))))
            ((SPADCALL |op| '|cot| (QREFELT $ 135))
             (SPADCALL (SPADCALL |z| (QREFELT $ 56)) (QREFELT $ 55)))
            ((SPADCALL |op| '|acot| (QREFELT $ 135))
             (SPADCALL (SPADCALL |z| (QREFELT $ 55)) (QREFELT $ 120)))
            ((SPADCALL |op| '|asin| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 62)
                                   (SPADCALL |z| 2 (QREFELT $ 139))
                                   (QREFELT $ 140))
                         (QREFELT $ 141))
                        (QREFELT $ 15))
              (QREFELT $ 120)))
            ((SPADCALL |op| '|acos| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 62)
                          (SPADCALL |z| 2 (QREFELT $ 139)) (QREFELT $ 140))
                (QREFELT $ 141))
               |z| (QREFELT $ 15))
              (QREFELT $ 120)))
            ((SPADCALL |op| '|asec| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139)) (|spadConstant| $ 62)
                         (QREFELT $ 140))
               (QREFELT $ 141))
              (QREFELT $ 120)))
            ((SPADCALL |op| '|acsc| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                          (|spadConstant| $ 62) (QREFELT $ 140))
                (QREFELT $ 141))
               (QREFELT $ 55))
              (QREFELT $ 120)))
            ((SPADCALL |op| '|asinh| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 62)
                          (SPADCALL |z| 2 (QREFELT $ 139)) (QREFELT $ 142))
                (QREFELT $ 141))
               |z| (QREFELT $ 142))
              (QREFELT $ 98)))
            ((SPADCALL |op| '|acosh| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                          (|spadConstant| $ 62) (QREFELT $ 140))
                (QREFELT $ 141))
               |z| (QREFELT $ 142))
              (QREFELT $ 98)))
            ((SPADCALL |op| '|atanh| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 142))
                         (SPADCALL (|spadConstant| $ 62) |z| (QREFELT $ 140))
                         (QREFELT $ 15))
               (QREFELT $ 98))
              (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
            ((SPADCALL |op| '|acoth| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 142))
                         (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 140))
                         (QREFELT $ 15))
               (QREFELT $ 98))
              (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
            ((SPADCALL |op| '|asech| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                                    (QREFELT $ 55))
                          (|spadConstant| $ 62) (QREFELT $ 140))
                         (QREFELT $ 141))
                        (QREFELT $ 142))
              (QREFELT $ 98)))
            ((SPADCALL |op| '|acsch| (QREFELT $ 135))
             (SPADCALL
              (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 62)
                                   (SPADCALL (SPADCALL |z| 2 (QREFELT $ 139))
                                             (QREFELT $ 55))
                                   (QREFELT $ 142))
                         (QREFELT $ 141))
                        (QREFELT $ 142))
              (QREFELT $ 98)))
            ((OR (SPADCALL |op| '|%paren| (QREFELT $ 135))
                 (SPADCALL |op| '|%box| (QREFELT $ 135)))
             (COND ((NULL (CDR |args|)) |z|)
                   (#2# (SPADCALL |k| (QREFELT $ 97)))))
            ('T
             (SEQ
              (COND
               ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 86))
                (LETT |iez|
                      (SPADCALL
                       (LETT |ez| (SPADCALL |z| (QREFELT $ 138)) . #1#)
                       (QREFELT $ 55))
                      . #1#)))
              (EXIT
               (COND
                ((SPADCALL |op| '|sinh| (QREFELT $ 135))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 140))
                           (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                ((SPADCALL |op| '|cosh| (QREFELT $ 135))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 142))
                           (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                ((SPADCALL |op| '|tanh| (QREFELT $ 135))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 140))
                           (SPADCALL |ez| |iez| (QREFELT $ 142))
                           (QREFELT $ 15)))
                ((SPADCALL |op| '|coth| (QREFELT $ 135))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 142))
                           (SPADCALL |ez| |iez| (QREFELT $ 140))
                           (QREFELT $ 15)))
                ((SPADCALL |op| '|sech| (QREFELT $ 135))
                 (SPADCALL 2
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 142))
                                     (QREFELT $ 55))
                           (QREFELT $ 143)))
                ((SPADCALL |op| '|csch| (QREFELT $ 135))
                 (SPADCALL 2
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 140))
                                     (QREFELT $ 55))
                           (QREFELT $ 143)))
                (#2#
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 86))
                    (LETT |tz2|
                          (SPADCALL
                           (SPADCALL |z| (SPADCALL 2 (QREFELT $ 13))
                                     (QREFELT $ 15))
                           (QREFELT $ 56))
                          . #1#)))
                  (EXIT
                   (COND
                    ((SPADCALL |op| '|sin| (QREFELT $ 135))
                     (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 143))
                               (SPADCALL (|spadConstant| $ 62)
                                         (SPADCALL |tz2| 2 (QREFELT $ 139))
                                         (QREFELT $ 142))
                               (QREFELT $ 15)))
                    ((SPADCALL |op| '|cos| (QREFELT $ 135))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 139))
                                (QREFELT $ 140))
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 139))
                                (QREFELT $ 142))
                      (QREFELT $ 15)))
                    ((SPADCALL |op| '|sec| (QREFELT $ 135))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 139))
                                (QREFELT $ 142))
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 139))
                                (QREFELT $ 140))
                      (QREFELT $ 15)))
                    ((SPADCALL |op| '|csc| (QREFELT $ 135))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 139))
                                (QREFELT $ 142))
                      (SPADCALL 2 |tz2| (QREFELT $ 143)) (QREFELT $ 15)))
                    (#2# (SPADCALL |op| |args| (QREFELT $ 145))))))))))))))))) 

(DEFUN |EFSTRUC;do_int| (|op| |args| $)
  (PROG (|dvs| #1=#:G458 |v| #2=#:G457 |vfs| #3=#:G456 #4=#:G455 |vars| |kf1|)
    (RETURN
     (SEQ
      (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 145))
            . #5=(|EFSTRUC;do_int|))
      (LETT |vars| (SPADCALL |kf1| (QREFELT $ 22)) . #5#)
      (LETT |vfs|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |v| NIL . #5#) (LETT #3# |vars| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 146)) #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |dvs|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |v| NIL . #5#) (LETT #1# |vars| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 147))
                                     (QREFELT $ 24))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT
       (SPADCALL (QREFELT $ 134) (SPADCALL |vfs| |dvs| (QREFELT $ 66))
                 (QREFELT $ 148))))))) 

(DEFUN |EFSTRUC;k_to_liou| (|k| $)
  (PROG (#1=#:G469 #2=#:G466 |i| |iu| |nm| |args| #3=#:G473 |a| #4=#:G472 |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 85)) . #5=(|EFSTRUC;k_to_liou|))
          (LETT |args|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #3# (SPADCALL |k| (QREFELT $ 32)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 24)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 97)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 86))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 135)))
                         (EXIT (|EFSTRUC;do_int| |op| |args| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 149)) . #5#)
                     (COND
                      ((EQUAL |nm| '|polylog|)
                       (SEQ
                        (LETT |iu|
                              (SPADCALL (|SPADfirst| |args|) (QREFELT $ 53))
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |iu| 0)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (SEQ (LETT |i| (QCDR |iu|) . #5#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| 0 (QREFELT $ 111))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #2#))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #2# (EXIT #2#))
                                  . #5#)
                            (GO #1#))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #1# (EXIT #1#))))))))) 

(DEFUN |EFSTRUC;do_int1| (|op| |args| |x| $)
  (PROG (|dvs| #1=#:G481 |v| #2=#:G480 |vfs| #3=#:G479 #4=#:G478 |vars| |kf1|)
    (RETURN
     (SEQ
      (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 145))
            . #5=(|EFSTRUC;do_int1|))
      (LETT |vars| (LIST |x|) . #5#)
      (LETT |vfs|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |v| NIL . #5#) (LETT #3# |vars| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 146)) #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |dvs|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |v| NIL . #5#) (LETT #1# |vars| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 147)) |x|
                                     (QREFELT $ 25))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT
       (SPADCALL (QREFELT $ 134) (SPADCALL |vfs| |dvs| (QREFELT $ 66))
                 (QREFELT $ 148))))))) 

(DEFUN |EFSTRUC;k_to_liou1| (|k| |x| $)
  (PROG (#1=#:G501 #2=#:G491 |i| |iu| |nm| |args| #3=#:G505 |a| #4=#:G504 |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 85)) . #5=(|EFSTRUC;k_to_liou1|))
          (LETT |args|
                (PROGN
                 (LETT #4# NIL . #5#)
                 (SEQ (LETT |a| NIL . #5#)
                      (LETT #3# (SPADCALL |k| (QREFELT $ 32)) . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4# (CONS (SPADCALL |a| |x| (QREFELT $ 25)) #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #5#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 97)))
                 ('T
                  (SEQ
                   (EXIT
                    (SEQ
                     (COND
                      ((SPADCALL |op| '|prim| (QREFELT $ 86))
                       (COND
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 135)))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 149)) . #5#)
                     (COND
                      ((EQUAL |nm| '|Gamma2|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| |args|) |x| (QREFELT $ 147))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|polylog|)
                       (SEQ
                        (LETT |iu|
                              (SPADCALL (|SPADfirst| |args|) (QREFELT $ 53))
                              . #5#)
                        (EXIT
                         (COND
                          ((QEQCAR |iu| 0)
                           (PROGN
                            (LETT #1#
                                  (SEQ
                                   (EXIT
                                    (SEQ
                                     (SEQ (LETT |i| (QCDR |iu|) . #5#)
                                          (EXIT
                                           (COND
                                            ((SPADCALL |i| 0 (QREFELT $ 111))
                                             (COND
                                              ((< |i| 10)
                                               (PROGN
                                                (LETT #2#
                                                      (|EFSTRUC;do_int| |op|
                                                       |args| $)
                                                      . #5#)
                                                (GO #2#))))))))
                                     (EXIT
                                      (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                                   #2# (EXIT #2#))
                                  . #5#)
                            (GO #1#))))))))
                     (COND
                      ((OR (EQUAL |nm| '|ellipticE2|)
                           (EQUAL |nm| '|ellipticF|))
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 87)) |x|
                                    (QREFELT $ 147))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|ellipticPi|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 87)) |x|
                                    (QREFELT $ 147))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |args| 3 (QREFELT $ 87)) |x|
                                      (QREFELT $ 147))
                            (|spadConstant| $ 26) (QREFELT $ 34))
                           (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #1# (EXIT #1#))))))))) 

(DEFUN |EFSTRUC;k2Elem| (|k| |l| $)
  (PROG (|args| #1=#:G510 |a| #2=#:G509 |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 85)) . #3=(|EFSTRUC;k2Elem|))
          (LETT |args|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |a| NIL . #3#)
                      (LETT #1# (SPADCALL |k| (QREFELT $ 32)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|EFSTRUC;realElem| |a| |l| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((NULL |args|) (SPADCALL |k| (QREFELT $ 97)))
                 ('T (|EFSTRUC;k2Elem0| |k| |op| |args| $)))))))) 

(DEFUN |EFSTRUC;depeval| (|f| |lk| |k| |v| $)
  (COND
   ((SPADCALL |k| '|log| (QREFELT $ 30))
    (|EFSTRUC;logeval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|exp| (QREFELT $ 30))
    (|EFSTRUC;expeval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|tan| (QREFELT $ 30))
    (|EFSTRUC;taneval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|atan| (QREFELT $ 30))
    (|EFSTRUC;ataneval| |f| |lk| |k| |v| $))
   ((SPADCALL |k| '|nthRoot| (QREFELT $ 30))
    (|EFSTRUC;rooteval| |f| |lk| |k|
     (SPADCALL |v| (SPADCALL |v| (QREFELT $ 150)) (QREFELT $ 151)) $))
   ('T (VECTOR |f| NIL NIL)))) 

(DEFUN |EFSTRUC;rooteval| (|f| |lk| |k| |n| $)
  (PROG (|lv| #1=#:G526 |r| #2=#:G525 |l| #3=#:G524 #4=#:G523 |nv| |m| |x|)
    (RETURN
     (SEQ
      (LETT |nv|
            (SPADCALL
             (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                   . #5=(|EFSTRUC;rooteval|))
             (LETT |m| (SPADCALL |n| (QREFELT $ 152)) . #5#) (QREFELT $ 153))
            . #5#)
      (LETT |l|
            (PROGN
             (LETT #4# NIL . #5#)
             (SEQ (LETT |r| NIL . #5#)
                  (LETT #3# (CONS |k| (|EFSTRUC;toR| |lk| |x| $)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |r| (QREFELT $ 32))
                                  (QREFELT $ 154))
                        (QREFELT $ 155))
                       |m| (QREFELT $ 156))
                      (LETT #4# (CONS |r| #4#) . #5#)))))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |lv|
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |r| NIL . #5#) (LETT #1# |l| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL |nv|
                                     (SPADCALL |n|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |r| (QREFELT $ 32))
                                                  (QREFELT $ 154))
                                                 (QREFELT $ 155))
                                                (QREFELT $ 157))
                                               (QREFELT $ 158))
                                     (QREFELT $ 159))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT (VECTOR (SPADCALL |f| |l| |lv| (QREFELT $ 119)) |l| |lv|)))))) 

(DEFUN |EFSTRUC;ataneval| (|f| |lk| |k| |v| $)
  (PROG (|g| |h| |d| #1=#:G530 #2=#:G529 #3=#:G531 #4=#:G538 |i| #5=#:G539 |x|
         |s| #6=#:G536 #7=#:G537 #8=#:G535 |w|)
    (RETURN
     (SEQ
      (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
            . #9=(|EFSTRUC;ataneval|))
      (LETT |s|
            (SPADCALL
             (PROGN
              (LETT #8# NIL . #9#)
              (SEQ (LETT |x| NIL . #9#) (LETT #7# (|EFSTRUC;toV| |lk| $) . #9#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #9#)
                   (LETT #6# (QVSIZE |v|) . #9#) G190
                   (COND
                    ((OR (> |i| #6#) (ATOM #7#)
                         (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #8#
                           (CONS
                            (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 51))
                            #8#)
                           . #9#)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT (NREVERSE #8#))))
             (QREFELT $ 54))
            . #9#)
      (LETT |g|
            (PROGN
             (LETT #1# NIL . #9#)
             (SEQ (LETT |x| NIL . #9#) (LETT #5# (|EFSTRUC;toU| |lk| $) . #9#)
                  (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #9#)
                  (LETT #4# (QVSIZE |v|) . #9#) G190
                  (COND
                   ((OR (> |i| #4#) (ATOM #5#)
                        (PROGN (LETT |x| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 160))
                           . #9#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 142)) . #9#))
                      ('T (PROGN (LETT #2# #3# . #9#) (LETT #1# 'T . #9#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #9#)) . #9#)
                  (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#10='T (|spadConstant| $ 26))))
            . #9#)
      (LETT |h|
            (COND
             ((SPADCALL
               (LETT |d|
                     (SPADCALL (|spadConstant| $ 62)
                               (SPADCALL |s| |w| (QREFELT $ 115))
                               (QREFELT $ 142))
                     . #9#)
               (QREFELT $ 136))
              (QREFELT $ 16))
             (#10#
              (SPADCALL
               (SPADCALL (SPADCALL |w| |s| (QREFELT $ 140)) |d| (QREFELT $ 15))
               (QREFELT $ 120))))
            . #9#)
      (LETT |g| (SPADCALL |g| |h| (QREFELT $ 142)) . #9#)
      (EXIT
       (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 119)) (LIST |k|)
               (LIST |g|))))))) 

(DEFUN |EFSTRUC;gdCoef?| (|c| |v| $)
  (PROG (#1=#:G544 #2=#:G546 #3=#:G547 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #4=(|EFSTRUC;gdCoef?|))
           (LETT #3# (QVSIZE |v|) . #4#) G190 (COND ((> |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((QEQCAR
                (SPADCALL (SPADCALL (QAREF1O |v| |i| 1) |c| (QREFELT $ 158))
                          (QREFELT $ 161))
                1)
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;goodCoef| (|v| |l| |s| $)
  (PROG (#1=#:G575 #2=#:G577 |r| #3=#:G581 |i| #4=#:G582 |k| |h| |j| |h1|
         #5=#:G579 #6=#:G580 |ll| #7=#:G578)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |h| 0 . #8=(|EFSTRUC;goodCoef|)) (LETT |j| 0 . #8#)
            (LETT |ll| NIL . #8#)
            (SEQ (LETT |k| NIL . #8#) (LETT #7# |l| . #8#) G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((OR (SPADCALL |k| '|log| (QREFELT $ 30))
                         (OR (SPADCALL |k| '|exp| (QREFELT $ 30))
                             (OR (SPADCALL |k| '|tan| (QREFELT $ 30))
                                 (SPADCALL |k| '|atan| (QREFELT $ 30)))))
                     (SEQ (LETT |ll| (CONS |k| |ll|) . #8#)
                          (EXIT (LETT |h| (+ |h| 1) . #8#)))))))
                 (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
            (COND
             ((NULL
               (EQL |h| (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 150))) 1)))
              (EXIT (CONS 1 "failed"))))
            (LETT |h| 0 . #8#) (LETT |ll| (REVERSE |ll|) . #8#)
            (SEQ (LETT |k| NIL . #8#) (LETT #6# |ll| . #8#)
                 (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #8#)
                 (LETT #5# (QVSIZE |v|) . #8#) G190
                 (COND
                  ((OR (> |i| #5#) (ATOM #6#)
                       (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                   (GO G191)))
                 (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 162)) . #8#)
                      (EXIT
                       (COND
                        ((SPADCALL |h1| |h| (QREFELT $ 163))
                         (SEQ (LETT |j| |i| . #8#)
                              (EXIT (LETT |h| |h1| . #8#)))))))
                 (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#)) . #8#)
                 (GO G190) G191 (EXIT NIL))
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #8#) (LETT #4# |ll| . #8#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #8#)
                   (LETT #3# (QVSIZE |v|) . #8#) G190
                   (COND
                    ((OR (> |i| #3#) (ATOM #4#)
                         (PROGN (LETT |k| (CAR #4#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| |s| (QREFELT $ 30))
                       (COND
                        ((>= |i| |j|)
                         (SEQ
                          (LETT |r|
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 165))
                                . #8#)
                          (EXIT
                           (COND
                            ((QEQCAR |r| 0)
                             (COND
                              ((QEQCAR (SPADCALL (QCDR |r|) (QREFELT $ 161)) 0)
                               (COND
                                ((|EFSTRUC;gdCoef?| (QAREF1O |v| |i| 1) |v| $)
                                 (PROGN
                                  (LETT #1#
                                        (PROGN
                                         (LETT #2# (CONS 0 (CONS |i| |k|))
                                               . #8#)
                                         (GO #2#))
                                        . #8#)
                                  (GO #1#))))))))))))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#) . #8#))
                         . #8#)
                   (GO G190) G191 (EXIT NIL)))
             #1# (EXIT #1#))
            (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;taneval| (|f| |lk| |k| |v| $)
  (PROG (|g| #1=#:G604 |a| #2=#:G605 |x| #3=#:G603 |l| #4=#:G602 |kk| #5=#:G601
         |lv| #6=#:G600 |i| #7=#:G599 |v0| |rec| |c| #8=#:G585 #9=#:G584
         #10=#:G586 #11=#:G597 #12=#:G598 |fns| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
            . #13=(|EFSTRUC;taneval|))
      (LETT |fns| (|EFSTRUC;toU| |lk| $) . #13#)
      (LETT |c|
            (SPADCALL |u|
                      (PROGN
                       (LETT #8# NIL . #13#)
                       (SEQ (LETT |x| NIL . #13#) (LETT #12# |fns| . #13#)
                            (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                            (LETT #11# (QVSIZE |v|) . #13#) G190
                            (COND
                             ((OR (> |i| #11#) (ATOM #12#)
                                  (PROGN (LETT |x| (CAR #12#) . #13#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #10#
                                     (SPADCALL (QAREF1O |v| |i| 1) |x|
                                               (QREFELT $ 160))
                                     . #13#)
                               (COND
                                (#8#
                                 (LETT #9# (SPADCALL #9# #10# (QREFELT $ 142))
                                       . #13#))
                                ('T
                                 (PROGN
                                  (LETT #9# #10# . #13#)
                                  (LETT #8# 'T . #13#)))))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT #12# (CDR #12#) . #13#))
                                  . #13#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#8# #9#) (#14='T (|spadConstant| $ 26))))
                      (QREFELT $ 140))
            . #13#)
      (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $) . #13#)
      (EXIT
       (COND
        ((QEQCAR |rec| 1) (|EFSTRUC;tannosimp| |f| |lk| |k| |v| |fns| |c| $))
        (#14#
         (SEQ
          (LETT |v0|
                (SPADCALL
                 (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1) (QREFELT $ 166))
                 (QREFELT $ 152))
                . #13#)
          (LETT |lv|
                (PROGN
                 (LETT #7# NIL . #13#)
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                      (LETT #6# (QVSIZE |v|) . #13#) G190
                      (COND ((> |i| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| (QCAR (QCDR |rec|)) (QREFELT $ 156))
                          (LETT #7# (CONS (QAREF1O |v| |i| 1) #7#) . #13#)))))
                      (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #13#)
          (LETT |l|
                (PROGN
                 (LETT #5# NIL . #13#)
                 (SEQ (LETT |kk| NIL . #13#) (LETT #4# |lk| . #13#) G190
                      (COND
                       ((OR (ATOM #4#)
                            (PROGN (LETT |kk| (CAR #4#) . #13#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |kk| (QCDR (QCDR |rec|)) (QREFELT $ 121))
                          (LETT #5# (CONS |kk| #5#) . #13#)))))
                      (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #13#)
          (LETT |g|
                (|EFSTRUC;tanSum|
                 (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 167)) (QREFELT $ 14))
                 (CONS
                  (SPADCALL (SPADCALL |k| (QREFELT $ 97)) |v0| (QREFELT $ 50))
                  (PROGN
                   (LETT #3# NIL . #13#)
                   (SEQ (LETT |x| NIL . #13#)
                        (LETT #2# (|EFSTRUC;toV| |l| $) . #13#)
                        (LETT |a| NIL . #13#) (LETT #1# |lv| . #13#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |a| (CAR #1#) . #13#) NIL)
                              (ATOM #2#)
                              (PROGN (LETT |x| (CAR #2#) . #13#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #3#
                                (CONS
                                 (SPADCALL |x|
                                           (-
                                            (SPADCALL
                                             (SPADCALL |a| |v0|
                                                       (QREFELT $ 168))
                                             (QREFELT $ 152)))
                                           (QREFELT $ 50))
                                 #3#)
                                . #13#)))
                        (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #13#))
                              . #13#)
                        (GO G190) G191 (EXIT (NREVERSE #3#)))))
                 $)
                . #13#)
          (EXIT
           (VECTOR
            (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |g|)
                      (QREFELT $ 119))
            (LIST (QCDR (QCDR |rec|))) (LIST |g|))))))))))) 

(DEFUN |EFSTRUC;tannosimp| (|f| |lk| |k| |v| |fns| |c| $)
  (PROG (|h| |i| #1=#:G638 |x| #2=#:G637 |lk1| |newtan| #3=#:G635 #4=#:G636 |t|
         #5=#:G634 |li| #6=#:G633 #7=#:G632 #8=#:G631 |newt| #9=#:G630 |u|
         #10=#:G629 |dd| |d| |cd| #11=#:G628 #12=#:G627 #13=#:G626 #14=#:G625
         |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #15=(|EFSTRUC;tannosimp|))
          (LETT |lk|
                (PROGN
                 (LETT #14# NIL . #15#)
                 (SEQ (LETT |x| NIL . #15#) (LETT #13# |lk| . #15#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |x| (CAR #13#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |x| '|tan| (QREFELT $ 30)) 'T)
                                (#16='T (SPADCALL |x| '|atan| (QREFELT $ 30))))
                          (LETT #14# (CONS |x| #14#) . #15#)))))
                      (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #15#)
          (LETT |lk1|
                (PROGN
                 (LETT #12# NIL . #15#)
                 (SEQ (LETT |i| 1 . #15#) (LETT |x| NIL . #15#)
                      (LETT #11# |lk| . #15#) G190
                      (COND
                       ((OR (ATOM #11#)
                            (PROGN (LETT |x| (CAR #11#) . #15#) NIL)
                            (|greater_SI| |i| |n|))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL (QAREF1O |v| |i| 1)
                                      (|spadConstant| $ 169) (QREFELT $ 91))
                            'NIL)
                           (#16# 'T))
                          (LETT #12# (CONS |x| #12#) . #15#)))))
                      (LETT #11#
                            (PROG1 (CDR #11#) (LETT |i| (|inc_SI| |i|) . #15#))
                            . #15#)
                      (GO G190) G191 (EXIT (NREVERSE #12#))))
                . #15#)
          (EXIT
           (COND
            ((SPADCALL (CONS #'|EFSTRUC;tannosimp!0| $) |lk1| (QREFELT $ 170))
             (SEQ
              (LETT |dd|
                    (SPADCALL
                     (LETT |d|
                           (QCDR
                            (LETT |cd| (SPADCALL |v| (QREFELT $ 173)) . #15#))
                           . #15#)
                     (QREFELT $ 13))
                    . #15#)
              (LETT |newt|
                    (PROGN
                     (LETT #10# NIL . #15#)
                     (SEQ (LETT |i| 1 . #15#) (LETT |u| NIL . #15#)
                          (LETT #9# |fns| . #15#) G190
                          (COND
                           ((OR (ATOM #9#)
                                (PROGN (LETT |u| (CAR #9#) . #15#) NIL)
                                (|greater_SI| |i| |n|))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 169)
                                          (QREFELT $ 91))
                                'NIL)
                               (#16# 'T))
                              (LETT #10#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |u| |dd| (QREFELT $ 15))
                                      (QREFELT $ 56))
                                     #10#)
                                    . #15#)))))
                          (LETT #9#
                                (PROG1 (CDR #9#)
                                  (LETT |i| (|inc_SI| |i|) . #15#))
                                . #15#)
                          (GO G190) G191 (EXIT (NREVERSE #10#))))
                    . #15#)
              (LETT |newtan|
                    (PROGN
                     (LETT #8# NIL . #15#)
                     (SEQ (LETT |t| NIL . #15#) (LETT #7# |newt| . #15#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |t| (CAR #7#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |t| |d| (QREFELT $ 50)) #8#)
                                  . #15#)))
                          (LETT #7# (CDR #7#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    . #15#)
              (LETT |li|
                    (PROGN
                     (LETT #6# NIL . #15#)
                     (SEQ (LETT |i| 1 . #15#) G190
                          (COND ((|greater_SI| |i| |n|) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 169)
                                          (QREFELT $ 91))
                                'NIL)
                               (#16# 'T))
                              (LETT #6# (CONS |i| #6#) . #15#)))))
                          (LETT |i| (|inc_SI| |i|) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    . #15#)
              (LETT |h|
                    (|EFSTRUC;tanSum| |c|
                     (PROGN
                      (LETT #5# NIL . #15#)
                      (SEQ (LETT |t| NIL . #15#) (LETT #4# |newt| . #15#)
                           (LETT |i| NIL . #15#) (LETT #3# |li| . #15#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |i| (CAR #3#) . #15#) NIL)
                                 (ATOM #4#)
                                 (PROGN (LETT |t| (CAR #4#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #5#
                                   (CONS
                                    (SPADCALL |t| (QAREF1O (QCAR |cd|) |i| 1)
                                              (QREFELT $ 50))
                                    #5#)
                                   . #15#)))
                           (LETT #3#
                                 (PROG1 (CDR #3#) (LETT #4# (CDR #4#) . #15#))
                                 . #15#)
                           (GO G190) G191 (EXIT (NREVERSE #5#))))
                     $)
                    . #15#)
              (LETT |newtan| (CONS |h| |newtan|) . #15#)
              (LETT |lk1| (CONS |k| |lk1|) . #15#)
              (EXIT
               (VECTOR (SPADCALL |f| |lk1| |newtan| (QREFELT $ 119)) |lk1|
                       |newtan|))))
            (#16#
             (SEQ
              (LETT |h|
                    (|EFSTRUC;tanSum| |c|
                     (PROGN
                      (LETT #2# NIL . #15#)
                      (SEQ (LETT |x| NIL . #15#)
                           (LETT #1# (|EFSTRUC;toV| |lk| $) . #15#)
                           (LETT |i| 1 . #15#) G190
                           (COND
                            ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                                 (PROGN (LETT |x| (CAR #1#) . #15#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL (QAREF1O |v| |i| 1) |x|
                                              (QREFELT $ 51))
                                    #2#)
                                   . #15#)))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #1# (CDR #1#) . #15#))
                                 . #15#)
                           (GO G190) G191 (EXIT (NREVERSE #2#))))
                     $)
                    . #15#)
              (EXIT
               (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 119))
                       (LIST |k|) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;tannosimp!0| (|x| $) (SPADCALL |x| '|tan| (QREFELT $ 30))) 

(DEFUN |EFSTRUC;expnosimp| (|f| |lk| |k| |v| |fns| |g| $)
  (PROG (|h| #1=#:G735 #2=#:G734 #3=#:G736 #4=#:G751 |i| #5=#:G752 |y| |newexp|
         |lk1| #6=#:G692 #7=#:G691 #8=#:G693 #9=#:G749 #10=#:G750 |e| |li|
         #11=#:G748 #12=#:G747 #13=#:G746 |newe| #14=#:G745 #15=#:G744 |dd| |d|
         |cd| #16=#:G743 |x| #17=#:G742 #18=#:G741 #19=#:G740 |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |v|) . #20=(|EFSTRUC;expnosimp|))
          (LETT |lk|
                (PROGN
                 (LETT #19# NIL . #20#)
                 (SEQ (LETT |x| NIL . #20#) (LETT #18# |lk| . #20#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |x| (CAR #18#) . #20#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND ((SPADCALL |x| '|exp| (QREFELT $ 30)) 'T)
                                (#21='T (SPADCALL |x| '|log| (QREFELT $ 30))))
                          (LETT #19# (CONS |x| #19#) . #20#)))))
                      (LETT #18# (CDR #18#) . #20#) (GO G190) G191
                      (EXIT (NREVERSE #19#))))
                . #20#)
          (LETT |lk1|
                (PROGN
                 (LETT #17# NIL . #20#)
                 (SEQ (LETT |i| 1 . #20#) (LETT |x| NIL . #20#)
                      (LETT #16# |lk| . #20#) G190
                      (COND
                       ((OR (ATOM #16#)
                            (PROGN (LETT |x| (CAR #16#) . #20#) NIL)
                            (|greater_SI| |i| |n|))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((SPADCALL (QAREF1O |v| |i| 1)
                                      (|spadConstant| $ 169) (QREFELT $ 91))
                            'NIL)
                           (#21# 'T))
                          (LETT #17# (CONS |x| #17#) . #20#)))))
                      (LETT #16#
                            (PROG1 (CDR #16#) (LETT |i| (|inc_SI| |i|) . #20#))
                            . #20#)
                      (GO G190) G191 (EXIT (NREVERSE #17#))))
                . #20#)
          (EXIT
           (COND
            ((SPADCALL (CONS #'|EFSTRUC;expnosimp!0| $) |lk1| (QREFELT $ 170))
             (SEQ
              (LETT |dd|
                    (SPADCALL
                     (LETT |d|
                           (QCDR
                            (LETT |cd| (SPADCALL |v| (QREFELT $ 173)) . #20#))
                           . #20#)
                     (QREFELT $ 13))
                    . #20#)
              (LETT |newe|
                    (PROGN
                     (LETT #15# NIL . #20#)
                     (SEQ (LETT |i| 1 . #20#) (LETT |y| NIL . #20#)
                          (LETT #14# |fns| . #20#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |y| (CAR #14#) . #20#) NIL)
                                (|greater_SI| |i| |n|))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 169)
                                          (QREFELT $ 91))
                                'NIL)
                               (#21# 'T))
                              (LETT #15#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |y| |dd| (QREFELT $ 15))
                                      (QREFELT $ 138))
                                     #15#)
                                    . #20#)))))
                          (LETT #14#
                                (PROG1 (CDR #14#)
                                  (LETT |i| (|inc_SI| |i|) . #20#))
                                . #20#)
                          (GO G190) G191 (EXIT (NREVERSE #15#))))
                    . #20#)
              (LETT |newexp|
                    (PROGN
                     (LETT #13# NIL . #20#)
                     (SEQ (LETT |e| NIL . #20#) (LETT #12# |newe| . #20#) G190
                          (COND
                           ((OR (ATOM #12#)
                                (PROGN (LETT |e| (CAR #12#) . #20#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |e| |d| (QREFELT $ 112))
                                        #13#)
                                  . #20#)))
                          (LETT #12# (CDR #12#) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #13#))))
                    . #20#)
              (LETT |li|
                    (PROGN
                     (LETT #11# NIL . #20#)
                     (SEQ (LETT |i| 1 . #20#) G190
                          (COND ((|greater_SI| |i| |n|) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((COND
                               ((SPADCALL (QAREF1O |v| |i| 1)
                                          (|spadConstant| $ 169)
                                          (QREFELT $ 91))
                                'NIL)
                               (#21# 'T))
                              (LETT #11# (CONS |i| #11#) . #20#)))))
                          (LETT |i| (|inc_SI| |i|) . #20#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #20#)
              (LETT |h|
                    (SPADCALL
                     (PROGN
                      (LETT #6# NIL . #20#)
                      (SEQ (LETT |e| NIL . #20#) (LETT #10# |newe| . #20#)
                           (LETT |i| NIL . #20#) (LETT #9# |li| . #20#) G190
                           (COND
                            ((OR (ATOM #9#)
                                 (PROGN (LETT |i| (CAR #9#) . #20#) NIL)
                                 (ATOM #10#)
                                 (PROGN (LETT |e| (CAR #10#) . #20#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #8#
                                    (SPADCALL |e| (QAREF1O (QCAR |cd|) |i| 1)
                                              (QREFELT $ 112))
                                    . #20#)
                              (COND
                               (#6#
                                (LETT #7# (SPADCALL #7# #8# (QREFELT $ 115))
                                      . #20#))
                               ('T
                                (PROGN
                                 (LETT #7# #8# . #20#)
                                 (LETT #6# 'T . #20#)))))))
                           (LETT #9#
                                 (PROG1 (CDR #9#)
                                   (LETT #10# (CDR #10#) . #20#))
                                 . #20#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#6# #7#) (#21# (|spadConstant| $ 62))))
                     |g| (QREFELT $ 115))
                    . #20#)
              (LETT |lk1| (CONS |k| |lk1|) . #20#)
              (LETT |newexp| (CONS |h| |newexp|) . #20#)
              (EXIT
               (VECTOR (SPADCALL |f| |lk1| |newexp| (QREFELT $ 119)) |lk1|
                       |newexp|))))
            (#21#
             (SEQ
              (LETT |h|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL . #20#)
                      (SEQ (LETT |y| NIL . #20#) (LETT #5# |fns| . #20#)
                           (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #20#)
                           (LETT #4# (QVSIZE |v|) . #20#) G190
                           (COND
                            ((OR (> |i| #4#) (ATOM #5#)
                                 (PROGN (LETT |y| (CAR #5#) . #20#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL (SPADCALL |y| (QREFELT $ 138))
                                              (QAREF1O |v| |i| 1)
                                              (QREFELT $ 159))
                                    . #20#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 115))
                                      . #20#))
                               ('T
                                (PROGN
                                 (LETT #2# #3# . #20#)
                                 (LETT #1# 'T . #20#)))))))
                           (LETT |i|
                                 (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #20#))
                                 . #20#)
                           (GO G190) G191 (EXIT NIL))
                      (COND (#1# #2#) (#21# (|spadConstant| $ 62))))
                     |g| (QREFELT $ 115))
                    . #20#)
              (EXIT
               (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 119))
                       (LIST |k|) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;expnosimp!0| (|x| $) (SPADCALL |x| '|exp| (QREFELT $ 30))) 

(DEFUN |EFSTRUC;logeval| (|f| |lk| |k| |v| $)
  (PROG (|g| #1=#:G765 #2=#:G764 #3=#:G766 #4=#:G773 |i| #5=#:G774 |x| |c|
         #6=#:G756 #7=#:G755 #8=#:G757 #9=#:G771 #10=#:G772 |dd| #11=#:G770
         #12=#:G769 |z|)
    (RETURN
     (SEQ
      (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
            . #13=(|EFSTRUC;logeval|))
      (LETT |dd|
            (SPADCALL
             (PROGN
              (LETT #12# NIL . #13#)
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                   (LETT #11# (QVSIZE |v|) . #13#) G190
                   (COND ((> |i| #11#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #12#
                           (CONS (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 40))
                                 #12#)
                           . #13#)))
                   (LETT |i| (+ |i| 1) . #13#) (GO G190) G191
                   (EXIT (NREVERSE #12#))))
             (QREFELT $ 174))
            . #13#)
      (LETT |c|
            (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 112))
                      (PROGN
                       (LETT #6# NIL . #13#)
                       (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                            (LETT #10# (QVSIZE |v|) . #13#)
                            (LETT |x| NIL . #13#)
                            (LETT #9# (|EFSTRUC;toZ| |lk| $) . #13#) G190
                            (COND
                             ((OR (ATOM #9#)
                                  (PROGN (LETT |x| (CAR #9#) . #13#) NIL)
                                  (> |i| #10#))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #8#
                                     (SPADCALL |x|
                                               (SPADCALL |dd|
                                                         (QAREF1O |v| |i| 1)
                                                         (QREFELT $ 175))
                                               (QREFELT $ 159))
                                     . #13#)
                               (COND
                                (#6#
                                 (LETT #7# (SPADCALL #7# #8# (QREFELT $ 115))
                                       . #13#))
                                ('T
                                 (PROGN
                                  (LETT #7# #8# . #13#)
                                  (LETT #6# 'T . #13#)))))))
                            (LETT #9#
                                  (PROG1 (CDR #9#) (LETT |i| (+ |i| 1) . #13#))
                                  . #13#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#6# #7#) (#14='T (|spadConstant| $ 62))))
                      (QREFELT $ 15))
            . #13#)
      (LETT |g|
            (SPADCALL
             (PROGN
              (LETT #1# NIL . #13#)
              (SEQ (LETT |x| NIL . #13#)
                   (LETT #5# (|EFSTRUC;toY| |lk| $) . #13#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #13#)
                   (LETT #4# (QVSIZE |v|) . #13#) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |x| (CAR #5#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 160))
                            . #13#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 142)) . #13#))
                       ('T
                        (PROGN (LETT #2# #3# . #13#) (LETT #1# 'T . #13#)))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#14# (|spadConstant| $ 26))))
             (SPADCALL (SPADCALL |c| (QREFELT $ 98))
                       (SPADCALL (SPADCALL |dd| (QREFELT $ 176))
                                 (QREFELT $ 122))
                       (QREFELT $ 15))
             (QREFELT $ 142))
            . #13#)
      (EXIT
       (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 119)) (LIST |k|)
               (LIST |g|))))))) 

(DEFUN |EFSTRUC;rischNormalize;FLR;44| (|f| |vars| $)
  (PROG (#1=#:G784 |rn| #2=#:G780 |rec| |c| |klist| |i| #3=#:G785 |kk| |n|
         |pars| |funs| |lk|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |lk| (SPADCALL |f| (QREFELT $ 59))
              . #4=(|EFSTRUC;rischNormalize;FLR;44|))
        (LETT |funs| |lk| . #4#)
        (LETT |pars| (SPADCALL |f| (QREFELT $ 22)) . #4#)
        (LETT |pars| (SPADCALL |pars| |vars| (QREFELT $ 177)) . #4#)
        (EXIT
         (COND ((NULL |funs|) (VECTOR |f| NIL NIL))
               ('T
                (SEQ (LETT |n| (LENGTH |funs|) . #4#)
                     (SEQ (LETT |kk| NIL . #4#) (LETT #3# (CDR |funs|) . #4#)
                          (LETT |i| 1 . #4#) G190
                          (COND
                           ((OR (|greater_SI| |i| |n|) (ATOM #3#)
                                (PROGN (LETT |kk| (CAR #3#) . #4#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ
                             (LETT |klist| (SPADCALL |funs| |i| (QREFELT $ 64))
                                   . #4#)
                             (SEQ
                              (LETT |c|
                                    (|EFSTRUC;findRelation| |vars| |pars|
                                     |klist| |kk| $)
                                    . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |c| 0)
                                 (COND
                                  ((NULL (SPADCALL (CDR |c|) (QREFELT $ 178)))
                                   (PROGN
                                    (LETT #2#
                                          (SEQ
                                           (LETT |rec|
                                                 (|EFSTRUC;depeval| |f| |klist|
                                                  |kk| (CDR |c|) $)
                                                 . #4#)
                                           (LETT |rn|
                                                 (SPADCALL (QVELT |rec| 0)
                                                           |vars|
                                                           (QREFELT $ 180))
                                                 . #4#)
                                           (EXIT
                                            (PROGN
                                             (LETT #1#
                                                   (VECTOR (QVELT |rn| 0)
                                                           (SPADCALL
                                                            (QVELT |rec| 1)
                                                            (QVELT |rn| 1)
                                                            (QREFELT $ 65))
                                                           (SPADCALL
                                                            (QVELT |rec| 2)
                                                            (QVELT |rn| 2)
                                                            (QREFELT $ 66)))
                                                   . #4#)
                                             (GO #1#))))
                                          . #4#)
                                    (GO #2#))))))))
                             (EXIT
                              (COND
                               ((QEQCAR |c| 1)
                                (SEQ
                                 (LETT |rn|
                                       (SPADCALL
                                        (SPADCALL |f| (LIST |kk|)
                                                  (LIST (CDR |c|))
                                                  (QREFELT $ 119))
                                        |vars| (QREFELT $ 180))
                                       . #4#)
                                 (EXIT
                                  (PROGN
                                   (LETT #1#
                                         (VECTOR (QVELT |rn| 0)
                                                 (CONS |kk| (QVELT |rn| 1))
                                                 (CONS (CDR |c|)
                                                       (QVELT |rn| 2)))
                                         . #4#)
                                   (GO #1#)))))))))
                           #2# (EXIT #2#))
                          (LETT |i|
                                (PROG1 (|inc_SI| |i|)
                                  (LETT #3# (CDR #3#) . #4#))
                                . #4#)
                          (GO G190) G191 (EXIT NIL))
                     (EXIT (VECTOR |f| NIL NIL))))))))
      #1# (EXIT #1#))))) 

(DEFUN |EFSTRUC;rischNormalize;FSR;45| (|f| |v| $)
  (SPADCALL |f| (LIST |v|) (QREFELT $ 180))) 

(DEFUN |EFSTRUC;rootNormalize;FKF;46| (|f| |k| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u|
            (|EFSTRUC;rootKernelNormalize| |f|
             (|EFSTRUC;toR| (SPADCALL |f| (QREFELT $ 59))
              (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) $)
             |k| $)
            |EFSTRUC;rootNormalize;FKF;46|)
      (EXIT (COND ((QEQCAR |u| 1) |f|) ('T (QVELT (QCDR |u|) 0)))))))) 

(DEFUN |EFSTRUC;rootKernelNormalize| (|f| |l| |k| $)
  (PROG (|c|)
    (RETURN
     (SEQ
      (LETT |c| (|EFSTRUC;rootDep| |l| |k| $) |EFSTRUC;rootKernelNormalize|)
      (EXIT
       (COND
        ((QEQCAR |c| 0)
         (CONS 0
               (|EFSTRUC;rooteval| |f| |l| |k|
                (SPADCALL (CDR |c|) (SPADCALL (CDR |c|) (QREFELT $ 150))
                          (QREFELT $ 151))
                $)))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |EFSTRUC;localnorm| (|f| $) (QVELT (SPADCALL |f| NIL (QREFELT $ 180)) 0)) 

(DEFUN |EFSTRUC;validExponential;LFSU;49| (|twr| |eta| |x| $)
  (PROG (#1=#:G837 #2=#:G836 #3=#:G838 #4=#:G849 |i| #5=#:G850 |yy| |g|
         #6=#:G810 #7=#:G809 #8=#:G811 #9=#:G847 #10=#:G848 |v| |c| #11=#:G846
         |fns| #12=#:G845)
    (RETURN
     (SEQ
      (LETT |c|
            (SPADCALL
             (SPADCALL
              (PROGN
               (LETT #12# NIL . #13=(|EFSTRUC;validExponential;LFSU;49|))
               (SEQ (LETT |g| NIL . #13#)
                    (LETT #11# (LETT |fns| (|EFSTRUC;toY| |twr| $) . #13#)
                          . #13#)
                    G190
                    (COND
                     ((OR (ATOM #11#) (PROGN (LETT |g| (CAR #11#) . #13#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #12# (CONS (SPADCALL |g| |x| (QREFELT $ 68)) #12#)
                            . #13#)))
                    (LETT #11# (CDR #11#) . #13#) (GO G190) G191
                    (EXIT (NREVERSE #12#))))
              (QREFELT $ 183))
             (SPADCALL |eta| |x| (QREFELT $ 68)) (QREFELT $ 184))
            . #13#)
      (EXIT
       (COND ((QEQCAR |c| 1) (CONS 1 "failed"))
             (#14='T
              (SEQ (LETT |v| (QCDR |c|) . #13#)
                   (LETT |g|
                         (SPADCALL |eta|
                                   (PROGN
                                    (LETT #6# NIL . #13#)
                                    (SEQ (LETT |yy| NIL . #13#)
                                         (LETT #10# |fns| . #13#)
                                         (LETT |i|
                                               (SPADCALL |v| (QREFELT $ 150))
                                               . #13#)
                                         (LETT #9# (QVSIZE |v|) . #13#) G190
                                         (COND
                                          ((OR (> |i| #9#) (ATOM #10#)
                                               (PROGN
                                                (LETT |yy| (CAR #10#) . #13#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #8#
                                                  (SPADCALL (QAREF1O |v| |i| 1)
                                                            |yy|
                                                            (QREFELT $ 160))
                                                  . #13#)
                                            (COND
                                             (#6#
                                              (LETT #7#
                                                    (SPADCALL #7# #8#
                                                              (QREFELT $ 142))
                                                    . #13#))
                                             ('T
                                              (PROGN
                                               (LETT #7# #8# . #13#)
                                               (LETT #6# 'T . #13#)))))))
                                         (LETT |i|
                                               (PROG1 (+ |i| 1)
                                                 (LETT #10# (CDR #10#) . #13#))
                                               . #13#)
                                         (GO G190) G191 (EXIT NIL))
                                    (COND (#6# #7#)
                                          (#14# (|spadConstant| $ 26))))
                                   (QREFELT $ 140))
                         . #13#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (PROGN
                            (LETT #1# NIL . #13#)
                            (SEQ (LETT |yy| NIL . #13#) (LETT #5# |fns| . #13#)
                                 (LETT |i| (SPADCALL |v| (QREFELT $ 150))
                                       . #13#)
                                 (LETT #4# (QVSIZE |v|) . #13#) G190
                                 (COND
                                  ((OR (> |i| #4#) (ATOM #5#)
                                       (PROGN
                                        (LETT |yy| (CAR #5#) . #13#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3#
                                          (SPADCALL
                                           (SPADCALL |yy| (QREFELT $ 138))
                                           (QAREF1O |v| |i| 1) (QREFELT $ 159))
                                          . #13#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 115))
                                            . #13#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #3# . #13#)
                                       (LETT #1# 'T . #13#)))))))
                                 (LETT |i|
                                       (PROG1 (+ |i| 1)
                                         (LETT #5# (CDR #5#) . #13#))
                                       . #13#)
                                 (GO G190) G191 (EXIT NIL))
                            (COND (#1# #2#) (#14# (|spadConstant| $ 62))))
                           (SPADCALL |g| (QREFELT $ 138))
                           (QREFELT $ 115)))))))))))) 

(DEFUN |EFSTRUC;irootDep;KU;50| (|k| $)
  (PROG (|nv| |nk| |nr| |nf| |pr| |n| #1=#:G851)
    (RETURN
     (SEQ
      (LETT |n|
            (PROG1
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 32)) (QREFELT $ 154))
                       (QREFELT $ 155))
                      . #2=(|EFSTRUC;irootDep;KU;50|))
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |pr|
            (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 32))) |n|
                      (QREFELT $ 189))
            . #2#)
      (COND
       ((SPADCALL (QVELT |pr| 1) (|spadConstant| $ 62) (QREFELT $ 34))
        (COND
         ((NULL (EQL (QVELT |pr| 0) |n|))
          (EXIT
           (COND
            ((EQL (QVELT |pr| 0) 1)
             (CONS 1 (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 115))))
            (#3='T
             (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                  (LETT |nr| (QVELT |pr| 2) . #2#)
                  (LETT |nk|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 85))
                                  (LIST |nr| |nf|) (QREFELT $ 148))
                        . #2#)
                  (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 115))
                        . #2#)
                  (EXIT (CONS 1 |nv|)))))))))
       (#3#
        (EXIT
         (COND
          ((EQL (QVELT |pr| 0) 1)
           (CONS 1 (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 115))))
          (#3#
           (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                (LETT |nr| (QVELT |pr| 2) . #2#)
                (LETT |nk|
                      (SPADCALL (SPADCALL |k| (QREFELT $ 85)) (LIST |nr| |nf|)
                                (QREFELT $ 148))
                      . #2#)
                (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 115))
                      . #2#)
                (EXIT (CONS 1 |nv|))))))))
      (EXIT (CONS 2 'T)))))) 

(DEFUN |EFSTRUC;irootDep;KU;51| (|k| $) (CONS 2 'T)) 

(DEFUN |EFSTRUC;rootDep| (|ker| |k| $)
  (PROG (#1=#:G887 #2=#:G886 #3=#:G888 #4=#:G891 |r|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |ker|
               (|EFSTRUC;toR| |ker| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                $)
               . #5=(|EFSTRUC;rootDep|)))
        (SPADCALL |k| (QREFELT $ 191)))
       (#6='T
        (CONS 0
              (MAKEARR1 1
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 32))
                                     (QREFELT $ 154))
                           (QREFELT $ 155))
                          (PROGN
                           (LETT #1# NIL . #5#)
                           (SEQ (LETT |r| NIL . #5#) (LETT #4# |ker| . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |r| (CAR #4#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3#
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |r| (QREFELT $ 32))
                                           (QREFELT $ 154))
                                          (QREFELT $ 155))
                                         . #5#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 192))
                                           . #5#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #5#)
                                      (LETT #1# 'T . #5#)))))))
                                (LETT #4# (CDR #4#) . #5#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#) (#6# 1)))
                          (QREFELT $ 192))
                         (QREFELT $ 157)))))))))) 

(DEFUN |EFSTRUC;expeval| (|f| |lk| |k| |v| $)
  (PROG (|h| #1=#:G903 #2=#:G902 #3=#:G904 #4=#:G914 |a| #5=#:G915 |z| |l|
         #6=#:G913 |kk| #7=#:G912 |lv| #8=#:G911 |i| #9=#:G910 |v0| |rec| |g|
         #10=#:G894 #11=#:G893 #12=#:G895 #13=#:G908 #14=#:G909 |fns| |y|)
    (RETURN
     (SEQ
      (LETT |y| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
            . #15=(|EFSTRUC;expeval|))
      (LETT |fns| (|EFSTRUC;toY| |lk| $) . #15#)
      (LETT |g|
            (SPADCALL |y|
                      (PROGN
                       (LETT #10# NIL . #15#)
                       (SEQ (LETT |z| NIL . #15#) (LETT #14# |fns| . #15#)
                            (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #15#)
                            (LETT #13# (QVSIZE |v|) . #15#) G190
                            (COND
                             ((OR (> |i| #13#) (ATOM #14#)
                                  (PROGN (LETT |z| (CAR #14#) . #15#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #12#
                                     (SPADCALL (QAREF1O |v| |i| 1) |z|
                                               (QREFELT $ 160))
                                     . #15#)
                               (COND
                                (#10#
                                 (LETT #11#
                                       (SPADCALL #11# #12# (QREFELT $ 142))
                                       . #15#))
                                ('T
                                 (PROGN
                                  (LETT #11# #12# . #15#)
                                  (LETT #10# 'T . #15#)))))))
                            (LETT |i|
                                  (PROG1 (+ |i| 1)
                                    (LETT #14# (CDR #14#) . #15#))
                                  . #15#)
                            (GO G190) G191 (EXIT NIL))
                       (COND (#10# #11#) (#16='T (|spadConstant| $ 26))))
                      (QREFELT $ 140))
            . #15#)
      (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $) . #15#)
      (EXIT
       (COND
        ((QEQCAR |rec| 1)
         (|EFSTRUC;expnosimp| |f| |lk| |k| |v| |fns|
          (SPADCALL |g| (QREFELT $ 138)) $))
        (#16#
         (SEQ
          (LETT |v0|
                (SPADCALL
                 (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1) (QREFELT $ 166))
                 (QREFELT $ 152))
                . #15#)
          (LETT |lv|
                (PROGN
                 (LETT #9# NIL . #15#)
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 150)) . #15#)
                      (LETT #8# (QVSIZE |v|) . #15#) G190
                      (COND ((> |i| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| (QCAR (QCDR |rec|)) (QREFELT $ 156))
                          (LETT #9# (CONS (QAREF1O |v| |i| 1) #9#) . #15#)))))
                      (LETT |i| (+ |i| 1) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                . #15#)
          (LETT |l|
                (PROGN
                 (LETT #7# NIL . #15#)
                 (SEQ (LETT |kk| NIL . #15#) (LETT #6# |lk| . #15#) G190
                      (COND
                       ((OR (ATOM #6#)
                            (PROGN (LETT |kk| (CAR #6#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |kk| (QCDR (QCDR |rec|)) (QREFELT $ 121))
                          (LETT #7# (CONS |kk| #7#) . #15#)))))
                      (LETT #6# (CDR #6#) . #15#) (GO G190) G191
                      (EXIT (NREVERSE #7#))))
                . #15#)
          (LETT |h|
                (PROGN
                 (LETT #1# NIL . #15#)
                 (SEQ (LETT |z| NIL . #15#)
                      (LETT #5# (|EFSTRUC;toY| |l| $) . #15#)
                      (LETT |a| NIL . #15#) (LETT #4# |lv| . #15#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |a| (CAR #4#) . #15#) NIL)
                            (ATOM #5#) (PROGN (LETT |z| (CAR #5#) . #15#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (SPADCALL |z| (QREFELT $ 138))
                                         (-
                                          (SPADCALL
                                           (SPADCALL |a| |v0| (QREFELT $ 168))
                                           (QREFELT $ 152)))
                                         (QREFELT $ 112))
                               . #15#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 115))
                                 . #15#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #15#)
                            (LETT #1# 'T . #15#)))))))
                      (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#) . #15#))
                            . #15#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) (#16# (|spadConstant| $ 62))))
                . #15#)
          (LETT |h|
                (SPADCALL
                 (SPADCALL |h|
                           (SPADCALL
                            (SPADCALL (SPADCALL |v0| |g| (QREFELT $ 167))
                                      (QREFELT $ 14))
                            (QREFELT $ 138))
                           (QREFELT $ 115))
                 (SPADCALL (SPADCALL |k| (QREFELT $ 97)) |v0| (QREFELT $ 112))
                 (QREFELT $ 115))
                . #15#)
          (EXIT
           (VECTOR
            (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |h|)
                      (QREFELT $ 119))
            (LIST (QCDR (QCDR |rec|))) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;normalize;2F;54| (|f| $)
  (|EFSTRUC;rtNormalize|
   (|EFSTRUC;localnorm|
    (SPADCALL (SPADCALL |f| (QREFELT $ 23)) (QREFELT $ 193)) $)
   $)) 

(DEFUN |EFSTRUC;normalize;FSF;55| (|f| |x| $)
  (|EFSTRUC;rtNormalize|
   (QVELT
    (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) |x| (QREFELT $ 195))
              |x| (QREFELT $ 181))
    0)
   $)) 

(DEFUN |EFSTRUC;factdeprel| (|l| |k| $)
  (PROG (#1=#:G953 #2=#:G956 #3=#:G951 #4=#:G950 #5=#:G952 #6=#:G958 |i| |r|
         |m| #7=#:G957 |x| #8=#:G955 |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (EXIT
         (SEQ
          (SEQ
           (LETT |r|
                 (SPADCALL
                  (LETT |n| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                        . #9=(|EFSTRUC;factdeprel|))
                  (QREFELT $ 53))
                 . #9#)
           (EXIT
            (COND
             ((QEQCAR |r| 0)
              (COND
               ((SPADCALL (QCDR |r|) 0 (QREFELT $ 111))
                (PROGN
                 (LETT #8#
                       (CONS 1
                             (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 197))
                                       (QREFELT $ 13)))
                       . #9#)
                 (GO #8#))))))))
          (SEQ (LETT |x| NIL . #9#) (LETT #7# |l| . #9#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |m| (|SPADfirst| (SPADCALL |x| (QREFELT $ 32))) . #9#)
                  (LETT |r|
                        (SPADCALL (SPADCALL |n| |m| (QREFELT $ 140))
                                  (QREFELT $ 53))
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |r| 0)
                     (PROGN
                      (LETT #1#
                            (COND
                             ((SPADCALL (QCDR |r|) 0 (QREFELT $ 111))
                              (PROGN
                               (LETT #2#
                                     (CONS 1
                                           (SPADCALL
                                            (PROGN
                                             (LETT #3# NIL . #9#)
                                             (SEQ (LETT |i| 1 . #9#)
                                                  (LETT #6# (QCDR |r|) . #9#)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #6#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #5#
                                                           (SPADCALL |m|
                                                                     (SPADCALL
                                                                      |i|
                                                                      (QREFELT
                                                                       $ 13))
                                                                     (QREFELT $
                                                                              142))
                                                           . #9#)
                                                     (COND
                                                      (#3#
                                                       (LETT #4#
                                                             (SPADCALL #4# #5#
                                                                       (QREFELT
                                                                        $ 115))
                                                             . #9#))
                                                      ('T
                                                       (PROGN
                                                        (LETT #4# #5# . #9#)
                                                        (LETT #3# 'T
                                                              . #9#)))))))
                                                  (LETT |i| (|inc_SI| |i|)
                                                        . #9#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND (#3# #4#)
                                                   ('T (|spadConstant| $ 62))))
                                            (SPADCALL |x| (QREFELT $ 97))
                                            (QREFELT $ 115)))
                                     . #9#)
                               (GO #2#)))
                             ('T (|error| "bad order of factorials")))
                            . #9#)
                      (GO #1#)))))))
                #1# (EXIT #1#))
               (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS 2 'T))))
        #8# (EXIT #8#)))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;normalize;2F;57| (|f| $)
  (|EFSTRUC;rtNormalize| (|EFSTRUC;localnorm| (SPADCALL |f| (QREFELT $ 23)) $)
   $)) 

(DEFUN |EFSTRUC;normalize;FSF;58| (|f| |x| $)
  (|EFSTRUC;rtNormalize|
   (QVELT (SPADCALL (SPADCALL |f| |x| (QREFELT $ 20)) |x| (QREFELT $ 181)) 0)
   $)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G962)
  (PROG ()
    (RETURN
     (PROG (#2=#:G963)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionStructurePackage|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionStructurePackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY (|function| |ElementaryFunctionStructurePackage;|)
                         #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|ElementaryFunctionStructurePackage|))))))))))) 

(DEFUN |ElementaryFunctionStructurePackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|ElementaryFunctionStructurePackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunctionStructurePackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 198) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunctionStructurePackage|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 '|htrig|)
      (QSETREFV $ 9 '|trig|)
      (QSETREFV $ 10 (|HasCategory| |#2| '(|CombinatorialOpsCategory|)))
      (QSETREFV $ 16
                (SPADCALL (SPADCALL (QREFELT $ 11))
                          (SPADCALL (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 14))
                          (QREFELT $ 15)))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (QSETREFV $ 51 (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;12|) $)))
       ('T
        (QSETREFV $ 51 (CONS (|dispatchFunction| |EFSTRUC;tanQ;F2F;13|) $))))
      (QSETREFV $ 83 '|%alg|)
      (QSETREFV $ 134
                (SPADCALL (SPADCALL '|%iint| (QREFELT $ 131)) (QREFELT $ 133)))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (PROGN
         (QSETREFV $ 191
                   (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;50|) $))))
       ('T
        (QSETREFV $ 191
                  (CONS (|dispatchFunction| |EFSTRUC;irootDep;KU;51|) $))))
      (COND
       ((|HasCategory| |#2| '(|CombinatorialOpsCategory|))
        (PROGN
         (QSETREFV $ 194
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;2F;54|) $))
         (QSETREFV $ 196
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;FSF;55|) $))))
       ('T
        (PROGN
         (QSETREFV $ 194
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;2F;57|) $))
         (QSETREFV $ 196
                   (CONS (|dispatchFunction| |EFSTRUC;normalize;FSF;58|) $)))))
      $)))) 

(MAKEPROP '|ElementaryFunctionStructurePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'HTRIG
              'TRIG '|comb?| (0 . |pi|) (|Integer|) (4 . |coerce|) (9 . -)
              (14 . /) '|mpiover2| (|Mapping| 7 29) |EFSTRUC;rmap;M2F;28|
              (|Symbol|) |EFSTRUC;realElementary;FSF;2| (|List| 19)
              (20 . |variables|) |EFSTRUC;realElementary;2F;3|
              |EFSTRUC;realLiouvillian;2F;4| |EFSTRUC;realLiouvillian;FSF;5|
              (25 . |Zero|) (|Boolean|) (29 . ~=) (|Kernel| 7) (35 . |is?|)
              (|List| 7) (41 . |argument|) (46 . |first|) (51 . =)
              (57 . |false|) (|Mapping| 27 29) (|List| 29) (61 . |select|)
              (|Fraction| 12) (67 . |denom|) (|SparseUnivariatePolynomial| 7)
              (|PositiveInteger|) (|TangentExpansions| 7) (72 . |tanAn|)
              (|SparseUnivariatePolynomial| $) (78 . |zeroOf|)
              (|AlgebraicManipulations| 6 7) (83 . |rootSimp|) (88 . |numer|)
              (93 . |tanNa|) (99 . |tanQ|) (|Union| 12 '#1="failed")
              (105 . |retractIfCan|) (110 . |tanSum|) (115 . |inv|)
              (120 . |tan|) (125 . |empty?|) (|List| 96) (130 . |tower|)
              (135 . |select!|) (141 . |One|) (145 . |One|)
              (|NonNegativeInteger|) (149 . |first|) (155 . |concat|)
              (161 . |concat|) (167 . |Zero|) (171 . |differentiate|)
              (|Vector| 7) (177 . |setelt|) (184 . |elt|) (|OutputForm|)
              (190 . |coerce|) (|Void|) (195 . |print|) (|Matrix| 7)
              (200 . |new|) (207 . |setelt|) (|Union| 113 '"failed")
              (|IntegerLinearDependence| 7) (215 . |solveLinearlyOverQ|)
              (221 . |One|) 'ALGOP (|BasicOperator|) (225 . |operator|)
              (230 . |has?|) (236 . |elt|) (|Union| 39 '#1#)
              (242 . |retractIfCan|) (247 . |kernels|) (252 . =) (258 . -)
              (|List| 39) (|MultiplicativeDependence|) (263 . |logDependenceQ|)
              (|Kernel| $) (269 . |coerce|) (274 . |log|)
              (|Union| 103 '"failed") (|Expression| 6) (|Numeric| 6)
              (279 . |numericIfCan|) (|Float|) (285 . |rationalApproximation|)
              (291 . |coerce|) (296 . /) (302 . |float|) (309 . -)
              (315 . |abs|) (320 . >) (326 . >) (332 . ^) (|Vector| 39)
              (338 . |zero|) (343 . *) (349 . |new|) (353 . |kernel|)
              (|List| $) (358 . |eval|) (365 . |atan|) (370 . ~=)
              (376 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 29)
              (|PolynomialCategoryLifting| (|IndexedExponents| 29) 29 6 124 7)
              (381 . |map|) (|SparseMultivariatePolynomial| 6 96)
              (388 . |numer|) (393 . |denom|) (|CommonOperators|)
              (398 . |operator|) (|LiouvillianFunction| 6 7) (403 . |operator|)
              '|opint| (408 . |is?|) (414 . |zero?|) (419 . |last|)
              (424 . |exp|) (429 . ^) (435 . -) (441 . |sqrt|) (446 . +)
              (452 . *) (458 . |One|) (462 . |elt|) (468 . |coerce|) (473 . D)
              (479 . |kernel|) (485 . |name|) (490 . |minIndex|) (495 . |elt|)
              (501 . |retract|) (506 . |nthRoot|) (512 . |second|)
              (517 . |retract|) (522 . ~=) (528 . |coerce|) (533 . /) (539 . ^)
              (545 . *) (551 . |retractIfCan|) (556 . |height|) (561 . >)
              (|Union| $ '"failed") (567 . |recip|) (572 . |inv|) (577 . *)
              (583 . *) (589 . |Zero|) (593 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 39 (|Vector| 12) 113)
              (599 . |splitDenominator|) (604 . |lcm|) (609 . *)
              (615 . |coerce|) (620 . |setDifference|) (626 . |empty?|)
              (|Record| (|:| |func| 7) (|:| |kers| 37) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;FLR;44| |EFSTRUC;rischNormalize;FSR;45|
              |EFSTRUC;rootNormalize;FKF;46| (631 . |construct|)
              (636 . |solveLinearlyOverQ|) (|Union| 7 '"failed")
              |EFSTRUC;validExponential;LFSU;49|
              (|Record| (|:| |exponent| 63) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 29) 29 6 124 7)
              (642 . |froot|)
              (|Union| (|:| |vec| 113) (|:| |func| 7) (|:| |fail| 27))
              (648 . |irootDep|) (653 . |lcm|) (659 . |factorials|)
              (664 . |normalize|) (669 . |factorials|) (675 . |normalize|)
              (681 . |factorial|))
           '#(|validExponential| 686 |tanQ| 693 |rootNormalize| 699 |rmap| 705
              |rischNormalize| 711 |realLiouvillian| 723 |realElementary| 734
              |normalize| 745 |irootDep| 756)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 197
                                                 '(0 7 0 11 1 7 0 12 13 1 7 0 0
                                                   14 2 7 0 0 0 15 1 7 21 0 22
                                                   0 7 0 26 2 7 27 0 0 28 2 29
                                                   27 0 19 30 1 29 31 0 32 1 31
                                                   7 0 33 2 7 27 0 0 34 0 27 0
                                                   35 2 37 0 36 0 38 1 39 12 0
                                                   40 2 43 41 7 42 44 1 7 0 45
                                                   46 1 47 7 7 48 1 39 12 0 49
                                                   2 43 7 7 12 50 2 0 7 39 7 51
                                                   1 7 52 0 53 1 43 7 31 54 1 7
                                                   0 0 55 1 7 0 0 56 1 21 27 0
                                                   57 1 7 58 0 59 2 37 0 36 0
                                                   60 0 6 0 61 0 7 0 62 2 37 0
                                                   0 63 64 2 37 0 0 0 65 2 31 0
                                                   0 0 66 0 6 0 67 2 7 0 0 19
                                                   68 3 69 7 0 12 7 70 2 69 7 0
                                                   12 71 1 7 72 0 73 1 72 74 0
                                                   75 3 76 0 63 63 7 77 4 76 7
                                                   0 12 12 7 78 2 80 79 76 69
                                                   81 0 39 0 82 1 29 84 0 85 2
                                                   84 27 0 19 86 2 31 7 0 12 87
                                                   1 7 88 0 89 1 7 58 0 90 2 39
                                                   27 0 0 91 1 39 0 0 92 2 94
                                                   79 93 39 95 1 7 0 96 97 1 7
                                                   0 0 98 2 101 99 100 42 102 2
                                                   103 39 0 63 104 1 103 0 39
                                                   105 2 103 0 0 0 106 3 103 0
                                                   12 12 42 107 2 103 0 0 0 108
                                                   1 103 0 0 109 2 103 27 0 0
                                                   110 2 12 27 0 0 111 2 7 0 0
                                                   12 112 1 113 0 63 114 2 7 0
                                                   0 0 115 0 19 0 116 1 29 0 19
                                                   117 3 7 0 0 58 118 119 1 7 0
                                                   0 120 2 29 27 0 0 121 1 7 0
                                                   6 122 3 125 7 17 123 124 126
                                                   1 7 127 0 128 1 7 127 0 129
                                                   1 130 84 19 131 1 132 84 84
                                                   133 2 84 27 0 19 135 1 7 27
                                                   0 136 1 31 7 0 137 1 7 0 0
                                                   138 2 7 0 0 42 139 2 7 0 0 0
                                                   140 1 7 0 0 141 2 7 0 0 0
                                                   142 2 7 0 42 0 143 0 124 0
                                                   144 2 7 0 84 118 145 1 7 0
                                                   19 146 2 7 0 0 19 147 2 7 0
                                                   84 118 148 1 84 19 0 149 1
                                                   113 12 0 150 2 113 39 0 12
                                                   151 1 39 12 0 152 2 7 0 0 12
                                                   153 1 31 7 0 154 1 7 12 0
                                                   155 2 12 27 0 0 156 1 39 0
                                                   12 157 2 39 0 0 0 158 2 7 0
                                                   0 39 159 2 7 0 39 0 160 1 39
                                                   52 0 161 1 29 63 0 162 2 63
                                                   27 0 0 163 1 39 164 0 165 1
                                                   39 0 0 166 2 7 0 12 0 167 2
                                                   39 0 0 12 168 0 39 0 169 2
                                                   37 27 36 0 170 1 172 171 113
                                                   173 1 12 0 118 174 2 39 0 12
                                                   0 175 1 6 0 12 176 2 21 0 0
                                                   0 177 1 113 27 0 178 1 69 0
                                                   31 183 2 80 79 69 7 184 2
                                                   188 187 7 63 189 1 0 190 29
                                                   191 2 12 0 0 0 192 1 7 0 0
                                                   193 1 0 7 7 194 2 7 0 0 19
                                                   195 2 0 7 7 19 196 1 12 0 0
                                                   197 3 0 185 37 7 19 186 2 0
                                                   7 39 7 51 2 0 7 7 29 182 2 0
                                                   7 17 7 18 2 0 179 7 19 181 2
                                                   0 179 7 21 180 1 0 7 7 24 2
                                                   0 7 7 19 25 1 0 7 7 23 2 0 7
                                                   7 19 20 1 0 7 7 194 2 0 7 7
                                                   19 196 1 0 190 29 191)))))
           '|lookupComplete|)) 
