
(DEFUN |SKICOMB;ski;3$;1| (|x| |y| $) (CONS 1 (CONS |x| |y|))) 

(PUT '|SKICOMB;ski;UT$;2| '|SPADreplace| '(XLAM (|t1|) (CONS 2 |t1|))) 

(DEFUN |SKICOMB;ski;UT$;2| (|t1| $) (CONS 2 |t1|)) 

(DEFUN |SKICOMB;I;$;3| ($) (CONS 0 'I)) 

(DEFUN |SKICOMB;K;$;4| ($) (CONS 0 'K)) 

(DEFUN |SKICOMB;S;$;5| ($) (CONS 0 'S)) 

(DEFUN |SKICOMB;parseBracketTerm| (|t1| |pin| $)
  (PROG (|p1| #1=#:G158 |ch| |trm| |r2|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|SKICOMB;parseBracketTerm|))
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((NULL (|eql_SI| |ch| (|STR_to_CHAR| "(")))
              (SEQ (|error| "bracket term must start with (")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 'I) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |p1| (+ |p1| 1) . #2#)
            (COND
             ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 15)) (QREFELT $ 17))
              (SEQ (|error| "opening but no closing bracket")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 'I) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |r2| (SPADCALL |t1| |p1| (QREFELT $ 20)) . #2#)
            (LETT |trm| (QCAR |r2|) . #2#) (LETT |p1| (QCDR |r2|) . #2#)
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((NULL (|eql_SI| |ch| (|STR_to_CHAR| ")")))
              (SEQ (|error| "can't find closing bracket")
                   (EXIT
                    (PROGN
                     (LETT #1# (CONS (CONS 0 'I) |p1|) . #2#)
                     (GO #1#))))))
            (LETT |p1| (+ |p1| 1) . #2#) (EXIT (CONS |trm| |p1|))))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;parseCombinatorTerm| (|t1| |pin| $)
  (PROG (#1=#:G163 |ch| |p1|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|SKICOMB;parseCombinatorTerm|))
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| "I"))
              (PROGN (LETT #1# (CONS (CONS 0 'I) (+ |p1| 1)) . #2#) (GO #1#))))
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| "K"))
              (PROGN (LETT #1# (CONS (CONS 0 'K) (+ |p1| 1)) . #2#) (GO #1#))))
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| "S"))
              (PROGN (LETT #1# (CONS (CONS 0 'S) (+ |p1| 1)) . #2#) (GO #1#))))
            (|error| "invalid combinator")
            (EXIT (CONS (CONS 0 'I) (+ |p1| 1)))))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;parseOneTerm| (|t1| |pin| $)
  (PROG (|p1| |res| |r| |r2| |ch| #1=#:G176)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #2=(|SKICOMB;parseOneTerm|))
            (LETT |res| (CONS 0 'I) . #2#)
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)
            (SEQ G190
                 (COND ((NULL (|eql_SI| |ch| (|STR_to_CHAR| " "))) (GO G191)))
                 (SEQ (LETT |p1| (+ |p1| 1) . #2#)
                      (COND
                       ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 15))
                                  (QREFELT $ 17))
                        (PROGN (LETT #1# (CONS |res| |p1|) . #2#) (GO #1#))))
                      (EXIT (LETT |ch| (STR_ELT1 |t1| |p1|) . #2#)))
                 NIL (GO G190) G191 (EXIT NIL))
            (COND
             ((SPADCALL |ch| (QREFELT $ 22))
              (SEQ
               (COND
                ((SPADCALL |ch| (QREFELT $ 23))
                 (SEQ
                  (LETT |r| (|SKICOMB;parseCombinatorTerm| |t1| |p1| $) . #2#)
                  (LETT |res| (QCAR |r|) . #2#)
                  (EXIT (LETT |p1| (QCDR |r|) . #2#)))))
               (EXIT
                (COND
                 ((SPADCALL |ch| (QREFELT $ 24))
                  (SEQ (LETT |r2| (SPADCALL |t1| |p1| (QREFELT $ 25)) . #2#)
                       (LETT |res| (SPADCALL (QCAR |r2|) (QREFELT $ 9)) . #2#)
                       (EXIT (LETT |p1| (QCDR |r2|) . #2#)))))))))
            (COND
             ((|eql_SI| |ch| (|STR_to_CHAR| "("))
              (SEQ (LETT |r| (|SKICOMB;parseBracketTerm| |t1| |p1| $) . #2#)
                   (LETT |res| (QCAR |r|) . #2#)
                   (EXIT (LETT |p1| (QCDR |r|) . #2#)))))
            (EXIT (CONS |res| |p1|))))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;parseTerm;SNniR;9| (|t1| |pin| $)
  (PROG (|res| #1=#:G185 |i| |ch| |stck| |p1| |r| #2=#:G184)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |p1| |pin| . #3=(|SKICOMB;parseTerm;SNniR;9|))
            (LETT |r| (|SKICOMB;parseOneTerm| |t1| |p1| $) . #3#)
            (LETT |res| (QCAR |r|) . #3#) (LETT |p1| (QCDR |r|) . #3#)
            (COND
             ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 15)) (QREFELT $ 17))
              (PROGN (LETT #2# (CONS |res| |p1|) . #3#) (GO #2#))))
            (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#) (LETT |stck| NIL . #3#)
            (SEQ G190
                 (COND
                  ((NULL
                    (COND
                     ((OR (SPADCALL |ch| (QREFELT $ 22))
                          (|eql_SI| |ch| (|STR_to_CHAR| " ")))
                      'T)
                     ('T (|eql_SI| |ch| (|STR_to_CHAR| "(")))))
                   (GO G191)))
                 (SEQ (LETT |r| (|SKICOMB;parseOneTerm| |t1| |p1| $) . #3#)
                      (LETT |p1| (QCDR |r|) . #3#)
                      (LETT |stck| (SPADCALL |stck| (QCAR |r|) (QREFELT $ 27))
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |p1| (SPADCALL |t1| (QREFELT $ 15))
                                   (QREFELT $ 17))
                         (LETT |ch| (|STR_to_CHAR| "*") . #3#))
                        ('T (LETT |ch| (STR_ELT1 |t1| |p1|) . #3#)))))
                 NIL (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |i| 1 . #3#)
                 (LETT #1# (SPADCALL |stck| (QREFELT $ 28)) . #3#) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |res|
                         (SPADCALL |res| (SPADCALL |stck| |i| (QREFELT $ 29))
                                   (QREFELT $ 8))
                         . #3#)))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS |res| |p1|))))
      #2# (EXIT #2#))))) 

(DEFUN |SKICOMB;parseSki;S$;10| (|t1| $)
  (PROG (|r| #1=#:G186)
    (RETURN
     (SEQ
      (LETT |r|
            (SPADCALL |t1|
                      (PROG1
                          (LETT #1# (SPADCALL |t1| (QREFELT $ 30))
                                . #2=(|SKICOMB;parseSki;S$;10|))
                        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                         #1#))
                      (QREFELT $ 20))
            . #2#)
      (EXIT (QCAR |r|)))))) 

(DEFUN |SKICOMB;getChildren;$L;11| (|n| $)
  (PROG (#1=#:G142 #2=#:G192)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| (QREFELT $ 32))
          (PROGN (LETT #2# NIL . #3=(|SKICOMB;getChildren;$L;11|)) (GO #2#))))
        (EXIT
         (LIST
          (QCAR
           (PROG2 (LETT #1# |n| . #3#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 1) (|Record| (|:| |c1| $) (|:| |c2| $))
                            #1#)))
          (QCDR
           (PROG2 (LETT #1# |n| . #3#)
               (QCDR #1#)
             (|check_union| (QEQCAR #1# 1) (|Record| (|:| |c1| $) (|:| |c2| $))
                            #1#)))))))
      #2# (EXIT #2#))))) 

(DEFUN |SKICOMB;atom?;$B;12| (|n| $)
  (COND ((QEQCAR |n| 0) 'T) ('T (QEQCAR |n| 2)))) 

(PUT '|SKICOMB;variable?;$B;13| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 2))) 

(DEFUN |SKICOMB;variable?;$B;13| (|n| $) (QEQCAR |n| 2)) 

(DEFUN |SKICOMB;isI?;$B;14| (|n| $)
  (PROG (#1=#:G201)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL (QEQCAR |n| 0))
          (PROGN (LETT #1# 'NIL . #2=(|SKICOMB;isI?;$B;14|)) (GO #1#))))
        (COND ((EQUAL (CDR |n|) 'I) (PROGN (LETT #1# 'T . #2#) (GO #1#))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;isK?;$B;15| (|n| $)
  (PROG (#1=#:G208)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL (QEQCAR |n| 0))
          (PROGN (LETT #1# 'NIL . #2=(|SKICOMB;isK?;$B;15|)) (GO #1#))))
        (COND ((EQUAL (CDR |n|) 'K) (PROGN (LETT #1# 'T . #2#) (GO #1#))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;isS?;$B;16| (|n| $)
  (PROG (#1=#:G215)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL (QEQCAR |n| 0))
          (PROGN (LETT #1# 'NIL . #2=(|SKICOMB;isS?;$B;16|)) (GO #1#))))
        (COND ((EQUAL (CDR |n|) 'S) (PROGN (LETT #1# 'T . #2#) (GO #1#))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;getVariable;$UT;17| (|n| $)
  (PROG (#1=#:G217)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 2)
          (PROGN (LETT #1# (CDR |n|) |SKICOMB;getVariable;$UT;17|) (GO #1#))))
        (EXIT (SPADCALL " " (QREFELT $ 39)))))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;freeVariable?;$UTB;18| (|n| |s| $)
  (PROG (#1=#:G226)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 2)
          (COND
           ((SPADCALL (CDR |n|) |s| (QREFELT $ 41))
            (PROGN
             (LETT #1# 'NIL . #2=(|SKICOMB;freeVariable?;$UTB;18|))
             (GO #1#))))))
        (COND
         ((QEQCAR |n| 1)
          (COND
           ((SPADCALL (QCAR (CDR |n|)) |s| (QREFELT $ 42))
            (COND
             ((NULL (SPADCALL (QCDR (CDR |n|)) |s| (QREFELT $ 42)))
              (PROGN (LETT #1# 'NIL . #2#) (GO #1#)))))
           ('T (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;toString;$S;19| (|n| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|SKICOMB;toString;$S;19|))
          (COND
           ((QEQCAR |n| 0)
            (SEQ (COND ((EQUAL (CDR |n|) 'I) (LETT |s| "I" . #1#)))
                 (COND ((EQUAL (CDR |n|) 'K) (LETT |s| "K" . #1#)))
                 (EXIT (COND ((EQUAL (CDR |n|) 'S) (LETT |s| "S" . #1#)))))))
          (COND
           ((QEQCAR |n| 1)
            (COND
             ((SPADCALL (QCDR (CDR |n|)) (QREFELT $ 32))
              (COND
               ((SPADCALL (QCDR (CDR |n|)) (QREFELT $ 35))
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 43)) " "
                             (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 43)))
                       (QREFELT $ 44))
                      . #1#))
               (#2='T
                (LETT |s|
                      (SPADCALL
                       (LIST |s| (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 43))
                             (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 43)))
                       (QREFELT $ 44))
                      . #1#))))
             (#2#
              (LETT |s|
                    (SPADCALL
                     (LIST |s| (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 43)) "("
                           (SPADCALL (QCDR (CDR |n|)) (QREFELT $ 43)) ")")
                     (QREFELT $ 44))
                    . #1#)))))
          (COND
           ((QEQCAR |n| 2)
            (LETT |s| (SPADCALL (CDR |n|) (QREFELT $ 45)) . #1#)))
          (EXIT |s|))))) 

(DEFUN |SKICOMB;redux1| (|n| $)
  (PROG (#1=#:G244 |leftleftright| |leftleftleft| |leftright| |leftleft|
         |right| |left|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 1)
          (SEQ
           (LETT |left| (|SKICOMB;redux1| (QCAR (CDR |n|)) $)
                 . #2=(|SKICOMB;redux1|))
           (LETT |right| (|SKICOMB;redux1| (QCDR (CDR |n|)) $) . #2#)
           (COND
            ((SPADCALL |left| (QREFELT $ 36))
             (PROGN (LETT #1# |right| . #2#) (GO #1#))))
           (COND
            ((NULL (QEQCAR |left| 1))
             (PROGN
              (LETT #1# (SPADCALL |left| |right| (QREFELT $ 8)) . #2#)
              (GO #1#))))
           (LETT |leftleft| (QCAR (CDR |left|)) . #2#)
           (LETT |leftright| (QCDR (CDR |left|)) . #2#)
           (COND
            ((SPADCALL |leftleft| (QREFELT $ 37))
             (PROGN (LETT #1# |leftright| . #2#) (GO #1#))))
           (COND
            ((NULL (QEQCAR |leftleft| 1))
             (PROGN
              (LETT #1# (SPADCALL |left| |right| (QREFELT $ 8)) . #2#)
              (GO #1#))))
           (LETT |leftleftleft| (QCAR (CDR |leftleft|)) . #2#)
           (LETT |leftleftright| (QCDR (CDR |leftleft|)) . #2#)
           (COND
            ((SPADCALL |leftleftleft| (QREFELT $ 38))
             (PROGN
              (LETT #1#
                    (SPADCALL (SPADCALL |leftleftright| |right| (QREFELT $ 8))
                              (SPADCALL |leftright| |right| (QREFELT $ 8))
                              (QREFELT $ 8))
                    . #2#)
              (GO #1#))))
           (EXIT
            (PROGN
             (LETT #1# (SPADCALL |left| |right| (QREFELT $ 8)) . #2#)
             (GO #1#))))))
        (EXIT |n|)))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;redux;2$;21| (|n| $)
  (PROG (|triesLeft| #1=#:G246 |thisResult| |lastResult|)
    (RETURN
     (SEQ (LETT |lastResult| (CONS 0 'I) . #2=(|SKICOMB;redux;2$;21|))
          (LETT |thisResult| (|SKICOMB;redux1| |n| $) . #2#)
          (LETT |triesLeft| 20 . #2#)
          (SEQ G190
               (COND
                ((NULL
                  (COND
                   ((SPADCALL |lastResult| |thisResult| (QREFELT $ 46))
                    (SPADCALL |triesLeft| 1 (QREFELT $ 47)))
                   ('T 'NIL)))
                 (GO G191)))
               (SEQ (LETT |lastResult| |thisResult| . #2#)
                    (LETT |thisResult| (|SKICOMB;redux1| |lastResult| $) . #2#)
                    (LETT |triesLeft|
                          (PROG1 (LETT #1# (- |triesLeft| 1) . #2#)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          . #2#)
                    (EXIT
                     (|sayBrightly| (SPADCALL |lastResult| (QREFELT $ 43)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |thisResult|))))) 

(DEFUN |SKICOMB;=;2$B;22| (|x| |y| $)
  (PROG (#1=#:G263)
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
              ((EQUAL (CDR |x|) (CDR |y|))
               (PROGN (LETT #1# 'T . #2=(|SKICOMB;=;2$B;22|)) (GO #1#))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (COND
         ((QEQCAR |x| 2)
          (COND
           ((QEQCAR |y| 2)
            (SEQ
             (COND
              ((SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 41))
               (PROGN (LETT #1# 'T . #2#) (GO #1#))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (COND
         ((QEQCAR |x| 1)
          (COND
           ((QEQCAR |y| 1)
            (SEQ
             (COND
              ((SPADCALL (QCAR (CDR |x|)) (QCAR (CDR |y|)) (QREFELT $ 49))
               (COND
                ((SPADCALL (QCDR (CDR |x|)) (QCDR (CDR |y|)) (QREFELT $ 49))
                 (PROGN (LETT #1# 'T . #2#) (GO #1#))))))
             (EXIT (PROGN (LETT #1# 'NIL . #2#) (GO #1#))))))))
        (EXIT 'NIL)))
      #1# (EXIT #1#))))) 

(DEFUN |SKICOMB;coerce;$Of;23| (|n| $)
  (SPADCALL (SPADCALL |n| (QREFELT $ 43)) (QREFELT $ 51))) 

(DECLAIM (NOTINLINE |SKICombinators;|)) 

(DEFUN |SKICombinators| (#1=#:G265)
  (PROG ()
    (RETURN
     (PROG (#2=#:G266)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SKICombinators|)
                                           '|domainEqualList|)
                . #3=(|SKICombinators|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|SKICombinators;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SKICombinators|))))))))))) 

(DEFUN |SKICombinators;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SKICombinators|))
      (LETT |dv$| (LIST '|SKICombinators| DV$1) . #1#)
      (LETT $ (GETREFV 53) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SKICombinators| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union| (|:| |lf| (|Symbol|))
                         (|:| |nd| (|Record| (|:| |c1| $) (|:| |c2| $)))
                         (|:| |vr| |#1|)))
      $)))) 

(MAKEPROP '|SKICombinators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| |SKICOMB;ski;3$;1|
              |SKICOMB;ski;UT$;2| |SKICOMB;I;$;3| |SKICOMB;K;$;4|
              |SKICOMB;S;$;5| (|Integer|) (|String|) (0 . |maxIndex|)
              (|Boolean|) (5 . >) (|Record| (|:| |rft| $) (|:| |pout| 19))
              (|NonNegativeInteger|) |SKICOMB;parseTerm;SNniR;9| (|Character|)
              (11 . |alphabetic?|) (16 . |upperCase?|) (21 . |lowerCase?|)
              (26 . |parseVarTerm|) (|List| $$) (32 . |concat|) (38 . |#|)
              (43 . |elt|) (49 . |minIndex|) |SKICOMB;parseSki;S$;10|
              |SKICOMB;atom?;$B;12| (|List| $) |SKICOMB;getChildren;$L;11|
              |SKICOMB;variable?;$B;13| |SKICOMB;isI?;$B;14|
              |SKICOMB;isK?;$B;15| |SKICOMB;isS?;$B;16| (54 . |var|)
              |SKICOMB;getVariable;$UT;17| (59 . =)
              |SKICOMB;freeVariable?;$UTB;18| |SKICOMB;toString;$S;19|
              (65 . |concat|) (70 . |toString|) (75 . ~=) (81 . >)
              |SKICOMB;redux;2$;21| |SKICOMB;=;2$B;22| (|OutputForm|)
              (87 . |coerce|) |SKICOMB;coerce;$Of;23|)
           '#(|variable?| 92 |toString| 97 |ski| 102 |redux| 113 |parseTerm|
              118 |parseSki| 124 |isS?| 129 |isK?| 134 |isI?| 139 |getVariable|
              144 |getChildren| 149 |freeVariable?| 154 |coerce| 160 |atom?|
              165 S 170 K 174 I 178 = 182)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 50))
                             (|makeByteWordVec2| 52
                                                 '(1 14 13 0 15 2 13 16 0 0 17
                                                   1 21 16 0 22 1 21 16 0 23 1
                                                   21 16 0 24 2 6 18 14 19 25 2
                                                   26 0 0 2 27 1 26 19 0 28 2
                                                   26 2 0 13 29 1 14 13 0 30 1
                                                   6 0 14 39 2 6 16 0 0 41 1 14
                                                   0 33 44 1 6 14 0 45 2 7 16 2
                                                   2 46 2 19 16 0 0 47 1 14 50
                                                   0 51 1 0 16 0 35 1 0 14 0 43
                                                   1 0 0 6 9 2 0 0 0 0 8 1 0 0
                                                   0 48 2 0 18 14 19 20 1 0 0
                                                   14 31 1 0 16 0 38 1 0 16 0
                                                   37 1 0 16 0 36 1 0 6 0 40 1
                                                   0 33 0 34 2 0 16 0 6 42 1 0
                                                   50 0 52 1 0 16 0 32 0 0 0 12
                                                   0 0 0 11 0 0 0 10 2 0 16 0 0
                                                   49)))))
           '|lookupComplete|)) 
