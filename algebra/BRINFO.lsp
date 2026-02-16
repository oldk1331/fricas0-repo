
(SDEFUN |BRINFO;constructor_signature;SLSe;1|
        ((|conname| (|Symbol|)) (|args| (|List| (|SExpression|)))
         (% (|SExpression|)))
        (SPROG ((|sig| (|SExpression|)))
               (SEQ (LETT |sig| (|getConstructorSignature| |conname|))
                    (EXIT
                     (COND
                      ((EQUAL (|get_database| |conname| 'CONSTRUCTORKIND)
                              '|category|)
                       (SUBLISLIS |args| |$TriangleVariableList| |sig|))
                      ('T (|sublisFormal| |args| |sig|))))))) 

(SDEFUN |BRINFO;downcase;2S;2| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((|c| (|Character|)) (#1=#:G98 NIL) (|i| NIL) (|shift| (|Integer|))
          (|res| (|String|)))
         (SEQ
          (LETT |res|
                (|make_string_code| (QCSIZE |s|) (SPADCALL (QREFELT % 17))))
          (LETT |shift| (- (QREFELT % 10) (QREFELT % 11)))
          (SEQ (LETT |i| 1) (LETT #1# (QCSIZE |s|)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |c| (SPADCALL |s| |i| (QREFELT % 20)))
                    (EXIT
                     (SPADCALL |res| |i|
                               (SEQ
                                (COND
                                 ((SPADCALL |c| (QREFELT % 11) (QREFELT % 22))
                                  (COND
                                   ((SPADCALL |c| (QREFELT % 12)
                                              (QREFELT % 23))
                                    (EXIT
                                     (SPADCALL (+ |c| |shift|)
                                               (QREFELT % 24)))))))
                                (EXIT |c|))
                               (QREFELT % 25))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |BRINFO;is_error?;SeB;3| ((|se| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|e1| (|SExpression|)) (|l| (|List| (|SExpression|))))
               (SEQ
                (COND
                 ((SPADCALL |se| (QREFELT % 27))
                  (SEQ (LETT |l| (SPADCALL |se| (QREFELT % 29)))
                       (EXIT
                        (COND ((NULL |l|) NIL)
                              (#1='T
                               (SEQ (LETT |e1| (|SPADfirst| |l|))
                                    (EXIT
                                     (SPADCALL |e1|
                                               (SPADCALL '|error|
                                                         (QREFELT % 30))
                                               (QREFELT % 31)))))))))
                 (#1# NIL))))) 

(PUT '|BRINFO;convert_pattern;SSe;4| '|SPADreplace| '|pmTransFilter|) 

(SDEFUN |BRINFO;convert_pattern;SSe;4| ((|pat| (|String|)) (% (|SExpression|)))
        (|pmTransFilter| |pat|)) 

(SDEFUN |BRINFO;do_match;SeSB;5|
        ((|pat| (|SExpression|)) (|s| (|String|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ
                (LETT |res1|
                      (|superMatch?| |pat| (SPADCALL |s| (QREFELT % 26))))
                (EXIT (NULL (SPADCALL |res1| (QREFELT % 34))))))) 

(SDEFUN |BRINFO;filter_ops;Se2L;6|
        ((|pat| (|SExpression|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (#1=#:G117 NIL) (|opr| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |pat| (SPADCALL (QCAR |opr|) (QREFELT % 36))
                                 (QREFELT % 35))
                       (LETT |res| (CONS |opr| |res|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;search_opl;SLU;7|
        ((|pat| (|String|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))
           (|SExpression|))))
        (SPROG ((|pc| (|SExpression|)))
               (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 33)))
                    (EXIT
                     (COND ((SPADCALL |pc| (QREFELT % 32)) (CONS 1 |pc|))
                           ('T
                            (CONS 0 (SPADCALL |pc| |opl| (QREFELT % 40))))))))) 

(SDEFUN |BRINFO;constructor_name?;SB;8| ((|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ (LETT |res1| (|constructor?| |name|))
                    (EXIT (NULL (SPADCALL |res1| (QREFELT % 34))))))) 

(SDEFUN |BRINFO;exposed_constructor?;SB;9|
        ((|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ (LETT |res1| (|isExposedConstructor| |name|))
                    (EXIT (NULL (SPADCALL |res1| (QREFELT % 34))))))) 

(SDEFUN |BRINFO;simp_ops_conditions;L2SeL;10|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|con_form| (|SExpression|)) (|dom_form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|res1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|r1|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (#1=#:G147 NIL) (|np| (|SExpression|)) (#2=#:G149 NIL) (|sd| NIL)
          (#3=#:G148 NIL) (|opr| NIL) (|dl| #4=(|List| (|SExpression|)))
          (|cl| #4#))
         (SEQ (LETT |res| NIL)
              (LETT |cl|
                    (CONS |con_form|
                          (CDR (SPADCALL |con_form| (QREFELT % 29)))))
              (LETT |dl|
                    (CONS |dom_form|
                          (CDR (SPADCALL |dom_form| (QREFELT % 29)))))
              (SEQ (LETT |opr| NIL) (LETT #3# |opl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |opr| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |res1| NIL)
                        (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |sd| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |r1|
                                      (COND
                                       ((SPADCALL (QVELT |sd| 1) 'T
                                                  (QREFELT % 31))
                                        |sd|)
                                       ('T
                                        (SEQ
                                         (LETT |np|
                                               (SUBLISLIS |dl| |cl|
                                                          (QVELT |sd| 1)))
                                         (LETT |np| (|simpHasPred| |np|))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |np| (QREFELT % 34))
                                            (PROGN
                                             (LETT #1# |$NoValue|)
                                             (GO #5=#:G134)))
                                           ('T
                                            (VECTOR (QVELT |sd| 0) |np|
                                                    (QVELT |sd| 2)
                                                    (QVELT |sd| 3)))))))))
                                (EXIT (LETT |res1| (CONS |r1| |res1|)))))
                              #5# (EXIT #1#))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (NULL |res1|))
                           (LETT |res|
                                 (CONS (CONS (QCAR |opr|) (NREVERSE |res1|))
                                       |res|))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;operations;SeBL;11|
        ((|form| (|SExpression|)) (|use_args?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|res1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|doc_s| (|String|)) (|doc| #1=(|SExpression|))
          (|ori| (|SExpression|)) (|nd| (|SExpression|)) (|cond| NIL)
          (|#G27| #2=(|List| (|SExpression|))) (|sig| NIL) (|#G26| #2#)
          (#3=#:G172 NIL) (|mm1| NIL) (|mms| #2#) (|op| (|Symbol|))
          (|k| (|Integer|)) (|ope| (|SExpression|)) (#4=#:G171 NIL)
          (|op_mm| NIL) (|lst1| (|List| (|SExpression|))) (|docTable| (|None|))
          (|dom_form| #1#))
         (SEQ (LETT |dom_form| (SPADCALL NIL (QREFELT % 46)))
              (LETT |form|
                    (SPADCALL
                     (SPADCALL (SPADCALL |form| (QREFELT % 47)) (QREFELT % 48))
                     (QREFELT % 49)))
              (SETF |$docTableHash| (MAKE_HASHTABLE 'EQUAL))
              (LETT |docTable| (|dbDocTable| |form|))
              (LETT |lst1| (|koOps| |form| |dom_form|)) (LETT |res| NIL)
              (SEQ (LETT |op_mm| NIL) (LETT #4# |lst1|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |op_mm| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ope| (SPADCALL |op_mm| (QREFELT % 47)))
                        (LETT |op|
                              (COND
                               ((SPADCALL |ope| (QREFELT % 50))
                                (SPADCALL |ope| (QREFELT % 48)))
                               ((SPADCALL |ope| (QREFELT % 51))
                                (SEQ (LETT |k| (SPADCALL |ope| (QREFELT % 52)))
                                     (EXIT
                                      (COND ((EQL |k| 0) '|0|)
                                            ((EQL |k| 1) '|1|)
                                            ('T
                                             (|error|
                                              "unexpected integer as operator"))))))
                               ('T (|error| "unexpected operator form"))))
                        (LETT |mms|
                              (SPADCALL (SPADCALL |op_mm| (QREFELT % 53))
                                        (QREFELT % 29)))
                        (LETT |res1| NIL)
                        (SEQ (LETT |mm1| NIL) (LETT #3# |mms|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |mm1| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (PROGN
                               (LETT |#G26| (SPADCALL |mm1| (QREFELT % 29)))
                               (LETT |#G27| |#G26|)
                               (LETT |sig| (|SPADfirst| |#G27|))
                               (LETT |#G27| (CDR |#G27|))
                               (LETT |cond| (|SPADfirst| |#G27|))
                               |#G26|)
                              (LETT |nd|
                                    (|dbGetDocTable| |ope| |sig| |docTable|))
                              (LETT |doc| (SPADCALL NIL (QREFELT % 46)))
                              (COND
                               ((SPADCALL |nd| (QREFELT % 34))
                                (SEQ
                                 (SPADCALL
                                  (SPADCALL
                                   "operations: op not found in doc table"
                                   (QREFELT % 55))
                                  (QREFELT % 57))
                                 (SPADCALL (SPADCALL |op_mm| (QREFELT % 58))
                                           (QREFELT % 57))
                                 (SPADCALL (SPADCALL |mm1| (QREFELT % 58))
                                           (QREFELT % 57))
                                 (EXIT (LETT |ori| |form|))))
                               ('T
                                (SEQ
                                 (LETT |ori| (SPADCALL |nd| (QREFELT % 47)))
                                 (EXIT
                                  (LETT |doc|
                                        (SPADCALL |nd| (QREFELT % 53)))))))
                              (LETT |doc_s|
                                    (COND ((SPADCALL |doc| (QREFELT % 34)) "")
                                          ('T
                                           (SPADCALL
                                            (SPADCALL |doc| (QREFELT % 47))
                                            (QREFELT % 59)))))
                              (EXIT
                               (LETT |res1|
                                     (CONS (VECTOR |sig| |cond| |ori| |doc_s|)
                                           |res1|))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res|
                               (CONS (CONS |op| (NREVERSE |res1|)) |res|))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;sex_order|
        ((|s1| (|SExpression|)) (|s2| (|SExpression|)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G193 NIL) (|sl2| #2=(|List| (|SExpression|))) (|sl1| #2#)
          (|e2| #3=(|SExpression|)) (|e1| #3#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |s1| (QREFELT % 27))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 27))) 'T)
                   (#4='T
                    (SEQ (LETT |sl1| (SPADCALL |s1| (QREFELT % 29)))
                         (LETT |sl2| (SPADCALL |s2| (QREFELT % 29)))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL |sl1|)
                                   (PROGN
                                    (LETT #1# (NULL (NULL |sl2|)))
                                    (GO #5=#:G192)))
                                  ((NULL |sl2|)
                                   (PROGN (LETT #1# NIL) (GO #5#)))
                                  ('T
                                   (SEQ (LETT |e1| (|SPADfirst| |sl1|))
                                        (LETT |e2| (|SPADfirst| |sl2|))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |e1| |e2| (QREFELT % 31))
                                           (SEQ (LETT |sl1| (CDR |sl1|))
                                                (EXIT
                                                 (LETT |sl2| (CDR |sl2|)))))
                                          ('T
                                           (PROGN
                                            (LETT #1#
                                                  (|BRINFO;sex_order| |e1| |e2|
                                                   %))
                                            (GO #5#))))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))
            ((SPADCALL |s2| (QREFELT % 27)) NIL)
            ((SPADCALL |s1| (QREFELT % 61))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 61))) 'T)
                   (#4#
                    (CGREATERP (SPADCALL |s2| (QREFELT % 59))
                               (SPADCALL |s1| (QREFELT % 59))))))
            ((SPADCALL |s2| (QREFELT % 61)) NIL)
            ((SPADCALL |s1| (QREFELT % 51))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 51))) 'T)
                   (#4#
                    (< (SPADCALL |s1| (QREFELT % 52))
                       (SPADCALL |s2| (QREFELT % 52))))))
            ((SPADCALL |s2| (QREFELT % 51)) NIL)
            ('T
             (CGREATERP
              (SPADCALL (SPADCALL |s2| (QREFELT % 48)) (QREFELT % 36))
              (SPADCALL (SPADCALL |s1| (QREFELT % 48)) (QREFELT % 36))))))
          #5# (EXIT #1#)))) 

(SDEFUN |BRINFO;gr1_ord|
        ((|g1|
          (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                    (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (|g2|
          (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                    (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (% (|Boolean|)))
        (|BRINFO;sex_order| (QVELT |g1| 0) (QVELT |g2| 0) %)) 

(SDEFUN |BRINFO;gr2_ord|
        ((|a1|
          (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (|a2|
          (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (% (|Boolean|)))
        (< (QVELT |a1| 0) (QVELT |a2| 0))) 

(SDEFUN |BRINFO;group_data1|
        ((|lst|
          (|List|
           (|Record| (|:| |i| (|Integer|)) (|:| |name| #1=(|Symbol|))
                     (|:| |sd|
                          #2=(|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|res1| (|List| #2#)) (|on| #1#) (#3=#:G215 NIL) (|a1| NIL)
          (|a0|
           (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (SEQ
          (LETT |lst|
                (SPADCALL (CONS (|function| |BRINFO;gr2_ord|) %) |lst|
                          (QREFELT % 65)))
          (LETT |a0| (|SPADfirst| |lst|)) (LETT |lst| (CDR |lst|))
          (LETT |on| (QVELT |a0| 1)) (LETT |res1| (LIST (QVELT |a0| 2)))
          (LETT |res| NIL)
          (SEQ (LETT |a1| NIL) (LETT #3# |lst|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |a1| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((EQUAL |on| (QVELT |a1| 1))
                   (LETT |res1| (CONS (QVELT |a1| 2) |res1|)))
                  ('T
                   (SEQ (LETT |res| (CONS (CONS |on| (NREVERSE |res1|)) |res|))
                        (LETT |on| (QVELT |a1| 1))
                        (EXIT (LETT |res1| (LIST (QVELT |a1| 2)))))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (LETT |res| (CONS (CONS |on| |res1|) |res|))
          (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;group_data|
        ((|grd|
          (|List|
           (|Record| (|:| |grp_tag| #1=(|SExpression|)) (|:| |i| (|Integer|))
                     (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (SPROG
         ((|opl1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|res1|
           (|List|
            #2=(|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                         (|:| |sd|
                              (|Record| (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation| (|String|)))))))
          (|ot| #1#)
          (|res|
           (|List|
            (|Record| (|:| |grp_tag| (|SExpression|))
                      (|:| |ops|
                           (|List|
                            (|Record| (|:| |name| (|Symbol|))
                                      (|:| |sdl|
                                           (|List|
                                            (|Record|
                                             (|:| |signature| (|SExpression|))
                                             (|:| |condition| (|SExpression|))
                                             (|:| |origin| (|SExpression|))
                                             (|:| |documentation|
                                                  (|String|)))))))))))
          (|r1| #2#) (|t| #1#) (#3=#:G233 NIL) (|gr| NIL)
          (|e1|
           (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                     (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (SEQ
          (COND ((NULL |grd|) NIL)
                ('T
                 (SEQ
                  (LETT |grd|
                        (SPADCALL (CONS (|function| |BRINFO;gr1_ord|) %) |grd|
                                  (QREFELT % 69)))
                  (LETT |e1| (|SPADfirst| |grd|)) (LETT |ot| (QVELT |e1| 0))
                  (LETT |res1|
                        (LIST
                         (VECTOR (QVELT |e1| 1) (QVELT |e1| 2)
                                 (QVELT |e1| 3))))
                  (LETT |res| NIL)
                  (SEQ (LETT |gr| NIL) (LETT #3# |grd|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |gr| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |t| (QVELT |gr| 0))
                            (LETT |r1|
                                  (VECTOR (QVELT |gr| 1) (QVELT |gr| 2)
                                          (QVELT |gr| 3)))
                            (EXIT
                             (COND
                              ((SPADCALL |t| |ot| (QREFELT % 31))
                               (LETT |res1| (CONS |r1| |res1|)))
                              ('T
                               (SEQ
                                (LETT |opl1| (|BRINFO;group_data1| |res1| %))
                                (LETT |res| (CONS (CONS |ot| |opl1|) |res|))
                                (LETT |ot| |t|)
                                (EXIT (LETT |res1| (LIST |r1|))))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (LETT |opl1| (|BRINFO;group_data1| |res1| %))
                  (EXIT (NREVERSE (CONS (CONS |ot| |opl1|) |res|))))))))) 

(SDEFUN |BRINFO;group_by_field|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (|field|
          (|Mapping| (|SExpression|)
                     (|Record| (|:| |signature| (|SExpression|))
                               (|:| |condition| (|SExpression|))
                               (|:| |origin| (|SExpression|))
                               (|:| |documentation| (|String|)))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (SPROG
         ((|grd|
           (|List|
            #1=(|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                         (|:| |name| (|Symbol|))
                         (|:| |sd|
                              (|Record| (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation| (|String|)))))))
          (|i| (|Integer|)) (|r1| #1#) (#2=#:G245 NIL) (|sd| NIL)
          (|name| (|Symbol|)) (#3=#:G244 NIL) (|opr| NIL))
         (SEQ (LETT |grd| NIL) (LETT |i| 1)
              (SEQ (LETT |opr| NIL) (LETT #3# |opl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |opr| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |name| (QCAR |opr|))
                        (EXIT
                         (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |sd| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |r1|
                                     (VECTOR (SPADCALL |sd| |field|) |i| |name|
                                             |sd|))
                               (LETT |i| (+ |i| 1))
                               (EXIT (LETT |grd| (CONS |r1| |grd|))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|BRINFO;group_data| |grd| %))))) 

(SDEFUN |BRINFO;group_by_condition;LL;18|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (|BRINFO;group_by_field| |opl|
         (LIST #'|BRINFO;group_by_condition;LL;18!0|) %)) 

(SDEFUN |BRINFO;group_by_condition;LL;18!0| ((|sd| NIL) ($$ NIL))
        (QVELT |sd| 1)) 

(SDEFUN |BRINFO;group_by_origin;LL;19|
        ((|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (|BRINFO;group_by_field| |opl|
         (LIST #'|BRINFO;group_by_origin;LL;19!0|) %)) 

(SDEFUN |BRINFO;group_by_origin;LL;19!0| ((|sd| NIL) ($$ NIL)) (QVELT |sd| 2)) 

(SDEFUN |BRINFO;group_by_implementation;LSeLL;20|
        ((|args| (|List| (|SExpression|))) (|dom_form| (|SExpression|))
         (|opl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (%
          (|List|
           (|Record| (|:| |grp_tag| (|SExpression|))
                     (|:| |ops|
                          (|List|
                           (|Record| (|:| |name| (|Symbol|))
                                     (|:| |sdl|
                                          (|List|
                                           (|Record|
                                            (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|))))))))))))
        (SPROG
         ((|grd|
           (|List|
            #1=(|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                         (|:| |name| (|Symbol|))
                         (|:| |sd|
                              (|Record| (|:| |signature| (|SExpression|))
                                        (|:| |condition| (|SExpression|))
                                        (|:| |origin| (|SExpression|))
                                        (|:| |documentation| (|String|)))))))
          (|i| (|Integer|)) (|r1| #1#) (|sig_imp| (|SExpression|))
          (|op| #2=(|Symbol|)) (#3=#:G265 NIL) (|sd| NIL) (|name| #2#)
          (#4=#:G264 NIL) (|opr| NIL) (|pred_lst| (|List| (|SExpression|)))
          (|dom| (|None|)) (|con_name| (|Symbol|)))
         (SEQ
          (LETT |con_name|
                (SPADCALL (SPADCALL |dom_form| (QREFELT % 47)) (QREFELT % 48)))
          (LETT |dom| (EVAL |dom_form|))
          (LETT |pred_lst| (|get_database| |con_name| 'PREDICATES))
          (LETT |grd| NIL) (LETT |i| 1)
          (SEQ (LETT |opr| NIL) (LETT #4# |opl|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |opr| (CAR #4#)) NIL)) (GO G191)))
               (SEQ (LETT |name| (QCAR |opr|))
                    (EXIT
                     (SEQ (LETT |sd| NIL) (LETT #3# (QCDR |opr|)) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |sd| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |op|
                                 (COND ((EQUAL |name| '|0|) '|Zero|)
                                       ((EQUAL |name| '|1|) '|One|)
                                       ('T |name|)))
                           (LETT |sig_imp|
                                 (|get_op_implementation| |op| (QVELT |sd| 0)
                                  (QVELT |sd| 1) |pred_lst| |args| |dom|))
                           (LETT |r1|
                                 (VECTOR (SPADCALL |sig_imp| (QREFELT % 53))
                                         |i| |name| |sd|))
                           (LETT |i| (+ |i| 1))
                           (EXIT (LETT |grd| (CONS |r1| |grd|))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (EXIT (|BRINFO;group_data| |grd| %))))) 

(PUT '|BRINFO;find_symbol| '|SPADreplace| '|find_symbol|) 

(SDEFUN |BRINFO;find_symbol|
        ((|name| (|String|)) (% (|Union| (|Symbol|) "failed")))
        (|find_symbol| |name|)) 

(SDEFUN |BRINFO;get_ops_doc| ((|name| (|Symbol|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|e1| (|SExpression|)) (|con_doc| (|List| (|SExpression|)))
          (|doc| (|List| (|SExpression|))))
         (SEQ (LETT |doc| (|get_database| |name| 'DOCUMENTATION))
              (EXIT
               (COND ((NULL |doc|) |doc|)
                     ('T
                      (SEQ
                       (LETT |con_doc|
                             (SPADCALL (|SPADfirst| |doc|) (QREFELT % 29)))
                       (LETT |e1| (|SPADfirst| |con_doc|))
                       (COND
                        ((NULL
                          (EQUAL (SPADCALL |e1| (QREFELT % 48))
                                 '|constructor|))
                         (EXIT |doc|)))
                       (LETT |con_doc|
                             (SPADCALL (SPADCALL |con_doc| 2 (QREFELT % 75))
                                       (QREFELT % 29)))
                       (LETT |e1| (|SPADfirst| |con_doc|))
                       (COND
                        ((NULL (SPADCALL |e1| (QREFELT % 34))) (EXIT |doc|)))
                       (EXIT (CDR |doc|))))))))) 

(SDEFUN |BRINFO;unpack_sig_cond|
        ((|r1| (|SExpression|))
         (%
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|)))))
        (CONS (SPADCALL |r1| (QREFELT % 47)) (SPADCALL |r1| (QREFELT % 53)))) 

(SDEFUN |BRINFO;sd_cmp|
        ((|sd1|
          (|Record| (|:| |signature| #1=(|SExpression|))
                    (|:| |condition| (|SExpression|))
                    (|:| |origin| #2=(|SExpression|))
                    (|:| |documentation| (|String|))))
         (|sd2|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))
                    (|:| |origin| (|SExpression|))
                    (|:| |documentation| (|String|))))
         (% (|Boolean|)))
        (SPROG ((|orig2| #2#) (|orig1| #2#) (|sig2| #1#) (|sig1| #1#))
               (SEQ (LETT |sig1| (QVELT |sd1| 0)) (LETT |sig2| (QVELT |sd2| 0))
                    (EXIT
                     (COND
                      ((SPADCALL |sig1| |sig2| (QREFELT % 31))
                       (SEQ (LETT |orig1| (QVELT |sd1| 2))
                            (LETT |orig2| (QVELT |sd2| 2))
                            (EXIT
                             (COND
                              ((SPADCALL |orig1| |orig2| (QREFELT % 31))
                               (|BRINFO;sex_order| (QVELT |sd1| 1)
                                (QVELT |sd2| 1) %))
                              (#3='T
                               (|BRINFO;sex_order| |orig1| |orig2| %))))))
                      (#3# (|BRINFO;sex_order| |sig1| |sig2| %))))))) 

(SDEFUN |BRINFO;sdl_cmp|
        ((|sdl1|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|)))))
         (|sdl2|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|)))))
         (% (|Boolean|)))
        (SPROG
         ((#1=#:G290 NIL)
          (|sd2|
           #2=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sd1| #2#))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND ((NULL |sdl1|) (NULL (NULL |sdl2|)))
                        ((NULL |sdl2|) (PROGN (LETT #1# NIL) (GO #3=#:G289)))
                        ('T
                         (SEQ (LETT |sd1| (|SPADfirst| |sdl1|))
                              (LETT |sd2| (|SPADfirst| |sdl2|))
                              (EXIT
                               (COND
                                ((SPADCALL |sd1| |sd2| (QREFELT % 76))
                                 (SEQ (LETT |sdl1| (CDR |sdl1|))
                                      (EXIT (LETT |sdl2| (CDR |sdl2|)))))
                                ('T
                                 (PROGN
                                  (LETT #1# (|BRINFO;sd_cmp| |sd1| |sd2| %))
                                  (GO #3#))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #1#)))) 

(SDEFUN |BRINFO;opr_cmp|
        ((|r1|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sdl|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (|r2|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sdl|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (% (|Boolean|)))
        (SPROG ((|n2| #1=(|Symbol|)) (|n1| #1#))
               (SEQ (LETT |n1| (QCAR |r1|)) (LETT |n2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((EQUAL |n1| |n2|)
                       (|BRINFO;sdl_cmp| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (SPADCALL |n1| |n2| (QREFELT % 77)))))))) 

(SDEFUN |BRINFO;sig_cmp|
        ((|r1|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))))
         (|r2|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))))
         (% (|Boolean|)))
        (SPROG ((|sig2| #1=(|SExpression|)) (|sig1| #1#))
               (SEQ (LETT |sig1| (QCAR |r1|)) (LETT |sig2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((SPADCALL |sig1| |sig2| (QREFELT % 31))
                       (|BRINFO;sex_order| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (|BRINFO;sex_order| |sig1| |sig2| %))))))) 

(SDEFUN |BRINFO;sigs_cmp|
        ((|l1|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|l2|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (% (|Boolean|)))
        (SPROG
         ((#1=#:G305 NIL)
          (|r2|
           #2=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))))
          (|r1| #2#))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND ((NULL |l1|) (NULL (NULL |l2|)))
                        ((NULL |l2|) (PROGN (LETT #1# NIL) (GO #3=#:G304)))
                        ('T
                         (SEQ (LETT |r1| (|SPADfirst| |l1|))
                              (LETT |r2| (|SPADfirst| |l2|))
                              (EXIT
                               (COND
                                ((SPADCALL |r1| |r2| (QREFELT % 79))
                                 (SEQ (LETT |l1| (CDR |l1|))
                                      (EXIT (LETT |l2| (CDR |l2|)))))
                                ('T
                                 (PROGN
                                  (LETT #1# (|BRINFO;sig_cmp| |r1| |r2| %))
                                  (GO #3#))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #1#)))) 

(SDEFUN |BRINFO;opr2_cmp|
        ((|r1|
          (|Record| (|:| |name| #1=(|Symbol|))
                    (|:| |sigs|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|)))))))
         (|r2|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sigs|
                         (|List|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|)))))))
         (% (|Boolean|)))
        (SPROG ((|n2| #1#) (|n1| #1#))
               (SEQ (LETT |n1| (QCAR |r1|)) (LETT |n2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((EQUAL |n1| |n2|)
                       (|BRINFO;sigs_cmp| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (SPADCALL |n1| |n2| (QREFELT % 77)))))))) 

(SDEFUN |BRINFO;convert_opl|
        ((|opl1| (|List| (|SExpression|)))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sigs|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|)))))))))
        (SPROG
         ((|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sigs|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))))))))
          (|res1|
           (|List|
            #1=(|Record| (|:| |signature| (|SExpression|))
                         (|:| |condition| (|SExpression|)))))
          (|oname| #2=(|Symbol|)) (|r2| #1#) (|name| #2#)
          (|need_sort| (|Boolean|)) (#3=#:G331 NIL) (|r1| (|SExpression|)))
         (SEQ
          (COND ((NULL |opl1|) NIL)
                (#4='T
                 (SEQ (LETT |r1| (|SPADfirst| |opl1|))
                      (LETT |opl1| (CDR |opl1|)) (LETT |need_sort| NIL)
                      (LETT |oname|
                            (SPADCALL (SPADCALL |r1| (QREFELT % 47))
                                      (QREFELT % 48)))
                      (LETT |oname|
                            (COND
                             ((EQUAL |oname| '|Zero|)
                              (SEQ (LETT |need_sort| 'T) (EXIT '|0|)))
                             ((EQUAL |oname| '|One|)
                              (SEQ (LETT |need_sort| 'T) (EXIT '|1|)))
                             (#4# |oname|)))
                      (LETT |res1|
                            (LIST
                             (|BRINFO;unpack_sig_cond|
                              (SPADCALL |r1| (QREFELT % 53)) %)))
                      (LETT |opl| NIL)
                      (SEQ (LETT #3# |opl1|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |r1| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |name|
                                  (SPADCALL (SPADCALL |r1| (QREFELT % 47))
                                            (QREFELT % 48)))
                            (LETT |name|
                                  (COND
                                   ((EQUAL |name| '|Zero|)
                                    (SEQ (LETT |need_sort| 'T) (EXIT '|0|)))
                                   ((EQUAL |name| '|One|)
                                    (SEQ (LETT |need_sort| 'T) (EXIT '|1|)))
                                   ('T |name|)))
                            (LETT |r2|
                                  (|BRINFO;unpack_sig_cond|
                                   (SPADCALL |r1| (QREFELT % 53)) %))
                            (EXIT
                             (COND
                              ((EQUAL |name| |oname|)
                               (LETT |res1| (CONS |r2| |res1|)))
                              ('T
                               (SEQ
                                (LETT |opl|
                                      (CONS (CONS |oname| (NREVERSE |res1|))
                                            |opl|))
                                (LETT |oname| |name|)
                                (EXIT (LETT |res1| (LIST |r2|))))))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (LETT |opl|
                            (CONS (CONS |oname| (NREVERSE |res1|)) |opl|))
                      (EXIT
                       (COND
                        (|need_sort|
                         (SPADCALL (CONS (|function| |BRINFO;opr2_cmp|) %)
                                   |opl| (QREFELT % 83)))
                        (#4# (NREVERSE |opl|)))))))))) 

(SDEFUN |BRINFO;convert_doc1| ((|d1| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|dl| (|List| (|SExpression|))) (|new_name| (|SExpression|))
          (|ns| (|Symbol|)) (|name| (|SExpression|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |name| (SPADCALL |d1| (QREFELT % 47)))
                      (QREFELT % 50))
            |d1|)
           (#1='T
            (SEQ
             (LETT |new_name|
                   (SEQ
                    (COND
                     ((SPADCALL |name| (QREFELT % 27))
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |name| (QREFELT % 53))
                                   (QREFELT % 34)))
                        (EXIT
                         (|error| #2="convert_doc1: unexpected name form")))))
                     (#1# (EXIT (|error| #2#))))
                    (LETT |ns|
                          (SPADCALL (SPADCALL |name| (QREFELT % 47))
                                    (QREFELT % 48)))
                    (EXIT
                     (COND
                      ((EQUAL |ns| '|Zero|) (SPADCALL '|0| (QREFELT % 30)))
                      ((EQUAL |ns| '|One|) (SPADCALL '|1| (QREFELT % 30)))
                      (#1# (|error| "convert_doc1: unexpected name form"))))))
             (LETT |dl| (CDR (SPADCALL |d1| (QREFELT % 29))))
             (EXIT (SPADCALL (CONS |new_name| |dl|) (QREFELT % 46))))))))) 

(SDEFUN |BRINFO;convert_doc|
        ((|doc| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SPROG
         ((#1=#:G348 NIL) (|d1| NIL) (#2=#:G347 NIL) (|good?| (|Boolean|))
          (#3=#:G346 NIL))
         (SEQ (LETT |good?| 'T)
              (SEQ (LETT |d1| NIL) (LETT #3# |doc|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |d1| (CAR #3#)) NIL)
                         (NULL |good?|))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |good?|
                           (SPADCALL (SPADCALL |d1| (QREFELT % 47))
                                     (QREFELT % 50)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |good?|)
                (LETT |doc|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |d1| NIL) (LETT #1# |doc|) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |d1| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (|BRINFO;convert_doc1| |d1| %)
                                          #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))
              (EXIT
               (SPADCALL (CONS (|function| |BRINFO;sex_order|) %) |doc|
                         (QREFELT % 85)))))) 

(SDEFUN |BRINFO;add_origin|
        ((|sigs|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))))
        (SPROG ((#1=#:G354 NIL) (|sig| NIL) (#2=#:G353 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |sig| NIL) (LETT #1# |sigs|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sig| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (QCAR |sig|) (QCDR |sig|) |form| "")
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |BRINFO;merge_doc1|
        ((|sigs|
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|)))))
         (|doc1| (|List| (|SExpression|))) (|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|found| (|Boolean|)) (#1=#:G367 NIL) (|d1| NIL)
          (|r1|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (#2=#:G366 NIL) (|sig| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |sig| NIL) (LETT #2# |sigs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |sig| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |found| NIL)
                        (LETT |r1|
                              (VECTOR (QCAR |sig|) (QCDR |sig|) |form| ""))
                        (SEQ (LETT |d1| NIL) (LETT #1# |doc1|) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |d1| (CAR #1#)) NIL)
                                   (NULL (NULL |found|)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |d1| (QREFELT % 47))
                                           (QCAR |sig|) (QREFELT % 31))
                                 (SEQ
                                  (QSETVELT |r1| 3
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |d1| (QREFELT % 53))
                                              (QREFELT % 47))
                                             (QREFELT % 59)))
                                  (EXIT (LETT |found| 'T)))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |res| (CONS |r1| |res|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;is_attribute_doc?| ((|d1| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|sig| (|SExpression|)) (|sdl| (|List| (|SExpression|))))
               (SEQ
                (LETT |sdl|
                      (SPADCALL (SPADCALL |d1| (QREFELT % 53)) (QREFELT % 29)))
                (EXIT
                 (COND
                  ((EQL (LENGTH |sdl|) 1)
                   (SEQ
                    (LETT |sig| (SPADCALL (|SPADfirst| |sdl|) (QREFELT % 47)))
                    (EXIT
                     (SPADCALL |sig|
                               (SPADCALL
                                (LIST (SPADCALL '|attribute| (QREFELT % 30)))
                                (QREFELT % 46))
                               (QREFELT % 31)))))
                  ('T NIL)))))) 

(SDEFUN |BRINFO;merge_doc|
        ((|opl1| (|List| (|SExpression|))) (|doc| (|List| (|SExpression|)))
         (|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((#1=#:G390 NIL)
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|dname| (|Symbol|)) (|d1| (|SExpression|)) (#2=#:G388 NIL)
          (|name| (|Symbol|)) (#3=#:G389 NIL) (|r1| NIL)
          (|opl2|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sigs|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|)))))))))
         (SEQ
          (COND ((NULL |opl1|) NIL)
                ('T
                 (SEQ (LETT |opl2| (|BRINFO;convert_opl| |opl1| %))
                      (LETT |res| NIL)
                      (SEQ (LETT |r1| NIL) (LETT #3# |opl2|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |r1| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |name| (QCAR |r1|))
                                (LETT |name|
                                      (COND ((EQUAL |name| '|Zero|) '|0|)
                                            ((EQUAL |name| '|One|) '|1|)
                                            ('T |name|)))
                                (LETT |sdl|
                                      (COND
                                       ((NULL |doc|)
                                        (LETT |sdl|
                                              (|BRINFO;add_origin| (QCDR |r1|)
                                               |form| %)))
                                       ('T
                                        (SEQ (LETT |d1| (|SPADfirst| |doc|))
                                             (LETT |dname|
                                                   (SPADCALL
                                                    (SPADCALL |d1|
                                                              (QREFELT % 47))
                                                    (QREFELT % 48)))
                                             (SEQ
                                              (EXIT
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (SPADCALL |dname| |name|
                                                                 (QREFELT %
                                                                          77)))
                                                      (GO G191)))
                                                    (SEQ
                                                     (SPADCALL
                                                      (SPADCALL |d1|
                                                                (QREFELT % 58))
                                                      (QREFELT % 57))
                                                     (LETT |doc| (CDR |doc|))
                                                     (EXIT
                                                      (COND
                                                       ((NULL |doc|)
                                                        (PROGN
                                                         (LETT #2# 1)
                                                         (GO #4=#:G375)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |d1|
                                                               (|SPADfirst|
                                                                |doc|))
                                                         (EXIT
                                                          (LETT |dname|
                                                                (SPADCALL
                                                                 (SPADCALL |d1|
                                                                           (QREFELT
                                                                            %
                                                                            47))
                                                                 (QREFELT %
                                                                          48)))))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL)))
                                              #4# (EXIT #2#))
                                             (EXIT
                                              (COND
                                               ((EQUAL |name| |dname|)
                                                (SEQ (LETT |doc| (CDR |doc|))
                                                     (EXIT
                                                      (|BRINFO;merge_doc1|
                                                       (QCDR |r1|)
                                                       (SPADCALL
                                                        (SPADCALL |d1|
                                                                  (QREFELT %
                                                                           53))
                                                        (QREFELT % 29))
                                                       |form| %))))
                                               ('T
                                                (|BRINFO;add_origin|
                                                 (QCDR |r1|) |form| %))))))))
                                (EXIT
                                 (LETT |res|
                                       (CONS (CONS |name| |sdl|) |res|))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (SEQ (LETT #1# |doc|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |d1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL (SPADCALL |d1| (QREFELT % 58))
                                       (QREFELT % 57))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |res|)))))))) 

(SDEFUN |BRINFO;exports;SeR;37|
        ((|c| (|SExpression|))
         (%
          (|Record|
           (|:| |cats|
                (|List|
                 (|Record| (|:| |form| (|SExpression|))
                           (|:| |condition| (|SExpression|)))))
           (|:| |ops|
                (|List|
                 (|Record| (|:| |name| (|Symbol|))
                           (|:| |sdl|
                                (|List|
                                 (|Record| (|:| |signature| (|SExpression|))
                                           (|:| |condition| (|SExpression|))
                                           (|:| |origin| (|SExpression|))
                                           (|:| |documentation|
                                                (|String|)))))))))))
        (SPROG
         ((|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|doc| (|List| (|SExpression|))) (|opl1| (|List| (|SExpression|)))
          (|cl|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|r1| (|SExpression|)) (|con_name| (|Symbol|)))
         (SEQ
          (LETT |con_name|
                (SPADCALL (SPADCALL |c| (QREFELT % 47)) (QREFELT % 48)))
          (LETT |r1|
                (|getConstructorExports| (SPADCALL |con_name| (QREFELT % 49))
                                         'T))
          (LETT |cl| (SPADCALL |r1| (QREFELT % 47)))
          (LETT |opl1|
                (SPADCALL (SPADCALL |r1| (QREFELT % 53)) (QREFELT % 29)))
          (LETT |doc|
                (|BRINFO;convert_doc| (|BRINFO;get_ops_doc| |con_name| %) %))
          (LETT |opl| (|BRINFO;merge_doc| |opl1| |doc| |c| %))
          (EXIT (CONS |cl| |opl|))))) 

(SDEFUN |BRINFO;con_exports|
        ((|c| (|Symbol|))
         (%
          (|Record|
           (|:| |cats|
                (|List|
                 (|Record| (|:| |form| (|SExpression|))
                           (|:| |condition| (|SExpression|)))))
           (|:| |ops|
                (|List|
                 (|Record| (|:| |name| (|Symbol|))
                           (|:| |sdl|
                                (|List|
                                 (|Record| (|:| |signature| (|SExpression|))
                                           (|:| |condition| (|SExpression|))
                                           (|:| |origin| (|SExpression|))
                                           (|:| |documentation|
                                                (|String|)))))))))))
        (SPROG ((|cf| (|SExpression|)))
               (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 49)))
                    (EXIT
                     (COND
                      ((SPADCALL |cf| (QREFELT % 34))
                       (SEQ
                        (SPADCALL (SPADCALL |c| (QREFELT % 89)) (QREFELT % 57))
                        (EXIT (|error| "con_exports: not form"))))
                      ('T (SPADCALL |cf| (QREFELT % 88)))))))) 

(SDEFUN |BRINFO;flaten_opll|
        ((|ll|
          (|List|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (#1=#:G414 NIL) (|sd| NIL) (|name| (|Symbol|)) (#2=#:G413 NIL)
          (|r1| NIL) (#3=#:G412 NIL) (|l1| NIL))
         (SEQ
          (COND ((NULL |ll|) NIL)
                ('T
                 (SEQ (LETT |res1| NIL)
                      (SEQ (LETT |l1| NIL) (LETT #3# |ll|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |l1| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r1| NIL) (LETT #2# |l1|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |r1| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |name| (QCAR |r1|))
                                       (EXIT
                                        (SEQ (LETT |sd| NIL)
                                             (LETT #1# (QCDR |r1|)) G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |sd| (CAR #1#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |res1|
                                                     (CONS (CONS |name| |sd|)
                                                           |res1|))))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT NIL))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res1|))))))) 

(SDEFUN |BRINFO;fun_cmp|
        ((|f1|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (|f2|
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |sd|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|))))))
         (% (|Boolean|)))
        (SPROG
         ((|orig2| #1=(|SExpression|)) (|orig1| #1#)
          (|sig2| #2=(|SExpression|)) (|sig1| #2#)
          (|sd2|
           #3=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sd1| #3#) (|n2| #4=(|Symbol|)) (|n1| #4#))
         (SEQ (LETT |n1| (QCAR |f1|)) (LETT |n2| (QCAR |f2|))
              (EXIT
               (COND
                ((EQUAL |n1| |n2|)
                 (SEQ (LETT |sd1| (QCDR |f1|)) (LETT |sd2| (QCDR |f2|))
                      (LETT |sig1| (QVELT |sd1| 0))
                      (LETT |sig2| (QVELT |sd2| 0))
                      (EXIT
                       (COND
                        ((SPADCALL |sig1| |sig2| (QREFELT % 31))
                         (SEQ (LETT |orig1| (QVELT |sd1| 2))
                              (LETT |orig2| (QVELT |sd2| 2))
                              (EXIT
                               (COND
                                ((SPADCALL |orig1| |orig2| (QREFELT % 31))
                                 (|BRINFO;sex_order| (QVELT |sd1| 1)
                                  (QVELT |sd2| 1) %))
                                (#5='T
                                 (|BRINFO;sex_order| |orig1| |orig2| %))))))
                        (#5# (|BRINFO;sex_order| |sig1| |sig2| %))))))
                (#5# (SPADCALL |n1| |n2| (QREFELT % 77)))))))) 

(SDEFUN |BRINFO;group_funs|
        ((|fl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|oname| #1=(|Symbol|)) (|name| #1#) (#2=#:G431 NIL)
          (|f1|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (SEQ (LETT |f1| (|SPADfirst| |fl|)) (LETT |oname| (QCAR |f1|))
              (LETT |sdl| (LIST (QCDR |f1|))) (LETT |res| NIL)
              (SEQ (LETT #2# (CDR |fl|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |name| (QCAR |f1|))
                        (EXIT
                         (COND
                          ((EQUAL |name| |oname|)
                           (LETT |sdl| (CONS (QCDR |f1|) |sdl|)))
                          ('T
                           (SEQ
                            (LETT |res|
                                  (CONS (CONS |oname| (NREVERSE |sdl|)) |res|))
                            (LETT |oname| |name|)
                            (EXIT (LETT |sdl| (LIST (QCDR |f1|)))))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (CONS (CONS |oname| (NREVERSE |sdl|)) |res|))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;mangle_signature| ((|sig| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|res| (|List| (|SExpression|))) (|ns1| #1=(|SExpression|))
          (#2=#:G443 NIL) (|s11| #1#) (#3=#:G444 NIL) (|s1| NIL)
          (|sl| (|List| (|SExpression|))))
         (SEQ (LETT |sl| (SPADCALL |sig| (QREFELT % 29))) (LETT |res| NIL)
              (SEQ (LETT |s1| NIL) (LETT #3# |sl|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |s1| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ns1|
                          (SEQ
                           (EXIT
                            (SEQ
                             (COND
                              ((SPADCALL |s1| (QREFELT % 27))
                               (COND
                                ((NULL (SPADCALL |s1| (QREFELT % 34)))
                                 (COND
                                  ((SPADCALL (SPADCALL |s1| (QREFELT % 53))
                                             (QREFELT % 34))
                                   (SEQ
                                    (LETT |s11| (SPADCALL |s1| (QREFELT % 47)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |s11| (QREFELT % 50))
                                       (PROGN
                                        (LETT #2# |s11|)
                                        (GO #4=#:G438))))))))))))
                             (EXIT
                              (COND
                               ((SPADCALL |s1| (QREFELT % 27))
                                (|BRINFO;mangle_signature| |s1| %))
                               ('T |s1|)))))
                           #4# (EXIT #2#)))
                    (EXIT (LETT |res| (CONS |ns1| |res|))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT % 46)))))) 

(SDEFUN |BRINFO;mangle_condition|
        ((|c| (|SExpression|)) (|args| (|List| (|SExpression|)))
         (% (|SExpression|)))
        (SPROG ((|cl| (|List| (|SExpression|))))
               (SEQ (LETT |cl| (SPADCALL |c| (QREFELT % 29)))
                    (COND
                     ((SPADCALL (|SPADfirst| |cl|)
                                (SPADCALL 'AND (QREFELT % 30)) (QREFELT % 31))
                      (LETT |cl|
                            (CONS (SPADCALL '|and| (QREFELT % 30))
                                  (CDR |cl|)))))
                    (EXIT
                     (|sublisFormal| |args|
                                     (|BRINFO;mangle_signature|
                                      (SPADCALL |cl| (QREFELT % 46)) %)))))) 

(SDEFUN |BRINFO;fix_args|
        ((|args| (|SExpression|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|res| (|List| (|SExpression|))) (|na| #1=(|SExpression|))
          (|as| (|Symbol|)) (#2=#:G453 NIL) (|a1| NIL) (|al| (|List| #1#)))
         (SEQ (LETT |al| (SPADCALL |args| (QREFELT % 29))) (LETT |res| NIL)
              (SEQ (LETT |a1| NIL) (LETT #2# |al|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |as| (SPADCALL |a1| (QREFELT % 48)))
                        (LETT |na|
                              (COND
                               ((EQUAL |as| 'T$) (SPADCALL 'T (QREFELT % 30)))
                               ('T |a1|)))
                        (EXIT (LETT |res| (CONS |na| |res|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;mangle_signatures|
        ((|fl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (% (|Void|)))
        (SPROG
         ((#1=#:G458 NIL) (|args| (|List| (|SExpression|)))
          (|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (#2=#:G459 NIL) (|f1| NIL))
         (SEQ (LETT |f1| NIL) (LETT #2# |fl|) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL)) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |sd| (QCDR |f1|))
                     (LETT |args|
                           (|BRINFO;fix_args|
                            (SPADCALL (QVELT |sd| 2) (QREFELT % 53)) %))
                     (QSETVELT |sd| 0
                               (|sublisFormal| |args|
                                               (|BRINFO;mangle_signature|
                                                (QVELT |sd| 0) %)))
                     (EXIT
                      (COND
                       ((SPADCALL (QVELT |sd| 1) 'T (QREFELT % 31))
                        (PROGN (LETT #1# |$NoValue|) (GO #3=#:G454)))
                       ('T
                        (QSETVELT |sd| 1
                                  (|BRINFO;mangle_condition| (QVELT |sd| 1)
                                   |args| %)))))))
               #3# (EXIT #1#))
              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |BRINFO;convert_opll|
        ((|ll|
          (|List|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ
          (COND ((NULL |ll|) NIL)
                ('T
                 (SEQ (LETT |fl| (|BRINFO;flaten_opll| |ll| %))
                      (|BRINFO;mangle_signatures| |fl| %)
                      (LETT |fl|
                            (SPADCALL (CONS (|function| |BRINFO;fun_cmp|) %)
                                      |fl| (QREFELT % 93)))
                      (EXIT (|BRINFO;group_funs| |fl| %)))))))) 

(PUT '|BRINFO;all_con_names| '|SPADreplace| '|allConstructors|) 

(SDEFUN |BRINFO;all_con_names| ((% (|List| (|Symbol|)))) (|allConstructors|)) 

(SDEFUN |BRINFO;ops_from_exports;L;48|
        ((%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|opll|
           (|List|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))))
          (#1=#:G479 NIL) (#2=#:G478 NIL) (|cfl| (|List| (|SExpression|)))
          (#3=#:G476 NIL) (|cf| (|SExpression|)) (#4=#:G477 NIL) (|c| NIL)
          (|cl| (|List| (|Symbol|))))
         (SEQ (LETT |cl| (|BRINFO;all_con_names| %)) (LETT |cfl| NIL)
              (SEQ (LETT |c| NIL) (LETT #4# |cl|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |c| (QREFELT % 94))
                       (PROGN (LETT #3# |$NoValue|) (GO #5=#:G468)))
                      ('T
                       (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 49)))
                            (EXIT
                             (COND
                              ((SPADCALL |cf| (QREFELT % 34))
                               (PROGN (LETT #3# |$NoValue|) (GO #5#)))
                              ('T (LETT |cfl| (CONS |cf| |cfl|)))))))))
                    #5# (EXIT #3#))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (LETT |opll|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT #1# |cfl|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |cf| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (QCDR (SPADCALL |cf| (QREFELT % 88)))
                                        #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (EXIT (|BRINFO;convert_opll| |opll| %))))) 

(SDEFUN |BRINFO;search_operations;SU;49|
        ((|pat| (|String|))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))
           (|SExpression|))))
        (SEQ
         (COND
          ((NULL (QREFELT % 97))
           (SEQ (SETELT % 96 (SPADCALL (QREFELT % 95)))
                (EXIT (SETELT % 97 'T)))))
         (EXIT (SPADCALL |pat| (QREFELT % 96) (QREFELT % 42))))) 

(SDEFUN |BRINFO;string_to_integer|
        ((|s| (|String|)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|res| (|SExpression|)))
               (SEQ (LETT |res| (|string2Integer| |s|))
                    (EXIT
                     (COND ((SPADCALL |res| (QREFELT % 34)) (CONS 1 "failed"))
                           ('T (CONS 0 (SPADCALL |res| (QREFELT % 52))))))))) 

(SDEFUN |BRINFO;load_docs|
        ((|fl|
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (% (|Void|)))
        (SPROG
         ((|ds| (|String|)) (|k| (|Integer|))
          (|ku| (|Union| (|Integer|) "failed")) (#1=#:G497 NIL)
          (|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (#2=#:G498 NIL) (|f1| NIL))
         (SEQ (LETT |f1| NIL) (LETT #2# |fl|) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL)) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |sd| (QCDR |f1|)) (LETT |ds| (QVELT |sd| 3))
                     (EXIT
                      (COND
                       ((EQUAL |ds| "")
                        (PROGN (LETT #1# |$NoValue|) (GO #3=#:G491)))
                       ('T
                        (SEQ (LETT |ku| (|BRINFO;string_to_integer| |ds| %))
                             (EXIT
                              (COND
                               ((QEQCAR |ku| 0)
                                (SEQ (LETT |k| (QCDR |ku|))
                                     (LETT |ds|
                                           (COND ((< |k| 2) "")
                                                 ('T (|dbReadComments| |k|))))
                                     (EXIT (QSETVELT |sd| 3 |ds|))))))))))))
               #3# (EXIT #1#))
              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |BRINFO;ops_from_libdb;L;52|
        ((%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|opl1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|res1|
           (|Union|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
            (|SExpression|))))
         (SEQ (LETT |res1| (SPADCALL "*" (QREFELT % 99)))
              (EXIT
               (COND
                ((QEQCAR |res1| 1) (|error| "ops_from_libdb: search failed"))
                ('T
                 (SEQ (LETT |opl1| (QCDR |res1|))
                      (LETT |fl| (|BRINFO;flaten_opll| (LIST |opl1|) %))
                      (|BRINFO;load_docs| |fl| %)
                      (LETT |fl|
                            (SPADCALL (CONS (|function| |BRINFO;fun_cmp|) %)
                                      |fl| (QREFELT % 93)))
                      (EXIT (|BRINFO;group_funs| |fl| %))))))))) 

(SDEFUN |BRINFO;constructor_kind;2S;53| ((|name| (|Symbol|)) (% (|Symbol|)))
        (|get_database| |name| 'CONSTRUCTORKIND)) 

(SDEFUN |BRINFO;ancestors;SeBL;54|
        ((|form| (|SExpression|)) (|use_args?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG ((|domname| (|SExpression|)))
               (SEQ
                (LETT |domname|
                      (COND (|use_args?| |form|)
                            ('T (SPADCALL NIL (QREFELT % 46)))))
                (EXIT (|ancestorsOf| |form| |domname|))))) 

(SDEFUN |BRINFO;parents;SeL;55|
        ((|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (COND ((SPADCALL |form| (QREFELT % 50)) (|parentsOf| |form|))
              ('T (|parentsOfForm| |form|)))) 

(SDEFUN |BRINFO;default_name?;SB;56| ((|n| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|ns| (|String|)))
               (SEQ (LETT |ns| (SPADCALL |n| (QREFELT % 36)))
                    (EXIT
                     (|eql_SI| (SPADCALL |ns| (QCSIZE |ns|) (QREFELT % 20))
                               (|STR_to_CHAR| "&")))))) 

(SDEFUN |BRINFO;split_constructors|
        ((|lst| (|List| (|Symbol|)))
         (%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((|packs| #1=(|List| (|Symbol|))) (|doms| #1#) (|cats| #1#)
          (|kind| (|Symbol|)) (#2=#:G528 NIL) (#3=#:G529 NIL) (|n| NIL))
         (SEQ (LETT |cats| (LETT |doms| (LETT |packs| NIL)))
              (SEQ (LETT |n| NIL) (LETT #3# |lst|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |n| (QREFELT % 94))
                           (EQUAL |n| '|Category|))
                       (PROGN (LETT #2# |$NoValue|) (GO #4=#:G519)))
                      ('T
                       (SEQ (LETT |kind| (SPADCALL |n| (QREFELT % 101)))
                            (EXIT
                             (COND
                              ((EQUAL |kind| '|category|)
                               (LETT |cats| (CONS |n| |cats|)))
                              ((EQUAL |kind| '|domain|)
                               (LETT |doms| (CONS |n| |doms|)))
                              ((EQUAL |kind| '|package|)
                               (LETT |packs| (CONS |n| |packs|)))
                              ('T
                               (|error|
                                "split_constructors: Unknown constructor kind"))))))))
                    #4# (EXIT #2#))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |cats| (NREVERSE |cats|)) (LETT |doms| (NREVERSE |doms|))
              (LETT |packs| (NREVERSE |packs|))
              (EXIT (VECTOR |cats| |doms| |packs|))))) 

(SDEFUN |BRINFO;all_constructors;R;58|
        ((%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((|cnl| (|List| (|Symbol|))) (#1=#:G537 NIL) (|cn| NIL)
          (#2=#:G536 NIL))
         (SEQ
          (LETT |cnl|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |cn| NIL) (LETT #1# (|BRINFO;all_con_names| %))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |cn| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |cn| (QREFELT % 94)))
                          (LETT #2# (CONS |cn| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (|BRINFO;split_constructors| (SPADCALL |cnl| (QREFELT % 106)) %))))) 

(SDEFUN |BRINFO;split_ops|
        ((|lst| (|List| (|String|)))
         (%
          (|Record| (|:| |con| (|List| (|Symbol|)))
                    (|:| |opl| (|List| (|String|))))))
        (SPROG
         ((|opl| (|List| (|String|))) (|cnl| (|List| (|Symbol|)))
          (|sym| (|Symbol|)) (|k| (|Integer|)) (#1=#:G545 NIL) (|str| NIL))
         (SEQ (LETT |opl| NIL) (LETT |cnl| NIL) (LETT |opl| NIL)
              (SEQ (LETT |str| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |str| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|eql_SI| (SPADCALL |str| 1 (QREFELT % 20))
                                 (|STR_to_CHAR| "o"))
                       (LETT |opl| (CONS |str| |opl|)))
                      ('T
                       (SEQ
                        (LETT |k|
                              (SPADCALL (QREFELT % 15) |str| (QREFELT % 109)))
                        (LETT |sym|
                              (SPADCALL
                               (SPADCALL |str|
                                         (SPADCALL 2 (- |k| 1) (QREFELT % 111))
                                         (QREFELT % 112))
                               (QREFELT % 113)))
                        (EXIT (LETT |cnl| (CONS |sym| |cnl|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |cnl| (NREVERSE |cnl|)) (LETT |opl| (NREVERSE |opl|))
              (EXIT (CONS |cnl| |opl|))))) 

(SDEFUN |BRINFO;filter_symbols;Se2L;60|
        ((|pc| (|SExpression|)) (|sl| (|List| (|Symbol|)))
         (% (|List| (|Symbol|))))
        (SPROG ((|res| (|List| (|Symbol|))) (#1=#:G551 NIL) (|sy| NIL))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |sy| NIL) (LETT #1# |sl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |sy| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |pc| (SPADCALL |sy| (QREFELT % 36))
                                       (QREFELT % 35))
                             (LETT |res| (CONS |sy| |res|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;search_constructors;SSU;61|
        ((|pat| (|String|)) (|tag| (|Symbol|))
         (%
          (|Union|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))
           (|SExpression|))))
        (SPROG
         ((|res1|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|cnl2| (|List| (|Symbol|))) (|cnl| (|List| (|Symbol|)))
          (#1=#:G568 NIL) (|cn| NIL) (#2=#:G567 NIL) (|pc| (|SExpression|)))
         (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 33)))
              (EXIT
               (COND ((SPADCALL |pc| (QREFELT % 32)) (CONS 1 |pc|))
                     (#3='T
                      (SEQ
                       (LETT |cnl|
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |cn| NIL)
                                   (LETT #1# (|BRINFO;all_con_names| %)) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |cn| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |cn| (QREFELT % 94)))
                                       (LETT #2# (CONS |cn| #2#))))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                       (LETT |cnl2| (SPADCALL |pc| |cnl| (QREFELT % 114)))
                       (LETT |res1|
                             (|BRINFO;split_constructors|
                              (SPADCALL |cnl2| (QREFELT % 106)) %))
                       (EXIT
                        (COND ((EQUAL |tag| '|k|) (CONS 0 |res1|))
                              ((EQUAL |tag| '|c|)
                               (CONS 0 (VECTOR (QVELT |res1| 0) NIL NIL)))
                              ((EQUAL |tag| '|d|)
                               (CONS 0 (VECTOR NIL (QVELT |res1| 1) NIL)))
                              ((EQUAL |tag| '|p|)
                               (CONS 0 (VECTOR NIL NIL (QVELT |res1| 2))))
                              (#3# (|error| "unimplemented"))))))))))) 

(SDEFUN |BRINFO;get_conname| ((|form| (|String|)) (% (|String|)))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (SPADCALL (QREFELT % 13) |form| (QREFELT % 109)))
                    (EXIT
                     (COND
                      ((< |k| 1)
                       (SPADCALL |form|
                                 (SPADCALL 2 (QCSIZE |form|) (QREFELT % 111))
                                 (QREFELT % 112)))
                      ('T
                       (SPADCALL |form| (SPADCALL 2 (- |k| 1) (QREFELT % 111))
                                 (QREFELT % 112)))))))) 

(PUT '|BRINFO;constructor_form;SSe;63| '|SPADreplace| '|getConstructorForm|) 

(SDEFUN |BRINFO;constructor_form;SSe;63|
        ((|name| (|Symbol|)) (% (|SExpression|))) (|getConstructorForm| |name|)) 

(SDEFUN |BRINFO;get_constructor_args|
        ((|name| (|Symbol|)) (% (|List| (|SExpression|))))
        (SPROG ((|form| (|List| (|SExpression|))))
               (SEQ
                (LETT |form|
                      (SPADCALL (SPADCALL |name| (QREFELT % 49))
                                (QREFELT % 29)))
                (EXIT (CDR |form|))))) 

(SDEFUN |BRINFO;constructor_documentation;SS;65|
        ((|name| (|Symbol|)) (% (|String|)))
        (SPROG ((|doc| (|List| (|SExpression|))) (|e1| (|SExpression|)))
               (SEQ (LETT |doc| (|get_database| |name| 'DOCUMENTATION))
                    (EXIT
                     (COND ((NULL |doc|) "")
                           ('T
                            (SEQ
                             (LETT |doc|
                                   (SPADCALL (|SPADfirst| |doc|)
                                             (QREFELT % 29)))
                             (LETT |e1| (|SPADfirst| |doc|))
                             (COND
                              ((NULL
                                (EQUAL (SPADCALL |e1| (QREFELT % 48))
                                       '|constructor|))
                               (EXIT "")))
                             (LETT |doc|
                                   (SPADCALL (SPADCALL |doc| 2 (QREFELT % 75))
                                             (QREFELT % 29)))
                             (EXIT
                              (SPADCALL (SPADCALL |doc| 2 (QREFELT % 75))
                                        (QREFELT % 59)))))))))) 

(SDEFUN |BRINFO;expand_op_line|
        ((|l1| (|String|))
         (%
          (|Record| (|:| |name| (|Symbol|))
                    (|:| |opr|
                         (|Record| (|:| |signature| (|SExpression|))
                                   (|:| |condition| (|SExpression|))
                                   (|:| |origin| (|SExpression|))
                                   (|:| |documentation| (|String|)))))))
        (SPROG
         ((|orig_l| (|List| (|SExpression|))) (|con_sym| (|Symbol|))
          (|sig| (|SExpression|)) (|pred| (|SExpression|)) (|name| (|Symbol|))
          (|doc| NIL) (|#G141| #1=(|List| (|String|))) (|pred_s| NIL)
          (|origs| NIL) (|sig_s| NIL) (|xflag| NIL) (|nargs| NIL)
          (|name_s| NIL) (|#G140| #1#) (|els| #1#))
         (SEQ (LETT |els| (|dbParts| |l1| 7 1))
              (PROGN
               (LETT |#G140| |els|)
               (LETT |#G141| |#G140|)
               (LETT |name_s| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |nargs| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |xflag| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |sig_s| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |origs| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |pred_s| (|SPADfirst| |#G141|))
               (LETT |#G141| (CDR |#G141|))
               (LETT |doc| (|SPADfirst| |#G141|))
               |#G140|)
              (LETT |name| (SPADCALL |name_s| (QREFELT % 113)))
              (LETT |pred| (SPADCALL |pred_s| (QREFELT % 119)))
              (COND ((SPADCALL |pred| (QREFELT % 34)) (LETT |pred| 'T)))
              (LETT |sig| (SPADCALL |sig_s| (QREFELT % 119)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |sig| (QREFELT % 47))
                           (SPADCALL '|Mapping| (QREFELT % 30))
                           (QREFELT % 120))
                 (|error| "expand_op_lines: unexpected signature"))
                ('T
                 (SEQ (LETT |sig| (SPADCALL |sig| (QREFELT % 53)))
                      (LETT |con_sym|
                            (SPADCALL (|BRINFO;get_conname| |origs| %)
                                      (QREFELT % 113)))
                      (LETT |orig_l|
                            (CONS (SPADCALL |con_sym| (QREFELT % 30))
                                  (|BRINFO;get_constructor_args| |con_sym| %)))
                      (EXIT
                       (CONS |name|
                             (VECTOR |sig| |pred|
                                     (SPADCALL |orig_l| (QREFELT % 46))
                                     |doc|)))))))))) 

(SDEFUN |BRINFO;expand_op_lines|
        ((|lst| (|List| (|String|)))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|res1|
           (|List|
            #1=(|Record| (|:| |signature| (|SExpression|))
                         (|:| |condition| (|SExpression|))
                         (|:| |origin| (|SExpression|))
                         (|:| |documentation| (|String|)))))
          (|oname| #2=(|Symbol|)) (|sig1| #1#) (|name| #2#)
          (|#G152|
           #3=(|Record| (|:| |name| (|Symbol|))
                        (|:| |opr|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (#4=#:G596 NIL) (|l1| NIL) (|#G150| #3#))
         (SEQ
          (COND ((NULL |lst|) NIL)
                ('T
                 (SEQ (LETT |lst| (SPADCALL |lst| (QREFELT % 122)))
                      (LETT |res| NIL)
                      (PROGN
                       (LETT |#G150|
                             (|BRINFO;expand_op_line| (|SPADfirst| |lst|) %))
                       (LETT |oname| (QCAR |#G150|))
                       (LETT |sig1| (QCDR |#G150|))
                       |#G150|)
                      (LETT |lst| (CDR |lst|)) (LETT |res1| (LIST |sig1|))
                      (SEQ (LETT |l1| NIL) (LETT #4# |lst|) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |l1| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (PROGN
                             (LETT |#G152| (|BRINFO;expand_op_line| |l1| %))
                             (LETT |name| (QCAR |#G152|))
                             (LETT |sig1| (QCDR |#G152|))
                             |#G152|)
                            (EXIT
                             (COND
                              ((EQUAL |name| |oname|)
                               (LETT |res1| (CONS |sig1| |res1|)))
                              ('T
                               (SEQ
                                (LETT |res|
                                      (CONS (CONS |oname| (NREVERSE |res1|))
                                            |res|))
                                (LETT |oname| |name|)
                                (EXIT (LETT |res1| (LIST |sig1|))))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (LETT |res|
                            (CONS (CONS |oname| (NREVERSE |res1|)) |res|))
                      (EXIT (NREVERSE |res|)))))))) 

(SDEFUN |BRINFO;search_operations_libdb;SU;68|
        ((|pat| (|String|))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))
           (|SExpression|))))
        (SPROG ((|res1| (|List| (|SExpression|))))
               (SEQ (LETT |res1| (|grepConstruct| |pat| '|o|))
                    (EXIT
                     (COND ((NULL |res1|) (CONS 0 NIL))
                           ((NULL (STRINGP (|SPADfirst| |res1|)))
                            (CONS 1 |res1|))
                           ('T
                            (CONS 0 (|BRINFO;expand_op_lines| |res1| %)))))))) 

(SDEFUN |BRINFO;add_stars| ((|pc| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|args| (|List| (|SExpression|))) (#1=#:G614 NIL) (|arg| NIL)
          (#2=#:G613 NIL) (|op| (|SExpression|)) (|post| (|String|))
          (|pre| (|String|)) (|pat1| (|String|)))
         (SEQ
          (COND
           ((SPADCALL |pc| (QREFELT % 61))
            (SEQ (LETT |pat1| (SPADCALL |pc| (QREFELT % 59)))
                 (LETT |pre|
                       (COND
                        ((|eql_SI| (SPADCALL |pat1| 1 (QREFELT % 20))
                                   (QREFELT % 14))
                         "")
                        (#3='T "*")))
                 (LETT |post|
                       (COND
                        ((|eql_SI|
                          (SPADCALL |pat1| (QCSIZE |pat1|) (QREFELT % 20))
                          (QREFELT % 14))
                         "")
                        (#3# "*")))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (LIST |pre| |pat1| |post|) (QREFELT % 123))
                   (QREFELT % 124)))))
           ((SPADCALL |pc| (QREFELT % 27))
            (SEQ (LETT |op| (SPADCALL |pc| (QREFELT % 47)))
                 (LETT |args|
                       (SPADCALL (SPADCALL |pc| (QREFELT % 53))
                                 (QREFELT % 29)))
                 (LETT |args|
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |arg| NIL) (LETT #1# |args|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |arg| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS (|BRINFO;add_stars| |arg| %) #2#))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (EXIT (SPADCALL (CONS |op| |args|) (QREFELT % 46)))))
           (#3# (|error| "add_stars: unimplemented")))))) 

(SDEFUN |BRINFO;search_ops_doc|
        ((|pc| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sdl|
                          (|List|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (#1=#:G627 NIL) (|sd| NIL) (|name| (|Symbol|)) (#2=#:G626 NIL)
          (|opr| NIL))
         (SEQ
          (COND
           ((NULL (QREFELT % 97))
            (SEQ (SETELT % 96 (SPADCALL (QREFELT % 95)))
                 (EXIT (SETELT % 97 'T)))))
          (LETT |res| NIL)
          (SEQ (LETT |opr| NIL) (LETT #2# (QREFELT % 96)) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |opr| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |name| (QCAR |opr|))
                    (EXIT
                     (SEQ (LETT |sd| NIL) (LETT #1# (QCDR |opr|)) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |sd| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |pc| (QVELT |sd| 3) (QREFELT % 35))
                              (LETT |res| (CONS (CONS |name| |sd|) |res|))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT (|BRINFO;group_funs| (NREVERSE |res|) %))))) 

(SDEFUN |BRINFO;search_con_doc|
        ((|pc| (|SExpression|))
         (%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((|res1| (|List| (|Symbol|))) (|doc| (|String|)) (#1=#:G638 NIL)
          (|cn| NIL) (|cnl| (|List| (|Symbol|))) (#2=#:G637 NIL)
          (#3=#:G636 NIL))
         (SEQ
          (LETT |cnl|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |cn| NIL) (LETT #2# (|BRINFO;all_con_names| %))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |cn| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |cn| (QREFELT % 94)))
                          (LETT #3# (CONS |cn| #3#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |res1| NIL)
          (SEQ (LETT |cn| NIL) (LETT #1# |cnl|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |cn| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |doc| (SPADCALL |cn| (QREFELT % 117)))
                    (EXIT
                     (COND
                      ((SPADCALL |pc| (SPADCALL |cn| (QREFELT % 117))
                                 (QREFELT % 35))
                       (LETT |res1| (CONS |cn| |res1|))))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|BRINFO;split_constructors| (SPADCALL |res1| (QREFELT % 106)) %))))) 

(SDEFUN |BRINFO;search_documentation;SU;72|
        ((|pat| (|String|))
         (%
          (|Union|
           (|Record|
            (|:| |con_info|
                 (|Record| (|:| |categories| (|List| (|Symbol|)))
                           (|:| |domains| (|List| (|Symbol|)))
                           (|:| |packages| (|List| (|Symbol|)))))
            (|:| |op_info|
                 (|List|
                  (|Record| (|:| |name| (|Symbol|))
                            (|:| |sdl|
                                 (|List|
                                  (|Record| (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|)))))))))
           (|SExpression|))))
        (SPROG
         ((|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|cl|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|pc| (|SExpression|)))
         (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 33)))
              (EXIT
               (COND ((SPADCALL |pc| (QREFELT % 32)) (CONS 1 |pc|))
                     ('T
                      (SEQ (LETT |pc| (|BRINFO;add_stars| |pc| %))
                           (LETT |cl| (|BRINFO;search_con_doc| |pc| %))
                           (LETT |opl| (|BRINFO;search_ops_doc| |pc| %))
                           (EXIT (CONS 0 (CONS |cl| |opl|)))))))))) 

(SDEFUN |BRINFO;search_general;SU;73|
        ((|pat| (|String|))
         (%
          (|Union|
           (|Record|
            (|:| |con_info|
                 (|Record| (|:| |categories| (|List| (|Symbol|)))
                           (|:| |domains| (|List| (|Symbol|)))
                           (|:| |packages| (|List| (|Symbol|)))))
            (|:| |op_info|
                 (|List|
                  (|Record| (|:| |name| (|Symbol|))
                            (|:| |sdl|
                                 (|List|
                                  (|Record| (|:| |signature| (|SExpression|))
                                            (|:| |condition| (|SExpression|))
                                            (|:| |origin| (|SExpression|))
                                            (|:| |documentation|
                                                 (|String|)))))))))
           (|SExpression|))))
        (SPROG
         ((|ou|
           (|Union|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
            (|SExpression|)))
          (|cu|
           (|Union|
            (|Record| (|:| |categories| (|List| (|Symbol|)))
                      (|:| |domains| (|List| (|Symbol|)))
                      (|:| |packages| (|List| (|Symbol|))))
            (|SExpression|))))
         (SEQ (LETT |cu| (SPADCALL |pat| '|k| (QREFELT % 116)))
              (EXIT
               (COND ((QEQCAR |cu| 1) (CONS 1 (QCDR |cu|)))
                     (#1='T
                      (SEQ (LETT |ou| (SPADCALL |pat| (QREFELT % 98)))
                           (EXIT
                            (COND ((QEQCAR |ou| 1) (CONS 1 (QCDR |ou|)))
                                  (#1#
                                   (CONS 0
                                         (CONS (QCDR |cu|)
                                               (QCDR |ou|))))))))))))) 

(DECLAIM (NOTINLINE |BrowserInformation;|)) 

(DEFUN |BrowserInformation;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BrowserInformation|))
          (LETT % (GETREFV 131))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BrowserInformation| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (|STR_to_CHAR| "a"))
          (QSETREFV % 11 (|STR_to_CHAR| "A"))
          (QSETREFV % 12 (|STR_to_CHAR| "Z"))
          (QSETREFV % 13 (|STR_to_CHAR| "("))
          (QSETREFV % 14 (|STR_to_CHAR| "*"))
          (QSETREFV % 15 (|STR_to_CHAR| "`"))
          (QSETREFV % 96 NIL)
          (QSETREFV % 97 NIL)
          %))) 

(DEFUN |BrowserInformation| ()
  (SPROG NIL
         (PROG (#1=#:G666)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BrowserInformation|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BrowserInformation|
                             (LIST
                              (CONS NIL (CONS 1 (|BrowserInformation;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BrowserInformation|)))))))))) 

(MAKEPROP '|BrowserInformation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SExpression|) (|Symbol|) (|List| 6)
              |BRINFO;constructor_signature;SLSe;1| '|char_a| '|char_A|
              '|char_Z| '|char_lpar| '|char_star| '|char_tick| (|Character|)
              (0 . |space|) (|Integer|) (|String|) (4 . |elt|) (|Boolean|)
              (10 . >=) (16 . <=) (22 . |char|) (27 . |setelt!|)
              |BRINFO;downcase;2S;2| (34 . |list?|) (|List| %)
              (39 . |destruct|) (44 . |convert|) (49 . =)
              |BRINFO;is_error?;SeB;3| |BRINFO;convert_pattern;SSe;4|
              (55 . |null?|) |BRINFO;do_match;SeSB;5| (60 . |string|)
              (|Record| (|:| |signature| 6) (|:| |condition| 6)
                        (|:| |origin| 6) (|:| |documentation| 19))
              (|Record| (|:| |name| 7) (|:| |sdl| (|List| 37))) (|List| 38)
              |BRINFO;filter_ops;Se2L;6| (|Union| 39 6)
              |BRINFO;search_opl;SLU;7| |BRINFO;constructor_name?;SB;8|
              |BRINFO;exposed_constructor?;SB;9|
              |BRINFO;simp_ops_conditions;L2SeL;10| (65 . |convert|)
              (70 . |car|) (75 . |symbol|) |BRINFO;constructor_form;SSe;63|
              (80 . |symbol?|) (85 . |integer?|) (90 . |integer|) (95 . |cdr|)
              (|OutputForm|) (100 . |message|) (|Void|) (105 . |print|)
              (110 . |coerce|) (115 . |string|) |BRINFO;operations;SeBL;11|
              (120 . |string?|)
              (|Record| (|:| |i| 18) (|:| |name| 7) (|:| |sd| 37))
              (|Mapping| 21 62 62) (|List| 62) (125 . |sort|)
              (|Record| (|:| |grp_tag| 6) (|:| |i| 18) (|:| |name| 7)
                        (|:| |sd| 37))
              (|Mapping| 21 66 66) (|List| 66) (131 . |sort|)
              (|Record| (|:| |grp_tag| 6) (|:| |ops| 39)) (|List| 70)
              |BRINFO;group_by_condition;LL;18| |BRINFO;group_by_origin;LL;19|
              |BRINFO;group_by_implementation;LSeLL;20| (137 . |elt|) (143 . =)
              (149 . <) (|Record| (|:| |signature| 6) (|:| |condition| 6))
              (155 . =) (|Record| (|:| |name| 7) (|:| |sigs| (|List| 78)))
              (|Mapping| 21 80 80) (|List| 80) (161 . |sort|)
              (|Mapping| 21 6 6) (167 . |sort|)
              (|Record| (|:| |form| 6) (|:| |condition| 6))
              (|Record| (|:| |cats| 102) (|:| |ops| 39))
              |BRINFO;exports;SeR;37| (173 . |coerce|)
              (|Record| (|:| |name| 7) (|:| |sd| 37)) (|Mapping| 21 90 90)
              (|List| 90) (178 . |sort|) |BRINFO;default_name?;SB;56|
              |BRINFO;ops_from_exports;L;48| '|all_ops| '|all_ops_initialized|
              |BRINFO;search_operations;SU;49|
              |BRINFO;search_operations_libdb;SU;68|
              |BRINFO;ops_from_libdb;L;52| |BRINFO;constructor_kind;2S;53|
              (|List| 86) |BRINFO;ancestors;SeBL;54| |BRINFO;parents;SeL;55|
              (|List| 7) (184 . |sort|)
              (|Record| (|:| |categories| 105) (|:| |domains| 105)
                        (|:| |packages| 105))
              |BRINFO;all_constructors;R;58| (189 . |position|)
              (|UniversalSegment| 18) (195 . SEGMENT) (201 . |elt|)
              (207 . |coerce|) |BRINFO;filter_symbols;Se2L;60| (|Union| 107 6)
              |BRINFO;search_constructors;SSU;61|
              |BRINFO;constructor_documentation;SS;65| (|InputForm|)
              (212 . |parse|) (217 . ~=) (|List| 19) (223 . |sort|)
              (228 . |concat|) (233 . |convert|)
              (|Record| (|:| |con_info| 107) (|:| |op_info| 39))
              (|Union| 125 6) |BRINFO;search_documentation;SU;72|
              |BRINFO;search_general;SU;73|
              (|Record| (|:| |grp_tag| 6) (|:| |constrs| 102)) (|List| 129))
           '#(|simp_ops_conditions| 238 |search_opl| 245
              |search_operations_libdb| 251 |search_operations| 256
              |search_general| 261 |search_documentation| 266
              |search_constructors| 271 |parents| 277 |ops_from_libdb| 282
              |ops_from_exports| 286 |operations| 290 |is_error?| 296
              |group_by_origin| 301 |group_by_implementation| 306
              |group_by_condition| 313 |filter_symbols| 323 |filter_ops| 329
              |exposed_constructor?| 335 |exports| 340 |downcase| 345
              |do_match| 350 |default_name?| 356 |convert_pattern| 361
              |constructor_signature| 366 |constructor_name?| 372
              |constructor_kind| 377 |constructor_form| 382
              |constructor_documentation| 387 |ancestors| 392
              |all_constructors| 398)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|constructor_documentation|
                                 ((|String|) (|Symbol|)))
                                T)
                              '((|constructor_form|
                                 ((|SExpression|) (|Symbol|)))
                                T)
                              '((|constructor_kind| ((|Symbol|) (|Symbol|))) T)
                              '((|constructor_name?| ((|Boolean|) (|Symbol|)))
                                T)
                              '((|constructor_signature|
                                 ((|SExpression|) (|Symbol|)
                                  (|List| (|SExpression|))))
                                T)
                              '((|default_name?| ((|Boolean|) (|Symbol|))) T)
                              '((|exposed_constructor?|
                                 ((|Boolean|) (|Symbol|)))
                                T)
                              '((|exports|
                                 ((|Record|
                                   (|:| |cats|
                                        (|List|
                                         (|Record| (|:| |form| (|SExpression|))
                                                   (|:| |condition|
                                                        (|SExpression|)))))
                                   (|:| |ops|
                                        (|List|
                                         (|Record| (|:| |name| (|Symbol|))
                                                   (|:| |sdl|
                                                        (|List|
                                                         (|Record|
                                                          (|:| |signature|
                                                               (|SExpression|))
                                                          (|:| |condition|
                                                               (|SExpression|))
                                                          (|:| |origin|
                                                               (|SExpression|))
                                                          (|:| |documentation|
                                                               (|String|)))))))))
                                  (|SExpression|)))
                                T)
                              '((|ancestors|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|) (|Boolean|)))
                                T)
                              '((|parents|
                                 ((|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))
                                  (|SExpression|)))
                                T)
                              '((|operations|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|SExpression|) (|Boolean|)))
                                T)
                              '((|simp_ops_conditions|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|SExpression|) (|SExpression|)))
                                T)
                              '((|all_constructors|
                                 ((|Record|
                                   (|:| |categories| (|List| (|Symbol|)))
                                   (|:| |domains| (|List| (|Symbol|)))
                                   (|:| |packages| (|List| (|Symbol|))))))
                                T)
                              '((|search_constructors|
                                 ((|Union|
                                   (|Record|
                                    (|:| |categories| (|List| (|Symbol|)))
                                    (|:| |domains| (|List| (|Symbol|)))
                                    (|:| |packages| (|List| (|Symbol|))))
                                   (|SExpression|))
                                  (|String|) (|Symbol|)))
                                T)
                              '((|search_operations|
                                 ((|Union|
                                   (|List|
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |sdl|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |signature|
                                                          (|SExpression|))
                                                     (|:| |condition|
                                                          (|SExpression|))
                                                     (|:| |origin|
                                                          (|SExpression|))
                                                     (|:| |documentation|
                                                          (|String|)))))))
                                   (|SExpression|))
                                  (|String|)))
                                T)
                              '((|search_documentation|
                                 ((|Union|
                                   (|Record|
                                    (|:| |con_info|
                                         (|Record|
                                          (|:| |categories|
                                               (|List| (|Symbol|)))
                                          (|:| |domains| (|List| (|Symbol|)))
                                          (|:| |packages|
                                               (|List| (|Symbol|)))))
                                    (|:| |op_info|
                                         (|List|
                                          (|Record| (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|)))))))))
                                   (|SExpression|))
                                  (|String|)))
                                T)
                              '((|search_general|
                                 ((|Union|
                                   (|Record|
                                    (|:| |con_info|
                                         (|Record|
                                          (|:| |categories|
                                               (|List| (|Symbol|)))
                                          (|:| |domains| (|List| (|Symbol|)))
                                          (|:| |packages|
                                               (|List| (|Symbol|)))))
                                    (|:| |op_info|
                                         (|List|
                                          (|Record| (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|)))))))))
                                   (|SExpression|))
                                  (|String|)))
                                T)
                              '((|group_by_condition|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |constrs|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |form|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|)))))))
                                  (|List|
                                   (|Record| (|:| |form| (|SExpression|))
                                             (|:| |condition|
                                                  (|SExpression|))))))
                                T)
                              '((|group_by_origin|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |ops|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|))))))))))
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|group_by_condition|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |ops|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|))))))))))
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|group_by_implementation|
                                 ((|List|
                                   (|Record| (|:| |grp_tag| (|SExpression|))
                                             (|:| |ops|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |name| (|Symbol|))
                                                    (|:| |sdl|
                                                         (|List|
                                                          (|Record|
                                                           (|:| |signature|
                                                                (|SExpression|))
                                                           (|:| |condition|
                                                                (|SExpression|))
                                                           (|:| |origin|
                                                                (|SExpression|))
                                                           (|:| |documentation|
                                                                (|String|))))))))))
                                  (|List| (|SExpression|)) (|SExpression|)
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|search_opl|
                                 ((|Union|
                                   (|List|
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |sdl|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |signature|
                                                          (|SExpression|))
                                                     (|:| |condition|
                                                          (|SExpression|))
                                                     (|:| |origin|
                                                          (|SExpression|))
                                                     (|:| |documentation|
                                                          (|String|)))))))
                                   (|SExpression|))
                                  (|String|)
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|is_error?| ((|Boolean|) (|SExpression|))) T)
                              '((|convert_pattern|
                                 ((|SExpression|) (|String|)))
                                T)
                              '((|do_match|
                                 ((|Boolean|) (|SExpression|) (|String|)))
                                T)
                              '((|filter_ops|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))
                                  (|SExpression|)
                                  (|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|filter_symbols|
                                 ((|List| (|Symbol|)) (|SExpression|)
                                  (|List| (|Symbol|))))
                                T)
                              '((|ops_from_exports|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|ops_from_libdb|
                                 ((|List|
                                   (|Record| (|:| |name| (|Symbol|))
                                             (|:| |sdl|
                                                  (|List|
                                                   (|Record|
                                                    (|:| |signature|
                                                         (|SExpression|))
                                                    (|:| |condition|
                                                         (|SExpression|))
                                                    (|:| |origin|
                                                         (|SExpression|))
                                                    (|:| |documentation|
                                                         (|String|)))))))))
                                T)
                              '((|search_operations_libdb|
                                 ((|Union|
                                   (|List|
                                    (|Record| (|:| |name| (|Symbol|))
                                              (|:| |sdl|
                                                   (|List|
                                                    (|Record|
                                                     (|:| |signature|
                                                          (|SExpression|))
                                                     (|:| |condition|
                                                          (|SExpression|))
                                                     (|:| |origin|
                                                          (|SExpression|))
                                                     (|:| |documentation|
                                                          (|String|)))))))
                                   (|SExpression|))
                                  (|String|)))
                                T)
                              '((|downcase| ((|String|) (|String|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 130
                                            '(0 16 0 17 2 19 16 0 18 20 2 16 21
                                              0 0 22 2 16 21 0 0 23 1 16 0 18
                                              24 3 19 16 0 18 16 25 1 6 21 0 27
                                              1 6 28 0 29 1 6 0 7 30 2 6 21 0 0
                                              31 1 6 21 0 34 1 7 19 0 36 1 6 0
                                              28 46 1 6 0 0 47 1 6 7 0 48 1 6
                                              21 0 50 1 6 21 0 51 1 6 18 0 52 1
                                              6 0 0 53 1 54 0 19 55 1 54 56 0
                                              57 1 6 54 0 58 1 6 19 0 59 1 6 21
                                              0 61 2 64 0 63 0 65 2 68 0 67 0
                                              69 2 8 6 0 18 75 2 37 21 0 0 76 2
                                              7 21 0 0 77 2 78 21 0 0 79 2 82 0
                                              81 0 83 2 8 0 84 0 85 1 7 54 0 89
                                              2 92 0 91 0 93 1 105 0 0 106 2 19
                                              18 16 0 109 2 110 0 18 18 111 2
                                              19 0 0 110 112 1 7 0 19 113 1 118
                                              0 19 119 2 6 21 0 0 120 1 121 0 0
                                              122 1 19 0 28 123 1 6 0 19 124 3
                                              0 39 39 6 6 45 2 0 41 19 39 42 1
                                              0 41 19 99 1 0 41 19 98 1 0 126
                                              19 128 1 0 126 19 127 2 0 115 19
                                              7 116 1 0 102 6 104 0 0 39 100 0
                                              0 39 95 2 0 39 6 21 60 1 0 21 6
                                              32 1 0 71 39 73 3 0 71 8 6 39 74
                                              1 0 71 39 72 1 0 130 102 1 2 0
                                              105 6 105 114 2 0 39 6 39 40 1 0
                                              21 7 44 1 0 87 6 88 1 0 19 19 26
                                              2 0 21 6 19 35 1 0 21 7 94 1 0 6
                                              19 33 2 0 6 7 8 9 1 0 21 7 43 1 0
                                              7 7 101 1 0 6 7 49 1 0 19 7 117 2
                                              0 102 6 21 103 0 0 107 108)))))
           '|lookupComplete|)) 
