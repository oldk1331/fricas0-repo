
(/VERSIONCHECK 2) 

(PUT '|TREE;empty?;$B;1| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 1))) 

(DEFUN |TREE;empty?;$B;1| (|t| $) (QEQCAR |t| 1)) 

(PUT '|TREE;empty;$;2| '|SPADreplace| '(XLAM NIL (CONS 1 "empty"))) 

(DEFUN |TREE;empty;$;2| ($) (CONS 1 "empty")) 

(DEFUN |TREE;children;$L;3| (|t| $)
  (COND ((QEQCAR |t| 1) (|error| "cannot take the children of an empty tree"))
        ('T (QCDR (CDR |t|))))) 

(DEFUN |TREE;setchildren!;$L$;4| (|t| |lt| $)
  (SEQ
   (COND ((QEQCAR |t| 1) (|error| "cannot set children of an empty tree"))
         ('T (SEQ (PROGN (RPLACD #1=(CDR |t|) |lt|) (QCDR #1#)) (EXIT |t|)))))) 

(DEFUN |TREE;setvalue!;$2S;5| (|t| |s| $)
  (SEQ
   (COND ((QEQCAR |t| 1) (|error| "cannot set value of an empty tree"))
         ('T (SEQ (PROGN (RPLACA #1=(CDR |t|) |s|) (QCAR #1#)) (EXIT |s|)))))) 

(DEFUN |TREE;count;S$Nni;6| (|n| |t| $)
  (PROG (|i| #1=#:G187 #2=#:G186 #3=#:G188 #4=#:G194 |c|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) 0)
            (#5='T
             (SEQ
              (LETT |i|
                    (PROGN
                     (LETT #1# NIL . #6=(|TREE;count;S$Nni;6|))
                     (SEQ (LETT |c| NIL . #6#)
                          (LETT #4# (SPADCALL |t| (QREFELT $ 12)) . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# (SPADCALL |n| |c| (QREFELT $ 16)) . #6#)
                             (COND (#1# (LETT #2# (+ #2# #3#) . #6#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #3# . #6#)
                                     (LETT #1# 'T . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#5# 0)))
                    . #6#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |n| (QREFELT $ 18))
                 (+ |i| 1))
                (#5# |i|)))))))))) 

(DEFUN |TREE;count;M$Nni;7| (|fn| |t| $)
  (PROG (|i| #1=#:G196 #2=#:G195 #3=#:G197 #4=#:G201 |c|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) 0)
            (#5='T
             (SEQ
              (LETT |i|
                    (PROGN
                     (LETT #1# NIL . #6=(|TREE;count;M$Nni;7|))
                     (SEQ (LETT |c| NIL . #6#)
                          (LETT #4# (SPADCALL |t| (QREFELT $ 12)) . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# (SPADCALL |fn| |c| (QREFELT $ 20))
                                   . #6#)
                             (COND (#1# (LETT #2# (+ #2# #3#) . #6#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #3# . #6#)
                                     (LETT #1# 'T . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#5# 0)))
                    . #6#)
              (EXIT
               (COND ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) (+ |i| 1))
                     (#5# |i|)))))))))) 

(DEFUN |TREE;map;M2$;8| (|fn| |t| $)
  (PROG (#1=#:G206 |c| #2=#:G205)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) |t|)
            ('T
             (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                       (PROGN
                        (LETT #2# NIL . #3=(|TREE;map;M2$;8|))
                        (SEQ (LETT |c| NIL . #3#)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |fn| |c| (QREFELT $ 22))
                                           #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 23)))))))) 

(DEFUN |TREE;map!;M2$;9| (|fn| |t| $)
  (PROG (#1=#:G211 |c|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) |t|)
            ('T
             (SEQ
              (SPADCALL |t| (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)
                        (QREFELT $ 14))
              (EXIT
               (SEQ (LETT |c| NIL . #2=(|TREE;map!;M2$;9|))
                    (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #2#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                      (GO G191)))
                    (SEQ (EXIT (SPADCALL |fn| |c| (QREFELT $ 24))))
                    (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                    (EXIT NIL)))))))))) 

(DEFUN |TREE;tree;SL$;10| (|s| |lt| $) (CONS 0 (CONS |s| |lt|))) 

(DEFUN |TREE;tree;S$;11| (|s| $) (CONS 0 (CONS |s| NIL))) 

(DEFUN |TREE;tree;L$;12| (|ls| $)
  (PROG (#1=#:G220 |s| #2=#:G219)
    (RETURN
     (SEQ
      (COND ((NULL |ls|) (SPADCALL (QREFELT $ 10)))
            ('T
             (SPADCALL (|SPADfirst| |ls|)
                       (PROGN
                        (LETT #2# NIL . #3=(|TREE;tree;L$;12|))
                        (SEQ (LETT |s| NIL . #3#) (LETT #1# (CDR |ls|) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |s| (QREFELT $ 25)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 23)))))))) 

(DEFUN |TREE;value;$S;13| (|t| $)
  (COND ((QEQCAR |t| 1) (|error| "cannot take the value of an empty tree"))
        ('T (QCAR (CDR |t|))))) 

(DEFUN |TREE;child?;2$B;14| (|t1| |t2| $)
  (COND ((SPADCALL |t2| (QREFELT $ 9)) 'NIL)
        ('T (SPADCALL |t1| (SPADCALL |t2| (QREFELT $ 12)) (QREFELT $ 29))))) 

(DEFUN |TREE;distance1| (|t1| |t2| $)
  (PROG (#1=#:G229 #2=#:G228 #3=#:G230 #4=#:G235 #5=#:G125 |u| |n| #6=#:G234
         |t| #7=#:G233)
    (RETURN
     (SEQ
      (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 0) ((QEQCAR |t2| 1) -1)
            (#8='T
             (SEQ
              (LETT |u|
                    (PROGN
                     (LETT #7# NIL . #9=(|TREE;distance1|))
                     (SEQ (LETT |t| NIL . #9#)
                          (LETT #6# (SPADCALL |t2| (QREFELT $ 12)) . #9#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |t| (CAR #6#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((>=
                               (LETT |n| (|TREE;distance1| |t1| |t| $) . #9#)
                               0)
                              (LETT #7# (CONS |n| #7#) . #9#)))))
                          (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #9#)
              (EXIT
               (COND
                ((SPADCALL (LENGTH |u|) 0 (QREFELT $ 33))
                 (+ 1
                    (PROGN
                     (LETT #1# NIL . #9#)
                     (SEQ (LETT #5# NIL . #9#) (LETT #4# |u| . #9#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT #5# (CAR #4#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# #5# . #9#)
                             (COND (#1# (LETT #2# (MIN #2# #3#) . #9#))
                                   ('T
                                    (PROGN
                                     (LETT #2# #3# . #9#)
                                     (LETT #1# 'T . #9#)))))))
                          (LETT #4# (CDR #4#) . #9#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#8# (|IdentityError| '|min|))))))
                (#8# -1)))))))))) 

(DEFUN |TREE;distance;2$I;16| (|t1| |t2| $)
  (PROG (|n|)
    (RETURN
     (SEQ (LETT |n| (|TREE;distance1| |t1| |t2| $) |TREE;distance;2$I;16|)
          (EXIT (COND ((>= |n| 0) |n|) ('T (|TREE;distance1| |t2| |t1| $)))))))) 

(DEFUN |TREE;node?;2$B;17| (|t1| |t2| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |t1| |t2| (QREFELT $ 31)) 'T) ((QEQCAR |t2| 1) 'NIL)
           ('T
            (SPADCALL (CONS #'|TREE;node?;2$B;17!0| (VECTOR $ |t1|))
                      (SPADCALL |t2| (QREFELT $ 12)) (QREFELT $ 37))))))) 

(DEFUN |TREE;node?;2$B;17!0| (|t| $$)
  (PROG (|t1| $)
    (LETT |t1| (QREFELT $$ 1) . #1=(|TREE;node?;2$B;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |t1| |t| (QREFELT $ 35)))))) 

(DEFUN |TREE;leaf?;$B;18| (|t| $)
  (COND ((QEQCAR |t| 1) 'NIL)
        ('T (SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))))) 

(DEFUN |TREE;leaves;$L;19| (|t| $)
  (PROG (#1=#:G254 #2=#:G253 #3=#:G255 #4=#:G258 |c|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) NIL)
            ((SPADCALL |t| (QREFELT $ 39))
             (LIST (SPADCALL |t| (QREFELT $ 17))))
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|TREE;leaves;$L;19|))
              (SEQ (LETT |c| NIL . #6#)
                   (LETT #4# (SPADCALL |t| (QREFELT $ 12)) . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (SPADCALL |c| (QREFELT $ 40)) . #6#)
                      (COND (#1# (LETT #2# (APPEND #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# NIL))))))))) 

(DEFUN |TREE;less?;$NniB;20| (|t| |n| $) (< (SPADCALL |t| (QREFELT $ 42)) |n|)) 

(DEFUN |TREE;more?;$NniB;21| (|t| |n| $)
  (SPADCALL (SPADCALL |t| (QREFELT $ 42)) |n| (QREFELT $ 44))) 

(DEFUN |TREE;nodes;$L;22| (|t| $)
  (PROG (#1=#:G263 #2=#:G262 #3=#:G264 #4=#:G269 #5=#:G126 |nl| #6=#:G268 |c|
         #7=#:G267)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) (SPADCALL (QREFELT $ 46)))
            (#8='T
             (SEQ
              (LETT |nl|
                    (PROGN
                     (LETT #7# NIL . #9=(|TREE;nodes;$L;22|))
                     (SEQ (LETT |c| NIL . #9#)
                          (LETT #6# (SPADCALL |t| (QREFELT $ 12)) . #9#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |c| (CAR #6#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7# (CONS (SPADCALL |c| (QREFELT $ 47)) #7#)
                                  . #9#)))
                          (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #9#)
              (EXIT
               (COND ((SPADCALL |nl| NIL (QREFELT $ 49)) (LIST |t|))
                     (#8#
                      (SPADCALL |t|
                                (PROGN
                                 (LETT #1# NIL . #9#)
                                 (SEQ (LETT #5# NIL . #9#)
                                      (LETT #4# |nl| . #9#) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT #5# (CAR #4#) . #9#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (PROGN
                                         (LETT #3# #5# . #9#)
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT $ 50))
                                                 . #9#))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3# . #9#)
                                            (LETT #1# 'T . #9#)))))))
                                      (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#1# #2#)
                                       (#8# (SPADCALL (QREFELT $ 41)))))
                                (QREFELT $ 51)))))))))))) 

(DEFUN |TREE;size?;$NniB;23| (|t| |n| $)
  (EQL (SPADCALL |t| (QREFELT $ 42)) |n|)) 

(DEFUN |TREE;any?;M$B;24| (|fn| |t| $)
  (PROG (#1=#:G278 #2=#:G279 |c|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((QEQCAR |t| 1) 'NIL)
             ((SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|) 'T)
             ('T
              (SEQ
               (SEQ (LETT |c| NIL . #3=(|TREE;any?;M$B;24|))
                    (LETT #2# (SPADCALL |t| (QREFELT $ 12)) . #3#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |fn| |c| (QREFELT $ 53))
                        (PROGN (LETT #1# 'T . #3#) (GO #1#))))))
                    (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT 'NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |TREE;every?;M$B;25| (|fn| |t| $)
  (PROG (#1=#:G285 #2=#:G286 |c|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((QEQCAR |t| 1) 'T)
             ((NULL (SPADCALL (SPADCALL |t| (QREFELT $ 17)) |fn|)) 'NIL)
             ('T
              (SEQ
               (SEQ (LETT |c| NIL . #3=(|TREE;every?;M$B;25|))
                    (LETT #2# (SPADCALL |t| (QREFELT $ 12)) . #3#) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((COND ((SPADCALL |fn| |c| (QREFELT $ 54)) 'NIL)
                              ('T 'T))
                        (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
                    (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT 'T)))))
      #1# (EXIT #1#))))) 

(DEFUN |TREE;member?;S$B;26| (|n| |t| $)
  (PROG ()
    (RETURN
     (COND ((QEQCAR |t| 1) 'NIL)
           ((SPADCALL |n| (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 18)) 'T)
           ('T
            (SPADCALL (CONS #'|TREE;member?;S$B;26!0| (VECTOR $ |n|))
                      (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 37))))))) 

(DEFUN |TREE;member?;S$B;26!0| (|c| $$)
  (PROG (|n| $)
    (LETT |n| (QREFELT $$ 1) . #1=(|TREE;member?;S$B;26|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |n| |c| (QREFELT $ 55)))))) 

(DEFUN |TREE;members;$L;27| (|t| $) (SPADCALL |t| (QREFELT $ 56))) 

(DEFUN |TREE;parts;$L;28| (|t| $)
  (PROG (#1=#:G302 #2=#:G301 #3=#:G303 #4=#:G308 #5=#:G127 |u| #6=#:G307 |c|
         #7=#:G306)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) NIL)
            (#8='T
             (SEQ
              (LETT |u|
                    (PROGN
                     (LETT #7# NIL . #9=(|TREE;parts;$L;28|))
                     (SEQ (LETT |c| NIL . #9#)
                          (LETT #6# (SPADCALL |t| (QREFELT $ 12)) . #9#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |c| (CAR #6#) . #9#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7# (CONS (SPADCALL |c| (QREFELT $ 56)) #7#)
                                  . #9#)))
                          (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    . #9#)
              (EXIT
               (COND
                ((SPADCALL |u| NIL (QREFELT $ 59))
                 (LIST (SPADCALL |t| (QREFELT $ 17))))
                (#8#
                 (CONS (SPADCALL |t| (QREFELT $ 17))
                       (PROGN
                        (LETT #1# NIL . #9#)
                        (SEQ (LETT #5# NIL . #9#) (LETT #4# |u| . #9#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT #5# (CAR #4#) . #9#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #3# #5# . #9#)
                                (COND (#1# (LETT #2# (APPEND #2# #3#) . #9#))
                                      ('T
                                       (PROGN
                                        (LETT #2# #3# . #9#)
                                        (LETT #1# 'T . #9#)))))))
                             (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#1# #2#) (#8# NIL)))))))))))))) 

(DEFUN |TREE;=;2$B;29| (|t1| |t2| $) (|TREE;equal?| |t1| |t2| |t1| |t2| 0 $)) 

(DEFUN |TREE;equal?| (|t1| |t2| |ot1| |ot2| |k| $)
  (PROG (#1=#:G321 #2=#:G322 |x| #3=#:G323 |y| #4=#:G319 |c2| |c1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((EQL |k| 5)
          (COND
           ((OR (SPADCALL |ot1| (QREFELT $ 60))
                (SPADCALL |ot2| (QREFELT $ 60)))
            (EXIT
             (|error| "use cyclicEqual? to test equality on cyclic trees"))))))
        (EXIT
         (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) 'NIL)
               (#5='T
                (SEQ
                 (EXIT
                  (SEQ
                   (COND
                    ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                               (SPADCALL |t2| (QREFELT $ 17)) (QREFELT $ 18))
                     (SEQ
                      (LETT |c1| (SPADCALL |t1| (QREFELT $ 12))
                            . #6=(|TREE;equal?|))
                      (LETT |c2| (SPADCALL |t2| (QREFELT $ 12)) . #6#)
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |c1| |c2| (QREFELT $ 61)))
                         (PROGN (LETT #4# 'NIL . #6#) (GO #4#)))))))
                    (#5# (EXIT 'NIL)))
                   (SEQ (LETT |y| NIL . #6#) (LETT #3# |c2| . #6#)
                        (LETT |x| NIL . #6#) (LETT #2# |c1| . #6#) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #6#) NIL)
                              (ATOM #3#)
                              (PROGN (LETT |y| (CAR #3#) . #6#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((COND
                             ((|TREE;equal?| |x| |y| |ot1| |ot2| (+ |k| 1) $)
                              'NIL)
                             (#5# 'T))
                            (PROGN (LETT #1# 'NIL . #6#) (GO #1#))))))
                        (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #6#))
                              . #6#)
                        (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))
                 #4# (EXIT #4#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |TREE;#;$Nni;31| (|t| $) (|TREE;treeCount| |t| |t| 0 $)) 

(DEFUN |TREE;treeCount| (|t| |origTree| |k| $)
  (PROG (#1=#:G333 #2=#:G332 #3=#:G334 #4=#:G337 |c|)
    (RETURN
     (SEQ
      (COND
       ((EQL |k| 5)
        (COND
         ((SPADCALL |origTree| (QREFELT $ 60))
          (EXIT (|error| "# is not defined on cyclic trees"))))))
      (EXIT
       (COND ((QEQCAR |t| 1) 0)
             (#5='T
              (+ 1
                 (PROGN
                  (LETT #1# NIL . #6=(|TREE;treeCount|))
                  (SEQ (LETT |c| NIL . #6#)
                       (LETT #4# (SPADCALL |t| (QREFELT $ 12)) . #6#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (|TREE;treeCount| |c| |origTree| (+ |k| 1) $)
                                . #6#)
                          (COND (#1# (LETT #2# (+ #2# #3#) . #6#))
                                ('T
                                 (PROGN
                                  (LETT #2# #3# . #6#)
                                  (LETT #1# 'T . #6#)))))))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# 0))))))))))) 

(DEFUN |TREE;copy;2$;33| (|t| $) (|TREE;copy1| |t| |t| 0 $)) 

(DEFUN |TREE;copy1| (|t| |origTree| |k| $)
  (PROG (#1=#:G348 |x| #2=#:G347)
    (RETURN
     (SEQ
      (COND
       ((EQL |k| 5)
        (COND
         ((SPADCALL |origTree| (QREFELT $ 60))
          (EXIT (|error| "use cyclicCopy to copy a cyclic tree"))))))
      (EXIT
       (COND ((QEQCAR |t| 1) |t|)
             ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
              (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 25)))
             ('T
              (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                        (PROGN
                         (LETT #2# NIL . #3=(|TREE;copy1|))
                         (SEQ (LETT |x| NIL . #3#)
                              (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (|TREE;copy1| |x| |origTree| (+ |k| 1)
                                        $)
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 23))))))))) 

(DEFUN |TREE;coerce;$Of;35| (|t| $)
  (|TREE;coerce1| |t| (SPADCALL (QREFELT $ 46)) (SPADCALL |t| (QREFELT $ 63))
   $)) 

(DEFUN |TREE;coerce1| (|t| |parents| |pl| $)
  (PROG (#1=#:G360 |br| #2=#:G359 |nodeForm| |k|)
    (RETURN
     (SEQ
      (COND ((QEQCAR |t| 1) (SPADCALL NIL (QREFELT $ 66)))
            ((|TREE;eqMember?| |t| |parents| $)
             (|TREE;multipleOverbar| "." (|TREE;eqMemberIndex| |t| |pl| 0 $)
              |pl| $))
            ((SPADCALL (SPADCALL |t| (QREFELT $ 12)) (QREFELT $ 38))
             (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 67)))
            ('T
             (SEQ
              (LETT |nodeForm|
                    (SPADCALL (SPADCALL |t| (QREFELT $ 17)) (QREFELT $ 67))
                    . #3=(|TREE;coerce1|))
              (SEQ (LETT |k| (|TREE;eqMemberIndex| |t| |pl| 0 $) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |k| 0 (QREFELT $ 33))
                      (LETT |nodeForm|
                            (|TREE;multipleOverbar| |nodeForm| |k| |pl| $)
                            . #3#)))))
              (EXIT
               (SPADCALL |nodeForm|
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |br| NIL . #3#)
                               (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |br| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (|TREE;coerce1| |br|
                                         (SPADCALL |t| |parents|
                                                   (QREFELT $ 51))
                                         |pl| $)
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 68)))))))))) 

(DEFUN |TREE;multipleOverbar| (|x| |k| |pl| $)
  (PROG (|c| |s|)
    (RETURN
     (SEQ
      (COND ((< |k| 1) |x|)
            ((EQL (SPADCALL |pl| (QREFELT $ 69)) 1)
             (SPADCALL |x| (QREFELT $ 70)))
            ('T
             (SEQ
              (LETT |s| "abcdefghijklmnopqrstuvwxyz"
                    . #1=(|TREE;multipleOverbar|))
              (LETT |c| (SPADCALL |s| (+ 1 (REM (- |k| 1) 26)) (QREFELT $ 73))
                    . #1#)
              (EXIT (SPADCALL (NUM2USTR |c|) |x| (QREFELT $ 74)))))))))) 

(DEFUN |TREE;cyclic?;$B;38| (|t| $)
  (|TREE;cyclic2?| |t| (SPADCALL (QREFELT $ 46)) $)) 

(DEFUN |TREE;cyclic2?| (|x| |parents| $)
  (PROG (#1=#:G369 #2=#:G373 #3=#:G374 |y|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((SPADCALL |x| (QREFELT $ 9)) 'NIL)
             ((|TREE;eqMember?| |x| |parents| $) 'T)
             ('T
              (SEQ
               (SEQ
                (EXIT
                 (SEQ (LETT |y| NIL . #4=(|TREE;cyclic2?|))
                      (LETT #3# (SPADCALL |x| (QREFELT $ 12)) . #4#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |y| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|TREE;cyclic2?| |y|
                           (SPADCALL |x| |parents| (QREFELT $ 51)) $)
                          (PROGN
                           (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#))
                                 . #4#)
                           (GO #1#))))))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT 'NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |TREE;cyclicCopy;2$;40| (|t| $)
  (|TREE;cyclicCopy2| |t| (SPADCALL |t| (QREFELT $ 75)) $)) 

(DEFUN |TREE;cyclicCopy2| (|t| |cycles| $)
  (PROG (#1=#:G380 |c| #2=#:G379 #3=#:G378)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((|TREE;eqMember?| |t| |cycles| $)
         (PROGN
          (LETT #3# (|TREE;copyCycle2| |t| |cycles| $)
                . #4=(|TREE;cyclicCopy2|))
          (GO #3#)))
        ('T
         (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                   (PROGN
                    (LETT #2# NIL . #4#)
                    (SEQ (LETT |c| NIL . #4#)
                         (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |c| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS (|TREE;cyclicCopy2| |c| |cycles| $) #2#)
                                 . #4#)))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 23)))))
      #3# (EXIT #3#))))) 

(DEFUN |TREE;copyCycle2| (|cycle| |cycleList| $)
  (PROG (#1=#:G385 |c| #2=#:G384 |newCycle|)
    (RETURN
     (SEQ
      (LETT |newCycle|
            (SPADCALL (SPADCALL |cycle| (QREFELT $ 17))
                      (SPADCALL (QREFELT $ 41)) (QREFELT $ 23))
            . #3=(|TREE;copyCycle2|))
      (SPADCALL |newCycle|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |c| NIL . #3#)
                      (LETT #1# (SPADCALL |cycle| (QREFELT $ 12)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|TREE;copyCycle4| |c| |cycle| |newCycle|
                                |cycleList| $)
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 13))
      (EXIT |newCycle|))))) 

(DEFUN |TREE;copyCycle4| (|t| |cycle| |newCycle| |cycleList| $)
  (PROG (#1=#:G392 |c| #2=#:G391)
    (RETURN
     (SEQ
      (COND ((SPADCALL |cycle| (QREFELT $ 9)) (SPADCALL (QREFELT $ 10)))
            ((SPADCALL |t| |cycle| (QREFELT $ 77)) |newCycle|)
            ((|TREE;eqMember?| |t| |cycleList| $)
             (|TREE;copyCycle2| |t| |cycleList| $))
            ('T
             (SPADCALL (SPADCALL |t| (QREFELT $ 17))
                       (PROGN
                        (LETT #2# NIL . #3=(|TREE;copyCycle4|))
                        (SEQ (LETT |c| NIL . #3#)
                             (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (|TREE;copyCycle4| |c| |cycle| |newCycle|
                                       |cycleList| $)
                                      #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT $ 23)))))))) 

(DEFUN |TREE;cyclicEntries;$L;44| (|t| $)
  (|TREE;cyclicEntries3| |t| (SPADCALL (QREFELT $ 46))
   (SPADCALL (QREFELT $ 46)) $)) 

(DEFUN |TREE;cyclicEntries3| (|t| |parents| |cl| $)
  (PROG (#1=#:G399 |y|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |t| (QREFELT $ 9)) |cl|)
            ((|TREE;eqMember?| |t| |parents| $) (|TREE;insert| |t| |cl| $))
            ('T
             (SEQ
              (LETT |parents| (SPADCALL |t| |parents| (QREFELT $ 51))
                    . #2=(|TREE;cyclicEntries3|))
              (SEQ (LETT |y| NIL . #2#)
                   (LETT #1# (SPADCALL |t| (QREFELT $ 12)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |cl| (|TREE;cyclicEntries3| |t| |parents| |cl| $)
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |cl|)))))))) 

(DEFUN |TREE;cyclicEqual?;2$B;46| (|t1| |t2| $)
  (PROG (|cp2| |cp1|)
    (RETURN
     (SEQ
      (LETT |cp1| (SPADCALL |t1| (QREFELT $ 63))
            . #1=(|TREE;cyclicEqual?;2$B;46|))
      (LETT |cp2| (SPADCALL |t2| (QREFELT $ 63)) . #1#)
      (COND
       ((OR
         (SPADCALL (SPADCALL |cp1| (QREFELT $ 69))
                   (SPADCALL |cp2| (QREFELT $ 69)) (QREFELT $ 78))
         (SPADCALL |cp1| (QREFELT $ 79)))
        (EXIT (SPADCALL |t1| |t2| (QREFELT $ 31)))))
      (EXIT (|TREE;cyclicEqual4?| |t1| |t2| |cp1| |cp2| $)))))) 

(DEFUN |TREE;cyclicEqual4?| (|t1| |t2| |cp1| |cp2| $)
  (PROG (#1=#:G414 #2=#:G415 |x| #3=#:G416 |y| |k|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((QEQCAR |t1| 1) (QEQCAR |t2| 1)) ((QEQCAR |t2| 1) 'NIL)
             (#4='T
              (COND
               ((SPADCALL 0
                          (LETT |k| (|TREE;eqMemberIndex| |t1| |cp1| 0 $)
                                . #5=(|TREE;cyclicEqual4?|))
                          (QREFELT $ 78))
                (SPADCALL |t2| (SPADCALL |cp2| |k| (QREFELT $ 81))
                          (QREFELT $ 77)))
               ((SPADCALL (SPADCALL |t1| (QREFELT $ 17))
                          (SPADCALL |t2| (QREFELT $ 17)) (QREFELT $ 82))
                'NIL)
               (#4#
                (SEQ
                 (SEQ (LETT |y| NIL . #5#)
                      (LETT #3# (SPADCALL |t2| (QREFELT $ 12)) . #5#)
                      (LETT |x| NIL . #5#)
                      (LETT #2# (SPADCALL |t1| (QREFELT $ 12)) . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #5#) NIL)
                            (ATOM #3#) (PROGN (LETT |y| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((COND
                           ((|TREE;cyclicEqual4?| |x| |y| |cp1| |cp2| $) 'NIL)
                           (#4# 'T))
                          (PROGN (LETT #1# 'NIL . #5#) (GO #1#))))))
                      (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #5#))
                            . #5#)
                      (GO G190) G191 (EXIT NIL))
                 (EXIT 'T)))))))
      #1# (EXIT #1#))))) 

(DEFUN |TREE;cyclicParents;$L;48| (|t| $)
  (|TREE;cyclicParents3| |t| (SPADCALL (QREFELT $ 46))
   (SPADCALL (QREFELT $ 46)) $)) 

(DEFUN |TREE;cyclicParents3| (|x| |parents| |pl| $)
  (PROG (#1=#:G428 |y| |cycleMembers| #2=#:G427 #3=#:G426)
    (RETURN
     (SEQ
      (COND ((SPADCALL |x| (QREFELT $ 9)) |pl|)
            ((|TREE;eqMember?| |x| |parents| $)
             (SEQ
              (LETT |cycleMembers|
                    (PROGN
                     (LETT #3# NIL . #4=(|TREE;cyclicParents3|))
                     (SEQ (LETT |y| NIL . #4#) (LETT #2# |parents| . #4#) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |y| (CAR #2#) . #4#) NIL)
                                (NULL
                                 (COND ((SPADCALL |x| |y| (QREFELT $ 77)) 'NIL)
                                       ('T 'T))))
                            (GO G191)))
                          (SEQ (EXIT (LETT #3# (CONS |y| #3#) . #4#)))
                          (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                          (EXIT (NREVERSE #3#))))
                    . #4#)
              (EXIT
               (|TREE;eqUnion| (SPADCALL |x| |cycleMembers| (QREFELT $ 51))
                |pl| $))))
            ('T
             (SEQ
              (LETT |parents| (SPADCALL |x| |parents| (QREFELT $ 51)) . #4#)
              (SEQ (LETT |y| NIL . #4#)
                   (LETT #1# (SPADCALL |x| (QREFELT $ 12)) . #4#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |pl| (|TREE;cyclicParents3| |y| |parents| |pl| $)
                           . #4#)))
                   (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |pl|)))))))) 

(DEFUN |TREE;insert| (|x| |l| $)
  (COND ((|TREE;eqMember?| |x| |l| $) |l|)
        ('T (SPADCALL |x| |l| (QREFELT $ 51))))) 

(DEFUN |TREE;lastNode| (|l| $)
  (SEQ
   (COND
    ((SPADCALL |l| (QREFELT $ 38)) (|error| "empty tree has no last node"))
    ('T
     (SEQ
      (SEQ G190
           (COND
            ((NULL
              (COND
               ((SPADCALL (SPADCALL |l| (QREFELT $ 83)) (QREFELT $ 38)) 'NIL)
               ('T 'T)))
             (GO G191)))
           (SEQ
            (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 83)) |TREE;lastNode|)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |l|)))))) 

(DEFUN |TREE;eqMember?| (|y| |l| $)
  (PROG (#1=#:G440 #2=#:G442 #3=#:G443 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|TREE;eqMember?|)) (LETT #3# |l| . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |x| |y| (QREFELT $ 77))
                   (PROGN
                    (LETT #1# (PROGN (LETT #2# 'T . #4#) (GO #2#)) . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT 'NIL)))
      #2# (EXIT #2#))))) 

(DEFUN |TREE;eqMemberIndex| (|x| |l| |k| $)
  (SEQ
   (COND ((SPADCALL |l| (QREFELT $ 79)) |k|)
         (#1='T
          (SEQ (LETT |k| (+ |k| 1) |TREE;eqMemberIndex|)
               (EXIT
                (COND
                 ((SPADCALL |x| (SPADCALL |l| (QREFELT $ 84)) (QREFELT $ 77))
                  |k|)
                 (#1#
                  (|TREE;eqMemberIndex| |x| (SPADCALL |l| (QREFELT $ 83)) |k|
                   $))))))))) 

(DEFUN |TREE;eqUnion| (|u| |v| $)
  (PROG (|newV| |x|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |u| (QREFELT $ 79)) |v|)
            (#1='T
             (SEQ
              (LETT |x| (SPADCALL |u| (QREFELT $ 84)) . #2=(|TREE;eqUnion|))
              (LETT |newV|
                    (COND ((|TREE;eqMember?| |x| |v| $) |v|)
                          (#1# (SPADCALL |x| |v| (QREFELT $ 51))))
                    . #2#)
              (EXIT
               (|TREE;eqUnion| (SPADCALL |u| (QREFELT $ 83)) |newV| $))))))))) 

(DEFUN |Tree| (#1=#:G451)
  (PROG ()
    (RETURN
     (PROG (#2=#:G452)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Tree|)
                                           '|domainEqualList|)
                . #3=(|Tree|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Tree;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tree|))))))))))) 

(DEFUN |Tree;| (|#1|)
  (PROG (|pv$| #1=#:G449 #2=#:G450 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|Tree|))
      (LETT |dv$| (LIST '|Tree| DV$1) . #3#)
      (LETT $ (GETREFV 90) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| |#1|
                                                               '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory| |#1|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#1|)))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory| |#1|
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|Tree| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND #2# (|HasCategory| $ '(|finiteAggregate|))
           (|augmentPredVector| $ 32))
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union|
                 (|:| |node|
                      (|Record| (|:| |value| |#1|) (|:| |args| (|List| $))))
                 (|:| |empty| "empty")))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 65 (CONS (|dispatchFunction| |TREE;coerce;$Of;35|) $)))))
      $)))) 

(MAKEPROP '|Tree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |TREE;empty?;$B;1| |TREE;empty;$;2| (|List| $)
              |TREE;children;$L;3| |TREE;setchildren!;$L$;4|
              |TREE;setvalue!;$2S;5| (|NonNegativeInteger|)
              |TREE;count;S$Nni;6| |TREE;value;$S;13| (0 . =) (|Mapping| 8 6)
              |TREE;count;M$Nni;7| (|Mapping| 6 6) |TREE;map;M2$;8|
              |TREE;tree;SL$;10| |TREE;map!;M2$;9| |TREE;tree;S$;11| (|List| 6)
              |TREE;tree;L$;12| (|List| $$) (6 . |member?|)
              |TREE;child?;2$B;14| |TREE;=;2$B;29| (|Integer|) (12 . >)
              |TREE;distance;2$I;16| |TREE;node?;2$B;17| (|Mapping| 8 $$)
              (18 . |any?|) (24 . |empty?|) |TREE;leaf?;$B;18|
              |TREE;leaves;$L;19| (29 . |nil|) |TREE;#;$Nni;31|
              |TREE;less?;$NniB;20| (33 . >) |TREE;more?;$NniB;21|
              (39 . |empty|) |TREE;nodes;$L;22| (|List| 28) (43 . =)
              (49 . |append|) (55 . |cons|) |TREE;size?;$NniB;23|
              |TREE;any?;M$B;24| |TREE;every?;M$B;25| |TREE;member?;S$B;26|
              |TREE;parts;$L;28| |TREE;members;$L;27| (|List| 26) (61 . =)
              |TREE;cyclic?;$B;38| (67 . =) |TREE;copy;2$;33|
              |TREE;cyclicParents;$L;48| (|OutputForm|) (73 . |coerce|)
              (78 . |coerce|) (83 . |coerce|) (88 . |prefix|) (94 . |#|)
              (99 . |overbar|) (|Character|) (|String|) (104 . |elt|)
              (110 . |overlabel|) |TREE;cyclicEntries;$L;44|
              |TREE;cyclicCopy;2$;40| (116 . |eq?|) (122 . ~=) (128 . |null|)
              |TREE;cyclicEqual?;2$B;46| (133 . |elt|) (139 . ~=)
              (145 . |rest|) (150 . |first|) (|List| 86) (|Equation| 6)
              '"value" (|SingleInteger|) (|HashState|))
           '#(~= 155 |value| 161 |tree| 166 |size?| 182 |setvalue!| 188
              |setelt| 194 |setchildren!| 201 |sample| 207 |parts| 211 |nodes|
              216 |node?| 221 |more?| 227 |members| 233 |member?| 238 |map!|
              244 |map| 250 |less?| 256 |leaves| 262 |leaf?| 267 |latex| 272
              |hashUpdate!| 277 |hash| 283 |every?| 288 |eval| 294 |eq?| 320
              |empty?| 326 |empty| 331 |elt| 335 |distance| 341 |cyclicParents|
              347 |cyclicEqual?| 352 |cyclicEntries| 358 |cyclicCopy| 363
              |cyclic?| 368 |count| 373 |copy| 385 |coerce| 390 |children| 395
              |child?| 400 |any?| 406 = 412 |#| 418)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Aggregate|) (|Evalable| 6) (|SetCategory|) (|Type|)
                      (|shallowlyMutable|) (|finiteAggregate|)
                      (|InnerEvalable| 6 6) (|BasicType|) (|CoercibleTo| 64))
                   (|makeByteWordVec2| 89
                                       '(2 6 8 0 0 18 2 28 8 2 0 29 2 32 8 0 0
                                         33 2 28 8 36 0 37 1 28 8 0 38 0 28 0
                                         41 2 15 8 0 0 44 0 28 0 46 2 48 8 0 0
                                         49 2 28 0 0 0 50 2 28 0 2 0 51 2 58 8
                                         0 0 59 2 28 8 0 0 61 1 0 64 0 65 1 26
                                         64 0 66 1 6 64 0 67 2 64 0 0 11 68 1
                                         28 15 0 69 1 64 0 0 70 2 72 71 0 32 73
                                         2 64 0 0 0 74 2 0 8 0 0 77 2 32 8 0 0
                                         78 1 28 8 0 79 2 28 2 0 32 81 2 6 8 0
                                         0 82 1 28 0 0 83 1 28 2 0 84 2 1 8 0 0
                                         1 1 0 6 0 17 1 0 0 26 27 1 0 0 6 25 2
                                         0 0 6 11 23 2 0 8 0 15 52 2 7 6 0 6 14
                                         3 7 6 0 87 6 1 2 7 0 0 11 13 0 0 0 1 1
                                         5 26 0 56 1 0 11 0 47 2 1 8 0 0 35 2 0
                                         8 0 15 45 1 5 26 0 57 2 6 8 6 0 55 2 7
                                         0 21 0 24 2 0 0 21 0 22 2 0 8 0 15 43
                                         1 0 26 0 40 1 0 8 0 39 1 1 72 0 1 2 1
                                         89 89 0 1 1 1 88 0 1 2 5 8 19 0 54 3 2
                                         0 0 26 26 1 3 2 0 0 6 6 1 2 2 0 0 85 1
                                         2 2 0 0 86 1 2 0 8 0 0 77 1 0 8 0 9 0
                                         0 0 10 2 0 6 0 87 1 2 0 32 0 0 34 1 0
                                         11 0 63 2 0 8 0 0 80 1 0 11 0 75 1 0 0
                                         0 76 1 0 8 0 60 2 6 15 6 0 16 2 5 15
                                         19 0 20 1 0 0 0 62 1 3 64 0 65 1 0 11
                                         0 12 2 1 8 0 0 30 2 5 8 19 0 53 2 1 8
                                         0 0 31 1 5 15 0 42)))))
           '|lookupComplete|)) 
