
(/VERSIONCHECK 2) 

(DEFUN |IDEAL;npoly| (|f| $)
  (COND
   ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)) (|spadConstant| $ 16))
   ('T
    (SPADCALL
     (SPADCALL (SPADCALL |f| (QREFELT $ 17))
               (SPADCALL 0 (SPADCALL |f| (QREFELT $ 20)) (QREFELT $ 22))
               (QREFELT $ 23))
     (|IDEAL;npoly| (SPADCALL |f| (QREFELT $ 24)) $) (QREFELT $ 25))))) 

(DEFUN |IDEAL;oldpoly| (|q| $)
  (PROG (|g| |n| |dq|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |q| (|spadConstant| $ 16) (QREFELT $ 26))
        (CONS 0 (|spadConstant| $ 13)))
       (#1='T
        (SEQ (LETT |dq| (SPADCALL |q| (QREFELT $ 27)) . #2=(|IDEAL;oldpoly|))
             (LETT |n| (SPADCALL |dq| (QREFELT $ 28)) . #2#)
             (EXIT
              (COND ((SPADCALL |n| 0 (QREFELT $ 29)) (CONS 1 "failed"))
                    (#1#
                     (SEQ
                      (LETT |g|
                            (|IDEAL;oldpoly| (SPADCALL |q| (QREFELT $ 30)) $)
                            . #2#)
                      (EXIT
                       (COND ((QEQCAR |g| 1) (CONS 1 "failed"))
                             (#1#
                              (CONS 0
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |q| (QREFELT $ 31))
                                               (SPADCALL |dq| (QREFELT $ 32))
                                               (QREFELT $ 33))
                                     (QCDR |g|) (QREFELT $ 34))))))))))))))))) 

(DEFUN |IDEAL;leadterm| (|f| |lvar| $)
  (PROG (|lf|)
    (RETURN
     (COND
      ((OR (NULL (LETT |lf| (SPADCALL |f| (QREFELT $ 36)) |IDEAL;leadterm|))
           (SPADCALL |lf| |lvar| (QREFELT $ 37)))
       |f|)
      ('T
       (|IDEAL;leadterm|
        (SPADCALL (SPADCALL |f| (|SPADfirst| |lf|) (QREFELT $ 39))
                  (QREFELT $ 41))
        |lvar| $)))))) 

(DEFUN |IDEAL;choosel| (|f| |g| $)
  (PROG (|f1|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |g| (|spadConstant| $ 13) (QREFELT $ 15)) |f|)
            (#1='T
             (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT $ 43)) |IDEAL;choosel|)
                  (EXIT
                   (COND ((QEQCAR |f1| 1) |f|)
                         (#1# (|IDEAL;choosel| (QCDR |f1|) |g| $))))))))))) 

(DEFUN |IDEAL;contractGrob| (I1 $)
  (PROG (#1=#:G159 #2=#:G175 |f| #3=#:G174 J1)
    (RETURN
     (SEQ (LETT J1 (SPADCALL I1 (QREFELT $ 46)) . #4=(|IDEAL;contractGrob|))
          (SEQ G190
               (COND
                ((NULL (QEQCAR (|IDEAL;oldpoly| (|SPADfirst| J1) $) 1))
                 (GO G191)))
               (SEQ (EXIT (LETT J1 (CDR J1) . #4#))) NIL (GO G190) G191
               (EXIT NIL))
          (EXIT
           (CONS
            (PROGN
             (LETT #3# NIL . #4#)
             (SEQ (LETT |f| NIL . #4#) (LETT #2# J1 . #4#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (PROG2 (LETT #1# (|IDEAL;oldpoly| |f| $) . #4#)
                               (QCDR #1#)
                             (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                           #3#)
                          . #4#)))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                  (EXIT (NREVERSE #3#))))
            'T)))))) 

(DEFUN |IDEAL;makeleast| (|fullVars| |leastVars| $)
  (PROG (#1=#:G181 |vv| #2=#:G180 |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |leastVars|) . #3=(|IDEAL;makeleast|))
          (EXIT
           (COND ((< (LENGTH |fullVars|) |n|) (|error| "wrong vars"))
                 ((EQL |n| 0) |fullVars|)
                 (#4='T
                  (APPEND
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |vv| NIL . #3#) (LETT #1# |fullVars| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |vv| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((COND
                              ((SPADCALL |vv| |leastVars| (QREFELT $ 47)) 'NIL)
                              (#4# 'T))
                             (LETT #2# (CONS |vv| #2#) . #3#)))))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   |leastVars|)))))))) 

(DEFUN |IDEAL;isMonic?| (|f| |x| $)
  (SPADCALL (SPADCALL (SPADCALL |f| |x| (QREFELT $ 39)) (QREFELT $ 41))
            (QREFELT $ 48))) 

(DEFUN |IDEAL;subset| (|lv| $)
  (PROG (|l1| #1=#:G189 |set| #2=#:G188 |ll| |v|)
    (RETURN
     (SEQ
      (COND ((EQL (LENGTH |lv|) 1) (LIST |lv| NIL))
            ('T
             (SEQ
              (LETT |v| (SPADCALL |lv| 1 (QREFELT $ 52)) . #3=(|IDEAL;subset|))
              (LETT |ll| (|IDEAL;subset| (CDR |lv|) $) . #3#)
              (LETT |l1|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |set| NIL . #3#) (LETT #1# |ll| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |set| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #2# (CONS (CONS |v| |set|) #2#) . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (EXIT (SPADCALL |l1| |ll| (QREFELT $ 54)))))))))) 

(DEFUN |IDEAL;monomDim| (|listm| |lv| $)
  (PROG (#1=#:G200 |ldif| #2=#:G203 |mvset| #3=#:G202 |subs| |lsubset| |monvar|
         #4=#:G201 |f|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |monvar| NIL . #5=(|IDEAL;monomDim|))
            (SEQ (LETT |f| NIL . #5#)
                 (LETT #4# (SPADCALL |listm| (QREFELT $ 56)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ (LETT |mvset| (SPADCALL |f| (QREFELT $ 36)) . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |mvset|) 1 (QREFELT $ 57))
                         (LETT |monvar| (CONS |mvset| |monvar|) . #5#))
                        ('T
                         (LETT |lv|
                               (SPADCALL |lv|
                                         (SPADCALL
                                          (SPADCALL |mvset| 1 (QREFELT $ 52))
                                          |lv| (QREFELT $ 59))
                                         (QREFELT $ 60))
                               . #5#)))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((NULL |lv|) 0)
                   ('T
                    (SEQ
                     (LETT |lsubset|
                           (SPADCALL (CONS #'|IDEAL;monomDim!0| $)
                                     (|IDEAL;subset| |lv| $) (QREFELT $ 63))
                           . #5#)
                     (SEQ (LETT |subs| NIL . #5#) (LETT #3# |lsubset| . #5#)
                          G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |subs| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ (LETT |ldif| |lv| . #5#)
                               (SEQ (LETT |mvset| NIL . #5#)
                                    (LETT #2# |monvar| . #5#) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN
                                           (LETT |mvset| (CAR #2#) . #5#)
                                           NIL)
                                          (NULL
                                           (SPADCALL |ldif| NIL
                                                     (QREFELT $ 64))))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |ldif|
                                            (SPADCALL |mvset| |subs|
                                                      (QREFELT $ 65))
                                            . #5#)))
                                    (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (COND
                                 ((NULL (NULL |ldif|))
                                  (PROGN
                                   (LETT #1# (LENGTH |subs|) . #5#)
                                   (GO #1#))))))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                     (EXIT 0)))))))
      #1# (EXIT #1#))))) 

(DEFUN |IDEAL;monomDim!0| (|z1| |z2| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 61)) (SPADCALL |z2| (QREFELT $ 61))
            (QREFELT $ 57))) 

(DEFUN |IDEAL;=;2$B;10| (I J $)
  (COND ((SPADCALL I J (QREFELT $ 66)) (SPADCALL J I (QREFELT $ 66)))
        ('T 'NIL))) 

(DEFUN |IDEAL;element?;DPoly$B;11| (|f| I $)
  (PROG (|Id|)
    (RETURN
     (SEQ
      (LETT |Id| (QCAR (SPADCALL I (QREFELT $ 68)))
            |IDEAL;element?;DPoly$B;11|)
      (EXIT
       (COND ((NULL |Id|) (SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)))
             ('T
              (SPADCALL (SPADCALL |f| |Id| (QREFELT $ 70))
                        (|spadConstant| $ 13) (QREFELT $ 15))))))))) 

(DEFUN |IDEAL;in?;2$B;12| (I J $)
  (PROG (#1=#:G210 #2=#:G209 #3=#:G211 #4=#:G214 |f|)
    (RETURN
     (SEQ (LETT J (SPADCALL J (QREFELT $ 68)) . #5=(|IDEAL;in?;2$B;12|))
          (EXIT
           (COND ((NULL (QCAR I)) 'T)
                 (#6='T
                  (PROGN
                   (LETT #1# NIL . #5#)
                   (SEQ (LETT |f| NIL . #5#) (LETT #4# (QCAR I) . #5#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #3# (SPADCALL |f| J (QREFELT $ 71)) . #5#)
                           (COND
                            (#1# (LETT #2# (COND (#2# #3#) ('T 'NIL)) . #5#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #5#)
                              (LETT #1# 'T . #5#)))))))
                        (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                   (COND (#1# #2#) (#6# 'T)))))))))) 

(DEFUN |IDEAL;groebner;2$;13| (I $)
  (PROG (#1=#:G216 #2=#:G215 #3=#:G217 #4=#:G222 |f|)
    (RETURN
     (SEQ
      (COND
       ((QCDR I)
        (COND
         ((PROGN
           (LETT #1# NIL . #5=(|IDEAL;groebner;2$;13|))
           (SEQ (LETT |f| NIL . #5#) (LETT #4# (QCAR I) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (COND ((SPADCALL |f| (QREFELT $ 72)) 'NIL) ('T 'T))
                         . #5#)
                   (COND (#1# (LETT #2# (COND (#2# 'T) ('T #3#)) . #5#))
                         ('T
                          (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) (#6='T 'NIL)))
          I)
         (#6# (CONS NIL 'T))))
       (#6# (CONS (SPADCALL (QCAR I) (QREFELT $ 73)) 'T))))))) 

(DEFUN |IDEAL;intersect;3$;14| (I J $)
  (PROG (#1=#:G233 |f| #2=#:G232 #3=#:G231 #4=#:G230 |tp1| |tp| |Jd| |Id|)
    (RETURN
     (SEQ
      (COND ((NULL (LETT |Id| (QCAR I) . #5=(|IDEAL;intersect;3$;14|))) I)
            ((NULL (LETT |Jd| (QCAR J) . #5#)) J)
            ('T
             (SEQ
              (LETT |tp|
                    (SPADCALL (|spadConstant| $ 49)
                              (SPADCALL 1 (|spadConstant| $ 19) (QREFELT $ 22))
                              (QREFELT $ 23))
                    . #5#)
              (LETT |tp1| (SPADCALL |tp| (|spadConstant| $ 74) (QREFELT $ 75))
                    . #5#)
              (EXIT
               (|IDEAL;contractGrob|
                (SPADCALL
                 (PROGN
                  (LETT #4# NIL . #5#)
                  (SEQ (LETT |f| NIL . #5#) (LETT #3# |Id| . #5#) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (SPADCALL |tp| (|IDEAL;npoly| |f| $)
                                          (QREFELT $ 76))
                                #4#)
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))
                 (PROGN
                  (LETT #2# NIL . #5#)
                  (SEQ (LETT |f| NIL . #5#) (LETT #1# |Jd| . #5#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL |tp1| (|IDEAL;npoly| |f| $)
                                          (QREFELT $ 76))
                                #2#)
                               . #5#)))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 77))
                $))))))))) 

(DEFUN |IDEAL;intersect;L$;15| (|lid| $)
  (PROG (#1=#:G235 #2=#:G234 #3=#:G236 #4=#:G238 |l|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|IDEAL;intersect;L$;15|))
       (SEQ (LETT |l| NIL . #5#) (LETT #4# |lid| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# |l| . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 78)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|IdentityError| '|intersect|)))))))) 

(DEFUN |IDEAL;quotient;$DPoly$;16| (I |f| $)
  (PROG (#1=#:G159 #2=#:G244 |g| #3=#:G243)
    (RETURN
     (SEQ
      (CONS
       (SPADCALL
        (PROGN
         (LETT #3# NIL . #4=(|IDEAL;quotient;$DPoly$;16|))
         (SEQ (LETT |g| NIL . #4#)
              (LETT #2#
                    (QCAR
                     (SPADCALL I (SPADCALL (LIST |f|) (QREFELT $ 81))
                               (QREFELT $ 78)))
                    . #4#)
              G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#) . #4#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #3#
                      (CONS
                       (PROG2
                           (LETT #1# (SPADCALL |g| |f| (QREFELT $ 43)) . #4#)
                           (QCDR #1#)
                         (|check_union| (QEQCAR #1# 0) (QREFELT $ 9) #1#))
                       #3#)
                      . #4#)))
              (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT (NREVERSE #3#))))
        (QREFELT $ 83))
       'T))))) 

(DEFUN |IDEAL;quotient;3$;17| (I J $)
  (PROG (#1=#:G249 #2=#:G248 #3=#:G250 #4=#:G253 |f| |Jdl|)
    (RETURN
     (SEQ (LETT |Jdl| (QCAR J) . #5=(|IDEAL;quotient;3$;17|))
          (EXIT
           (COND
            ((NULL |Jdl|)
             (SPADCALL (LIST (|spadConstant| $ 50)) (QREFELT $ 85)))
            (#6='T
             (CONS
              (QCAR
               (PROGN
                (LETT #1# NIL . #5#)
                (SEQ (LETT |f| NIL . #5#) (LETT #4# |Jdl| . #5#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3# (SPADCALL I |f| (QREFELT $ 84)) . #5#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 78)) . #5#))
                         ('T
                          (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                     (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#6# (|IdentityError| '|intersect|)))))
              'T)))))))) 

(DEFUN |IDEAL;+;3$;18| (I J $)
  (CONS (SPADCALL (SPADCALL (QCAR I) (QCAR J) (QREFELT $ 87)) (QREFELT $ 73))
        'T)) 

(DEFUN |IDEAL;*;3$;19| (I J $)
  (PROG (#1=#:G256 #2=#:G255 #3=#:G257 #4=#:G262 |f| #5=#:G261 #6=#:G260 |g|)
    (RETURN
     (SEQ
      (CONS
       (SPADCALL
        (PROGN
         (LETT #1# NIL . #7=(|IDEAL;*;3$;19|))
         (SEQ (LETT |g| NIL . #7#) (LETT #6# (QCAR J) . #7#) G190
              (COND
               ((OR (ATOM #6#) (PROGN (LETT |g| (CAR #6#) . #7#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (PROGN
                        (LETT #5# NIL . #7#)
                        (SEQ (LETT |f| NIL . #7#) (LETT #4# (QCAR I) . #7#)
                             G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |f| (CAR #4#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #5#
                                     (CONS (SPADCALL |f| |g| (QREFELT $ 89))
                                           #5#)
                                     . #7#)))
                             (LETT #4# (CDR #4#) . #7#) (GO G190) G191
                             (EXIT (NREVERSE #5#))))
                       . #7#)
                 (COND (#1# (LETT #2# (APPEND #2# #3#) . #7#))
                       ('T
                        (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
              (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) ('T NIL)))
        (QREFELT $ 73))
       'T))))) 

(DEFUN |IDEAL;^;$Nni$;20| (I |n| $)
  (PROG (#1=#:G263)
    (RETURN
     (COND ((EQL |n| 0) (CONS (LIST (|spadConstant| $ 50)) 'T))
           ('T
            (SPADCALL I
                      (SPADCALL I
                                (PROG1 (LETT #1# (- |n| 1) |IDEAL;^;$Nni$;20|)
                                  (|check_subtype| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                                (QREFELT $ 91))
                      (QREFELT $ 90))))))) 

(DEFUN |IDEAL;saturate;$DPoly$;21| (I |f| $)
  (PROG (#1=#:G269 |g| #2=#:G268 |tp|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15))
        (|error| "f is zero"))
       ('T
        (SEQ
         (LETT |tp|
               (SPADCALL
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 49)
                           (SPADCALL 1 (|spadConstant| $ 19) (QREFELT $ 22))
                           (QREFELT $ 23))
                 (|IDEAL;npoly| |f| $) (QREFELT $ 76))
                (|spadConstant| $ 74) (QREFELT $ 75))
               . #3=(|IDEAL;saturate;$DPoly$;21|))
         (EXIT
          (|IDEAL;contractGrob|
           (CONS |tp|
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |g| NIL . #3#) (LETT #1# (QCAR I) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|IDEAL;npoly| |g| $) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
           $))))))))) 

(DEFUN |IDEAL;saturate;$DPolyL$;22| (I |f| |lvar| $)
  (PROG (#1=#:G295 |g| #2=#:G294 |fullPol| #3=#:G293 |vv| #4=#:G292 |s|
         #5=#:G278 #6=#:G277 #7=#:G279 #8=#:G291 |ltg| |ltJ| #9=#:G290
         #10=#:G289 J #11=#:G288 #12=#:G287 |subVars| #13=#:G286 #14=#:G285
         |newVars| |fullVars| #15=#:G271 #16=#:G270 #17=#:G272 #18=#:G284 |Id|)
    (RETURN
     (SEQ (LETT |Id| (QCAR I) . #19=(|IDEAL;saturate;$DPolyL$;22|))
          (LETT |fullVars|
                (PROGN
                 (LETT #15# NIL . #19#)
                 (SEQ (LETT |g| NIL . #19#) (LETT #18# |Id| . #19#) G190
                      (COND
                       ((OR (ATOM #18#)
                            (PROGN (LETT |g| (CAR #18#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #17# (SPADCALL |g| (QREFELT $ 36)) . #19#)
                         (COND
                          (#15#
                           (LETT #16# (SPADCALL #16# #17# (QREFELT $ 96))
                                 . #19#))
                          ('T
                           (PROGN
                            (LETT #16# #17# . #19#)
                            (LETT #15# 'T . #19#)))))))
                      (LETT #18# (CDR #18#) . #19#) (GO G190) G191 (EXIT NIL))
                 (COND (#15# #16#) (#20='T (|IdentityError| '|setUnion|))))
                . #19#)
          (LETT |newVars| (|IDEAL;makeleast| |fullVars| |lvar| $) . #19#)
          (LETT |subVars|
                (PROGN
                 (LETT #14# NIL . #19#)
                 (SEQ (LETT |vv| NIL . #19#) (LETT #13# |newVars| . #19#) G190
                      (COND
                       ((OR (ATOM #13#)
                            (PROGN (LETT |vv| (CAR #13#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #14#
                              (CONS
                               (SPADCALL (|spadConstant| $ 50) |vv| 1
                                         (QREFELT $ 97))
                               #14#)
                              . #19#)))
                      (LETT #13# (CDR #13#) . #19#) (GO G190) G191
                      (EXIT (NREVERSE #14#))))
                . #19#)
          (LETT J
                (SPADCALL
                 (PROGN
                  (LETT #12# NIL . #19#)
                  (SEQ (LETT |g| NIL . #19#) (LETT #11# |Id| . #19#) G190
                       (COND
                        ((OR (ATOM #11#)
                             (PROGN (LETT |g| (CAR #11#) . #19#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #12#
                               (CONS
                                (SPADCALL |g| |fullVars| |subVars|
                                          (QREFELT $ 98))
                                #12#)
                               . #19#)))
                       (LETT #11# (CDR #11#) . #19#) (GO G190) G191
                       (EXIT (NREVERSE #12#))))
                 (QREFELT $ 73))
                . #19#)
          (LETT |ltJ|
                (PROGN
                 (LETT #10# NIL . #19#)
                 (SEQ (LETT |g| NIL . #19#) (LETT #9# J . #19#) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |g| (CAR #9#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #10# (CONS (|IDEAL;leadterm| |g| |lvar| $) #10#)
                              . #19#)))
                      (LETT #9# (CDR #9#) . #19#) (GO G190) G191
                      (EXIT (NREVERSE #10#))))
                . #19#)
          (LETT |s|
                (PROGN
                 (LETT #5# NIL . #19#)
                 (SEQ (LETT |ltg| NIL . #19#) (LETT #8# |ltJ| . #19#) G190
                      (COND
                       ((OR (ATOM #8#)
                            (PROGN (LETT |ltg| (CAR #8#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #7# (|IDEAL;choosel| |ltg| |f| $) . #19#)
                         (COND
                          (#5#
                           (LETT #6# (SPADCALL #6# #7# (QREFELT $ 89)) . #19#))
                          ('T
                           (PROGN
                            (LETT #6# #7# . #19#)
                            (LETT #5# 'T . #19#)))))))
                      (LETT #8# (CDR #8#) . #19#) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #6#) (#20# (|spadConstant| $ 50))))
                . #19#)
          (LETT |fullPol|
                (PROGN
                 (LETT #4# NIL . #19#)
                 (SEQ (LETT |vv| NIL . #19#) (LETT #3# |fullVars| . #19#) G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |vv| (CAR #3#) . #19#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (|spadConstant| $ 50) |vv| 1
                                         (QREFELT $ 97))
                               #4#)
                              . #19#)))
                      (LETT #3# (CDR #3#) . #19#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                . #19#)
          (EXIT
           (CONS
            (PROGN
             (LETT #2# NIL . #19#)
             (SEQ (LETT |g| NIL . #19#)
                  (LETT #1#
                        (QCAR
                         (SPADCALL (SPADCALL J (QREFELT $ 81)) |s|
                                   (QREFELT $ 95)))
                        . #19#)
                  G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #19#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL |g| |newVars| |fullPol| (QREFELT $ 98))
                           #2#)
                          . #19#)))
                  (LETT #1# (CDR #1#) . #19#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            'T)))))) 

(DEFUN |IDEAL;zeroDim?;$LB;23| (I |lvar| $)
  (PROG (|x| #1=#:G298 #2=#:G307 |f| |n| J)
    (RETURN
     (SEQ
      (LETT J (QCAR (SPADCALL I (QREFELT $ 68)))
            . #3=(|IDEAL;zeroDim?;$LB;23|))
      (EXIT
       (COND
        ((OR (NULL J)
             (SPADCALL J (LIST (|spadConstant| $ 50)) (QREFELT $ 100)))
         'NIL)
        ('T
         (SEQ (LETT |n| (LENGTH |lvar|) . #3#)
              (EXIT
               (COND ((< (LENGTH J) |n|) 'NIL)
                     ('T
                      (SEQ
                       (SEQ (LETT |f| NIL . #3#) (LETT #2# J . #3#) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |f| (CAR #2#) . #3#) NIL)
                                  (NULL (COND ((NULL |lvar|) 'NIL) ('T 'T))))
                              (GO G191)))
                            (SEQ
                             (LETT |x|
                                   (PROG2
                                       (LETT #1# (SPADCALL |f| (QREFELT $ 102))
                                             . #3#)
                                       (QCDR #1#)
                                     (|check_union| (QEQCAR #1# 0)
                                                    (QREFELT $ 8) #1#))
                                   . #3#)
                             (EXIT
                              (COND
                               ((|IDEAL;isMonic?| |f| |x| $)
                                (LETT |lvar|
                                      (SPADCALL |lvar|
                                                (SPADCALL |x| |lvar|
                                                          (QREFELT $ 59))
                                                (QREFELT $ 60))
                                      . #3#)))))
                            (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (NULL |lvar|)))))))))))))) 

(DEFUN |IDEAL;zeroDim?;$B;24| (I $)
  (PROG (#1=#:G309 #2=#:G308 #3=#:G310 #4=#:G313 |g|)
    (RETURN
     (SEQ
      (SPADCALL I
                (PROGN
                 (LETT #1# NIL . #5=(|IDEAL;zeroDim?;$B;24|))
                 (SEQ (LETT |g| NIL . #5#) (LETT #4# (QCAR I) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3# (SPADCALL |g| (QREFELT $ 36)) . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 96)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                (QREFELT $ 103)))))) 

(DEFUN |IDEAL;inRadical?;DPoly$B;25| (|f| I $)
  (PROG (#1=#:G375 |g| #2=#:G374 |Id| |tp|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 15)) 'T)
            ('T
             (SEQ
              (LETT |tp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 49)
                                (SPADCALL 1 (|spadConstant| $ 19)
                                          (QREFELT $ 22))
                                (QREFELT $ 23))
                      (|IDEAL;npoly| |f| $) (QREFELT $ 76))
                     (|spadConstant| $ 74) (QREFELT $ 75))
                    . #3=(|IDEAL;inRadical?;DPoly$B;25|))
              (LETT |Id| (QCAR I) . #3#)
              (EXIT
               (SPADCALL
                (SPADCALL (|spadConstant| $ 74)
                          (SPADCALL
                           (CONS |tp|
                                 (PROGN
                                  (LETT #2# NIL . #3#)
                                  (SEQ (LETT |g| NIL . #3#)
                                       (LETT #1# |Id| . #3#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |g| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS (|IDEAL;npoly| |g| $) #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#)))))
                           (QREFELT $ 46))
                          (QREFELT $ 105))
                (|spadConstant| $ 16) (QREFELT $ 26)))))))))) 

(DEFUN |IDEAL;dimension;$LI;26| (I |lvar| $)
  (PROG (|n1| |leadid| |ed| |truelist| #1=#:G381 #2=#:G380 #3=#:G382 #4=#:G390
         |vv| #5=#:G377 #6=#:G376 #7=#:G378 #8=#:G389 |f|)
    (RETURN
     (SEQ (LETT I (SPADCALL I (QREFELT $ 68)) . #9=(|IDEAL;dimension;$LI;26|))
          (EXIT
           (COND ((NULL (QCAR I)) (LENGTH |lvar|))
                 ((SPADCALL (|spadConstant| $ 50) I (QREFELT $ 71)) -1)
                 (#10='T
                  (SEQ
                   (LETT |truelist|
                         (PROGN
                          (LETT #5# NIL . #9#)
                          (SEQ (LETT |f| NIL . #9#) (LETT #8# (QCAR I) . #9#)
                               G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN (LETT |f| (CAR #8#) . #9#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #7# (SPADCALL |f| (QREFELT $ 36))
                                        . #9#)
                                  (COND
                                   (#5#
                                    (LETT #6# (SPADCALL #6# #7# (QREFELT $ 96))
                                          . #9#))
                                   ('T
                                    (PROGN
                                     (LETT #6# #7# . #9#)
                                     (LETT #5# 'T . #9#)))))))
                               (LETT #8# (CDR #8#) . #9#) (GO G190) G191
                               (EXIT NIL))
                          (COND (#5# #6#)
                                (#10# (|IdentityError| '|setUnion|))))
                         . #9#)
                   (EXIT
                    (COND
                     ((PROGN
                       (LETT #1# NIL . #9#)
                       (SEQ (LETT |vv| NIL . #9#) (LETT #4# |truelist| . #9#)
                            G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |vv| (CAR #4#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (PROGN
                               (LETT #3#
                                     (COND
                                      ((SPADCALL |vv| |lvar| (QREFELT $ 47))
                                       'NIL)
                                      ('T 'T))
                                     . #9#)
                               (COND
                                (#1# (LETT #2# (COND (#2# 'T) ('T #3#)) . #9#))
                                ('T
                                 (PROGN
                                  (LETT #2# #3# . #9#)
                                  (LETT #1# 'T . #9#)))))))
                            (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (COND (#1# #2#) (#10# 'NIL)))
                      (|error| "wrong variables"))
                     (#10#
                      (SEQ
                       (LETT |truelist|
                             (SPADCALL |lvar|
                                       (SPADCALL |lvar| |truelist|
                                                 (QREFELT $ 65))
                                       (QREFELT $ 65))
                             . #9#)
                       (LETT |ed| (- (LENGTH |lvar|) (LENGTH |truelist|))
                             . #9#)
                       (LETT |leadid| (SPADCALL I (QREFELT $ 107)) . #9#)
                       (LETT |n1| (|IDEAL;monomDim| |leadid| |truelist| $)
                             . #9#)
                       (EXIT (+ |ed| |n1|)))))))))))))) 

(DEFUN |IDEAL;dimension;$I;27| (I $)
  (PROG (#1=#:G392 #2=#:G391 #3=#:G393 #4=#:G396 |g|)
    (RETURN
     (SEQ
      (SPADCALL I
                (PROGN
                 (LETT #1# NIL . #5=(|IDEAL;dimension;$I;27|))
                 (SEQ (LETT |g| NIL . #5#) (LETT #4# (QCAR I) . #5#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |g| (CAR #4#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3# (SPADCALL |g| (QREFELT $ 36)) . #5#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 96)) . #5#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #5#)
                            (LETT #1# 'T . #5#)))))))
                      (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
                (QREFELT $ 108)))))) 

(DEFUN |IDEAL;leadingIdeal;2$;28| (I $)
  (PROG (#1=#:G401 |f| #2=#:G400 |Idl|)
    (RETURN
     (SEQ
      (LETT |Idl| (QCAR (SPADCALL I (QREFELT $ 68)))
            . #3=(|IDEAL;leadingIdeal;2$;28|))
      (EXIT
       (CONS
        (PROGN
         (LETT #2# NIL . #3#)
         (SEQ (LETT |f| NIL . #3#) (LETT #1# |Idl| . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (LETT #2#
                      (CONS
                       (SPADCALL |f| (SPADCALL |f| (QREFELT $ 24))
                                 (QREFELT $ 110))
                       #2#)
                      . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        'T)))))) 

(DEFUN |IDEAL;monompol| (|df| |lcf| |lv| $)
  (PROG (|g| #1=#:G405 |dd| #2=#:G406 |v|)
    (RETURN
     (SEQ (LETT |g| (SPADCALL |lcf| (QREFELT $ 112)) . #3=(|IDEAL;monompol|))
          (SEQ (LETT |v| NIL . #3#) (LETT #2# |lv| . #3#) (LETT |dd| NIL . #3#)
               (LETT #1# |df| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |g|
                       (SPADCALL |g| (SPADCALL |v| (QREFELT $ 114)) |dd|
                                 (QREFELT $ 115))
                       . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |g|))))) 

(DEFUN |IDEAL;relationsIdeal;LSt;30| (|listf| $)
  (PROG (|solsn| |g| #1=#:G426 #2=#:G425 #3=#:G427 #4=#:G448 |p| |j| |vdq| |q|
         |lcq| |dq| #5=#:G447 |lf| #6=#:G424 |n| |leq| #7=#:G445 #8=#:G446
         |pol| #9=#:G444 |npol| #10=#:G443 |v| #11=#:G442 |lp| |f| |lcf| |df|
         |vec2| #12=#:G441 |i| |gp| |nPoly| |nExponent| |DirP| |lv1| #13=#:G414
         #14=#:G440 |vv| #15=#:G439 |VarSet1| |nvar| #16=#:G438 |vl| #17=#:G437
         #18=#:G436 |lvint| #19=#:G408 #20=#:G407 #21=#:G409 #22=#:G435 |nf|)
    (RETURN
     (SEQ
      (COND ((NULL |listf|) (SPADCALL NIL NIL (QREFELT $ 119)))
            (#23='T
             (SEQ
              (LETT |nf| (LENGTH |listf|)
                    . #24=(|IDEAL;relationsIdeal;LSt;30|))
              (LETT |lvint|
                    (PROGN
                     (LETT #19# NIL . #24#)
                     (SEQ (LETT |g| NIL . #24#) (LETT #22# |listf| . #24#) G190
                          (COND
                           ((OR (ATOM #22#)
                                (PROGN (LETT |g| (CAR #22#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #21# (SPADCALL |g| (QREFELT $ 36)) . #24#)
                             (COND
                              (#19#
                               (LETT #20# (SPADCALL #20# #21# (QREFELT $ 96))
                                     . #24#))
                              ('T
                               (PROGN
                                (LETT #20# #21# . #24#)
                                (LETT #19# 'T . #24#)))))))
                          (LETT #22# (CDR #22#) . #24#) (GO G190) G191
                          (EXIT NIL))
                     (COND (#19# #20#) (#23# (|IdentityError| '|setUnion|))))
                    . #24#)
              (LETT |vl|
                    (PROGN
                     (LETT #18# NIL . #24#)
                     (SEQ (LETT |vv| NIL . #24#) (LETT #17# |lvint| . #24#)
                          G190
                          (COND
                           ((OR (ATOM #17#)
                                (PROGN (LETT |vv| (CAR #17#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #18#
                                  (CONS (SPADCALL |vv| (QREFELT $ 114)) #18#)
                                  . #24#)))
                          (LETT #17# (CDR #17#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #18#))))
                    . #24#)
              (LETT |nvar|
                    (PROGN
                     (LETT #16# NIL . #24#)
                     (SEQ (LETT |i| 1 . #24#) G190
                          (COND ((|greater_SI| |i| |nf|) (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #16# (CONS (SPADCALL (QREFELT $ 120)) #16#)
                                  . #24#)))
                          (LETT |i| (|inc_SI| |i|) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #16#))))
                    . #24#)
              (LETT |VarSet1|
                    (|OrderedVariableList|
                     (SPADCALL |vl| |nvar| (QREFELT $ 122)))
                    . #24#)
              (LETT |lv1|
                    (PROGN
                     (LETT #15# NIL . #24#)
                     (SEQ (LETT |vv| NIL . #24#) (LETT #14# |nvar| . #24#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |vv| (CAR #14#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15#
                                  (CONS
                                   (PROG2
                                       (LETT #13#
                                             (SPADCALL |vv|
                                                       (|compiledLookupCheck|
                                                        '|variable|
                                                        (LIST
                                                         (LIST '|Union| '$
                                                               '"failed")
                                                         (LIST '|Symbol|))
                                                        |VarSet1|))
                                             . #24#)
                                       (QCDR #13#)
                                     (|check_union| (QEQCAR #13# 0) |VarSet1|
                                                    #13#))
                                   #15#)
                                  . #24#)))
                          (LETT #14# (CDR #14#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    . #24#)
              (LETT |DirP| (|DirectProduct| |nf| (|NonNegativeInteger|))
                    . #24#)
              (LETT |nExponent| (|Product| (QREFELT $ 7) |DirP|) . #24#)
              (LETT |nPoly| (|PolynomialRing| (QREFELT $ 6) |nExponent|)
                    . #24#)
              (LETT |gp|
                    (|GroebnerPackage| (QREFELT $ 6) |nExponent| |VarSet1|
                                       |nPoly|)
                    . #24#)
              (LETT |lf| NIL . #24#) (LETT |lp| NIL . #24#)
              (SEQ (LETT |i| 1 . #24#) (LETT |f| NIL . #24#)
                   (LETT #12# |listf| . #24#) G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |f| (CAR #12#) . #24#) NIL))
                     (GO G191)))
                   (SEQ (LETT |vec2| (SPADCALL |nf| 0 (QREFELT $ 124)) . #24#)
                        (SPADCALL |vec2| |i| 1 (QREFELT $ 125))
                        (LETT |g|
                              (SPADCALL
                               (|compiledLookupCheck| '|Zero| (LIST '$)
                                                      |nPoly|))
                              . #24#)
                        (LETT |pol| (|spadConstant| $ 126) . #24#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |f| (|spadConstant| $ 13)
                                          (QREFELT $ 127)))
                               (GO G191)))
                             (SEQ
                              (LETT |df|
                                    (SPADCALL
                                     (SPADCALL |f|
                                               (SPADCALL |f| (QREFELT $ 24))
                                               (QREFELT $ 110))
                                     |lvint| (QREFELT $ 129))
                                    . #24#)
                              (LETT |lcf| (SPADCALL |f| (QREFELT $ 17)) . #24#)
                              (LETT |pol|
                                    (SPADCALL |pol|
                                              (|IDEAL;monompol| |df| |lcf|
                                               |lvint| $)
                                              (QREFELT $ 130))
                                    . #24#)
                              (LETT |g|
                                    (SPADCALL |g|
                                              (SPADCALL |lcf|
                                                        (SPADCALL
                                                         (SPADCALL |f|
                                                                   (QREFELT $
                                                                            20))
                                                         (SPADCALL
                                                          (|compiledLookupCheck|
                                                           '|Zero| (LIST '$)
                                                           |DirP|))
                                                         (|compiledLookupCheck|
                                                          '|construct|
                                                          (LIST '$
                                                                (|devaluate|
                                                                 (ELT $ 7))
                                                                (|devaluate|
                                                                 |DirP|))
                                                          |nExponent|))
                                                        (|compiledLookupCheck|
                                                         '|monomial|
                                                         (LIST '$
                                                               (|devaluate|
                                                                (ELT $ 6))
                                                               (|devaluate|
                                                                |nExponent|))
                                                         |nPoly|))
                                              (|compiledLookupCheck| '+
                                                                     (LIST '$
                                                                           '$
                                                                           '$)
                                                                     |nPoly|))
                                    . #24#)
                              (EXIT
                               (LETT |f| (SPADCALL |f| (QREFELT $ 24))
                                     . #24#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (LETT |lp| (CONS |pol| |lp|) . #24#)
                        (EXIT
                         (LETT |lf|
                               (CONS
                                (SPADCALL
                                 (SPADCALL (|spadConstant| $ 49)
                                           (SPADCALL (|spadConstant| $ 19)
                                                     (SPADCALL |vec2|
                                                               (|compiledLookupCheck|
                                                                '|directProduct|
                                                                (LIST '$
                                                                      (LIST
                                                                       '|Vector|
                                                                       (LIST
                                                                        '|NonNegativeInteger|)))
                                                                |DirP|))
                                                     (|compiledLookupCheck|
                                                      '|construct|
                                                      (LIST '$
                                                            (|devaluate|
                                                             (ELT $ 7))
                                                            (|devaluate|
                                                             |DirP|))
                                                      |nExponent|))
                                           (|compiledLookupCheck| '|monomial|
                                                                  (LIST '$
                                                                        (|devaluate|
                                                                         (ELT $
                                                                              6))
                                                                        (|devaluate|
                                                                         |nExponent|))
                                                                  |nPoly|))
                                 |g|
                                 (|compiledLookupCheck| '- (LIST '$ '$ '$)
                                                        |nPoly|))
                                |lf|)
                               . #24#)))
                   (LETT #12#
                         (PROG1 (CDR #12#) (LETT |i| (|inc_SI| |i|) . #24#))
                         . #24#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |npol|
                    (PROGN
                     (LETT #11# NIL . #24#)
                     (SEQ (LETT |v| NIL . #24#) (LETT #10# |nvar| . #24#) G190
                          (COND
                           ((OR (ATOM #10#)
                                (PROGN (LETT |v| (CAR #10#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS (SPADCALL |v| (QREFELT $ 138)) #11#)
                                  . #24#)))
                          (LETT #10# (CDR #10#) . #24#) (GO G190) G191
                          (EXIT (NREVERSE #11#))))
                    . #24#)
              (LETT |leq|
                    (PROGN
                     (LETT #9# NIL . #24#)
                     (SEQ (LETT |pol| NIL . #24#)
                          (LETT #8# (REVERSE |lp|) . #24#)
                          (LETT |p| NIL . #24#) (LETT #7# |npol| . #24#) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |p| (CAR #7#) . #24#) NIL)
                                (ATOM #8#)
                                (PROGN (LETT |pol| (CAR #8#) . #24#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS (SPADCALL |p| |pol| (QREFELT $ 139))
                                        #9#)
                                  . #24#)))
                          (LETT #7#
                                (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #24#))
                                . #24#)
                          (GO G190) G191 (EXIT (NREVERSE #9#))))
                    . #24#)
              (LETT |lf|
                    (SPADCALL |lf|
                              (|compiledLookupCheck| '|groebner|
                                                     (LIST
                                                      (LIST '|List|
                                                            (|devaluate|
                                                             |nPoly|))
                                                      (LIST '|List|
                                                            (|devaluate|
                                                             |nPoly|)))
                                                     |gp|))
                    . #24#)
              (SEQ
               (EXIT
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |lf| NIL
                                  (|compiledLookupCheck| '~=
                                                         (LIST
                                                          (LIST '|Boolean|) '$
                                                          '$)
                                                         (|List| |nPoly|))))
                       (GO G191)))
                     (SEQ (LETT |q| (|SPADfirst| |lf|) . #24#)
                          (LETT |dq|
                                (SPADCALL |q|
                                          (|compiledLookupCheck| '|degree|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   |nExponent|)
                                                                  '$)
                                                                 |nPoly|))
                                . #24#)
                          (LETT |n|
                                (SPADCALL |dq|
                                          (|compiledLookupCheck| '|first|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT $ 7))
                                                                  '$)
                                                                 |nExponent|))
                                . #24#)
                          (COND
                           ((SPADCALL |n| (|spadConstant| $ 19)
                                      (QREFELT $ 140))
                            (PROGN (LETT #6# |$NoValue| . #24#) (GO #6#))))
                          (EXIT (LETT |lf| (CDR |lf|) . #24#)))
                     NIL (GO G190) G191 (EXIT NIL)))
               #6# (EXIT #6#))
              (LETT |solsn| NIL . #24#)
              (SEQ (LETT |q| NIL . #24#) (LETT #5# |lf| . #24#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#) . #24#) NIL))
                     (GO G191)))
                   (SEQ (LETT |g| (|spadConstant| $ 126) . #24#)
                        (SEQ G190
                             (COND
                              ((NULL
                                (SPADCALL |q|
                                          (SPADCALL
                                           (|compiledLookupCheck| '|Zero|
                                                                  (LIST '$)
                                                                  |nPoly|))
                                          (|compiledLookupCheck| '~=
                                                                 (LIST
                                                                  (LIST
                                                                   '|Boolean|)
                                                                  '$ '$)
                                                                 |nPoly|)))
                               (GO G191)))
                             (SEQ
                              (LETT |dq|
                                    (SPADCALL |q|
                                              (|compiledLookupCheck| '|degree|
                                                                     (LIST
                                                                      (|devaluate|
                                                                       |nExponent|)
                                                                      '$)
                                                                     |nPoly|))
                                    . #24#)
                              (LETT |lcq|
                                    (SPADCALL |q|
                                              (|compiledLookupCheck|
                                               '|leadingCoefficient|
                                               (LIST (|devaluate| (ELT $ 6))
                                                     '$)
                                               |nPoly|))
                                    . #24#)
                              (LETT |q|
                                    (SPADCALL |q|
                                              (|compiledLookupCheck|
                                               '|reductum| (LIST '$ '$)
                                               |nPoly|))
                                    . #24#)
                              (LETT |vdq|
                                    (SPADCALL |dq|
                                              (|compiledLookupCheck| '|second|
                                                                     (LIST
                                                                      (|devaluate|
                                                                       |DirP|)
                                                                      '$)
                                                                     |nExponent|))
                                    . #24#)
                              (EXIT
                               (LETT |g|
                                     (SPADCALL |g|
                                               (SPADCALL |lcq|
                                                         (PROGN
                                                          (LETT #1# NIL . #24#)
                                                          (SEQ
                                                           (LETT |j| 1 . #24#)
                                                           (LETT |p| NIL
                                                                 . #24#)
                                                           (LETT #4# |npol|
                                                                 . #24#)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #4#)
                                                                 (PROGN
                                                                  (LETT |p|
                                                                        (CAR
                                                                         #4#)
                                                                        . #24#)
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (PROGN
                                                              (LETT #3#
                                                                    (SPADCALL
                                                                     |p|
                                                                     (SPADCALL
                                                                      |vdq| |j|
                                                                      (QREFELT
                                                                       $ 141))
                                                                     (QREFELT $
                                                                              142))
                                                                    . #24#)
                                                              (COND
                                                               (#1#
                                                                (LETT #2#
                                                                      (SPADCALL
                                                                       #2# #3#
                                                                       (QREFELT
                                                                        $ 143))
                                                                      . #24#))
                                                               ('T
                                                                (PROGN
                                                                 (LETT #2# #3#
                                                                       . #24#)
                                                                 (LETT #1# 'T
                                                                       . #24#)))))))
                                                           (LETT #4#
                                                                 (PROG1
                                                                     (CDR #4#)
                                                                   (LETT |j|
                                                                         (|inc_SI|
                                                                          |j|)
                                                                         . #24#))
                                                                 . #24#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (COND (#1# #2#)
                                                                ('T
                                                                 (|spadConstant|
                                                                  $ 144))))
                                                         (QREFELT $ 145))
                                               (QREFELT $ 130))
                                     . #24#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |solsn| (CONS |g| |solsn|) . #24#)))
                   (LETT #5# (CDR #5#) . #24#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |solsn| |leq| (QREFELT $ 119)))))))))) 

(DEFUN |IDEAL;coerce;L$;31| (|Id| $) (CONS |Id| 'NIL)) 

(DEFUN |IDEAL;coerce;$Of;32| (I $)
  (PROG (|Idl|)
    (RETURN
     (SEQ (LETT |Idl| (QCAR I) |IDEAL;coerce;$Of;32|)
          (EXIT
           (COND
            ((NULL |Idl|)
             (SPADCALL (LIST (|spadConstant| $ 13)) (QREFELT $ 148)))
            ('T (SPADCALL |Idl| (QREFELT $ 148))))))))) 

(DEFUN |IDEAL;ideal;L$;33| (|Id| $)
  (PROG (#1=#:G455 |f| #2=#:G454)
    (RETURN
     (SEQ
      (CONS
       (PROGN
        (LETT #2# NIL . #3=(|IDEAL;ideal;L$;33|))
        (SEQ (LETT |f| NIL . #3#) (LETT #1# |Id| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |f| (|spadConstant| $ 13) (QREFELT $ 127))
                 (LETT #2# (CONS |f| #2#) . #3#)))))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       'NIL))))) 

(DEFUN |IDEAL;groebnerIdeal;L$;34| (|Id| $) (CONS |Id| 'T)) 

(PUT '|IDEAL;generators;$L;35| '|SPADreplace| 'QCAR) 

(DEFUN |IDEAL;generators;$L;35| (I $) (QCAR I)) 

(PUT '|IDEAL;groebner?;$B;36| '|SPADreplace| 'QCDR) 

(DEFUN |IDEAL;groebner?;$B;36| (I $) (QCDR I)) 

(DEFUN |IDEAL;one?;$B;37| (I $)
  (SPADCALL (|spadConstant| $ 50) I (QREFELT $ 71))) 

(DEFUN |IDEAL;zero?;$B;38| (I $) (NULL (QCAR (SPADCALL I (QREFELT $ 68))))) 

(DECLAIM (NOTINLINE |PolynomialIdeal;|)) 

(DEFUN |PolynomialIdeal| (&REST #1=#:G462)
  (PROG ()
    (RETURN
     (PROG (#2=#:G463)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PolynomialIdeal|)
                                           '|domainEqualList|)
                . #3=(|PolynomialIdeal|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PolynomialIdeal;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PolynomialIdeal|))))))))))) 

(DEFUN |PolynomialIdeal;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialIdeal|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PolynomialIdeal| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 158) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#3|
                                                         '(|ConvertibleTo|
                                                           (|Symbol|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|PolynomialIdeal|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10
                (|Record| (|:| |idl| (|List| |#4|)) (|:| |isGr| (|Boolean|))))
      (QSETREFV $ 11 (|Product| (|NonNegativeInteger|) |#2|))
      (QSETREFV $ 12 (|PolynomialRing| |#1| (QREFELT $ 11)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 146
                   (CONS (|dispatchFunction| |IDEAL;relationsIdeal;LSt;30|)
                         $)))))
      $)))) 

(MAKEPROP '|PolynomialIdeal| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|Rep| '|newExpon| '|newPoly|
              (0 . |Zero|) (|Boolean|) (4 . =) (10 . |Zero|)
              (14 . |leadingCoefficient|) (19 . |Zero|) (23 . |Zero|)
              (27 . |degree|) (|NonNegativeInteger|) (32 . |construct|)
              (38 . |monomial|) (44 . |reductum|) (49 . +) (55 . =)
              (61 . |degree|) (66 . |first|) (71 . ~=) (77 . |reductum|)
              (82 . |leadingCoefficient|) (87 . |second|) (92 . |monomial|)
              (98 . +) (|List| 8) (104 . |variables|) (109 . =)
              (|SparseUnivariatePolynomial| $) (115 . |univariate|)
              (|SparseUnivariatePolynomial| 9) (121 . |leadingCoefficient|)
              (|Union| $ '"failed") (126 . |exquo|) (|List| 12)
              (|GroebnerPackage| 6 11 8 12) (132 . |groebner|)
              (137 . |member?|) (143 . |ground?|) (148 . |One|) (152 . |One|)
              (|Integer|) (156 . |elt|) (|List| 35) (162 . |concat|) (|List| 9)
              |IDEAL;generators;$L;35| (168 . >) (174 . |One|)
              (178 . |position|) (184 . |delete|) (190 . |#|)
              (|Mapping| 14 35 35) (195 . |sort|) (201 . ~=)
              (207 . |setDifference|) |IDEAL;in?;2$B;12| |IDEAL;=;2$B;10|
              |IDEAL;groebner;2$;13| (|GroebnerPackage| 6 7 8 9)
              (213 . |normalForm|) |IDEAL;element?;DPoly$B;11| (219 . |zero?|)
              (224 . |groebner|) (229 . |One|) (233 . -) (239 . *)
              (245 . |concat|) |IDEAL;intersect;3$;14| (|List| $)
              |IDEAL;intersect;L$;15| |IDEAL;coerce;L$;31|
              (|GroebnerInternalPackage| 6 7 8 9) (251 . |minGbasis|)
              |IDEAL;quotient;$DPoly$;16| |IDEAL;ideal;L$;33|
              |IDEAL;quotient;3$;17| (256 . |concat|) |IDEAL;+;3$;18| (262 . *)
              |IDEAL;*;3$;19| |IDEAL;^;$Nni$;20| (268 . |One|) (|Fraction| 51)
              (272 . |One|) |IDEAL;saturate;$DPoly$;21| (276 . |setUnion|)
              (282 . |monomial|) (289 . |eval|) |IDEAL;saturate;$DPolyL$;22|
              (296 . =) (|Union| 8 '"failed") (302 . |mainVariable|)
              |IDEAL;zeroDim?;$LB;23| |IDEAL;zeroDim?;$B;24|
              (307 . |normalForm|) |IDEAL;inRadical?;DPoly$B;25|
              |IDEAL;leadingIdeal;2$;28| |IDEAL;dimension;$LI;26|
              |IDEAL;dimension;$I;27| (313 . -) (|Polynomial| 6)
              (319 . |coerce|) (|Symbol|) (324 . |convert|) (329 . |monomial|)
              (|List| 111) (|List| 132) (|SuchThat| 116 117)
              (336 . |construct|) (342 . |new|) (|List| 113) (346 . |concat|)
              (|Vector| 21) (352 . |new|) (358 . |setelt|) (365 . |Zero|)
              (369 . ~=) (|List| 21) (375 . |degree|) (381 . +) (387 . |Zero|)
              (|Equation| 111) (391 . |Zero|) (|Product| 21 7) (395 . |Zero|)
              (|IndexedExponents| 113) (399 . |Zero|) (403 . |coerce|)
              (408 . =) (414 . =) (420 . |elt|) (426 . ^) (432 . *)
              (438 . |One|) (442 . *) (448 . |relationsIdeal|) (|OutputForm|)
              (453 . |coerce|) |IDEAL;coerce;$Of;32|
              |IDEAL;groebnerIdeal;L$;34| |IDEAL;groebner?;$B;36|
              |IDEAL;one?;$B;37| |IDEAL;zero?;$B;38|
              (|Record| (|:| |mval| (|Matrix| 6)) (|:| |invmval| (|Matrix| 6))
                        (|:| |genIdeal| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 458 |zeroDim?| 464 |zero?| 475 |saturate| 480 |relationsIdeal|
              493 |quotient| 498 |one?| 510 |leadingIdeal| 515 |latex| 520
              |intersect| 525 |inRadical?| 536 |in?| 542 |ideal| 548
              |hashUpdate!| 553 |hash| 559 |groebnerIdeal| 564 |groebner?| 569
              |groebner| 574 |generators| 579 |generalPosition| 584 |element?|
              590 |dimension| 596 |coerce| 607 |backOldPos| 617 ^ 622 = 628 +
              634 * 640)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 147))
                        (|makeByteWordVec2| 157
                                            '(0 9 0 13 2 9 14 0 0 15 0 12 0 16
                                              1 9 6 0 17 0 6 0 18 0 7 0 19 1 9
                                              7 0 20 2 11 0 21 7 22 2 12 0 6 11
                                              23 1 9 0 0 24 2 12 0 0 0 25 2 12
                                              14 0 0 26 1 12 11 0 27 1 11 21 0
                                              28 2 21 14 0 0 29 1 12 0 0 30 1
                                              12 6 0 31 1 11 7 0 32 2 9 0 6 7
                                              33 2 9 0 0 0 34 1 9 35 0 36 2 35
                                              14 0 0 37 2 9 38 0 8 39 1 40 9 0
                                              41 2 9 42 0 0 43 1 45 44 44 46 2
                                              35 14 8 0 47 1 9 14 0 48 0 6 0 49
                                              0 9 0 50 2 35 8 0 51 52 2 53 0 0
                                              0 54 2 21 14 0 0 57 0 21 0 58 2
                                              35 51 8 0 59 2 35 0 0 51 60 1 35
                                              21 0 61 2 53 0 62 0 63 2 35 14 0
                                              0 64 2 35 0 0 0 65 2 69 9 9 55 70
                                              1 9 14 0 72 1 69 55 55 73 0 12 0
                                              74 2 12 0 0 0 75 2 12 0 0 0 76 2
                                              44 0 0 0 77 1 82 55 55 83 2 55 0
                                              0 0 87 2 9 0 0 0 89 0 11 0 92 0
                                              93 0 94 2 35 0 0 0 96 3 9 0 0 8
                                              21 97 3 9 0 0 35 79 98 2 55 14 0
                                              0 100 1 9 101 0 102 2 45 12 12 44
                                              105 2 9 0 0 0 110 1 111 0 6 112 1
                                              8 113 0 114 3 111 0 0 113 21 115
                                              2 118 0 116 117 119 0 113 0 120 2
                                              121 0 0 0 122 2 123 0 21 21 124 3
                                              123 21 0 51 21 125 0 111 0 126 2
                                              9 14 0 0 127 2 9 128 0 35 129 2
                                              111 0 0 0 130 0 11 0 131 0 132 0
                                              133 0 134 0 135 0 136 0 137 1 111
                                              0 113 138 2 132 0 111 111 139 2 7
                                              14 0 0 140 2 123 21 0 51 141 2
                                              111 0 0 21 142 2 111 0 0 0 143 0
                                              111 0 144 2 111 0 6 0 145 1 0 118
                                              55 146 1 55 147 0 148 2 0 14 0 0
                                              1 1 0 14 0 104 2 0 14 0 35 103 1
                                              0 14 0 153 3 0 0 0 9 35 99 2 0 0
                                              0 9 95 1 1 118 55 146 2 0 0 0 9
                                              84 2 0 0 0 0 86 1 0 14 0 152 1 0
                                              0 0 107 1 0 155 0 1 1 0 0 79 80 2
                                              0 0 0 0 78 2 0 14 9 0 106 2 0 14
                                              0 0 66 1 0 0 55 85 2 0 157 157 0
                                              1 1 0 156 0 1 1 0 0 55 150 1 0 14
                                              0 151 1 0 0 0 68 1 0 55 0 56 2 0
                                              154 0 35 1 2 0 14 9 0 71 1 0 51 0
                                              109 2 0 51 0 35 108 1 0 0 55 81 1
                                              0 147 0 149 1 0 0 154 1 2 0 0 0
                                              21 91 2 0 14 0 0 67 2 0 0 0 0 88
                                              2 0 0 0 0 90)))))
           '|lookupComplete|)) 
