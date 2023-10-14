
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

(DEFUN |ES-;tower;LL;7| (|lf| $)
  (SPADCALL (SPADCALL (|ES-;allk| |lf| $) (QREFELT $ 25)) (QREFELT $ 26))) 

(DEFUN |ES-;kernels;LL;8| (|lf| $)
  (PROG (#1=#:G159 |f| #2=#:G158)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 35)
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;kernels;LL;8|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |f| (QREFELT $ 36)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                NIL (QREFELT $ 39)))))) 

(DEFUN |ES-;operators;SL;9| (|f| $)
  (PROG (#1=#:G164 |k| #2=#:G163)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ES-;operators;SL;9|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# (|ES-;listk| |f| $) . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 42)) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ES-;height;SNni;10| (|f| $)
  (PROG (#1=#:G170 |k| #2=#:G169)
    (RETURN
     (SEQ
      (SPADCALL (ELT $ 46)
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;height;SNni;10|))
                 (SEQ (LETT |k| NIL . #3#)
                      (LETT #1# (SPADCALL |f| (QREFELT $ 36)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 47)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                0 (QREFELT $ 50)))))) 

(DEFUN |ES-;freeOf?;SSB;11| (|x| |s| $)
  (PROG (#1=#:G175 |k| #2=#:G174)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |s|
                  (PROGN
                   (LETT #2# NIL . #3=(|ES-;freeOf?;SSB;11|))
                   (SEQ (LETT |k| NIL . #3#)
                        (LETT #1# (|ES-;listk| |x| $) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (SPADCALL |k| (QREFELT $ 52)) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 54))
        'NIL)
       ('T 'T)))))) 

(DEFUN |ES-;distribute;2S;12| (|x| $)
  (PROG (#1=#:G179 |k| #2=#:G178)
    (RETURN
     (SEQ
      (|ES-;unwrap|
       (PROGN
        (LETT #2# NIL . #3=(|ES-;distribute;2S;12|))
        (SEQ (LETT |k| NIL . #3#) (LETT #1# (|ES-;listk| |x| $) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |k| (QREFELT $ 12) (QREFELT $ 56))
                 (LETT #2# (CONS |k| #2#) . #3#)))))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       |x| $))))) 

(DEFUN |ES-;box;LS;13| (|l| $) (SPADCALL (QREFELT $ 13) |l| (QREFELT $ 58))) 

(DEFUN |ES-;paren;LS;14| (|l| $) (SPADCALL (QREFELT $ 12) |l| (QREFELT $ 58))) 

(DEFUN |ES-;freeOf?;2SB;15| (|x| |k| $)
  (COND
   ((SPADCALL (SPADCALL |k| (QREFELT $ 62)) (|ES-;listk| |x| $) (QREFELT $ 63))
    'NIL)
   ('T 'T))) 

(DEFUN |ES-;kernel;Bo2S;16| (|op| |arg| $)
  (SPADCALL |op| (LIST |arg|) (QREFELT $ 65))) 

(DEFUN |ES-;elt;Bo2S;17| (|op| |x| $) (SPADCALL |op| (LIST |x|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo3S;18| (|op| |x| |y| $)
  (SPADCALL |op| (LIST |x| |y|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo4S;19| (|op| |x| |y| |z| $)
  (SPADCALL |op| (LIST |x| |y| |z|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo5S;20| (|op| |x| |y| |z| |t| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo6S;21| (|op| |x| |y| |z| |t| |s| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo7S;22| (|op| |x| |y| |z| |t| |s| |r| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo8S;23| (|op| |x| |y| |z| |t| |s| |r| |q| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo9S;24| (|op| |x| |y| |z| |t| |s| |r| |q| |p| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p|) (QREFELT $ 58))) 

(DEFUN |ES-;elt;Bo10S;25| (|op| |x| |y| |z| |t| |s| |r| |q| |p| |o| $)
  (SPADCALL |op| (LIST |x| |y| |z| |t| |s| |r| |q| |p| |o|) (QREFELT $ 58))) 

(DEFUN |ES-;eval;SSMS;26| (|x| |s| |f| $)
  (SPADCALL |x| (LIST |s|) (LIST |f|) (QREFELT $ 78))) 

(DEFUN |ES-;eval;SBoMS;27| (|x| |s| |f| $)
  (SPADCALL |x| (LIST (SPADCALL |s| (QREFELT $ 80))) (LIST |f|) (QREFELT $ 78))) 

(DEFUN |ES-;eval;SSMS;28| (|x| |s| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL |x| (LIST |s|)
               (LIST (CONS #'|ES-;eval;SSMS;28!0| (VECTOR |f| $)))
               (QREFELT $ 78))))) 

(DEFUN |ES-;eval;SSMS;28!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SSMS;28|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(DEFUN |ES-;eval;SBoMS;29| (|x| |s| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL |x| (LIST |s|)
               (LIST (CONS #'|ES-;eval;SBoMS;29!0| (VECTOR |f| $)))
               (QREFELT $ 86))))) 

(DEFUN |ES-;eval;SBoMS;29!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SBoMS;29|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(DEFUN |ES-;subst;SES;30| (|x| |e| $) (SPADCALL |x| (LIST |e|) (QREFELT $ 89))) 

(DEFUN |ES-;eval;SLLS;31| (|x| |ls| |lf| $)
  (PROG (#1=#:G225 |f| #2=#:G224)
    (RETURN
     (SEQ
      (SPADCALL |x| |ls|
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;eval;SLLS;31|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|ES-;eval;SLLS;31!0| (VECTOR |f| $))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 86)))))) 

(DEFUN |ES-;eval;SLLS;31!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SLLS;31|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(DEFUN |ES-;eval;SLLS;32| (|x| |ls| |lf| $)
  (PROG (#1=#:G230 |f| #2=#:G229)
    (RETURN
     (SEQ
      (SPADCALL |x| |ls|
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;eval;SLLS;32|))
                 (SEQ (LETT |f| NIL . #3#) (LETT #1# |lf| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (CONS #'|ES-;eval;SLLS;32!0| (VECTOR |f| $))
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 78)))))) 

(DEFUN |ES-;eval;SLLS;32!0| (|y| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|ES-;eval;SLLS;32|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 83)) |f|))))) 

(DEFUN |ES-;eval;SLLS;33| (|x| |ls| |lf| $)
  (PROG (#1=#:G235 |s| #2=#:G234)
    (RETURN
     (SEQ
      (SPADCALL |x|
                (PROGN
                 (LETT #2# NIL . #3=(|ES-;eval;SLLS;33|))
                 (SEQ (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 80)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                |lf| (QREFELT $ 78)))))) 

(DEFUN |ES-;map;MKS;34| (|fn| |k| $)
  (PROG (|l| #1=#:G266 |x| #2=#:G265)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |l|
               (PROGN
                (LETT #2# NIL . #3=(|ES-;map;MKS;34|))
                (SEQ (LETT |x| NIL . #3#)
                     (LETT #1# (SPADCALL |k| (QREFELT $ 96)) . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT (LETT #2# (CONS (SPADCALL |x| |fn|) #2#) . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               . #3#)
         (SPADCALL |k| (QREFELT $ 96)) (QREFELT $ 97))
        (SPADCALL |k| (QREFELT $ 98)))
       ('T (SPADCALL (SPADCALL |k| (QREFELT $ 42)) |l| (QREFELT $ 58)))))))) 

(DEFUN |ES-;operator;2Bo;35| (|op| $)
  (COND ((SPADCALL |op| '|%paren| (QREFELT $ 21)) (QREFELT $ 12))
        ((SPADCALL |op| '|%box| (QREFELT $ 21)) (QREFELT $ 13))
        ('T
         (|error|
          (SPADCALL
           (STRCONC "Unknown operator 1: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 80)) (QREFELT $ 101)))
           (QREFELT $ 103)))))) 

(DEFUN |ES-;mainKernel;SU;36| (|x| $)
  (PROG (|k| |n| #1=#:G282 |kk| |l|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |l| (SPADCALL |x| (QREFELT $ 36))
               . #2=(|ES-;mainKernel;SU;36|)))
        (CONS 1 "failed"))
       ('T
        (SEQ
         (LETT |n| (SPADCALL (LETT |k| (|SPADfirst| |l|) . #2#) (QREFELT $ 47))
               . #2#)
         (SEQ (LETT |kk| NIL . #2#) (LETT #1# (CDR |l|) . #2#) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL (SPADCALL |kk| (QREFELT $ 47)) |n| (QREFELT $ 105))
                  (SEQ (LETT |n| (SPADCALL |kk| (QREFELT $ 47)) . #2#)
                       (EXIT (LETT |k| |kk| . #2#)))))))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT (CONS 0 |k|))))))))) 

(DEFUN |ES-;allKernels| (|f| $)
  (PROG (|s| |t| |arg| |n| |s0| |u| #1=#:G295 |k| |l|)
    (RETURN
     (SEQ
      (LETT |s|
            (SPADCALL
             (LETT |l| (SPADCALL |f| (QREFELT $ 36)) . #2=(|ES-;allKernels|))
             (QREFELT $ 108))
            . #2#)
      (SEQ (LETT |k| NIL . #2#) (LETT #1# |l| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (LETT |t|
                  (SEQ
                   (LETT |u|
                         (SPADCALL (SPADCALL |k| (QREFELT $ 42)) (QREFELT $ 7)
                                   (QREFELT $ 110))
                         . #2#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (SEQ (LETT |arg| (SPADCALL |k| (QREFELT $ 96)) . #2#)
                           (LETT |s0|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 111))
                                            (QREFELT $ 62))
                                  (|ES-;allKernels| (|SPADfirst| |arg|) $)
                                  (QREFELT $ 112))
                                 . #2#)
                           (LETT |arg| (CDR (CDR |arg|)) . #2#)
                           (LETT |n| (QCDR |u|) . #2#)
                           (COND
                            ((SPADCALL |n| 1 (QREFELT $ 105))
                             (LETT |arg| (CDR |arg|) . #2#)))
                           (EXIT
                            (SPADCALL |s0| (|ES-;allk| |arg| $)
                                      (QREFELT $ 29)))))
                     ('T (|ES-;allk| (SPADCALL |k| (QREFELT $ 96)) $)))))
                  . #2#)
            (EXIT (LETT |s| (SPADCALL |s| |t| (QREFELT $ 29)) . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |s|))))) 

(DEFUN |ES-;kernel;BoLS;38| (|op| |args| $)
  (COND
   ((NULL (SPADCALL |op| (QREFELT $ 113)))
    (|error|
     (SPADCALL
      (STRCONC "Unknown operator 2: "
               (SPADCALL (SPADCALL |op| (QREFELT $ 80)) (QREFELT $ 101)))
      (QREFELT $ 103))))
   ('T (|ES-;okkernel| |op| |args| $)))) 

(DEFUN |ES-;okkernel| (|op| |l| $)
  (PROG (#1=#:G310 |f| #2=#:G309)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL |op| |l|
                 (+ 1
                    (SPADCALL (ELT $ 46)
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
                                             (SPADCALL |f| (QREFELT $ 115))
                                             #2#)
                                            . #3#)))
                                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              0 (QREFELT $ 50)))
                 (QREFELT $ 116))
       (QREFELT $ 98)))))) 

(DEFUN |ES-;elt;BoLS;40| (|op| |args| $)
  (PROG (|v| #1=#:G321 |u|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((NULL (SPADCALL |op| (QREFELT $ 113)))
         (|error|
          (SPADCALL
           (STRCONC "Unknown operator 3: "
                    (SPADCALL (SPADCALL |op| (QREFELT $ 80)) (QREFELT $ 101)))
           (QREFELT $ 103))))
        ('T
         (SEQ
          (SEQ
           (LETT |u| (SPADCALL |op| (QREFELT $ 118)) . #2=(|ES-;elt;BoLS;40|))
           (EXIT
            (COND
             ((QEQCAR |u| 0)
              (COND
               ((SPADCALL (LENGTH |args|) (QCDR |u|) (QREFELT $ 119))
                (PROGN
                 (LETT #1# (|error| "Wrong number of arguments") . #2#)
                 (GO #1#))))))))
          (LETT |v| (SPADCALL |op| |args| (QREFELT $ 122)) . #2#)
          (EXIT
           (COND ((QEQCAR |v| 0) (QCDR |v|))
                 ('T (|ES-;okkernel| |op| |args| $))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ES-;retract;SK;41| (|f| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 124)) |ES-;retract;SK;41|)
          (EXIT
           (COND
            ((OR (QEQCAR |k| 1)
                 (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 98)) |f|
                           (QREFELT $ 125)))
             (|error| "not a kernel"))
            ('T (QCDR |k|)))))))) 

(DEFUN |ES-;retractIfCan;SU;42| (|f| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 124)) |ES-;retractIfCan;SU;42|)
          (EXIT
           (COND
            ((OR (QEQCAR |k| 1)
                 (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 98)) |f|
                           (QREFELT $ 125)))
             (CONS 1 "failed"))
            ('T |k|))))))) 

(DEFUN |ES-;is?;SSB;43| (|f| |s| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 128)) |ES-;is?;SSB;43|)
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 ('T (SPADCALL (QCDR |k|) |s| (QREFELT $ 129))))))))) 

(DEFUN |ES-;is?;SBoB;44| (|f| |op| $)
  (PROG (|k|)
    (RETURN
     (SEQ (LETT |k| (SPADCALL |f| (QREFELT $ 128)) |ES-;is?;SBoB;44|)
          (EXIT
           (COND ((QEQCAR |k| 1) 'NIL)
                 ('T (SPADCALL (QCDR |k|) |op| (QREFELT $ 56))))))))) 

(DEFUN |ES-;unwrap| (|l| |x| $)
  (PROG (#1=#:G349 |k|)
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
                             (|SPADfirst| (SPADCALL |k| (QREFELT $ 96)))
                             (QREFELT $ 132))
                   . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DEFUN |ES-;distribute;3S;46| (|x| |y| $)
  (PROG (#1=#:G357 |k| #2=#:G356 |ky|)
    (RETURN
     (SEQ
      (LETT |ky| (SPADCALL |y| (QREFELT $ 62)) . #3=(|ES-;distribute;3S;46|))
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
                   ((SPADCALL |k| '|%paren| (QREFELT $ 129))
                    (SPADCALL |ky|
                              (|ES-;listk| (SPADCALL |k| (QREFELT $ 98)) $)
                              (QREFELT $ 63)))
                   ('T 'NIL))
                  (LETT #2# (CONS |k| #2#) . #3#)))))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        |x| $)))))) 

(DEFUN |ES-;eval;SLS;47| (|f| |leq| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $) |ES-;eval;SLS;47|)
          (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 134))))))) 

(DEFUN |ES-;subst;SLS;48| (|f| |leq| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (|ES-;mkKerLists| |leq| $) |ES-;subst;SLS;48|)
          (EXIT (SPADCALL |f| (QCAR |rec|) (QCDR |rec|) (QREFELT $ 136))))))) 

(DEFUN |ES-;mkKerLists| (|leq| $)
  (PROG (|lv| |lk| |k| #1=#:G376 |eq|)
    (RETURN
     (SEQ (LETT |lk| NIL . #2=(|ES-;mkKerLists|)) (LETT |lv| NIL . #2#)
          (SEQ (LETT |eq| NIL . #2#) (LETT #1# |leq| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |eq| (QREFELT $ 139))
                                (QREFELT $ 128))
                      . #2#)
                (EXIT
                 (COND
                  ((QEQCAR |k| 1)
                   (|error| "left hand side must be a single kernel"))
                  ((NULL (SPADCALL (QCDR |k|) |lk| (QREFELT $ 63)))
                   (SEQ (LETT |lk| (CONS (QCDR |k|) |lk|) . #2#)
                        (EXIT
                         (LETT |lv| (CONS (SPADCALL |eq| (QREFELT $ 140)) |lv|)
                               . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |lk| |lv|)))))) 

(DEFUN |ES-;even?;SB;50| (|x| $) (|ES-;intpred?| |x| (ELT $ 142) $)) 

(DEFUN |ES-;odd?;SB;51| (|x| $) (|ES-;intpred?| |x| (ELT $ 144) $)) 

(DEFUN |ES-;intpred?| (|x| |pred?| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 147)) |ES-;intpred?|)
          (EXIT
           (COND ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) |pred?|)) ('T 'NIL))))))) 

(DECLAIM (NOTINLINE |ExpressionSpace&;|)) 

(DEFUN |ExpressionSpace&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionSpace&|))
      (LETT |dv$| (LIST '|ExpressionSpace&| DV$1) . #1#)
      (LETT $ (GETREFV 148) . #1#)
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
         (QSETREFV $ 143 (CONS (|dispatchFunction| |ES-;even?;SB;50|) $))
         (QSETREFV $ 145 (CONS (|dispatchFunction| |ES-;odd?;SB;51|) $)))))
      $)))) 

(MAKEPROP '|ExpressionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) 'DUMMYVAR
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|oppren| '|opbox| (|List| $) (5 . |box|) |ES-;box;2S;1|
              (10 . |paren|) |ES-;paren;2S;2| (|Boolean|) (15 . |has?|)
              (21 . |is?|) |ES-;belong?;BoB;3| (|List| 41) (|Set| 41)
              (27 . |parts|) (32 . |sort!|) (|List| 61) |ES-;tower;SL;5|
              (37 . |union|) (43 . |set|) (|Mapping| 24 24 24) (|List| 24)
              (47 . |reduce|) |ES-;tower;LL;7| (54 . |setUnion|)
              (60 . |kernels|) (|Mapping| 23 23 23) (|List| 23) (65 . |reduce|)
              |ES-;kernels;LL;8| (|Kernel| 6) (72 . |operator|) (|List| 8)
              |ES-;operators;SL;9| (|NonNegativeInteger|) (77 . |max|)
              (83 . |height|) (|Mapping| 45 45 45) (|List| 45) (88 . |reduce|)
              |ES-;height;SNni;10| (95 . |name|) (|List| 9) (100 . |member?|)
              |ES-;freeOf?;SSB;11| (106 . |is?|) |ES-;distribute;2S;12|
              (112 . |elt|) |ES-;box;LS;13| |ES-;paren;LS;14| (|Kernel| $)
              (118 . |retract|) (123 . |member?|) |ES-;freeOf?;2SB;15|
              (129 . |kernel|) |ES-;kernel;Bo2S;16| |ES-;elt;Bo2S;17|
              |ES-;elt;Bo3S;18| |ES-;elt;Bo4S;19| |ES-;elt;Bo5S;20|
              |ES-;elt;Bo6S;21| |ES-;elt;Bo7S;22| |ES-;elt;Bo8S;23|
              |ES-;elt;Bo9S;24| |ES-;elt;Bo10S;25| (|Mapping| $ 14) (|List| 76)
              (135 . |eval|) |ES-;eval;SSMS;26| (142 . |name|)
              |ES-;eval;SBoMS;27| (|List| 6) (147 . |first|) (|Mapping| $ $)
              |ES-;eval;SSMS;28| (152 . |eval|) |ES-;eval;SBoMS;29| (|List| 90)
              (159 . |subst|) (|Equation| $) |ES-;subst;SES;30| (|List| 84)
              |ES-;eval;SLLS;31| |ES-;eval;SLLS;32| |ES-;eval;SLLS;33|
              (165 . |argument|) (170 . =) (176 . |coerce|) |ES-;map;MKS;34|
              (|String|) (181 . |string|) (|OutputForm|) (186 . |coerce|)
              |ES-;operator;2Bo;35| (191 . >) (|Union| 61 '"failed")
              |ES-;mainKernel;SU;36| (197 . |brace|)
              (|Union| (|None|) '"failed") (202 . |property|) (208 . |second|)
              (213 . |remove!|) (219 . |belong?|) |ES-;kernel;BoLS;38|
              (224 . |height|) (229 . |kernel|) (|Union| 45 '"failed")
              (236 . |arity|) (241 . ~=) (|Union| 6 '"failed")
              (|BasicOperatorFunctions1| 6) (247 . |evaluate|)
              |ES-;elt;BoLS;40| (253 . |mainKernel|) (258 . ~=)
              |ES-;retract;SK;41| |ES-;retractIfCan;SU;42|
              (264 . |retractIfCan|) (269 . |is?|) |ES-;is?;SSB;43|
              |ES-;is?;SBoB;44| (275 . |eval|) |ES-;distribute;3S;46|
              (282 . |eval|) |ES-;eval;SLS;47| (289 . |subst|)
              |ES-;subst;SLS;48| (|Equation| 6) (296 . |lhs|) (301 . |rhs|)
              (|Integer|) (306 . |even?|) (311 . |even?|) (316 . |odd?|)
              (321 . |odd?|) (|Union| 141 '"failed") (326 . |retractIfCan|))
           '#(|tower| 331 |subst| 341 |retractIfCan| 353 |retract| 358 |paren|
              363 |operators| 373 |operator| 378 |odd?| 383 |map| 388
              |mainKernel| 394 |kernels| 399 |kernel| 404 |is?| 416 |height|
              428 |freeOf?| 433 |even?| 445 |eval| 450 |elt| 505 |distribute|
              601 |box| 612 |belong?| 622)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 147
                                                 '(1 10 8 9 11 1 6 0 14 15 1 6
                                                   0 14 17 2 8 19 0 9 20 2 8 19
                                                   0 9 21 1 24 23 0 25 1 23 0 0
                                                   26 2 24 0 0 0 29 0 24 0 30 3
                                                   32 24 31 0 24 33 2 23 0 0 0
                                                   35 1 6 27 0 36 3 38 23 37 0
                                                   23 39 1 41 8 0 42 2 45 0 0 0
                                                   46 1 41 45 0 47 3 49 45 48 0
                                                   45 50 1 41 9 0 52 2 53 19 9
                                                   0 54 2 41 19 0 8 56 2 6 0 8
                                                   14 58 1 6 61 0 62 2 23 19 41
                                                   0 63 2 6 0 8 14 65 3 6 0 0
                                                   53 77 78 1 8 9 0 80 1 82 6 0
                                                   83 3 6 0 0 43 77 86 2 6 0 0
                                                   88 89 1 41 82 0 96 2 82 19 0
                                                   0 97 1 6 0 61 98 1 9 100 0
                                                   101 1 100 102 0 103 2 45 19
                                                   0 0 105 1 24 0 23 108 2 8
                                                   109 0 9 110 1 82 6 0 111 2
                                                   24 0 41 0 112 1 6 19 8 113 1
                                                   6 45 0 115 3 41 0 8 82 45
                                                   116 1 8 117 0 118 2 45 19 0
                                                   0 119 2 121 120 8 82 122 1 6
                                                   106 0 124 2 6 19 0 0 125 1 6
                                                   106 0 128 2 41 19 0 9 129 3
                                                   6 0 0 61 0 132 3 6 0 0 27 14
                                                   134 3 6 0 0 27 14 136 1 138
                                                   6 0 139 1 138 6 0 140 1 141
                                                   19 0 142 1 0 19 0 143 1 141
                                                   19 0 144 1 0 19 0 145 1 6
                                                   146 0 147 1 0 27 0 28 1 0 27
                                                   14 34 2 0 0 0 90 91 2 0 0 0
                                                   88 137 1 0 106 0 127 1 0 61
                                                   0 126 1 0 0 14 60 1 0 0 0 18
                                                   1 0 43 0 44 1 0 8 8 104 1 0
                                                   19 0 145 2 0 0 84 61 99 1 0
                                                   106 0 107 1 0 27 14 40 2 0 0
                                                   8 14 114 2 0 0 8 0 66 2 0 19
                                                   0 9 130 2 0 19 0 8 131 1 0
                                                   45 0 51 2 0 19 0 9 55 2 0 19
                                                   0 0 64 1 0 19 0 143 3 0 0 0
                                                   8 84 87 3 0 0 0 8 76 81 3 0
                                                   0 0 43 92 93 3 0 0 0 43 77
                                                   95 3 0 0 0 9 84 85 3 0 0 0 9
                                                   76 79 3 0 0 0 53 92 94 2 0 0
                                                   0 88 135 10 0 0 8 0 0 0 0 0
                                                   0 0 0 0 75 2 0 0 8 14 123 8
                                                   0 0 8 0 0 0 0 0 0 0 73 9 0 0
                                                   8 0 0 0 0 0 0 0 0 74 7 0 0 8
                                                   0 0 0 0 0 0 72 5 0 0 8 0 0 0
                                                   0 70 6 0 0 8 0 0 0 0 0 71 3
                                                   0 0 8 0 0 68 4 0 0 8 0 0 0
                                                   69 2 0 0 8 0 67 2 0 0 0 0
                                                   133 1 0 0 0 57 1 0 0 0 16 1
                                                   0 0 14 59 1 0 19 8 22)))))
           '|lookupComplete|)) 
