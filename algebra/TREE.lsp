
(MAKEPROP '|TREE;empty?;%B;1| '|SPADreplace| '(XLAM (|t|) (QEQCAR |t| 1))) 

(SDEFUN |TREE;empty?;%B;1| ((|t| (%)) (% (|Boolean|))) (QEQCAR |t| 1)) 

(MAKEPROP '|TREE;empty;%;2| '|SPADreplace| '(XLAM NIL (CONS 1 "empty"))) 

(SDEFUN |TREE;empty;%;2| ((% (%))) (CONS 1 "empty")) 

(SDEFUN |TREE;children;%L;3| ((|t| (%)) (% (|List| %)))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the children of an empty tree"))
         ('T (QCDR (CDR |t|))))) 

(SDEFUN |TREE;setchildren!;%L%;4| ((|t| (%)) (|lt| (|List| %)) (% (%)))
        (SEQ
         (COND
          ((QEQCAR |t| 1) (|error| "cannot set children of an empty tree"))
          ('T (SEQ (PROGN (RPLACD #1=(CDR |t|) |lt|) (QCDR #1#)) (EXIT |t|)))))) 

(SDEFUN |TREE;setvalue!;%2S;5| ((|t| (%)) (|s| (S)) (% (S)))
        (SEQ
         (COND ((QEQCAR |t| 1) (|error| "cannot set value of an empty tree"))
               ('T
                (SEQ (PROGN (RPLACA #1=(CDR |t|) |s|) (QCAR #1#))
                     (EXIT |s|)))))) 

(SDEFUN |TREE;count;S%Nni;6| ((|n| (S)) (|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|c| NIL) (#1=#:G38 NIL) (#2=#:G33 #3=(|NonNegativeInteger|))
          (#4=#:G31 #3#) (#5=#:G32 NIL) (|i| #3#))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #1# (SPADCALL |t| (QREFELT % 12))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #2# (SPADCALL |n| |c| (QREFELT % 16)))
                                 (COND (#5# (LETT #4# (+ #4# #2#)))
                                       ('T
                                        (PROGN
                                         (LETT #4# #2#)
                                         (LETT #5# 'T)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT % 17)) |n|
                               (QREFELT % 18))
                     (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;count;M%Nni;7|
        ((|fn| (|Mapping| (|Boolean|) S)) (|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|c| NIL) (#1=#:G45 NIL) (#2=#:G41 #3=(|NonNegativeInteger|))
          (#4=#:G39 #3#) (#5=#:G40 NIL) (|i| #3#))
         (SEQ
          (COND ((QEQCAR |t| 1) 0)
                (#6='T
                 (SEQ
                  (LETT |i|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #1# (SPADCALL |t| (QREFELT % 12))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |c| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #2# (SPADCALL |fn| |c| (QREFELT % 20)))
                                 (COND (#5# (LETT #4# (+ #4# #2#)))
                                       ('T
                                        (PROGN
                                         (LETT #4# #2#)
                                         (LETT #5# 'T)))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#6# 0))))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT % 17)) |fn|) (+ |i| 1))
                    (#6# |i|))))))))) 

(SDEFUN |TREE;map;M2%;8| ((|fn| (|Mapping| S S)) (|t| (%)) (% (%)))
        (SPROG ((#1=#:G50 NIL) (|c| NIL) (#2=#:G51 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SPADCALL (SPADCALL (SPADCALL |t| (QREFELT % 17)) |fn|)
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |c| NIL)
                                       (LETT #2# (SPADCALL |t| (QREFELT % 12)))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |c| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |fn| |c|
                                                          (QREFELT % 22))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 23))))))) 

(SDEFUN |TREE;map!;M2%;9| ((|fn| (|Mapping| S S)) (|t| (%)) (% (%)))
        (SPROG ((|c| NIL) (#1=#:G57 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |t|)
                      ('T
                       (SEQ
                        (SPADCALL |t|
                                  (SPADCALL (SPADCALL |t| (QREFELT % 17)) |fn|)
                                  (QREFELT % 14))
                        (SEQ (LETT |c| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT % 12))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (EXIT (SPADCALL |fn| |c| (QREFELT % 24))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |t|))))))) 

(SDEFUN |TREE;tree;SL%;10| ((|s| (S)) (|lt| (|List| %)) (% (%)))
        (CONS 0 (CONS |s| |lt|))) 

(SDEFUN |TREE;tree;S%;11| ((|s| (S)) (% (%))) (CONS 0 (CONS |s| NIL))) 

(SDEFUN |TREE;tree;L%;12| ((|ls| (|List| S)) (% (%)))
        (SPROG ((#1=#:G64 NIL) (|s| NIL) (#2=#:G65 NIL))
               (SEQ
                (COND ((NULL |ls|) (SPADCALL (QREFELT % 10)))
                      ('T
                       (SPADCALL (|SPADfirst| |ls|)
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |s| NIL) (LETT #2# (CDR |ls|))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |s| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |s| (QREFELT % 25))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 23))))))) 

(SDEFUN |TREE;value;%S;13| ((|t| (%)) (% (S)))
        (COND
         ((QEQCAR |t| 1) (|error| "cannot take the value of an empty tree"))
         ('T (QCAR (CDR |t|))))) 

(SDEFUN |TREE;child?;2%B;14| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |t2| (QREFELT % 9)) NIL)
              ('T
               (SPADCALL |t1| (SPADCALL |t2| (QREFELT % 12)) (QREFELT % 29))))) 

(SDEFUN |TREE;distance1| ((|t1| (%)) (|t2| (%)) (% #1=(|Integer|)))
        (SPROG
         ((#2=#:G78 NIL) (|t| NIL) (#3=#:G79 NIL) (|n| #1#) (|u| (|List| #1#))
          (#4=#:G0 NIL) (#5=#:G80 NIL) (#6=#:G75 #1#) (#7=#:G73 #1#)
          (#8=#:G74 NIL))
         (SEQ
          (COND ((SPADCALL |t1| |t2| (QREFELT % 31)) 0) ((QEQCAR |t2| 1) -1)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |t| NIL)
                              (LETT #3# (SPADCALL |t2| (QREFELT % 12))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |t| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((>= (LETT |n| (|TREE;distance1| |t1| |t| %))
                                      0)
                                  (LETT #2# (CONS |n| #2#))))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT
                   (COND
                    ((> (LENGTH |u|) 0)
                     (+ 1
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT #4# NIL) (LETT #5# |u|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #4# (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# #4#)
                                 (COND (#8# (LETT #7# (MIN #7# #6#)))
                                       ('T
                                        (PROGN
                                         (LETT #7# #6#)
                                         (LETT #8# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#8# #7#) (#9# (|IdentityError| '|min|))))))
                    (#9# -1))))))))) 

(SDEFUN |TREE;distance;2%I;16| ((|t1| (%)) (|t2| (%)) (% (|Integer|)))
        (SPROG ((|n| (|Integer|)))
               (SEQ (LETT |n| (|TREE;distance1| |t1| |t2| %))
                    (EXIT
                     (COND ((>= |n| 0) |n|)
                           ('T (|TREE;distance1| |t2| |t1| %))))))) 

(SDEFUN |TREE;node?;2%B;17| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (SPROG NIL
               (COND ((SPADCALL |t1| |t2| (QREFELT % 31)) 'T)
                     ((QEQCAR |t2| 1) NIL)
                     ('T
                      (SPADCALL (CONS #'|TREE;node?;2%B;17!0| (VECTOR % |t1|))
                                (SPADCALL |t2| (QREFELT % 12))
                                (QREFELT % 36)))))) 

(SDEFUN |TREE;node?;2%B;17!0| ((|t| NIL) ($$ NIL))
        (PROG (|t1| %)
          (LETT |t1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |t1| |t| (QREFELT % 34)))))) 

(SDEFUN |TREE;any?;M%B;18|
        ((|fn| (|Mapping| #1=(|Boolean|) S)) (|t| (%)) (% #1#))
        (SPROG ((|c| NIL) (#2=#:G97 NIL) (#3=#:G96 NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) NIL)
                       ((SPADCALL (SPADCALL |t| (QREFELT % 17)) |fn|) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 12))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |fn| |c| (QREFELT % 37))
                                  (PROGN (LETT #3# 'T) (GO #4=#:G95))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))
                #4# (EXIT #3#)))) 

(SDEFUN |TREE;every?;M%B;19|
        ((|fn| (|Mapping| #1=(|Boolean|) S)) (|t| (%)) (% #1#))
        (SPROG ((|c| NIL) (#2=#:G106 NIL) (#3=#:G105 NIL))
               (SEQ
                (EXIT
                 (COND ((QEQCAR |t| 1) 'T)
                       ((NULL (SPADCALL (SPADCALL |t| (QREFELT % 17)) |fn|))
                        NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |c| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 12))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((NULL (SPADCALL |fn| |c| (QREFELT % 38)))
                                  (PROGN (LETT #3# NIL) (GO #4=#:G104))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))
                #4# (EXIT #3#)))) 

(SDEFUN |TREE;member?;S%B;20| ((|n| (S)) (|t| (%)) (% (|Boolean|)))
        (SPROG NIL
               (COND ((QEQCAR |t| 1) NIL)
                     ((SPADCALL |n| (SPADCALL |t| (QREFELT % 17))
                                (QREFELT % 18))
                      'T)
                     ('T
                      (SPADCALL (CONS #'|TREE;member?;S%B;20!0| (VECTOR % |n|))
                                (SPADCALL |t| (QREFELT % 12))
                                (QREFELT % 36)))))) 

(SDEFUN |TREE;member?;S%B;20!0| ((|c| NIL) ($$ NIL))
        (PROG (|n| %)
          (LETT |n| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |n| |c| (QREFELT % 39)))))) 

(SDEFUN |TREE;parts;%L;21| ((|t| (%)) (% (|List| S)))
        (SPROG
         ((#1=#:G122 NIL) (|c| NIL) (#2=#:G123 NIL)
          (|u| (|List| #3=(|List| S))) (#4=#:G1 NIL) (#5=#:G124 NIL)
          (#6=#:G119 #3#) (#7=#:G117 #3#) (#8=#:G118 NIL))
         (SEQ
          (COND ((QEQCAR |t| 1) NIL)
                (#9='T
                 (SEQ
                  (LETT |u|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |c| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 12))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |c| (QREFELT % 40))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (EXIT
                   (COND
                    ((SPADCALL |u| NIL (QREFELT % 42))
                     (LIST (SPADCALL |t| (QREFELT % 17))))
                    (#9#
                     (CONS (SPADCALL |t| (QREFELT % 17))
                           (PROGN
                            (LETT #8# NIL)
                            (SEQ (LETT #4# NIL) (LETT #5# |u|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT #4# (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #6# #4#)
                                    (COND
                                     (#8#
                                      (LETT #7#
                                            (SPADCALL #7# #6# (QREFELT % 43))))
                                     ('T
                                      (PROGN (LETT #7# #6#) (LETT #8# 'T)))))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#8# #7#) (#9# NIL))))))))))))) 

(SDEFUN |TREE;hashUpdate!;Hs%Hs;22|
        ((|s| (|HashState|)) (|t| (%)) (% (|HashState|)))
        (SPROG ((|ct| NIL) (#1=#:G131 NIL))
               (SEQ
                (COND ((QEQCAR |t| 1) |s|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (SPADCALL |s| (SPADCALL |t| (QREFELT % 17))
                                        (QREFELT % 45)))
                        (SEQ (LETT |ct| NIL)
                             (LETT #1# (SPADCALL |t| (QREFELT % 12))) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |ct| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |s| (SPADCALL |s| |ct| (QREFELT % 46)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT |s|))))))) 

(SDEFUN |TREE;=;2%B;23| ((|t1| (%)) (|t2| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |t1| (QREFELT % 9)) (SPADCALL |t2| (QREFELT % 9)))
              ((SPADCALL (SPADCALL |t1| (QREFELT % 17))
                         (SPADCALL |t2| (QREFELT % 17)) (QREFELT % 18))
               (SPADCALL (SPADCALL |t1| (QREFELT % 12))
                         (SPADCALL |t2| (QREFELT % 12)) (QREFELT % 47)))
              ('T NIL))) 

(SDEFUN |TREE;#;%Nni;24| ((|t| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|c| NIL) (#1=#:G142 NIL) (#2=#:G139 #3=(|NonNegativeInteger|))
          (#4=#:G137 #3#) (#5=#:G138 NIL))
         (SEQ
          (COND ((SPADCALL |t| (QREFELT % 9)) 0)
                (#6='T
                 (+ 1
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |c| NIL)
                          (LETT #1# (SPADCALL |t| (QREFELT % 12))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (SPADCALL |c| (QREFELT % 48)))
                             (COND (#5# (LETT #4# (+ #4# #2#)))
                                   ('T
                                    (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) (#6# 0))))))))) 

(SDEFUN |TREE;copy;2%;25| ((|t| (%)) (% (%)))
        (SPROG ((#1=#:G147 NIL) (|c| NIL) (#2=#:G148 NIL))
               (SEQ
                (COND ((SPADCALL |t| (QREFELT % 9)) (SPADCALL (QREFELT % 10)))
                      ('T
                       (SPADCALL (SPADCALL |t| (QREFELT % 17))
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |c| NIL)
                                       (LETT #2# (SPADCALL |t| (QREFELT % 12)))
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |c| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |c| (QREFELT % 49))
                                                #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 23))))))) 

(SDEFUN |TREE;coerce;%Of;26| ((|t| (%)) (% (|OutputForm|)))
        (SPROG
         ((|nodeForm| (|OutputForm|)) (#1=#:G156 NIL) (|c| NIL)
          (#2=#:G157 NIL))
         (SEQ
          (COND ((SPADCALL |t| (QREFELT % 9)) (SPADCALL NIL (QREFELT % 51)))
                (#3='T
                 (SEQ
                  (LETT |nodeForm|
                        (SPADCALL (SPADCALL |t| (QREFELT % 17))
                                  (QREFELT % 52)))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |t| (QREFELT % 12)) (QREFELT % 53))
                     |nodeForm|)
                    (#3#
                     (SPADCALL |nodeForm|
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |c| NIL)
                                     (LETT #2# (SPADCALL |t| (QREFELT % 12)))
                                     G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |c| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #1#
                                             (CONS
                                              (SPADCALL |c| (QREFELT % 54))
                                              #1#))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT (NREVERSE #1#))))
                               (QREFELT % 55))))))))))) 

(DECLAIM (NOTINLINE |Tree;|)) 

(DEFUN |Tree;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G161 NIL) (#2=#:G160 NIL)
    (#3=#:G159 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Tree| DV$1))
    (LETT % (GETREFV 62))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #1#)
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|BasicType|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            #1#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3#
                                            (AND
                                             (|HasCategory| |#1|
                                                            (LIST '|Evalable|
                                                                  (|devaluate|
                                                                   |#1|)))
                                             #1#))))))
    (|haddProp| |$ConstructorCache| '|Tree| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 256))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 512))
    (AND #2# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1024))
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 2048))
    (AND
     (OR (AND #2# (|HasCategory| % '(|finiteAggregate|)))
         (|HasCategory| |#1| '(|Hashable|)) #1#)
     (|augmentPredVector| % 4096))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7
              (|Union|
               (|:| |node|
                    (|Record| (|:| |value| |#1|) (|:| |args| (|List| %))))
               (|:| |empty| "empty")))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 46
                (CONS (|dispatchFunction| |TREE;hashUpdate!;Hs%Hs;22|) %))))
    %))) 

(DEFUN |Tree| (#1=#:G162)
  (SPROG NIL
         (PROG (#2=#:G163)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tree;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tree|)))))))))) 

(MAKEPROP '|Tree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Boolean|)
              |TREE;empty?;%B;1| |TREE;empty;%;2| (|List| %)
              |TREE;children;%L;3| |TREE;setchildren!;%L%;4|
              |TREE;setvalue!;%2S;5| (|NonNegativeInteger|)
              |TREE;count;S%Nni;6| |TREE;value;%S;13| (0 . =) (|Mapping| 8 6)
              |TREE;count;M%Nni;7| (|Mapping| 6 6) |TREE;map;M2%;8|
              |TREE;tree;SL%;10| |TREE;map!;M2%;9| |TREE;tree;S%;11| (|List| 6)
              |TREE;tree;L%;12| (|List| $$) (6 . |member?|)
              |TREE;child?;2%B;14| |TREE;=;2%B;23| (|Integer|)
              |TREE;distance;2%I;16| |TREE;node?;2%B;17| (|Mapping| 8 $$)
              (12 . |any?|) |TREE;any?;M%B;18| |TREE;every?;M%B;19|
              |TREE;member?;S%B;20| |TREE;parts;%L;21| (|List| 26) (18 . =)
              (24 . |append|) (|HashState|) (30 . |hashUpdate!|)
              (36 . |hashUpdate!|) (42 . =) |TREE;#;%Nni;24| |TREE;copy;2%;25|
              (|OutputForm|) (48 . |coerce|) (53 . |coerce|) (58 . |empty?|)
              |TREE;coerce;%Of;26| (63 . |prefix|) '"value" (|Equation| 6)
              (|List| 57) (|Mapping| 8 6 6) (|SingleInteger|) (|String|))
           '#(~= 69 |value| 75 |tree| 80 |size?| 96 |setvalue!| 102 |setelt!|
              108 |setchildren!| 115 |sample| 121 |parts| 125 |nodes| 130
              |node?| 135 |more?| 141 |min| 147 |members| 152 |member?| 157
              |max| 163 |map!| 174 |map| 180 |less?| 186 |leaves| 192 |leaf?|
              197 |latex| 202 |hashUpdate!| 207 |hash| 213 |every?| 218 |eval|
              224 |eq?| 250 |empty?| 256 |empty| 261 |elt| 265 |distance| 271
              |cyclic?| 277 |count| 282 |copy| 294 |coerce| 299 |children| 304
              |child?| 309 |any?| 315 = 321 |#| 327)
           'NIL
           (CONS (|makeByteWordVec2| 8 '(0 0 3 1 2 0 6 8 2 0 0 0))
                 (CONS
                  '#(|RecursiveAggregate&| |HomogeneousAggregate&| |Hashable&|
                     |SetCategory&| |Evalable&| |Aggregate&| |BasicType&| NIL
                     |InnerEvalable&| NIL NIL NIL)
                  (CONS
                   '#((|RecursiveAggregate| 6) (|HomogeneousAggregate| 6)
                      (|Hashable|) (|SetCategory|) (|Evalable| 6) (|Aggregate|)
                      (|BasicType|) (|CoercibleTo| 50) (|InnerEvalable| 6 6)
                      (|finiteAggregate|) (|shallowlyMutable|) (|Type|))
                   (|makeByteWordVec2| 61
                                       '(2 6 8 0 0 18 2 28 8 2 0 29 2 28 8 35 0
                                         36 2 41 8 0 0 42 2 26 0 0 0 43 2 6 44
                                         44 0 45 2 0 44 44 0 46 2 28 8 0 0 47 1
                                         26 50 0 51 1 6 50 0 52 1 28 8 0 53 2
                                         50 0 0 11 55 2 13 8 0 0 1 1 0 6 0 17 2
                                         0 0 6 11 23 1 0 0 6 25 1 0 0 26 27 2 0
                                         8 0 15 1 2 12 6 0 6 14 3 12 6 0 56 6 1
                                         2 12 0 0 11 13 0 0 0 1 1 9 26 0 40 1 0
                                         11 0 1 2 5 8 0 0 34 2 0 8 0 15 1 1 10
                                         6 0 1 1 9 26 0 1 2 11 8 6 0 39 1 10 6
                                         0 1 2 9 6 59 0 1 2 12 0 21 0 24 2 0 0
                                         21 0 22 2 0 8 0 15 1 1 0 26 0 1 1 0 8
                                         0 1 1 1 61 0 1 2 3 44 44 0 46 1 3 60 0
                                         1 2 9 8 19 0 38 2 2 0 0 57 1 2 2 0 0
                                         58 1 3 2 0 0 6 6 1 3 2 0 0 26 26 1 2 0
                                         8 0 0 1 1 0 8 0 9 0 0 0 10 2 0 6 0 56
                                         1 2 0 32 0 0 33 1 0 8 0 1 2 11 15 6 0
                                         16 2 9 15 19 0 20 1 0 0 0 49 1 7 50 0
                                         54 1 0 11 0 12 2 5 8 0 0 30 2 9 8 19 0
                                         37 2 13 8 0 0 31 1 9 15 0 48)))))
           '|lookupComplete|)) 
