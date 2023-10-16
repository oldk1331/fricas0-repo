
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
         ((|k| NIL) (#1=#:G1250 NIL) (|i| NIL) (#2=#:G1249 NIL)
          (#3=#:G1248 NIL) (|r| ($)) (#4=#:G1242 NIL) (|h| (|Integer|))
          (|n| #5=(|NonNegativeInteger|)) (|m| #5#) (|l| (|Integer|)))
         (SEQ (LETT |l| (- (SPADCALL |sg| (QREFELT $ 39)) (QREFELT $ 6)))
              (LETT |m| (SPADCALL |s| (QREFELT $ 13)))
              (LETT |n| (SPADCALL |t| (QREFELT $ 13)))
              (LETT |h|
                    (COND
                     ((SPADCALL |sg| (QREFELT $ 40))
                      (- (SPADCALL |sg| (QREFELT $ 41)) (QREFELT $ 6)))
                     ('T (- (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 6)))))
              (COND
               ((OR (OR (< |l| 0) (>= |h| |m|)) (< |h| (- |l| 1)))
                (EXIT (|error| "index out of range"))))
              (LETT |r|
                    (SPADCALL
                     (PROG1 (LETT #4# (+ (- |m| (+ (- |h| |l|) 1)) |n|))
                       (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #4#))
                     (SPADCALL (QREFELT $ 43)) (QREFELT $ 9)))
              (SEQ (LETT |i| 0) (LETT #3# (- |l| 1)) (LETT |k| 0) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
                   (LETT |k| (PROG1 (|inc_SI| |k|) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) (LETT |k| |k|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |t| |i|))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (+ |h| 1)) (LETT #1# (- |m| 1)) (LETT |k| |k|)
                   G190 (COND ((> |i| #1#) (GO G191)))
                   (SEQ (EXIT (STR_SETELT |r| |k| (STR_ELT |s| |i|))))
                   (LETT |k| (PROG1 (+ |k| 1) (LETT |i| (+ |i| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |ISTRING;qsetelt!;$I2C;16|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (STR_SETELT |s| (- |i| (QREFELT $ 6)) |c|)) 

(SDEFUN |ISTRING;setelt!;$I2C;17|
        ((|s| $) (|i| |Integer|) (|c| . #1=(|Character|)) ($ . #1#))
        (COND
         ((OR (< |i| (QREFELT $ 6))
              (SPADCALL |i| (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 46)))
          (|error| "index out of range"))
         ('T (STR_SETELT |s| (- |i| (QREFELT $ 6)) |c|)))) 

(SDEFUN |ISTRING;substring?;2$IB;18|
        ((|part| $) (|whole| $) (|startpos| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G1261 NIL) (#2=#:G1262 NIL) (#3=#:G1263 NIL) (|ip| NIL)
          (|iw| NIL) (|nw| (|Integer|)) (|np| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |np| (QCSIZE |part|)) (LETT |nw| (QCSIZE |whole|))
                (LETT |startpos| (- |startpos| (QREFELT $ 6)))
                (EXIT
                 (COND ((< |startpos| 0) (|error| "index out of bounds"))
                       ((SPADCALL |np| (- |nw| |startpos|) (QREFELT $ 46)) NIL)
                       ('T
                        (SEQ
                         (SEQ
                          (EXIT
                           (SEQ (LETT |iw| |startpos|) (LETT |ip| 0)
                                (LETT #3# (- |np| 1)) G190
                                (COND ((|greater_SI| |ip| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (|eql_SI| (STR_ELT |part| |ip|)
                                               (STR_ELT |whole| |iw|)))
                                    (PROGN
                                     (LETT #1#
                                           (PROGN
                                            (LETT #2# NIL)
                                            (GO #4=#:G1260)))
                                     (GO #5=#:G1256))))))
                                (LETT |ip|
                                      (PROG1 (|inc_SI| |ip|)
                                        (LETT |iw| (+ |iw| 1))))
                                (GO G190) G191 (EXIT NIL)))
                          #5# (EXIT #1#))
                         (EXIT 'T)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;2$2I;19|
        ((|s| $) (|t| $) (|startpos| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((|r| (|Integer|)))
               (SEQ (LETT |startpos| (- |startpos| (QREFELT $ 6)))
                    (EXIT
                     (COND ((< |startpos| 0) (|error| "index out of bounds"))
                           ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                           (#2='T
                            (SEQ (LETT |r| (STRPOS |s| |t| |startpos| NIL))
                                 (EXIT
                                  (COND ((EQ |r| NIL) (- (QREFELT $ 6) 1))
                                        (#2# (+ |r| (QREFELT $ 6)))))))))))) 

(SDEFUN |ISTRING;position;C$2I;20|
        ((|c| |Character|) (|t| $) (|startpos| . #1=(|Integer|)) ($ . #1#))
        (SPROG ((#2=#:G1274 NIL) (#3=#:G1275 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |startpos| (- |startpos| (QREFELT $ 6)))
                      (EXIT
                       (COND ((< |startpos| 0) (|error| "index out of bounds"))
                             ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                             ('T
                              (SEQ
                               (SEQ (LETT |r| |startpos|)
                                    (LETT #3# (|sub_SI| (QCSIZE |t|) 1)) G190
                                    (COND ((> |r| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((|eql_SI| (STR_ELT |t| |r|) |c|)
                                        (PROGN
                                         (LETT #2# (+ |r| (QREFELT $ 6)))
                                         (GO #4=#:G1273))))))
                                    (LETT |r| (+ |r| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (- (QREFELT $ 6) 1))))))))
                #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;position;Cc$2I;21|
        ((|cc| |CharacterClass|) (|t| $) (|startpos| . #1=(|Integer|))
         ($ . #1#))
        (SPROG ((#2=#:G1282 NIL) (#3=#:G1283 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |startpos| (- |startpos| (QREFELT $ 6)))
                      (EXIT
                       (COND ((< |startpos| 0) (|error| "index out of bounds"))
                             ((>= |startpos| (QCSIZE |t|)) (- (QREFELT $ 6) 1))
                             ('T
                              (SEQ
                               (SEQ (LETT |r| |startpos|)
                                    (LETT #3# (|sub_SI| (QCSIZE |t|) 1)) G190
                                    (COND ((> |r| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (STR_ELT |t| |r|) |cc|
                                                  (QREFELT $ 51))
                                        (PROGN
                                         (LETT #2# (+ |r| (QREFELT $ 6)))
                                         (GO #4=#:G1281))))))
                                    (LETT |r| (+ |r| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (- (QREFELT $ 6) 1))))))))
                #4# (EXIT #2#)))) 

(SDEFUN |ISTRING;suffix?;2$B;22| ((|s| $) (|t| $) ($ |Boolean|))
        (SPROG ((|n| #1=(|Integer|)) (|m| #1#))
               (SEQ (LETT |m| (SPADCALL |s| (QREFELT $ 42)))
                    (LETT |n| (SPADCALL |t| (QREFELT $ 42)))
                    (EXIT
                     (COND ((SPADCALL |m| |n| (QREFELT $ 46)) NIL)
                           ('T
                            (SPADCALL |s| |t| (- (+ (QREFELT $ 6) |n|) |m|)
                                      (QREFELT $ 48)))))))) 

(SDEFUN |ISTRING;split;$CL;23| ((|s| $) (|c| |Character|) ($ |List| $))
        (SPROG
         ((|l| (|List| $)) (#1=#:G1294 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1293 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 42)))
              (SEQ (LETT |i| (QREFELT $ 6)) (LETT #2# |n|) G190
                   (COND
                    ((OR (> |i| #2#)
                         (NULL
                          (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 54)) |c|)))
                     (GO G191)))
                   (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                   (EXIT NIL))
              (LETT |l| (SPADCALL (QREFELT $ 56)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |i| |n| (QREFELT $ 57))
                        (>= (LETT |j| (SPADCALL |c| |s| |i| (QREFELT $ 50)))
                            (QREFELT $ 6)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |l|
                          (SPADCALL
                           (SPADCALL |s|
                                     (SPADCALL |i| (- |j| 1) (QREFELT $ 20))
                                     (QREFELT $ 21))
                           |l| (QREFELT $ 58)))
                    (EXIT
                     (SEQ (LETT |i| |j|) (LETT #1# |n|) G190
                          (COND
                           ((OR (> |i| #1#)
                                (NULL
                                 (|eql_SI| (SPADCALL |s| |i| (QREFELT $ 54))
                                           |c|)))
                            (GO G191)))
                          (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |i| |n| (QREFELT $ 57))
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                                 (QREFELT $ 21))
                       |l| (QREFELT $ 58)))))
              (EXIT (SPADCALL |l| (QREFELT $ 59)))))) 

(SDEFUN |ISTRING;split;$CcL;24| ((|s| $) (|cc| |CharacterClass|) ($ |List| $))
        (SPROG
         ((|l| (|List| $)) (#1=#:G1302 NIL) (|i| NIL) (|j| (|Integer|))
          (#2=#:G1301 NIL) (|n| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 42)))
              (SEQ (LETT |i| (QREFELT $ 6)) (LETT #2# |n|) G190
                   (COND
                    ((OR (> |i| #2#)
                         (NULL
                          (SPADCALL (SPADCALL |s| |i| (QREFELT $ 54)) |cc|
                                    (QREFELT $ 51))))
                     (GO G191)))
                   (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                   (EXIT NIL))
              (LETT |l| (SPADCALL (QREFELT $ 56)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |i| |n| (QREFELT $ 57))
                        (>= (LETT |j| (SPADCALL |cc| |s| |i| (QREFELT $ 52)))
                            (QREFELT $ 6)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ
                    (LETT |l|
                          (SPADCALL
                           (SPADCALL |s|
                                     (SPADCALL |i| (- |j| 1) (QREFELT $ 20))
                                     (QREFELT $ 21))
                           |l| (QREFELT $ 58)))
                    (EXIT
                     (SEQ (LETT |i| |j|) (LETT #1# |n|) G190
                          (COND
                           ((OR (> |i| #1#)
                                (NULL
                                 (SPADCALL (SPADCALL |s| |i| (QREFELT $ 54))
                                           |cc| (QREFELT $ 51))))
                            (GO G191)))
                          (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |i| |n| (QREFELT $ 57))
                (LETT |l|
                      (SPADCALL
                       (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                                 (QREFELT $ 21))
                       |l| (QREFELT $ 58)))))
              (EXIT (SPADCALL |l| (QREFELT $ 59)))))) 

(SDEFUN |ISTRING;leftTrim;$Cc$;25| ((|s| $) (|cc| |CharacterClass|) ($ $))
        (SPROG ((#1=#:G1306 NIL) (|i| NIL) (|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 42)))
                    (SEQ (LETT |i| (QREFELT $ 6)) (LETT #1# |n|) G190
                         (COND
                          ((OR (> |i| #1#)
                               (NULL
                                (SPADCALL (SPADCALL |s| |i| (QREFELT $ 54))
                                          |cc| (QREFELT $ 51))))
                           (GO G191)))
                         (SEQ (EXIT 0)) (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (SPADCALL |s| (SPADCALL |i| |n| (QREFELT $ 20))
                               (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;rightTrim;$Cc$;26| ((|s| $) (|cc| |CharacterClass|) ($ $))
        (SPROG ((#1=#:G1310 NIL) (|j| NIL))
               (SEQ
                (SEQ (LETT |j| (SPADCALL |s| (QREFELT $ 42)))
                     (LETT #1# (QREFELT $ 6)) G190
                     (COND
                      ((OR (< |j| #1#)
                           (NULL
                            (SPADCALL (SPADCALL |s| |j| (QREFELT $ 54)) |cc|
                                      (QREFELT $ 51))))
                       (GO G191)))
                     (SEQ (EXIT 0)) (LETT |j| (+ |j| -1)) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (SPADCALL |s|
                           (SPADCALL (SPADCALL |s| (QREFELT $ 28)) |j|
                                     (QREFELT $ 20))
                           (QREFELT $ 21)))))) 

(SDEFUN |ISTRING;concat;L$;27| ((|l| |List| $) ($ $))
        (SPROG
         ((|i| (|Integer|)) (#1=#:G1319 NIL) (|s| NIL) (|t| ($))
          (#2=#:G1312 NIL) (#3=#:G1311 #4=(|NonNegativeInteger|))
          (#5=#:G1313 #4#) (#6=#:G1318 NIL))
         (SEQ
          (LETT |t|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |s| NIL) (LETT #6# |l|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #5# (SPADCALL |s| (QREFELT $ 13)))
                          (COND (#2# (LETT #3# (+ #3# #5#)))
                                ('T (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#2# #3#) ('T 0)))
                 (SPADCALL (QREFELT $ 43)) (QREFELT $ 9)))
          (LETT |i| (QREFELT $ 6))
          (SEQ (LETT |s| NIL) (LETT #1# |l|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (SPADCALL |t| |s| |i| (QREFELT $ 65))
                    (EXIT (LETT |i| (+ |i| (SPADCALL |s| (QREFELT $ 13))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |t|)))) 

(SDEFUN |ISTRING;copyInto!;2$I$;28| ((|y| $) (|x| $) (|s| |Integer|) ($ $))
        (SPROG ((|n| #1=(|NonNegativeInteger|)) (|m| #1#))
               (SEQ (LETT |m| (SPADCALL |x| (QREFELT $ 13)))
                    (LETT |n| (SPADCALL |y| (QREFELT $ 13)))
                    (LETT |s| (- |s| (QREFELT $ 6)))
                    (COND
                     ((OR (< |s| 0) (SPADCALL (+ |s| |m|) |n| (QREFELT $ 46)))
                      (EXIT (|error| "index out of range"))))
                    (RPLACSTR |y| |s| |m| |x| 0 |m|) (EXIT |y|)))) 

(SDEFUN |ISTRING;qelt;$IC;29| ((|s| $) (|i| |Integer|) ($ |Character|))
        (STR_ELT |s| (- |i| (QREFELT $ 6)))) 

(SDEFUN |ISTRING;elt;$IC;30| ((|s| $) (|i| |Integer|) ($ |Character|))
        (COND
         ((OR (< |i| (QREFELT $ 6))
              (SPADCALL |i| (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 46)))
          (|error| "index out of range"))
         ('T (STR_ELT |s| (- |i| (QREFELT $ 6)))))) 

(SDEFUN |ISTRING;elt;$Us$;31|
        ((|s| $) (|sg| |UniversalSegment| (|Integer|)) ($ $))
        (SPROG ((|h| #1=(|Integer|)) (|l| #1#))
               (SEQ (LETT |l| (- (SPADCALL |sg| (QREFELT $ 39)) (QREFELT $ 6)))
                    (LETT |h|
                          (COND
                           ((SPADCALL |sg| (QREFELT $ 40))
                            (- (SPADCALL |sg| (QREFELT $ 41)) (QREFELT $ 6)))
                           ('T
                            (- (SPADCALL |s| (QREFELT $ 42)) (QREFELT $ 6)))))
                    (COND
                     ((OR (< |l| 0) (>= |h| (SPADCALL |s| (QREFELT $ 13))))
                      (EXIT (|error| "index out of bounds"))))
                    (EXIT (SUBSTRING |s| |l| (MAX 0 (+ (- |h| |l|) 1))))))) 

(SDEFUN |ISTRING;hashUpdate!;Hs$Hs;32|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(SDEFUN |ISTRING;match?;2$CB;33|
        ((|pattern| $) (|target| $) (|dontcare| |Character|) ($ |Boolean|))
        (SPROG
         ((|q| (|NonNegativeInteger|)) (#1=#:G1337 NIL)
          (|p| #2=(|NonNegativeInteger|)) (|i| #2#) (#3=#:G1346 NIL)
          (#4=#:G1336 NIL) (|s| ($)) (#5=#:G1335 NIL) (#6=#:G1332 NIL)
          (|m| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL |pattern| (QREFELT $ 42)))
                (LETT |p|
                      (PROG1
                          (LETT #6#
                                (SPADCALL |dontcare| |pattern|
                                          (LETT |m|
                                                (SPADCALL |pattern|
                                                          (QREFELT $ 28)))
                                          (QREFELT $ 50)))
                        (|check_subtype2| (>= #6# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #6#)))
                (EXIT
                 (COND
                  ((EQL |p| (- |m| 1))
                   (SPADCALL |pattern| |target| (QREFELT $ 14)))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |p| |m| (QREFELT $ 70))
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |pattern|
                                    (SPADCALL |m| (- |p| 1) (QREFELT $ 20))
                                    (QREFELT $ 21))
                          |target| (QREFELT $ 71)))
                        (EXIT NIL)))))
                    (LETT |i| |p|)
                    (LETT |q|
                          (PROG1
                              (LETT #5#
                                    (SPADCALL |dontcare| |pattern| (+ |p| 1)
                                              (QREFELT $ 50)))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |q| (- |m| 1) (QREFELT $ 70)))
                           (GO G191)))
                         (SEQ
                          (LETT |s|
                                (SPADCALL |pattern|
                                          (SPADCALL (+ |p| 1) (- |q| 1)
                                                    (QREFELT $ 20))
                                          (QREFELT $ 21)))
                          (LETT |i|
                                (PROG1
                                    (LETT #4#
                                          (SPADCALL |s| |target| |i|
                                                    (QREFELT $ 49)))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))
                          (EXIT
                           (COND
                            ((EQL |i| (- |m| 1))
                             (PROGN (LETT #3# NIL) (GO #7=#:G1345)))
                            ('T
                             (SEQ
                              (LETT |i| (+ |i| (SPADCALL |s| (QREFELT $ 13))))
                              (LETT |p| |q|)
                              (EXIT
                               (LETT |q|
                                     (PROG1
                                         (LETT #1#
                                               (SPADCALL |dontcare| |pattern|
                                                         (+ |q| 1)
                                                         (QREFELT $ 50)))
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|)
                                                         #1#)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND
                     ((SPADCALL |p| |n| (QREFELT $ 70))
                      (COND
                       ((NULL
                         (SPADCALL
                          (SPADCALL |pattern|
                                    (SPADCALL (+ |p| 1) |n| (QREFELT $ 20))
                                    (QREFELT $ 21))
                          |target| (QREFELT $ 53)))
                        (EXIT NIL)))))
                    (EXIT 'T)))))))
          #7# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |IndexedString;|)) 

(DEFUN |IndexedString| (#1=#:G1356)
  (SPROG NIL
         (PROG (#2=#:G1357)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedString|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedString;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedString|)))))))))) 

(DEFUN |IndexedString;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1353 NIL) (#2=#:G1354 NIL) (#3=#:G1355 NIL) ($ NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|IndexedString| DV$1))
    (LETT $ (GETREFV 84))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Character|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Character|)
                                                       '(|BasicType|))
                                        (LETT #3#
                                              (|HasCategory| (|Character|)
                                                             '(|Comparable|)))
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Character|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Character|)
                                                        '(|Evalable|
                                                          (|Character|)))
                                         #2#)
                                        (OR
                                         (|HasCategory| (|Character|)
                                                        '(|BasicType|))
                                         #3#
                                         (|HasCategory| (|Character|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (OR #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #1#
                                              (|HasCategory| (|Character|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #1# #3#
                                            (|HasCategory| (|Character|)
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|IndexedString| (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 4096))
    (AND (|HasCategory| $ '(|finiteAggregate|)) (|augmentPredVector| $ 8192))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|BasicType|))
         (|augmentPredVector| $ 16384))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| $ '(|shallowlyMutable|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| $ 65536))
    (AND (|HasCategory| $ '(|finiteAggregate|))
         (|HasCategory| (|Character|) '(|OrderedSet|))
         (|augmentPredVector| $ 131072))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|))))
     (|augmentPredVector| $ 262144))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| $ 524288))
    (AND
     (OR (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
         (AND (|HasCategory| $ '(|finiteAggregate|))
              (|HasCategory| (|Character|) '(|OrderedSet|)))
         #1#)
     (|augmentPredVector| $ 1048576))
    (AND
     (OR
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|BasicType|)))
      (AND (|HasCategory| $ '(|finiteAggregate|)) #3#)
      (AND (|HasCategory| $ '(|finiteAggregate|))
           (|HasCategory| (|Character|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| $ 2097152))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|IndexedString| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Character|) |ISTRING;new;NniC$;1| |ISTRING;empty;$;2|
              (|Boolean|) |ISTRING;empty?;$B;3| |ISTRING;#;$Nni;4|
              |ISTRING;=;2$B;5| |ISTRING;<;2$B;6| |ISTRING;concat;3$;7|
              |ISTRING;copy;2$;8| (|Integer|) (|UniversalSegment| 18)
              (0 . SEGMENT) |ISTRING;elt;$Us$;31| (6 . SEGMENT)
              |ISTRING;insert;2$I$;9| (|String|) (|OutputForm|)
              (11 . |outputForm|) |ISTRING;coerce;$Of;10|
              |ISTRING;minIndex;$I;11| (|CharacterClass|) (16 . |upperCase|)
              (20 . |upperCase|) (|Mapping| 8 8) (25 . |map!|)
              |ISTRING;upperCase!;2$;12| (31 . |lowerCase|) (35 . |lowerCase|)
              |ISTRING;lowerCase!;2$;13| |ISTRING;latex;$S;14| (40 . |low|)
              (45 . |hasHi|) (50 . |high|) (55 . |maxIndex|) (60 . |space|)
              |ISTRING;replace;$Us2$;15| |ISTRING;qsetelt!;$I2C;16| (64 . >)
              |ISTRING;setelt!;$I2C;17| |ISTRING;substring?;2$IB;18|
              |ISTRING;position;2$2I;19| |ISTRING;position;C$2I;20|
              (70 . |member?|) |ISTRING;position;Cc$2I;21|
              |ISTRING;suffix?;2$B;22| |ISTRING;elt;$IC;30| (|List| $$)
              (76 . |empty|) (80 . <=) (86 . |concat|) (92 . |reverse!|)
              (|List| $) |ISTRING;split;$CL;23| |ISTRING;split;$CcL;24|
              |ISTRING;leftTrim;$Cc$;25| |ISTRING;rightTrim;$Cc$;26|
              |ISTRING;copyInto!;2$I$;28| |ISTRING;concat;L$;27|
              |ISTRING;qelt;$IC;29| (|HashState|)
              |ISTRING;hashUpdate!;Hs$Hs;32| (97 . ~=) (103 . |prefix?|)
              |ISTRING;match?;2$CB;33| (|List| 8) (|List| 75) (|Equation| 8)
              (|Mapping| 8 8 8) (|Mapping| 11 8 8) (|SingleInteger|)
              (|InputForm|) (|Mapping| 11 8) (|Void|) (|Union| 8 '"failed")
              (|List| 18))
           '#(~= 109 |upperCase!| 115 |upperCase| 120 |trim| 125 |swap!| 137
              |suffix?| 144 |substring?| 150 |split| 157 |sorted?| 169 |sort!|
              180 |sort| 191 |smaller?| 202 |size?| 208 |setelt!| 214 |select|
              228 |sample| 234 |rightTrim| 238 |reverse!| 250 |reverse| 255
              |replace| 260 |removeDuplicates| 267 |remove| 272 |reduce| 284
              |qsetelt!| 305 |qelt| 312 |prefix?| 318 |position| 324 |parts|
              357 |new| 362 |more?| 368 |minIndex| 374 |min| 379 |merge| 390
              |members| 403 |member?| 408 |maxIndex| 414 |max| 419 |match?| 436
              |map!| 443 |map| 449 |lowerCase!| 462 |lowerCase| 467 |less?| 472
              |leftTrim| 478 |latex| 490 |insert| 495 |indices| 509 |index?|
              514 |hashUpdate!| 520 |hash| 526 |first| 531 |find| 542 |fill!|
              548 |every?| 554 |eval| 560 |eq?| 586 |entry?| 592 |entries| 598
              |empty?| 603 |empty| 608 |elt| 612 |delete| 637 |count| 649
              |copyInto!| 661 |copy| 668 |convert| 673 |construct| 678 |concat|
              683 |coerce| 706 |any?| 716 >= 722 > 728 = 734 <= 740 < 746 |#|
              752)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 1 0 6 0 0 8 10 0 0 0 0 0 8 9 12 1
                                  2))
            (CONS
             '#(|StringAggregate&| |OneDimensionalArrayAggregate&| NIL
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                NIL |InnerEvalable&| |BasicType&| NIL |PartialOrder&| NIL)
             (CONS
              '#((|StringAggregate|) (|OneDimensionalArrayAggregate| 8)
                 (|FiniteLinearAggregate| 8) (|LinearAggregate| 8)
                 (|IndexedAggregate| 18 8) (|Collection| 8) (|OrderedSet|)
                 (|HomogeneousAggregate| 8) (|Comparable|) (|Aggregate|)
                 (|EltableAggregate| 18 8) (|Evalable| 8) (|SetCategory|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 19 $$)
                 (|Type|) (|Eltable| 18 8) (|InnerEvalable| 8 8) (|BasicType|)
                 (|CoercibleTo| 25) (|PartialOrder|) (|ConvertibleTo| 79))
              (|makeByteWordVec2| 83
                                  '(2 19 0 18 18 20 1 19 0 18 22 1 25 0 24 26 0
                                    29 0 30 1 8 0 0 31 2 0 0 32 0 33 0 29 0 35
                                    1 8 0 0 36 1 19 18 0 39 1 19 11 0 40 1 19
                                    18 0 41 1 0 18 0 42 0 8 0 43 2 18 11 0 0 46
                                    2 29 11 8 0 51 0 55 0 56 2 18 11 0 0 57 2
                                    55 0 2 0 58 1 55 0 0 59 2 18 11 0 0 70 2 0
                                    11 0 0 71 2 22 11 0 0 1 1 0 0 0 34 1 0 0 0
                                    1 2 15 0 0 8 1 2 0 0 0 29 1 3 13 81 0 18 18
                                    1 2 0 11 0 0 53 3 0 11 0 0 18 48 2 0 60 0 8
                                    61 2 0 60 0 29 62 1 18 11 0 1 2 14 11 77 0
                                    1 1 17 0 0 1 2 16 0 77 0 1 1 18 0 0 1 2 14
                                    0 77 0 1 2 19 11 0 0 1 2 0 11 0 7 1 3 13 8
                                    0 19 8 1 3 13 8 0 18 8 47 2 14 0 80 0 1 0 0
                                    0 1 2 15 0 0 8 1 2 0 0 0 29 64 1 16 0 0 1 1
                                    14 0 0 1 3 0 0 0 19 0 44 1 15 0 0 1 2 15 0
                                    8 0 1 2 14 0 80 0 1 4 15 8 76 0 8 8 1 2 14
                                    8 76 0 1 3 14 8 76 0 8 1 3 13 8 0 18 8 45 2
                                    0 8 0 18 67 2 0 11 0 0 71 3 15 18 8 0 18 50
                                    2 15 18 8 0 1 2 14 18 80 0 1 3 0 18 0 0 18
                                    49 3 0 18 29 0 18 52 1 14 73 0 1 2 0 0 7 8
                                    9 2 0 11 0 7 1 1 3 18 0 28 2 18 0 0 0 1 1
                                    18 8 0 1 2 18 0 0 0 1 3 14 0 77 0 0 1 1 14
                                    73 0 1 2 15 11 8 0 1 1 3 18 0 42 2 18 0 0 0
                                    1 1 18 8 0 1 2 14 8 77 0 1 3 0 11 0 0 8 72
                                    2 13 0 32 0 33 3 0 0 76 0 0 1 2 0 0 32 0 1
                                    1 0 0 0 37 1 0 0 0 1 2 0 11 0 7 1 2 15 0 0
                                    8 1 2 0 0 0 29 63 1 20 24 0 38 3 0 0 8 0 18
                                    1 3 0 0 0 0 18 23 1 0 83 0 1 2 0 11 18 0 1
                                    2 20 68 68 0 69 1 20 78 0 1 1 3 8 0 1 2 0 0
                                    0 7 1 2 0 82 80 0 1 2 13 0 0 8 1 2 14 11 80
                                    0 1 3 8 0 0 8 8 1 3 8 0 0 73 73 1 2 8 0 0
                                    74 1 2 8 0 0 75 1 2 0 11 0 0 1 2 15 11 8 0
                                    1 1 0 73 0 1 1 0 11 0 12 0 0 0 10 2 0 0 0 0
                                    1 2 0 0 0 19 21 3 0 8 0 18 8 1 2 0 8 0 18
                                    54 2 0 0 0 19 1 2 0 0 0 18 1 2 15 7 8 0 1 2
                                    14 7 80 0 1 3 16 0 0 0 18 65 1 0 0 0 17 1 2
                                    79 0 1 1 0 0 73 1 1 0 0 60 66 2 0 0 8 0 1 2
                                    0 0 0 0 16 2 0 0 0 8 1 1 21 25 0 27 1 0 0 8
                                    1 2 14 11 80 0 1 2 18 11 0 0 1 2 18 11 0 0
                                    1 2 22 11 0 0 14 2 18 11 0 0 1 2 18 11 0 0
                                    15 1 14 7 0 13)))))
           '|lookupComplete|)) 
