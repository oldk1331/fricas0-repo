
(/VERSIONCHECK 2) 

(DEFUN |ES-;box;2S;1| (|x| $) (SPADCALL (LIST |x|) (QREFELT $ 15))) 

(DEFUN |ES-;paren;2S;2| (|x| $) (SPADCALL (LIST |x|) (QREFELT $ 17))) 

(DEFUN |ES-;belong?;BoB;3| (|op| $)
  (COND
   ((SPADCALL |op| '|any| (QREFELT $ 20))
    (COND ((SPADCALL |op| '|%paren| (QREFELT $ 21)) 'T)
          (#1='T (SPADCALL |op| '|%box| (QREFELT $ 21)))))
   (#1# 'NIL))) 

(DEFUN |ES-;listk| (|f| $) (SPADCALL (|ES-;allKernels| |f| $) (QREFELT $ 25))) 

(DEFUN |ES-;tower;SL;5| (|f| $) (SPADCALL (|ES-;listk| |f| $) (QREFELT $ 26))) 

(DEFUN |ES-;allk| (|l| $)
  (PROG (#1=#:G146 |f| #2=#:G145)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 29)
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;allk|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|ES-;allKernels| |f| $) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (SPADCALL (QREFELT $ 30)) (QREFELT $ 33)))))) 

(DEFUN |ES-;operators;SL;7| (|f| $)
  (PROG (#1=#:G151 |k| #2=#:G150)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ES-;operators;SL;7|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# (|ES-;listk| |f| $) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 35)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ES-;height;SNni;8| (|f| $)
  (PROG (#1=#:G157 |k| #2=#:G156)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 39)
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;height;SNni;8|))
                 (SEQ (LETT |k| NIL . #3#)
                      (LETT #1# (SPADCALL |f| (QREFELT $ 40)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 41)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                0 (QREFELT $ 44)))))) 

(DEFUN |ES-;freeOf?;SSB;9| (|x| |s| $)
  (PROG (#1=#:G162 |k| #2=#:G161)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |s|
                  (PROGN
                   (LETT #2# NIL . #3=(|ES-;freeOf?;SSB;9|))
                   (SEQ (LETT |k| NIL . #3#)
                        (LETT #1# (|ES-;listk| |x| $) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 46)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 48))
        'NIL)
       ('T 'T)))))) 

(DEFUN |ES-;distribute;2S;10| (|x| $)
  (PROG (#1=#:G166 |k| #2=#:G165)
    (RETURN
     (SEQ
      (|ES-;unwrap|
       (PROGN
        (LETT #2# NIL . #3=(|ES-;distribute;2S;10|))
        (SEQ (LETT |k| NIL . #3#) (LETT #1# (|ES-;listk| |x| $) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |k| (QREFELT $ 12) (QREFELT $ 50))
                 (LETT #2# (CONS |k| #2#) . #3#)))))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       |x| $))))) 

(DEFUN |ES-;box;LS;11| (|l| $) (SPADCALL (QREFELT $ 13) |l| (QREFELT $ 52))) 

(DEFUN |ES-;paren;LS;12| (|l| $) (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 52))) 

(DEFUN |ES-;freeOf?;2SB;13| (|x| |k| $)
  (COND
   ((SPADCALL (SPADCALL |k| (QREFELT $ 56)) (|ES-;listk| |x| $) (QREFELT $ 57))
    'NIL)
   ('T 'T))) 

(DEFUN |ES-;kernel;Bo2S;14| (|op| |arg| $)
  (SPADCALL |op| (LIST |arg|) (QREFELT $ 59))) 

(DEFUN |ES-;elt;Bo2S;15| (|op| |x| $) (SPADCALL |op| (LIST |x|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo3S;16| (|op| |x| |y| $)
  (SPADCALL |op| (LIST |x| |y|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo4S;17| (|op| |x| |y| |z| $)
  (SPADCALL |op| (LIST |x| |y| |z|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo5S;18| (|op| |x| |y| |z| |t| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo6S;19| (|op| |x| |y| |z| |t| |s| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo7S;20| (|op| |x| |y| |z| |t| |s| |r| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo8S;21| (|op| |x| |y| |z| |t| |s| |r| |q| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo9S;22| (|op| |x| |y| |z| |t| |s| |r| |q| |p| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p|) (QREFELT $ 52))) 

(DEFUN |ES-;elt;Bo10S;23| (|op| |x| |y| |z| |t| |s| |r| |q| |p| |o| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p| |o|) (QREFELT $ 52))) 

(DEFUN |ES-;eval;SSMS;24| (|x| |s| |f| $)
  (SPADCALL |x| (LIST |s|) (LIST |f|) (QREFELT $ 72))) 

(DEFUN |ES-;eval;SBoMS;25| (|x| |s| |f| $)
  (SPADCALL |x| (LIST (SPADCALL |s| (QREFELT $ 74))) (LIST |f|) (QREFELT $ 72))) 

(DEFUN |ES-;eval;SSMS;26| (|x| |s| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL |x| (LIST |s|)
               (LIST (CONS #'|ES-;eval;SSMS;26!0| (VECTOR |f| $)))
               (QREFELT $ 72))))) 

(DEFUN |ES-;eval;SSMS;26!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SSMS;26|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |f|))))) 

(DEFUN |ES-;eval;SBoMS;27| (|x| |s| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL |x| (LIST |s|)
               (LIST (CONS #'|ES-;eval;SBoMS;27!0| (VECTOR |f| $)))
               (QREFELT $ 80))))) 

(DEFUN |ES-;eval;SBoMS;27!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SBoMS;27|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |f|))))) 

(DEFUN |ES-;subst;SES;28| (|x| |e| $) (SPADCALL |x| (LIST |e|) (QREFELT $ 83))) 

(DEFUN |ES-;eval;SLLS;29| (|x| |ls| |lf| $)
  (PROG (#1=#:G212 |f| #2=#:G211)
    (RETURN
     (SEQ
      (SPADCALL |x| |ls|
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;eval;SLLS;29|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|ES-;eval;SLLS;29!0| (VECTOR |f| $))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 80)))))) 

(DEFUN |ES-;eval;SLLS;29!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SLLS;29|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |f|))))) 

(DEFUN |ES-;eval;SLLS;30| (|x| |ls| |lf| $)
  (PROG (#1=#:G217 |f| #2=#:G216)
    (RETURN
     (SEQ
      (SPADCALL |x| |ls|
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;eval;SLLS;30|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|ES-;eval;SLLS;30!0| (VECTOR |f| $))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 72)))))) 

(DEFUN |ES-;eval;SLLS;30!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SLLS;30|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 77)) |f|))))) 

(DEFUN |ES-;eval;SLLS;31| (|x| |ls| |lf| $)
  (PROG (#1=#:G222 |s| #2=#:G221)
    (RETURN
     (SEQ
      (SPADCALL |x|
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;eval;SLLS;31|))
                 (SEQ (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 74)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                |lf| (QREFELT $ 72)))))) 

(DEFUN |ES-;map;MKS;32| (|fn| |k| $)
  (PROG (|l| #1=#:G253 |x| #2=#:G252)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |l|
               (PROGN
                (LETT #2# NIL . #3=(|ES-;map;MKS;32|))
                (SEQ (LETT |x| NIL . #3#)
                     (LETT #1# (SPADCALL |k| (QREFELT $ 90)) . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT (LETT #2# (CONS (SPADCALL |x| |fn|) #2#) . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               . #3#)
         (SPADCALL |k| (QREFELT $ 90)) (QREFELT $ 91))
        (SPADCALL |k| (QREFELT $ 92)))
       ('T (SPADCALL (SPADCALL |k| (QREFELT $ 35)) |l| (QREFELT $ 52)))))))) 

(DEFUN |ES-;operator;2Bo;33| (|op| $)
  (COND ((SPADCALL |op| '|%paren| (QREFELT $ 21)) (QREFELT $ 12))
        ((SPADCALL |op| '|%box| (QREFELT $ 21)) (QREFELT $ 13))
        ('T
         (|error|
          (SPADCALL
           (STRCONC "Unknown operator 1: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 74)) (QREFELT $ 95)))
           (QREFELT $ 97)))))) 

(DEFUN |ES-;mainKernel;SU;34| (|x| $)
  (PROG (|k| |n| #1=#:G269 |kk| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l| (SPADCALL |x| (QREFELT $ 40))
               . #2=(|ES-;mainKernel;SU;34|)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |n| (SPADCALL (LETT |k| (|SPADfirst| |l|) . #2#) (QREFELT $ 41))
               . #2#)
         (SEQ (LETT |kk| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |kk| (QREFELT $ 41)) |n| (QREFELT $ 99))
                  (SEQ (LETT |n| (SPADCALL |kk| (QREFELT $ 41)) . #2#)
                       (EXIT (LETT |k| |kk| . #2#)))))))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT (CONS 0 |k|))))))))) 

(DEFUN |ES-;allKernels| (|f| $)
  (PROG (|s| |t| |arg| |n| |s0| |u| #1=#:G282 |k| |l|)
    (RETURN
     (SEQ
      (LETT |s|
            (SPADCALL
             (LETT |l| (SPADCALL |f| (QREFELT $ 40)) . #2=(|ES-;allKernels|))
             (QREFELT $ 102))
            . #2#)
      (SEQ (LETT |k| NIL . #2#) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (LETT |t|
                  (SEQ
                   (LETT |u|
                         (SPADCALL (SPADCALL |k| (QREFELT $ 35)) (QREFELT $ 7)
                                   (QREFELT $ 104))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (SEQ (LETT |arg| (SPADCALL |k| (QREFELT $ 90)) . #2#)
                           (LETT |s0|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 105))
                                            (QREFELT $ 56))
                                  (|ES-;allKernels| (|SPADfirst| |arg|) $)
                                  (QREFELT $ 106))
                                 . #2#)
                           (LETT |arg| (CDR (CDR |arg|)) . #2#)
                           (LETT |n| (QCDR |u|) . #2#)
                           (COND
                            ((SPADCALL |n| 1 (QREFELT $ 99))
                             (LETT |arg| (CDR |arg|) . #2#)))
                           (EXIT
                            (SPADCALL |s0| (|ES-;allk| |arg| $)
                                      (QREFELT $ 29)))))
                     ('T (|ES-;allk| (SPADCALL |k| (QREFELT $ 90)) $)))))
                  . #2#)
            (EXIT (LETT |s| (SPADCALL |s| |t| (QREFELT $ 29)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |ES-;kernel;BoLS;36| (|op| |args| $)
  (COND
   ((NULL (SPADCALL |op| (QREFELT $ 107)))
    (|error|
     (SPADCALL
      (STRCONC "Unknown operator 2: "
               (SPADCALL (SPADCALL |op| (QREFELT $ 74)) (QREFELT $ 95)))
      (QREFELT $ 97))))
   ('T (|ES-;okkernel| |op| |args| $)))) 

(DEFUN |ES-;okkernel| (|op| |l| $)
  (PROG (#1=#:G297 |f| #2=#:G296)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL |op| |l|
                 (+ 1
                    (SPADCALL (ELT $ 39)
                              (PROGN
                               (LETT #2# NIL . #3=(|ES-;okkernel|))
                               (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |f| (CAR #1#) . #3#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |f| (QREFELT $ 109))
                                             #2#)
                                            . #3#)))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              0 (QREFELT $ 44)))
                 (QREFELT $ 110))
       (QREFELT $ 92)))))) 

(DEFUN |ES-;elt;BoLS;38| (|op| |args| $)
  (PROG (|v| #1=#:G308 |u|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (SPADCALL |op| (QREFELT $ 107)))
         (|error|
          (SPADCALL
           (STRCONC "Unknown operator 3: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 74)) (QREFELT $ 95)))
           (QREFELT $ 97))))
        ('T
         (SEQ
          (SEQ
           (LETT |u| (SPADCALL |op| (QREFELT $ 112)) . #2=(|ES-;elt;BoLS;38|))
           (EXIT
            (COND
             ((QEQCAR |u| 0)
              (COND
               ((SPADCALL (LENGTH |args|) (QCDR |u|) (QREFELT $ 113))
                (PROGN
                 (LETT #1# (|error| "Wrong number of arguments") . #2#)
                 (GO #1#))))))))
          (LETT |v| (SPADCALL |op| |args| (QREFELT $ 116)) . #2#)
          (EXIT
           (COND ((QEQCAR |v| 0) (QCDR |v|))
                 ('T (|ES-;okkernel| |op| |args| $))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ES-;retract;SK;39| (|f| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 118)) |ES-;retract;SK;39|)
          (EXIT
           (COND
            ((OR (QEQCAR |k| 1)
                 (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 92)) |f|
                           (QREFELT $ 119)))
             (|error| "not a kernel"))
            ('T (QCDR |k|)))))))) 

(DEFUN |ES-;retractIfCan;SU;40| (|f| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 118)) |ES-;retractIfCan;SU;40|)
          (EXIT
           (COND
            ((OR (QEQCAR |k| 1)
                 (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 92)) |f|
                           (QREFELT $ 119)))
             (CONS 1 "failed"))
            ('T |k|))))))) 

(DEFUN |ES-;is?;SSB;41| (|f| |s| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 122)) |ES-;is?;SSB;41|)
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 ('T (SPADCALL (QCDR |k|) |s| (QREFELT $ 123))))))))) 

(DEFUN |ES-;is?;SBoB;42| (|f| |op| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 122)) |ES-;is?;SBoB;42|)
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 ('T (SPADCALL (QCDR |k|) |op| (QREFELT $ 50))))))))) 

(DEFUN |ES-;unwrap| (|l| |x| $)
  (PROG (#1=#:G336 |k|)
    (RETURN
     (SEQ
      (SEQ (LETT |k| NIL . #2=(|ES-;unwrap|)) (LETT #1# (NREVERSE |l|) . #2#)
           G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |x|
                   (SPADCALL |x| |k|
                             (|SPADfirst| (SPADCALL |k| (QREFELT $ 90)))
                             (QREFELT $ 126))
                   . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |ES-;distribute;3S;44| (|x| |y| $)
  (PROG (#1=#:G344 |k| #2=#:G343 |ky|)
    (RETURN
     (SEQ
      (LETT |ky| (SPADCALL |y| (QREFELT $ 56)) . #3=(|ES-;distribute;3S;44|))
      (EXIT
       (|ES-;unwrap|
        (PROGN
         (LETT #2# NIL . #3#)
         (SEQ (LETT |k| NIL . #3#) (LETT #1# (|ES-;listk| |x| $) . #3#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((COND
                   ((SPADCALL |k| '|%paren| (QREFELT $ 123))
                    (SPADCALL |ky|
                              (|ES-;listk| (SPADCALL |k| (QREFELT $ 92)) $)
                              (QREFELT $ 57)))
                   ('T 'NIL))
                  (LETT #2# (CONS |k| #2#) . #3#)))))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        |x| $)))))) 

(DEFUN |ES-;eval;SLS;45| (|f| |leq| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $) |ES-;eval;SLS;45|)
          (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 128))))))) 

(DEFUN |ES-;subst;SLS;46| (|f| |leq| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $) |ES-;subst;SLS;46|)
          (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 130))))))) 

(DEFUN |ES-;mkKerLists| (|leq| $)
  (PROG (|lv| |lk| |k| #1=#:G363 |eq|)
    (RETURN
     (SEQ (LETT |lk| NIL . #2=(|ES-;mkKerLists|)) (LETT |lv| NIL . #2#)
          (SEQ (LETT |eq| NIL . #2#) (LETT #1# |leq| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 133))
                                (QREFELT $ 122))
                      . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |k| 1)
                   (|error| "left hand side must be a single kernel"))
                  ((NULL (SPADCALL (QCDR |k|) |lk| (QREFELT $ 57)))
                   (SEQ (LETT |lk| (CONS (QCDR |k|) |lk|) . #2#)
                        (EXIT
                         (LETT |lv| (CONS (SPADCALL |eq| (QREFELT $ 134)) |lv|)
                               . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lk| |lv|)))))) 

(DEFUN |ES-;even?;SB;48| (|x| $) (|ES-;intpred?| |x| (ELT $ 136) $)) 

(DEFUN |ES-;odd?;SB;49| (|x| $) (|ES-;intpred?| |x| (ELT $ 138) $)) 

(DEFUN |ES-;intpred?| (|x| |pred?| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 141)) |ES-;intpred?|)
          (EXIT
           (COND ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |pred?|)) ('T 'NIL))))))) 

(DECLAIM (NOTINLINE |ExpressionSpace&;|)) 

(DEFUN |ExpressionSpace&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionSpace&|))
      (LETT |dv$| (LIST '|ExpressionSpace&| DV$1) . #1#)
      (LETT $ (GETREFV 142) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Ring|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 '|%dummyVar|)
      (QSETREFV $ 12 (SPADCALL '|%paren| (QREFELT $ 11)))
      (QSETREFV $ 13 (SPADCALL '|%box| (QREFELT $ 11)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 137 (CONS (|dispatchFunction| |ES-;even?;SB;48|) $))
         (QSETREFV $ 139 (CONS (|dispatchFunction| |ES-;odd?;SB;49|) $)))))
      $)))) 

(MAKEPROP '|ExpressionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'DUMMYVAR
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppren| '|opbox| (|List| $) (5 . |box|) |ES-;box;2S;1|
              (10 . |paren|) |ES-;paren;2S;2| (|Boolean|) (15 . |has?|)
              (21 . |is?|) |ES-;belong?;BoB;3| (|List| 34) (|Set| 34)
              (27 . |parts|) (32 . |sort!|) (|List| 55) |ES-;tower;SL;5|
              (37 . |union|) (43 . |set|) (|Mapping| 24 24 24) (|List| 24)
              (47 . |reduce|) (|Kernel| 6) (54 . |operator|) (|List| 8)
              |ES-;operators;SL;7| (|NonNegativeInteger|) (59 . |max|)
              (65 . |kernels|) (70 . |height|) (|Mapping| 38 38 38) (|List| 38)
              (75 . |reduce|) |ES-;height;SNni;8| (82 . |name|) (|List| 9)
              (87 . |member?|) |ES-;freeOf?;SSB;9| (93 . |is?|)
              |ES-;distribute;2S;10| (99 . |elt|) |ES-;box;LS;11|
              |ES-;paren;LS;12| (|Kernel| $) (105 . |retract|)
              (110 . |member?|) |ES-;freeOf?;2SB;13| (116 . |kernel|)
              |ES-;kernel;Bo2S;14| |ES-;elt;Bo2S;15| |ES-;elt;Bo3S;16|
              |ES-;elt;Bo4S;17| |ES-;elt;Bo5S;18| |ES-;elt;Bo6S;19|
              |ES-;elt;Bo7S;20| |ES-;elt;Bo8S;21| |ES-;elt;Bo9S;22|
              |ES-;elt;Bo10S;23| (|Mapping| $ 14) (|List| 70) (122 . |eval|)
              |ES-;eval;SSMS;24| (129 . |name|) |ES-;eval;SBoMS;25| (|List| 6)
              (134 . |first|) (|Mapping| $ $) |ES-;eval;SSMS;26| (139 . |eval|)
              |ES-;eval;SBoMS;27| (|List| 84) (146 . |subst|) (|Equation| $)
              |ES-;subst;SES;28| (|List| 78) |ES-;eval;SLLS;29|
              |ES-;eval;SLLS;30| |ES-;eval;SLLS;31| (152 . |argument|)
              (157 . =) (163 . |coerce|) |ES-;map;MKS;32| (|String|)
              (168 . |string|) (|OutputForm|) (173 . |coerce|)
              |ES-;operator;2Bo;33| (178 . >) (|Union| 55 '"failed")
              |ES-;mainKernel;SU;34| (184 . |brace|)
              (|Union| (|None|) '"failed") (189 . |property|) (195 . |second|)
              (200 . |remove!|) (206 . |belong?|) |ES-;kernel;BoLS;36|
              (211 . |height|) (216 . |kernel|) (|Union| 38 '"failed")
              (223 . |arity|) (228 . ~=) (|Union| 6 '"failed")
              (|BasicOperatorFunctions1| 6) (234 . |evaluate|)
              |ES-;elt;BoLS;38| (240 . |mainKernel|) (245 . ~=)
              |ES-;retract;SK;39| |ES-;retractIfCan;SU;40|
              (251 . |retractIfCan|) (256 . |is?|) |ES-;is?;SSB;41|
              |ES-;is?;SBoB;42| (262 . |eval|) |ES-;distribute;3S;44|
              (269 . |eval|) |ES-;eval;SLS;45| (276 . |subst|)
              |ES-;subst;SLS;46| (|Equation| 6) (283 . |lhs|) (288 . |rhs|)
              (|Integer|) (293 . |even?|) (298 . |even?|) (303 . |odd?|)
              (308 . |odd?|) (|Union| 135 '"failed") (313 . |retractIfCan|))
           '#(|tower| 318 |subst| 323 |retractIfCan| 335 |retract| 340 |paren|
              345 |operators| 355 |operator| 360 |odd?| 365 |map| 370
              |mainKernel| 376 |kernel| 381 |is?| 393 |height| 405 |freeOf?|
              410 |even?| 422 |eval| 427 |elt| 482 |distribute| 578 |box| 589
              |belong?| 599)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 141
                                                 '(1 10 8 9 11 1 6 0 14 15 1 6
                                                   0 14 17 2 8 19 0 9 20 2 8 19
                                                   0 9 21 1 24 23 0 25 1 23 0 0
                                                   26 2 24 0 0 0 29 0 24 0 30 3
                                                   32 24 31 0 24 33 1 34 8 0 35
                                                   2 38 0 0 0 39 1 6 27 0 40 1
                                                   34 38 0 41 3 43 38 42 0 38
                                                   44 1 34 9 0 46 2 47 19 9 0
                                                   48 2 34 19 0 8 50 2 6 0 8 14
                                                   52 1 6 55 0 56 2 23 19 34 0
                                                   57 2 6 0 8 14 59 3 6 0 0 47
                                                   71 72 1 8 9 0 74 1 76 6 0 77
                                                   3 6 0 0 36 71 80 2 6 0 0 82
                                                   83 1 34 76 0 90 2 76 19 0 0
                                                   91 1 6 0 55 92 1 9 94 0 95 1
                                                   94 96 0 97 2 38 19 0 0 99 1
                                                   24 0 23 102 2 8 103 0 9 104
                                                   1 76 6 0 105 2 24 0 34 0 106
                                                   1 6 19 8 107 1 6 38 0 109 3
                                                   34 0 8 76 38 110 1 8 111 0
                                                   112 2 38 19 0 0 113 2 115
                                                   114 8 76 116 1 6 100 0 118 2
                                                   6 19 0 0 119 1 6 100 0 122 2
                                                   34 19 0 9 123 3 6 0 0 55 0
                                                   126 3 6 0 0 27 14 128 3 6 0
                                                   0 27 14 130 1 132 6 0 133 1
                                                   132 6 0 134 1 135 19 0 136 1
                                                   0 19 0 137 1 135 19 0 138 1
                                                   0 19 0 139 1 6 140 0 141 1 0
                                                   27 0 28 2 0 0 0 82 131 2 0 0
                                                   0 84 85 1 0 100 0 121 1 0 55
                                                   0 120 1 0 0 14 54 1 0 0 0 18
                                                   1 0 36 0 37 1 0 8 8 98 1 0
                                                   19 0 139 2 0 0 78 55 93 1 0
                                                   100 0 101 2 0 0 8 0 60 2 0 0
                                                   8 14 108 2 0 19 0 9 124 2 0
                                                   19 0 8 125 1 0 38 0 45 2 0
                                                   19 0 0 58 2 0 19 0 9 49 1 0
                                                   19 0 137 3 0 0 0 8 78 81 3 0
                                                   0 0 8 70 75 3 0 0 0 36 86 87
                                                   3 0 0 0 36 71 89 3 0 0 0 9
                                                   78 79 3 0 0 0 9 70 73 3 0 0
                                                   0 47 86 88 2 0 0 0 82 129 10
                                                   0 0 8 0 0 0 0 0 0 0 0 0 69 2
                                                   0 0 8 14 117 9 0 0 8 0 0 0 0
                                                   0 0 0 0 68 7 0 0 8 0 0 0 0 0
                                                   0 66 8 0 0 8 0 0 0 0 0 0 0
                                                   67 6 0 0 8 0 0 0 0 0 65 4 0
                                                   0 8 0 0 0 63 5 0 0 8 0 0 0 0
                                                   64 3 0 0 8 0 0 62 2 0 0 8 0
                                                   61 1 0 0 0 51 2 0 0 0 0 127
                                                   1 0 0 14 53 1 0 0 0 16 1 0
                                                   19 8 22)))))
           '|lookupComplete|)) 
