
(/VERSIONCHECK 2) 

(DEFUN |LAMBDA;lambda;Nni$;1| (|n1| $) (CONS 0 (LIST |n1|))) 

(PUT '|LAMBDA;lambda;UT$;2| '|SPADreplace| '(XLAM (|var|) (CONS 1 |var|))) 

(DEFUN |LAMBDA;lambda;UT$;2| (|var| $) (CONS 1 |var|)) 

(DEFUN |LAMBDA;lambda;3$;3| (|x| |y| $) (CONS 2 (CONS |x| |y|))) 

(DEFUN |LAMBDA;lambda;$UT$;4| (|x| |t1| $)
  (PROG (|lt|)
    (RETURN
     (SEQ (LETT |lt| (CONS 3 (CONS |x| |t1|)) |LAMBDA;lambda;$UT$;4|)
          (EXIT (SPADCALL |lt| (QREFELT $ 12))))))) 

(DEFUN |LAMBDA;getChildren;$L;5| (|n| $)
  (PROG (#1=#:G171 #2=#:G155)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| (QREFELT $ 15))
          (PROGN (LETT #1# NIL . #3=(|LAMBDA;getChildren;$L;5|)) (GO #1#))))
        (COND
         ((QEQCAR |n| 2)
          (PROGN
           (LETT #1# (LIST (QCAR (CDR |n|)) (QCDR (CDR |n|))) . #3#)
           (GO #1#))))
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (LIST
                  (QCAR
                   (PROG2 (LETT #2# |n| . #3#)
                       (QCDR #2#)
                     (|check_union| (QEQCAR #2# 3)
                                    (|Record| (|:| |c3| $)
                                              (|:| |nm| (QREFELT $ 6)))
                                    #2#))))
                 . #3#)
           (GO #1#))))
        (EXIT NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;atom?;$B;6| (|n| $)
  (COND ((QEQCAR |n| 0) 'T) ('T (QEQCAR |n| 1)))) 

(PUT '|LAMBDA;isCompound?;$B;7| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 2))) 

(DEFUN |LAMBDA;isCompound?;$B;7| (|n| $) (QEQCAR |n| 2)) 

(PUT '|LAMBDA;isLambda?;$B;8| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 3))) 

(DEFUN |LAMBDA;isLambda?;$B;8| (|n| $) (QEQCAR |n| 3)) 

(PUT '|LAMBDA;isBoundNode?;$B;9| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 0))) 

(DEFUN |LAMBDA;isBoundNode?;$B;9| (|n| $) (QEQCAR |n| 0)) 

(PUT '|LAMBDA;isFreeNode?;$B;10| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 1))) 

(DEFUN |LAMBDA;isFreeNode?;$B;10| (|n| $) (QEQCAR |n| 1)) 

(DEFUN |LAMBDA;getBoundValue;$Nni;11| (|n| $)
  (PROG (#1=#:G179)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (PROGN
           (LETT #1# (QCAR (CDR |n|)) |LAMBDA;getBoundValue;$Nni;11|)
           (GO #1#))))
        (EXIT 0)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;getVariable;$UT;12| (|n| $)
  (PROG (#1=#:G182 #2=#:G155)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 1)
          (PROGN
           (LETT #1# (CDR |n|) . #3=(|LAMBDA;getVariable;$UT;12|))
           (GO #1#))))
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (QCDR
                  (PROG2 (LETT #2# |n| . #3#)
                      (QCDR #2#)
                    (|check_union| (QEQCAR #2# 3)
                                   (|Record| (|:| |c3| $)
                                             (|:| |nm| (QREFELT $ 6)))
                                   #2#)))
                 . #3#)
           (GO #1#))))
        (EXIT (SPADCALL "error" (QREFELT $ 24)))))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;freeVariable?| (|n| |s| $)
  (PROG (#1=#:G195)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 1)
          (COND
           ((SPADCALL (CDR |n|) |s| (QREFELT $ 26))
            (PROGN (LETT #1# 'NIL . #2=(|LAMBDA;freeVariable?|)) (GO #1#))))))
        (COND
         ((QEQCAR |n| 3)
          (COND
           ((NULL (|LAMBDA;freeVariable?| (QCAR (CDR |n|)) |s| $))
            (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
        (COND
         ((QEQCAR |n| 2)
          (COND
           ((|LAMBDA;freeVariable?| (QCAR (CDR |n|)) |s| $)
            (COND
             ((NULL (|LAMBDA;freeVariable?| (QCDR (CDR |n|)) |s| $))
              (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))))
           ('T (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;freeVariable?| (|n| |i| $)
  (PROG (#1=#:G208)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (COND
           ((EQL (QCAR (CDR |n|)) |i|)
            (PROGN (LETT #1# 'NIL . #2=(|LAMBDA;freeVariable?|)) (GO #1#))))))
        (COND
         ((QEQCAR |n| 3)
          (COND
           ((NULL (|LAMBDA;freeVariable?| (QCAR (CDR |n|)) (+ |i| 1) $))
            (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
        (COND
         ((QEQCAR |n| 2)
          (COND
           ((|LAMBDA;freeVariable?| (QCAR (CDR |n|)) |i| $)
            (COND
             ((NULL (|LAMBDA;freeVariable?| (QCDR (CDR |n|)) |i| $))
              (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))))
           ('T (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;free?;$B;15| (|n| $)
  (PROG (#1=#:G211)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1# (|LAMBDA;freeVariable?| (QCAR (CDR |n|)) 0 $)
                 |LAMBDA;free?;$B;15|)
           (GO #1#))))
        (|sayBrightly|
         (STRCONC "warning free called on non-lambda term"
                  (SPADCALL |n| (QREFELT $ 27))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;parseLambdaTerm| (|t1| |pin| $)
  (PROG (|p1| |ex| |r2| #1=#:G230 |ch| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|LAMBDA;parseLambdaTerm|))
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "\\")))
              (SEQ (|error| "lambda term must start with \\")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |p1| (+ |p1| 1) . #2#)
            (COND
             ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30)) (QREFELT $ 31))
              (SEQ (|error| "lambda term not complete")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |r| (SPADCALL |t1| |p1| (QREFELT $ 33)) . #2#)
            (LETT |p1| (QCDR |r|) . #2#) (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((NULL (|eql_SI| |ch| (|STR_to_CHAR| ".")))
              (SEQ (|error| "lambda term must have .")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |p1| (+ |p1| 1) . #2#)
            (COND
             ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30)) (QREFELT $ 31))
              (SEQ (|error| "lambda term must contain something")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |r2| (SPADCALL |t1| |p1| (QREFELT $ 34)) . #2#)
            (LETT |ex| (QCAR |r2|) . #2#) (LETT |p1| (QCDR |r2|) . #2#)
            (EXIT (CONS (SPADCALL |ex| (QCAR |r|) (QREFELT $ 13)) |p1|))))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;parseBracketTerm| (|t1| |pin| $)
  (PROG (|p1| #1=#:G241 |ch| |trm| |r2|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|LAMBDA;parseBracketTerm|))
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "(")))
              (SEQ (|error| "bracket term must start with (")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |p1| (+ |p1| 1) . #2#)
            (COND
             ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30)) (QREFELT $ 31))
              (SEQ (|error| "opening but no closing bracket")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |r2| (SPADCALL |t1| |p1| (QREFELT $ 34)) . #2#)
            (LETT |trm| (QCAR |r2|) . #2#) (LETT |p1| (QCDR |r2|) . #2#)
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((NULL (|eql_SI| |ch| (|STR_to_CHAR| ")")))
              (SEQ (|error| "can't find closing bracket")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 (LIST 0)) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |p1| (+ |p1| 1) . #2#) (EXIT (CONS |trm| |p1|))))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;parseVariableTerm| (|t1| |pin| $)
  (PROG (|ch| #1=#:G256 |p1| |inx|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|LAMBDA;parseVariableTerm|))
            (LETT |inx| 0 . #2#) (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (SEQ G190 (COND ((NULL (SPADCALL |ch| (QREFELT $ 36))) (GO G191)))
                 (SEQ
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "0"))
                    (LETT |inx| (* |inx| 10) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "1"))
                    (LETT |inx| (+ (* |inx| 10) 1) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "2"))
                    (LETT |inx| (+ (* |inx| 10) 2) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "3"))
                    (LETT |inx| (+ (* |inx| 10) 3) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "4"))
                    (LETT |inx| (+ (* |inx| 10) 4) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "5"))
                    (LETT |inx| (+ (* |inx| 10) 5) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "6"))
                    (LETT |inx| (+ (* |inx| 10) 6) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "7"))
                    (LETT |inx| (+ (* |inx| 10) 7) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "8"))
                    (LETT |inx| (+ (* |inx| 10) 8) . #2#)))
                  (COND
                   ((|eql_SI| |ch| (|STR_to_CHAR| "9"))
                    (LETT |inx| (+ (* |inx| 10) 9) . #2#)))
                  (LETT |p1| (+ |p1| 1) . #2#)
                  (COND
                   ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30))
                              (QREFELT $ 31))
                    (PROGN
                     (LETT #1# (CONS (SPADCALL |inx| (QREFELT $ 9)) |p1|)
                           . #2#)
                     (GO #1#))))
                  (EXIT (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS (SPADCALL |inx| (QREFELT $ 9)) |p1|))))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;parseTerm;SNniR;19| (|t1| |pin| $)
  (PROG (|res| |p1| |r| #1=#:G274 |ch| |r2|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|LAMBDA;parseTerm;SNniR;19|))
            (LETT |res| (CONS 0 (LIST 0)) . #2#)
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (SEQ G190
                 (COND ((NULL (|eql_SI| |ch| (|STR_to_CHAR| " "))) (GO G191)))
                 (SEQ (LETT |p1| (+ |p1| 1) . #2#)
                      (COND
                       ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30))
                                  (QREFELT $ 31))
                        (PROGN (LETT #1# (CONS |res| |p1|) . #2#) (GO #1#))))
                      (EXIT (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (LETT |r| (CONS |res| |p1|) . #2#)
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| "\\"))
              (LETT |r| (|LAMBDA;parseLambdaTerm| |t1| |p1| $) . #2#)))
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| "("))
              (LETT |r| (|LAMBDA;parseBracketTerm| |t1| |p1| $) . #2#)))
            (COND
             ((SPADCALL |ch| (QREFELT $ 36))
              (LETT |r| (|LAMBDA;parseVariableTerm| |t1| |p1| $) . #2#)))
            (LETT |res| (QCAR |r|) . #2#) (LETT |p1| (QCDR |r|) . #2#)
            (COND
             ((SPADCALL |ch| (QREFELT $ 37))
              (SEQ (LETT |r2| (SPADCALL |t1| |p1| (QREFELT $ 33)) . #2#)
                   (LETT |res| (SPADCALL (QCAR |r2|) (QREFELT $ 10)) . #2#)
                   (EXIT (LETT |p1| (QCDR |r2|) . #2#)))))
            (COND
             ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30)) (QREFELT $ 31))
              (PROGN (LETT #1# (CONS |res| |p1|) . #2#) (GO #1#))))
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| " "))
              (SEQ (LETT |p1| (+ |p1| 1) . #2#)
                   (COND
                    ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 30))
                               (QREFELT $ 31))
                     (PROGN (LETT #1# (CONS |res| |p1|) . #2#) (GO #1#))))
                   (LETT |r| (SPADCALL |t1| |p1| (QREFELT $ 34)) . #2#)
                   (LETT |p1| (QCDR |r|) . #2#)
                   (EXIT
                    (LETT |res| (SPADCALL |res| (QCAR |r|) (QREFELT $ 11))
                          . #2#)))))
            (EXIT (CONS |res| |p1|))))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;parseLambda;S$;20| (|t1| $)
  (PROG (|r| #1=#:G275)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL |t1|
                      (PROG1
                          (LETT #1# (SPADCALL |t1| (QREFELT $ 38))
                                . #2=(|LAMBDA;parseLambda;S$;20|))
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      (QREFELT $ 34))
            . #2#)
      (EXIT (QCAR |r|)))))) 

(DEFUN |LAMBDA;toStringConven;$LS;21| (|n| |boundL| $)
  (PROG (|s| |boundL2| |varName| #1=#:G286 |i|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |s| "" . #2=(|LAMBDA;toStringConven;$LS;21|))
            (COND
             ((QEQCAR |n| 0)
              (SEQ (LETT |i| (+ (QCAR (CDR |n|)) 1) . #2#)
                   (COND
                    ((SPADCALL |i| 0 (QREFELT $ 40))
                     (COND
                      ((SPADCALL |i| (LENGTH |boundL|) (QREFELT $ 41))
                       (PROGN
                        (LETT #1# (SPADCALL |boundL| |i| (QREFELT $ 43)) . #2#)
                        (GO #1#))))))
                   (EXIT (LETT |s| (STRINGIMAGE (QCAR (CDR |n|))) . #2#)))))
            (COND
             ((QEQCAR |n| 1)
              (LETT |s| (SPADCALL (CDR |n|) (QREFELT $ 44)) . #2#)))
            (COND
             ((QEQCAR |n| 2)
              (LETT |s|
                    (SPADCALL
                     (LIST "("
                           (SPADCALL (QCAR (CDR |n|)) |boundL| (QREFELT $ 45))
                           " "
                           (SPADCALL (QCDR (CDR |n|)) |boundL| (QREFELT $ 45))
                           ")")
                     (QREFELT $ 46))
                    . #2#)))
            (COND
             ((QEQCAR |n| 3)
              (SEQ
               (LETT |varName| (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 44))
                     . #2#)
               (SEQ G190
                    (COND
                     ((NULL (SPADCALL |varName| |boundL| (QREFELT $ 47)))
                      (GO G191)))
                    (SEQ (EXIT (LETT |varName| (STRCONC |varName| "'") . #2#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (LETT |boundL2| (SPADCALL |boundL| |varName| (QREFELT $ 48))
                     . #2#)
               (EXIT
                (LETT |s|
                      (SPADCALL
                       (LIST "(\\" |varName| "."
                             (SPADCALL (QCAR (CDR |n|)) |boundL2|
                                       (QREFELT $ 45))
                             ")")
                       (QREFELT $ 46))
                      . #2#)))))
            (EXIT |s|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;toString;$S;22| (|n| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|LAMBDA;toString;$S;22|))
          (COND
           ((QEQCAR |n| 0) (LETT |s| (STRINGIMAGE (QCAR (CDR |n|))) . #1#)))
          (COND
           ((QEQCAR |n| 1)
            (LETT |s| (SPADCALL (CDR |n|) (QREFELT $ 49)) . #1#)))
          (COND
           ((QEQCAR |n| 2)
            (LETT |s|
                  (SPADCALL
                   (LIST "(" (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 27)) " "
                         (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 27)) ")")
                   (QREFELT $ 46))
                  . #1#)))
          (COND
           ((QEQCAR |n| 3)
            (LETT |s|
                  (SPADCALL
                   (LIST "(\\" (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 49)) "."
                         (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 27)) ")")
                   (QREFELT $ 46))
                  . #1#)))
          (EXIT |s|))))) 

(DEFUN |LAMBDA;subst;4$;23| (|n| |a| |b| $)
  (PROG (#1=#:G300 #2=#:G155)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| |b| (QREFELT $ 50))
          (PROGN (LETT #1# |a| . #3=(|LAMBDA;subst;4$;23|)) (GO #1#))))
        (COND
         ((QEQCAR |n| 2)
          (PROGN
           (LETT #1#
                 (SPADCALL (SPADCALL (QCAR (CDR |n|)) |a| |b| (QREFELT $ 51))
                           (SPADCALL (QCDR (CDR |n|)) |a| |b| (QREFELT $ 51))
                           (QREFELT $ 11))
                 . #3#)
           (GO #1#))))
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (SPADCALL
                   (QCAR
                    (PROG2 (LETT #2# |n| . #3#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 3)
                                     (|Record| (|:| |c3| $)
                                               (|:| |nm| (QREFELT $ 6)))
                                     #2#)))
                   |a| |b| (QREFELT $ 51))
                  (QCDR
                   (PROG2 (LETT #2# |n| . #3#)
                       (QCDR #2#)
                     (|check_union| (QEQCAR #2# 3)
                                    (|Record| (|:| |c3| $)
                                              (|:| |nm| (QREFELT $ 6)))
                                    #2#)))
                  (QREFELT $ 13))
                 . #3#)
           (GO #1#))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;bindTerm| (|n| |i| |s| $)
  (PROG (#1=#:G311 #2=#:G154 #3=#:G153)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (PROGN
           (LETT #1# (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 9))
                 . #4=(|LAMBDA;bindTerm|))
           (GO #1#))))
        (COND
         ((QEQCAR |n| 1)
          (SEQ
           (COND
            ((SPADCALL
              (PROG2 (LETT #3# |n| . #4#)
                  (QCDR #3#)
                (|check_union| (QEQCAR #3# 1) (QREFELT $ 6) #3#))
              |s| (QREFELT $ 26))
             (PROGN (LETT #1# (SPADCALL |i| (QREFELT $ 9)) . #4#) (GO #1#))))
           (EXIT
            (PROGN
             (LETT #1#
                   (SPADCALL
                    (PROG2 (LETT #3# |n| . #4#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 1) (QREFELT $ 6) #3#))
                    (QREFELT $ 10))
                   . #4#)
             (GO #1#))))))
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (CONS 3
                       (CONS
                        (|LAMBDA;bindTerm| (QCAR (CDR |n|)) (+ |i| 1) |s| $)
                        (QCDR (CDR |n|))))
                 . #4#)
           (GO #1#))))
        (COND
         ((QEQCAR |n| 2)
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (|LAMBDA;bindTerm|
                   (QCAR
                    (PROG2 (LETT #2# |n| . #4#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 2)
                                     (|Record| (|:| |c1| $) (|:| |c2| $))
                                     #2#)))
                   |i| |s| $)
                  (|LAMBDA;bindTerm|
                   (QCDR
                    (PROG2 (LETT #2# |n| . #4#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 2)
                                     (|Record| (|:| |c1| $) (|:| |c2| $))
                                     #2#)))
                   |i| |s| $)
                  (QREFELT $ 11))
                 . #4#)
           (GO #1#))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;bind;2$;25| (|n| $)
  (PROG (#1=#:G314)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (CONS 3
                       (CONS
                        (|LAMBDA;bindTerm| (QCAR (CDR |n|)) 0 (QCDR (CDR |n|))
                         $)
                        (QCDR (CDR |n|))))
                 |LAMBDA;bind;2$;25|)
           (GO #1#))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;unbindTerm| (|n| |i| |s| $)
  (PROG (#1=#:G325 #2=#:G154 #3=#:G155)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (SEQ
           (COND
            ((EQL (QCAR (CDR |n|)) |i|)
             (PROGN
              (LETT #1# (SPADCALL |s| (QREFELT $ 10))
                    . #4=(|LAMBDA;unbindTerm|))
              (GO #1#))))
           (EXIT
            (PROGN
             (LETT #1# (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 9)) . #4#)
             (GO #1#))))))
        (COND
         ((QEQCAR |n| 1)
          (PROGN
           (LETT #1# (SPADCALL (CDR |n|) (QREFELT $ 10)) . #4#)
           (GO #1#))))
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (CONS 3
                       (CONS
                        (|LAMBDA;unbindTerm|
                         (QCAR
                          (PROG2 (LETT #3# |n| . #4#)
                              (QCDR #3#)
                            (|check_union| (QEQCAR #3# 3)
                                           (|Record| (|:| |c3| $)
                                                     (|:| |nm| (QREFELT $ 6)))
                                           #3#)))
                         (+ |i| 1) |s| $)
                        (QCDR
                         (PROG2 (LETT #3# |n| . #4#)
                             (QCDR #3#)
                           (|check_union| (QEQCAR #3# 3)
                                          (|Record| (|:| |c3| $)
                                                    (|:| |nm| (QREFELT $ 6)))
                                          #3#)))))
                 . #4#)
           (GO #1#))))
        (COND
         ((QEQCAR |n| 2)
          (PROGN
           (LETT #1#
                 (SPADCALL
                  (|LAMBDA;unbindTerm|
                   (QCAR
                    (PROG2 (LETT #2# |n| . #4#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 2)
                                     (|Record| (|:| |c1| $) (|:| |c2| $))
                                     #2#)))
                   |i| |s| $)
                  (|LAMBDA;unbindTerm|
                   (QCDR
                    (PROG2 (LETT #2# |n| . #4#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 2)
                                     (|Record| (|:| |c1| $) (|:| |c2| $))
                                     #2#)))
                   |i| |s| $)
                  (QREFELT $ 11))
                 . #4#)
           (GO #1#))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;unbind;2$;27| (|n| $)
  (PROG (#1=#:G328)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (CONS 3
                       (CONS
                        (|LAMBDA;unbindTerm| (QCAR (CDR |n|)) 0
                         (QCDR (CDR |n|)) $)
                        (QCDR (CDR |n|))))
                 |LAMBDA;unbind;2$;27|)
           (GO #1#))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;redux;2$;28| (|n| $)
  (PROG (#1=#:G341 |boundVarName| #2=#:G155 |term2| |term1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| (QREFELT $ 15))
          (PROGN (LETT #1# |n| . #3=(|LAMBDA;redux;2$;28|)) (GO #1#))))
        (COND
         ((QEQCAR |n| 2)
          (SEQ (LETT |term1| (QCAR (CDR |n|)) . #3#)
               (LETT |term2| (QCDR (CDR |n|)) . #3#)
               (COND
                ((SPADCALL |term1| (QREFELT $ 19))
                 (SEQ
                  (LETT |boundVarName|
                        (SPADCALL
                         (QCDR
                          (PROG2 (LETT #2# |term1| . #3#)
                              (QCDR #2#)
                            (|check_union| (QEQCAR #2# 3)
                                           (|Record| (|:| |c3| $)
                                                     (|:| |nm| (QREFELT $ 6)))
                                           #2#)))
                         (QREFELT $ 44))
                        . #3#)
                  (EXIT
                   (PROGN
                    (LETT #1#
                          (SPADCALL |term1| |term2| (SPADCALL 0 (QREFELT $ 9))
                                    (QREFELT $ 51))
                          . #3#)
                    (GO #1#))))))
               (EXIT
                (PROGN
                 (LETT #1#
                       (SPADCALL (SPADCALL |term1| (QREFELT $ 53))
                                 (SPADCALL |term2| (QREFELT $ 53))
                                 (QREFELT $ 11))
                       . #3#)
                 (GO #1#))))))
        (COND
         ((QEQCAR |n| 3)
          (PROGN
           (LETT #1#
                 (SPADCALL (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 53))
                           (QCDR (CDR |n|)) (QREFELT $ 13))
                 . #3#)
           (GO #1#))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;=;2$B;29| (|x| |y| $)
  (PROG (#1=#:G359)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |x| 0)
          (COND
           ((QEQCAR |y| 0)
            (SEQ
             (COND
              ((EQL (QCAR (CDR |x|)) (QCAR (CDR |y|)))
               (PROGN (LETT #1# 'T . #2=(|LAMBDA;=;2$B;29|)) (GO #1#))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((QEQCAR |y| 1)
            (SEQ
             (COND
              ((SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 26))
               (PROGN (LETT #1# 'T . #2#) (GO #1#))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (COND
         ((QEQCAR |x| 2)
          (COND
           ((QEQCAR |y| 2)
            (SEQ
             (COND
              ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|)) (QREFELT $ 50))
               (COND
                ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|)) (QREFELT $ 50))
                 (PROGN (LETT #1# 'T . #2#) (GO #1#))))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (COND
         ((QEQCAR |x| 3)
          (COND
           ((QEQCAR |y| 3)
            (SEQ
             (COND
              ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|)) (QREFELT $ 50))
               (PROGN (LETT #1# 'T . #2#) (GO #1#))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |LAMBDA;coerce;$Of;30| (|n| $)
  (SPADCALL (SPADCALL |n| NIL (QREFELT $ 45)) (QREFELT $ 55))) 

(DECLAIM (NOTINLINE |Lambda;|)) 

(DEFUN |Lambda| (#1=#:G361)
  (PROG ()
    (RETURN
     (PROG (#2=#:G362)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache| '|Lambda|)
                                           '|domainEqualList|)
                . #3=(|Lambda|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|Lambda;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|Lambda|))))))))))) 

(DEFUN |Lambda;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|Lambda|))
      (LETT |dv$| (LIST '|Lambda| DV$1) . #1#)
      (LETT $ (GETREFV 57) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Lambda| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union|
                 (|:| |boundTerm|
                      (|Record| (|:| |varBound| (|NonNegativeInteger|))))
                 (|:| |freeTerm| |#1|)
                 (|:| |compoundTerm| (|Record| (|:| |c1| $) (|:| |c2| $)))
                 (|:| |lambdaTerm| (|Record| (|:| |c3| $) (|:| |nm| |#1|)))))
      $)))) 

(MAKEPROP '|Lambda| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |LAMBDA;lambda;Nni$;1|
              |LAMBDA;lambda;UT$;2| |LAMBDA;lambda;3$;3| |LAMBDA;bind;2$;25|
              |LAMBDA;lambda;$UT$;4| (|Boolean|) |LAMBDA;atom?;$B;6| (|List| $)
              |LAMBDA;getChildren;$L;5| |LAMBDA;isCompound?;$B;7|
              |LAMBDA;isLambda?;$B;8| |LAMBDA;isBoundNode?;$B;9|
              |LAMBDA;isFreeNode?;$B;10| |LAMBDA;getBoundValue;$Nni;11|
              (|String|) (0 . |var|) |LAMBDA;getVariable;$UT;12| (5 . =)
              |LAMBDA;toString;$S;22| |LAMBDA;free?;$B;15| (|Integer|)
              (11 . |maxIndex|) (16 . >)
              (|Record| (|:| |rft| $) (|:| |pout| 8)) (22 . |parseVarTerm|)
              |LAMBDA;parseTerm;SNniR;19| (|Character|) (28 . |digit?|)
              (33 . |alphabetic?|) (38 . |minIndex|) |LAMBDA;parseLambda;S$;20|
              (43 . >) (49 . <=) (|List| 23) (55 . |elt|) (61 . |getName|)
              |LAMBDA;toStringConven;$LS;21| (66 . |concat|) (71 . |member?|)
              (77 . |concat|) (83 . |toString|) |LAMBDA;=;2$B;29|
              |LAMBDA;subst;4$;23| |LAMBDA;unbind;2$;27| |LAMBDA;redux;2$;28|
              (|OutputForm|) (88 . |coerce|) |LAMBDA;coerce;$Of;30|)
           '#(|unbind| 93 |toStringConven| 98 |toString| 104 |subst| 109
              |redux| 116 |parseTerm| 121 |parseLambda| 127 |lambda| 132
              |isLambda?| 154 |isFreeNode?| 159 |isCompound?| 164
              |isBoundNode?| 169 |getVariable| 174 |getChildren| 179
              |getBoundValue| 184 |free?| 189 |coerce| 194 |bind| 199 |atom?|
              204 = 209)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 54))
                             (|makeByteWordVec2| 56
                                                 '(1 6 0 23 24 2 6 14 0 0 26 1
                                                   23 29 0 30 2 29 14 0 0 31 2
                                                   6 32 23 8 33 1 35 14 0 36 1
                                                   35 14 0 37 1 23 29 0 38 2 8
                                                   14 0 0 40 2 8 14 0 0 41 2 42
                                                   23 0 29 43 1 6 23 0 44 1 23
                                                   0 16 46 2 42 14 23 0 47 2 42
                                                   0 0 23 48 1 6 23 0 49 1 23
                                                   54 0 55 1 0 0 0 52 2 0 23 0
                                                   42 45 1 0 23 0 27 3 0 0 0 0
                                                   0 51 1 0 0 0 53 2 0 32 23 8
                                                   34 1 0 0 23 39 2 0 0 0 0 11
                                                   2 0 0 0 6 13 1 0 0 6 10 1 0
                                                   0 8 9 1 0 14 0 19 1 0 14 0
                                                   21 1 0 14 0 18 1 0 14 0 20 1
                                                   0 6 0 25 1 0 16 0 17 1 0 8 0
                                                   22 1 0 14 0 28 1 0 54 0 56 1
                                                   0 0 0 12 1 0 14 0 15 2 0 14
                                                   0 0 50)))))
           '|lookupComplete|)) 
