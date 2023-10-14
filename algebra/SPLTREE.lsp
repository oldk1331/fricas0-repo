
(/VERSIONCHECK 2) 

(PUT '|SPLTREE;rep| '|SPADreplace| '(XLAM (|n|) |n|)) 

(DEFUN |SPLTREE;rep| (|n| $) |n|) 

(PUT '|SPLTREE;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(DEFUN |SPLTREE;per| (|r| $) |r|) 

(DEFUN |SPLTREE;construct;Sn$;3| (|s| $) (|SPLTREE;per| (CONS |s| NIL) $)) 

(DEFUN |SPLTREE;construct;VCL$;4| (|v| |t| |la| $)
  (|SPLTREE;per| (CONS (SPADCALL |v| |t| (QREFELT $ 10)) |la|) $)) 

(DEFUN |SPLTREE;construct;VCL$;5| (|v| |t| |ls| $)
  (PROG (#1=#:G190 |s| #2=#:G189)
    (RETURN
     (SEQ
      (|SPLTREE;per|
       (CONS (SPADCALL |v| |t| (QREFELT $ 10))
             (PROGN
              (LETT #2# NIL . #3=(|SPLTREE;construct;VCL$;5|))
              (SEQ (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 9)) #2#) . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))
       $))))) 

(DEFUN |SPLTREE;construct;VCVL$;6| (|v1| |t| |v2| |lt| $)
  (SPADCALL |v1| |t| (SPADCALL |v2| |lt| (QREFELT $ 16)) (QREFELT $ 14))) 

(DEFUN |SPLTREE;empty?;$B;7| (|a| $)
  (COND
   ((SPADCALL (QCAR (|SPLTREE;rep| |a| $)) (QREFELT $ 19))
    (SPADCALL (QCDR (|SPLTREE;rep| |a| $)) (QREFELT $ 21)))
   ('T 'NIL))) 

(DEFUN |SPLTREE;empty;$;8| ($)
  (SPADCALL (SPADCALL (QREFELT $ 23)) (QREFELT $ 9))) 

(DEFUN |SPLTREE;remove;Sn2$;9| (|s| |a| $)
  (PROG (|lb| |la|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) |a|)
            ('T
             (SEQ
              (COND
               ((SPADCALL |s| (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 26))
                (COND
                 ((|BooleanEquality| (SPADCALL |s| (QREFELT $ 27))
                                     (SPADCALL (SPADCALL |a| (QREFELT $ 25))
                                               (QREFELT $ 27)))
                  (EXIT (SPADCALL (QREFELT $ 24)))))))
              (LETT |la| (SPADCALL |a| (QREFELT $ 28))
                    . #1=(|SPLTREE;remove;Sn2$;9|))
              (LETT |lb| NIL . #1#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |la| (QREFELT $ 21)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |lb|
                          (SPADCALL
                           (SPADCALL |s| (SPADCALL |la| (QREFELT $ 29))
                                     (QREFELT $ 30))
                           |lb| (QREFELT $ 31))
                          . #1#)
                    (EXIT (LETT |la| (SPADCALL |la| (QREFELT $ 32)) . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lb|
                    (SPADCALL (SPADCALL (ELT $ 22) |lb| (QREFELT $ 34))
                              (QREFELT $ 35))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 36))
                (SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 37)) |lb|
                (QREFELT $ 12)))))))))) 

(DEFUN |SPLTREE;remove!;Sn2$;10| (|s| |a| $)
  (PROG (|lb| |la|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) |a|)
            ('T
             (SEQ
              (COND
               ((SPADCALL |s| (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 26))
                (COND
                 ((|BooleanEquality| (SPADCALL |s| (QREFELT $ 27))
                                     (SPADCALL (SPADCALL |a| (QREFELT $ 25))
                                               (QREFELT $ 27)))
                  (EXIT
                   (SEQ
                    (PROGN
                     (RPLACA #1=(|SPLTREE;rep| |a| $)
                             (SPADCALL (QREFELT $ 23)))
                     (QCAR #1#))
                    (PROGN (RPLACD #2=(|SPLTREE;rep| |a| $) NIL) (QCDR #2#))
                    (EXIT |a|)))))))
              (LETT |la| (SPADCALL |a| (QREFELT $ 28))
                    . #3=(|SPLTREE;remove!;Sn2$;10|))
              (LETT |lb| NIL . #3#)
              (SEQ G190
                   (COND
                    ((NULL
                      (COND ((SPADCALL |la| (QREFELT $ 21)) 'NIL) ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (LETT |lb|
                          (SPADCALL
                           (SPADCALL |s| (SPADCALL |la| (QREFELT $ 29))
                                     (QREFELT $ 38))
                           |lb| (QREFELT $ 31))
                          . #3#)
                    (EXIT (LETT |la| (SPADCALL |la| (QREFELT $ 32)) . #3#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lb|
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 24)) |lb| (QREFELT $ 39))
                     (QREFELT $ 35))
                    . #3#)
              (EXIT (SPADCALL |a| |lb| (QREFELT $ 40)))))))))) 

(DEFUN |SPLTREE;value;$Sn;11| (|a| $) (QCAR (|SPLTREE;rep| |a| $))) 

(DEFUN |SPLTREE;children;$L;12| (|a| $) (QCDR (|SPLTREE;rep| |a| $))) 

(DEFUN |SPLTREE;leaf?;$B;13| (|a| $)
  (COND ((SPADCALL |a| (QREFELT $ 22)) 'NIL)
        ('T (SPADCALL (QCDR (|SPLTREE;rep| |a| $)) (QREFELT $ 21))))) 

(DEFUN |SPLTREE;setchildren!;$L$;14| (|a| |la| $)
  (SEQ (PROGN (RPLACD #1=(|SPLTREE;rep| |a| $) |la|) (QCDR #1#)) (EXIT |a|))) 

(DEFUN |SPLTREE;setvalue!;$2Sn;15| (|a| |s| $)
  (SEQ (PROGN (RPLACA #1=(|SPLTREE;rep| |a| $) |s|) (QCAR #1#)) (EXIT |s|))) 

(PUT '|SPLTREE;cyclic?;$B;16| '|SPADreplace| '(XLAM (|a|) 'NIL)) 

(DEFUN |SPLTREE;cyclic?;$B;16| (|a| $) 'NIL) 

(DEFUN |SPLTREE;map;M2$;17| (|foo| |a| $)
  (PROG (#1=#:G228 |c| #2=#:G227 |b|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) |a|)
            (#3='T
             (SEQ
              (LETT |b|
                    (SPADCALL (SPADCALL (SPADCALL |a| (QREFELT $ 25)) |foo|)
                              (QREFELT $ 9))
                    . #4=(|SPLTREE;map;M2$;17|))
              (EXIT
               (COND ((SPADCALL |a| (QREFELT $ 41)) |b|)
                     (#3#
                      (SPADCALL |b|
                                (PROGN
                                 (LETT #2# NIL . #4#)
                                 (SEQ (LETT |c| NIL . #4#)
                                      (LETT #1# (SPADCALL |a| (QREFELT $ 28))
                                            . #4#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |c| (CAR #1#) . #4#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |foo| |c|
                                                         (QREFELT $ 45))
                                               #2#)
                                              . #4#)))
                                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 40)))))))))))) 

(DEFUN |SPLTREE;map!;M2$;18| (|foo| |a| $)
  (PROG (#1=#:G235 |c| #2=#:G234)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) |a|)
            (#3='T
             (SEQ
              (SPADCALL |a| (SPADCALL (SPADCALL |a| (QREFELT $ 25)) |foo|)
                        (QREFELT $ 42))
              (EXIT
               (COND ((SPADCALL |a| (QREFELT $ 41)) |a|)
                     (#3#
                      (SPADCALL |a|
                                (PROGN
                                 (LETT #2# NIL . #4=(|SPLTREE;map!;M2$;18|))
                                 (SEQ (LETT |c| NIL . #4#)
                                      (LETT #1# (SPADCALL |a| (QREFELT $ 28))
                                            . #4#)
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |c| (CAR #1#) . #4#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |foo| |c|
                                                         (QREFELT $ 46))
                                               #2#)
                                              . #4#)))
                                      (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 40)))))))))))) 

(DEFUN |SPLTREE;copy;2$;19| (|a| $) (SPADCALL (ELT $ 47) |a| (QREFELT $ 45))) 

(PUT '|SPLTREE;eq?;2$B;20| '|SPADreplace|
     '(XLAM (|a1| |a2|) (|error| "in eq? from SPLTREE : unimplemented"))) 

(DEFUN |SPLTREE;eq?;2$B;20| (|a1| |a2| $)
  (|error| "in eq? from SPLTREE : unimplemented")) 

(DEFUN |SPLTREE;nodes;$L;21| (|a| $)
  (PROG (#1=#:G244 |c| #2=#:G243)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) NIL)
            ((SPADCALL |a| (QREFELT $ 41)) (LIST |a|))
            ('T
             (SPADCALL |a|
                       (SPADCALL
                        (PROGN
                         (LETT #2# NIL . #3=(|SPLTREE;nodes;$L;21|))
                         (SEQ (LETT |c| NIL . #3#)
                              (LETT #1# (SPADCALL |a| (QREFELT $ 28)) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |c| (QREFELT $ 50)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 51))
                       (QREFELT $ 31)))))))) 

(DEFUN |SPLTREE;leaves;$L;22| (|a| $)
  (PROG (#1=#:G250 |c| #2=#:G249)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) NIL)
            ((SPADCALL |a| (QREFELT $ 41))
             (LIST (SPADCALL |a| (QREFELT $ 25))))
            ('T
             (SPADCALL
              (PROGN
               (LETT #2# NIL . #3=(|SPLTREE;leaves;$L;22|))
               (SEQ (LETT |c| NIL . #3#)
                    (LETT #1# (SPADCALL |a| (QREFELT $ 28)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 52)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (QREFELT $ 53)))))))) 

(DEFUN |SPLTREE;members;$L;23| (|a| $)
  (PROG (#1=#:G256 |c| #2=#:G255)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) NIL)
            ((SPADCALL |a| (QREFELT $ 41))
             (LIST (SPADCALL |a| (QREFELT $ 25))))
            ('T
             (CONS (SPADCALL |a| (QREFELT $ 25))
                   (SPADCALL
                    (PROGN
                     (LETT #2# NIL . #3=(|SPLTREE;members;$L;23|))
                     (SEQ (LETT |c| NIL . #3#)
                          (LETT #1# (SPADCALL |a| (QREFELT $ 28)) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |c| (QREFELT $ 54)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 53))))))))) 

(DEFUN |SPLTREE;#;$Nni;24| (|a| $)
  (PROG (#1=#:G264 |c| #2=#:G263)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) 0) ((SPADCALL |a| (QREFELT $ 41)) 1)
            ('T
             (SPADCALL (ELT $ 56)
                       (PROGN
                        (LETT #2# NIL . #3=(|SPLTREE;#;$Nni;24|))
                        (SEQ (LETT |c| NIL . #3#)
                             (LETT #1# (SPADCALL |a| (QREFELT $ 28)) . #3#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (SPADCALL |c| (QREFELT $ 57)) #2#)
                                     . #3#)))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       1 (QREFELT $ 60)))))))) 

(DEFUN |SPLTREE;=;2$B;25| (|a1| |a2| $)
  (COND ((SPADCALL |a1| (QREFELT $ 22)) (SPADCALL |a2| (QREFELT $ 22)))
        ((SPADCALL |a2| (QREFELT $ 22)) 'NIL)
        ((SPADCALL |a1| (QREFELT $ 41))
         (COND ((NULL (SPADCALL |a2| (QREFELT $ 41))) 'NIL)
               ('T
                (SPADCALL (SPADCALL |a1| (QREFELT $ 25))
                          (SPADCALL |a2| (QREFELT $ 25)) (QREFELT $ 26)))))
        ((OR (SPADCALL |a2| (QREFELT $ 41))
             (SPADCALL (SPADCALL |a1| (QREFELT $ 25))
                       (SPADCALL |a2| (QREFELT $ 25)) (QREFELT $ 61)))
         'NIL)
        ('T
         (SPADCALL (SPADCALL |a1| (QREFELT $ 28))
                   (SPADCALL |a2| (QREFELT $ 28)) (QREFELT $ 62))))) 

(DEFUN |SPLTREE;localCoerce| (|a| |k| $)
  (PROG (|lo| #1=#:G279 |c| #2=#:G278 |ro| |s| |i|)
    (RETURN
     (SEQ
      (COND ((EQL |k| 1) (LETT |s| "* " . #3=(|SPLTREE;localCoerce|)))
            (#4='T (LETT |s| "-> " . #3#)))
      (SEQ (LETT |i| 2 . #3#) G190 (COND ((|greater_SI| |i| |k|) (GO G191)))
           (SEQ (EXIT (LETT |s| (STRCONC "-+" |s|) . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |ro|
            (SPADCALL
             (SPADCALL (SPADCALL |s| (QREFELT $ 66))
                       (SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 67))
                       (QREFELT $ 68))
             (QREFELT $ 69))
            . #3#)
      (EXIT
       (COND ((SPADCALL |a| (QREFELT $ 41)) |ro|)
             (#4#
              (SEQ
               (LETT |lo|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |c| NIL . #3#)
                           (LETT #1# (SPADCALL |a| (QREFELT $ 28)) . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |c| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|SPLTREE;localCoerce| |c| (+ |k| 1) $)
                                    #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #3#)
               (LETT |lo| (CONS |ro| |lo|) . #3#)
               (EXIT (SPADCALL |lo| (QREFELT $ 70))))))))))) 

(DEFUN |SPLTREE;coerce;$Of;27| (|a| $)
  (COND
   ((SPADCALL |a| (QREFELT $ 22))
    (SPADCALL (SPADCALL " " (QREFELT $ 66)) (SPADCALL "* []" (QREFELT $ 66))
              (QREFELT $ 71)))
   ('T
    (SPADCALL (SPADCALL " " (QREFELT $ 66)) (|SPLTREE;localCoerce| |a| 1 $)
              (QREFELT $ 71))))) 

(DEFUN |SPLTREE;extractSplittingLeaf;$U;28| (|a| $)
  (PROG (|la| #1=#:G292 |esl|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((OR (SPADCALL |a| (QREFELT $ 22))
             (SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 27)))
         (CONS 1 "failed"))
        ('T
         (SEQ
          (LETT |la| (SPADCALL |a| (QREFELT $ 28))
                . #2=(|SPLTREE;extractSplittingLeaf;$U;28|))
          (EXIT
           (COND ((SPADCALL |la| (QREFELT $ 21)) (CONS 0 |a|))
                 ('T
                  (SEQ
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((SPADCALL |la| (QREFELT $ 21)) 'NIL)
                                 ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |esl|
                               (SPADCALL (SPADCALL |la| (QREFELT $ 29))
                                         (QREFELT $ 74))
                               . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |esl| 0)
                            (PROGN (LETT #1# |esl| . #2#) (GO #1#)))
                           ('T
                            (LETT |la| (SPADCALL |la| (QREFELT $ 32))
                                  . #2#)))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 1 "failed"))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SPLTREE;updateStatus!;2$;29| (|a| $)
  (PROG (|la| |done|)
    (RETURN
     (SEQ
      (LETT |la| (SPADCALL |a| (QREFELT $ 28))
            . #1=(|SPLTREE;updateStatus!;2$;29|))
      (COND
       ((OR (SPADCALL |la| (QREFELT $ 21))
            (SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 27)))
        (EXIT |a|)))
      (LETT |done| 'T . #1#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |la| (QREFELT $ 21)) 'NIL) ('T |done|)))
             (GO G191)))
           (SEQ
            (LETT |done|
                  (COND
                   (|done|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |la| (QREFELT $ 29)) (QREFELT $ 75))
                      (QREFELT $ 25))
                     (QREFELT $ 27)))
                   ('T 'NIL))
                  . #1#)
            (EXIT (LETT |la| (SPADCALL |la| (QREFELT $ 32)) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (SPADCALL (SPADCALL |a| (QREFELT $ 25)) |done| (QREFELT $ 76))
      (EXIT |a|))))) 

(DEFUN |SPLTREE;result;$L;30| (|a| $)
  (PROG (#1=#:G309 |s| #2=#:G308 |ls|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) NIL)
            ((NULL (SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 27)))
             (|error| "in result from SLPTREE : mad cow!"))
            ('T
             (SEQ
              (LETT |ls| (SPADCALL |a| (QREFELT $ 52))
                    . #3=(|SPLTREE;result;$L;30|))
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS (SPADCALL |s| (QREFELT $ 36))
                                    (SPADCALL |s| (QREFELT $ 37)))
                              #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |SPLTREE;conditions;$L;31| (|a| $)
  (PROG (#1=#:G315 |s| #2=#:G314 |ls|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) NIL)
            ('T
             (SEQ
              (LETT |ls| (SPADCALL |a| (QREFELT $ 52))
                    . #3=(|SPLTREE;conditions;$L;31|))
              (EXIT
               (PROGN
                (LETT #2# NIL . #3#)
                (SEQ (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 37)) #2#)
                             . #3#)))
                     (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |SPLTREE;nodeOf?;Sn$B;32| (|s| |a| $)
  (PROG (|la|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) 'NIL)
            ((SPADCALL |s| (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 26)) 'T)
            (#1='T
             (SEQ
              (LETT |la| (SPADCALL |a| (QREFELT $ 28))
                    . #2=(|SPLTREE;nodeOf?;Sn$B;32|))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (SPADCALL |la| (QREFELT $ 21))
                            (SPADCALL |s| (SPADCALL |la| (QREFELT $ 29))
                                      (QREFELT $ 81)))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |la| (SPADCALL |la| (QREFELT $ 32)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((SPADCALL |la| (QREFELT $ 21)) 'NIL) (#1# 'T)))))))))) 

(DEFUN |SPLTREE;subNodeOf?;Sn$MB;33| (|s| |a| |sub?| $)
  (PROG (|la|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 22)) 'NIL)
            (#1='T
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |a| (QREFELT $ 25)) (QREFELT $ 27))
                (COND
                 ((SPADCALL |s| (SPADCALL |a| (QREFELT $ 25)) |sub?|
                            (QREFELT $ 83))
                  (EXIT 'T)))))
              (LETT |la| (SPADCALL |a| (QREFELT $ 28))
                    . #2=(|SPLTREE;subNodeOf?;Sn$MB;33|))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((OR (SPADCALL |la| (QREFELT $ 21))
                            (SPADCALL |s| (SPADCALL |la| (QREFELT $ 29)) |sub?|
                                      (QREFELT $ 84)))
                        'NIL)
                       ('T 'T)))
                     (GO G191)))
                   (SEQ
                    (EXIT (LETT |la| (SPADCALL |la| (QREFELT $ 32)) . #2#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((SPADCALL |la| (QREFELT $ 21)) 'NIL) (#1# 'T)))))))))) 

(DEFUN |SPLTREE;splitNodeOf!;2$L$;34| (|l| |a| |ls| $)
  (PROG (|la| |ln|)
    (RETURN
     (SEQ
      (LETT |ln| (SPADCALL |ls| (QREFELT $ 85))
            . #1=(|SPLTREE;splitNodeOf!;2$L$;34|))
      (LETT |la| NIL . #1#)
      (SEQ G190 (COND ((NULL (COND ((NULL |ln|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (COND
             ((NULL (SPADCALL (|SPADfirst| |ln|) |a| (QREFELT $ 81)))
              (LETT |la|
                    (SPADCALL (SPADCALL (|SPADfirst| |ln|) (QREFELT $ 9)) |la|
                              (QREFELT $ 31))
                    . #1#)))
            (EXIT (LETT |ln| (CDR |ln|) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL |la| (QREFELT $ 35)) . #1#)
      (SPADCALL |l| |la| (QREFELT $ 40))
      (COND
       ((SPADCALL |la| (QREFELT $ 21))
        (PROGN
         (RPLACA #2=(|SPLTREE;rep| |l| $)
                 (SPADCALL (SPADCALL (QREFELT $ 86)) (SPADCALL (QREFELT $ 87))
                           'T (QREFELT $ 88)))
         (QCAR #2#))))
      (EXIT (SPADCALL |a| (QREFELT $ 75))))))) 

(DEFUN |SPLTREE;splitNodeOf!;2$LM$;35| (|l| |a| |ls| |sub?| $)
  (PROG (|la| |ln|)
    (RETURN
     (SEQ
      (LETT |ln| (SPADCALL |ls| (QREFELT $ 85))
            . #1=(|SPLTREE;splitNodeOf!;2$LM$;35|))
      (LETT |la| NIL . #1#)
      (SEQ G190 (COND ((NULL (COND ((NULL |ln|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (COND
             ((NULL (SPADCALL (|SPADfirst| |ln|) |a| |sub?| (QREFELT $ 84)))
              (LETT |la|
                    (SPADCALL (SPADCALL (|SPADfirst| |ln|) (QREFELT $ 9)) |la|
                              (QREFELT $ 31))
                    . #1#)))
            (EXIT (LETT |ln| (CDR |ln|) . #1#)))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |la| (SPADCALL |la| (QREFELT $ 35)) . #1#)
      (SPADCALL |l| |la| (QREFELT $ 40))
      (COND
       ((SPADCALL |la| (QREFELT $ 21))
        (PROGN
         (RPLACA #2=(|SPLTREE;rep| |l| $)
                 (SPADCALL (SPADCALL (QREFELT $ 86)) (SPADCALL (QREFELT $ 87))
                           'T (QREFELT $ 88)))
         (QCAR #2#))))
      (EXIT (SPADCALL |a| (QREFELT $ 75))))))) 

(DEFUN |SplittingTree| (&REST #1=#:G354)
  (PROG ()
    (RETURN
     (PROG (#2=#:G355)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SplittingTree|)
                                           '|domainEqualList|)
                . #3=(|SplittingTree|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SplittingTree;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SplittingTree|))))))))))) 

(DEFUN |SplittingTree;| (|#1| |#2|)
  (PROG (|pv$| #1=#:G352 #2=#:G353 $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|SplittingTree|))
      (LETT DV$2 (|devaluate| |#2|) . #3#)
      (LETT |dv$| (LIST '|SplittingTree| DV$1 DV$2) . #3#)
      (LETT $ (GETREFV 98) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory|
                                                 (|SplittingNode| |#1| |#2|)
                                                 '(|SetCategory|))
                                                . #3#)
                                          (AND
                                           (|HasCategory|
                                            (|SplittingNode| |#1| |#2|)
                                            (LIST '|Evalable|
                                                  (LIST '|SplittingNode|
                                                        (|devaluate| |#1|)
                                                        (|devaluate| |#2|))))
                                           #2#)
                                          (LETT #1#
                                                (|HasCategory|
                                                 (|SplittingNode| |#1| |#2|)
                                                 '(|CoercibleTo|
                                                   (|OutputForm|)))
                                                . #3#)
                                          (OR #1#
                                              (AND
                                               (|HasCategory|
                                                (|SplittingNode| |#1| |#2|)
                                                (LIST '|Evalable|
                                                      (LIST '|SplittingNode|
                                                            (|devaluate| |#1|)
                                                            (|devaluate|
                                                             |#2|))))
                                               #2#))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|SplittingTree| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 16))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #2#
           (|augmentPredVector| $ 32))
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 64))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|SplittingTree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SplittingNode| 6 7) |SPLTREE;construct;Sn$;3| (0 . |construct|)
              (|List| $) |SPLTREE;construct;VCL$;4| (|List| 8)
              |SPLTREE;construct;VCL$;5| (|List| 7) (6 . |construct|)
              |SPLTREE;construct;VCVL$;6| (|Boolean|) (12 . |empty?|)
              (|List| $$) (17 . |empty?|) |SPLTREE;empty?;$B;7| (22 . |empty|)
              |SPLTREE;empty;$;8| |SPLTREE;value;$Sn;11| (26 . =)
              (32 . |status|) |SPLTREE;children;$L;12| (37 . |first|)
              |SPLTREE;remove;Sn2$;9| (42 . |cons|) (48 . |rest|)
              (|Mapping| 18 $$) (53 . |remove|) (59 . |reverse|) (64 . |value|)
              (69 . |condition|) |SPLTREE;remove!;Sn2$;10| (74 . |remove|)
              |SPLTREE;setchildren!;$L$;14| |SPLTREE;leaf?;$B;13|
              |SPLTREE;setvalue!;$2Sn;15| |SPLTREE;cyclic?;$B;16|
              (|Mapping| 8 8) |SPLTREE;map;M2$;17| |SPLTREE;map!;M2$;18|
              (80 . |copy|) |SPLTREE;copy;2$;19| |SPLTREE;eq?;2$B;20|
              |SPLTREE;nodes;$L;21| (85 . |concat|) |SPLTREE;leaves;$L;22|
              (90 . |concat|) |SPLTREE;members;$L;23| (|NonNegativeInteger|)
              (95 . +) |SPLTREE;#;$Nni;24| (|Mapping| 55 55 55) (|List| 55)
              (101 . |reduce|) (108 . ~=) (114 . =) |SPLTREE;=;2$B;25|
              (|String|) (|OutputForm|) (120 . |message|) (125 . |coerce|)
              (130 . |hconcat|) (136 . |left|) (141 . |vconcat|)
              (146 . |vconcat|) |SPLTREE;coerce;$Of;27| (|Union| $ '"failed")
              |SPLTREE;extractSplittingLeaf;$U;28|
              |SPLTREE;updateStatus!;2$;29| (152 . |setStatus!|)
              (|Record| (|:| |val| 6) (|:| |tower| 7)) (|List| 77)
              |SPLTREE;result;$L;30| |SPLTREE;conditions;$L;31|
              |SPLTREE;nodeOf?;Sn$B;32| (|Mapping| 18 7 7) (158 . |subNode?|)
              |SPLTREE;subNodeOf?;Sn$MB;33| (165 . |removeDuplicates|)
              (170 . |empty|) (174 . |empty|) (178 . |construct|)
              |SPLTREE;splitNodeOf!;2$L$;34| |SPLTREE;splitNodeOf!;2$LM$;35|
              (|List| 92) (|Equation| 8) (|HashState|) (|SingleInteger|)
              (|Mapping| 18 8) '"value" (|Integer|))
           '#(~= 185 |value| 191 |updateStatus!| 196 |subNodeOf?| 201
              |splitNodeOf!| 208 |size?| 223 |setvalue!| 229 |setelt| 235
              |setchildren!| 242 |sample| 248 |result| 252 |remove!| 257
              |remove| 263 |parts| 269 |nodes| 274 |nodeOf?| 279 |node?| 285
              |more?| 291 |members| 297 |member?| 302 |map!| 308 |map| 314
              |less?| 320 |leaves| 326 |leaf?| 331 |latex| 336 |hashUpdate!|
              341 |hash| 347 |extractSplittingLeaf| 352 |every?| 357 |eval| 363
              |eq?| 389 |empty?| 395 |empty| 400 |elt| 404 |distance| 410
              |cyclic?| 416 |count| 421 |copy| 433 |construct| 438 |conditions|
              465 |coerce| 470 |children| 475 |child?| 480 |any?| 486 = 492 |#|
              498)
           'NIL
           (CONS (|makeByteWordVec2| 4 '(0 0 0 2 1 0 0 0 2 1 4))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Aggregate&|
                     |Evalable&| |SetCategory&| NIL NIL NIL |InnerEvalable&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|RecursiveAggregate| (|SplittingNode| 6 7))
                      (|HomogeneousAggregate| (|SplittingNode| 6 7))
                      (|Aggregate|) (|Evalable| (|SplittingNode| 6 7))
                      (|SetCategory|) (|Type|) (|finiteAggregate|)
                      (|shallowlyMutable|)
                      (|InnerEvalable| (|SplittingNode| 6 7)
                                       (|SplittingNode| 6 7))
                      (|BasicType|) (|CoercibleTo| 65))
                   (|makeByteWordVec2| 97
                                       '(2 8 0 6 7 10 2 8 11 6 15 16 1 8 18 0
                                         19 1 20 18 0 21 0 8 0 23 2 8 18 0 0 26
                                         1 8 18 0 27 1 20 2 0 29 2 20 0 2 0 31
                                         1 20 0 0 32 2 20 0 33 0 34 1 20 0 0 35
                                         1 8 6 0 36 1 8 7 0 37 2 20 0 2 0 39 1
                                         8 0 0 47 1 20 0 11 51 1 13 0 11 53 2
                                         55 0 0 0 56 3 59 55 58 0 55 60 2 8 18
                                         0 0 61 2 20 18 0 0 62 1 65 0 64 66 1 8
                                         65 0 67 2 65 0 0 0 68 1 65 0 0 69 1 65
                                         0 11 70 2 65 0 0 0 71 2 8 0 0 18 76 3
                                         8 18 0 0 82 83 1 13 0 0 85 0 6 0 86 0
                                         7 0 87 3 8 0 6 7 18 88 2 1 18 0 0 1 1
                                         0 8 0 25 1 0 0 0 75 3 0 18 8 0 82 84 4
                                         0 0 0 0 13 82 90 3 0 0 0 0 13 89 2 0
                                         18 0 55 1 2 7 8 0 8 42 3 7 8 0 96 8 1
                                         2 7 0 0 11 40 0 0 0 1 1 0 78 0 79 2 0
                                         0 8 0 38 2 0 0 8 0 30 1 5 13 0 1 1 0
                                         11 0 50 2 0 18 8 0 81 2 1 18 0 0 1 2 0
                                         18 0 55 1 1 5 13 0 54 2 6 18 8 0 1 2 7
                                         0 44 0 46 2 0 0 44 0 45 2 0 18 0 55 1
                                         1 0 13 0 52 1 0 18 0 41 1 1 64 0 1 2 1
                                         93 93 0 1 1 1 94 0 1 1 0 73 0 74 2 5
                                         18 95 0 1 3 2 0 0 13 13 1 3 2 0 0 8 8
                                         1 2 2 0 0 91 1 2 2 0 0 92 1 2 0 18 0 0
                                         49 1 0 18 0 22 0 0 0 24 2 0 8 0 96 1 2
                                         0 97 0 0 1 1 0 18 0 43 2 6 55 8 0 1 2
                                         5 55 95 0 1 1 0 0 0 48 4 0 0 6 7 6 15
                                         17 3 0 0 6 7 11 12 3 0 0 6 7 13 14 1 0
                                         0 8 9 1 0 15 0 80 1 3 65 0 72 1 0 11 0
                                         28 2 1 18 0 0 1 2 5 18 95 0 1 2 1 18 0
                                         0 63 1 5 55 0 57)))))
           '|lookupComplete|)) 
