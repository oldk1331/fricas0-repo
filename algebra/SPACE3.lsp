
(SDEFUN |SPACE3;convertSpace| ((|space| $) ($ $))
        (SPROG
         ((|lllipt| (|List| (|List| (|List| (|NonNegativeInteger|)))))
          (|llprop| (|List| (|List| (|SubSpaceComponentProperty|))))
          (|tmpllipt| (|List| (|List| (|NonNegativeInteger|))))
          (|tmplipt| (|List| (|NonNegativeInteger|))) (#1=#:G148 NIL)
          (|point| NIL) (|tmplprop| (|List| (|SubSpaceComponentProperty|)))
          (#2=#:G147 NIL) (|curve| NIL)
          (|lprop| (|List| (|SubSpaceComponentProperty|))) (#3=#:G146 NIL)
          (|component| NIL))
         (SEQ
          (COND ((QVELT |space| 4) |space|)
                ('T
                 (SEQ (QSETVELT |space| 4 'T)
                      (LETT |lllipt| NIL . #4=(|SPACE3;convertSpace|))
                      (LETT |llprop| NIL . #4#) (LETT |lprop| NIL . #4#)
                      (SEQ (LETT |component| NIL . #4#)
                           (LETT #3#
                                 (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                                 . #4#)
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN
                                  (LETT |component| (CAR #3#) . #4#)
                                  NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lprop|
                                  (CONS (SPADCALL |component| (QREFELT $ 12))
                                        |lprop|)
                                  . #4#)
                            (LETT |tmpllipt| NIL . #4#)
                            (LETT |tmplprop| NIL . #4#)
                            (SEQ (LETT |curve| NIL . #4#)
                                 (LETT #2#
                                       (SPADCALL |component| (QREFELT $ 10))
                                       . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |curve| (CAR #2#) . #4#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |tmplprop|
                                        (CONS (SPADCALL |curve| (QREFELT $ 12))
                                              |tmplprop|)
                                        . #4#)
                                  (LETT |tmplipt| NIL . #4#)
                                  (SEQ (LETT |point| NIL . #4#)
                                       (LETT #1#
                                             (SPADCALL |curve| (QREFELT $ 10))
                                             . #4#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |point| (CAR #1#) . #4#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT |tmplipt|
                                               (CONS
                                                (SPADCALL |point|
                                                          (QREFELT $ 14))
                                                |tmplipt|)
                                               . #4#)))
                                       (LETT #1# (CDR #1#) . #4#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT
                                   (LETT |tmpllipt|
                                         (CONS (NREVERSE |tmplipt|) |tmpllipt|)
                                         . #4#)))
                                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |llprop|
                                  (CONS (NREVERSE |tmplprop|) |llprop|) . #4#)
                            (EXIT
                             (LETT |lllipt|
                                   (CONS (NREVERSE |tmpllipt|) |lllipt|)
                                   . #4#)))
                           (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (QSETVELT |space| 2
                                (VECTOR
                                 (SPADCALL (QVELT |space| 0) (QREFELT $ 16))
                                 (NREVERSE |lllipt|) (NREVERSE |llprop|)
                                 (NREVERSE |lprop|)))
                      (EXIT |space|))))))) 

(SDEFUN |SPACE3;polygon;$L$;2|
        ((|space| $) (|points| |List| (|Point| R)) ($ $))
        (SPROG ((#1=#:G153 NIL) (|p| NIL) (|pt| (|SubSpace| 3 R)))
               (SEQ
                (COND
                 ((< (LENGTH |points|) 3)
                  (|error| "You need at least 3 points to define a polygon"))
                 ('T
                  (SEQ
                   (LETT |pt|
                         (SPADCALL (QVELT |space| 0) (|SPADfirst| |points|)
                                   (QREFELT $ 18))
                         . #2=(|SPACE3;polygon;$L$;2|))
                   (LETT |points| (CDR |points|) . #2#)
                   (SPADCALL (QVELT |space| 0) |pt| (|SPADfirst| |points|) 1
                             (QREFELT $ 19))
                   (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |points|) . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL (QVELT |space| 0) |pt| |p| 2
                                    (QREFELT $ 19))))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (QSETVELT |space| 4 'NIL) (EXIT |space|))))))) 

(SDEFUN |SPACE3;create3Space;$;3| (($ $))
        (VECTOR (SPADCALL (QREFELT $ 21)) NIL (VECTOR NIL NIL NIL NIL)
                (VECTOR 0 0 0 0) 'NIL)) 

(SDEFUN |SPACE3;create3Space;Ss$;4| ((|s| |SubSpace| 3 R) ($ $))
        (VECTOR |s| NIL (VECTOR NIL NIL NIL NIL) (VECTOR 0 0 0 0) 'NIL)) 

(SDEFUN |SPACE3;numberOfComponents;$Nni;5|
        ((|space| $) ($ |NonNegativeInteger|))
        (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))) 

(SDEFUN |SPACE3;numberOfComposites;$Nni;6|
        ((|space| $) ($ |NonNegativeInteger|)) (LENGTH (QVELT |space| 1))) 

(SDEFUN |SPACE3;merge;L$;7| ((|listOfThreeSpaces| |List| $) ($ $))
        (SPROG
         ((#1=#:G168 NIL) (|ts| NIL) (|newspace| ($)) (#2=#:G167 NIL)
          (#3=#:G166 NIL))
         (SEQ
          (LETT |newspace|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #3# NIL . #4=(|SPACE3;merge;L$;7|))
                   (SEQ (LETT |ts| NIL . #4#)
                        (LETT #2# |listOfThreeSpaces| . #4#) G190
                        (COND
                         ((OR (ATOM #2#)
                              (PROGN (LETT |ts| (CAR #2#) . #4#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #3# (CONS (QVELT |ts| 0) #3#) . #4#)))
                        (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                        (EXIT (NREVERSE #3#))))
                  (QREFELT $ 27))
                 (QREFELT $ 24))
                . #4#)
          (SEQ (LETT |ts| NIL . #4#) (LETT #1# |listOfThreeSpaces| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ts| (CAR #1#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETVELT |newspace| 1
                           (APPEND (QVELT |ts| 1) (QVELT |newspace| 1)))))
               (LETT #1# (CDR #1#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |newspace|)))) 

(SDEFUN |SPACE3;merge;3$;8| ((|s1| $) (|s2| $) ($ $))
        (SPADCALL (LIST |s1| |s2|) (QREFELT $ 28))) 

(SDEFUN |SPACE3;composite;L$;9| ((|listOfThreeSpaces| |List| $) ($ $))
        (SPROG ((#1=#:G174 NIL) (|s| NIL) (#2=#:G173 NIL) (|space| ($)))
               (SEQ
                (LETT |space| (SPADCALL (QREFELT $ 23))
                      . #3=(|SPACE3;composite;L$;9|))
                (QSETVELT |space| 0
                          (SPADCALL
                           (PROGN
                            (LETT #2# NIL . #3#)
                            (SEQ (LETT |s| NIL . #3#)
                                 (LETT #1# |listOfThreeSpaces| . #3#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2# (CONS (QVELT |s| 0) #2#) . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 27)))
                (QSETVELT |space| 1
                          (LIST (SPADCALL (QVELT |space| 0) (QREFELT $ 30))))
                (EXIT |space|)))) 

(SDEFUN |SPACE3;components;$L;10| ((|space| $) ($ |List| $))
        (SPROG ((#1=#:G178 NIL) (|s| NIL) (#2=#:G177 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SPACE3;components;$L;10|))
                 (SEQ (LETT |s| NIL . #3#)
                      (LETT #1# (SPADCALL (QVELT |space| 0) (QREFELT $ 32))
                            . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 24)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SPACE3;composites;$L;11| ((|space| $) ($ |List| $))
        (SPROG ((#1=#:G182 NIL) (|s| NIL) (#2=#:G181 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SPACE3;composites;$L;11|))
                 (SEQ (LETT |s| NIL . #3#) (LETT #1# (QVELT |space| 1) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 24)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SPACE3;copy;2$;12| ((|space| $) ($ $))
        (SPROG ((#1=#:G187 NIL) (|s| NIL) (#2=#:G186 NIL) (|spc| ($)))
               (SEQ
                (LETT |spc|
                      (SPADCALL (SPADCALL (QVELT |space| 0) (QREFELT $ 30))
                                (QREFELT $ 24))
                      . #3=(|SPACE3;copy;2$;12|))
                (QSETVELT |spc| 1
                          (PROGN
                           (LETT #2# NIL . #3#)
                           (SEQ (LETT |s| NIL . #3#)
                                (LETT #1# (QVELT |space| 1) . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |s| (QREFELT $ 30))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#)))))
                (EXIT |spc|)))) 

(SDEFUN |SPACE3;enterPointData;$LNni;13|
        ((|space| $) (|listOfPoints| |List| (|Point| R))
         ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G191 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL . #2=(|SPACE3;enterPointData;$LNni;13|))
                     (LETT #1# |listOfPoints| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT (SPADCALL (QVELT |space| 0) |p| (QREFELT $ 36))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 16))))))) 

(SDEFUN |SPACE3;modifyPointData;$NniP$;14|
        ((|space| $) (|i| |NonNegativeInteger|) (|p| |Point| R) ($ $))
        (SEQ (SPADCALL (QVELT |space| 0) |i| |p| (QREFELT $ 38))
             (EXIT |space|))) 

(SDEFUN |SPACE3;point?;$B;15| ((|space| $) ($ |Boolean|))
        (SPROG ((|kid| #1=(|List| (|SubSpace| 3 R))) (|c| #1#))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         . #2=(|SPACE3;point?;$B;15|)))
                  1 (QREFELT $ 41))
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10))
                         . #2#))
                  1)
                 (EQL (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10)))
                      1))
                ('T 'NIL)))) 

(SDEFUN |SPACE3;point;$P;16| ((|space| $) ($ |Point| R))
        (COND
         ((SPADCALL |space| (QREFELT $ 42))
          (SPADCALL (SPADCALL (QVELT |space| 0) (LIST 1 1 1) (QREFELT $ 44))
                    (QREFELT $ 45)))
         ('T
          (|error|
           "This ThreeSpace holds something other than a single point - try the objects() command")))) 

(SDEFUN |SPACE3;point;P$;17| ((|aPoint| |Point| R) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |aPoint| (QREFELT $ 47))) 

(SDEFUN |SPACE3;point;$P$;18| ((|space| $) (|aPoint| |Point| R) ($ $))
        (SEQ (SPADCALL (QVELT |space| 0) NIL |aPoint| (QREFELT $ 49))
             (QSETVELT |space| 4 'NIL) (EXIT |space|))) 

(SDEFUN |SPACE3;point;$L$;19| ((|space| $) (|l| |List| R) ($ $))
        (SPROG ((|pt| (|Point| R)))
               (SEQ
                (LETT |pt| (SPADCALL |l| (QREFELT $ 51)) |SPACE3;point;$L$;19|)
                (EXIT (SPADCALL |space| |pt| (QREFELT $ 47)))))) 

(SDEFUN |SPACE3;point;$Nni$;20| ((|space| $) (|i| |NonNegativeInteger|) ($ $))
        (SEQ (SPADCALL (QVELT |space| 0) NIL |i| (QREFELT $ 53))
             (QSETVELT |space| 4 'NIL) (EXIT |space|))) 

(SDEFUN |SPACE3;curve?;$B;21| ((|space| $) ($ |Boolean|))
        (SPROG ((|c| (|List| (|SubSpace| 3 R))))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         |SPACE3;curve?;$B;21|))
                  1 (QREFELT $ 41))
                 (|error| "This ThreeSpace has more than one component"))
                ('T
                 (EQL (LENGTH (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10)))
                      1))))) 

(SDEFUN |SPACE3;curve;$L;22| ((|space| $) ($ |List| (|Point| R)))
        (SPROG
         ((#1=#:G215 NIL) (|s| NIL) (#2=#:G214 NIL) (|spc| (|SubSpace| 3 R)))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 55))
            (SEQ
             (LETT |spc|
                   (|SPADfirst|
                    (SPADCALL
                     (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                     (QREFELT $ 10)))
                   . #3=(|SPACE3;curve;$L;22|))
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |s| NIL . #3#)
                    (LETT #1# (SPADCALL |spc| (QREFELT $ 10)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 45)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a curve - try the objects() command")))))) 

(SDEFUN |SPACE3;curve;L$;23| ((|points| |List| (|Point| R)) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| (QREFELT $ 57))) 

(SDEFUN |SPACE3;curve;$L$;24| ((|space| $) (|points| |List| (|Point| R)) ($ $))
        (SPROG
         ((#1=#:G220 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|))))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| |points|)
                    (QREFELT $ 49))
          (LETT |path|
                (LIST (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 10))) 1)
                . #2=(|SPACE3;curve;$L$;24|))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |points|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 49))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 'NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;curve;$L$;25| ((|space| $) (|points| |List| (|List| R)) ($ $))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ
                (LETT |pts| (SPADCALL (ELT $ 51) |points| (QREFELT $ 62))
                      |SPACE3;curve;$L$;25|)
                (EXIT (SPADCALL |space| |pts| (QREFELT $ 57)))))) 

(SDEFUN |SPACE3;closedCurve?;$B;26| ((|space| $) ($ |Boolean|))
        (SPROG ((|kid| #1=(|List| (|SubSpace| 3 R))) (|c| #1#))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         . #2=(|SPACE3;closedCurve?;$B;26|)))
                  1 (QREFELT $ 41))
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10))
                         . #2#))
                  1)
                 (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 64)))
                ('T 'NIL)))) 

(SDEFUN |SPACE3;closedCurve;$L;27| ((|space| $) ($ |List| (|Point| R)))
        (SPROG
         ((#1=#:G234 NIL) (|s| NIL) (#2=#:G233 NIL) (|spc| (|SubSpace| 3 R)))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 65))
            (SEQ
             (LETT |spc|
                   (|SPADfirst|
                    (SPADCALL
                     (|SPADfirst| (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                     (QREFELT $ 10)))
                   . #3=(|SPACE3;closedCurve;$L;27|))
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |s| NIL . #3#)
                    (LETT #1# (SPADCALL |spc| (QREFELT $ 10)) . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 45)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a curve - try the objects() command")))))) 

(SDEFUN |SPACE3;closedCurve;L$;28| ((|points| |List| (|Point| R)) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| (QREFELT $ 67))) 

(SDEFUN |SPACE3;closedCurve;$L$;29|
        ((|space| $) (|points| |List| (|Point| R)) ($ $))
        (SPROG
         ((#1=#:G239 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|))))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| |points|)
                    (QREFELT $ 49))
          (LETT |path|
                (LIST (LENGTH (SPADCALL (QVELT |space| 0) (QREFELT $ 10))) 1)
                . #2=(|SPACE3;closedCurve;$L$;29|))
          (SPADCALL (QVELT |space| 0) |path| 'T (QREFELT $ 69))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# (CDR |points|) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 49))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 'NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;closedCurve;$L$;30|
        ((|space| $) (|points| |List| (|List| R)) ($ $))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ
                (LETT |pts| (SPADCALL (ELT $ 51) |points| (QREFELT $ 62))
                      |SPACE3;closedCurve;$L$;30|)
                (EXIT (SPADCALL |space| |pts| (QREFELT $ 67)))))) 

(SDEFUN |SPACE3;polygon?;$B;31| ((|space| $) ($ |Boolean|))
        (SPROG ((|kid| #1=(|List| (|SubSpace| 3 R))) (|c| #1#))
               (COND
                ((SPADCALL
                  (LENGTH
                   (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                         . #2=(|SPACE3;polygon?;$B;31|)))
                  1 (QREFELT $ 41))
                 (|error| "This ThreeSpace has more than one component"))
                ((EQL
                  (LENGTH
                   (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10))
                         . #2#))
                  2)
                 (COND
                  ((EQL (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10)))
                        1)
                   (SPADCALL
                    (LENGTH
                     (SPADCALL (SPADCALL |kid| (QREFELT $ 72)) (QREFELT $ 10)))
                    2 (QREFELT $ 41)))
                  (#3='T 'NIL)))
                (#3# 'NIL)))) 

(SDEFUN |SPACE3;polygon;$L;32| ((|space| $) ($ |List| (|Point| R)))
        (SPROG
         ((#1=#:G254 NIL) (|s| NIL) (#2=#:G253 NIL)
          (|listOfPoints| (|List| (|Point| R)))
          (|cs| (|List| (|SubSpace| 3 R))))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 73))
            (SEQ
             (LETT |listOfPoints|
                   (LIST
                    (SPADCALL
                     (|SPADfirst|
                      (SPADCALL
                       (|SPADfirst|
                        (LETT |cs|
                              (SPADCALL
                               (|SPADfirst|
                                (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                               (QREFELT $ 10))
                              . #3=(|SPACE3;polygon;$L;32|)))
                       (QREFELT $ 10)))
                     (QREFELT $ 45)))
                   . #3#)
             (EXIT
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |s| NIL . #3#)
                    (LETT #1#
                          (SPADCALL (SPADCALL |cs| (QREFELT $ 72))
                                    (QREFELT $ 10))
                          . #3#)
                    G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2# (CONS (SPADCALL |s| (QREFELT $ 45)) #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#)))))))
           ('T
            (|error|
             "This ThreeSpace holds something other than a polygon - try the objects() command")))))) 

(SDEFUN |SPACE3;polygon;L$;33| ((|points| |List| (|Point| R)) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| (QREFELT $ 20))) 

(SDEFUN |SPACE3;polygon;$L$;34|
        ((|space| $) (|points| |List| (|List| R)) ($ $))
        (SPROG ((|pts| (|List| (|Point| R))))
               (SEQ
                (LETT |pts| (SPADCALL (ELT $ 51) |points| (QREFELT $ 62))
                      |SPACE3;polygon;$L$;34|)
                (EXIT (SPADCALL |space| |pts| (QREFELT $ 20)))))) 

(SDEFUN |SPACE3;mesh?;$B;35| ((|space| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G266 NIL) (|eachCurve| NIL)
          (|whatSizes| (|Set| (|NonNegativeInteger|)))
          (|kid| #2=(|List| (|SubSpace| 3 R))) (|c| #2#))
         (SEQ
          (COND
           ((SPADCALL
             (LENGTH
              (LETT |c| (SPADCALL (QVELT |space| 0) (QREFELT $ 10))
                    . #3=(|SPACE3;mesh?;$B;35|)))
             1 (QREFELT $ 41))
            (|error| "This ThreeSpace has more than one component"))
           ((SPADCALL
             (LENGTH
              (LETT |kid| (SPADCALL (|SPADfirst| |c|) (QREFELT $ 10)) . #3#))
             1 (QREFELT $ 41))
            (SEQ (LETT |whatSizes| (SPADCALL (QREFELT $ 78)) . #3#)
                 (SEQ (LETT |eachCurve| NIL . #3#) (LETT #1# |kid| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |eachCurve| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL
                         (LENGTH (SPADCALL |eachCurve| (QREFELT $ 10)))
                         |whatSizes| (QREFELT $ 79))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |whatSizes| (QREFELT $ 80)) 1
                              (QREFELT $ 41))
                    (|error| "Mesh defined with curves of different sizes"))
                   ((< (|SPADfirst| (SPADCALL |whatSizes| (QREFELT $ 81))) 2)
                    (|error|
                     "Mesh defined with single point curves (use curve())"))
                   (#4='T 'T)))))
           (#4# 'NIL))))) 

(SDEFUN |SPACE3;mesh;$L;36| ((|space| $) ($ |List| (|List| (|Point| R))))
        (SPROG
         ((|llp| (|List| (|List| (|Point| R)))) (#1=#:G274 NIL) (|s| NIL)
          (#2=#:G273 NIL) (#3=#:G272 NIL) (|lpSpace| NIL))
         (SEQ
          (COND
           ((SPADCALL |space| (QREFELT $ 82))
            (SEQ (LETT |llp| NIL . #4=(|SPACE3;mesh;$L;36|))
                 (SEQ (LETT |lpSpace| NIL . #4#)
                      (LETT #3#
                            (SPADCALL
                             (|SPADfirst|
                              (SPADCALL (QVELT |space| 0) (QREFELT $ 10)))
                             (QREFELT $ 10))
                            . #4#)
                      G190
                      (COND
                       ((OR (ATOM #3#)
                            (PROGN (LETT |lpSpace| (CAR #3#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |llp|
                              (CONS
                               (PROGN
                                (LETT #2# NIL . #4#)
                                (SEQ (LETT |s| NIL . #4#)
                                     (LETT #1#
                                           (SPADCALL |lpSpace| (QREFELT $ 10))
                                           . #4#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |s| (CAR #1#) . #4#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |s| (QREFELT $ 45))
                                              #2#)
                                             . #4#)))
                                     (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               |llp|)
                              . #4#)))
                      (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
                 (EXIT |llp|)))
           ('T
            (|error|
             "This ThreeSpace holds something other than a mesh - try the objects() command")))))) 

(SDEFUN |SPACE3;mesh;L$;37| ((|points| |List| (|List| (|Point| R))) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| 'NIL 'NIL (QREFELT $ 85))) 

(SDEFUN |SPACE3;mesh;L2B$;38|
        ((|points| |List| (|List| (|Point| R))) (|prop1| . #1=(|Boolean|))
         (|prop2| . #1#) ($ $))
        (SPADCALL (SPADCALL (QREFELT $ 23)) |points| |prop1| |prop2|
                  (QREFELT $ 85))) 

(SDEFUN |SPACE3;mesh;$LLSscp$;39|
        ((|space| $) (|llpoints| |List| (|List| (|List| R)))
         (|lprops| |List| #1=(|SubSpaceComponentProperty|)) (|prop| . #1#)
         ($ $))
        (SPROG
         ((|pts| (|List| (|List| (|Point| R)))) (#2=#:G283 NIL) (|points| NIL)
          (#3=#:G282 NIL))
         (SEQ
          (LETT |pts|
                (PROGN
                 (LETT #3# NIL . #4=(|SPACE3;mesh;$LLSscp$;39|))
                 (SEQ (LETT |points| NIL . #4#) (LETT #2# |llpoints| . #4#)
                      G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |points| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (ELT $ 51) |points| (QREFELT $ 62))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT (SPADCALL |space| |pts| |lprops| |prop| (QREFELT $ 89)))))) 

(SDEFUN |SPACE3;mesh;$LLSscp$;40|
        ((|space| $) (|llp| |List| (|List| (|Point| R)))
         (|lprops| |List| #1=(|SubSpaceComponentProperty|)) (|prop| . #1#)
         ($ $))
        (SPROG
         ((#2=#:G293 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|)))
          (#3=#:G291 NIL) (|lp| NIL) (#4=#:G292 NIL) (|aProp| NIL)
          (|count| NIL) (#5=#:G290 NIL))
         (SEQ
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| (|SPADfirst| |llp|))
                    (QREFELT $ 49))
          (SPADCALL (QVELT |space| 0)
                    (LETT |path|
                          (LIST
                           (LENGTH
                            (SPADCALL (QVELT |space| 0) (QREFELT $ 10))))
                          . #6=(|SPACE3;mesh;$LLSscp$;40|))
                    |prop| (QREFELT $ 92))
          (LETT |path| (APPEND |path| (LIST 1)) . #6#)
          (SPADCALL (QVELT |space| 0) |path| (|SPADfirst| |lprops|)
                    (QREFELT $ 92))
          (SEQ (LETT |p| NIL . #6#) (LETT #5# (CDR (|SPADfirst| |llp|)) . #6#)
               G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |p| (CAR #5#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 49))))
               (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |count| 2 . #6#) (LETT |aProp| NIL . #6#)
               (LETT #4# (CDR |lprops|) . #6#) (LETT |lp| NIL . #6#)
               (LETT #3# (CDR |llp|) . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |lp| (CAR #3#) . #6#) NIL)
                     (ATOM #4#) (PROGN (LETT |aProp| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (SPADCALL (QVELT |space| 0)
                          (LETT |path| (LIST (|SPADfirst| |path|)) . #6#)
                          (|SPADfirst| |lp|) (QREFELT $ 49))
                (LETT |path| (APPEND |path| (LIST |count|)) . #6#)
                (SPADCALL (QVELT |space| 0) |path| |aProp| (QREFELT $ 92))
                (EXIT
                 (SEQ (LETT |p| NIL . #6#) (LETT #2# (CDR |lp|) . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |space| 0) |path| |p|
                                  (QREFELT $ 49))))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))))
               (LETT #3#
                     (PROG1 (CDR #3#)
                       (LETT #4#
                             (PROG1 (CDR #4#)
                               (LETT |count| (|inc_SI| |count|) . #6#))
                             . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 'NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;mesh;$L2B$;41|
        ((|space| $) (|llpoints| |List| (|List| (|List| R)))
         (|prop1| . #1=(|Boolean|)) (|prop2| . #1#) ($ $))
        (SPROG
         ((|pts| (|List| (|List| (|Point| R)))) (#2=#:G300 NIL) (|points| NIL)
          (#3=#:G299 NIL))
         (SEQ
          (LETT |pts|
                (PROGN
                 (LETT #3# NIL . #4=(|SPACE3;mesh;$L2B$;41|))
                 (SEQ (LETT |points| NIL . #4#) (LETT #2# |llpoints| . #4#)
                      G190
                      (COND
                       ((OR (ATOM #2#)
                            (PROGN (LETT |points| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (ELT $ 51) |points| (QREFELT $ 62))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT (SPADCALL |space| |pts| |prop1| |prop2| (QREFELT $ 85)))))) 

(SDEFUN |SPACE3;mesh;$L2B$;42|
        ((|space| $) (|llp| |List| (|List| (|Point| R)))
         (|prop1| . #1=(|Boolean|)) (|prop2| . #1#) ($ $))
        (SPROG
         ((#2=#:G309 NIL) (|p| NIL) (|path| (|List| (|NonNegativeInteger|)))
          (#3=#:G308 NIL) (|lp| NIL) (|count| NIL) (#4=#:G307 NIL)
          (|propB| #5=(|SubSpaceComponentProperty|)) (|propA| #5#))
         (SEQ
          (LETT |propA| (SPADCALL (QREFELT $ 94))
                . #6=(|SPACE3;mesh;$L2B$;42|))
          (SPADCALL |propA| |prop1| (QREFELT $ 95))
          (LETT |propB| (SPADCALL (QREFELT $ 94)) . #6#)
          (SPADCALL |propB| |prop2| (QREFELT $ 95))
          (SPADCALL (QVELT |space| 0) NIL (|SPADfirst| (|SPADfirst| |llp|))
                    (QREFELT $ 49))
          (SPADCALL (QVELT |space| 0)
                    (LETT |path|
                          (LIST
                           (LENGTH
                            (SPADCALL (QVELT |space| 0) (QREFELT $ 10))))
                          . #6#)
                    |propB| (QREFELT $ 92))
          (LETT |path| (APPEND |path| (LIST 1)) . #6#)
          (SPADCALL (QVELT |space| 0) |path| |propA| (QREFELT $ 92))
          (SEQ (LETT |p| NIL . #6#) (LETT #4# (CDR (|SPADfirst| |llp|)) . #6#)
               G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (SPADCALL (QVELT |space| 0) |path| |p| (QREFELT $ 49))))
               (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |count| 2 . #6#) (LETT |lp| NIL . #6#)
               (LETT #3# (CDR |llp|) . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |lp| (CAR #3#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (SPADCALL (QVELT |space| 0)
                          (LETT |path| (LIST (|SPADfirst| |path|)) . #6#)
                          (|SPADfirst| |lp|) (QREFELT $ 49))
                (LETT |path| (APPEND |path| (LIST |count|)) . #6#)
                (SPADCALL (QVELT |space| 0) |path| |propA| (QREFELT $ 92))
                (EXIT
                 (SEQ (LETT |p| NIL . #6#) (LETT #2# (CDR |lp|) . #6#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL (QVELT |space| 0) |path| |p|
                                  (QREFELT $ 49))))
                      (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))))
               (LETT #3#
                     (PROG1 (CDR #3#) (LETT |count| (|inc_SI| |count|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (QSETVELT |space| 4 'NIL) (EXIT |space|)))) 

(SDEFUN |SPACE3;lp;$L;43| ((|space| $) ($ |List| (|Point| R)))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $) |SPACE3;lp;$L;43|)))
         (EXIT (QVELT (QVELT |space| 2) 0)))) 

(SDEFUN |SPACE3;lllip;$L;44|
        ((|space| $) ($ |List| (|List| (|List| (|NonNegativeInteger|)))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $)
                 |SPACE3;lllip;$L;44|)))
         (EXIT (QVELT (QVELT |space| 2) 1)))) 

(SDEFUN |SPACE3;llprop;$L;45|
        ((|space| $) ($ |List| (|List| (|SubSpaceComponentProperty|))))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $)
                 |SPACE3;llprop;$L;45|)))
         (EXIT (QVELT (QVELT |space| 2) 2)))) 

(SDEFUN |SPACE3;lprop;$L;46|
        ((|space| $) ($ |List| (|SubSpaceComponentProperty|)))
        (SEQ
         (COND
          ((NULL (QVELT |space| 4))
           (LETT |space| (|SPACE3;convertSpace| |space| $)
                 |SPACE3;lprop;$L;46|)))
         (EXIT (QVELT (QVELT |space| 2) 3)))) 

(SDEFUN |SPACE3;objects;$R;47|
        ((|space| $)
         ($ |Record| (|:| |points| . #1=((|NonNegativeInteger|)))
          (|:| |curves| . #1#) (|:| |polygons| . #1#)
          (|:| |constructs| . #1#)))
        (SPROG
         ((|numConstructs| #2=(|NonNegativeInteger|)) (|numPolys| #2#)
          (|numCurves| #2#) (|numPts| #2#) (|kid| (|List| (|SubSpace| 3 R)))
          (#3=#:G339 NIL) (|component| NIL))
         (SEQ
          (COND
           ((NULL (QVELT |space| 4))
            (LETT |space| (|SPACE3;convertSpace| |space| $)
                  . #4=(|SPACE3;objects;$R;47|))))
          (LETT |numPts| 0 . #4#) (LETT |numCurves| 0 . #4#)
          (LETT |numPolys| 0 . #4#) (LETT |numConstructs| 0 . #4#)
          (SEQ (LETT |component| NIL . #4#)
               (LETT #3# (SPADCALL (QVELT |space| 0) (QREFELT $ 10)) . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |component| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQL
                    (LENGTH
                     (LETT |kid| (SPADCALL |component| (QREFELT $ 10)) . #4#))
                    1)
                   (COND
                    ((EQL
                      (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10))) 1)
                     (LETT |numPts| (+ |numPts| 1) . #4#))
                    ('T (LETT |numCurves| (+ |numCurves| 1) . #4#))))
                  ('T
                   (SEQ
                    (COND
                     ((EQL (LENGTH |kid|) 2)
                      (COND
                       ((EQL
                         (LENGTH (SPADCALL (|SPADfirst| |kid|) (QREFELT $ 10)))
                         1)
                        (COND
                         ((SPADCALL
                           (LENGTH
                            (SPADCALL (|SPADfirst| (CDR |kid|))
                                      (QREFELT $ 10)))
                           1 (QREFELT $ 103))
                          (EXIT (LETT |numPolys| (+ |numPolys| 1) . #4#))))))))
                    (EXIT
                     (LETT |numConstructs| (+ |numConstructs| 1) . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |numPts| |numCurves| |numPolys| |numConstructs|))))) 

(SDEFUN |SPACE3;check;2$;48| ((|s| $) ($ $))
        (COND ((NULL (QVELT |s| 4)) (|SPACE3;convertSpace| |s| $)) ('T |s|))) 

(PUT '|SPACE3;subspace;$Ss;49| '|SPADreplace| '(XLAM (|s|) (QVELT |s| 0))) 

(SDEFUN |SPACE3;subspace;$Ss;49| ((|s| $) ($ |SubSpace| 3 R)) (QVELT |s| 0)) 

(SDEFUN |SPACE3;coerce;$Of;50| ((|s| $) ($ |OutputForm|))
        (SPROG ((|sizo| (|NonNegativeInteger|)))
               (SEQ
                (COND
                 ((NULL (QVELT |s| 4))
                  (LETT |s| (|SPACE3;convertSpace| |s| $)
                        . #1=(|SPACE3;coerce;$Of;50|))))
                (EXIT
                 (SPADCALL
                  (LIST "3-Space with "
                        (SPADCALL
                         (LETT |sizo| (LENGTH (QVELT (QVELT |s| 2) 1)) . #1#)
                         (QREFELT $ 109))
                        (COND ((EQL |sizo| 1) " component")
                              ('T " components")))
                  (QREFELT $ 110)))))) 

(DECLAIM (NOTINLINE |ThreeSpace;|)) 

(DEFUN |ThreeSpace| (#1=#:G348)
  (SPROG NIL
         (PROG (#2=#:G349)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ThreeSpace|)
                                               '|domainEqualList|)
                    . #3=(|ThreeSpace|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|ThreeSpace;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ThreeSpace|)))))))))) 

(DEFUN |ThreeSpace;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ThreeSpace|))
          (LETT |dv$| (LIST '|ThreeSpace| DV$1) . #1#)
          (LETT $ (GETREFV 116) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ThreeSpace| (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |subspaceField| (|SubSpace| 3 |#1|))
                              (|:| |compositesField|
                                   (|List| (|SubSpace| 3 |#1|)))
                              (|:| |rep3DField|
                                   (|Record| (|:| |lp| (|List| (|Point| |#1|)))
                                             (|:| |llliPt|
                                                  (|List|
                                                   (|List|
                                                    (|List|
                                                     (|NonNegativeInteger|)))))
                                             (|:| |llProp|
                                                  (|List|
                                                   (|List|
                                                    (|SubSpaceComponentProperty|))))
                                             (|:| |lProp|
                                                  (|List|
                                                   (|SubSpaceComponentProperty|)))))
                              (|:| |objectsField|
                                   (|Record|
                                    (|:| |points| (|NonNegativeInteger|))
                                    (|:| |curves| (|NonNegativeInteger|))
                                    (|:| |polygons| (|NonNegativeInteger|))
                                    (|:| |constructs| (|NonNegativeInteger|))))
                              (|:| |converted| (|Boolean|))))
          $))) 

(MAKEPROP '|ThreeSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| $)
              (|SubSpace| '3 6) (0 . |children|) (|SubSpaceComponentProperty|)
              (5 . |extractProperty|) (|NonNegativeInteger|)
              (10 . |extractIndex|) (|List| 17) (15 . |pointData|) (|Point| 6)
              (20 . |addPoint2|) (26 . |addPointLast|) |SPACE3;polygon;$L$;2|
              (34 . |new|) (38 . |Zero|) |SPACE3;create3Space;$;3|
              |SPACE3;create3Space;Ss$;4| |SPACE3;numberOfComponents;$Nni;5|
              |SPACE3;numberOfComposites;$Nni;6| (42 . |merge|)
              |SPACE3;merge;L$;7| |SPACE3;merge;3$;8| (47 . |deepCopy|)
              |SPACE3;composite;L$;9| (52 . |separate|)
              |SPACE3;components;$L;10| |SPACE3;composites;$L;11|
              |SPACE3;copy;2$;12| (57 . |addPoint|)
              |SPACE3;enterPointData;$LNni;13| (63 . |modifyPoint|)
              |SPACE3;modifyPointData;$NniP$;14| (|Boolean|) (70 . >)
              |SPACE3;point?;$B;15| (|List| 13) (76 . |traverse|)
              (82 . |extractPoint|) |SPACE3;point;$P;16| |SPACE3;point;$P$;18|
              |SPACE3;point;P$;17| (87 . |addPoint|) (|List| 6) (94 . |point|)
              |SPACE3;point;$L$;19| (99 . |addPoint|) |SPACE3;point;$Nni$;20|
              |SPACE3;curve?;$B;21| |SPACE3;curve;$L;22| |SPACE3;curve;$L$;24|
              |SPACE3;curve;L$;23| (|Mapping| 17 50) (|List| 50)
              (|ListFunctions2| 50 17) (106 . |map|) |SPACE3;curve;$L$;25|
              (112 . |extractClosed|) |SPACE3;closedCurve?;$B;26|
              |SPACE3;closedCurve;$L;27| |SPACE3;closedCurve;$L$;29|
              |SPACE3;closedCurve;L$;28| (117 . |closeComponent|)
              |SPACE3;closedCurve;$L$;30| (|List| 9) (124 . |second|)
              |SPACE3;polygon?;$B;31| |SPACE3;polygon;$L;32|
              |SPACE3;polygon;L$;33| |SPACE3;polygon;$L$;34| (|Set| 13)
              (129 . |brace|) (133 . |insert!|) (139 . |#|) (144 . |parts|)
              |SPACE3;mesh?;$B;35| (|List| 15) |SPACE3;mesh;$L;36|
              |SPACE3;mesh;$L2B$;42| |SPACE3;mesh;L$;37| |SPACE3;mesh;L2B$;38|
              (|List| 11) |SPACE3;mesh;$LLSscp$;40| (|List| 60)
              |SPACE3;mesh;$LLSscp$;39| (149 . |defineProperty|)
              |SPACE3;mesh;$L2B$;41| (156 . |new|) (160 . |close|)
              |SPACE3;lp;$L;43| (|List| (|List| 43)) |SPACE3;lllip;$L;44|
              (|List| 88) |SPACE3;llprop;$L;45| |SPACE3;lprop;$L;46|
              (166 . |One|) (170 . ~=)
              (|Record| (|:| |points| 13) (|:| |curves| 13) (|:| |polygons| 13)
                        (|:| |constructs| 13))
              |SPACE3;objects;$R;47| |SPACE3;check;2$;48|
              |SPACE3;subspace;$Ss;49| (|OutputForm|) (176 . |coerce|)
              (181 . |hconcat|) |SPACE3;coerce;$Of;50| (|List| 83)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 186 |subspace| 192 |polygon?| 197 |polygon| 202 |point?| 224
              |point| 229 |objects| 257 |numberOfComposites| 262
              |numberOfComponents| 267 |modifyPointData| 272 |mesh?| 279 |mesh|
              284 |merge| 333 |lprop| 344 |lp| 349 |llprop| 354 |lllp| 359
              |lllip| 364 |latex| 369 |hashUpdate!| 374 |hash| 380
              |enterPointData| 385 |curve?| 391 |curve| 396 |create3Space| 418
              |copy| 427 |composites| 432 |composite| 437 |components| 442
              |coerce| 447 |closedCurve?| 452 |closedCurve| 457 |check| 479 =
              484)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|ThreeSpaceCategory| 6) (|SetCategory|)
                           (|BasicType|) (|CoercibleTo| 108))
                        (|makeByteWordVec2| 115
                                            '(1 9 8 0 10 1 9 11 0 12 1 9 13 0
                                              14 1 9 15 0 16 2 9 0 0 17 18 4 9
                                              0 0 0 17 13 19 0 9 0 21 0 6 0 22
                                              1 9 0 8 27 1 9 0 0 30 1 9 8 0 32
                                              2 9 13 0 17 36 3 9 0 0 13 17 38 2
                                              13 40 0 0 41 2 9 0 0 43 44 1 9 17
                                              0 45 3 9 0 0 43 17 49 1 17 0 50
                                              51 3 9 0 0 43 13 53 2 61 15 59 60
                                              62 1 9 40 0 64 3 9 0 0 43 40 69 1
                                              71 9 0 72 0 77 0 78 2 77 0 13 0
                                              79 1 77 13 0 80 1 77 43 0 81 3 9
                                              0 0 43 11 92 0 11 0 94 2 11 40 0
                                              40 95 0 6 0 102 2 13 40 0 0 103 1
                                              13 108 0 109 1 108 0 8 110 2 0 40
                                              0 0 1 1 0 9 0 107 1 0 40 0 73 1 0
                                              15 0 74 2 0 0 0 60 76 1 0 0 15 75
                                              2 0 0 0 15 20 1 0 40 0 42 1 0 0
                                              17 48 1 0 17 0 46 2 0 0 0 13 54 2
                                              0 0 0 17 47 2 0 0 0 50 52 1 0 104
                                              0 105 1 0 13 0 26 1 0 13 0 25 3 0
                                              0 0 13 17 39 1 0 40 0 82 3 0 0 83
                                              40 40 87 1 0 83 0 84 4 0 0 0 90
                                              40 40 93 1 0 0 83 86 4 0 0 0 83
                                              40 40 85 4 0 0 0 83 88 11 89 4 0
                                              0 0 90 88 11 91 2 0 0 0 0 29 1 0
                                              0 8 28 1 0 88 0 101 1 0 15 0 96 1
                                              0 99 0 100 1 0 112 0 1 1 0 97 0
                                              98 1 0 114 0 1 2 0 113 113 0 1 1
                                              0 115 0 1 2 0 13 0 15 37 1 0 40 0
                                              55 1 0 15 0 56 2 0 0 0 60 63 1 0
                                              0 15 58 2 0 0 0 15 57 1 0 0 9 24
                                              0 0 0 23 1 0 0 0 35 1 0 8 0 34 1
                                              0 0 8 31 1 0 8 0 33 1 0 108 0 111
                                              1 0 40 0 65 1 0 15 0 66 2 0 0 0
                                              60 70 1 0 0 15 68 2 0 0 0 15 67 1
                                              0 0 0 106 2 0 40 0 0 1)))))
           '|lookupComplete|)) 
