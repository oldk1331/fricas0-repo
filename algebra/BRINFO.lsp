
(MAKEPROP '|BRINFO;sublis_formal;L2Se;1| '|SPADreplace| '|sublisFormal|) 

(SDEFUN |BRINFO;sublis_formal;L2Se;1|
        ((|args| (|List| (|SExpression|))) (|expr| (|SExpression|))
         (% (|SExpression|)))
        (|sublisFormal| |args| |expr|)) 

(SDEFUN |BRINFO;constructor_signature;SLSe;2|
        ((|conname| (|Symbol|)) (|args| (|List| (|SExpression|)))
         (% (|SExpression|)))
        (SPROG ((|sig| (|SExpression|)))
               (SEQ (LETT |sig| (|getConstructorSignature| |conname|))
                    (EXIT
                     (COND
                      ((EQUAL (|get_database| |conname| 'CONSTRUCTORKIND)
                              '|category|)
                       (SUBLISLIS |args| |$TriangleVariableList| |sig|))
                      ('T (SPADCALL |args| |sig| (QREFELT % 8)))))))) 

(SDEFUN |BRINFO;downcase;2S;3| ((|s| (|String|)) (% (|String|)))
        (SPROG
         ((|res| (|String|)) (|shift| (|Integer|)) (|i| NIL) (#1=#:G97 NIL)
          (|c| (|Character|)))
         (SEQ
          (LETT |res|
                (|make_string_code| (QCSIZE |s|) (SPADCALL (QREFELT % 18))))
          (LETT |shift| (- (QREFELT % 11) (QREFELT % 12)))
          (SEQ (LETT |i| 1) (LETT #1# (QCSIZE |s|)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ (LETT |c| (SPADCALL |s| |i| (QREFELT % 21)))
                    (EXIT
                     (SPADCALL |res| |i|
                               (SEQ
                                (COND
                                 ((SPADCALL |c| (QREFELT % 12) (QREFELT % 23))
                                  (COND
                                   ((SPADCALL |c| (QREFELT % 13)
                                              (QREFELT % 24))
                                    (EXIT
                                     (SPADCALL (+ |c| |shift|)
                                               (QREFELT % 25)))))))
                                (EXIT |c|))
                               (QREFELT % 26))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |BRINFO;is_error?| ((|se| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|l| (|List| (|SExpression|))) (|e1| (|SExpression|)))
               (SEQ
                (COND
                 ((SPADCALL |se| (QREFELT % 28))
                  (SEQ (LETT |l| (SPADCALL |se| (QREFELT % 30)))
                       (EXIT
                        (COND ((NULL |l|) NIL)
                              (#1='T
                               (SEQ (LETT |e1| (|SPADfirst| |l|))
                                    (EXIT
                                     (SPADCALL |e1|
                                               (SPADCALL '|error|
                                                         (QREFELT % 31))
                                               (QREFELT % 32)))))))))
                 (#1# NIL))))) 

(SDEFUN |BRINFO;convert_pattern;SU;5|
        ((|pat| (|String|)) (% (|Union| (|SExpression|) (|ErrorIndicator|))))
        (SPROG ((|pc| (|SExpression|)))
               (SEQ (LETT |pc| (|pmTransFilter| |pat|))
                    (EXIT
                     (COND
                      ((|BRINFO;is_error?| |pc| %)
                       (CONS 1 (SPADCALL |pc| (QREFELT % 33))))
                      ('T (CONS 0 |pc|))))))) 

(SDEFUN |BRINFO;do_match;SeSB;6|
        ((|pat| (|SExpression|)) (|s| (|String|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ
                (LETT |res1|
                      (|superMatch?| |pat| (SPADCALL |s| (QREFELT % 27))))
                (EXIT (NULL (SPADCALL |res1| (QREFELT % 36))))))) 

(SDEFUN |BRINFO;filter_ops;Se2L;7|
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
         ((|opr| NIL) (#1=#:G123 NIL)
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |pat| (SPADCALL (QCAR |opr|) (QREFELT % 38))
                                 (QREFELT % 37))
                       (LETT |res| (CONS |opr| |res|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;search_opl;SLU;8|
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
           (|ErrorIndicator|))))
        (SPROG ((|pc| (|Union| (|SExpression|) (|ErrorIndicator|))))
               (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 35)))
                    (EXIT
                     (COND ((QEQCAR |pc| 1) (CONS 1 (QCDR |pc|)))
                           ('T
                            (CONS 0
                                  (SPADCALL (QCDR |pc|) |opl|
                                            (QREFELT % 42))))))))) 

(SDEFUN |BRINFO;constructor_name?;SB;9| ((|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ (LETT |res1| (|constructor?| |name|))
                    (EXIT (NULL (SPADCALL |res1| (QREFELT % 36))))))) 

(SDEFUN |BRINFO;exposed_constructor?;SB;10|
        ((|name| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|res1| (|SExpression|)))
               (SEQ (LETT |res1| (|isExposedConstructor| |name|))
                    (EXIT (NULL (SPADCALL |res1| (QREFELT % 36))))))) 

(SDEFUN |BRINFO;simp_ops_conditions;L2SeL;11|
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
         ((|cl| #1=(|List| (|SExpression|))) (|dl| #1#) (|opr| NIL)
          (#2=#:G157 NIL) (|sd| NIL) (#3=#:G158 NIL) (|np| (|SExpression|))
          (#4=#:G156 NIL)
          (|r1|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|res1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (LETT |cl|
                    (CONS |con_form|
                          (CDR (SPADCALL |con_form| (QREFELT % 30)))))
              (LETT |dl|
                    (CONS |dom_form|
                          (CDR (SPADCALL |dom_form| (QREFELT % 30)))))
              (SEQ (LETT |opr| NIL) (LETT #2# |opl|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |opr| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |res1| NIL)
                        (SEQ (LETT |sd| NIL) (LETT #3# (QCDR |opr|)) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |sd| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (LETT |r1|
                                      (COND
                                       ((SPADCALL (QVELT |sd| 1) 'T
                                                  (QREFELT % 32))
                                        |sd|)
                                       ('T
                                        (SEQ
                                         (LETT |np|
                                               (SUBLISLIS |dl| |cl|
                                                          (QVELT |sd| 1)))
                                         (LETT |np| (|simpHasPred| |np|))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |np| (QREFELT % 36))
                                            (PROGN
                                             (LETT #4# |$NoValue|)
                                             (GO #5=#:G143)))
                                           ('T
                                            (VECTOR (QVELT |sd| 0) |np|
                                                    (QVELT |sd| 2)
                                                    (QVELT |sd| 3)))))))))
                                (EXIT (LETT |res1| (CONS |r1| |res1|)))))
                              #5# (EXIT #4#))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL (NULL |res1|))
                           (LETT |res|
                                 (CONS (CONS (QCAR |opr|) (NREVERSE |res1|))
                                       |res|))))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;operations;SeBL;12|
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
         ((|dom_form| #1=(|SExpression|)) (|docTable| (|None|))
          (|lst1| (|List| (|SExpression|))) (|op_mm| NIL) (#2=#:G180 NIL)
          (|ope| (|SExpression|)) (|k| (|Integer|)) (|op| (|Symbol|))
          (|mms| #3=(|List| (|SExpression|))) (|mm1| NIL) (#4=#:G181 NIL)
          (|#G28| #3#) (|sig| NIL) (|#G29| #3#) (|cond| NIL)
          (|nd| (|SExpression|)) (|ori| (|SExpression|)) (|doc| #1#)
          (|doc_s| (|String|))
          (|res1|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |dom_form| (SPADCALL NIL (QREFELT % 48)))
              (LETT |form|
                    (SPADCALL
                     (SPADCALL (SPADCALL |form| (QREFELT % 49)) (QREFELT % 50))
                     (QREFELT % 51)))
              (SETF |$docTableHash| (MAKE_HASHTABLE 'EQUAL))
              (LETT |docTable| (|dbDocTable| |form|))
              (LETT |lst1| (|koOps| |form| |dom_form|)) (LETT |res| NIL)
              (SEQ (LETT |op_mm| NIL) (LETT #2# |lst1|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |op_mm| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ope| (SPADCALL |op_mm| (QREFELT % 49)))
                        (LETT |op|
                              (COND
                               ((SPADCALL |ope| (QREFELT % 52))
                                (SPADCALL |ope| (QREFELT % 50)))
                               ((SPADCALL |ope| (QREFELT % 53))
                                (SEQ (LETT |k| (SPADCALL |ope| (QREFELT % 54)))
                                     (EXIT
                                      (COND ((EQL |k| 0) '|0|)
                                            ((EQL |k| 1) '|1|)
                                            ('T
                                             (|error|
                                              "unexpected integer as operator"))))))
                               ('T (|error| "unexpected operator form"))))
                        (LETT |mms|
                              (SPADCALL (SPADCALL |op_mm| (QREFELT % 33))
                                        (QREFELT % 30)))
                        (LETT |res1| NIL)
                        (SEQ (LETT |mm1| NIL) (LETT #4# |mms|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |mm1| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (PROGN
                               (LETT |#G28| (SPADCALL |mm1| (QREFELT % 30)))
                               (LETT |#G29| |#G28|)
                               (LETT |sig| (|SPADfirst| |#G29|))
                               (LETT |#G29| (CDR |#G29|))
                               (LETT |cond| (|SPADfirst| |#G29|))
                               |#G28|)
                              (LETT |nd|
                                    (|dbGetDocTable| |ope| |sig| |docTable|))
                              (LETT |doc| (SPADCALL NIL (QREFELT % 48)))
                              (COND
                               ((SPADCALL |nd| (QREFELT % 36))
                                (SEQ
                                 (SPADCALL
                                  (SPADCALL
                                   "operations: op not found in doc table"
                                   (QREFELT % 56))
                                  (QREFELT % 58))
                                 (SPADCALL (SPADCALL |op_mm| (QREFELT % 59))
                                           (QREFELT % 58))
                                 (SPADCALL (SPADCALL |mm1| (QREFELT % 59))
                                           (QREFELT % 58))
                                 (EXIT (LETT |ori| |form|))))
                               ('T
                                (SEQ
                                 (LETT |ori| (SPADCALL |nd| (QREFELT % 49)))
                                 (EXIT
                                  (LETT |doc|
                                        (SPADCALL |nd| (QREFELT % 33)))))))
                              (LETT |doc_s|
                                    (COND ((SPADCALL |doc| (QREFELT % 36)) "")
                                          ('T
                                           (SPADCALL
                                            (SPADCALL |doc| (QREFELT % 49))
                                            (QREFELT % 60)))))
                              (EXIT
                               (LETT |res1|
                                     (CONS (VECTOR |sig| |cond| |ori| |doc_s|)
                                           |res1|))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res|
                               (CONS (CONS |op| (NREVERSE |res1|)) |res|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;sex_order|
        ((|s1| (|SExpression|)) (|s2| (|SExpression|)) (% (|Boolean|)))
        (SPROG
         ((|e1| #1=(|SExpression|)) (|e2| #1#)
          (|sl1| #2=(|List| (|SExpression|))) (|sl2| #2#) (#3=#:G202 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |s1| (QREFELT % 28))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 28))) 'T)
                   (#4='T
                    (SEQ (LETT |sl1| (SPADCALL |s1| (QREFELT % 30)))
                         (LETT |sl2| (SPADCALL |s2| (QREFELT % 30)))
                         (EXIT
                          (SEQ G190 NIL
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL |sl1|)
                                   (PROGN
                                    (LETT #3# (NULL (NULL |sl2|)))
                                    (GO #5=#:G201)))
                                  ((NULL |sl2|)
                                   (PROGN (LETT #3# NIL) (GO #5#)))
                                  ('T
                                   (SEQ (LETT |e1| (|SPADfirst| |sl1|))
                                        (LETT |e2| (|SPADfirst| |sl2|))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |e1| |e2| (QREFELT % 32))
                                           (SEQ (LETT |sl1| (CDR |sl1|))
                                                (EXIT
                                                 (LETT |sl2| (CDR |sl2|)))))
                                          ('T
                                           (PROGN
                                            (LETT #3#
                                                  (|BRINFO;sex_order| |e1| |e2|
                                                   %))
                                            (GO #5#))))))))))
                               NIL (GO G190) G191 (EXIT NIL)))))))
            ((SPADCALL |s2| (QREFELT % 28)) NIL)
            ((SPADCALL |s1| (QREFELT % 62))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 62))) 'T)
                   (#4#
                    (CGREATERP (SPADCALL |s2| (QREFELT % 60))
                               (SPADCALL |s1| (QREFELT % 60))))))
            ((SPADCALL |s2| (QREFELT % 62)) NIL)
            ((SPADCALL |s1| (QREFELT % 53))
             (COND ((NULL (SPADCALL |s2| (QREFELT % 53))) 'T)
                   (#4#
                    (< (SPADCALL |s1| (QREFELT % 54))
                       (SPADCALL |s2| (QREFELT % 54))))))
            ((SPADCALL |s2| (QREFELT % 53)) NIL)
            ('T
             (CGREATERP
              (SPADCALL (SPADCALL |s2| (QREFELT % 50)) (QREFELT % 38))
              (SPADCALL (SPADCALL |s1| (QREFELT % 50)) (QREFELT % 38))))))
          #5# (EXIT #3#)))) 

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
         ((|a0|
           (|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))
          (|a1| NIL) (#3=#:G224 NIL) (|on| #1#) (|res1| (|List| #2#))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (LETT |lst|
                (SPADCALL (CONS (|function| |BRINFO;gr2_ord|) %) |lst|
                          (QREFELT % 66)))
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
         ((|e1|
           (|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                     (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))
          (|gr| NIL) (#2=#:G242 NIL) (|t| #1#)
          (|r1|
           #3=(|Record| (|:| |i| (|Integer|)) (|:| |name| (|Symbol|))
                        (|:| |sd|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
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
          (|ot| #1#) (|res1| (|List| #3#))
          (|opl1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (COND ((NULL |grd|) NIL)
                ('T
                 (SEQ
                  (LETT |grd|
                        (SPADCALL (CONS (|function| |BRINFO;gr1_ord|) %) |grd|
                                  (QREFELT % 70)))
                  (LETT |e1| (|SPADfirst| |grd|)) (LETT |ot| (QVELT |e1| 0))
                  (LETT |res1|
                        (LIST
                         (VECTOR (QVELT |e1| 1) (QVELT |e1| 2)
                                 (QVELT |e1| 3))))
                  (LETT |res| NIL)
                  (SEQ (LETT |gr| NIL) (LETT #2# |grd|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |gr| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |t| (QVELT |gr| 0))
                            (LETT |r1|
                                  (VECTOR (QVELT |gr| 1) (QVELT |gr| 2)
                                          (QVELT |gr| 3)))
                            (EXIT
                             (COND
                              ((SPADCALL |t| |ot| (QREFELT % 32))
                               (LETT |res1| (CONS |r1| |res1|)))
                              ('T
                               (SEQ
                                (LETT |opl1| (|BRINFO;group_data1| |res1| %))
                                (LETT |res| (CONS (CONS |ot| |opl1|) |res|))
                                (LETT |ot| |t|)
                                (EXIT (LETT |res1| (LIST |r1|))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
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
         ((|opr| NIL) (#1=#:G253 NIL) (|name| (|Symbol|)) (|sd| NIL)
          (#2=#:G254 NIL)
          (|r1|
           #3=(|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                        (|:| |name| (|Symbol|))
                        (|:| |sd|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (|i| (|Integer|)) (|grd| (|List| #3#)))
         (SEQ (LETT |grd| NIL) (LETT |i| 1)
              (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL))
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
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|BRINFO;group_data| |grd| %))))) 

(SDEFUN |BRINFO;group_by_condition;LL;19|
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
         (LIST #'|BRINFO;group_by_condition;LL;19!0|) %)) 

(SDEFUN |BRINFO;group_by_condition;LL;19!0| ((|sd| NIL) ($$ NIL))
        (QVELT |sd| 1)) 

(SDEFUN |BRINFO;group_by_origin;LL;20|
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
         (LIST #'|BRINFO;group_by_origin;LL;20!0|) %)) 

(SDEFUN |BRINFO;group_by_origin;LL;20!0| ((|sd| NIL) ($$ NIL)) (QVELT |sd| 2)) 

(SDEFUN |BRINFO;group_by_implementation;LSeLL;21|
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
         ((|con_name| (|Symbol|)) (|dom| (|None|)) (|dom_name| (|SExpression|))
          (|pred_lst| (|List| (|SExpression|))) (|opr| NIL) (#1=#:G273 NIL)
          (|name| #2=(|Symbol|)) (|sd| NIL) (#3=#:G274 NIL) (|op| #2#)
          (|sig1| (|SExpression|)) (|sig_imp| (|SExpression|))
          (|r1|
           #4=(|Record| (|:| |grp_tag| (|SExpression|)) (|:| |i| (|Integer|))
                        (|:| |name| (|Symbol|))
                        (|:| |sd|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (|i| (|Integer|)) (|grd| (|List| #4#)))
         (SEQ
          (LETT |con_name|
                (SPADCALL (SPADCALL |dom_form| (QREFELT % 49)) (QREFELT % 50)))
          (LETT |dom| (EVAL |dom_form|)) (LETT |dom_name| (ELT |dom| 0))
          (LETT |pred_lst| (|get_database| |con_name| 'PREDICATES))
          (LETT |grd| NIL) (LETT |i| 1)
          (SEQ (LETT |opr| NIL) (LETT #1# |opl|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL)) (GO G191)))
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
                           (LETT |sig1|
                                 (|sublisFormal|
                                  (SPADCALL |dom_name| (QREFELT % 33))
                                  (QVELT |sd| 0) |args|))
                           (LETT |sig_imp|
                                 (|get_op_implementation| |op| |sig1|
                                                          (QVELT |sd| 1)
                                                          |pred_lst| |dom|
                                                          |dom_name|))
                           (LETT |r1| (VECTOR |sig_imp| |i| |name| |sd|))
                           (LETT |i| (+ |i| 1))
                           (EXIT (LETT |grd| (CONS |r1| |grd|))))
                          (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (|BRINFO;group_data| |grd| %))))) 

(MAKEPROP '|BRINFO;find_symbol| '|SPADreplace| '|find_symbol|) 

(SDEFUN |BRINFO;find_symbol|
        ((|name| (|String|)) (% (|Union| (|Symbol|) "failed")))
        (|find_symbol| |name|)) 

(SDEFUN |BRINFO;get_ops_doc| ((|name| (|Symbol|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|doc| (|List| (|SExpression|))) (|con_doc| (|List| (|SExpression|)))
          (|e1| (|SExpression|)))
         (SEQ (LETT |doc| (|get_database| |name| 'DOCUMENTATION))
              (EXIT
               (COND ((NULL |doc|) |doc|)
                     ('T
                      (SEQ
                       (LETT |con_doc|
                             (SPADCALL (|SPADfirst| |doc|) (QREFELT % 30)))
                       (LETT |e1| (|SPADfirst| |con_doc|))
                       (COND
                        ((NULL
                          (EQUAL (SPADCALL |e1| (QREFELT % 50))
                                 '|constructor|))
                         (EXIT |doc|)))
                       (LETT |con_doc|
                             (SPADCALL (SPADCALL |con_doc| 2 (QREFELT % 76))
                                       (QREFELT % 30)))
                       (LETT |e1| (|SPADfirst| |con_doc|))
                       (COND
                        ((NULL (SPADCALL |e1| (QREFELT % 36))) (EXIT |doc|)))
                       (EXIT (CDR |doc|))))))))) 

(SDEFUN |BRINFO;unpack_sig_cond|
        ((|r1| (|SExpression|))
         (%
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|)))))
        (CONS (SPADCALL |r1| (QREFELT % 49)) (SPADCALL |r1| (QREFELT % 33)))) 

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
        (SPROG ((|sig1| #1#) (|sig2| #1#) (|orig1| #2#) (|orig2| #2#))
               (SEQ (LETT |sig1| (QVELT |sd1| 0)) (LETT |sig2| (QVELT |sd2| 0))
                    (EXIT
                     (COND
                      ((SPADCALL |sig1| |sig2| (QREFELT % 32))
                       (SEQ (LETT |orig1| (QVELT |sd1| 2))
                            (LETT |orig2| (QVELT |sd2| 2))
                            (EXIT
                             (COND
                              ((SPADCALL |orig1| |orig2| (QREFELT % 32))
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
         ((|sd1|
           #1=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sd2| #1#) (#2=#:G299 NIL))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND ((NULL |sdl1|) (NULL (NULL |sdl2|)))
                        ((NULL |sdl2|) (PROGN (LETT #2# NIL) (GO #3=#:G298)))
                        ('T
                         (SEQ (LETT |sd1| (|SPADfirst| |sdl1|))
                              (LETT |sd2| (|SPADfirst| |sdl2|))
                              (EXIT
                               (COND
                                ((SPADCALL |sd1| |sd2| (QREFELT % 77))
                                 (SEQ (LETT |sdl1| (CDR |sdl1|))
                                      (EXIT (LETT |sdl2| (CDR |sdl2|)))))
                                ('T
                                 (PROGN
                                  (LETT #2# (|BRINFO;sd_cmp| |sd1| |sd2| %))
                                  (GO #3#))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #2#)))) 

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
        (SPROG ((|n1| #1=(|Symbol|)) (|n2| #1#))
               (SEQ (LETT |n1| (QCAR |r1|)) (LETT |n2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((EQUAL |n1| |n2|)
                       (|BRINFO;sdl_cmp| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (SPADCALL |n1| |n2| (QREFELT % 78)))))))) 

(SDEFUN |BRINFO;sig_cmp|
        ((|r1|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))))
         (|r2|
          (|Record| (|:| |signature| (|SExpression|))
                    (|:| |condition| (|SExpression|))))
         (% (|Boolean|)))
        (SPROG ((|sig1| #1=(|SExpression|)) (|sig2| #1#))
               (SEQ (LETT |sig1| (QCAR |r1|)) (LETT |sig2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((SPADCALL |sig1| |sig2| (QREFELT % 32))
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
         ((|r1|
           #1=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))))
          (|r2| #1#) (#2=#:G314 NIL))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND ((NULL |l1|) (NULL (NULL |l2|)))
                        ((NULL |l2|) (PROGN (LETT #2# NIL) (GO #3=#:G313)))
                        ('T
                         (SEQ (LETT |r1| (|SPADfirst| |l1|))
                              (LETT |r2| (|SPADfirst| |l2|))
                              (EXIT
                               (COND
                                ((SPADCALL |r1| |r2| (QREFELT % 80))
                                 (SEQ (LETT |l1| (CDR |l1|))
                                      (EXIT (LETT |l2| (CDR |l2|)))))
                                ('T
                                 (PROGN
                                  (LETT #2# (|BRINFO;sig_cmp| |r1| |r2| %))
                                  (GO #3#))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #3# (EXIT #2#)))) 

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
        (SPROG ((|n1| #1#) (|n2| #1#))
               (SEQ (LETT |n1| (QCAR |r1|)) (LETT |n2| (QCAR |r2|))
                    (EXIT
                     (COND
                      ((EQUAL |n1| |n2|)
                       (|BRINFO;sigs_cmp| (QCDR |r1|) (QCDR |r2|) %))
                      ('T (SPADCALL |n1| |n2| (QREFELT % 78)))))))) 

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
         ((|r1| (|SExpression|)) (#1=#:G340 NIL) (|need_sort| (|Boolean|))
          (|name| #2=(|Symbol|))
          (|r2|
           #3=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))))
          (|oname| #2#) (|res1| (|List| #3#))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sigs|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|)))))))))
         (SEQ
          (COND ((NULL |opl1|) NIL)
                (#4='T
                 (SEQ (LETT |r1| (|SPADfirst| |opl1|))
                      (LETT |opl1| (CDR |opl1|)) (LETT |need_sort| NIL)
                      (LETT |oname|
                            (SPADCALL (SPADCALL |r1| (QREFELT % 49))
                                      (QREFELT % 50)))
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
                              (SPADCALL |r1| (QREFELT % 33)) %)))
                      (LETT |opl| NIL)
                      (SEQ (LETT #1# |opl1|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |r1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |name|
                                  (SPADCALL (SPADCALL |r1| (QREFELT % 49))
                                            (QREFELT % 50)))
                            (LETT |name|
                                  (COND
                                   ((EQUAL |name| '|Zero|)
                                    (SEQ (LETT |need_sort| 'T) (EXIT '|0|)))
                                   ((EQUAL |name| '|One|)
                                    (SEQ (LETT |need_sort| 'T) (EXIT '|1|)))
                                   ('T |name|)))
                            (LETT |r2|
                                  (|BRINFO;unpack_sig_cond|
                                   (SPADCALL |r1| (QREFELT % 33)) %))
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
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |opl|
                            (CONS (CONS |oname| (NREVERSE |res1|)) |opl|))
                      (EXIT
                       (COND
                        (|need_sort|
                         (SPADCALL (CONS (|function| |BRINFO;opr2_cmp|) %)
                                   |opl| (QREFELT % 84)))
                        (#4# (NREVERSE |opl|)))))))))) 

(SDEFUN |BRINFO;convert_doc1| ((|d1| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|name| (|SExpression|)) (|ns| (|Symbol|))
          (|new_name| (|SExpression|)) (|dl| (|List| (|SExpression|))))
         (SEQ
          (COND
           ((SPADCALL (LETT |name| (SPADCALL |d1| (QREFELT % 49)))
                      (QREFELT % 52))
            |d1|)
           (#1='T
            (SEQ
             (LETT |new_name|
                   (SEQ
                    (COND
                     ((SPADCALL |name| (QREFELT % 28))
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |name| (QREFELT % 33))
                                   (QREFELT % 36)))
                        (EXIT
                         (|error| #2="convert_doc1: unexpected name form")))))
                     (#1# (EXIT (|error| #2#))))
                    (LETT |ns|
                          (SPADCALL (SPADCALL |name| (QREFELT % 49))
                                    (QREFELT % 50)))
                    (COND
                     ((OR (EQUAL |ns| '|0|) (EQUAL |ns| '|1|))
                      (EXIT (SPADCALL |ns| (QREFELT % 31)))))
                    (EXIT (|error| "convert_doc1: unexpected name form"))))
             (LETT |dl| (CDR (SPADCALL |d1| (QREFELT % 30))))
             (EXIT (SPADCALL (CONS |new_name| |dl|) (QREFELT % 48))))))))) 

(SDEFUN |BRINFO;convert_doc|
        ((|doc| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SPROG
         ((#1=#:G355 NIL) (|good?| (|Boolean|)) (#2=#:G356 NIL) (|d1| NIL)
          (#3=#:G357 NIL))
         (SEQ (LETT |good?| 'T)
              (SEQ (LETT |d1| NIL) (LETT #1# |doc|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |d1| (CAR #1#)) NIL)
                         (NULL |good?|))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |good?|
                           (SPADCALL (SPADCALL |d1| (QREFELT % 49))
                                     (QREFELT % 52)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |good?|)
                (LETT |doc|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT |d1| NIL) (LETT #3# |doc|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |d1| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (|BRINFO;convert_doc1| |d1| %)
                                          #2#))))
                            (LETT #3# (CDR #3#)) (GO G190) G191
                            (EXIT (NREVERSE #2#)))))))
              (EXIT
               (SPADCALL (CONS (|function| |BRINFO;sex_order|) %) |doc|
                         (QREFELT % 86)))))) 

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
        (SPROG ((#1=#:G362 NIL) (|sig| NIL) (#2=#:G363 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |sig| NIL) (LETT #2# |sigs|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |sig| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (VECTOR (QCAR |sig|) (QCDR |sig|) |form| "")
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

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
         ((|sig| NIL) (#1=#:G375 NIL)
          (|r1|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|d1| NIL) (#2=#:G376 NIL) (|found| (|Boolean|))
          (|res|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|))))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |sig| NIL) (LETT #1# |sigs|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sig| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |found| NIL)
                        (LETT |r1|
                              (VECTOR (QCAR |sig|) (QCDR |sig|) |form| ""))
                        (SEQ (LETT |d1| NIL) (LETT #2# |doc1|) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |d1| (CAR #2#)) NIL)
                                   (NULL (NULL |found|)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |d1| (QREFELT % 49))
                                           (QCAR |sig|) (QREFELT % 32))
                                 (SEQ
                                  (QSETVELT |r1| 3
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |d1| (QREFELT % 33))
                                              (QREFELT % 49))
                                             (QREFELT % 60)))
                                  (EXIT (LETT |found| 'T)))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |res| (CONS |r1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;is_attribute_doc?| ((|d1| (|SExpression|)) (% (|Boolean|)))
        (SPROG ((|sdl| (|List| (|SExpression|))) (|sig| (|SExpression|)))
               (SEQ
                (LETT |sdl|
                      (SPADCALL (SPADCALL |d1| (QREFELT % 33)) (QREFELT % 30)))
                (EXIT
                 (COND
                  ((EQL (LENGTH |sdl|) 1)
                   (SEQ
                    (LETT |sig| (SPADCALL (|SPADfirst| |sdl|) (QREFELT % 49)))
                    (EXIT
                     (SPADCALL |sig|
                               (SPADCALL
                                (LIST (SPADCALL '|attribute| (QREFELT % 31)))
                                (QREFELT % 48))
                               (QREFELT % 32)))))
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
         ((|opl2|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sigs|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))))))))
          (|r1| NIL) (#1=#:G396 NIL) (|name| (|Symbol|)) (#2=#:G395 NIL)
          (|d1| (|SExpression|)) (|dname| (|Symbol|))
          (|sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (COND ((NULL |opl1|) NIL)
                ('T
                 (SEQ (LETT |opl2| (|BRINFO;convert_opl| |opl1| %))
                      (LETT |res| NIL)
                      (SEQ (LETT |r1| NIL) (LETT #1# |opl2|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |r1| (CAR #1#)) NIL))
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
                                                              (QREFELT % 49))
                                                    (QREFELT % 50)))
                                             (SEQ
                                              (EXIT
                                               (SEQ G190
                                                    (COND
                                                     ((NULL
                                                       (SPADCALL |dname| |name|
                                                                 (QREFELT %
                                                                          78)))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |doc| (CDR |doc|))
                                                     (EXIT
                                                      (COND
                                                       ((NULL |doc|)
                                                        (PROGN
                                                         (LETT #2# 1)
                                                         (GO #3=#:G384)))
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
                                                                            49))
                                                                 (QREFELT %
                                                                          50)))))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL)))
                                              #3# (EXIT #2#))
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
                                                                           33))
                                                        (QREFELT % 30))
                                                       |form| %))))
                                               ('T
                                                (|BRINFO;add_origin|
                                                 (QCDR |r1|) |form| %))))))))
                                (EXIT
                                 (LETT |res|
                                       (CONS (CONS |name| |sdl|) |res|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |res|)))))))) 

(SDEFUN |BRINFO;dependents;SL;38| ((|c| (|Symbol|)) (% (|List| (|Symbol|))))
        (SPROG ((|lib| (|BasicKeyedAccessFile|)) (|res| (|None|)))
               (SEQ
                (LETT |lib|
                      (SPADCALL (SPADCALL "DEPENDENTS.DAASE" (QREFELT % 88))
                                "input" (QREFELT % 90)))
                (LETT |res|
                      (SPADCALL |lib| (SPADCALL |c| (QREFELT % 38))
                                (QREFELT % 92)))
                (SPADCALL |lib| (QREFELT % 93)) (EXIT |res|)))) 

(SDEFUN |BRINFO;users;SL;39| ((|c| (|Symbol|)) (% (|List| (|Symbol|))))
        (SPROG ((|lib| (|BasicKeyedAccessFile|)) (|res| (|None|)))
               (SEQ
                (LETT |lib|
                      (SPADCALL (SPADCALL "USERS.DAASE" (QREFELT % 88)) "input"
                                (QREFELT % 90)))
                (LETT |res|
                      (SPADCALL |lib| (SPADCALL |c| (QREFELT % 38))
                                (QREFELT % 92)))
                (SPADCALL |lib| (QREFELT % 93)) (EXIT |res|)))) 

(SDEFUN |BRINFO;exports;SeR;40|
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
         ((|con_name| (|Symbol|)) (|r1| (|SExpression|))
          (|cl|
           (|List|
            (|Record| (|:| |form| (|SExpression|))
                      (|:| |condition| (|SExpression|)))))
          (|opl1| (|List| (|SExpression|))) (|doc| (|List| (|SExpression|)))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (LETT |con_name|
                (SPADCALL (SPADCALL |c| (QREFELT % 49)) (QREFELT % 50)))
          (LETT |r1|
                (|getConstructorExports| (SPADCALL |con_name| (QREFELT % 51))
                                         'T))
          (LETT |cl| (SPADCALL |r1| (QREFELT % 49)))
          (LETT |opl1|
                (SPADCALL (SPADCALL |r1| (QREFELT % 33)) (QREFELT % 30)))
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
               (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 51)))
                    (EXIT
                     (COND
                      ((SPADCALL |cf| (QREFELT % 36))
                       (SEQ
                        (SPADCALL (SPADCALL |c| (QREFELT % 100))
                                  (QREFELT % 58))
                        (EXIT (|error| "con_exports: not form"))))
                      ('T (SPADCALL |cf| (QREFELT % 99)))))))) 

(SDEFUN |BRINFO;flatten_opll|
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
         ((|l1| NIL) (#1=#:G422 NIL) (|r1| NIL) (#2=#:G423 NIL)
          (|name| (|Symbol|)) (|sd| NIL) (#3=#:G424 NIL)
          (|res1|
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
                 (SEQ (LETT |res1| NIL)
                      (SEQ (LETT |l1| NIL) (LETT #1# |ll|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |l1| (CAR #1#)) NIL))
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
                                             (LETT #3# (QCDR |r1|)) G190
                                             (COND
                                              ((OR (ATOM #3#)
                                                   (PROGN
                                                    (LETT |sd| (CAR #3#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |res1|
                                                     (CONS (CONS |name| |sd|)
                                                           |res1|))))
                                             (LETT #3# (CDR #3#)) (GO G190)
                                             G191 (EXIT NIL))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
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
         ((|n1| #1=(|Symbol|)) (|n2| #1#)
          (|sd1|
           #2=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|sd2| #2#) (|sig1| #3=(|SExpression|)) (|sig2| #3#)
          (|orig1| #4=(|SExpression|)) (|orig2| #4#))
         (SEQ (LETT |n1| (QCAR |f1|)) (LETT |n2| (QCAR |f2|))
              (EXIT
               (COND
                ((EQUAL |n1| |n2|)
                 (SEQ (LETT |sd1| (QCDR |f1|)) (LETT |sd2| (QCDR |f2|))
                      (LETT |sig1| (QVELT |sd1| 0))
                      (LETT |sig2| (QVELT |sd2| 0))
                      (EXIT
                       (COND
                        ((SPADCALL |sig1| |sig2| (QREFELT % 32))
                         (SEQ (LETT |orig1| (QVELT |sd1| 2))
                              (LETT |orig2| (QVELT |sd2| 2))
                              (EXIT
                               (COND
                                ((SPADCALL |orig1| |orig2| (QREFELT % 32))
                                 (|BRINFO;sex_order| (QVELT |sd1| 1)
                                  (QVELT |sd2| 1) %))
                                (#5='T
                                 (|BRINFO;sex_order| |orig1| |orig2| %))))))
                        (#5# (|BRINFO;sex_order| |sig1| |sig2| %))))))
                (#5# (SPADCALL |n1| |n2| (QREFELT % 78)))))))) 

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
         ((|f1|
           (|Record| (|:| |name| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))
          (#1=#:G441 NIL) (|name| #2=(|Symbol|)) (|oname| #2#)
          (|sdl|
           (|List|
            (|Record| (|:| |signature| (|SExpression|))
                      (|:| |condition| (|SExpression|))
                      (|:| |origin| (|SExpression|))
                      (|:| |documentation| (|String|)))))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |f1| (|SPADfirst| |fl|)) (LETT |oname| (QCAR |f1|))
              (LETT |sdl| (LIST (QCDR |f1|))) (LETT |res| NIL)
              (SEQ (LETT #1# (CDR |fl|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
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
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (CONS (CONS |oname| (NREVERSE |sdl|)) |res|))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;mangle_signature| ((|sig| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|sl| (|List| (|SExpression|))) (|s1| NIL) (#1=#:G454 NIL)
          (|s11| #2=(|SExpression|)) (#3=#:G453 NIL) (|ns1| #2#)
          (|res| (|List| (|SExpression|))))
         (SEQ (LETT |sl| (SPADCALL |sig| (QREFELT % 30))) (LETT |res| NIL)
              (SEQ (LETT |s1| NIL) (LETT #1# |sl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ns1|
                          (SEQ
                           (EXIT
                            (SEQ
                             (COND
                              ((SPADCALL |s1| (QREFELT % 28))
                               (COND
                                ((NULL (SPADCALL |s1| (QREFELT % 36)))
                                 (COND
                                  ((SPADCALL (SPADCALL |s1| (QREFELT % 33))
                                             (QREFELT % 36))
                                   (SEQ
                                    (LETT |s11| (SPADCALL |s1| (QREFELT % 49)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |s11| (QREFELT % 52))
                                       (PROGN
                                        (LETT #3# |s11|)
                                        (GO #4=#:G448))))))))))))
                             (EXIT
                              (COND
                               ((SPADCALL |s1| (QREFELT % 28))
                                (|BRINFO;mangle_signature| |s1| %))
                               ('T |s1|)))))
                           #4# (EXIT #3#)))
                    (EXIT (LETT |res| (CONS |ns1| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT % 48)))))) 

(SDEFUN |BRINFO;mangle_condition|
        ((|c| (|SExpression|)) (|args| (|List| (|SExpression|)))
         (% (|SExpression|)))
        (SPROG ((|cl| (|List| (|SExpression|))))
               (SEQ (LETT |cl| (SPADCALL |c| (QREFELT % 30)))
                    (COND
                     ((SPADCALL (|SPADfirst| |cl|)
                                (SPADCALL 'AND (QREFELT % 31)) (QREFELT % 32))
                      (LETT |cl|
                            (CONS (SPADCALL '|and| (QREFELT % 31))
                                  (CDR |cl|)))))
                    (EXIT
                     (SPADCALL |args|
                               (|BRINFO;mangle_signature|
                                (SPADCALL |cl| (QREFELT % 48)) %)
                               (QREFELT % 8)))))) 

(SDEFUN |BRINFO;fix_args|
        ((|args| (|SExpression|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|al| (|List| #1=(|SExpression|))) (|a1| NIL) (#2=#:G463 NIL)
          (|as| (|Symbol|)) (|na| #1#) (|res| (|List| (|SExpression|))))
         (SEQ (LETT |al| (SPADCALL |args| (QREFELT % 30))) (LETT |res| NIL)
              (SEQ (LETT |a1| NIL) (LETT #2# |al|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |as| (SPADCALL |a1| (QREFELT % 50)))
                        (LETT |na|
                              (COND
                               ((EQUAL |as| 'T$) (SPADCALL 'T (QREFELT % 31)))
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
         ((|f1| NIL) (#1=#:G469 NIL)
          (|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|args| (|List| (|SExpression|))) (#2=#:G468 NIL))
         (SEQ (LETT |f1| NIL) (LETT #1# |fl|) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL)) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |sd| (QCDR |f1|))
                     (LETT |args|
                           (|BRINFO;fix_args|
                            (SPADCALL (QVELT |sd| 2) (QREFELT % 33)) %))
                     (QSETVELT |sd| 0
                               (SPADCALL |args|
                                         (|BRINFO;mangle_signature|
                                          (QVELT |sd| 0) %)
                                         (QREFELT % 8)))
                     (EXIT
                      (COND
                       ((SPADCALL (QVELT |sd| 1) 'T (QREFELT % 32))
                        (PROGN (LETT #2# |$NoValue|) (GO #3=#:G464)))
                       ('T
                        (QSETVELT |sd| 1
                                  (|BRINFO;mangle_condition| (QVELT |sd| 1)
                                   |args| %)))))))
               #3# (EXIT #2#))
              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

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
                 (SEQ (LETT |fl| (|BRINFO;flatten_opll| |ll| %))
                      (|BRINFO;mangle_signatures| |fl| %)
                      (LETT |fl|
                            (SPADCALL (CONS (|function| |BRINFO;fun_cmp|) %)
                                      |fl| (QREFELT % 104)))
                      (EXIT (|BRINFO;group_funs| |fl| %)))))))) 

(MAKEPROP '|BRINFO;all_con_names| '|SPADreplace| '|allConstructors|) 

(SDEFUN |BRINFO;all_con_names| ((% (|List| (|Symbol|)))) (|allConstructors|)) 

(SDEFUN |BRINFO;ops_from_exports;L;51|
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
         ((|cl| (|List| (|Symbol|))) (|c| NIL) (#1=#:G487 NIL)
          (|cf| (|SExpression|)) (#2=#:G486 NIL)
          (|cfl| (|List| (|SExpression|))) (#3=#:G488 NIL) (#4=#:G489 NIL)
          (|opll|
           (|List|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))))))
         (SEQ (LETT |cl| (|BRINFO;all_con_names| %)) (LETT |cfl| NIL)
              (SEQ (LETT |c| NIL) (LETT #1# |cl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |c| (QREFELT % 105))
                       (PROGN (LETT #2# |$NoValue|) (GO #5=#:G478)))
                      ('T
                       (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 51)))
                            (EXIT
                             (COND
                              ((SPADCALL |cf| (QREFELT % 36))
                               (PROGN (LETT #2# |$NoValue|) (GO #5#)))
                              ('T (LETT |cfl| (CONS |cf| |cfl|)))))))))
                    #5# (EXIT #2#))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |opll|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT #4# |cfl|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |cf| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS (QCDR (SPADCALL |cf| (QREFELT % 99)))
                                        #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT (|BRINFO;convert_opll| |opll| %))))) 

(SDEFUN |BRINFO;search_operations;SU;52|
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
           (|ErrorIndicator|))))
        (SEQ
         (COND
          ((NULL (QREFELT % 108))
           (SEQ (SETELT % 107 (SPADCALL (QREFELT % 106)))
                (EXIT (SETELT % 108 'T)))))
         (EXIT (SPADCALL |pat| (QREFELT % 107) (QREFELT % 44))))) 

(SDEFUN |BRINFO;string_to_integer|
        ((|s| (|String|)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|res| (|SExpression|)))
               (SEQ (LETT |res| (|string2Integer| |s|))
                    (EXIT
                     (COND ((SPADCALL |res| (QREFELT % 36)) (CONS 1 "failed"))
                           ('T (CONS 0 (SPADCALL |res| (QREFELT % 54))))))))) 

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
         ((|f1| NIL) (#1=#:G508 NIL)
          (|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (#2=#:G507 NIL) (|ku| (|Union| (|Integer|) "failed"))
          (|k| (|Integer|)) (|ds| (|String|)))
         (SEQ (LETT |f1| NIL) (LETT #1# |fl|) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL)) (GO G191)))
              (SEQ
               (EXIT
                (SEQ (LETT |sd| (QCDR |f1|)) (LETT |ds| (QVELT |sd| 3))
                     (EXIT
                      (COND
                       ((EQUAL |ds| "")
                        (PROGN (LETT #2# |$NoValue|) (GO #3=#:G501)))
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
               #3# (EXIT #2#))
              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |BRINFO;ops_from_libdb;L;55|
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
         ((|res1|
           (|Union|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
            (|ErrorIndicator|)))
          (|opl1|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|))))))))
          (|fl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ (LETT |res1| (SPADCALL "*" (QREFELT % 110)))
              (EXIT
               (COND
                ((QEQCAR |res1| 1) (|error| "ops_from_libdb: search failed"))
                ('T
                 (SEQ (LETT |opl1| (QCDR |res1|))
                      (LETT |fl| (|BRINFO;flatten_opll| (LIST |opl1|) %))
                      (|BRINFO;load_docs| |fl| %)
                      (LETT |fl|
                            (SPADCALL (CONS (|function| |BRINFO;fun_cmp|) %)
                                      |fl| (QREFELT % 104)))
                      (EXIT (|BRINFO;group_funs| |fl| %))))))))) 

(SDEFUN |BRINFO;constructor_kind;2S;56| ((|name| (|Symbol|)) (% (|Symbol|)))
        (|get_database| |name| 'CONSTRUCTORKIND)) 

(SDEFUN |BRINFO;ancestors;SeBL;57|
        ((|form| (|SExpression|)) (|use_args?| (|Boolean|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (SPROG ((|domname| (|SExpression|)))
               (SEQ
                (LETT |domname|
                      (COND (|use_args?| |form|)
                            ('T (SPADCALL NIL (QREFELT % 48)))))
                (EXIT (|ancestorsOf| |form| |domname|))))) 

(SDEFUN |BRINFO;parents;SeL;58|
        ((|form| (|SExpression|))
         (%
          (|List|
           (|Record| (|:| |form| (|SExpression|))
                     (|:| |condition| (|SExpression|))))))
        (COND ((SPADCALL |form| (QREFELT % 52)) (|parentsOf| |form|))
              ('T (|parentsOfForm| |form|)))) 

(SDEFUN |BRINFO;default_name?;SB;59| ((|n| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|ns| (|String|)))
               (SEQ (LETT |ns| (SPADCALL |n| (QREFELT % 38)))
                    (EXIT
                     (|eql_SI| (SPADCALL |ns| (QCSIZE |ns|) (QREFELT % 21))
                               (|STR_to_CHAR| "&")))))) 

(SDEFUN |BRINFO;split_constructors|
        ((|lst| (|List| (|Symbol|)))
         (%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((|n| NIL) (#1=#:G539 NIL) (#2=#:G538 NIL) (|kind| (|Symbol|))
          (|cats| #3=(|List| (|Symbol|))) (|doms| #3#) (|packs| #3#))
         (SEQ (LETT |cats| (LETT |doms| (LETT |packs| NIL)))
              (SEQ (LETT |n| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |n| (QREFELT % 105))
                           (EQUAL |n| '|Category|))
                       (PROGN (LETT #2# |$NoValue|) (GO #4=#:G529)))
                      ('T
                       (SEQ (LETT |kind| (SPADCALL |n| (QREFELT % 112)))
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
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |cats| (NREVERSE |cats|)) (LETT |doms| (NREVERSE |doms|))
              (LETT |packs| (NREVERSE |packs|))
              (EXIT (VECTOR |cats| |doms| |packs|))))) 

(SDEFUN |BRINFO;all_constructors;R;61|
        ((%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((#1=#:G546 NIL) (|cn| NIL) (#2=#:G547 NIL)
          (|cnl| (|List| (|Symbol|))))
         (SEQ
          (LETT |cnl|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |cn| NIL) (LETT #2# (|BRINFO;all_con_names| %))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |cn| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |cn| (QREFELT % 105)))
                          (LETT #1# (CONS |cn| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT
           (|BRINFO;split_constructors| (SPADCALL |cnl| (QREFELT % 116)) %))))) 

(SDEFUN |BRINFO;split_ops|
        ((|lst| (|List| (|String|)))
         (%
          (|Record| (|:| |con| (|List| (|Symbol|)))
                    (|:| |opl| (|List| (|String|))))))
        (SPROG
         ((|str| NIL) (#1=#:G555 NIL) (|k| (|Integer|)) (|sym| (|Symbol|))
          (|cnl| (|List| (|Symbol|))) (|opl| (|List| (|String|))))
         (SEQ (LETT |opl| NIL) (LETT |cnl| NIL) (LETT |opl| NIL)
              (SEQ (LETT |str| NIL) (LETT #1# |lst|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |str| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((|eql_SI| (SPADCALL |str| 1 (QREFELT % 21))
                                 (|STR_to_CHAR| "o"))
                       (LETT |opl| (CONS |str| |opl|)))
                      ('T
                       (SEQ
                        (LETT |k|
                              (SPADCALL (QREFELT % 16) |str| (QREFELT % 119)))
                        (LETT |sym|
                              (SPADCALL
                               (SPADCALL |str|
                                         (SPADCALL 2 (- |k| 1) (QREFELT % 121))
                                         (QREFELT % 122))
                               (QREFELT % 123)))
                        (EXIT (LETT |cnl| (CONS |sym| |cnl|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |cnl| (NREVERSE |cnl|)) (LETT |opl| (NREVERSE |opl|))
              (EXIT (CONS |cnl| |opl|))))) 

(SDEFUN |BRINFO;filter_symbols;Se2L;63|
        ((|pc| (|SExpression|)) (|sl| (|List| (|Symbol|)))
         (% (|List| (|Symbol|))))
        (SPROG ((|sy| NIL) (#1=#:G561 NIL) (|res| (|List| (|Symbol|))))
               (SEQ (LETT |res| NIL)
                    (SEQ (LETT |sy| NIL) (LETT #1# |sl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |sy| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |pc| (SPADCALL |sy| (QREFELT % 38))
                                       (QREFELT % 37))
                             (LETT |res| (CONS |sy| |res|))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(SDEFUN |BRINFO;search_constructors;SSU;64|
        ((|pat| (|String|)) (|tag| (|Symbol|))
         (%
          (|Union|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))
           (|ErrorIndicator|))))
        (SPROG
         ((|pc| (|Union| (|SExpression|) (|ErrorIndicator|))) (#1=#:G580 NIL)
          (|cn| NIL) (#2=#:G581 NIL) (|cnl| (|List| (|Symbol|)))
          (|cnl2| (|List| (|Symbol|)))
          (|res1|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|))))))
         (SEQ (LETT |pc| (SPADCALL |pat| (QREFELT % 35)))
              (EXIT
               (COND ((QEQCAR |pc| 1) (CONS 1 (QCDR |pc|)))
                     (#3='T
                      (SEQ
                       (LETT |cnl|
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |cn| NIL)
                                   (LETT #2# (|BRINFO;all_con_names| %)) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |cn| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL (SPADCALL |cn| (QREFELT % 105)))
                                       (LETT #1# (CONS |cn| #1#))))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#)))))
                       (LETT |cnl2|
                             (SPADCALL (QCDR |pc|) |cnl| (QREFELT % 124)))
                       (LETT |res1|
                             (|BRINFO;split_constructors|
                              (SPADCALL |cnl2| (QREFELT % 116)) %))
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
               (SEQ (LETT |k| (SPADCALL (QREFELT % 14) |form| (QREFELT % 119)))
                    (EXIT
                     (COND
                      ((< |k| 1)
                       (SPADCALL |form|
                                 (SPADCALL 2 (QCSIZE |form|) (QREFELT % 121))
                                 (QREFELT % 122)))
                      ('T
                       (SPADCALL |form| (SPADCALL 2 (- |k| 1) (QREFELT % 121))
                                 (QREFELT % 122)))))))) 

(MAKEPROP '|BRINFO;constructor_form;SSe;66| '|SPADreplace|
          '|getConstructorForm|) 

(SDEFUN |BRINFO;constructor_form;SSe;66|
        ((|name| (|Symbol|)) (% (|SExpression|))) (|getConstructorForm| |name|)) 

(SDEFUN |BRINFO;get_constructor_args|
        ((|name| (|Symbol|)) (% (|List| (|SExpression|))))
        (SPROG ((|form| (|List| (|SExpression|))))
               (SEQ
                (LETT |form|
                      (SPADCALL (SPADCALL |name| (QREFELT % 51))
                                (QREFELT % 30)))
                (EXIT (CDR |form|))))) 

(SDEFUN |BRINFO;constructor_documentation;SS;68|
        ((|name| (|Symbol|)) (% (|String|)))
        (SPROG ((|e1| (|SExpression|)) (|doc| (|List| (|SExpression|))))
               (SEQ (LETT |doc| (|get_database| |name| 'DOCUMENTATION))
                    (EXIT
                     (COND ((NULL |doc|) "")
                           ('T
                            (SEQ
                             (LETT |doc|
                                   (SPADCALL (|SPADfirst| |doc|)
                                             (QREFELT % 30)))
                             (LETT |e1| (|SPADfirst| |doc|))
                             (COND
                              ((NULL
                                (EQUAL (SPADCALL |e1| (QREFELT % 50))
                                       '|constructor|))
                               (EXIT "")))
                             (LETT |doc|
                                   (SPADCALL (SPADCALL |doc| 2 (QREFELT % 76))
                                             (QREFELT % 30)))
                             (EXIT
                              (SPADCALL (SPADCALL |doc| 2 (QREFELT % 76))
                                        (QREFELT % 60)))))))))) 

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
         ((|els| #1=(|List| (|String|))) (|#G143| #1#) (|name_s| NIL)
          (|nargs| NIL) (|xflag| NIL) (|sig_s| NIL) (|origs| NIL)
          (|pred_s| NIL) (|#G144| #1#) (|doc| NIL) (|name| (|Symbol|))
          (|pred| (|SExpression|)) (|sig| (|SExpression|))
          (|con_sym| (|Symbol|)) (|orig_l| (|List| (|SExpression|))))
         (SEQ (LETT |els| (|dbParts| |l1| 7 1))
              (PROGN
               (LETT |#G143| |els|)
               (LETT |#G144| |#G143|)
               (LETT |name_s| (|SPADfirst| |#G144|))
               (LETT |#G144| (CDR |#G144|))
               (LETT |nargs| (|SPADfirst| |#G144|))
               (LETT |#G144| (CDR |#G144|))
               (LETT |xflag| (|SPADfirst| |#G144|))
               (LETT |#G144| (CDR |#G144|))
               (LETT |sig_s| (|SPADfirst| |#G144|))
               (LETT |#G144| (CDR |#G144|))
               (LETT |origs| (|SPADfirst| |#G144|))
               (LETT |#G144| (CDR |#G144|))
               (LETT |pred_s| (|SPADfirst| |#G144|))
               (LETT |#G144| (CDR |#G144|))
               (LETT |doc| (|SPADfirst| |#G144|))
               |#G143|)
              (LETT |name| (SPADCALL |name_s| (QREFELT % 123)))
              (LETT |pred| (SPADCALL |pred_s| (QREFELT % 129)))
              (COND ((SPADCALL |pred| (QREFELT % 36)) (LETT |pred| 'T)))
              (LETT |sig| (SPADCALL |sig_s| (QREFELT % 129)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |sig| (QREFELT % 49))
                           (SPADCALL '|Mapping| (QREFELT % 31))
                           (QREFELT % 130))
                 (|error| "expand_op_lines: unexpected signature"))
                ('T
                 (SEQ (LETT |sig| (SPADCALL |sig| (QREFELT % 33)))
                      (LETT |con_sym|
                            (SPADCALL (|BRINFO;get_conname| |origs| %)
                                      (QREFELT % 123)))
                      (LETT |orig_l|
                            (CONS (SPADCALL |con_sym| (QREFELT % 31))
                                  (|BRINFO;get_constructor_args| |con_sym| %)))
                      (EXIT
                       (CONS |name|
                             (VECTOR |sig| |pred|
                                     (SPADCALL |orig_l| (QREFELT % 48))
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
         ((|#G153|
           #1=(|Record| (|:| |name| (|Symbol|))
                        (|:| |opr|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|))))))
          (|l1| NIL) (#2=#:G609 NIL) (|#G155| #1#) (|name| #3=(|Symbol|))
          (|sig1|
           #4=(|Record| (|:| |signature| (|SExpression|))
                        (|:| |condition| (|SExpression|))
                        (|:| |origin| (|SExpression|))
                        (|:| |documentation| (|String|))))
          (|oname| #3#) (|res1| (|List| #4#))
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ
          (COND ((NULL |lst|) NIL)
                ('T
                 (SEQ (LETT |lst| (SPADCALL |lst| (QREFELT % 132)))
                      (LETT |res| NIL)
                      (PROGN
                       (LETT |#G153|
                             (|BRINFO;expand_op_line| (|SPADfirst| |lst|) %))
                       (LETT |oname| (QCAR |#G153|))
                       (LETT |sig1| (QCDR |#G153|))
                       |#G153|)
                      (LETT |lst| (CDR |lst|)) (LETT |res1| (LIST |sig1|))
                      (SEQ (LETT |l1| NIL) (LETT #2# |lst|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |l1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (PROGN
                             (LETT |#G155| (|BRINFO;expand_op_line| |l1| %))
                             (LETT |name| (QCAR |#G155|))
                             (LETT |sig1| (QCDR |#G155|))
                             |#G155|)
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
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (LETT |res|
                            (CONS (CONS |oname| (NREVERSE |res1|)) |res|))
                      (EXIT (NREVERSE |res|)))))))) 

(SDEFUN |BRINFO;search_operations_libdb;SU;71|
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
           (|ErrorIndicator|))))
        (SPROG ((|res1| (|List| (|SExpression|))))
               (SEQ (LETT |res1| (|grepConstruct| |pat| '|o|))
                    (EXIT
                     (COND ((NULL |res1|) (CONS 0 NIL))
                           ((NULL (STRINGP (|SPADfirst| |res1|)))
                            (CONS 1 (CDR |res1|)))
                           ('T
                            (CONS 0 (|BRINFO;expand_op_lines| |res1| %)))))))) 

(SDEFUN |BRINFO;add_stars| ((|pc| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|pat1| (|String|)) (|pre| (|String|)) (|post| (|String|))
          (|op| (|SExpression|)) (#1=#:G626 NIL) (|arg| NIL) (#2=#:G627 NIL)
          (|args| (|List| (|SExpression|))))
         (SEQ
          (COND
           ((SPADCALL |pc| (QREFELT % 62))
            (SEQ (LETT |pat1| (SPADCALL |pc| (QREFELT % 60)))
                 (LETT |pre|
                       (COND
                        ((|eql_SI| (SPADCALL |pat1| 1 (QREFELT % 21))
                                   (QREFELT % 15))
                         "")
                        (#3='T "*")))
                 (LETT |post|
                       (COND
                        ((|eql_SI|
                          (SPADCALL |pat1| (QCSIZE |pat1|) (QREFELT % 21))
                          (QREFELT % 15))
                         "")
                        (#3# "*")))
                 (EXIT
                  (SPADCALL
                   (SPADCALL (LIST |pre| |pat1| |post|) (QREFELT % 133))
                   (QREFELT % 134)))))
           ((SPADCALL |pc| (QREFELT % 28))
            (SEQ (LETT |op| (SPADCALL |pc| (QREFELT % 49)))
                 (LETT |args|
                       (SPADCALL (SPADCALL |pc| (QREFELT % 33))
                                 (QREFELT % 30)))
                 (LETT |args|
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |arg| NIL) (LETT #2# |args|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |arg| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS (|BRINFO;add_stars| |arg| %) #1#))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))
                 (EXIT (SPADCALL (CONS |op| |args|) (QREFELT % 48)))))
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
         ((|opr| NIL) (#1=#:G639 NIL) (|name| (|Symbol|)) (|sd| NIL)
          (#2=#:G640 NIL)
          (|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|))))))))
         (SEQ
          (COND
           ((NULL (QREFELT % 108))
            (SEQ (SETELT % 107 (SPADCALL (QREFELT % 106)))
                 (EXIT (SETELT % 108 'T)))))
          (LETT |res| NIL)
          (SEQ (LETT |opr| NIL) (LETT #1# (QREFELT % 107)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |opr| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |name| (QCAR |opr|))
                    (EXIT
                     (SEQ (LETT |sd| NIL) (LETT #2# (QCDR |opr|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |sd| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |pc| (QVELT |sd| 3) (QREFELT % 37))
                              (LETT |res| (CONS (CONS |name| |sd|) |res|))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (|BRINFO;group_funs| (NREVERSE |res|) %))))) 

(SDEFUN |BRINFO;search_con_doc|
        ((|pc| (|SExpression|))
         (%
          (|Record| (|:| |categories| (|List| (|Symbol|)))
                    (|:| |domains| (|List| (|Symbol|)))
                    (|:| |packages| (|List| (|Symbol|))))))
        (SPROG
         ((#1=#:G649 NIL) (#2=#:G650 NIL) (|cnl| (|List| (|Symbol|)))
          (|cn| NIL) (#3=#:G651 NIL) (|doc| (|String|))
          (|res1| (|List| (|Symbol|))))
         (SEQ
          (LETT |cnl|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |cn| NIL) (LETT #2# (|BRINFO;all_con_names| %))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |cn| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |cn| (QREFELT % 105)))
                          (LETT #1# (CONS |cn| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |res1| NIL)
          (SEQ (LETT |cn| NIL) (LETT #3# |cnl|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |cn| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |doc| (SPADCALL |cn| (QREFELT % 127)))
                    (EXIT
                     (COND
                      ((SPADCALL |pc| (SPADCALL |cn| (QREFELT % 127))
                                 (QREFELT % 37))
                       (LETT |res1| (CONS |cn| |res1|))))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|BRINFO;split_constructors| (SPADCALL |res1| (QREFELT % 116)) %))))) 

(SDEFUN |BRINFO;search_documentation;SU;75|
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
           (|ErrorIndicator|))))
        (SPROG
         ((|pcu| (|Union| (|SExpression|) (|ErrorIndicator|)))
          (|pc| (|SExpression|))
          (|cl|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (|opl|
           (|List|
            (|Record| (|:| |name| (|Symbol|))
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |pcu| (SPADCALL |pat| (QREFELT % 35)))
              (EXIT
               (COND ((QEQCAR |pcu| 1) (CONS 1 (QCDR |pcu|)))
                     ('T
                      (SEQ (LETT |pc| (|BRINFO;add_stars| (QCDR |pcu|) %))
                           (LETT |cl| (|BRINFO;search_con_doc| |pc| %))
                           (LETT |opl| (|BRINFO;search_ops_doc| |pc| %))
                           (EXIT (CONS 0 (CONS |cl| |opl|)))))))))) 

(SDEFUN |BRINFO;search_general;SU;76|
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
           (|ErrorIndicator|))))
        (SPROG
         ((|cu|
           (|Union|
            (|Record| (|:| |categories| (|List| (|Symbol|)))
                      (|:| |domains| (|List| (|Symbol|)))
                      (|:| |packages| (|List| (|Symbol|))))
            (|ErrorIndicator|)))
          (|ou|
           (|Union|
            (|List|
             (|Record| (|:| |name| (|Symbol|))
                       (|:| |sdl|
                            (|List|
                             (|Record| (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))))
            (|ErrorIndicator|))))
         (SEQ (LETT |cu| (SPADCALL |pat| '|k| (QREFELT % 126)))
              (EXIT
               (COND ((QEQCAR |cu| 1) (CONS 1 (QCDR |cu|)))
                     (#1='T
                      (SEQ (LETT |ou| (SPADCALL |pat| (QREFELT % 109)))
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
          (LETT % (GETREFV 141))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BrowserInformation| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11 (|STR_to_CHAR| "a"))
          (QSETREFV % 12 (|STR_to_CHAR| "A"))
          (QSETREFV % 13 (|STR_to_CHAR| "Z"))
          (QSETREFV % 14 (|STR_to_CHAR| "("))
          (QSETREFV % 15 (|STR_to_CHAR| "*"))
          (QSETREFV % 16 (|STR_to_CHAR| "`"))
          (QSETREFV % 107 NIL)
          (QSETREFV % 108 NIL)
          %))) 

(DEFUN |BrowserInformation| ()
  (SPROG NIL
         (PROG (#1=#:G682)
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
           '#(NIL NIL NIL NIL NIL NIL (|SExpression|) (|List| 6)
              |BRINFO;sublis_formal;L2Se;1| (|Symbol|)
              |BRINFO;constructor_signature;SLSe;2| '|char_a| '|char_A|
              '|char_Z| '|char_lpar| '|char_star| '|char_tick| (|Character|)
              (0 . |space|) (|Integer|) (|String|) (4 . |elt|) (|Boolean|)
              (10 . >=) (16 . <=) (22 . |char|) (27 . |setelt!|)
              |BRINFO;downcase;2S;3| (34 . |list?|) (|List| %)
              (39 . |destruct|) (44 . |convert|) (49 . =) (55 . |cdr|)
              (|Union| 6 (|ErrorIndicator|)) |BRINFO;convert_pattern;SU;5|
              (60 . |null?|) |BRINFO;do_match;SeSB;6| (65 . |string|)
              (|Record| (|:| |signature| 6) (|:| |condition| 6)
                        (|:| |origin| 6) (|:| |documentation| 20))
              (|Record| (|:| |name| 9) (|:| |sdl| (|List| 39))) (|List| 40)
              |BRINFO;filter_ops;Se2L;7| (|Union| 41 (|ErrorIndicator|))
              |BRINFO;search_opl;SLU;8| |BRINFO;constructor_name?;SB;9|
              |BRINFO;exposed_constructor?;SB;10|
              |BRINFO;simp_ops_conditions;L2SeL;11| (70 . |convert|)
              (75 . |car|) (80 . |symbol|) |BRINFO;constructor_form;SSe;66|
              (85 . |symbol?|) (90 . |integer?|) (95 . |integer|)
              (|OutputForm|) (100 . |message|) (|Void|) (105 . |print|)
              (110 . |coerce|) (115 . |string|) |BRINFO;operations;SeBL;12|
              (120 . |string?|)
              (|Record| (|:| |i| 19) (|:| |name| 9) (|:| |sd| 39))
              (|Mapping| 22 63 63) (|List| 63) (125 . |sort|)
              (|Record| (|:| |grp_tag| 6) (|:| |i| 19) (|:| |name| 9)
                        (|:| |sd| 39))
              (|Mapping| 22 67 67) (|List| 67) (131 . |sort|)
              (|Record| (|:| |grp_tag| 6) (|:| |ops| 41)) (|List| 71)
              |BRINFO;group_by_condition;LL;19| |BRINFO;group_by_origin;LL;20|
              |BRINFO;group_by_implementation;LSeLL;21| (137 . |elt|) (143 . =)
              (149 . <) (|Record| (|:| |signature| 6) (|:| |condition| 6))
              (155 . =) (|Record| (|:| |name| 9) (|:| |sigs| (|List| 79)))
              (|Mapping| 22 81 81) (|List| 81) (161 . |sort|)
              (|Mapping| 22 6 6) (167 . |sort|) (|FileName|) (173 . |coerce|)
              (|BasicKeyedAccessFile|) (178 . |open|) (|None|) (184 . |read|)
              (190 . |close!|) (|List| 9) |BRINFO;dependents;SL;38|
              |BRINFO;users;SL;39|
              (|Record| (|:| |form| 6) (|:| |condition| 6))
              (|Record| (|:| |cats| 113) (|:| |ops| 41))
              |BRINFO;exports;SeR;40| (195 . |coerce|)
              (|Record| (|:| |name| 9) (|:| |sd| 39)) (|Mapping| 22 101 101)
              (|List| 101) (200 . |sort|) |BRINFO;default_name?;SB;59|
              |BRINFO;ops_from_exports;L;51| '|all_ops| '|all_ops_initialized|
              |BRINFO;search_operations;SU;52|
              |BRINFO;search_operations_libdb;SU;71|
              |BRINFO;ops_from_libdb;L;55| |BRINFO;constructor_kind;2S;56|
              (|List| 97) |BRINFO;ancestors;SeBL;57| |BRINFO;parents;SeL;58|
              (206 . |sort|)
              (|Record| (|:| |categories| 94) (|:| |domains| 94)
                        (|:| |packages| 94))
              |BRINFO;all_constructors;R;61| (211 . |position|)
              (|UniversalSegment| 19) (217 . SEGMENT) (223 . |elt|)
              (229 . |coerce|) |BRINFO;filter_symbols;Se2L;63|
              (|Union| 117 (|ErrorIndicator|))
              |BRINFO;search_constructors;SSU;64|
              |BRINFO;constructor_documentation;SS;68| (|InputForm|)
              (234 . |parse|) (239 . ~=) (|List| 20) (245 . |sort|)
              (250 . |concat|) (255 . |convert|)
              (|Record| (|:| |con_info| 117) (|:| |op_info| 41))
              (|Union| 135 (|ErrorIndicator|))
              |BRINFO;search_documentation;SU;75| |BRINFO;search_general;SU;76|
              (|Record| (|:| |grp_tag| 6) (|:| |constrs| 113)) (|List| 139))
           '#(|users| 260 |sublis_formal| 265 |simp_ops_conditions| 271
              |search_opl| 278 |search_operations_libdb| 284
              |search_operations| 289 |search_general| 294
              |search_documentation| 299 |search_constructors| 304 |parents|
              310 |ops_from_libdb| 315 |ops_from_exports| 319 |operations| 323
              |group_by_origin| 329 |group_by_implementation| 334
              |group_by_condition| 341 |filter_symbols| 351 |filter_ops| 357
              |exposed_constructor?| 363 |exports| 368 |downcase| 373
              |do_match| 378 |dependents| 384 |default_name?| 389
              |convert_pattern| 394 |constructor_signature| 399
              |constructor_name?| 405 |constructor_kind| 410 |constructor_form|
              415 |constructor_documentation| 420 |ancestors| 425
              |all_constructors| 431)
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
                              '((|dependents| ((|List| (|Symbol|)) (|Symbol|)))
                                T)
                              '((|users| ((|List| (|Symbol|)) (|Symbol|))) T)
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
                                   (|ErrorIndicator|))
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
                                   (|ErrorIndicator|))
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
                                   (|ErrorIndicator|))
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
                                   (|ErrorIndicator|))
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
                                   (|ErrorIndicator|))
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
                              '((|convert_pattern|
                                 ((|Union| (|SExpression|) (|ErrorIndicator|))
                                  (|String|)))
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
                                   (|ErrorIndicator|))
                                  (|String|)))
                                T)
                              '((|downcase| ((|String|) (|String|))) T)
                              '((|sublis_formal|
                                 ((|SExpression|) (|List| (|SExpression|))
                                  (|SExpression|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 140
                                            '(0 17 0 18 2 20 17 0 19 21 2 17 22
                                              0 0 23 2 17 22 0 0 24 1 17 0 19
                                              25 3 20 17 0 19 17 26 1 6 22 0 28
                                              1 6 29 0 30 1 6 0 9 31 2 6 22 0 0
                                              32 1 6 0 0 33 1 6 22 0 36 1 9 20
                                              0 38 1 6 0 29 48 1 6 0 0 49 1 6 9
                                              0 50 1 6 22 0 52 1 6 22 0 53 1 6
                                              19 0 54 1 55 0 20 56 1 55 57 0 58
                                              1 6 55 0 59 1 6 20 0 60 1 6 22 0
                                              62 2 65 0 64 0 66 2 69 0 68 0 70
                                              2 7 6 0 19 76 2 39 22 0 0 77 2 9
                                              22 0 0 78 2 79 22 0 0 80 2 83 0
                                              82 0 84 2 7 0 85 0 86 1 87 0 20
                                              88 2 89 0 87 20 90 2 89 91 0 20
                                              92 1 89 57 0 93 1 9 55 0 100 2
                                              103 0 102 0 104 1 94 0 0 116 2 20
                                              19 17 0 119 2 120 0 19 19 121 2
                                              20 0 0 120 122 1 9 0 20 123 1 128
                                              0 20 129 2 6 22 0 0 130 1 131 0 0
                                              132 1 20 0 29 133 1 6 0 20 134 1
                                              0 94 9 96 2 0 6 7 6 8 3 0 41 41 6
                                              6 47 2 0 43 20 41 44 1 0 43 20
                                              110 1 0 43 20 109 1 0 136 20 138
                                              1 0 136 20 137 2 0 125 20 9 126 1
                                              0 113 6 115 0 0 41 111 0 0 41 106
                                              2 0 41 6 22 61 1 0 72 41 74 3 0
                                              72 7 6 41 75 1 0 72 41 73 1 0 140
                                              113 1 2 0 94 6 94 124 2 0 41 6 41
                                              42 1 0 22 9 46 1 0 98 6 99 1 0 20
                                              20 27 2 0 22 6 20 37 1 0 94 9 95
                                              1 0 22 9 105 1 0 34 20 35 2 0 6 9
                                              7 10 1 0 22 9 45 1 0 9 9 112 1 0
                                              6 9 51 1 0 20 9 127 2 0 113 6 22
                                              114 0 0 117 118)))))
           '|lookupComplete|)) 
