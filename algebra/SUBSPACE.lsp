
(SDEFUN |SUBSPACE;leaf?;$B;1| ((|space| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |space| (QREFELT $ 11)) (QREFELT $ 14))) 

(SDEFUN |SUBSPACE;root?;$B;2| ((|space| $) ($ |Boolean|))
        (EQL (QVELT |space| 5) 0)) 

(SDEFUN |SUBSPACE;internal?;$B;3| ((|space| $) ($ |Boolean|))
        (COND
         ((SPADCALL |space| (QREFELT $ 16))
          (COND ((SPADCALL |space| (QREFELT $ 15)) 'NIL) (#1='T 'T)))
         (#1# 'T))) 

(SDEFUN |SUBSPACE;new;$;4| (($ $))
        (VECTOR (SPADCALL NIL (QREFELT $ 20)) 0 (SPADCALL (QREFELT $ 22))
                (SPADCALL (QREFELT $ 23)) (SPADCALL (QREFELT $ 23)) 0 NIL NIL 0
                0 (SPADCALL (QREFELT $ 23)))) 

(SDEFUN |SUBSPACE;subspace;$;5| (($ $)) (SPADCALL (QREFELT $ 24))) 

(SDEFUN |SUBSPACE;birth;2$;6| ((|momma| $) ($ $))
        (SPROG ((|lastKid| (|List| $)) (|baby| ($)))
               (SEQ
                (LETT |baby| (SPADCALL (QREFELT $ 24))
                      . #1=(|SUBSPACE;birth;2$;6|))
                (QSETVELT |baby| 5 (+ (QVELT |momma| 5) 1))
                (QSETVELT |baby| 10 (LIST |momma|))
                (COND
                 ((NULL
                   (SPADCALL (LETT |lastKid| (QVELT |momma| 4) . #1#)
                             (QREFELT $ 14)))
                  (COND
                   ((NULL
                     (SPADCALL (SPADCALL |lastKid| (QREFELT $ 26))
                               (QREFELT $ 14)))
                    (EXIT
                     (|error| (SPADCALL (QREFELT $ 9) (QREFELT $ 29))))))))
                (COND
                 ((SPADCALL |lastKid| (QREFELT $ 14))
                  (SEQ (QSETVELT |momma| 3 (LIST |baby|))
                       (QSETVELT |momma| 4 (QVELT |momma| 3))
                       (EXIT (QSETVELT |momma| 9 1))))
                 ('T
                  (SEQ (SPADCALL |lastKid| (LIST |baby|) (QREFELT $ 30))
                       (QSETVELT |momma| 4 (SPADCALL |lastKid| (QREFELT $ 26)))
                       (EXIT (QSETVELT |momma| 9 (+ (QVELT |momma| 9) 1))))))
                (EXIT |baby|)))) 

(SDEFUN |SUBSPACE;child;$Nni$;7|
        ((|space| $) (|num| |NonNegativeInteger|) ($ $))
        (SPADCALL (QVELT |space| 3) |num| (QREFELT $ 33))) 

(PUT '|SUBSPACE;children;$L;8| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 3))) 

(SDEFUN |SUBSPACE;children;$L;8| ((|space| $) ($ |List| $)) (QVELT |space| 3)) 

(PUT '|SUBSPACE;numberOfChildren;$Nni;9| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 9))) 

(SDEFUN |SUBSPACE;numberOfChildren;$Nni;9|
        ((|space| $) ($ |NonNegativeInteger|)) (QVELT |space| 9)) 

(SDEFUN |SUBSPACE;shallowCopy;2$;10| ((|space| $) ($ $))
        (SPROG ((|node| ($)))
               (SEQ
                (LETT |node| (SPADCALL (QREFELT $ 24))
                      |SUBSPACE;shallowCopy;2$;10|)
                (QSETVELT |node| 0 (QVELT |space| 0))
                (QSETVELT |node| 1 (QVELT |space| 1))
                (QSETVELT |node| 2 (SPADCALL (QVELT |space| 2) (QREFELT $ 37)))
                (QSETVELT |node| 5 (QVELT |space| 5))
                (QSETVELT |node| 10 (SPADCALL (QREFELT $ 23)))
                (COND
                 ((SPADCALL |space| (QREFELT $ 16))
                  (SEQ
                   (QSETVELT |node| 6
                             (SPADCALL (QVELT |space| 6) (QREFELT $ 39)))
                   (QSETVELT |node| 7
                             (SPADCALL (QVELT |node| 6) (QREFELT $ 40)))
                   (EXIT (QSETVELT |node| 8 (QVELT |space| 8))))))
                (EXIT |node|)))) 

(SDEFUN |SUBSPACE;deepCopy;2$;11| ((|space| $) ($ $))
        (SPROG ((|cc| ($)) (#1=#:G166 NIL) (|c| NIL) (|node| ($)))
               (SEQ
                (LETT |node| (SPADCALL |space| (QREFELT $ 41))
                      . #2=(|SUBSPACE;deepCopy;2$;11|))
                (EXIT
                 (COND ((SPADCALL |space| (QREFELT $ 15)) |node|)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL . #2#)
                              (LETT #1# (SPADCALL |space| (QREFELT $ 11))
                                    . #2#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#) . #2#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |cc| (SPADCALL |c| (QREFELT $ 42)) . #2#)
                               (QSETVELT |cc| 10 (LIST |node|))
                               (EXIT
                                (QSETVELT |node| 3
                                          (SPADCALL |cc| (QVELT |node| 3)
                                                    (QREFELT $ 43)))))
                              (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                              (EXIT NIL))
                         (QSETVELT |node| 3
                                   (SPADCALL (QVELT |node| 3) (QREFELT $ 44)))
                         (QSETVELT |node| 4
                                   (SPADCALL (QVELT |node| 3) (QREFELT $ 45)))
                         (EXIT |node|)))))))) 

(SDEFUN |SUBSPACE;merge;3$;12| ((|s1| $) (|s2| $) ($ $))
        (SPROG ((|n2| (|Rep|)) (|n1| (|Rep|)))
               (SEQ
                (LETT |n1| (SPADCALL |s1| (QREFELT $ 42))
                      . #1=(|SUBSPACE;merge;3$;12|))
                (LETT |n2| (SPADCALL |s2| (QREFELT $ 42)) . #1#)
                (QSETVELT |n1| 3
                          (SPADCALL (SPADCALL |n1| (QREFELT $ 11))
                                    (SPADCALL |n2| (QREFELT $ 11))
                                    (QREFELT $ 46)))
                (EXIT |n1|)))) 

(SDEFUN |SUBSPACE;merge;L$;13| ((|listOfSpaces| |List| $) ($ $))
        (SPROG
         ((#1=#:G176 NIL) (|c| NIL) (#2=#:G175 NIL) (#3=#:G174 NIL) (|s| NIL)
          (|space| ($)))
         (SEQ
          (COND
           ((SPADCALL |listOfSpaces| (QREFELT $ 14))
            (|error| "empty list passed as argument to merge"))
           ('T
            (SEQ
             (LETT |space|
                   (SPADCALL (SPADCALL |listOfSpaces| (QREFELT $ 48))
                             (QREFELT $ 42))
                   . #4=(|SUBSPACE;merge;L$;13|))
             (SEQ (LETT |s| NIL . #4#)
                  (LETT #3# (SPADCALL |listOfSpaces| (QREFELT $ 26)) . #4#)
                  G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (QSETVELT |space| 3
                              (SPADCALL (QVELT |space| 3)
                                        (PROGN
                                         (LETT #2# NIL . #4#)
                                         (SEQ (LETT |c| NIL . #4#)
                                              (LETT #1# (QVELT |s| 3) . #4#)
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
                                                       (SPADCALL |c|
                                                                 (QREFELT $
                                                                          42))
                                                       #2#)
                                                      . #4#)))
                                              (LETT #1# (CDR #1#) . #4#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        (QREFELT $ 46)))))
                  (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT |space|))))))) 

(SDEFUN |SUBSPACE;separate;$L;14| ((|space| $) ($ |List| $))
        (SPROG ((|spaceList| (|List| $)) (|spc| ($)) (#1=#:G181 NIL) (|s| NIL))
               (SEQ
                (LETT |spaceList| (SPADCALL (QREFELT $ 23))
                      . #2=(|SUBSPACE;separate;$L;14|))
                (SEQ (LETT |s| NIL . #2#) (LETT #1# (QVELT |space| 3) . #2#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ (LETT |spc| (SPADCALL |space| (QREFELT $ 41)) . #2#)
                          (QSETVELT |spc| 3
                                    (LIST (SPADCALL |s| (QREFELT $ 42))))
                          (EXIT
                           (LETT |spaceList|
                                 (SPADCALL |spc| |spaceList| (QREFELT $ 43))
                                 . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |spaceList|)))) 

(SDEFUN |SUBSPACE;addPoint;$LP$;15|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) (|point| |Point| R)
         ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G193 NIL) (|more| NIL)
          (|depth| (|NonNegativeInteger|)) (#2=#:G192 NIL) (|i| NIL)
          (|which| (|NonNegativeInteger|)) (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #3=(|SUBSPACE;addPoint;$LP$;15|))))
            (COND
             ((NULL (NULL (CDR |lastPt|)))
              (EXIT (|error| (SPADCALL (QREFELT $ 9) (QREFELT $ 29))))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 51))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #3#) (LETT |node| |space| . #3#)
          (LETT |depth| 0 . #3#)
          (SEQ (LETT |i| NIL . #3#) (LETT #2# |path| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |node| (SPADCALL |node| |i| (QREFELT $ 35)) . #3#)
                    (EXIT (LETT |depth| (+ |depth| 1) . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |more| |depth| . #3#) (LETT #1# (- (QREFELT $ 6) 1) . #3#)
               G190 (COND ((> |more| #1#) (GO G191)))
               (SEQ
                (EXIT (LETT |node| (SPADCALL |node| (QREFELT $ 31)) . #3#)))
               (LETT |more| (+ |more| 1) . #3#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |space|)))) 

(SDEFUN |SUBSPACE;addPoint2;$P$;16| ((|space| $) (|point| |Point| R) ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G202 NIL) (|more| NIL) (|first| ($))
          (|depth| (|NonNegativeInteger|)) (|which| (|NonNegativeInteger|))
          (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #2=(|SUBSPACE;addPoint2;$P$;16|))))
            (COND
             ((NULL (NULL (CDR |lastPt|)))
              (EXIT (|error| (SPADCALL (QREFELT $ 9) (QREFELT $ 29))))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 51))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #2#) (LETT |node| |space| . #2#)
          (LETT |depth| 0 . #2#)
          (LETT |node| (SPADCALL |node| (QREFELT $ 31)) . #2#)
          (LETT |first| |node| . #2#)
          (SEQ (LETT |more| 1 . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#) G190
               (COND ((|greater_SI| |more| #1#) (GO G191)))
               (SEQ
                (EXIT (LETT |node| (SPADCALL |node| (QREFELT $ 31)) . #2#)))
               (LETT |more| (|inc_SI| |more|) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |first|)))) 

(SDEFUN |SUBSPACE;addPointLast;2$PNni$;17|
        ((|space| $) (|node| $) (|point| |Point| R)
         (|depth| |NonNegativeInteger|) ($ $))
        (SPROG
         ((#1=#:G211 NIL) (|more| NIL) (|which| (|NonNegativeInteger|))
          (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #2=(|SUBSPACE;addPointLast;2$PNni$;17|))))
            (COND
             ((NULL (NULL (CDR |lastPt|)))
              (EXIT (|error| (SPADCALL (QREFELT $ 9) (QREFELT $ 29))))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 51))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #2#)
          (COND
           ((EQL |depth| 2)
            (LETT |node| (SPADCALL |node| 2 (QREFELT $ 35)) . #2#)))
          (SEQ (LETT |more| |depth| . #2#) (LETT #1# (- (QREFELT $ 6) 1) . #2#)
               G190 (COND ((> |more| #1#) (GO G191)))
               (SEQ
                (EXIT (LETT |node| (SPADCALL |node| (QREFELT $ 31)) . #2#)))
               (LETT |more| (+ |more| 1) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |node|)))) 

(SDEFUN |SUBSPACE;addPoint;$LNni$;18|
        ((|space| $) (|path| |List| (|NonNegativeInteger|))
         (|which| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G219 NIL) (|more| NIL)
          (|depth| (|NonNegativeInteger|)) (#2=#:G218 NIL) (|i| NIL))
         (SEQ (LETT |node| |space| . #3=(|SUBSPACE;addPoint;$LNni$;18|))
              (LETT |depth| 0 . #3#)
              (SEQ (LETT |i| NIL . #3#) (LETT #2# |path| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |node| (SPADCALL |node| |i| (QREFELT $ 35)) . #3#)
                    (EXIT (LETT |depth| (+ |depth| 1) . #3#)))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |more| |depth| . #3#)
                   (LETT #1# (- (QREFELT $ 6) 1) . #3#) G190
                   (COND ((> |more| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |node| (SPADCALL |node| (QREFELT $ 31)) . #3#)))
                   (LETT |more| (+ |more| 1) . #3#) (GO G190) G191 (EXIT NIL))
              (QSETVELT |node| 0
                        (SPADCALL (QVELT |space| 6) |which| (QREFELT $ 56)))
              (QSETVELT |node| 1 |which|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;addPoint;$PNni;19|
        ((|space| $) (|point| |Point| R) ($ |NonNegativeInteger|))
        (SPROG ((|lastPt| (|List| (|Point| R))))
               (SEQ
                (COND
                 ((SPADCALL |space| (QREFELT $ 16))
                  (SEQ
                   (COND
                    ((NULL
                      (NULL
                       (LETT |lastPt| (QVELT |space| 7)
                             |SUBSPACE;addPoint;$PNni;19|)))
                     (COND
                      ((NULL (NULL (CDR |lastPt|)))
                       (EXIT
                        (|error| (SPADCALL (QREFELT $ 9) (QREFELT $ 29))))))))
                   (COND
                    ((NULL |lastPt|)
                     (SEQ (QSETVELT |space| 6 (LIST |point|))
                          (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
                    (#1='T
                     (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 51))
                          (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
                   (EXIT (QSETVELT |space| 8 (+ (QVELT |space| 8) 1)))))
                 (#1#
                  (|error|
                   "You need to pass a top level SubSpace (level should be zero)")))))) 

(SDEFUN |SUBSPACE;modifyPoint;$LP$;20|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) (|point| |Point| R)
         ($ $))
        (SPROG
         ((|node| ($)) (#1=#:G236 NIL) (|i| NIL)
          (|which| (|NonNegativeInteger|)) (|lastPt| (|List| (|Point| R))))
         (SEQ
          (COND
           ((NULL
             (NULL
              (LETT |lastPt| (QVELT |space| 7)
                    . #2=(|SUBSPACE;modifyPoint;$LP$;20|))))
            (COND
             ((NULL (NULL (CDR |lastPt|)))
              (EXIT (|error| (SPADCALL (QREFELT $ 9) (QREFELT $ 29))))))))
          (COND
           ((NULL |lastPt|)
            (SEQ (QSETVELT |space| 6 (LIST |point|))
                 (EXIT (QSETVELT |space| 7 (QVELT |space| 6)))))
           ('T
            (SEQ (SPADCALL |lastPt| (LIST |point|) (QREFELT $ 51))
                 (EXIT (QSETVELT |space| 7 (CDR |lastPt|))))))
          (QSETVELT |space| 8 (+ (QVELT |space| 8) 1))
          (LETT |which| (QVELT |space| 8) . #2#) (LETT |node| |space| . #2#)
          (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |node| (SPADCALL |node| |i| (QREFELT $ 35)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (QSETVELT |node| 0 |point|) (QSETVELT |node| 1 |which|)
          (EXIT |space|)))) 

(SDEFUN |SUBSPACE;modifyPoint;$LNni$;21|
        ((|space| $) (|path| |List| (|NonNegativeInteger|))
         (|which| |NonNegativeInteger|) ($ $))
        (SPROG ((|node| ($)) (#1=#:G241 NIL) (|i| NIL))
               (SEQ
                (LETT |node| |space| . #2=(|SUBSPACE;modifyPoint;$LNni$;21|))
                (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |node| (SPADCALL |node| |i| (QREFELT $ 35))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETVELT |node| 0
                          (SPADCALL (QVELT |space| 6) |which| (QREFELT $ 56)))
                (QSETVELT |node| 1 |which|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;modifyPoint;$NniP$;22|
        ((|space| $) (|which| |NonNegativeInteger|) (|point| |Point| R) ($ $))
        (SEQ
         (COND
          ((SPADCALL |space| (QREFELT $ 16))
           (SEQ (SPADCALL (QVELT |space| 6) |which| |point| (QREFELT $ 61))
                (EXIT |space|)))
          ('T
           (|error|
            "You need to pass a top level SubSpace (level should be zero)"))))) 

(SDEFUN |SUBSPACE;closeComponent;$LB$;23|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) (|val| |Boolean|)
         ($ $))
        (SPROG ((|node| ($)) (#1=#:G249 NIL) (|i| NIL))
               (SEQ
                (LETT |node| |space| . #2=(|SUBSPACE;closeComponent;$LB$;23|))
                (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |node| (SPADCALL |node| |i| (QREFELT $ 35))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (SPADCALL (QVELT |node| 2) |val| (QREFELT $ 63))
                (EXIT |space|)))) 

(SDEFUN |SUBSPACE;defineProperty;$LSscp$;24|
        ((|space| $) (|path| |List| (|NonNegativeInteger|))
         (|prop| |SubSpaceComponentProperty|) ($ $))
        (SPROG ((|node| ($)) (#1=#:G253 NIL) (|i| NIL))
               (SEQ
                (LETT |node| |space|
                      . #2=(|SUBSPACE;defineProperty;$LSscp$;24|))
                (SEQ (LETT |i| NIL . #2#) (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |node| (SPADCALL |node| |i| (QREFELT $ 35))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (QSETVELT |node| 2 |prop|) (EXIT |space|)))) 

(SDEFUN |SUBSPACE;traverse;$L$;25|
        ((|space| $) (|path| |List| (|NonNegativeInteger|)) ($ $))
        (SPROG ((#1=#:G257 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| NIL . #2=(|SUBSPACE;traverse;$L$;25|))
                     (LETT #1# |path| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |space| (SPADCALL |space| |i| (QREFELT $ 35))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |space|)))) 

(SDEFUN |SUBSPACE;extractPoint;$P;26| ((|space| $) ($ |Point| R))
        (SPROG ((|node| ($)))
               (SEQ (LETT |node| |space| . #1=(|SUBSPACE;extractPoint;$P;26|))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((SPADCALL |node| (QREFELT $ 16)) 'NIL)
                                  ('T 'T)))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |node| (SPADCALL |node| (QREFELT $ 67))
                                 . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL (QVELT |node| 6) (QVELT |space| 1)
                               (QREFELT $ 56)))))) 

(PUT '|SUBSPACE;extractIndex;$Nni;27| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 1))) 

(SDEFUN |SUBSPACE;extractIndex;$Nni;27| ((|space| $) ($ |NonNegativeInteger|))
        (QVELT |space| 1)) 

(SDEFUN |SUBSPACE;extractClosed;$B;28| ((|space| $) ($ |Boolean|))
        (SPADCALL (QVELT |space| 2) (QREFELT $ 70))) 

(PUT '|SUBSPACE;extractProperty;$Sscp;29| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 2))) 

(SDEFUN |SUBSPACE;extractProperty;$Sscp;29|
        ((|space| $) ($ |SubSpaceComponentProperty|)) (QVELT |space| 2)) 

(SDEFUN |SUBSPACE;parent;2$;30| ((|space| $) ($ $))
        (COND
         ((SPADCALL (QVELT |space| 10) (QREFELT $ 14))
          (|error| "This is a top level SubSpace - it does not have a parent"))
         ('T (SPADCALL (QVELT |space| 10) (QREFELT $ 48))))) 

(PUT '|SUBSPACE;pointData;$L;31| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 6))) 

(SDEFUN |SUBSPACE;pointData;$L;31| ((|space| $) ($ |List| (|Point| R)))
        (QVELT |space| 6)) 

(PUT '|SUBSPACE;level;$Nni;32| '|SPADreplace|
     '(XLAM (|space|) (QVELT |space| 5))) 

(SDEFUN |SUBSPACE;level;$Nni;32| ((|space| $) ($ |NonNegativeInteger|))
        (QVELT |space| 5)) 

(SDEFUN |SUBSPACE;=;2$B;33| ((|s1| $) (|s2| $) ($ |Boolean|))
        (SPROG
         ((#1=#:G276 NIL) (#2=#:G275 #3=(|Boolean|)) (#4=#:G277 #3#)
          (#5=#:G282 NIL) (|c1| NIL) (#6=#:G283 NIL) (|c2| NIL))
         (SEQ
          (COND
           ((SPADCALL |s1| (QREFELT $ 15))
            (COND
             ((SPADCALL |s2| (QREFELT $ 15))
              (EXIT
               (COND
                ((SPADCALL (QVELT |s1| 0) (QVELT |s2| 0) (QREFELT $ 75))
                 (COND
                  ((SPADCALL (QVELT |s1| 2) (QVELT |s2| 2) (QREFELT $ 76))
                   (EQL (QVELT |s1| 5) (QVELT |s2| 5)))
                  (#7='T 'NIL)))
                (#7# 'NIL)))))))
          (EXIT
           (COND
            ((OR
              (OR
               (SPADCALL (SPADCALL (QVELT |s1| 3) (QREFELT $ 77))
                         (SPADCALL (QVELT |s2| 3) (QREFELT $ 77))
                         (QREFELT $ 78))
               (NULL
                (PROGN
                 (LETT #1# NIL . #8=(|SUBSPACE;=;2$B;33|))
                 (SEQ (LETT |c2| NIL . #8#) (LETT #6# (QVELT |s2| 3) . #8#)
                      (LETT |c1| NIL . #8#) (LETT #5# (QVELT |s1| 3) . #8#)
                      G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |c1| (CAR #5#) . #8#) NIL)
                            (ATOM #6#) (PROGN (LETT |c2| (CAR #6#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# (SPADCALL |c1| |c2| (QREFELT $ 79)) . #8#)
                         (COND
                          (#1# (LETT #2# (COND (#2# #4#) ('T 'NIL)) . #8#))
                          ('T
                           (PROGN
                            (LETT #2# #4# . #8#)
                            (LETT #1# 'T . #8#)))))))
                      (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#) . #8#))
                            . #8#)
                      (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) (#7# 'T)))))
              (NULL (SPADCALL (QVELT |s1| 2) (QVELT |s2| 2) (QREFELT $ 76))))
             'NIL)
            ('T (EQL (QVELT |s1| 5) (QVELT |s2| 5)))))))) 

(SDEFUN |SUBSPACE;coerce;$Of;34| ((|space| $) ($ |OutputForm|))
        (SPROG ((|s| (|NonNegativeInteger|)))
               (SPADCALL
                (LIST (SPADCALL (QREFELT $ 6) (QREFELT $ 81))
                      "-Space with depth of "
                      (SPADCALL (- (QREFELT $ 6) (QVELT |space| 5))
                                (QREFELT $ 82))
                      " and "
                      (SPADCALL
                       (LETT |s| (SPADCALL (QVELT |space| 3) (QREFELT $ 77))
                             |SUBSPACE;coerce;$Of;34|)
                       (QREFELT $ 83))
                      (COND ((EQL |s| 1) " component") ('T " components")))
                (QREFELT $ 84)))) 

(DECLAIM (NOTINLINE |SubSpace;|)) 

(DEFUN |SubSpace| (&REST #1=#:G285)
  (SPROG NIL
         (PROG (#2=#:G286)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SubSpace|)
                                               '|domainEqualList|)
                    . #3=(|SubSpace|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SubSpace;|) #1#)
                    (LETT #2# T . #3#))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|SubSpace|)))))))))) 

(DEFUN |SubSpace;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|SubSpace|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|SubSpace| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 88) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SubSpace| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |pt| (|Point| |#2|))
                              (|:| |index| (|NonNegativeInteger|))
                              (|:| |property| (|SubSpaceComponentProperty|))
                              (|:| |childrenField| (|List| $))
                              (|:| |lastChild| (|List| $))
                              (|:| |levelField| (|NonNegativeInteger|))
                              (|:| |pointDataField| (|List| (|Point| |#2|)))
                              (|:| |lastPoint| (|List| (|Point| |#2|)))
                              (|:| |noPoints| (|NonNegativeInteger|))
                              (|:| |noChildren| (|NonNegativeInteger|))
                              (|:| |parentField| (|List| $))))
          (QSETREFV $ 9 "Non-null list: Please inform Stephen Watt")
          $))) 

(MAKEPROP '|SubSpace| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              'TELLWATT (|List| $) |SUBSPACE;children;$L;8| (|Boolean|)
              (|List| $$) (0 . |empty?|) |SUBSPACE;leaf?;$B;1|
              |SUBSPACE;root?;$B;2| |SUBSPACE;internal?;$B;3| (|List| 7)
              (|Point| 7) (5 . |point|) (|SubSpaceComponentProperty|)
              (10 . |new|) (14 . |nil|) |SUBSPACE;new;$;4|
              |SUBSPACE;subspace;$;5| (18 . |rest|) (|OutputForm|) (|String|)
              (23 . |coerce|) (28 . |setrest!|) |SUBSPACE;birth;2$;6|
              (|Integer|) (34 . |elt|) (|NonNegativeInteger|)
              |SUBSPACE;child;$Nni$;7| |SUBSPACE;numberOfChildren;$Nni;9|
              (40 . |copy|) (|List| 19) (45 . |copy|) (50 . |tail|)
              |SUBSPACE;shallowCopy;2$;10| |SUBSPACE;deepCopy;2$;11|
              (55 . |cons|) (61 . |reverse!|) (66 . |tail|) (71 . |append|)
              |SUBSPACE;merge;3$;12| (77 . |first|) |SUBSPACE;merge;L$;13|
              |SUBSPACE;separate;$L;14| (82 . |setrest!|) (|List| 34)
              |SUBSPACE;addPoint;$LP$;15| |SUBSPACE;addPoint2;$P$;16|
              |SUBSPACE;addPointLast;2$PNni$;17| (88 . |elt|)
              |SUBSPACE;addPoint;$LNni$;18| |SUBSPACE;addPoint;$PNni;19|
              |SUBSPACE;modifyPoint;$LP$;20| |SUBSPACE;modifyPoint;$LNni$;21|
              (94 . |setelt|) |SUBSPACE;modifyPoint;$NniP$;22| (101 . |close|)
              |SUBSPACE;closeComponent;$LB$;23|
              |SUBSPACE;defineProperty;$LSscp$;24| |SUBSPACE;traverse;$L$;25|
              |SUBSPACE;parent;2$;30| |SUBSPACE;extractPoint;$P;26|
              |SUBSPACE;extractIndex;$Nni;27| (107 . |closed?|)
              |SUBSPACE;extractClosed;$B;28|
              |SUBSPACE;extractProperty;$Sscp;29| |SUBSPACE;pointData;$L;31|
              |SUBSPACE;level;$Nni;32| (112 . =) (118 . =) (124 . |#|)
              (129 . ~=) |SUBSPACE;=;2$B;33| (|PositiveInteger|)
              (135 . |coerce|) (140 . |coerce|) (145 . |coerce|)
              (150 . |hconcat|) |SUBSPACE;coerce;$Of;34| (|SingleInteger|)
              (|HashState|))
           '#(~= 155 |traverse| 161 |subspace| 167 |shallowCopy| 171 |separate|
              176 |root?| 181 |pointData| 186 |parent| 191 |numberOfChildren|
              196 |new| 201 |modifyPoint| 205 |merge| 226 |level| 237 |leaf?|
              242 |latex| 247 |internal?| 252 |hashUpdate!| 257 |hash| 263
              |extractProperty| 268 |extractPoint| 273 |extractIndex| 278
              |extractClosed| 283 |defineProperty| 288 |deepCopy| 295 |coerce|
              300 |closeComponent| 305 |children| 312 |child| 317 |birth| 323
              |addPointLast| 328 |addPoint2| 336 |addPoint| 342 = 362)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 27))
                        (|makeByteWordVec2| 87
                                            '(1 13 12 0 14 1 19 0 18 20 0 21 0
                                              22 0 13 0 23 1 13 0 0 26 1 28 27
                                              0 29 2 13 0 0 0 30 2 13 2 0 32 33
                                              1 21 0 0 37 1 38 0 0 39 1 38 0 0
                                              40 2 13 0 2 0 43 1 13 0 0 44 1 13
                                              0 0 45 2 13 0 0 0 46 1 13 2 0 48
                                              2 38 0 0 0 51 2 38 19 0 32 56 3
                                              38 19 0 32 19 61 2 21 12 0 12 63
                                              1 21 12 0 70 2 19 12 0 0 75 2 21
                                              12 0 0 76 1 13 34 0 77 2 34 12 0
                                              0 78 1 80 27 0 81 1 32 27 0 82 1
                                              34 27 0 83 1 27 0 10 84 2 0 12 0
                                              0 1 2 0 0 0 52 66 0 0 0 25 1 0 0
                                              0 41 1 0 10 0 50 1 0 12 0 16 1 0
                                              38 0 73 1 0 0 0 67 1 0 34 0 36 0
                                              0 0 24 3 0 0 0 34 19 62 3 0 0 0
                                              52 34 60 3 0 0 0 52 19 59 2 0 0 0
                                              0 47 1 0 0 10 49 1 0 34 0 74 1 0
                                              12 0 15 1 0 28 0 1 1 0 12 0 17 2
                                              0 87 87 0 1 1 0 86 0 1 1 0 21 0
                                              72 1 0 19 0 68 1 0 34 0 69 1 0 12
                                              0 71 3 0 0 0 52 21 65 1 0 0 0 42
                                              1 0 27 0 85 3 0 0 0 52 12 64 1 0
                                              10 0 11 2 0 0 0 34 35 1 0 0 0 31
                                              4 0 0 0 0 19 34 55 2 0 0 0 19 54
                                              2 0 34 0 19 58 3 0 0 0 52 34 57 3
                                              0 0 0 52 19 53 2 0 12 0 0 79)))))
           '|lookupComplete|)) 
