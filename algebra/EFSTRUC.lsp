
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
  (PROG (|func| #1=#:G251 |k| #2=#:G250)
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
  (PROG (|func| #1=#:G255 |k| #2=#:G254)
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
  (PROG (|func| #1=#:G259 |k| #2=#:G258)
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
  (PROG (|func| #1=#:G263 |k| #2=#:G262)
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
  (PROG (#1=#:G270)
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
  (PROG (#1=#:G273)
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
  (PROG (#1=#:G280 |r| |k|)
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
  (PROG (#1=#:G290 #2=#:G294 |rn| |rec| |u| |i| #3=#:G295 |kk| |n| |ker|)
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
  (PROG (|u| |j| #1=#:G316 |k| |i| #2=#:G315 |var| |mat| |isconstant| #3=#:G314
         |v| |lvv| |m| #4=#:G313 |n|)
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
  (PROG (|u| |j| #1=#:G324 |k| |v| |mat| |n|)
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
  (PROG (#1=#:G329 |k| #2=#:G328)
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
  (PROG (#1=#:G341 |k| #2=#:G340)
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
  (PROG (|nz| |ly| #1=#:G381 |x| #2=#:G380 #3=#:G379 #4=#:G378 |lpars1f|
         #5=#:G377 |s| #6=#:G376 |lpars1| #7=#:G375 |k| #8=#:G374 |lpars0|
         #9=#:G372 |vv| |lz1tonq| |kertond| |nd| |nq| |qratio| |fratio|
         |Fratio| #10=#:G373 |z1| |i| |m| |kerF| |u| |q| |zkers| |z|)
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
                                           (SPADCALL |qratio|
                                                     (|spadConstant| $ 105)
                                                     (QREFELT $ 91))
                                           (OR
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL (QCDR |fratio|)
                                                         (SPADCALL |qratio|
                                                                   (QREFELT $
                                                                            106))
                                                         (QREFELT $ 107))
                                               (SPADCALL 1 0 10
                                                         (QREFELT $ 108))
                                               (QREFELT $ 109))
                                              (QREFELT $ 110))
                                             (SPADCALL 1 -16 10
                                                       (QREFELT $ 108))
                                             (QREFELT $ 111))
                                            (OR
                                             (SPADCALL
                                              (ABS
                                               (LETT |nq|
                                                     (SPADCALL |qratio|
                                                               (QREFELT $ 49))
                                                     . #11#))
                                              100 (QREFELT $ 112))
                                             (SPADCALL
                                              (ABS
                                               (LETT |nd|
                                                     (SPADCALL |qratio|
                                                               (QREFELT $ 40))
                                                     . #11#))
                                              100 (QREFELT $ 112)))))
                                          (EXIT "iterate")))
                                        (LETT |kertond|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |ker| (QREFELT $ 32))
                                                1 (QREFELT $ 87))
                                               |nd| (QREFELT $ 113))
                                              . #11#)
                                        (EXIT
                                         (COND
                                          ((SPADCALL |nq| 0 (QREFELT $ 112))
                                           (SEQ
                                            (LETT |lz1tonq|
                                                  (SPADCALL |z1| |nq|
                                                            (QREFELT $ 113))
                                                  . #11#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL |kertond| |lz1tonq|
                                                         (QREFELT $ 34))
                                               (SEQ
                                                (LETT |vv|
                                                      (SPADCALL |m|
                                                                (QREFELT $
                                                                         115))
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
                                                            (QREFELT $ 113))
                                                  . #11#)
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |kertond| |lz1tonq|
                                                          (QREFELT $ 116))
                                                (|spadConstant| $ 62)
                                                (QREFELT $ 34))
                                               (SEQ
                                                (LETT |vv|
                                                      (SPADCALL |m|
                                                                (QREFELT $
                                                                         115))
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
                              (LETT #8# (CONS (SPADCALL (QREFELT $ 117)) #8#)
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
                                     (SPADCALL (SPADCALL |s| (QREFELT $ 118))
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
                                                   (QREFELT $ 120))
                                         (QREFELT $ 98))
                                        #4#)
                                       . #11#)))
                               (LETT #3# (CDR #3#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         . #11#)
                   (EXIT
                    (LETT |nz|
                          (SPADCALL
                           (SPADCALL |z| |lpars0| |lpars1f| (QREFELT $ 120))
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
                                                   (QREFELT $ 120))
                                         (QREFELT $ 121))
                                        #2#)
                                       . #11#)))
                               (LETT #1# (CDR #1#) . #11#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #11#)
                   (EXIT
                    (LETT |nz|
                          (SPADCALL
                           (SPADCALL |z| |lpars0| |lpars1f| (QREFELT $ 120))
                           (QREFELT $ 121))
                          . #11#)))))
                (EXIT (|EFSTRUC;findQRelation| NIL |lpars1| |ly| |nz| $))))))))
      #9# (EXIT #9#))))) 

(DEFUN |EFSTRUC;findRelation| (|lv| |lpar| |lk| |ker| $)
  (PROG (#1=#:G401 |x| #2=#:G400)
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
                             (SPADCALL |x| |ker| (QREFELT $ 122)))
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
  (SPADCALL |f| (ELT $ 123) |p| (QREFELT $ 127))) 

(DEFUN |EFSTRUC;rmap;M2F;28| (|f| |e| $)
  (SPADCALL (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 129)) $)
            (|EFSTRUC;smp_map| |f| (SPADCALL |e| (QREFELT $ 130)) $)
            (QREFELT $ 15))) 

(DEFUN |EFSTRUC;k2Elem0| (|k| |op| |args| $)
  (PROG (|tz2| |iez| |ez| |z|)
    (RETURN
     (SEQ (LETT |z| (|SPADfirst| |args|) . #1=(|EFSTRUC;k2Elem0|))
          (EXIT
           (COND
            ((SPADCALL |op| '|%power| (QREFELT $ 136))
             (COND ((SPADCALL |z| (QREFELT $ 137)) (|spadConstant| $ 26))
                   (#2='T
                    (SPADCALL
                     (SPADCALL (SPADCALL |args| (QREFELT $ 138))
                               (SPADCALL |z| (QREFELT $ 98)) (QREFELT $ 116))
                     (QREFELT $ 139)))))
            ((SPADCALL |op| '|cot| (QREFELT $ 136))
             (SPADCALL (SPADCALL |z| (QREFELT $ 56)) (QREFELT $ 55)))
            ((SPADCALL |op| '|acot| (QREFELT $ 136))
             (SPADCALL (SPADCALL |z| (QREFELT $ 55)) (QREFELT $ 121)))
            ((SPADCALL |op| '|asin| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL |z|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 62)
                                   (SPADCALL |z| 2 (QREFELT $ 140))
                                   (QREFELT $ 141))
                         (QREFELT $ 142))
                        (QREFELT $ 15))
              (QREFELT $ 121)))
            ((SPADCALL |op| '|acos| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 62)
                          (SPADCALL |z| 2 (QREFELT $ 140)) (QREFELT $ 141))
                (QREFELT $ 142))
               |z| (QREFELT $ 15))
              (QREFELT $ 121)))
            ((SPADCALL |op| '|asec| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| 2 (QREFELT $ 140)) (|spadConstant| $ 62)
                         (QREFELT $ 141))
               (QREFELT $ 142))
              (QREFELT $ 121)))
            ((SPADCALL |op| '|acsc| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |z| 2 (QREFELT $ 140))
                          (|spadConstant| $ 62) (QREFELT $ 141))
                (QREFELT $ 142))
               (QREFELT $ 55))
              (QREFELT $ 121)))
            ((SPADCALL |op| '|asinh| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (|spadConstant| $ 62)
                          (SPADCALL |z| 2 (QREFELT $ 140)) (QREFELT $ 143))
                (QREFELT $ 142))
               |z| (QREFELT $ 143))
              (QREFELT $ 98)))
            ((SPADCALL |op| '|acosh| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL (SPADCALL |z| 2 (QREFELT $ 140))
                          (|spadConstant| $ 62) (QREFELT $ 141))
                (QREFELT $ 142))
               |z| (QREFELT $ 143))
              (QREFELT $ 98)))
            ((SPADCALL |op| '|atanh| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 143))
                         (SPADCALL (|spadConstant| $ 62) |z| (QREFELT $ 141))
                         (QREFELT $ 15))
               (QREFELT $ 98))
              (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
            ((SPADCALL |op| '|acoth| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 143))
                         (SPADCALL |z| (|spadConstant| $ 62) (QREFELT $ 141))
                         (QREFELT $ 15))
               (QREFELT $ 98))
              (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
            ((SPADCALL |op| '|asech| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| 2 (QREFELT $ 140))
                                    (QREFELT $ 55))
                          (|spadConstant| $ 62) (QREFELT $ 141))
                         (QREFELT $ 142))
                        (QREFELT $ 143))
              (QREFELT $ 98)))
            ((SPADCALL |op| '|acsch| (QREFELT $ 136))
             (SPADCALL
              (SPADCALL (SPADCALL |z| (QREFELT $ 55))
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 62)
                                   (SPADCALL (SPADCALL |z| 2 (QREFELT $ 140))
                                             (QREFELT $ 55))
                                   (QREFELT $ 143))
                         (QREFELT $ 142))
                        (QREFELT $ 143))
              (QREFELT $ 98)))
            ((OR (SPADCALL |op| '|%paren| (QREFELT $ 136))
                 (SPADCALL |op| '|%box| (QREFELT $ 136)))
             (COND ((NULL (CDR |args|)) |z|)
                   (#2# (SPADCALL |k| (QREFELT $ 97)))))
            ('T
             (SEQ
              (COND
               ((SPADCALL |op| (QREFELT $ 8) (QREFELT $ 86))
                (LETT |iez|
                      (SPADCALL
                       (LETT |ez| (SPADCALL |z| (QREFELT $ 139)) . #1#)
                       (QREFELT $ 55))
                      . #1#)))
              (EXIT
               (COND
                ((SPADCALL |op| '|sinh| (QREFELT $ 136))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 141))
                           (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                ((SPADCALL |op| '|cosh| (QREFELT $ 136))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 143))
                           (SPADCALL 2 (QREFELT $ 13)) (QREFELT $ 15)))
                ((SPADCALL |op| '|tanh| (QREFELT $ 136))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 141))
                           (SPADCALL |ez| |iez| (QREFELT $ 143))
                           (QREFELT $ 15)))
                ((SPADCALL |op| '|coth| (QREFELT $ 136))
                 (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 143))
                           (SPADCALL |ez| |iez| (QREFELT $ 141))
                           (QREFELT $ 15)))
                ((SPADCALL |op| '|sech| (QREFELT $ 136))
                 (SPADCALL 2
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 143))
                                     (QREFELT $ 55))
                           (QREFELT $ 144)))
                ((SPADCALL |op| '|csch| (QREFELT $ 136))
                 (SPADCALL 2
                           (SPADCALL (SPADCALL |ez| |iez| (QREFELT $ 141))
                                     (QREFELT $ 55))
                           (QREFELT $ 144)))
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
                    ((SPADCALL |op| '|sin| (QREFELT $ 136))
                     (SPADCALL (SPADCALL 2 |tz2| (QREFELT $ 144))
                               (SPADCALL (|spadConstant| $ 62)
                                         (SPADCALL |tz2| 2 (QREFELT $ 140))
                                         (QREFELT $ 143))
                               (QREFELT $ 15)))
                    ((SPADCALL |op| '|cos| (QREFELT $ 136))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 140))
                                (QREFELT $ 141))
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 140))
                                (QREFELT $ 143))
                      (QREFELT $ 15)))
                    ((SPADCALL |op| '|sec| (QREFELT $ 136))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 140))
                                (QREFELT $ 143))
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 140))
                                (QREFELT $ 141))
                      (QREFELT $ 15)))
                    ((SPADCALL |op| '|csc| (QREFELT $ 136))
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 62)
                                (SPADCALL |tz2| 2 (QREFELT $ 140))
                                (QREFELT $ 143))
                      (SPADCALL 2 |tz2| (QREFELT $ 144)) (QREFELT $ 15)))
                    (#2# (SPADCALL |op| |args| (QREFELT $ 146))))))))))))))))) 

(DEFUN |EFSTRUC;do_int| (|op| |args| $)
  (PROG (|dvs| #1=#:G460 |v| #2=#:G459 |vfs| #3=#:G458 #4=#:G457 |vars| |kf1|)
    (RETURN
     (SEQ
      (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 146))
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
                    (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 147)) #4#)
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
                           (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 148))
                                     (QREFELT $ 24))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT
       (SPADCALL (QREFELT $ 135) (SPADCALL |vfs| |dvs| (QREFELT $ 66))
                 (QREFELT $ 149))))))) 

(DEFUN |EFSTRUC;k_to_liou| (|k| $)
  (PROG (#1=#:G471 #2=#:G468 |i| |iu| |nm| |args| #3=#:G475 |a| #4=#:G474 |op|)
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
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 136)))
                         (EXIT (|EFSTRUC;do_int| |op| |args| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 150)) . #5#)
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
                                            ((SPADCALL |i| 0 (QREFELT $ 112))
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
  (PROG (|dvs| #1=#:G483 |v| #2=#:G482 |vfs| #3=#:G481 #4=#:G480 |vars| |kf1|)
    (RETURN
     (SEQ
      (LETT |kf1| (SPADCALL |op| |args| (QREFELT $ 146))
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
                    (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 147)) #4#)
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
                           (SPADCALL (SPADCALL |kf1| |v| (QREFELT $ 148)) |x|
                                     (QREFELT $ 25))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT
       (SPADCALL (QREFELT $ 135) (SPADCALL |vfs| |dvs| (QREFELT $ 66))
                 (QREFELT $ 149))))))) 

(DEFUN |EFSTRUC;k_to_liou1| (|k| |x| $)
  (PROG (#1=#:G503 #2=#:G493 |i| |iu| |nm| |args| #3=#:G507 |a| #4=#:G506 |op|)
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
                        ((NULL (SPADCALL |op| '|%iint| (QREFELT $ 136)))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (LETT |nm| (SPADCALL |op| (QREFELT $ 150)) . #5#)
                     (COND
                      ((EQUAL |nm| '|Gamma2|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| |args|) |x| (QREFELT $ 148))
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
                                            ((SPADCALL |i| 0 (QREFELT $ 112))
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
                                    (QREFELT $ 148))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))
                     (COND
                      ((EQUAL |nm| '|ellipticPi|)
                       (COND
                        ((SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 87)) |x|
                                    (QREFELT $ 148))
                          (|spadConstant| $ 26) (QREFELT $ 34))
                         (COND
                          ((SPADCALL
                            (SPADCALL (SPADCALL |args| 3 (QREFELT $ 87)) |x|
                                      (QREFELT $ 148))
                            (|spadConstant| $ 26) (QREFELT $ 34))
                           (EXIT (|EFSTRUC;do_int1| |op| |args| |x| $))))))))
                     (EXIT (|EFSTRUC;k2Elem0| |k| |op| |args| $))))
                   #1# (EXIT #1#))))))))) 

(DEFUN |EFSTRUC;k2Elem| (|k| |l| $)
  (PROG (|args| #1=#:G512 |a| #2=#:G511 |op|)
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
     (SPADCALL |v| (SPADCALL |v| (QREFELT $ 151)) (QREFELT $ 152)) $))
   ('T (VECTOR |f| NIL NIL)))) 

(DEFUN |EFSTRUC;rooteval| (|f| |lk| |k| |n| $)
  (PROG (|lv| #1=#:G528 |r| #2=#:G527 |l| #3=#:G526 #4=#:G525 |nv| |m| |x|)
    (RETURN
     (SEQ
      (LETT |nv|
            (SPADCALL
             (LETT |x| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
                   . #5=(|EFSTRUC;rooteval|))
             (LETT |m| (SPADCALL |n| (QREFELT $ 153)) . #5#) (QREFELT $ 154))
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
                                  (QREFELT $ 155))
                        (QREFELT $ 156))
                       |m| (QREFELT $ 157))
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
                                                  (QREFELT $ 155))
                                                 (QREFELT $ 156))
                                                (QREFELT $ 158))
                                               (QREFELT $ 159))
                                     (QREFELT $ 160))
                           #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #5#)
      (EXIT (VECTOR (SPADCALL |f| |l| |lv| (QREFELT $ 120)) |l| |lv|)))))) 

(DEFUN |EFSTRUC;ataneval| (|f| |lk| |k| |v| $)
  (PROG (|g| |h| |d| #1=#:G532 #2=#:G531 #3=#:G533 #4=#:G540 |i| #5=#:G541 |x|
         |s| #6=#:G538 #7=#:G539 #8=#:G537 |w|)
    (RETURN
     (SEQ
      (LETT |w| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
            . #9=(|EFSTRUC;ataneval|))
      (LETT |s|
            (SPADCALL
             (PROGN
              (LETT #8# NIL . #9#)
              (SEQ (LETT |x| NIL . #9#) (LETT #7# (|EFSTRUC;toV| |lk| $) . #9#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #9#)
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
                  (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #9#)
                  (LETT #4# (QVSIZE |v|) . #9#) G190
                  (COND
                   ((OR (> |i| #4#) (ATOM #5#)
                        (PROGN (LETT |x| (CAR #5#) . #9#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3#
                           (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 161))
                           . #9#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 143)) . #9#))
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
                               (SPADCALL |s| |w| (QREFELT $ 116))
                               (QREFELT $ 143))
                     . #9#)
               (QREFELT $ 137))
              (QREFELT $ 16))
             (#10#
              (SPADCALL
               (SPADCALL (SPADCALL |w| |s| (QREFELT $ 141)) |d| (QREFELT $ 15))
               (QREFELT $ 121))))
            . #9#)
      (LETT |g| (SPADCALL |g| |h| (QREFELT $ 143)) . #9#)
      (EXIT
       (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 120)) (LIST |k|)
               (LIST |g|))))))) 

(DEFUN |EFSTRUC;gdCoef?| (|c| |v| $)
  (PROG (#1=#:G546 #2=#:G548 #3=#:G549 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ
           (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #4=(|EFSTRUC;gdCoef?|))
           (LETT #3# (QVSIZE |v|) . #4#) G190 (COND ((> |i| #3#) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((QEQCAR
                (SPADCALL (SPADCALL (QAREF1O |v| |i| 1) |c| (QREFELT $ 159))
                          (QREFELT $ 162))
                1)
               (PROGN
                (LETT #1# (PROGN (LETT #2# 'NIL . #4#) (GO #2#)) . #4#)
                (GO #1#))))))
           (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'T)))
      #2# (EXIT #2#))))) 

(DEFUN |EFSTRUC;goodCoef| (|v| |l| |s| $)
  (PROG (#1=#:G577 #2=#:G579 |r| #3=#:G583 |i| #4=#:G584 |k| |h| |j| |h1|
         #5=#:G581 #6=#:G582 |ll| #7=#:G580)
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
               (EQL |h| (+ (- (QVSIZE |v|) (SPADCALL |v| (QREFELT $ 151))) 1)))
              (EXIT (CONS 1 "failed"))))
            (LETT |h| 0 . #8#) (LETT |ll| (REVERSE |ll|) . #8#)
            (SEQ (LETT |k| NIL . #8#) (LETT #6# |ll| . #8#)
                 (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #8#)
                 (LETT #5# (QVSIZE |v|) . #8#) G190
                 (COND
                  ((OR (> |i| #5#) (ATOM #6#)
                       (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                   (GO G191)))
                 (SEQ (LETT |h1| (SPADCALL |k| (QREFELT $ 163)) . #8#)
                      (EXIT
                       (COND
                        ((SPADCALL |h1| |h| (QREFELT $ 164))
                         (SEQ (LETT |j| |i| . #8#)
                              (EXIT (LETT |h| |h1| . #8#)))))))
                 (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#) . #8#)) . #8#)
                 (GO G190) G191 (EXIT NIL))
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL . #8#) (LETT #4# |ll| . #8#)
                   (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #8#)
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
                                (SPADCALL (QAREF1O |v| |i| 1) (QREFELT $ 166))
                                . #8#)
                          (EXIT
                           (COND
                            ((QEQCAR |r| 0)
                             (COND
                              ((QEQCAR (SPADCALL (QCDR |r|) (QREFELT $ 162)) 0)
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
  (PROG (|g| #1=#:G606 |a| #2=#:G607 |x| #3=#:G605 |l| #4=#:G604 |kk| #5=#:G603
         |lv| #6=#:G602 |i| #7=#:G601 |v0| |rec| |c| #8=#:G587 #9=#:G586
         #10=#:G588 #11=#:G599 #12=#:G600 |fns| |u|)
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
                            (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #13#)
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
                                               (QREFELT $ 161))
                                     . #13#)
                               (COND
                                (#8#
                                 (LETT #9# (SPADCALL #9# #10# (QREFELT $ 143))
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
                      (QREFELT $ 141))
            . #13#)
      (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|tan| $) . #13#)
      (EXIT
       (COND
        ((QEQCAR |rec| 1) (|EFSTRUC;tannosimp| |f| |lk| |k| |v| |fns| |c| $))
        (#14#
         (SEQ
          (LETT |v0|
                (SPADCALL
                 (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1) (QREFELT $ 167))
                 (QREFELT $ 153))
                . #13#)
          (LETT |lv|
                (PROGN
                 (LETT #7# NIL . #13#)
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #13#)
                      (LETT #6# (QVSIZE |v|) . #13#) G190
                      (COND ((> |i| #6#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| (QCAR (QCDR |rec|)) (QREFELT $ 157))
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
                         ((SPADCALL |kk| (QCDR (QCDR |rec|)) (QREFELT $ 122))
                          (LETT #5# (CONS |kk| #5#) . #13#)))))
                      (LETT #4# (CDR #4#) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #13#)
          (LETT |g|
                (|EFSTRUC;tanSum|
                 (SPADCALL (SPADCALL |v0| |c| (QREFELT $ 168)) (QREFELT $ 14))
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
                                                       (QREFELT $ 169))
                                             (QREFELT $ 153)))
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
                      (QREFELT $ 120))
            (LIST (QCDR (QCDR |rec|))) (LIST |g|))))))))))) 

(DEFUN |EFSTRUC;tannosimp| (|f| |lk| |k| |v| |fns| |c| $)
  (PROG (|h| |i| #1=#:G640 |x| #2=#:G639 |lk1| |newtan| #3=#:G637 #4=#:G638 |t|
         #5=#:G636 |li| #6=#:G635 #7=#:G634 #8=#:G633 |newt| #9=#:G632 |u|
         #10=#:G631 |dd| |d| |cd| #11=#:G630 #12=#:G629 #13=#:G628 #14=#:G627
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
                                      (|spadConstant| $ 105) (QREFELT $ 91))
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
                                          (|spadConstant| $ 105)
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
                                          (|spadConstant| $ 105)
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
               (VECTOR (SPADCALL |f| |lk1| |newtan| (QREFELT $ 120)) |lk1|
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
               (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 120))
                       (LIST |k|) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;tannosimp!0| (|x| $) (SPADCALL |x| '|tan| (QREFELT $ 30))) 

(DEFUN |EFSTRUC;expnosimp| (|f| |lk| |k| |v| |fns| |g| $)
  (PROG (|h| #1=#:G737 #2=#:G736 #3=#:G738 #4=#:G753 |i| #5=#:G754 |y| |newexp|
         |lk1| #6=#:G694 #7=#:G693 #8=#:G695 #9=#:G751 #10=#:G752 |e| |li|
         #11=#:G750 #12=#:G749 #13=#:G748 |newe| #14=#:G747 #15=#:G746 |dd| |d|
         |cd| #16=#:G745 |x| #17=#:G744 #18=#:G743 #19=#:G742 |n|)
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
                                      (|spadConstant| $ 105) (QREFELT $ 91))
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
                                          (|spadConstant| $ 105)
                                          (QREFELT $ 91))
                                'NIL)
                               (#21# 'T))
                              (LETT #15#
                                    (CONS
                                     (SPADCALL
                                      (SPADCALL |y| |dd| (QREFELT $ 15))
                                      (QREFELT $ 139))
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
                                  (CONS (SPADCALL |e| |d| (QREFELT $ 113))
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
                                          (|spadConstant| $ 105)
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
                                              (QREFELT $ 113))
                                    . #20#)
                              (COND
                               (#6#
                                (LETT #7# (SPADCALL #7# #8# (QREFELT $ 116))
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
                     |g| (QREFELT $ 116))
                    . #20#)
              (LETT |lk1| (CONS |k| |lk1|) . #20#)
              (LETT |newexp| (CONS |h| |newexp|) . #20#)
              (EXIT
               (VECTOR (SPADCALL |f| |lk1| |newexp| (QREFELT $ 120)) |lk1|
                       |newexp|))))
            (#21#
             (SEQ
              (LETT |h|
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL . #20#)
                      (SEQ (LETT |y| NIL . #20#) (LETT #5# |fns| . #20#)
                           (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #20#)
                           (LETT #4# (QVSIZE |v|) . #20#) G190
                           (COND
                            ((OR (> |i| #4#) (ATOM #5#)
                                 (PROGN (LETT |y| (CAR #5#) . #20#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL (SPADCALL |y| (QREFELT $ 139))
                                              (QAREF1O |v| |i| 1)
                                              (QREFELT $ 160))
                                    . #20#)
                              (COND
                               (#1#
                                (LETT #2# (SPADCALL #2# #3# (QREFELT $ 116))
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
                     |g| (QREFELT $ 116))
                    . #20#)
              (EXIT
               (VECTOR (SPADCALL |f| (LIST |k|) (LIST |h|) (QREFELT $ 120))
                       (LIST |k|) (LIST |h|))))))))))) 

(DEFUN |EFSTRUC;expnosimp!0| (|x| $) (SPADCALL |x| '|exp| (QREFELT $ 30))) 

(DEFUN |EFSTRUC;logeval| (|f| |lk| |k| |v| $)
  (PROG (|g| #1=#:G767 #2=#:G766 #3=#:G768 #4=#:G775 |i| #5=#:G776 |x| |c|
         #6=#:G758 #7=#:G757 #8=#:G759 #9=#:G773 #10=#:G774 |dd| #11=#:G772
         #12=#:G771 |z|)
    (RETURN
     (SEQ
      (LETT |z| (|SPADfirst| (SPADCALL |k| (QREFELT $ 32)))
            . #13=(|EFSTRUC;logeval|))
      (LETT |dd|
            (SPADCALL
             (PROGN
              (LETT #12# NIL . #13#)
              (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #13#)
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
            (SPADCALL (SPADCALL |z| |dd| (QREFELT $ 113))
                      (PROGN
                       (LETT #6# NIL . #13#)
                       (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #13#)
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
                                               (QREFELT $ 160))
                                     . #13#)
                               (COND
                                (#6#
                                 (LETT #7# (SPADCALL #7# #8# (QREFELT $ 116))
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
                   (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #13#)
                   (LETT #4# (QVSIZE |v|) . #13#) G190
                   (COND
                    ((OR (> |i| #4#) (ATOM #5#)
                         (PROGN (LETT |x| (CAR #5#) . #13#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (QAREF1O |v| |i| 1) |x| (QREFELT $ 161))
                            . #13#)
                      (COND
                       (#1#
                        (LETT #2# (SPADCALL #2# #3# (QREFELT $ 143)) . #13#))
                       ('T
                        (PROGN (LETT #2# #3# . #13#) (LETT #1# 'T . #13#)))))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #5# (CDR #5#) . #13#))
                         . #13#)
                   (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#14# (|spadConstant| $ 26))))
             (SPADCALL (SPADCALL |c| (QREFELT $ 98))
                       (SPADCALL (SPADCALL |dd| (QREFELT $ 176))
                                 (QREFELT $ 123))
                       (QREFELT $ 15))
             (QREFELT $ 143))
            . #13#)
      (EXIT
       (VECTOR (SPADCALL |f| (LIST |k|) (LIST |g|) (QREFELT $ 120)) (LIST |k|)
               (LIST |g|))))))) 

(DEFUN |EFSTRUC;rischNormalize;FLR;44| (|f| |vars| $)
  (PROG (#1=#:G786 |rn| #2=#:G782 |rec| |c| |klist| |i| #3=#:G787 |kk| |n|
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
                                                  (QREFELT $ 120))
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
                (SPADCALL (CDR |c|) (SPADCALL (CDR |c|) (QREFELT $ 151))
                          (QREFELT $ 152))
                $)))
        ('T (CONS 1 "failed")))))))) 

(DEFUN |EFSTRUC;localnorm| (|f| $) (QVELT (SPADCALL |f| NIL (QREFELT $ 180)) 0)) 

(DEFUN |EFSTRUC;validExponential;LFSU;49| (|twr| |eta| |x| $)
  (PROG (#1=#:G839 #2=#:G838 #3=#:G840 #4=#:G851 |i| #5=#:G852 |yy| |g|
         #6=#:G812 #7=#:G811 #8=#:G813 #9=#:G849 #10=#:G850 |v| |c| #11=#:G848
         |fns| #12=#:G847)
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
                                               (SPADCALL |v| (QREFELT $ 151))
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
                                                            (QREFELT $ 161))
                                                  . #13#)
                                            (COND
                                             (#6#
                                              (LETT #7#
                                                    (SPADCALL #7# #8#
                                                              (QREFELT $ 143))
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
                                   (QREFELT $ 141))
                         . #13#)
                   (EXIT
                    (CONS 0
                          (SPADCALL
                           (PROGN
                            (LETT #1# NIL . #13#)
                            (SEQ (LETT |yy| NIL . #13#) (LETT #5# |fns| . #13#)
                                 (LETT |i| (SPADCALL |v| (QREFELT $ 151))
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
                                           (SPADCALL |yy| (QREFELT $ 139))
                                           (QAREF1O |v| |i| 1) (QREFELT $ 160))
                                          . #13#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 116))
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
                           (SPADCALL |g| (QREFELT $ 139))
                           (QREFELT $ 116)))))))))))) 

(DEFUN |EFSTRUC;irootDep;KU;50| (|k| $)
  (PROG (|nv| |nk| |nr| |nf| |pr| |n| #1=#:G853)
    (RETURN
     (SEQ
      (LETT |n|
            (PROG1
                (LETT #1#
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 32)) (QREFELT $ 155))
                       (QREFELT $ 156))
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
             (CONS 1 (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 116))))
            (#3='T
             (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                  (LETT |nr| (QVELT |pr| 2) . #2#)
                  (LETT |nk|
                        (SPADCALL (SPADCALL |k| (QREFELT $ 85))
                                  (LIST |nr| |nf|) (QREFELT $ 149))
                        . #2#)
                  (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 116))
                        . #2#)
                  (EXIT (CONS 1 |nv|)))))))))
       (#3#
        (EXIT
         (COND
          ((EQL (QVELT |pr| 0) 1)
           (CONS 1 (SPADCALL (QVELT |pr| 1) (QVELT |pr| 2) (QREFELT $ 116))))
          (#3#
           (SEQ (LETT |nf| (SPADCALL (QVELT |pr| 0) (QREFELT $ 13)) . #2#)
                (LETT |nr| (QVELT |pr| 2) . #2#)
                (LETT |nk|
                      (SPADCALL (SPADCALL |k| (QREFELT $ 85)) (LIST |nr| |nf|)
                                (QREFELT $ 149))
                      . #2#)
                (LETT |nv| (SPADCALL (QVELT |pr| 1) |nk| (QREFELT $ 116))
                      . #2#)
                (EXIT (CONS 1 |nv|))))))))
      (EXIT (CONS 2 'T)))))) 

(DEFUN |EFSTRUC;irootDep;KU;51| (|k| $) (CONS 2 'T)) 

(DEFUN |EFSTRUC;rootDep| (|ker| |k| $)
  (PROG (#1=#:G889 #2=#:G888 #3=#:G890 #4=#:G893 |r|)
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
                                     (QREFELT $ 155))
                           (QREFELT $ 156))
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
                                           (QREFELT $ 155))
                                          (QREFELT $ 156))
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
                         (QREFELT $ 158)))))))))) 

(DEFUN |EFSTRUC;expeval| (|f| |lk| |k| |v| $)
  (PROG (|h| #1=#:G905 #2=#:G904 #3=#:G906 #4=#:G916 |a| #5=#:G917 |z| |l|
         #6=#:G915 |kk| #7=#:G914 |lv| #8=#:G913 |i| #9=#:G912 |v0| |rec| |g|
         #10=#:G896 #11=#:G895 #12=#:G897 #13=#:G910 #14=#:G911 |fns| |y|)
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
                            (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #15#)
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
                                               (QREFELT $ 161))
                                     . #15#)
                               (COND
                                (#10#
                                 (LETT #11#
                                       (SPADCALL #11# #12# (QREFELT $ 143))
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
                      (QREFELT $ 141))
            . #15#)
      (LETT |rec| (|EFSTRUC;goodCoef| |v| |lk| '|exp| $) . #15#)
      (EXIT
       (COND
        ((QEQCAR |rec| 1)
         (|EFSTRUC;expnosimp| |f| |lk| |k| |v| |fns|
          (SPADCALL |g| (QREFELT $ 139)) $))
        (#16#
         (SEQ
          (LETT |v0|
                (SPADCALL
                 (SPADCALL (QAREF1O |v| (QCAR (QCDR |rec|)) 1) (QREFELT $ 167))
                 (QREFELT $ 153))
                . #15#)
          (LETT |lv|
                (PROGN
                 (LETT #9# NIL . #15#)
                 (SEQ (LETT |i| (SPADCALL |v| (QREFELT $ 151)) . #15#)
                      (LETT #8# (QVSIZE |v|) . #15#) G190
                      (COND ((> |i| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |i| (QCAR (QCDR |rec|)) (QREFELT $ 157))
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
                         ((SPADCALL |kk| (QCDR (QCDR |rec|)) (QREFELT $ 122))
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
                               (SPADCALL (SPADCALL |z| (QREFELT $ 139))
                                         (-
                                          (SPADCALL
                                           (SPADCALL |a| |v0| (QREFELT $ 169))
                                           (QREFELT $ 153)))
                                         (QREFELT $ 113))
                               . #15#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 116))
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
                            (SPADCALL (SPADCALL |v0| |g| (QREFELT $ 168))
                                      (QREFELT $ 14))
                            (QREFELT $ 139))
                           (QREFELT $ 116))
                 (SPADCALL (SPADCALL |k| (QREFELT $ 97)) |v0| (QREFELT $ 113))
                 (QREFELT $ 116))
                . #15#)
          (EXIT
           (VECTOR
            (SPADCALL |f| (LIST (QCDR (QCDR |rec|))) (LIST |h|)
                      (QREFELT $ 120))
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
  (PROG (#1=#:G955 #2=#:G958 #3=#:G953 #4=#:G952 #5=#:G954 #6=#:G960 |i| |r|
         |m| #7=#:G959 |x| #8=#:G957 |n|)
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
               ((SPADCALL (QCDR |r|) 0 (QREFELT $ 112))
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
                        (SPADCALL (SPADCALL |n| |m| (QREFELT $ 141))
                                  (QREFELT $ 53))
                        . #9#)
                  (EXIT
                   (COND
                    ((QEQCAR |r| 0)
                     (PROGN
                      (LETT #1#
                            (COND
                             ((SPADCALL (QCDR |r|) 0 (QREFELT $ 112))
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
                                                                              143))
                                                           . #9#)
                                                     (COND
                                                      (#3#
                                                       (LETT #4#
                                                             (SPADCALL #4# #5#
                                                                       (QREFELT
                                                                        $ 116))
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
                                            (QREFELT $ 116)))
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

(DECLAIM (NOTINLINE |ElementaryFunctionStructurePackage;|)) 

(DEFUN |ElementaryFunctionStructurePackage| (&REST #1=#:G964)
  (PROG ()
    (RETURN
     (PROG (#2=#:G965)
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
      (QSETREFV $ 135
                (SPADCALL (SPADCALL '|%iint| (QREFELT $ 132)) (QREFELT $ 134)))
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
              (200 . |new|) (207 . |setelt|) (|Union| 114 '"failed")
              (|IntegerLinearDependence| 7) (215 . |solveLinearlyOverQ|)
              (221 . |One|) 'ALGOP (|BasicOperator|) (225 . |operator|)
              (230 . |has?|) (236 . |elt|) (|Union| 39 '#1#)
              (242 . |retractIfCan|) (247 . |kernels|) (252 . =) (258 . -)
              (|List| 39) (|MultiplicativeDependence|) (263 . |logDependenceQ|)
              (|Kernel| $) (269 . |coerce|) (274 . |log|)
              (|Union| 103 '"failed") (|Expression| 6) (|Numeric| 6)
              (279 . |numericIfCan|) (|Float|) (285 . |rationalApproximation|)
              (291 . |Zero|) (295 . |coerce|) (300 . /) (306 . |float|)
              (313 . -) (319 . |abs|) (324 . >) (330 . >) (336 . ^)
              (|Vector| 39) (342 . |zero|) (347 . *) (353 . |new|)
              (357 . |kernel|) (|List| $) (362 . |eval|) (369 . |atan|)
              (374 . ~=) (380 . |coerce|) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 29)
              (|PolynomialCategoryLifting| (|IndexedExponents| 29) 29 6 125 7)
              (385 . |map|) (|SparseMultivariatePolynomial| 6 96)
              (392 . |numer|) (397 . |denom|) (|CommonOperators|)
              (402 . |operator|) (|LiouvillianFunction| 6 7) (407 . |operator|)
              '|opint| (412 . |is?|) (418 . |zero?|) (423 . |last|)
              (428 . |exp|) (433 . ^) (439 . -) (445 . |sqrt|) (450 . +)
              (456 . *) (462 . |One|) (466 . |elt|) (472 . |coerce|) (477 . D)
              (483 . |kernel|) (489 . |name|) (494 . |minIndex|) (499 . |elt|)
              (505 . |retract|) (510 . |nthRoot|) (516 . |second|)
              (521 . |retract|) (526 . ~=) (532 . |coerce|) (537 . /) (543 . ^)
              (549 . *) (555 . |retractIfCan|) (560 . |height|) (565 . >)
              (|Union| $ '"failed") (571 . |recip|) (576 . |inv|) (581 . *)
              (587 . *) (593 . |every?|)
              (|Record| (|:| |num| (|Vector| 12)) (|:| |den| 12))
              (|InnerCommonDenominator| 12 39 (|Vector| 12) 114)
              (599 . |splitDenominator|) (604 . |lcm|) (609 . *)
              (615 . |coerce|) (620 . |setDifference|) (626 . |empty?|)
              (|Record| (|:| |func| 7) (|:| |kers| 37) (|:| |vals| 31))
              |EFSTRUC;rischNormalize;FLR;44| |EFSTRUC;rischNormalize;FSR;45|
              |EFSTRUC;rootNormalize;FKF;46| (631 . |construct|)
              (636 . |solveLinearlyOverQ|) (|Union| 7 '"failed")
              |EFSTRUC;validExponential;LFSU;49|
              (|Record| (|:| |exponent| 63) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 29) 29 6 125 7)
              (642 . |froot|)
              (|Union| (|:| |vec| 114) (|:| |func| 7) (|:| |fail| 27))
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
                                                   103 39 0 63 104 0 39 0 105 1
                                                   103 0 39 106 2 103 0 0 0 107
                                                   3 103 0 12 12 42 108 2 103 0
                                                   0 0 109 1 103 0 0 110 2 103
                                                   27 0 0 111 2 12 27 0 0 112 2
                                                   7 0 0 12 113 1 114 0 63 115
                                                   2 7 0 0 0 116 0 19 0 117 1
                                                   29 0 19 118 3 7 0 0 58 119
                                                   120 1 7 0 0 121 2 29 27 0 0
                                                   122 1 7 0 6 123 3 126 7 17
                                                   124 125 127 1 7 128 0 129 1
                                                   7 128 0 130 1 131 84 19 132
                                                   1 133 84 84 134 2 84 27 0 19
                                                   136 1 7 27 0 137 1 31 7 0
                                                   138 1 7 0 0 139 2 7 0 0 42
                                                   140 2 7 0 0 0 141 1 7 0 0
                                                   142 2 7 0 0 0 143 2 7 0 42 0
                                                   144 0 125 0 145 2 7 0 84 119
                                                   146 1 7 0 19 147 2 7 0 0 19
                                                   148 2 7 0 84 119 149 1 84 19
                                                   0 150 1 114 12 0 151 2 114
                                                   39 0 12 152 1 39 12 0 153 2
                                                   7 0 0 12 154 1 31 7 0 155 1
                                                   7 12 0 156 2 12 27 0 0 157 1
                                                   39 0 12 158 2 39 0 0 0 159 2
                                                   7 0 0 39 160 2 7 0 39 0 161
                                                   1 39 52 0 162 1 29 63 0 163
                                                   2 63 27 0 0 164 1 39 165 0
                                                   166 1 39 0 0 167 2 7 0 12 0
                                                   168 2 39 0 0 12 169 2 37 27
                                                   36 0 170 1 172 171 114 173 1
                                                   12 0 119 174 2 39 0 12 0 175
                                                   1 6 0 12 176 2 21 0 0 0 177
                                                   1 114 27 0 178 1 69 0 31 183
                                                   2 80 79 69 7 184 2 188 187 7
                                                   63 189 1 0 190 29 191 2 12 0
                                                   0 0 192 1 7 0 0 193 1 0 7 7
                                                   194 2 7 0 0 19 195 2 0 7 7
                                                   19 196 1 12 0 0 197 3 0 185
                                                   37 7 19 186 2 0 7 39 7 51 2
                                                   0 7 7 29 182 2 0 7 17 7 18 2
                                                   0 179 7 19 181 2 0 179 7 21
                                                   180 1 0 7 7 24 2 0 7 7 19 25
                                                   1 0 7 7 23 2 0 7 7 19 20 1 0
                                                   7 7 194 2 0 7 7 19 196 1 0
                                                   190 29 191)))))
           '|lookupComplete|)) 
