
(PUT '|ISTRING;new;NniC$;1| '|SPADreplace| '|make_full_CVEC|) 

(SDEFUN |ISTRING;new;NniC$;1|
        ((|n| |NonNegativeInteger|) (|c| |Character|) ($ $))
        (|make_full_CVEC| |n| |c|)) 

(PUT '|ISTRING;empty;$;2| '|SPADreplace| '(XLAM NIL (|make_full_CVEC| 0))) 

(SDEFUN |ISTRING;empty;$;2| (($ $)) (|make_full_CVEC| 0)) 

(SDEFUN |ISTRING;empty?;$B;3| ((|s| $) ($ |Boolean|)) (EQL (QCSIZE |s|) 0)) 

(PUT '|ISTRING;#;$Nni;4| '|SPADreplace| 'QCSIZE) 

(SDEFUN |ISTRING;#;$Nni;4| ((|s| $) ($ |NonNegativeInteger|)) (QCSIZE |s|)) 

(PUT '|ISTRING;=;2$B;5| '|SPADreplace| 'EQUAL) 

(SDEFUN |ISTRING;=;2$B;5| ((|s| $) (|t| $) ($ |Boolean|)) (EQUAL |s| |t|)) 

(PUT '|ISTRING;<;2$B;6| '|SPADreplace| '(XLAM (|s| |t|) (CGREATERP |t| |s|))) 

(SDEFUN |ISTRING;<;2$B;6| ((|s| $) (|t| $) ($ |Boolean|)) (CGREATERP |t| |s|)) 

(PUT '|ISTRING;concat;3$;7| '|SPADreplace| 'STRCONC) 

(SDEFUN |ISTRING;concat;3$;7| ((|s| $) (|t| $) ($ $)) (STRCONC |s| |t|)) 

(PUT '|ISTRING;copy;2$;8| '|SPADreplace| 'COPY-SEQ) 

(SDEFUN |ISTRING;copy;2$;8| ((|s| $) ($ $)) (COPY-SEQ |s|)) 

(SDEFUN |ISTRING;insert;2$I$;9| ((|s| $) (|t| $) (|i| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL
          (SPADCALL |s| (SPADCALL (QREFELT $ 6) (- |i| 1) (QREFELT $ 20))
                    (QREFELT $ 21))
          |t| (QREFELT $ 16))
         (SPADCALL |s| (SPADCALL |i| (QREFELT $ 22)) (QREFELT $ 21))
         (QREFELT $ 16))) 

(SDEFUN |ISTRING;coerce;$Of;10| ((|s| $) ($ |OutputForm|))
        (SPADCALL |s| (QREFELT $ 26))) 

(SDEFUN |ISTRING;minIndex;$I;11| ((|s| $) ($ |Integer|)) (QREFELT $ 6)) 

(SDEFUN |ISTRING;upperCase!;2$;12| ((|s| $) ($ $))
        (SPADCALL (ELT $ 31) |s| (QREFELT $ 33))) 

(SDEFUN |ISTRING;lowerCase!;2$;13| ((|s| $) ($ $))
        (SPADCALL (ELT $ 36) |s| (QREFELT $ 33))) 

(SDEFUN |ISTRING;latex;$S;14| ((|s| $) ($ |String|))
        (STRCONC "\\mbox{``" (STRCONC |s| "''}"))) 

(SDEFUN |ISTRING;replace;$Us2$;15|
        ((|s| $) (|sg| |UniversalSegment| (|Integer|)) (|t| $) ($ $))
        (SPROG
         ((|k| NIL) (#1=#:G1243 NIL) (|i| NIL) (#2=#:G1242 NIL)
          (#3=#:G1241 NIL) (|r| ($)) (#4=#:G1235 NIL) (|h| (|Integer|))
          (|n| #5=(|NonNegativeInteger|)) (|m| #5#) (|l| (|Integer|)))
         (SEQ
          (LETT |l| (- (SPADCALL |sg| (QREFELT $ 39)) (QREFELT $ 6))
                . #6=(|ISTRING;replace;$Us2$;15|))
          (LETT |m| (SPADCALL |s| (QREFELT $ 13)) . #6#)
          (LETT |n| (SPADCALL |t| (QREFELT $ 13)) . #6#)
          (LETT |h|
                (COND
                 ((SPADCALL |sg| (QREFELT $ 40))
                  (- (SPADCALL |sg| (QREFELT $ 41)) (QREFELT $ 6)))
                 ('T (- (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 6))))
                . #6#)
          (COND
           ((OR (OR (< |l| 0) (>= |h| |m|)) (< |h| (- |l| 1)))
            (EXIT (|error| "index out of range"))))
          (LETT |r|
                (SPADCALL
                 (PROG1 (LETT #4# (+ (- |m| (+ (- |h| |l|) 1)) |n|) . #6#)
                   (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #4#))
                 (STR_ELT "   " 0) (QREFELT $ 9))
                . #6#)
          (SEQ (LETT |i| 0 . #6#) (LETT #3# (- |l| 1) . #6#) (LETT |k| 0 . #6#)
               G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
               (LETT |k| (PROG1 (|inc_SI| |k|) (LETT |i| (|inc_SI| |i|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 0 . #6#) (LETT #2# (- |n| 1) . #6#)
               (LETT |k| |k| . #6#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |t| |i|))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (|inc_SI| |i|) . #6#))
                     . #6#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| (+ |h| 1) . #6#) (LETT #1# (- |m| 1) . #6#)
               (LETT |k| |k| . #6#) G190 (COND ((> |i| #1#) (GO G191)))
               (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
               (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1) . #6#)) . #6#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |r|)))) 

(SDEFUN |ISTRING;qsetelt!;$I2C;16|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (STR_SETELT |s| (- |i| (QREFELT $ 6)) |c|)) 

(SDEFUN |ISTRING;setelt!;$I2C;17|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (COND
         ((OR (< |i| (QREFELT $ 6))
              (SPADCALL |i| (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 45)))
          (|error| "index out of range"))
         ('T (STR_SETELT |s| (- |i| (QREFELT $ 6)) |c|)))) 

(SDEFUN |ISTRING;substring?;2$IB;18|
        ((|part| $) (|whole| $) (|startpos| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G1254 NIL) (#2=#:G1255 NIL) (#3=#:G1256 NIL) (|ip| NIL)
          (|iw| NIL) (|nw| (|Integer|)) (|np| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (QCSIZE |part|) . #4=(|ISTRING;substring?;2$IB;18|))
                (LETT |nw| (QCSIZE |whole|) . #4#)
                (LETT |startpos| (- |startpos| (QREFELT $ 6)) . #4#)
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((SPADCALL |np| (- |nw| |startpos|) (QREFELT $ 45)) NIL)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |iw| |startpos| . #4#)
                                (LETT |ip| 0 . #4#) (LETT #3# (- |np| 1) . #4#)
                                G190 (COND ((|greater_SI| |ip| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (|eql_SI| (STR_ELT |part| |ip|)
                                               (STR_ELT |whole| |iw|)))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# NIL . #4#)
                                            (GO #5=#:G1253))
                                           . #4#)
                                     (GO #6=#:G1249))))))
                                (LETT |ip|
                                      (PROG1 (|inc_SI| |ip|)
                                        (LETT |iw| (+ |iw| 1) . #4#))
                                      . #4#)
                                (GO G190) G191 (EXIT NIL)))
                          #6# (EXIT #1#))
                         (EXIT 'T)))))))
          #5# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;2$2I;19|
        ((|s| $) (|t| $) (|startpos| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((|r| (|Integer|)))
               (SEQ
                (LETT |startpos| (- |startpos| (QREFELT $ 6))
                      . #2=(|ISTRING;position;2$2I;19|))
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                       (#3='T
                        (SEQ (LETT |r| (STRPOS |s| |t| |startpos| NIL) . #2#)
                             (EXIT
                              (COND ((EQ |r| NIL) (- (QREFELT $ 6) 1))
                                    (#3# (+ |r| (QREFELT $ 6)))))))))))) 

(SDEFUN |ISTRING;position;C$2I;20|
        ((|c| |Character|) (|t| $) (|startpos| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((#2=#:G1267 NIL) (#3=#:G1268 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |startpos| (- |startpos| (QREFELT $ 6))
                        . #4=(|ISTRING;position;C$2I;20|))
                  (EXIT
                   (COND ((< |startpos| 0) (|error| "index out of bounds"))
                         ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                         ('T
                          (SEQ
                           (SEQ (LETT |r| |startpos| . #4#)
                                (LETT #3# (|sub_SI| (QCSIZE |t|) 1) . #4#) G190
                                (COND ((> |r| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((|eql_SI| (STR_ELT |t| |r|) |c|)
                                    (PROGN
                                     (LETT #2# (+ |r| (QREFELT $ 6)) . #4#)
                                     (GO #5=#:G1266))))))
                                (LETT |r| (+ |r| 1) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (- (QREFELT $ 6) 1))))))))
                #5# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;Cc$2I;21|
        ((|cc| |CharacterClass|) (|t| $) (|startpos| . #1=(|Integer|))
         ($ . #1#))
        (SPROG ((#2=#:G1275 NIL) (#3=#:G1276 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |startpos| (- |startpos| (QREFELT $ 6))
                        . #4=(|ISTRING;position;Cc$2I;21|))
                  (EXIT
                   (COND ((< |startpos| 0) (|error| "index out of bounds"))
                         ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                         ('T
                          (SEQ
                           (SEQ (LETT |r| |startpos| . #4#)
                                (LETT #3# (|sub_SI| (QCSIZE |t|) 1) . #4#) G190
                                (COND ((> |r| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL (STR_ELT |t| |r|) |cc|
                                              (QREFELT $ 50))
                                    (PROGN
                                     (LETT #2# (+ |r| (QREFELT $ 6)) . #4#)
                                     (GO #5=#:G1274))))))
                                (LETT |r| (+ |r| 1) . #4#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (- (QREFELT $ 6) 1))))))))
                #5# (EXIT #2#)))) 

(SDEFUN |ISTRING;suffix?;2$B;22| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG ((|n| #1=(|Integer|)) (|m| #1#))
               (SEQ
                (LETT |m| (SPADCALL |s| (QREFELT $ 42))
                      . #2=(|ISTRING;suffix?;2$B;22|))
                (LETT |n| (SPADCALL |t| (QREFELT $ 42)) . #2#)
                (EXIT
                 (COND ((SPADCALL |m| |n| (QREFELT $ 45)) NIL)
                       ('T
                        (SPADCALL |s| |t| (- (+ (QREFELT $ 6) |n|) |m|)
                                  (QREFELT $ 47)))))))) 

(SDEFUN |ISTRING;split;$CL;23| ((|s| $) (|c| |Character|) ($ |List| $))
        (SPROG
         ((|l| (|List| $)) (#1=#:G1287 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1286 NIL) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                . #3=(|ISTRING;split;$CL;23|))
          (SEQ (LETT |i| (QREFELT $ 6) . #3#) (LETT #2# |n| . #3#) G190
               (COND
                ((OR (> |i| #2#)
                     (NULL (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 53)) |c|)))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
               (EXIT NIL))
          (LETT |l| (SPADCALL (QREFELT $ 55)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |n| (QREFELT $ 56))
                    (>= (LETT |j| (SPADCALL |c| |s| |i| (QREFELT $ 49)) . #3#)
                        (QREFELT $ 6)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| (- |j| 1) (QREFELT $ 20))
                                 (QREFELT $ 21))
                       |l| (QREFELT $ 57))
                      . #3#)
                (EXIT
                 (SEQ (LETT |i| |j| . #3#) (LETT #1# |n| . #3#) G190
                      (COND
                       ((OR (> |i| #1#)
                            (NULL
                             (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 53)) |c|)))
                        (GO G191)))
                      (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |i| |n| (QREFELT $ 56))
            (LETT |l|
                  (SPADCALL
                   (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                             (QREFELT $ 21))
                   |l| (QREFELT $ 57))
                  . #3#)))
          (EXIT (SPADCALL |l| (QREFELT $ 58)))))) 

(SDEFUN |ISTRING;split;$CcL;24| ((|s| $) (|cc| |CharacterClass|) ($ |List| $))
        (SPROG
         ((|l| (|List| $)) (#1=#:G1295 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1294 NIL) (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                . #3=(|ISTRING;split;$CcL;24|))
          (SEQ (LETT |i| (QREFELT $ 6) . #3#) (LETT #2# |n| . #3#) G190
               (COND
                ((OR (> |i| #2#)
                     (NULL
                      (SPADCALL (SPADCALL |s| |i| (QREFELT $ 53)) |cc|
                                (QREFELT $ 50))))
                 (GO G191)))
               (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
               (EXIT NIL))
          (LETT |l| (SPADCALL (QREFELT $ 55)) . #3#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |i| |n| (QREFELT $ 56))
                    (>= (LETT |j| (SPADCALL |cc| |s| |i| (QREFELT $ 51)) . #3#)
                        (QREFELT $ 6)))
                   ('T NIL)))
                 (GO G191)))
               (SEQ
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| (- |j| 1) (QREFELT $ 20))
                                 (QREFELT $ 21))
                       |l| (QREFELT $ 57))
                      . #3#)
                (EXIT
                 (SEQ (LETT |i| |j| . #3#) (LETT #1# |n| . #3#) G190
                      (COND
                       ((OR (> |i| #1#)
                            (NULL
                             (SPADCALL (SPADCALL |s| |i| (QREFELT $ 53)) |cc|
                                       (QREFELT $ 50))))
                        (GO G191)))
                      (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #3#) (GO G190) G191
                      (EXIT NIL))))
               NIL (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |i| |n| (QREFELT $ 56))
            (LETT |l|
                  (SPADCALL
                   (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                             (QREFELT $ 21))
                   |l| (QREFELT $ 57))
                  . #3#)))
          (EXIT (SPADCALL |l| (QREFELT $ 58)))))) 

(SDEFUN |ISTRING;leftTrim;$C$;25| ((|s| $) (|c| |Character|) ($ $))
        (SPROG ((#1=#:G1299 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                      . #2=(|ISTRING;leftTrim;$C$;25|))
                (SEQ (LETT |i| (QREFELT $ 6) . #2#) (LETT #1# |n| . #2#) G190
                     (COND
                      ((OR (> |i| #1#)
                           (NULL
                            (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 53)) |c|)))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;leftTrim;$Cc$;26| ((|s| $) (|cc| |CharacterClass|) ($ $))
        (SPROG ((#1=#:G1303 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (SPADCALL |s| (QREFELT $ 42))
                      . #2=(|ISTRING;leftTrim;$Cc$;26|))
                (SEQ (LETT |i| (QREFELT $ 6) . #2#) (LETT #1# |n| . #2#) G190
                     (COND
                      ((OR (> |i| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |s| |i| (QREFELT $ 53)) |cc|
                                      (QREFELT $ 50))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |i| (+ |i| 1) . #2#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;rightTrim;$C$;27| ((|s| $) (|c| |Character|) ($ $))
        (SPROG ((#1=#:G1307 NIL) (|j| NIL))
               (SEQ
                (SEQ
                 (LETT |j| (SPADCALL |s| (QREFELT $ 42))
                       . #2=(|ISTRING;rightTrim;$C$;27|))
                 (LETT #1# (QREFELT $ 6) . #2#) G190
                 (COND
                  ((OR (< |j| #1#)
                       (NULL (|eql_SI| (SPADCALL |s| |j| (QREFELT $ 53)) |c|)))
                   (GO G191)))
                 (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                 (EXIT NIL))
                (EXIT
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |s| (QREFELT $ 28)) |j|
                                     (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;rightTrim;$Cc$;28| ((|s| $) (|cc| |CharacterClass|) ($ $))
        (SPROG ((#1=#:G1311 NIL) (|j| NIL))
               (SEQ
                (SEQ
                 (LETT |j| (SPADCALL |s| (QREFELT $ 42))
                       . #2=(|ISTRING;rightTrim;$Cc$;28|))
                 (LETT #1# (QREFELT $ 6) . #2#) G190
                 (COND
                  ((OR (< |j| #1#)
                       (NULL
                        (SPADCALL (SPADCALL |s| |j| (QREFELT $ 53)) |cc|
                                  (QREFELT $ 50))))
                   (GO G191)))
                 (SEQ (EXIT 0)) (LETT |j| (+ |j| -1) . #2#) (GO G190) G191
                 (EXIT NIL))
                (EXIT
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |s| (QREFELT $ 28)) |j|
                                     (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;concat;L$;29| ((|l| |List| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1320 NIL) (|s| NIL) (|t| ($))
          (#2=#:G1313 NIL) (#3=#:G1312 #4=(|NonNegativeInteger|))
          (#5=#:G1314 #4#) (#6=#:G1319 NIL))
         (SEQ
          (LETT |t|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #7=(|ISTRING;concat;L$;29|))
                  (SEQ (LETT |s| NIL . #7#) (LETT #6# |l| . #7#) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#) . #7#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #5# (SPADCALL |s| (QREFELT $ 13)) . #7#)
                          (COND (#2# (LETT #3# (+ #3# #5#) . #7#))
                                ('T
                                 (PROGN
                                  (LETT #3# #5# . #7#)
                                  (LETT #2# 'T . #7#)))))))
                       (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) ('T 0)))
                 (STR_ELT "   " 0) (QREFELT $ 9))
                . #7#)
          (LETT |i| (QREFELT $ 6) . #7#)
          (SEQ (LETT |s| NIL . #7#) (LETT #1# |l| . #7#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #7#) NIL))
                 (GO G191)))
               (SEQ (SPADCALL |t| |s| |i| (QREFELT $ 66))
                    (EXIT
                     (LETT |i| (+ |i| (SPADCALL |s| (QREFELT $ 13))) . #7#)))
               (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT |t|)))) 

(SDEFUN |ISTRING;copyInto!;2$I$;30| ((|y| $) (|x| $) (|s| |Integer|) ($ $))
        (SPROG ((|n| #1=(|NonNegativeInteger|)) (|m| #1#))
               (SEQ
                (LETT |m| (SPADCALL |x| (QREFELT $ 13))
                      . #2=(|ISTRING;copyInto!;2$I$;30|))
                (LETT |n| (SPADCALL |y| (QREFELT $ 13)) . #2#)
                (LETT |s| (- |s| (QREFELT $ 6)) . #2#)
                (COND
                 ((OR (< |s| 0) (SPADCALL (+ |s| |m|) |n| (QREFELT $ 45)))
                  (EXIT (|error| "index out of range"))))
                (RPLACSTR |y| |s| |m| |x| 0 |m|) (EXIT |y|)))) 

(SDEFUN |ISTRING;qelt;$IC;31| ((|s| $) (|i| |Integer|) ($ |Character|))
        (STR_ELT |s| (- |i| (QREFELT $ 6)))) 

(SDEFUN |ISTRING;elt;$IC;32| ((|s| $) (|i| |Integer|) ($ |Character|))
        (COND
         ((OR (< |i| (QREFELT $ 6))
              (SPADCALL |i| (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 45)))
          (|error| "index out of range"))
         ('T (STR_ELT |s| (- |i| (QREFELT $ 6)))))) 

(SDEFUN |ISTRING;elt;$Us$;33|
        ((|s| $) (|sg| |UniversalSegment| (|Integer|)) ($ $))
        (SPROG ((|h| #1=(|Integer|)) (|l| #1#))
               (SEQ
                (LETT |l| (- (SPADCALL |sg| (QREFELT $ 39)) (QREFELT $ 6))
                      . #2=(|ISTRING;elt;$Us$;33|))
                (LETT |h|
                      (COND
                       ((SPADCALL |sg| (QREFELT $ 40))
                        (- (SPADCALL |sg| (QREFELT $ 41)) (QREFELT $ 6)))
                       ('T (- (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 6))))
                      . #2#)
                (COND
                 ((OR (< |l| 0) (>= |h| (SPADCALL |s| (QREFELT $ 13))))
                  (EXIT (|error| "index out of bounds"))))
                (EXIT (SUBSTRING |s| |l| (MAX 0 (+ (- |h| |l|) 1))))))) 

(SDEFUN |ISTRING;hashUpdate!;Hs$Hs;34|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |ISTRING;match?;2$CB;35|
        ((|pattern| $) (|target| $) (|dontcare| |Character|) ($ |Boolean|))
        (SPROG
         ((|q| (|NonNegativeInteger|)) (#1=#:G1338 NIL)
          (|p| #2=(|NonNegativeInteger|)) (|i| #2#) (#3=#:G1347 NIL)
          (#4=#:G1337 NIL) (|s| ($)) (#5=#:G1336 NIL) (#6=#:G1333 NIL)
          (|m| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |pattern| (QREFELT $ 42))
                  . #7=(|ISTRING;match?;2$CB;35|))
            (LETT |p|
                  (PROG1
                      (LETT #6#
                            (SPADCALL |dontcare| |pattern|
                                      (LETT |m|
                                            (SPADCALL |pattern| (QREFELT $ 28))
                                            . #7#)
                                      (QREFELT $ 49))
                            . #7#)
                    (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                      '(|Integer|) #6#))
                  . #7#)
            (EXIT
             (COND
              ((EQL |p| (- |m| 1))
               (SPADCALL |pattern| |target| (QREFELT $ 14)))
              ('T
               (SEQ
                (COND
                 ((SPADCALL |p| |m| (QREFELT $ 71))
                  (COND
                   ((NULL
                     (SPADCALL
                      (SPADCALL |pattern|
                                (SPADCALL |m| (- |p| 1) (QREFELT $ 20))
                                (QREFELT $ 21))
                      |target| (QREFELT $ 72)))
                    (EXIT NIL)))))
                (LETT |i| |p| . #7#)
                (LETT |q|
                      (PROG1
                          (LETT #5#
                                (SPADCALL |dontcare| |pattern| (+ |p| 1)
                                          (QREFELT $ 49))
                                . #7#)
                        (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #5#))
                      . #7#)
                (SEQ G190
                     (COND
                      ((NULL (SPADCALL |q| (- |m| 1) (QREFELT $ 71)))
                       (GO G191)))
                     (SEQ
                      (LETT |s|
                            (SPADCALL |pattern|
                                      (SPADCALL (+ |p| 1) (- |q| 1)
                                                (QREFELT $ 20))
                                      (QREFELT $ 21))
                            . #7#)
                      (LETT |i|
                            (PROG1
                                (LETT #4#
                                      (SPADCALL |s| |target| |i|
                                                (QREFELT $ 48))
                                      . #7#)
                              (|check_subtype2| (>= #4# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #4#))
                            . #7#)
                      (EXIT
                       (COND
                        ((EQL |i| (- |m| 1))
                         (PROGN (LETT #3# NIL . #7#) (GO #8=#:G1346)))
                        ('T
                         (SEQ
                          (LETT |i| (+ |i| (SPADCALL |s| (QREFELT $ 13)))
                                . #7#)
                          (LETT |p| |q| . #7#)
                          (EXIT
                           (LETT |q|
                                 (PROG1
                                     (LETT #1#
                                           (SPADCALL |dontcare| |pattern|
                                                     (+ |q| 1) (QREFELT $ 49))
                                           . #7#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 . #7#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |p| |n| (QREFELT $ 71))
                  (COND
                   ((NULL
                     (SPADCALL
                      (SPADCALL |pattern|
                                (SPADCALL (+ |p| 1) |n| (QREFELT $ 20))
                                (QREFELT $ 21))
                      |target| (QREFELT $ 52)))
                    (EXIT NIL)))))
                (EXIT 'T)))))))
          #8# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |IndexedString;|)) 

(DEFUN |IndexedString| (#1=#:G1359)
  (SPROG NIL
         (PROG (#2=#:G1360)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedString|)
                                               '|domainEqualList|)
                    . #3=(|IndexedString|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedString;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedString|)))))))))) 

(DEFUN |IndexedString;| (|#1|)
  (SPROG
   ((#1=#:G1358 NIL) (|pv$| NIL) (#2=#:G1354 NIL) (#3=#:G1355 NIL)
    (#4=#:G1357 NIL) (#5=#:G1356 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #6=(|IndexedString|))
    (LETT |dv$| (LIST '|IndexedString| DV$1) . #6#)
    (LETT $ (GETREFV 85) . #6#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Character|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Character|)
                                                       '(|OrderedSet|))
                                        (LETT #5#
                                              (|HasCategory| (|Character|)
                                                             '(|SetCategory|))
                                              . #6#)
                                        (OR
                                         (|HasCategory| (|Character|)
                                                        '(|OrderedSet|))
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| (|Character|)
                                                              '(|Evalable|
                                                                (|Character|)))
                                               (|HasCategory| (|Character|)
                                                              '(|SetCategory|)))
                                              . #6#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|Character|)
                                                         '(|Evalable|
                                                           (|Character|)))
                                          (|HasCategory| (|Character|)
                                                         '(|OrderedSet|)))
                                         #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #3#
                                              (|HasCategory| (|Character|)
                                                             '(|BasicType|))
                                              . #6#)
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #5#)
                                        (LETT #2#
                                              (|HasCategory| (|Character|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|)))
                                              . #6#)
                                        (OR #2# #4#)))
                    . #6#))
    (|haddProp| |$ConstructorCache| '|IndexedString| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
         (|augmentPredVector| $ 2048))
    (AND #1# #5# (|augmentPredVector| $ 4096))
    (AND #1# #3# (|augmentPredVector| $ 8192))
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 16384))
    (AND (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| $ 32768))
    (AND (OR (AND #1# #3#) #5#) (|augmentPredVector| $ 65536))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IndexedString| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Character|) |ISTRING;new;NniC$;1| |ISTRING;empty;$;2|
              (|Boolean|) |ISTRING;empty?;$B;3| |ISTRING;#;$Nni;4|
              |ISTRING;=;2$B;5| |ISTRING;<;2$B;6| |ISTRING;concat;3$;7|
              |ISTRING;copy;2$;8| (|Integer|) (|UniversalSegment| 18)
              (0 . SEGMENT) |ISTRING;elt;$Us$;33| (6 . SEGMENT)
              |ISTRING;insert;2$I$;9| (|String|) (|OutputForm|)
              (11 . |outputForm|) |ISTRING;coerce;$Of;10|
              |ISTRING;minIndex;$I;11| (|CharacterClass|) (16 . |upperCase|)
              (20 . |upperCase|) (|Mapping| 8 8) (25 . |map!|)
              |ISTRING;upperCase!;2$;12| (31 . |lowerCase|) (35 . |lowerCase|)
              |ISTRING;lowerCase!;2$;13| |ISTRING;latex;$S;14| (40 . |lo|)
              (45 . |hasHi|) (50 . |hi|) (55 . |maxIndex|)
              |ISTRING;replace;$Us2$;15| |ISTRING;qsetelt!;$I2C;16| (60 . >)
              |ISTRING;setelt!;$I2C;17| |ISTRING;substring?;2$IB;18|
              |ISTRING;position;2$2I;19| |ISTRING;position;C$2I;20|
              (66 . |member?|) |ISTRING;position;Cc$2I;21|
              |ISTRING;suffix?;2$B;22| |ISTRING;elt;$IC;32| (|List| $$)
              (72 . |empty|) (76 . <=) (82 . |concat|) (88 . |reverse!|)
              (|List| $) |ISTRING;split;$CL;23| |ISTRING;split;$CcL;24|
              |ISTRING;leftTrim;$C$;25| |ISTRING;leftTrim;$Cc$;26|
              |ISTRING;rightTrim;$C$;27| |ISTRING;rightTrim;$Cc$;28|
              |ISTRING;copyInto!;2$I$;30| |ISTRING;concat;L$;29|
              |ISTRING;qelt;$IC;31| (|HashState|)
              |ISTRING;hashUpdate!;Hs$Hs;34| (93 . ~=) (99 . |prefix?|)
              |ISTRING;match?;2$CB;35| (|List| 8) (|List| 76) (|Equation| 8)
              (|Mapping| 8 8 8) (|InputForm|) (|SingleInteger|)
              (|Mapping| 11 8) (|Mapping| 11 8 8) (|Void|)
              (|Union| 8 '"failed") (|List| 18))
           '#(~= 105 |upperCase!| 111 |upperCase| 116 |trim| 121 |swap!| 133
              |suffix?| 140 |substring?| 146 |split| 153 |sorted?| 165 |sort!|
              176 |sort| 187 |smaller?| 198 |size?| 204 |setelt!| 210 |select|
              224 |sample| 230 |rightTrim| 234 |reverse!| 246 |reverse| 251
              |replace| 256 |removeDuplicates| 263 |remove| 268 |reduce| 280
              |qsetelt!| 301 |qelt| 308 |prefix?| 314 |position| 320 |parts|
              353 |new| 358 |more?| 364 |minIndex| 370 |min| 375 |merge| 381
              |members| 394 |member?| 399 |maxIndex| 405 |max| 410 |match?| 416
              |map!| 423 |map| 429 |lowerCase!| 442 |lowerCase| 447 |less?| 452
              |leftTrim| 458 |latex| 470 |insert| 475 |indices| 489 |index?|
              494 |hashUpdate!| 500 |hash| 506 |first| 511 |find| 516 |fill!|
              522 |every?| 528 |eval| 534 |eq?| 560 |entry?| 566 |entries| 572
              |empty?| 577 |empty| 582 |elt| 586 |delete| 611 |count| 623
              |copyInto!| 635 |copy| 642 |convert| 647 |construct| 652 |concat|
              657 |coerce| 680 |any?| 690 >= 696 > 702 = 708 <= 714 < 720 |#|
              726)
           'NIL
           (CONS
            (|makeByteWordVec2| 11
                                '(0 0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 9 11
                                  2))
            (CONS
             '#(|StringAggregate&| |OneDimensionalArrayAggregate&|
                |FiniteLinearAggregate&| |LinearAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&| NIL
                NIL NIL NIL |InnerEvalable&| NIL |BasicType&| NIL
                |PartialOrder&|)
             (CONS
              '#((|StringAggregate|) (|OneDimensionalArrayAggregate| 8)
                 (|FiniteLinearAggregate| 8) (|LinearAggregate| 8)
                 (|IndexedAggregate| 18 8) (|Collection| 8) (|OrderedSet|)
                 (|HomogeneousAggregate| 8) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 18 8) (|Evalable| 8) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Type|)
                 (|Eltable| 18 8) (|InnerEvalable| 8 8) (|ConvertibleTo| 78)
                 (|BasicType|) (|CoercibleTo| 25) (|PartialOrder|))
              (|makeByteWordVec2| 84
                                  '(2 19 0 18 18 20 1 19 0 18 22 1 25 0 24 26 0
                                    29 0 30 1 8 0 0 31 2 0 0 32 0 33 0 29 0 35
                                    1 8 0 0 36 1 19 18 0 39 1 19 11 0 40 1 19
                                    18 0 41 1 0 18 0 42 2 18 11 0 0 45 2 29 11
                                    8 0 50 0 54 0 55 2 18 11 0 0 56 2 54 0 2 0
                                    57 1 54 0 0 58 2 18 11 0 0 71 2 0 11 0 0 72
                                    2 17 11 0 0 1 1 0 0 0 34 1 0 0 0 1 2 0 0 0
                                    29 1 2 0 0 0 8 1 3 15 82 0 18 18 1 2 0 11 0
                                    0 52 3 0 11 0 0 18 47 2 0 59 0 8 60 2 0 59
                                    0 29 61 1 2 11 0 1 2 0 11 81 0 1 1 16 0 0 1
                                    2 15 0 81 0 1 1 2 0 0 1 2 0 0 81 0 1 2 2 11
                                    0 0 1 2 0 11 0 7 1 3 15 8 0 19 8 1 3 15 8 0
                                    18 8 46 2 12 0 80 0 1 0 0 0 1 2 0 0 0 8 64
                                    2 0 0 0 29 65 1 15 0 0 1 1 0 0 0 1 3 0 0 0
                                    19 0 43 1 14 0 0 1 2 14 0 8 0 1 2 12 0 80 0
                                    1 4 14 8 77 0 8 8 1 3 12 8 77 0 8 1 2 12 8
                                    77 0 1 3 15 8 0 18 8 44 2 0 8 0 18 68 2 0
                                    11 0 0 72 3 8 18 8 0 18 49 2 8 18 8 0 1 3 0
                                    18 29 0 18 51 3 0 18 0 0 18 48 2 0 18 80 0
                                    1 1 12 74 0 1 2 0 0 7 8 9 2 0 11 0 7 1 1 7
                                    18 0 28 2 2 0 0 0 1 2 2 0 0 0 1 3 0 0 81 0
                                    0 1 1 12 74 0 1 2 14 11 8 0 1 1 7 18 0 42 2
                                    2 0 0 0 1 3 0 11 0 0 8 73 2 15 0 32 0 33 3
                                    0 0 77 0 0 1 2 0 0 32 0 1 1 0 0 0 37 1 0 0
                                    0 1 2 0 11 0 7 1 2 0 0 0 29 63 2 0 0 0 8 62
                                    1 3 24 0 38 3 0 0 8 0 18 1 3 0 0 0 0 18 23
                                    1 0 84 0 1 2 0 11 18 0 1 2 3 69 69 0 70 1 3
                                    79 0 1 1 7 8 0 1 2 0 83 80 0 1 2 15 0 0 8 1
                                    2 12 11 80 0 1 3 5 0 0 74 74 1 3 5 0 0 8 8
                                    1 2 5 0 0 75 1 2 5 0 0 76 1 2 0 11 0 0 1 2
                                    13 11 8 0 1 1 0 74 0 1 1 0 11 0 12 0 0 0 10
                                    2 0 0 0 0 1 2 0 0 0 19 21 2 0 8 0 18 53 3 0
                                    8 0 18 8 1 2 0 0 0 18 1 2 0 0 0 19 1 2 14 7
                                    8 0 1 2 12 7 80 0 1 3 15 0 0 0 18 66 1 0 0
                                    0 17 1 1 78 0 1 1 0 0 74 1 1 0 0 59 67 2 0
                                    0 0 0 16 2 0 0 0 8 1 2 0 0 8 0 1 1 10 25 0
                                    27 1 0 0 8 1 2 12 11 80 0 1 2 2 11 0 0 1 2
                                    2 11 0 0 1 2 17 11 0 0 14 2 2 11 0 0 1 2 2
                                    11 0 0 15 1 12 7 0 13)))))
           '|lookupComplete|)) 
