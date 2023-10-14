
(/VERSIONCHECK 2) 

(DEFUN |JBE;coerce;JB$;1| (|jv| $) (SPADCALL |jv| (QREFELT $ 8))) 

(PUT '|JBE;coerce;E$;2| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(DEFUN |JBE;coerce;E$;2| (|exp| $) |exp|) 

(PUT '|JBE;coerce;$E;3| '|SPADreplace| '(XLAM (|f|) |f|)) 

(DEFUN |JBE;coerce;$E;3| (|f| $) |f|) 

(DEFUN |JBE;coerce;Smp$;4| (|p| $)
  (SPADCALL |p| (|spadConstant| $ 13) (QREFELT $ 15))) 

(DEFUN |JBE;numerJP;$Smp;5| (|f| $)
  (PROG (|res| |Exp| JV |newco| |jv| |vs| #1=#:G147 |v| #2=#:G145 |mon|
         #3=#:G146 |co| CO PM |p|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 18) . #4=(|JBE;numerJP;$Smp;5|))
          (LETT |p| (SPADCALL |f| (QREFELT $ 19)) . #4#)
          (LETT PM (SPADCALL |p| (QREFELT $ 21)) . #4#)
          (LETT CO (SPADCALL |p| (QREFELT $ 23)) . #4#)
          (SEQ (LETT |co| NIL . #4#) (LETT #3# CO . #4#) (LETT |mon| NIL . #4#)
               (LETT #2# PM . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |co| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT JV NIL . #4#) (LETT |Exp| NIL . #4#)
                    (LETT |newco| (SPADCALL |co| (QREFELT $ 25)) . #4#)
                    (SEQ (LETT |v| NIL . #4#)
                         (LETT #1# (SPADCALL |mon| (QREFELT $ 27)) . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ (LETT |vs| (SPADCALL |v| (QREFELT $ 29)) . #4#)
                              (LETT |jv| (SPADCALL |vs| (QREFELT $ 31)) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |jv| 1)
                                 (LETT |newco|
                                       (SPADCALL |newco|
                                                 (SPADCALL |vs| (QREFELT $ 11))
                                                 (QREFELT $ 32))
                                       . #4#))
                                ('T
                                 (SEQ (LETT JV (CONS (QCDR |jv|) JV) . #4#)
                                      (EXIT
                                       (LETT |Exp|
                                             (CONS
                                              (SPADCALL |mon| |v|
                                                        (QREFELT $ 35))
                                              |Exp|)
                                             . #4#)))))))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL |newco|
                                               (SPADCALL (|spadConstant| $ 38)
                                                         (NREVERSE JV)
                                                         (NREVERSE |Exp|)
                                                         (QREFELT $ 41))
                                               (QREFELT $ 42))
                                     (QREFELT $ 43))
                           . #4#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JBE;coerce;Smp$;6| (|p| $)
  (PROG (|res| |prod| #1=#:G155 |v| #2=#:G153 |mon| #3=#:G154 |co| CO PM)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 45) . #4=(|JBE;coerce;Smp$;6|))
          (LETT PM (SPADCALL |p| (QREFELT $ 46)) . #4#)
          (LETT CO (SPADCALL |p| (QREFELT $ 48)) . #4#)
          (SEQ (LETT |co| NIL . #4#) (LETT #3# CO . #4#) (LETT |mon| NIL . #4#)
               (LETT #2# PM . #4#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#) . #4#) NIL)
                     (ATOM #3#) (PROGN (LETT |co| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |prod| |co| . #4#)
                    (SEQ (LETT |v| NIL . #4#)
                         (LETT #1# (SPADCALL |mon| (QREFELT $ 49)) . #4#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |prod|
                                 (SPADCALL |prod|
                                           (SPADCALL
                                            (SPADCALL |v| (QREFELT $ 9))
                                            (SPADCALL |p| |v| (QREFELT $ 50))
                                            (QREFELT $ 51))
                                           (QREFELT $ 52))
                                 . #4#)))
                         (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res| (SPADCALL |res| |prod| (QREFELT $ 53))
                           . #4#)))
               (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#)) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |JBE;gcd;3$;7| (|f1| |f2| $)
  (SPADCALL
   (SPADCALL (SPADCALL |f1| (QREFELT $ 19)) (SPADCALL |f2| (QREFELT $ 19))
             (QREFELT $ 55))
   (QREFELT $ 16))) 

(DEFUN |JBE;exquo;2$U;8| (|f1| |f2| $)
  (PROG (|p|)
    (RETURN
     (SEQ
      (LETT |p|
            (SPADCALL (SPADCALL |f1| (QREFELT $ 19))
                      (SPADCALL |f2| (QREFELT $ 19)) (QREFELT $ 58))
            |JBE;exquo;2$U;8|)
      (EXIT
       (COND ((QEQCAR |p| 1) (CONS 1 "failed"))
             ('T (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 16)))))))))) 

(DEFUN |JBE;recip;$U;9| (|f| $)
  (CONS 0 (SPADCALL (|spadConstant| $ 36) |f| (QREFELT $ 60)))) 

(DEFUN |JBE;purge| (|l| |q| $)
  (PROG (#1=#:G172 |k| #2=#:G171)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|JBE;purge|))
       (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (COND
               ((EQL (SPADCALL (SPADCALL |k| (QREFELT $ 29)) (QREFELT $ 62))
                     |q|)
                (LETT #2# (CONS |k| #2#) . #3#)))))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |JBE;dimrec| (|lmv| |indVars| |remVars| |sets| $)
  (PROG (|res| |elem| #1=#:G189 |ik| #2=#:G188 #3=#:G186 |m| #4=#:G187
         #5=#:G184 |lv| #6=#:G185 |indK| |newVars| |jk|)
    (RETURN
     (SEQ (LETT |res| |sets| . #7=(|JBE;dimrec|))
          (LETT |newVars| |remVars| . #7#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |newVars|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ (LETT |jk| (SPADCALL |newVars| (QREFELT $ 63)) . #7#)
                    (LETT |newVars| (CDR |newVars|) . #7#)
                    (LETT |elem| 'NIL . #7#)
                    (LETT |indK| (SPADCALL |indVars| |jk| (QREFELT $ 64))
                          . #7#)
                    (SEQ (LETT #6# NIL . #7#) (LETT |lv| NIL . #7#)
                         (LETT #5# |lmv| . #7#) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |lv| (CAR #5#) . #7#) NIL) #6#)
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |elem| (SPADCALL |lv| |indK| (QREFELT $ 66))
                                 . #7#)))
                         (LETT #5# (PROG1 (CDR #5#) (LETT #6# |elem| . #7#))
                               . #7#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND
                      ((NULL |elem|)
                       (LETT |res|
                             (|JBE;dimrec| |lmv| |indK| |newVars| |res| $)
                             . #7#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |elem| 'NIL . #7#)
          (SEQ (LETT #4# NIL . #7#) (LETT |m| NIL . #7#) (LETT #3# |res| . #7#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |m| (CAR #3#) . #7#) NIL) #4#)
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |elem|
                       (SPADCALL (ELT $ 68)
                                 (PROGN
                                  (LETT #2# NIL . #7#)
                                  (SEQ (LETT |ik| NIL . #7#)
                                       (LETT #1# |indVars| . #7#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |ik| (CAR #1#) . #7#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |ik| |m|
                                                          (QREFELT $ 67))
                                                #2#)
                                               . #7#)))
                                       (LETT #1# (CDR #1#) . #7#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 'T (QREFELT $ 71))
                       . #7#)))
               (LETT #3# (PROG1 (CDR #3#) (LETT #4# |elem| . #7#)) . #7#)
               (GO G190) G191 (EXIT NIL))
          (COND
           ((NULL |elem|)
            (LETT |res| (SPADCALL |indVars| |res| (QREFELT $ 73)) . #7#)))
          (EXIT |res|))))) 

(DEFUN |JBE;dimension;LSem2Nni;12| (|sys| |jm| |q| $)
  (PROG (|dim| #1=#:G200 |ind| |indSets| |dim0| #2=#:G193 |allvars| #3=#:G199
         |lv| |lmv| #4=#:G198 |p| #5=#:G197 |polys|)
    (RETURN
     (SEQ
      (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
            . #6=(|JBE;dimension;LSem2Nni;12|))
      (LETT |lmv|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |p| NIL . #6#) (LETT #4# |polys| . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5#
                          (CONS
                           (SPADCALL
                            (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                      (QREFELT $ 27))
                            (QREFELT $ 80))
                           #5#)
                          . #6#)))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)) . #6#)
      (SEQ (LETT |lv| NIL . #6#) (LETT #3# (CDR |lmv|) . #6#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |allvars|
                   (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                             (QREFELT $ 83))
                   . #6#)))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |dim0|
            (PROG1
                (LETT #2# (- (SPADCALL |q| (QREFELT $ 84)) (LENGTH |allvars|))
                      . #6#)
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #6#)
      (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $) . #6#)
      (LETT |dim| 0 . #6#)
      (SEQ (LETT |ind| NIL . #6#) (LETT #1# |indSets| . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)) . #6#)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (+ |dim0| |dim|)))))) 

(DEFUN |JBE;orderDim;LSem2Nni;13| (|sys| |jm| |q| $)
  (PROG (|dim| #1=#:G211 |ind| |indSets| |dim0| #2=#:G204 |allvars| #3=#:G210
         |lv| |lmv| #4=#:G209 |p| #5=#:G208 |polys|)
    (RETURN
     (SEQ
      (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
            . #6=(|JBE;orderDim;LSem2Nni;13|))
      (LETT |lmv|
            (PROGN
             (LETT #5# NIL . #6#)
             (SEQ (LETT |p| NIL . #6#) (LETT #4# |polys| . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5#
                          (CONS
                           (SPADCALL
                            (|JBE;purge|
                             (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                       (QREFELT $ 27))
                             |q| $)
                            (QREFELT $ 80))
                           #5#)
                          . #6#)))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#))))
            . #6#)
      (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)) . #6#)
      (SEQ (LETT |lv| NIL . #6#) (LETT #3# (CDR |lmv|) . #6#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#) . #6#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |allvars|
                   (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                             (QREFELT $ 83))
                   . #6#)))
           (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
      (LETT |dim0|
            (PROG1
                (LETT #2# (- (SPADCALL |q| (QREFELT $ 88)) (LENGTH |allvars|))
                      . #6#)
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #6#)
      (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $) . #6#)
      (LETT |dim| 0 . #6#)
      (SEQ (LETT |ind| NIL . #6#) (LETT #1# |indSets| . #6#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#) . #6#) NIL))
             (GO G191)))
           (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)) . #6#)))
           (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (+ |dim0| |dim|)))))) 

(DEFUN |JBE;simpSMP| (|p| $)
  (PROG (|up| |md| |lc| |v| |tv|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 90)) (|spadConstant| $ 13))
            (#1='T
             (SEQ
              (LETT |tv| (SPADCALL |p| (QREFELT $ 92)) . #2=(|JBE;simpSMP|))
              (EXIT
               (COND ((QEQCAR |tv| 1) (|error| "inconsistent system"))
                     (#1#
                      (SEQ (LETT |v| (QCDR |tv|) . #2#)
                           (LETT |up| (SPADCALL |p| |v| (QREFELT $ 94)) . #2#)
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT $ 96))
                              (SEQ
                               (LETT |lc| (SPADCALL |up| (QREFELT $ 97)) . #2#)
                               (EXIT
                                (COND
                                 ((QEQCAR (SPADCALL |lc| (QREFELT $ 92)) 1)
                                  (SPADCALL (|spadConstant| $ 13) |v| 1
                                            (QREFELT $ 98)))
                                 (#1#
                                  (SPADCALL (|JBE;simpSMP| |lc| $) |v| 1
                                            (QREFELT $ 98)))))))
                             (#1#
                              (SEQ
                               (LETT |md| (SPADCALL |up| (QREFELT $ 99)) . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |md| 0 (QREFELT $ 101))
                                  (SEQ
                                   (LETT |up|
                                         (QCAR
                                          (SPADCALL |up|
                                                    (SPADCALL
                                                     (|spadConstant| $ 13) |md|
                                                     (QREFELT $ 102))
                                                    (QREFELT $ 104)))
                                         . #2#)
                                   (EXIT (SPADCALL |up| |v| (QREFELT $ 105)))))
                                 (#1# |p|)))))))))))))))))) 

(DEFUN |JBE;simpOne;2$;15| (|f| $)
  (COND ((SPADCALL |f| (QREFELT $ 106)) (|spadConstant| $ 45))
        ('T
         (SPADCALL (|JBE;simpSMP| (SPADCALL |f| (QREFELT $ 19)) $)
                   (QREFELT $ 16))))) 

(DEFUN |JBE;greaterLD| (|r1| |r2| $)
  (PROG (|ind2| |ind1|)
    (RETURN
     (SEQ
      (COND ((NULL (QCAR (QVELT |r1| 1))) 'NIL)
            ((NULL (QCAR (QVELT |r2| 1))) 'T)
            (#1='T
             (SEQ (LETT |ind1| (QCAR (QVELT |r1| 1)) . #2=(|JBE;greaterLD|))
                  (LETT |ind2| (QCAR (QVELT |r2| 1)) . #2#)
                  (EXIT
                   (COND
                    ((SPADCALL (|SPADfirst| |ind1|) (|SPADfirst| |ind2|)
                               (QREFELT $ 108))
                     (< (LENGTH |ind1|) (LENGTH |ind2|)))
                    (#1#
                     (SPADCALL (|SPADfirst| |ind1|) (|SPADfirst| |ind2|)
                               (QREFELT $ 109)))))))))))) 

(DEFUN |JBE;groebner| (|sys| $)
  (PROG (|gbase| |polys|)
    (RETURN
     (SEQ
      (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
            . #1=(|JBE;groebner|))
      (SPADCALL
       (SPADCALL "polys" (SPADCALL |polys| (QREFELT $ 111)) (QREFELT $ 112))
       (QREFELT $ 114))
      (LETT |gbase| (SPADCALL |polys| (QREFELT $ 116)) . #1#)
      (EXIT (SPADCALL (ELT $ 16) |gbase| (QREFELT $ 119))))))) 

(DEFUN |JBE;groebnerSimp| (|sysL| |ind| $)
  (PROG (#1=#:G253 |fun| |i| #2=#:G252 |resJM| #3=#:G251 |eq| #4=#:G250
         |resSys| #5=#:G249 |rec| #6=#:G248 |resDep| |tmp| #7=#:G247 #8=#:G246)
    (RETURN
     (SEQ
      (SPADCALL
       (SPADCALL "groebnerSimp: #" (SPADCALL (LENGTH |sysL|) (QREFELT $ 120))
                 (QREFELT $ 112))
       (QREFELT $ 114))
      (LETT |tmp|
            (PROGN
             (LETT #8# NIL . #9=(|JBE;groebnerSimp|))
             (SEQ (LETT |rec| NIL . #9#) (LETT #7# |sysL| . #9#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |rec| (CAR #7#) . #9#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #8# (CONS (QVELT |rec| 2) #8#) . #9#)))
                  (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                  (EXIT (NREVERSE #8#))))
            . #9#)
      (LETT |resDep| (SPADCALL (ELT $ 121) |tmp| NIL (QREFELT $ 125)) . #9#)
      (LETT |resSys|
            (|JBE;groebner|
             (PROGN
              (LETT #6# NIL . #9#)
              (SEQ (LETT |rec| NIL . #9#) (LETT #5# |sysL| . #9#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #9#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #6# (CONS (QVELT |rec| 0) #6#) . #9#)))
                   (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                   (EXIT (NREVERSE #6#))))
             $)
            . #9#)
      (LETT |resJM|
            (SPADCALL |resSys|
                      (PROGN
                       (LETT #4# NIL . #9#)
                       (SEQ (LETT |eq| NIL . #9#) (LETT #3# |resSys| . #9#)
                            G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |eq| (CAR #3#) . #9#) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #4# (CONS |ind| #4#) . #9#)))
                            (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT $ 127))
            . #9#)
      (SPADCALL "END groebnerSimp" (QREFELT $ 114))
      (EXIT
       (PROGN
        (LETT #2# NIL . #9#)
        (SEQ (LETT |i| 1 . #9#) (LETT |fun| NIL . #9#)
             (LETT #1# |resSys| . #9#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |fun| (CAR #1#) . #9#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (VECTOR |fun| (SPADCALL |resJM| |i| (QREFELT $ 130))
                              |resDep|)
                      #2#)
                     . #9#)))
             (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #9#)) . #9#)
             (GO G190) G191 (EXIT (NREVERSE #2#))))))))) 

(DEFUN |JBE;linearSimp| (|sysL| |ind| $)
  (PROG (|res| |newDep| |newJMR| |newFun| #1=#:G272 |rec| |sdep| |ssub|
         #2=#:G258 |rsysL| |sld| |srec| |solved?| |s| |ld|)
    (RETURN
     (SEQ (LETT |solved?| 'NIL . #3=(|JBE;linearSimp|))
          (LETT |rsysL| NIL . #3#)
          (SEQ G190
               (COND
                ((NULL (COND ((OR |solved?| (NULL |sysL|)) 'NIL) ('T 'T)))
                 (GO G191)))
               (SEQ (LETT |rec| (SPADCALL |sysL| (QREFELT $ 133)) . #3#)
                    (LETT |sysL| (CDR |sysL|) . #3#)
                    (LETT |ld| (|SPADfirst| (QCAR (QVELT |rec| 1))) . #3#)
                    (LETT |s| (SPADCALL (QVELT |rec| 0) |ld| (QREFELT $ 134))
                          . #3#)
                    (LETT |solved?| (QEQCAR |s| 0) . #3#)
                    (EXIT
                     (COND
                      (|solved?|
                       (SEQ (LETT |srec| |rec| . #3#)
                            (EXIT (LETT |sld| |ld| . #3#))))
                      ('T
                       (LETT |rsysL| (SPADCALL |rec| |rsysL| (QREFELT $ 135))
                             . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |rsysL| (SPADCALL (NREVERSE |rsysL|) |sysL| (QREFELT $ 136))
                . #3#)
          (EXIT
           (COND
            (|solved?|
             (SEQ
              (LETT |ssub|
                    (PROG2 (LETT #2# |s| . #3#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) $ #2#))
                    . #3#)
              (LETT |res| (LIST |srec|) . #3#)
              (LETT |sdep| (QVELT |srec| 2) . #3#)
              (SEQ (LETT |rec| NIL . #3#) (LETT #1# |rsysL| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |newFun|
                          (SPADCALL
                           (SPADCALL (QVELT |rec| 0) |sld| |ssub|
                                     (QREFELT $ 137))
                           (QREFELT $ 107))
                          . #3#)
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |newFun| (QREFELT $ 106)))
                       (SEQ
                        (LETT |newJMR|
                              (SPADCALL
                               (SPADCALL (LIST |newFun|) (LIST |ind|)
                                         (QREFELT $ 127))
                               1 (QREFELT $ 130))
                              . #3#)
                        (LETT |newDep|
                              (SPADCALL (APPEND (QVELT |rec| 2) |sdep|)
                                        (QREFELT $ 138))
                              . #3#)
                        (EXIT
                         (LETT |res|
                               (SPADCALL (VECTOR |newFun| |newJMR| |newDep|)
                                         |res| (QREFELT $ 135))
                               . #3#)))))))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))
            ('T (|JBE;groebnerSimp| |rsysL| |ind| $)))))))) 

(DEFUN |JBE;simpRec| (|sysL| |ind| $)
  (PROG (|newSysL| |sld| |srec| |eqLD| |resLD| |fld| |frec|)
    (RETURN
     (SEQ
      (COND ((< (LENGTH |sysL|) 2) |sysL|)
            (#1='T
             (SEQ
              (LETT |frec| (SPADCALL |sysL| (QREFELT $ 133))
                    . #2=(|JBE;simpRec|))
              (LETT |fld| (|SPADfirst| (QCAR (QVELT |frec| 1))) . #2#)
              (LETT |sysL| (CDR |sysL|) . #2#)
              (LETT |srec| (SPADCALL |sysL| (QREFELT $ 133)) . #2#)
              (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))) . #2#)
              (EXIT
               (COND
                ((SPADCALL |fld| |sld| (QREFELT $ 109))
                 (SPADCALL |frec| (|JBE;simpRec| |sysL| |ind| $)
                           (QREFELT $ 135)))
                (#1#
                 (SEQ (LETT |eqLD| (LIST |frec|) . #2#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL |sysL|) 'NIL)
                                    ('T
                                     (SPADCALL |sld| |fld| (QREFELT $ 108)))))
                             (GO G191)))
                           (SEQ
                            (LETT |eqLD|
                                  (SPADCALL |srec| |eqLD| (QREFELT $ 135))
                                  . #2#)
                            (LETT |sysL| (CDR |sysL|) . #2#)
                            (EXIT
                             (COND
                              ((NULL (NULL |sysL|))
                               (SEQ
                                (LETT |srec| (SPADCALL |sysL| (QREFELT $ 133))
                                      . #2#)
                                (EXIT
                                 (LETT |sld|
                                       (|SPADfirst| (QCAR (QVELT |srec| 1)))
                                       . #2#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |eqLD|
                            (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                      (|JBE;linearSimp| (NREVERSE |eqLD|) |ind|
                                       $)
                                      (QREFELT $ 140))
                            . #2#)
                      (LETT |srec| (SPADCALL |eqLD| (QREFELT $ 133)) . #2#)
                      (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))) . #2#)
                      (LETT |resLD| NIL . #2#)
                      (SEQ G190
                           (COND
                            ((NULL
                              (COND ((NULL |eqLD|) 'NIL)
                                    ('T
                                     (SPADCALL |sld| |fld| (QREFELT $ 108)))))
                             (GO G191)))
                           (SEQ
                            (LETT |resLD|
                                  (SPADCALL |srec| |resLD| (QREFELT $ 135))
                                  . #2#)
                            (LETT |eqLD| (CDR |eqLD|) . #2#)
                            (EXIT
                             (COND
                              ((NULL (NULL |eqLD|))
                               (SEQ
                                (LETT |srec| (SPADCALL |eqLD| (QREFELT $ 133))
                                      . #2#)
                                (EXIT
                                 (LETT |sld|
                                       (|SPADfirst| (QCAR (QVELT |srec| 1)))
                                       . #2#)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (LETT |newSysL|
                            (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                      |eqLD| |sysL| (QREFELT $ 141))
                            . #2#)
                      (EXIT
                       (SPADCALL (NREVERSE |resLD|)
                                 (|JBE;simpRec| |newSysL| |ind| $)
                                 (QREFELT $ 136)))))))))))))) 

(DEFUN |JBE;simplify;LSemR;21| (|sys| |jm| $)
  (PROG (|resDep| |resSys| #1=#:G322 |rec| |i| |resJM| |sysL| |r| |neq|
         #2=#:G321 |eq| |inds|)
    (RETURN
     (SEQ
      (LETT |inds| (SPADCALL |jm| (QREFELT $ 142))
            . #3=(|JBE;simplify;LSemR;21|))
      (LETT |sysL| NIL . #3#)
      (SEQ (LETT |i| 1 . #3#) (LETT |eq| NIL . #3#) (LETT #2# |sys| . #3#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((COND ((SPADCALL |eq| (QREFELT $ 106)) 'NIL) (#4='T 'T))
               (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT $ 107)) . #3#)
                    (COND
                     ((SPADCALL |neq| |eq| (QREFELT $ 143))
                      (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 130)) . #3#))
                     ('T
                      (LETT |r|
                            (SPADCALL
                             (SPADCALL (LIST |neq|)
                                       (LIST
                                        (QCAR
                                         (SPADCALL |jm| |i| (QREFELT $ 130))))
                                       (QREFELT $ 127))
                             1 (QREFELT $ 130))
                            . #3#)))
                    (COND
                     ((OR (NULL (QCAR |r|))
                          (EQUAL
                           (SPADCALL (|SPADfirst| (QCAR |r|)) (QREFELT $ 145))
                           '|Indep|))
                      (EXIT (|error| "inconsistent system"))))
                    (EXIT
                     (LETT |sysL|
                           (SPADCALL (VECTOR |neq| |r| (LIST |i|)) |sysL|
                                     (QREFELT $ 135))
                           . #3#)))))))
           (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((NULL |sysL|)
         (VECTOR (SPADCALL (QREFELT $ 85)) (SPADCALL NIL 0 (QREFELT $ 146))
                 (CONS 1 NIL)))
        (#4#
         (SEQ
          (LETT |sysL|
                (|JBE;simpRec|
                 (SPADCALL (CONS (|function| |JBE;greaterLD|) $) |sysL|
                           (QREFELT $ 140))
                 |inds| $)
                . #3#)
          (LETT |resSys| (SPADCALL (QREFELT $ 85)) . #3#)
          (LETT |resJM| (SPADCALL |inds| (LENGTH |sysL|) (QREFELT $ 146))
                . #3#)
          (LETT |resDep| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT |rec| NIL . #3#)
               (LETT #1# |sysL| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((OR (NULL (QCAR (QVELT |rec| 1)))
                       (SPADCALL (|SPADfirst| (QCAR (QVELT |rec| 1)))
                                 (SPADCALL 1 (QREFELT $ 148)) (QREFELT $ 149)))
                   (|error| "inconsistent system"))
                  ('T
                   (SEQ
                    (LETT |resSys|
                          (SPADCALL (QVELT |rec| 0) |resSys| (QREFELT $ 150))
                          . #3#)
                    (SPADCALL |resJM| |i| (QVELT |rec| 1) (QREFELT $ 151))
                    (EXIT
                     (LETT |resDep| (CONS (QVELT |rec| 2) |resDep|)
                           . #3#)))))))
               (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (VECTOR (SPADCALL |resSys| (QREFELT $ 152)) |resJM|
                   (CONS 1 (NREVERSE |resDep|)))))))))))) 

(DEFUN |JBE;jetVariables;$L;22| (|Phi| $)
  (PROG (JV #1=#:G337 |pmindex| #2=#:G334 #3=#:G352 |i| #4=#:G351 |mindex|
         #5=#:G350 #6=#:G349 |pupindex| #7=#:G331 |uindex| #8=#:G328 |xindex|
         |arg| |typ| #9=#:G325 #10=#:G347 |Ke| #11=#:G348 |Op| |LOps|
         #12=#:G346 #13=#:G345 |LKernels|)
    (RETURN
     (SEQ (LETT JV NIL . #14=(|JBE;jetVariables;$L;22|))
          (LETT |LKernels| (SPADCALL |Phi| (QREFELT $ 157)) . #14#)
          (LETT |LOps|
                (PROGN
                 (LETT #13# NIL . #14#)
                 (SEQ (LETT |Ke| NIL . #14#) (LETT #12# |LKernels| . #14#) G190
                      (COND
                       ((OR (ATOM #12#)
                            (PROGN (LETT |Ke| (CAR #12#) . #14#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #13# (CONS (SPADCALL |Ke| (QREFELT $ 159)) #13#)
                              . #14#)))
                      (LETT #12# (CDR #12#) . #14#) (GO G190) G191
                      (EXIT (NREVERSE #13#))))
                . #14#)
          (SEQ (LETT |Op| NIL . #14#) (LETT #11# |LOps| . #14#)
               (LETT |Ke| NIL . #14#) (LETT #10# |LKernels| . #14#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |Ke| (CAR #10#) . #14#) NIL)
                     (ATOM #11#) (PROGN (LETT |Op| (CAR #11#) . #14#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |Op| '|%jet| (QREFELT $ 160))
                   (SEQ
                    (LETT |typ|
                          (PROG2
                              (LETT #9# (SPADCALL |Op| '|%jet| (QREFELT $ 162))
                                    . #14#)
                              (QCDR #9#)
                            (|check_union| (QEQCAR #9# 0) (|None|) #9#))
                          . #14#)
                    (LETT |arg| (SPADCALL |Ke| (QREFELT $ 163)) . #14#)
                    (EXIT
                     (COND
                      ((EQUAL |typ| '|Indep|)
                       (SEQ
                        (LETT |xindex|
                              (SPADCALL (SPADCALL |arg| (QREFELT $ 164))
                                        (QREFELT $ 165))
                              . #14#)
                        (EXIT
                         (LETT JV
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #8# |xindex| . #14#)
                                   (|check_subtype| (> #8# 0)
                                                    '(|PositiveInteger|) #8#))
                                 (QREFELT $ 166))
                                JV)
                               . #14#))))
                      ((EQUAL |typ| '|Dep|)
                       (SEQ
                        (LETT |uindex|
                              (SPADCALL (SPADCALL |arg| (QREFELT $ 164))
                                        (QREFELT $ 165))
                              . #14#)
                        (EXIT
                         (LETT JV
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #7# |uindex| . #14#)
                                   (|check_subtype| (> #7# 0)
                                                    '(|PositiveInteger|) #7#))
                                 (QREFELT $ 148))
                                JV)
                               . #14#))))
                      ('T
                       (SEQ
                        (LETT |pupindex|
                              (SPADCALL (SPADCALL |arg| (QREFELT $ 164))
                                        (QREFELT $ 165))
                              . #14#)
                        (LETT |mindex|
                              (PROGN
                               (LETT #6# NIL . #14#)
                               (SEQ (LETT |i| NIL . #14#)
                                    (LETT #5#
                                          (SPADCALL
                                           (SPADCALL |arg| (QREFELT $ 167))
                                           (QREFELT $ 167))
                                          . #14#)
                                    G190
                                    (COND
                                     ((OR (ATOM #5#)
                                          (PROGN
                                           (LETT |i| (CAR #5#) . #14#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #6#
                                            (CONS
                                             (SPADCALL |i| (QREFELT $ 165))
                                             #6#)
                                            . #14#)))
                                    (LETT #5# (CDR #5#) . #14#) (GO G190) G191
                                    (EXIT (NREVERSE #6#))))
                              . #14#)
                        (LETT |pmindex|
                              (PROGN
                               (LETT #4# NIL . #14#)
                               (SEQ (LETT |i| NIL . #14#)
                                    (LETT #3# |mindex| . #14#) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN
                                           (LETT |i| (CAR #3#) . #14#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (PROG1 (LETT #2# |i| . #14#)
                                               (|check_subtype| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                #2#))
                                             #4#)
                                            . #14#)))
                                    (LETT #3# (CDR #3#) . #14#) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              . #14#)
                        (EXIT
                         (LETT JV
                               (CONS
                                (SPADCALL
                                 (PROG1 (LETT #1# |pupindex| . #14#)
                                   (|check_subtype| (> #1# 0)
                                                    '(|PositiveInteger|) #1#))
                                 |pmindex| (QREFELT $ 168))
                                JV)
                               . #14#)))))))))))
               (LETT #10# (PROG1 (CDR #10#) (LETT #11# (CDR #11#) . #14#))
                     . #14#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT $ 109) (SPADCALL JV (QREFELT $ 169))
                     (QREFELT $ 171))))))) 

(DEFUN |JBE;differentiate;$JB$;23| (|fun| |jv| $)
  (PROG (|x|)
    (RETURN
     (SEQ
      (LETT |x| (SPADCALL |jv| (QREFELT $ 173)) |JBE;differentiate;$JB$;23|)
      (EXIT (SPADCALL |fun| |x| (QREFELT $ 174))))))) 

(DEFUN |JBE;differentiate;$S$;24| (|fun| |x| $)
  (SPADCALL (SPADCALL |fun| (QREFELT $ 11)) |x| (QREFELT $ 176))) 

(DEFUN |JBE;subst;$JB2$;25| (|f| |jv| |exp| $)
  (PROG (|res|)
    (RETURN
     (SEQ
      (LETT |res|
            (SPADCALL |f|
                      (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) |exp|
                                (QREFELT $ 179))
                      (QREFELT $ 181))
            |JBE;subst;$JB2$;25|)
      (EXIT |res|))))) 

(DEFUN |JBE;solveFor;$JBU;26| (|f| |jv| $)
  (PROG (|vquo| |vrem| |md| |var| |fun|)
    (RETURN
     (SEQ
      (LETT |fun| (SPADCALL |f| (QREFELT $ 19)) . #1=(|JBE;solveFor;$JBU;26|))
      (LETT |var| (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) (QREFELT $ 182))
            . #1#)
      (LETT |md|
            (SPADCALL |fun| (SPADCALL |var| (QREFELT $ 183)) |var|
                      (QREFELT $ 184))
            . #1#)
      (LETT |vrem| (SPADCALL (QCDR |md|) (QREFELT $ 27)) . #1#)
      (LETT |vquo| (SPADCALL (QCAR |md|) (QREFELT $ 27)) . #1#)
      (EXIT
       (COND
        ((SPADCALL |var| (APPEND |vrem| |vquo|) (QREFELT $ 67))
         (CONS 1 "failed"))
        ((SPADCALL (QCDR |md|) (QREFELT $ 185))
         (COND ((NULL |vquo|) (CONS 0 (|spadConstant| $ 45)))
               (#2='T (CONS 1 "failed"))))
        (#2#
         (CONS 0
               (SPADCALL (SPADCALL (QCDR |md|) (QCAR |md|) (QREFELT $ 15))
                         (QREFELT $ 186)))))))))) 

(DEFUN |JBE;kernel0| (|op| |ls| $) (SPADCALL |op| |ls| (QREFELT $ 187))) 

(DEFUN |JBE;sy2jbe| (|s| $) (SPADCALL |s| (QREFELT $ 188))) 

(DEFUN |JBE;hidedisp| (|l| $)
  (PROG (|op| #1=#:G376 |e| #2=#:G375 |k| |args| |show| |num| |name|)
    (RETURN
     (SEQ
      (LETT |name| (SPADCALL (SPADCALL |l| (QREFELT $ 189)) (QREFELT $ 190))
            . #3=(|JBE;hidedisp|))
      (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #3#)
      (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 189)) (QREFELT $ 165))
            . #3#)
      (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #3#)
      (LETT |show| (SPADCALL (SPADCALL |l| (QREFELT $ 189)) (QREFELT $ 165))
            . #3#)
      (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #3#) (LETT |args| NIL . #3#)
      (SEQ (LETT |k| 1 . #3#) G190 (COND ((|greater_SI| |k| |show|) (GO G191)))
           (SEQ
            (LETT |args|
                  (SPADCALL |args|
                            (LIST
                             (SPADCALL (SPADCALL |l| (QREFELT $ 189))
                                       (QREFELT $ 191)))
                            (QREFELT $ 193))
                  . #3#)
            (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #3#)))
           (LETT |k| (|inc_SI| |k|) . #3#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |k| (+ |show| 1) . #3#) G190 (COND ((> |k| |num|) (GO G191)))
           (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #3#)))
           (LETT |k| (+ |k| 1) . #3#) (GO G190) G191 (EXIT NIL))
      (COND
       ((SPADCALL |l| (QREFELT $ 194))
        (LETT |op| (SPADCALL |name| (QREFELT $ 195)) . #3#))
       (#4='T
        (LETT |op|
              (SPADCALL (SPADCALL |name| (QREFELT $ 195))
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL . #3#)
                          (SEQ (LETT |e| NIL . #3#) (LETT #1# |l| . #3#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |e| (QREFELT $ 191))
                                             #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 196))
                        (QREFELT $ 197))
              . #3#)))
      (EXIT
       (COND ((NULL |args|) |op|)
             (#4# (SPADCALL |op| |args| (QREFELT $ 198))))))))) 

(DEFUN |JBE;hidediff| (|l| |x| $)
  (PROG (|res| |newarg| #1=#:G398 |j| #2=#:G397 |da| |k| #3=#:G396 |arg| |op|
         |oldarg| #4=#:G380 |diff| #5=#:G395 #6=#:G394 |args| |show| |num|
         |name|)
    (RETURN
     (SEQ (LETT |oldarg| (SPADCALL |l| (QREFELT $ 199)) . #7=(|JBE;hidediff|))
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 189)) (QREFELT $ 190))
                . #7#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #7#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 189)) (QREFELT $ 165))
                . #7#)
          (EXIT
           (COND ((ZEROP |num|) (|spadConstant| $ 45))
                 ('T
                  (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #7#)
                       (LETT |show|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 189))
                                       (QREFELT $ 165))
                             . #7#)
                       (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #7#)
                       (LETT |args| (SPADCALL (QREFELT $ 85)) . #7#)
                       (SEQ (LETT |k| 1 . #7#) G190
                            (COND ((|greater_SI| |k| |num|) (GO G191)))
                            (SEQ
                             (LETT |args|
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 189))
                                             |args| (QREFELT $ 150))
                                   . #7#)
                             (EXIT
                              (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #7#)))
                            (LETT |k| (|inc_SI| |k|) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |diff|
                             (PROGN
                              (LETT #6# NIL . #7#)
                              (SEQ (LETT |k| NIL . #7#) (LETT #5# |l| . #7#)
                                   G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |k| (CAR #5#) . #7#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS (SPADCALL |k| (QREFELT $ 165))
                                                 #6#)
                                           . #7#)))
                                   (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                                   (EXIT (NREVERSE #6#))))
                             . #7#)
                       (LETT |oldarg|
                             (SPADCALL |oldarg|
                                       (PROG1 (LETT #4# (+ |num| 3) . #7#)
                                         (|check_subtype| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          #4#))
                                       (QREFELT $ 200))
                             . #7#)
                       (LETT |op| (SPADCALL |name| (QREFELT $ 201)) . #7#)
                       (SPADCALL |op| '|%specialDisp|
                                 (CONS (|function| |JBE;hidedisp|) $)
                                 (QREFELT $ 203))
                       (SPADCALL |op| '|%specialDiff|
                                 (CONS (|function| |JBE;hidediff|) $)
                                 (QREFELT $ 203))
                       (LETT |res| (|spadConstant| $ 45) . #7#)
                       (SEQ (LETT |arg| NIL . #7#) (LETT #3# |args| . #7#)
                            (LETT |k| |num| . #7#) G190
                            (COND
                             ((OR (< |k| 1) (ATOM #3#)
                                  (PROGN (LETT |arg| (CAR #3#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |da| (SPADCALL |arg| |x| (QREFELT $ 174))
                                   . #7#)
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |da| (QREFELT $ 106)))
                                (SEQ
                                 (LETT |newarg|
                                       (SPADCALL |oldarg|
                                                 (PROGN
                                                  (LETT #2# NIL . #7#)
                                                  (SEQ (LETT |j| NIL . #7#)
                                                       (LETT #1#
                                                             (SPADCALL |diff|
                                                                       (LIST
                                                                        |k|)
                                                                       (QREFELT
                                                                        $ 204))
                                                             . #7#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |j|
                                                                    (CAR #1#)
                                                                    . #7#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (SPADCALL |j|
                                                                          (QREFELT
                                                                           $
                                                                           205))
                                                                #2#)
                                                               . #7#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #7#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 (QREFELT $ 206))
                                       . #7#)
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL
                                                   (|JBE;kernel0| |op| |newarg|
                                                    $)
                                                   |da| (QREFELT $ 52))
                                                  (QREFELT $ 53))
                                        . #7#)))))))
                            (LETT |k|
                                  (PROG1 (+ |k| -1) (LETT #3# (CDR #3#) . #7#))
                                  . #7#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |res|))))))))) 

(DEFUN |JBE;function;SLNni$;31| (|f| |arg| |show| $)
  (PROG (|args| |op|)
    (RETURN
     (SEQ
      (LETT |op| (SPADCALL |f| (QREFELT $ 201))
            . #1=(|JBE;function;SLNni$;31|))
      (SPADCALL |op| '|%specialDisp| (CONS (|function| |JBE;hidedisp|) $)
                (QREFELT $ 203))
      (SPADCALL |op| '|%specialDiff| (CONS (|function| |JBE;hidediff|) $)
                (QREFELT $ 203))
      (LETT |args|
            (SPADCALL
             (LIST (|JBE;sy2jbe| |f| $)
                   (SPADCALL (SPADCALL |arg| (QREFELT $ 207)) (QREFELT $ 205))
                   (SPADCALL |show| (QREFELT $ 205)))
             |arg| (QREFELT $ 206))
            . #1#)
      (EXIT (|JBE;kernel0| |op| |args| $)))))) 

(DECLAIM (NOTINLINE |JetBundleExpression;|)) 

(DEFUN |JetBundleExpression| (#1=#:G457)
  (PROG ()
    (RETURN
     (PROG (#2=#:G458)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|JetBundleExpression|)
                                           '|domainEqualList|)
                . #3=(|JetBundleExpression|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|JetBundleExpression;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|JetBundleExpression|))))))))))) 

(DEFUN |JetBundleExpression;| (|#1|)
  (PROG (|pv$| #1=#:G455 #2=#:G456 $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #3=(|JetBundleExpression|))
      (LETT |dv$| (LIST '|JetBundleExpression| DV$1) . #3#)
      (LETT $ (GETREFV 258) . #3#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (LETT #2#
                                                (|HasCategory| (|Integer|)
                                                               '(|IntegralDomain|))
                                                . #3#)
                                          (OR
                                           (|HasCategory| (|Integer|)
                                                          '(|RetractableTo|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|RetractableTo|
                                                             (|Integer|)))
                                            #2#))
                                          (|HasCategory| (|Integer|)
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Integer|)
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| (|Integer|)
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|Integer|) '(|Ring|))
                                          (|HasCategory| (|Integer|)
                                                         '(|Group|))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| (|Integer|)
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Integer|)))
                                                . #3#)
                                          (OR
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Float|))))
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|))))
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|ConvertibleTo|
                                                             (|Pattern|
                                                              (|Integer|))))
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|))))
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|ConvertibleTo|
                                                             (|InputForm|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|))))
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|PatternMatchable|
                                                             (|Float|))))
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|)))
                                            #1#)
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|RetractableTo|
                                                             (|Fraction|
                                                              (|Integer|)))))
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|RetractableTo|
                                                             (|Integer|)))
                                            #2#)
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|LinearlyExplicitRingOver|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|Group|)))
                                           (|HasCategory| (|Integer|)
                                                          '(|Ring|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|AbelianSemiGroup|))
                                          (|HasCategory| (|Integer|)
                                                         '(|SemiGroup|))))
                      . #3#))
      (|haddProp| |$ConstructorCache| '|JetBundleExpression| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 32768))
      (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
           (|augmentPredVector| $ 65536))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7 (|Expression| (|Integer|)))
      $)))) 

(MAKEPROP '|JetBundleExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 24) (|local| |#1|) '|Rep|
              (0 . |coerce|) |JBE;coerce;JB$;1| |JBE;coerce;E$;2|
              |JBE;coerce;$E;3| (|SparseMultivariatePolynomial| 24 34)
              (5 . |One|) (|SparseMultivariatePolynomial| 24 28) (9 . /)
              |JBE;coerce;Smp$;4| (|SparseMultivariatePolynomial| 5 6)
              (15 . |Zero|) (19 . |numer|) (|List| $)
              (24 . |primitiveMonomials|) (|List| 24) (29 . |coefficients|)
              (|Integer|) (34 . |coerce|) (|List| 34) (39 . |variables|)
              (|Kernel| $) (44 . |coerce|) (|Union| 6 '#1="failed")
              (49 . |retractIfCan|) (54 . *) (|NonNegativeInteger|)
              (|Kernel| $$) (60 . |degree|) (66 . |One|) (70 . |One|)
              (74 . |One|) (|List| 6) (|List| 33) (78 . |monomial|) (85 . *)
              (91 . +) |JBE;numerJP;$Smp;5| (97 . |Zero|)
              (101 . |primitiveMonomials|) (|List| 5) (106 . |coefficients|)
              (111 . |variables|) (116 . |degree|) (122 . ^) (128 . *)
              (134 . +) |JBE;coerce;Smp$;6| (140 . |gcd|) |JBE;gcd;3$;7|
              (|Union| $ '"failed") (146 . |exquo|) |JBE;exquo;2$U;8| (152 . /)
              |JBE;recip;$U;9| (158 . |order|) (163 . |first|) (168 . |concat|)
              (|Boolean|) (174 . =) (180 . |member?|) (186 . |and|)
              (|Mapping| 65 65 65) (|List| 65) (192 . |reduce|) (|List| 26)
              (199 . |cons|) (|List| 12) (|Mapping| 12 $$) (|List| $$)
              (|FiniteLinearAggregateFunctions2| $$ 76 12 74) (205 . |map|)
              (211 . |leadingMonomial|) (216 . |sort!|) (221 . |first|)
              (226 . |merge|) (232 . |removeDuplicates!|) (237 . |dimJ|)
              (242 . |empty|) (|SparseEchelonMatrix| 6 $)
              |JBE;dimension;LSem2Nni;12| (246 . |dimS|)
              |JBE;orderDim;LSem2Nni;13| (251 . |ground?|)
              (|Union| 34 '"failed") (256 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (261 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (267 . |monomial?|)
              (272 . |leadingCoefficient|) (277 . |monomial|)
              (284 . |minimumDegree|) (289 . |Zero|) (293 . >)
              (299 . |monomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (305 . |monicDivide|) (311 . |multivariate|) (317 . |zero?|)
              |JBE;simpOne;2$;15| (322 . =) (328 . >) (|OutputForm|)
              (334 . |coerce|) (339 . |assign|) (|Void|) (345 . |print|)
              (|GroebnerPackage| 24 (|IndexedExponents| 34) 34 12)
              (350 . |groebner|) (|Mapping| $$ 12)
              (|FiniteLinearAggregateFunctions2| 12 74 $$ 76) (355 . |map|)
              (361 . |coerce|) (366 . |setUnion|) (372 . |empty|)
              (|Mapping| 40 40 40) (|List| 40) (376 . |reduce|) (|List| 39)
              (383 . |jacobiMatrix|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 76))
              (|SparseEchelonMatrix| 6 $$) (389 . |row|)
              (|Record| (|:| |Fun| $$) (|:| JMR 128) (|:| |Depend| 40))
              (|List| 131) (395 . |first|) |JBE;solveFor;$JBU;26|
              (400 . |cons|) (406 . |concat!|) |JBE;subst;$JB2$;25|
              (412 . |removeDuplicates!|) (|Mapping| 65 131 131)
              (417 . |sort!|) (423 . |merge|) (430 . |allIndices|) (435 . =)
              (|Symbol|) (441 . |type|) (446 . |new|) (|PositiveInteger|)
              (452 . U) (457 . <) (463 . |cons|) (469 . |setRow!|)
              (476 . |reverse!|) (|Union| '"failed" 124)
              (|Record| (|:| |Sys| 20) (|:| JM 86) (|:| |Depend| 153))
              |JBE;simplify;LSemR;21| (|List| 28) (481 . |tower|)
              (|BasicOperator|) (486 . |operator|) (491 . |has?|)
              (|Union| 202 '"failed") (497 . |property|) (503 . |argument|)
              (508 . |second|) (513 . |retract|) (518 . X) (523 . |rest|)
              (528 . P) (534 . |removeDuplicates!|) (|Mapping| 65 6 6)
              (539 . |sort|) |JBE;jetVariables;$L;22| (545 . |name|)
              |JBE;differentiate;$S$;24| |JBE;differentiate;$JB$;23|
              (550 . |differentiate|) (556 . =) (|Equation| $$) (562 . =)
              (|Equation| $) (568 . |eval|) (574 . |retract|) (579 . |coerce|)
              (584 . |monicDivide|) (591 . |zero?|) (596 . -) (601 . |kernel|)
              (607 . |coerce|) (612 . |first|) (617 . |retract|)
              (622 . |coerce|) (|List| 110) (627 . |concat!|) (633 . |empty?|)
              (638 . |coerce|) (643 . |commaSeparate|) (648 . |sub|)
              (654 . |prefix|) (660 . |copy|) (665 . |first|)
              (671 . |operator|) (|None|) (676 . |setProperty|) (683 . |merge|)
              (689 . |coerce|) (694 . |append|) (700 . |#|)
              |JBE;function;SLNni$;31| (|Union| 210 '#1#) (|Fraction| 24)
              (|Record| (|:| |coef| 24) (|:| |var| 28))
              (|Union| 211 '#2="failed") (|Union| 20 '#2#) (|List| 144)
              (|List| 158) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 24)
              (|Factored| $) (|Polynomial| 210) (|Fraction| 93)
              (|Fraction| 220) (|Fraction| 239) (|Union| 223 '#1#)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 24 $)
              (|Record| (|:| |mat| 230) (|:| |vec| (|Vector| 24))) (|Matrix| $)
              (|Vector| $) (|Matrix| 24)
              (|Record| (|:| |var| 28) (|:| |exponent| 24)) (|Union| 231 '#2#)
              (|Record| (|:| |val| $) (|:| |exponent| 24)) (|Union| 233 '#2#)
              (|Mapping| $ 20) (|List| 235) (|Mapping| $ $) (|List| 237)
              (|Polynomial| 24) (|Union| 239 '#1#) (|SegmentBinding| $)
              (|Record| (|:| |coef| 20) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 243 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Polynomial| $) (|Union| 28 '#1#) (|List| 180)
              (|Union| 144 '#1#) (|Union| 24 '#1#)
              (|Record| (|:| |DSys| 20) (|:| |JVars| 126))
              (|Record| (|:| |DPhi| $) (|:| |JVars| 39))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 705 |zerosOf| 711 |zeroOf| 738 |zero?| 765 |whittakerW| 770
              |whittakerM| 777 |weierstrassZeta| 784 |weierstrassSigma| 791
              |weierstrassPPrime| 798 |weierstrassP| 805 |weberE| 812
              |variables| 818 |univariate| 823 |unitNormal| 829 |unitCanonical|
              834 |unit?| 839 |tower| 844 |tanh| 849 |tan| 854 |symbol| 859
              |summation| 864 |subtractIfCan| 876 |subst| 882 |struveL| 908
              |struveH| 914 |squareFreePart| 920 |squareFree| 925 |sqrt| 930
              |sortLD| 935 |solveFor| 940 |smaller?| 946 |sizeLess?| 952 |sinh|
              958 |sin| 963 |simplify| 968 |simpOne| 974 |simpMod| 979
              |setNotation| 992 |sech| 997 |sec| 1002 |sample| 1007 |rootsOf|
              1011 |rootSum| 1038 |rootOf| 1045 |riemannZeta| 1072
              |retractIfCan| 1077 |retract| 1112 |rem| 1147 |reducedSystem|
              1153 |reduceMod| 1164 |reduce| 1170 |recip| 1175 |quo| 1180
              |product| 1186 |principalIdeal| 1198 |prime?| 1203 |polylog| 1208
              |polygamma| 1214 |pi| 1220 |permutation| 1224 |patternMatch| 1230
              |paren| 1244 |orderDim| 1254 |order| 1261 |operators| 1266
              |operator| 1271 |one?| 1276 |odd?| 1281 |numerator| 1286
              |numerJP| 1291 |numer| 1296 |numIndVar| 1301 |numDepVar| 1305
              |nthRoot| 1309 |multiEuclidean| 1315 |minPoly| 1321 |meijerG|
              1326 |map| 1335 |mainKernel| 1341 |lommelS2| 1346 |lommelS1| 1353
              |log| 1360 |li| 1365 |lerchPhi| 1370 |legendreQ| 1377 |legendreP|
              1384 |leadingDer| 1391 |lcmCoef| 1396 |lcm| 1402 |latex| 1413
              |lambertW| 1418 |kummerU| 1423 |kummerM| 1430 |kernels| 1437
              |kernel| 1442 |kelvinKer| 1454 |kelvinKei| 1460 |kelvinBer| 1466
              |kelvinBei| 1472 |jetVariables| 1478 |jacobiZeta| 1483
              |jacobiTheta| 1489 |jacobiSn| 1495 |jacobiMatrix| 1501 |jacobiDn|
              1512 |jacobiCn| 1518 |isTimes| 1524 |isPower| 1529 |isPlus| 1534
              |isMult| 1539 |isExpt| 1544 |is?| 1561 |inv| 1573 |integral| 1578
              |hypergeometricF| 1590 |height| 1597 |hashUpdate!| 1602 |hash|
              1608 |hankelH2| 1613 |hankelH1| 1619 |ground?| 1625 |ground| 1630
              |getNotation| 1635 |gcdPolynomial| 1639 |gcd| 1645 |function|
              1656 |fresnelS| 1663 |fresnelC| 1668 |freeOf?| 1673 |formalDiff2|
              1691 |formalDiff| 1705 |factorials| 1723 |factorial| 1734
              |factor| 1739 |extractSymbol| 1744 |extendedEuclidean| 1749
              |exquo| 1762 |expressIdealMember| 1768 |exp| 1774 |even?| 1779
              |eval| 1784 |euclideanSize| 1945 |erfi| 1950 |erf| 1955 |elt|
              1960 |ellipticPi| 2056 |ellipticK| 2063 |ellipticF| 2068
              |ellipticE| 2074 |divide| 2085 |distribute| 2091 |dimension| 2102
              |dilog| 2109 |digamma| 2114 |differentiate| 2119 |denominator|
              2151 |denom| 2156 |definingPolynomial| 2161 |dSubst| 2166 |csch|
              2173 |csc| 2178 |coth| 2183 |cot| 2188 |cosh| 2193 |cos| 2198
              |convert| 2203 |const?| 2223 |conjugate| 2228 |commutator| 2234
              |coerce| 2240 |class| 2315 |charthRoot| 2320 |characteristic|
              2325 |box| 2329 |binomial| 2339 |besselY| 2345 |besselK| 2351
              |besselJ| 2357 |besselI| 2363 |belong?| 2369 |autoReduce| 2374
              |atanh| 2379 |atan| 2384 |associates?| 2389 |asinh| 2395 |asin|
              2400 |asech| 2405 |asec| 2410 |applyQuote| 2415 |angerJ| 2451
              |airyBiPrime| 2457 |airyBi| 2462 |airyAiPrime| 2467 |airyAi| 2472
              |acsch| 2477 |acsc| 2482 |acoth| 2487 |acot| 2492 |acosh| 2497
              |acos| 2502 |abs| 2507 ^ 2512 |Zero| 2542 X 2546 U 2555 |Si| 2564
              |Shi| 2569 P 2574 |One| 2596 |Gamma| 2600 |Ei| 2611 D 2616 |Ci|
              2642 |Chi| 2647 |Beta| 2652 = 2658 / 2664 - 2676 + 2687 * 2693)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 6 0 0 0 0 0 3 4
                                  5 13 0 0 0 3 0 0 0 0 0 3 3 0 0 0 7 0 0 0 0 0
                                  0 0 0 0 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| NIL |Algebra&|
                |Algebra&| |FullyLinearlyExplicitRingOver&|
                |PartialDifferentialRing&| |Module&| NIL |EntireRing&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |Group&| NIL
                |ExpressionSpace&| |AbelianMonoid&| |Monoid&| NIL NIL NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 24)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 24) (|Field|)
                 (|EuclideanDomain|) (|JetBundleFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 210) (|LeftOreRing|) (|Algebra| $$) (|Algebra| 24)
                 (|FullyLinearlyExplicitRingOver| 24)
                 (|PartialDifferentialRing| 144) (|Module| 210)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$) (|Module| 24)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitRingOver| 24) (|BiModule| 210 210)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 24 24)
                 (|RightModule| 210) (|LeftModule| 210) (|LeftModule| $$)
                 (|Rng|) (|RightModule| $$) (|LeftModule| 24)
                 (|RightModule| 24) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|Group|)
                 (|FullyPatternMatchable| 24) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 24) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 24)
                 (|Patternable| 24) (|Evalable| $$) (|SetCategory|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 24) (|Type|) (|RetractableTo| 144)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 34 $$)
                 (|RetractableTo| 34) (|RetractableTo| 6) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 110) (|RetractableTo| 210)
                 (|RetractableTo| 223) (|RetractableTo| 239)
                 (|ConvertibleTo| 216) (|ConvertibleTo| 217)
                 (|ConvertibleTo| 218))
              (|makeByteWordVec2| 257
                                  '(1 6 5 0 8 0 12 0 13 2 0 0 14 14 15 0 17 0
                                    18 1 0 14 0 19 1 12 20 0 21 1 12 22 0 23 1
                                    5 0 24 25 1 12 26 0 27 1 0 0 28 29 1 0 30 0
                                    31 2 5 0 0 0 32 2 12 33 0 34 35 0 0 0 36 0
                                    6 0 37 0 17 0 38 3 17 0 0 39 40 41 2 17 0 5
                                    0 42 2 17 0 0 0 43 0 0 0 45 1 17 20 0 46 1
                                    17 47 0 48 1 17 39 0 49 2 17 33 0 6 50 2 0
                                    0 0 33 51 2 0 0 0 0 52 2 0 0 0 0 53 2 12 0
                                    0 0 55 2 12 57 0 0 58 2 0 0 0 0 60 1 0 33 0
                                    62 1 26 34 0 63 2 26 0 0 34 64 2 26 65 0 0
                                    66 2 26 65 34 0 67 2 65 0 0 0 68 3 70 65 69
                                    0 65 71 2 72 0 26 0 73 2 77 74 75 76 78 1
                                    12 0 0 79 1 26 0 0 80 1 72 26 0 81 2 26 0 0
                                    0 82 1 26 0 0 83 1 6 33 33 84 0 76 0 85 1 6
                                    33 33 88 1 12 65 0 90 1 12 91 0 92 2 12 93
                                    0 34 94 1 95 65 0 96 1 95 12 0 97 3 12 0 0
                                    34 33 98 1 95 33 0 99 0 7 0 100 2 33 65 0 0
                                    101 2 95 0 12 33 102 2 95 103 0 0 104 2 12
                                    0 93 34 105 1 0 65 0 106 2 6 65 0 0 108 2 6
                                    65 0 0 109 1 74 110 0 111 2 110 0 0 0 112 1
                                    110 113 0 114 1 115 74 74 116 2 118 76 117
                                    74 119 1 33 110 0 120 2 40 0 0 0 121 0 110
                                    0 122 3 124 40 123 0 40 125 2 0 86 20 126
                                    127 2 129 128 0 24 130 1 132 131 0 133 2
                                    132 0 131 0 135 2 132 0 0 0 136 1 40 0 0
                                    138 2 132 0 139 0 140 3 132 0 139 0 0 141 1
                                    129 39 0 142 2 0 65 0 0 143 1 6 144 0 145 2
                                    129 0 39 24 146 1 6 0 147 148 2 6 65 0 0
                                    149 2 76 0 2 0 150 3 129 113 0 24 128 151 1
                                    76 0 0 152 1 0 156 0 157 1 34 158 0 159 2
                                    158 65 0 144 160 2 158 161 0 144 162 1 34
                                    76 0 163 1 76 2 0 164 1 0 24 0 165 1 6 0
                                    147 166 1 76 0 0 167 2 6 0 147 40 168 1 39
                                    0 0 169 2 39 0 170 0 171 1 6 144 0 173 2 7
                                    0 0 144 176 2 7 65 0 0 177 2 178 0 2 2 179
                                    2 0 0 0 180 181 1 0 28 0 182 1 12 0 34 183
                                    3 12 103 0 0 34 184 1 12 65 0 185 1 0 0 0
                                    186 2 5 0 158 20 187 1 5 0 144 188 1 76 2 0
                                    189 1 0 144 0 190 1 0 110 0 191 2 192 0 0 0
                                    193 1 76 65 0 194 1 144 110 0 195 1 110 0
                                    20 196 2 110 0 0 0 197 2 110 0 0 20 198 1
                                    76 0 0 199 2 76 0 0 33 200 1 158 0 144 201
                                    3 158 0 0 144 202 203 2 22 0 0 0 204 1 0 0
                                    24 205 2 76 0 0 0 206 1 76 33 0 207 2 0 65
                                    0 0 1 1 0 20 93 1 1 0 20 246 1 2 0 20 93
                                    144 1 1 0 20 0 1 2 0 20 0 144 1 1 0 0 93 1
                                    1 0 0 246 1 2 0 0 93 144 1 1 0 0 0 1 2 0 0
                                    0 144 1 1 0 65 0 106 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 214 0 1 2
                                    1 221 0 28 1 1 0 253 0 1 1 0 0 0 1 1 0 65 0
                                    1 1 0 156 0 157 1 0 0 0 1 1 0 0 0 1 1 0 86
                                    20 1 2 0 0 0 241 1 2 0 0 0 144 1 2 0 57 0 0
                                    1 2 0 0 0 180 1 3 0 0 0 156 20 1 2 0 0 0
                                    248 1 3 0 0 0 6 0 137 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 0 1 1 0 219 0 1 1 0 0 0 1 1 0 20 20
                                    1 2 0 57 0 6 134 2 0 65 0 0 1 2 0 65 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 154 20 86 155 1 0 0
                                    0 107 3 0 154 20 86 20 1 2 0 20 20 20 1 1 0
                                    113 144 1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 1 0
                                    20 93 1 1 0 20 246 1 2 0 20 93 144 1 1 0 20
                                    0 1 2 0 20 0 144 1 3 0 0 0 93 144 1 1 0 0
                                    93 1 1 0 0 246 1 2 0 0 93 144 1 1 0 0 0 1 2
                                    0 0 0 144 1 1 0 0 0 1 1 2 209 0 1 1 1 224 0
                                    1 1 6 240 0 1 1 0 247 0 1 1 0 249 0 1 1 0
                                    250 0 1 1 0 30 0 31 1 2 210 0 1 1 1 223 0 1
                                    1 6 239 0 1 1 0 28 0 182 1 0 144 0 190 1 0
                                    24 0 165 1 0 6 0 1 2 0 0 0 0 1 2 6 227 228
                                    229 1 1 6 230 228 1 2 0 20 20 20 1 1 0 0 0
                                    1 1 0 57 0 61 2 0 0 0 0 1 2 0 0 0 144 1 2 0
                                    0 0 241 1 1 0 242 20 1 1 0 65 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 1 3 11 225
                                    0 217 225 1 3 12 226 0 218 226 1 1 0 0 0 1
                                    1 0 0 20 1 3 0 33 20 86 33 89 1 0 33 0 62 1
                                    0 215 0 1 1 0 158 158 1 1 0 65 0 1 1 17 65
                                    0 1 1 0 0 0 1 1 0 17 0 44 1 6 14 0 19 0 0
                                    147 1 0 0 147 1 2 0 0 0 24 1 2 0 213 20 0 1
                                    1 16 93 28 1 5 17 0 20 20 20 20 0 1 2 0 0
                                    237 28 1 1 0 247 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 1 1 0 6 0 1 2 0 254 0
                                    0 1 1 0 0 20 1 2 0 0 0 0 1 1 0 255 0 1 1 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 156 0
                                    1 2 0 0 158 20 1 2 0 0 158 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 39
                                    0 172 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 86 20 126 127 1 0 86 20 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 1 15 213 0 1 1 6 234 0 1 1 14 213 0
                                    1 1 14 212 0 1 2 6 232 0 144 1 2 6 232 0
                                    158 1 1 15 232 0 1 2 0 65 0 158 1 2 0 65 0
                                    144 1 1 0 0 0 1 2 0 0 0 241 1 2 0 0 0 144 1
                                    3 17 0 20 20 0 1 1 0 33 0 1 2 0 257 257 0 1
                                    1 0 256 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 65
                                    0 1 1 0 24 0 1 0 0 144 1 2 0 93 93 93 1 2 0
                                    0 0 0 56 1 0 0 20 1 3 0 0 144 20 33 208 1 0
                                    0 0 1 1 0 0 0 1 2 0 65 0 144 1 2 0 65 0 0 1
                                    2 0 65 0 6 1 3 0 251 20 147 86 1 3 0 252 0
                                    147 86 1 2 0 20 20 147 1 2 0 0 0 40 1 2 0 0
                                    0 147 1 2 0 0 0 144 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 219 0 1 1 0 86 86 1 3 0 244 0 0 0 1 2 0
                                    245 0 0 1 2 0 57 0 0 59 2 0 213 20 0 1 1 0
                                    0 0 1 1 17 65 0 1 2 8 0 0 144 1 2 8 0 0 214
                                    1 4 8 0 0 158 0 144 1 1 8 0 0 1 4 8 0 0 215
                                    20 144 1 4 6 0 0 214 40 236 1 4 6 0 0 214
                                    40 238 1 4 6 0 0 144 33 237 1 4 6 0 0 144
                                    33 235 1 3 0 0 0 28 0 1 2 0 0 0 248 1 3 0 0
                                    0 156 20 1 2 0 0 0 180 181 3 0 0 0 20 20 1
                                    3 0 0 0 0 0 1 3 0 0 0 214 236 1 3 0 0 0 214
                                    238 1 3 0 0 0 144 235 1 3 0 0 0 215 238 1 3
                                    0 0 0 144 237 1 3 0 0 0 215 236 1 3 0 0 0
                                    158 237 1 3 0 0 0 158 235 1 1 0 33 0 1 1 0
                                    0 0 1 1 0 0 0 1 3 0 0 158 0 0 1 2 0 0 158 0
                                    1 4 0 0 158 0 0 0 1 6 0 0 158 0 0 0 0 0 1 5
                                    0 0 158 0 0 0 0 1 7 0 0 158 0 0 0 0 0 0 1 9
                                    0 0 158 0 0 0 0 0 0 0 0 1 8 0 0 158 0 0 0 0
                                    0 0 0 1 10 0 0 158 0 0 0 0 0 0 0 0 0 1 2 0
                                    0 158 20 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 103 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 3 0 33 20 86 33 87 1 0 0
                                    0 1 1 0 0 0 1 2 0 0 0 6 175 3 0 0 0 214 40
                                    1 2 0 0 0 214 1 3 0 0 0 144 33 1 2 0 0 0
                                    144 174 1 0 0 0 1 1 1 14 0 1 1 16 0 0 1 3 0
                                    0 0 6 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 8 216 0 1 1 9
                                    217 0 1 1 10 218 0 1 1 1 0 219 1 1 0 65 0 1
                                    2 7 0 0 0 1 2 7 0 0 0 1 1 1 0 220 1 1 1 0
                                    222 1 1 1 0 223 1 1 6 0 239 1 1 0 0 14 16 1
                                    0 0 17 54 1 0 5 0 11 1 0 0 5 10 1 0 0 210 1
                                    1 0 0 28 29 1 0 0 144 1 1 0 0 6 9 1 0 0 0 1
                                    1 0 0 24 205 1 0 110 0 191 1 0 33 0 1 1 4
                                    57 0 1 0 0 33 1 1 0 0 0 1 1 0 0 20 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 0 65 158 1 1 0 20 20 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 0 144 0 1 4 0 0
                                    144 0 0 0 1 3 0 0 144 0 0 1 5 0 0 144 0 0 0
                                    0 1 2 0 0 144 20 1 2 0 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 24 1 2 0 0 0
                                    210 1 2 0 0 0 33 51 2 0 0 0 147 1 0 0 0 45
                                    0 0 0 1 1 0 0 147 1 0 0 0 1 1 0 0 147 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 147 33 1 1 0 0 33 1 1
                                    0 0 40 1 2 0 0 147 40 1 0 0 0 36 2 0 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 214 40 1 3 0
                                    0 0 144 33 1 2 0 0 0 144 1 2 0 0 0 214 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 65 0 0
                                    143 2 1 0 14 14 15 2 0 0 0 0 60 2 0 0 0 0 1
                                    1 0 0 0 186 2 0 0 0 0 53 2 3 0 0 24 1 2 0 0
                                    0 210 1 2 0 0 210 0 1 2 0 0 0 0 52 2 0 0 24
                                    0 1 2 0 0 33 0 1 2 0 0 147 0 1)))))
           '|lookupComplete|)) 
