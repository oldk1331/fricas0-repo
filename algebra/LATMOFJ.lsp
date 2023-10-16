
(SDEFUN |LATMOFJ;proposition| ((|s| |String|) ($ $))
        (LIST (LIST (CONS 1 (LIST |s|))))) 

(SDEFUN |LATMOFJ;logicT;$;2| (($ $)) (LIST (LIST (CONS 0 (LIST 'T))))) 

(SDEFUN |LATMOFJ;logicF;$;3| (($ $)) (LIST (LIST (CONS 0 (LIST 'F))))) 

(SDEFUN |LATMOFJ;variable;S$;4| ((|v| |String|) ($ $))
        (LIST (LIST (CONS 1 (LIST |v|))))) 

(SDEFUN |LATMOFJ;latticeMeetOfJoins;U$;5|
        ((|e| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ $))
        (LIST (LIST |e|))) 

(PUT '|LATMOFJ;emptyLattice;$;6| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |LATMOFJ;emptyLattice;$;6| (($ $)) NIL) 

(PUT '|LATMOFJ;empty?;$B;7| '|SPADreplace| 'NULL) 

(SDEFUN |LATMOFJ;empty?;$B;7| ((|n| $) ($ |Boolean|)) (NULL |n|)) 

(SDEFUN |LATMOFJ;/\\;3$;8| ((|a| $) (|b| $) ($ $))
        (SPROG ((#1=#:G175 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |a| (QREFELT $ 17))
                    (PROGN (LETT #1# |b|) (GO #2=#:G174))))
                  (COND
                   ((SPADCALL |b| (QREFELT $ 17))
                    (PROGN (LETT #1# |a|) (GO #2#))))
                  (EXIT
                   (SPADCALL (SPADCALL |a| |b| (QREFELT $ 19))
                             (QREFELT $ 20)))))
                #2# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;\\/;3$;9| ((|a| $) (|b| $) ($ $))
        (SPROG
         ((|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|))))))))
          (|term|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termRight|
           #1=(|List|
               (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                        (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|termLeft| #1#) (#2=#:G191 NIL) (|innerb| NIL) (#3=#:G190 NIL)
          (|innera| NIL) (#4=#:G189 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |a| (QREFELT $ 17))
              (PROGN (LETT #4# |b|) (GO #5=#:G188))))
            (COND
             ((SPADCALL |b| (QREFELT $ 17)) (PROGN (LETT #4# |a|) (GO #5#))))
            (LETT |r| NIL)
            (SEQ (LETT |innera| NIL) (LETT #3# |a|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |innera| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |innerb| NIL) (LETT #2# |b|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |innerb| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ (LETT |termLeft| |innera|)
                             (LETT |termRight| |innerb|)
                             (LETT |term|
                                   (SPADCALL |termLeft| |termRight|
                                             (QREFELT $ 23)))
                             (EXIT
                              (LETT |r| (SPADCALL |r| |term| (QREFELT $ 24)))))
                        (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |r| (QREFELT $ 20)))))
          #5# (EXIT #4#)))) 

(SDEFUN |LATMOFJ;meet;L$;10| ((|ln| |List| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G195 NIL) (|ele| NIL))
               (SEQ (LETT |r| (SPADCALL (QREFELT $ 15)))
                    (SEQ (LETT |ele| NIL) (LETT #1# |ln|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |r| (SPADCALL |r| |ele| (QREFELT $ 21)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |LATMOFJ;join;L$;11| ((|ln| |List| $) ($ $))
        (SPROG ((|r| ($)) (#1=#:G199 NIL) (|ele| NIL))
               (SEQ (LETT |r| (SPADCALL (QREFELT $ 15)))
                    (SEQ (LETT |ele| NIL) (LETT #1# |ln|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |r| (SPADCALL |r| |ele| (QREFELT $ 25)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |r|)))) 

(SDEFUN |LATMOFJ;equalElements|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         (|b| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |Boolean|))
        (SPROG ((#1=#:G206 NIL) (#2=#:G202 NIL) (#3=#:G203 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1#
                           (EQUAL (QCAR (CDR |a|))
                                  (QCAR
                                   (PROG2 (LETT #3# |b|)
                                       (QCDR #3#)
                                     (|check_union2| (QEQCAR #3# 1)
                                                     (|Record|
                                                      (|:| |str| (|String|)))
                                                     (|Union|
                                                      (|:| |const|
                                                           (|Record|
                                                            (|:| |val|
                                                                 (|Symbol|))))
                                                      (|:| |var|
                                                           (|Record|
                                                            (|:| |str|
                                                                 (|String|)))))
                                                     #3#)))))
                     (GO #4=#:G205))))
                  (COND
                   ((QEQCAR |a| 0)
                    (COND
                     ((QEQCAR |b| 0)
                      (PROGN
                       (LETT #1#
                             (EQUAL
                              (QCAR
                               (PROG2 (LETT #2# |a|)
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|Record|
                                                  (|:| |val| (|Symbol|)))
                                                 (|Union|
                                                  (|:| |const|
                                                       (|Record|
                                                        (|:| |val|
                                                             (|Symbol|))))
                                                  (|:| |var|
                                                       (|Record|
                                                        (|:| |str|
                                                             (|String|)))))
                                                 #2#)))
                              (QCAR (CDR |b|))))
                       (GO #4#))))))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;removeDuplicatesInTerm|
        ((|n| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|)))))))
        (SPROG
         ((|r|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (|match| (|Boolean|)) (#1=#:G222 NIL) (|e2| NIL) (#2=#:G223 NIL)
          (|ne2| NIL) (#3=#:G220 NIL) (|e1| NIL) (#4=#:G221 NIL) (|ne1| NIL))
         (SEQ (LETT |r| NIL)
              (SEQ (LETT |ne1| 1) (LETT #4# (LENGTH |n|)) (LETT |e1| NIL)
                   (LETT #3# |n|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |e1| (CAR #3#)) NIL)
                         (|greater_SI| |ne1| #4#))
                     (GO G191)))
                   (SEQ (LETT |match| NIL)
                        (SEQ (LETT |ne2| 1) (LETT #2# (LENGTH |n|))
                             (LETT |e2| NIL) (LETT #1# |n|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |e2| (CAR #1#)) NIL)
                                   (|greater_SI| |ne2| #2#))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |e1| |e2| (QREFELT $ 29))
                                 (COND ((< |ne1| |ne2|) (LETT |match| 'T)))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |ne2| (|inc_SI| |ne2|))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |match|)
                           (LETT |r| (SPADCALL |r| |e1| (QREFELT $ 30)))))))
                   (LETT #3# (PROG1 (CDR #3#) (LETT |ne1| (|inc_SI| |ne1|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATMOFJ;equalTerms|
        ((|a| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G239 NIL) (|found| (|Boolean|)) (#2=#:G241 NIL) (|b1| NIL)
          (#3=#:G240 NIL) (|a1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL (LENGTH |a|) (LENGTH |b|) (QREFELT $ 32))
              (PROGN (LETT #1# NIL) (GO #4=#:G238))))
            (SEQ (LETT |a1| NIL) (LETT #3# |a|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL)
                      (SEQ (LETT |b1| NIL) (LETT #2# |b|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |b1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATMOFJ;equalElements| |a1| |b1| $)
                               (LETT |found| 'T)))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|) (PROGN (LETT #1# NIL) (GO #4#))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;subTerm|
        ((|a| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         (|b| |List|
          (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                   (|:| |var| (|Record| (|:| |str| (|String|))))))
         ($ |Boolean|))
        (SPROG
         ((#1=#:G257 NIL) (|found| (|Boolean|)) (#2=#:G259 NIL) (|b1| NIL)
          (#3=#:G258 NIL) (|a1| NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((>= (LENGTH |a|) (LENGTH |b|))
              (PROGN (LETT #1# NIL) (GO #4=#:G256))))
            (SEQ (LETT |a1| NIL) (LETT #3# |a|) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ (LETT |found| NIL)
                      (SEQ (LETT |b1| NIL) (LETT #2# |b|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |b1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((|LATMOFJ;equalElements| |a1| |b1| $)
                               (LETT |found| 'T)))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((NULL |found|) (PROGN (LETT #1# NIL) (GO #4#))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;redux;2$;16| ((|n| $) ($ $))
        (SPROG
         ((|r|
           (|List|
            (|List|
             (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                      (|:| |var| (|Record| (|:| |str| (|String|))))))))
          (|modified| #1=(|Boolean|)) (|isSubTerm| #1#) (#2=#:G273 NIL)
          (|inner| NIL) (|match| #1#) (#3=#:G271 NIL) (#4=#:G272 NIL)
          (|innern| NIL)
          (|newinnerList|
           (|List|
            (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                     (|:| |var| (|Record| (|:| |str| (|String|)))))))
          (#5=#:G269 NIL) (|outer| NIL) (#6=#:G270 NIL) (|outern| NIL))
         (SEQ (LETT |r| NIL) (LETT |modified| NIL)
              (SEQ (LETT |outern| 1) (LETT #6# (LENGTH |n|)) (LETT |outer| NIL)
                   (LETT #5# |n|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |outer| (CAR #5#)) NIL)
                         (|greater_SI| |outern| #6#))
                     (GO G191)))
                   (SEQ
                    (LETT |newinnerList|
                          (|LATMOFJ;removeDuplicatesInTerm| |outer| $))
                    (COND
                     ((NULL (|LATMOFJ;equalTerms| |newinnerList| |outer| $))
                      (LETT |modified| 'T)))
                    (LETT |match| NIL)
                    (SEQ (LETT |innern| 1) (LETT #4# (LENGTH |n|))
                         (LETT |inner| NIL) (LETT #3# |n|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |inner| (CAR #3#)) NIL)
                               (|greater_SI| |innern| #4#))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATMOFJ;equalTerms| |inner| |outer| $)
                             (COND
                              ((< |innern| |outern|) (LETT |match| 'T)))))))
                         (LETT #3#
                               (PROG1 (CDR #3#)
                                 (LETT |innern| (|inc_SI| |innern|))))
                         (GO G190) G191 (EXIT NIL))
                    (LETT |isSubTerm| NIL)
                    (SEQ (LETT |inner| NIL) (LETT #2# |n|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |inner| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((|LATMOFJ;subTerm| |inner| |outer| $)
                             (LETT |isSubTerm| 'T)))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((OR |match| |isSubTerm|) (LETT |modified| 'T))
                           ('T
                            (LETT |r|
                                  (SPADCALL |r| |newinnerList|
                                            (QREFELT $ 24)))))))
                   (LETT #5#
                         (PROG1 (CDR #5#) (LETT |outern| (|inc_SI| |outern|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND (|modified| (SPADCALL |r| (QREFELT $ 20))) ('T |r|)))))) 

(PUT '|LATMOFJ;factor;$L;17| '|SPADreplace| 'LIST) 

(SDEFUN |LATMOFJ;factor;$L;17| ((|n| $) ($ |List| $)) (LIST |n|)) 

(PUT '|LATMOFJ;removeDup| '|SPADreplace| '(XLAM (|a| |b|) |a|)) 

(SDEFUN |LATMOFJ;removeDup| ((|a| |List| $) (|b| |List| $) ($ |List| $)) |a|) 

(PUT '|LATMOFJ;deductions;2L;19| '|SPADreplace| '(XLAM (|ln|) |ln|)) 

(SDEFUN |LATMOFJ;deductions;2L;19| ((|ln| |List| $) ($ |List| $)) |ln|) 

(PUT '|LATMOFJ;opType;$S;20| '|SPADreplace| '(XLAM (|n|) 'OTHER)) 

(SDEFUN |LATMOFJ;opType;$S;20| ((|n| $) ($ |Symbol|)) 'OTHER) 

(PUT '|LATMOFJ;atom?;$B;21| '|SPADreplace| '(XLAM (|n|) NIL)) 

(SDEFUN |LATMOFJ;atom?;$B;21| ((|n| $) ($ |Boolean|)) NIL) 

(PUT '|LATMOFJ;value;$S;22| '|SPADreplace| '(XLAM (|n|) 'C)) 

(SDEFUN |LATMOFJ;value;$S;22| ((|n| $) ($ |Symbol|)) 'C) 

(PUT '|LATMOFJ;getChildren;$L;23| '|SPADreplace| 'LIST) 

(SDEFUN |LATMOFJ;getChildren;$L;23| ((|n| $) ($ |List| $)) (LIST |n|)) 

(PUT '|LATMOFJ;=;2$B;24| '|SPADreplace| '(XLAM (|a| |b|) NIL)) 

(SDEFUN |LATMOFJ;=;2$B;24| ((|a| $) (|b| $) ($ |Boolean|)) NIL) 

(SDEFUN |LATMOFJ;toString;$S;25| ((|n| $) ($ |String|))
        (SPROG ((|a| (|String|)))
               (SEQ (LETT |a| (STRCONC "(" (SPADCALL |n| (QREFELT $ 41))))
                    (LETT |a| (STRCONC |a| ")")) (EXIT |a|)))) 

(SDEFUN |LATMOFJ;stringVarOrLit|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |String|))
        (SPROG ((#1=#:G288 NIL) (#2=#:G209 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN (LETT #1# (QCAR (CDR |a|))) (GO #3=#:G287))))
                  (COND
                   ((QEQCAR |a| 0)
                    (SEQ
                     (COND
                      ((EQUAL
                        (QCAR
                         (PROG2 (LETT #2# |a|)
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|Record| (|:| |val| (|Symbol|)))
                                           (|Union|
                                            (|:| |const|
                                                 (|Record|
                                                  (|:| |val| (|Symbol|))))
                                            (|:| |var|
                                                 (|Record|
                                                  (|:| |str| (|String|)))))
                                           #2#)))
                        'T)
                       (PROGN (LETT #1# "T") (GO #3#))))
                     (EXIT (PROGN (LETT #1# "F") (GO #3#))))))
                  (EXIT "error")))
                #3# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;toStringUnwrapped;$S;27| ((|n| $) ($ |String|))
        (SPROG
         ((|r| (|String|)) (#1=#:G301 NIL) (|inner| NIL) (#2=#:G302 NIL)
          (|innern| NIL) (|innerList| (|List| (|String|))) (#3=#:G299 NIL)
          (|outer| NIL) (#4=#:G300 NIL) (|outern| NIL)
          (|outerList| (|List| (|String|))))
         (SEQ (LETT |outerList| NIL) (LETT |r| "")
              (SEQ (LETT |outern| 1) (LETT #4# (LENGTH |n|)) (LETT |outer| NIL)
                   (LETT #3# |n|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#)) NIL)
                         (|greater_SI| |outern| #4#))
                     (GO G191)))
                   (SEQ (LETT |innerList| NIL)
                        (SEQ (LETT |innern| 1) (LETT #2# (LENGTH |outer|))
                             (LETT |inner| NIL) (LETT #1# |outer|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |inner| (CAR #1#)) NIL)
                                   (|greater_SI| |innern| #2#))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (STRCONC |r|
                                             (|LATMOFJ;stringVarOrLit| |inner|
                                              $)))
                              (EXIT
                               (COND
                                ((SPADCALL |innern| (LENGTH |outer|)
                                           (QREFELT $ 32))
                                 (LETT |r| (STRCONC |r| "\\/"))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |innern| (|inc_SI| |innern|))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |outern| (LENGTH |n|) (QREFELT $ 32))
                           (LETT |r| (STRCONC |r| ")/\\("))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |outern| (|inc_SI| |outern|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |LATMOFJ;outputVarOrLit|
        ((|a| |Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
          (|:| |var| (|Record| (|:| |str| (|String|)))))
         ($ |OutputForm|))
        (SPROG ((#1=#:G305 NIL) (#2=#:G209 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((QEQCAR |a| 1)
                    (PROGN
                     (LETT #1# (SPADCALL (QCAR (CDR |a|)) (QREFELT $ 44)))
                     (GO #3=#:G304))))
                  (COND
                   ((QEQCAR |a| 0)
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (QCAR
                             (PROG2 (LETT #2# |a|)
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Record|
                                                (|:| |val| (|Symbol|)))
                                               (|Union|
                                                (|:| |const|
                                                     (|Record|
                                                      (|:| |val| (|Symbol|))))
                                                (|:| |var|
                                                     (|Record|
                                                      (|:| |str| (|String|)))))
                                               #2#)))
                            (QREFELT $ 45)))
                     (GO #3#))))
                  (EXIT (|error| "outputVarOrLit"))))
                #3# (EXIT #1#)))) 

(SDEFUN |LATMOFJ;coerce;$Of;29| ((|n| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (#1=#:G318 NIL) (|inner| NIL) (#2=#:G319 NIL)
          (|innern| NIL) (|innerList| (|List| (|OutputForm|))) (#3=#:G316 NIL)
          (|outer| NIL) (#4=#:G317 NIL) (|outern| NIL)
          (|outerList| (|List| (|OutputForm|))))
         (SEQ (LETT |outerList| NIL) (LETT |r| (SPADCALL "(" (QREFELT $ 46)))
              (SEQ (LETT |outern| 1) (LETT #4# (LENGTH |n|)) (LETT |outer| NIL)
                   (LETT #3# |n|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |outer| (CAR #3#)) NIL)
                         (|greater_SI| |outern| #4#))
                     (GO G191)))
                   (SEQ (LETT |innerList| NIL)
                        (SEQ (LETT |innern| 1) (LETT #2# (LENGTH |outer|))
                             (LETT |inner| NIL) (LETT #1# |outer|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |inner| (CAR #1#)) NIL)
                                   (|greater_SI| |innern| #2#))
                               (GO G191)))
                             (SEQ
                              (LETT |r|
                                    (SPADCALL |r|
                                              (|LATMOFJ;outputVarOrLit| |inner|
                                               $)
                                              (QREFELT $ 47)))
                              (EXIT
                               (COND
                                ((SPADCALL |innern| (LENGTH |outer|)
                                           (QREFELT $ 32))
                                 (LETT |r|
                                       (SPADCALL |r|
                                                 (SPADCALL "\\/"
                                                           (QREFELT $ 46))
                                                 (QREFELT $ 47)))))))
                             (LETT #1#
                                   (PROG1 (CDR #1#)
                                     (LETT |innern| (|inc_SI| |innern|))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((SPADCALL |outern| (LENGTH |n|) (QREFELT $ 32))
                           (LETT |r|
                                 (SPADCALL |r|
                                           (SPADCALL ")/\\(" (QREFELT $ 46))
                                           (QREFELT $ 47)))))))
                   (LETT #3#
                         (PROG1 (CDR #3#) (LETT |outern| (|inc_SI| |outern|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |r| (SPADCALL ")" (QREFELT $ 46)) (QREFELT $ 47)))))) 

(DECLAIM (NOTINLINE |LatticeMeetOfJoins;|)) 

(DEFUN |LatticeMeetOfJoins| ()
  (SPROG NIL
         (PROG (#1=#:G321)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LatticeMeetOfJoins|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LatticeMeetOfJoins|
                             (LIST
                              (CONS NIL (CONS 1 (|LatticeMeetOfJoins;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|LatticeMeetOfJoins|)))))))))) 

(DEFUN |LatticeMeetOfJoins;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LatticeMeetOfJoins|))
          (LETT $ (GETREFV 51))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LatticeMeetOfJoins| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|List|
                     (|List|
                      (|Union| (|:| |const| (|Record| (|:| |val| (|Symbol|))))
                               (|:| |var|
                                    (|Record| (|:| |str| (|String|))))))))
          $))) 

(MAKEPROP '|LatticeMeetOfJoins| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| |LATMOFJ;logicT;$;2|
              |LATMOFJ;logicF;$;3| (|String|) |LATMOFJ;variable;S$;4|
              (|Record| (|:| |val| 35)) (|Record| (|:| |str| 9))
              (|Union| (|:| |const| 11) (|:| |var| 12))
              |LATMOFJ;latticeMeetOfJoins;U$;5| |LATMOFJ;emptyLattice;$;6|
              (|Boolean|) |LATMOFJ;empty?;$B;7| (|List| 22) (0 . |concat|)
              |LATMOFJ;redux;2$;16| |LATMOFJ;/\\;3$;8| (|List| 13)
              (6 . |concat|) (12 . |concat|) |LATMOFJ;\\/;3$;9| (|List| $)
              |LATMOFJ;meet;L$;10| |LATMOFJ;join;L$;11| (18 . =)
              (24 . |concat|) (|NonNegativeInteger|) (30 . ~=)
              |LATMOFJ;factor;$L;17| |LATMOFJ;deductions;2L;19| (|Symbol|)
              |LATMOFJ;opType;$S;20| |LATMOFJ;atom?;$B;21|
              |LATMOFJ;value;$S;22| |LATMOFJ;getChildren;$L;23|
              |LATMOFJ;=;2$B;24| |LATMOFJ;toStringUnwrapped;$S;27|
              |LATMOFJ;toString;$S;25| (|OutputForm|) (36 . |coerce|)
              (41 . |coerce|) (46 . |message|) (51 . |hconcat|)
              |LATMOFJ;coerce;$Of;29| (|HashState|) (|SingleInteger|))
           '#(~= 57 |variable| 63 |value| 68 |toStringUnwrapped| 73 |toString|
              78 |redux| 83 |opType| 88 |meet| 93 |logicT| 98 |logicF| 102
              |latticeMeetOfJoins| 106 |latex| 111 |join| 116 |hashUpdate!| 121
              |hash| 127 |getChildren| 132 |factor| 137 |emptyLattice| 142
              |empty?| 146 |deductions| 151 |coerce| 156 |atom?| 161 |_\|_| 166
              |\\/| 170 T$ 176 = 180 |/\\| 186)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL NIL NIL NIL NIL |SetCategory&|
                     |BasicType&| NIL)
                  (CONS
                   '#((|BoundedDistributiveLattice|) (|BoundedLattice|)
                      (|DistributiveLattice|) (|BoundedMeetSemilattice|)
                      (|Lattice|) (|BoundedJoinSemilattice|)
                      (|MeetSemilattice|) (|JoinSemilattice|) (|SetCategory|)
                      (|BasicType|) (|CoercibleTo| 43))
                   (|makeByteWordVec2| 50
                                       '(2 18 0 0 0 19 2 22 0 0 0 23 2 18 0 0
                                         22 24 2 13 16 0 0 29 2 22 0 0 13 30 2
                                         31 16 0 0 32 1 9 43 0 44 1 35 43 0 45
                                         1 43 0 9 46 2 43 0 0 0 47 2 0 16 0 0 1
                                         1 0 0 9 10 1 0 35 0 38 1 0 9 0 41 1 0
                                         9 0 42 1 0 0 0 20 1 0 35 0 36 1 0 0 26
                                         27 0 0 0 7 0 0 0 8 1 0 0 13 14 1 0 9 0
                                         1 1 0 0 26 28 2 0 49 49 0 1 1 0 50 0 1
                                         1 0 26 0 39 1 0 26 0 33 0 0 0 15 1 0
                                         16 0 17 1 0 26 26 34 1 0 43 0 48 1 0
                                         16 0 37 0 0 0 1 2 0 0 0 0 25 0 0 0 1 2
                                         0 16 0 0 40 2 0 0 0 0 21)))))
           '|lookupComplete|)) 

(MAKEPROP '|LatticeMeetOfJoins| 'NILADIC T) 
