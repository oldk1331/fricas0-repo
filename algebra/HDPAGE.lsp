
(SDEFUN |HDPAGE;name;%S;1| ((|page| (%)) (% (|Symbol|)))
        (SPROG ((|pr| (|Rep|))) (SEQ (LETT |pr| |page|) (EXIT (QVELT |pr| 0))))) 

(SDEFUN |HDPAGE;new;Hal%;2| ((|props| (|HyperdocAssociationList|)) (% (%)))
        (SPROG ((|lst| (|List| (|Symbol|))) (|res| (%)) (|name| (|Symbol|)))
               (SEQ (LETT |name| (GENTEMP))
                    (LETT |res|
                          (VECTOR |name| NIL (SPADCALL (QREFELT % 10)) NIL
                                  (SPADCALL (QREFELT % 10))
                                  (SPADCALL (QREFELT % 10)) |props| NIL NIL))
                    (SET |name| |res|)
                    (LETT |lst| (CONS |name| |$activePageList|))
                    (SETF |$activePageList| |lst|) (EXIT |res|)))) 

(SDEFUN |HDPAGE;get_property_list;%Hal;3|
        ((|page| (%)) (% (|HyperdocAssociationList|)))
        (SPROG ((|pr| (|Rep|))) (SEQ (LETT |pr| |page|) (EXIT (QVELT |pr| 6))))) 

(SDEFUN |HDPAGE;add_to_description;%SV;4|
        ((|page| (%)) (|s| (|String|)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (QSETVELT |pr| 7
                               (CONS (SPADCALL |s| (QREFELT % 15))
                                     (QVELT |pr| 7))))))) 

(SDEFUN |HDPAGE;add_to_description;%LV;5|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG ((#1=#:G74 NIL) (|el| NIL) (|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (QSETVELT |pr| 7 (CONS |el| (QVELT |pr| 7)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;setup_default|
        ((|page| (%)) (|name| (|Symbol|)) (|props| (|List| (|SExpression|)))
         (% (|Void|)))
        (SPROG ((|pp| (|List| (|SExpression|))) (|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (LETT |pp|
                          (LIST (SPADCALL NIL (QREFELT % 21))
                                (SPADCALL NIL (QREFELT % 21))
                                (SPADCALL NIL (QREFELT % 21))))
                    (LETT |pp| (SPADCALL |pp| |props| (QREFELT % 22)))
                    (EXIT
                     (QSETVELT |pr| 5
                               (SPADCALL
                                (CONS |name| (SPADCALL |pp| (QREFELT % 21)))
                                (QVELT |pr| 5) (QREFELT % 24))))))) 

(SDEFUN |HDPAGE;get_property;%SSe;7|
        ((|page| (%)) (|name| (|Symbol|)) (% (|SExpression|)))
        (SPROG
         ((|ar|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|))))
          (|u1|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|props| (|HyperdocAssociationList|)) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|) (LETT |props| (QVELT |pr| 6))
              (LETT |u1| (|HDPAGE;hd_assoc| |name| |props| %))
              (EXIT
               (COND ((QEQCAR |u1| 1) (SPADCALL NIL (QREFELT % 21)))
                     ('T (SEQ (LETT |ar| (QCDR |u1|)) (EXIT (QCDR |ar|))))))))) 

(SDEFUN |HDPAGE;set_property;%SSeV;8|
        ((|page| (%)) (|name| (|Symbol|)) (|val| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|ar|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|))))
          (|u1|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|props| (|HyperdocAssociationList|)) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|) (LETT |props| (QVELT |pr| 6))
              (LETT |u1| (|HDPAGE;hd_assoc| |name| |props| %))
              (EXIT
               (COND
                ((QEQCAR |u1| 1)
                 (QSETVELT |pr| 6
                           (SPADCALL (CONS |name| |val|) |props|
                                     (QREFELT % 24))))
                ('T
                 (SEQ (LETT |ar| (QCDR |u1|))
                      (EXIT (PROGN (RPLACD |ar| |val|) (QCDR |ar|)))))))))) 

(SDEFUN |HDPAGE;process_add1|
        ((|page| (%)) (|item| (|SExpression|)) (% (|Void|)))
        (COND
         ((SPADCALL |item| (QREFELT % 28))
          (|HDPAGE;process_add| |page| (SPADCALL |item| (QREFELT % 29)) %)))) 

(SDEFUN |HDPAGE;is_symbol|
        ((|se| (|SExpression|)) (|sym| (|Symbol|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |se| (QREFELT % 30))
          (EQUAL (SPADCALL |se| (QREFELT % 31)) |sym|))
         ('T NIL))) 

(SDEFUN |HDPAGE;pattern_substitution_list|
        ((|cl| (|List| (|SExpression|)))
         (%
          (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|))))))
        (SPROG
         ((|pat_vars| (|List| (|Symbol|)))
          (|res|
           (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|)))))
          (|pv| #1=(|SExpression|)) (|op| #1#) (#2=#:G116 NIL)
          (|cl1| (|List| (|SExpression|))) (#3=#:G117 NIL) (|c| NIL))
         (SEQ
          (SPADCALL (SPADCALL "pattern_substitution_list" (QREFELT % 33))
                    (QREFELT % 34))
          (LETT |res| NIL) (LETT |pat_vars| |$PatternVariableList|)
          (SEQ (LETT |c| NIL) (LETT #3# |cl|) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL |c| (QREFELT % 28)))
                   (PROGN (LETT #2# |$NoValue|) (GO #4=#:G98)))
                  ('T
                   (SEQ (LETT |cl1| (SPADCALL |c| (QREFELT % 29)))
                        (SPADCALL (SPADCALL |cl1| (QREFELT % 35))
                                  (QREFELT % 34))
                        (EXIT
                         (COND
                          ((SPADCALL (LENGTH |cl1|) 3 (QREFELT % 37))
                           (PROGN (LETT #2# |$NoValue|) (GO #4#)))
                          ('T
                           (SEQ (LETT |op| (|SPADfirst| |cl1|))
                                (SPADCALL (SPADCALL |op| (QREFELT % 38))
                                          (QREFELT % 34))
                                (LETT |pv| (|SPADfirst| (CDR |cl1|)))
                                (EXIT
                                 (COND
                                  ((OR (|HDPAGE;is_symbol| |op| '|isDomain| %)
                                       (OR
                                        (|HDPAGE;is_symbol| |op| '|ofCategory|
                                         %)
                                        (|HDPAGE;is_symbol| |op| '|Satisfies|
                                         %)))
                                   (SEQ
                                    (COND
                                     ((NULL
                                       (SPADCALL |pv| |$EmptyMode|
                                                 (QREFELT % 39)))
                                      (LETT |res|
                                            (CONS
                                             (CONS
                                              (SPADCALL |pv| (QREFELT % 31))
                                              (|SPADfirst| |pat_vars|))
                                             |res|))))
                                    (EXIT
                                     (LETT |pat_vars|
                                           (CDR |pat_vars|)))))))))))))))
                #4# (EXIT #2#))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (SPADCALL (SPADCALL |res| (QREFELT % 42)) (QREFELT % 34))
          (EXIT |res|)))) 

(SDEFUN |HDPAGE;substitute_pvars|
        ((|cl| (|List| (|SExpression|)))
         (|pat_sl|
          (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|)))))
         (% (|List| (|SExpression|))))
        (SPROG ((#1=#:G122 NIL) (|sr| NIL))
               (SEQ
                (SEQ (LETT |sr| NIL) (LETT #1# |pat_sl|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |cl|
                             (|substitute| (QCDR |sr|) (QCAR |sr|) |cl|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |cl|)))) 

(SDEFUN |HDPAGE;get_vars| ((|pat| (|SExpression|)) (% (|List| (|Symbol|))))
        (SPROG
         ((|res| (|List| (|Symbol|))) (|s1| (|Symbol|)) (#1=#:G130 NIL)
          (|p1| NIL))
         (SEQ (LETT |res| NIL)
              (COND ((NULL (SPADCALL |pat| (QREFELT % 28))) (EXIT |res|)))
              (SEQ (LETT |p1| NIL)
                   (LETT #1# (CDR (SPADCALL |pat| (QREFELT % 29)))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |p1| (QREFELT % 30))
                       (COND
                        ((SPADCALL (LETT |s1| (SPADCALL |p1| (QREFELT % 31)))
                                   |$PatternVariableList| (QREFELT % 44))
                         (LETT |res| (CONS |s1| |res|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |HDPAGE;compute_conds|
        ((|page| (%)) (|v1| #1=(|Symbol|)) (% (|SExpression|)))
        (SPROG
         ((|pvars| (|List| #1#)) (|pat| #2=(|SExpression|))
          (|res| (|List| (|SExpression|))) (|pv| #2#)
          (|cl1| (|List| (|SExpression|))) (#3=#:G140 NIL) (#4=#:G141 NIL)
          (|c1| NIL))
         (SEQ (LETT |res| NIL) (LETT |pvars| (LIST |v1|))
              (SEQ (LETT |c1| NIL) (LETT #4# (QVELT |page| 1)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |c1| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |c1| (QREFELT % 28)))
                       (PROGN (LETT #3# |$NoValue|) (GO #5=#:G131)))
                      ('T
                       (SEQ (LETT |cl1| (SPADCALL |c1| (QREFELT % 29)))
                            (COND
                             ((NULL (EQL (LENGTH |cl1|) 3))
                              (EXIT (PROGN (LETT #3# |$NoValue|) (GO #5#)))))
                            (LETT |cl1| (CDR |cl1|))
                            (LETT |pv| (|SPADfirst| |cl1|))
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |pv| (QREFELT % 31)) |pvars|
                                         (QREFELT % 44))
                               (SEQ (LETT |res| (CONS |c1| |res|))
                                    (LETT |pat| (|SPADfirst| (CDR |cl1|)))
                                    (EXIT
                                     (LETT |pvars|
                                           (SPADCALL |pvars|
                                                     (|HDPAGE;get_vars| |pat|
                                                      %)
                                                     (QREFELT % 45))))))))))))
                    #5# (EXIT #3#))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |res|) (QREFELT % 21)))))) 

(SDEFUN |HDPAGE;compute_variable_alist|
        ((|page| (%))
         (|pat_sl|
          (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|)))))
         (% (|HyperdocAssociationList|)))
        (SPROG
         ((|res| (|HyperdocAssociationList|)) (|v1| (|Symbol|)) (#1=#:G148 NIL)
          (|sr| NIL))
         (SEQ (LETT |res| (SPADCALL (QREFELT % 10)))
              (SEQ (LETT |sr| NIL) (LETT #1# |pat_sl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sr| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |v1| (QCDR |sr|))
                        (EXIT
                         (LETT |res|
                               (SPADCALL
                                (CONS |v1|
                                      (|HDPAGE;compute_conds| |page| |v1| %))
                                |res| (QREFELT % 24)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 46)))))) 

(SDEFUN |HDPAGE;process_domain_conditions|
        ((|page| (%)) (|cl| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|pat_sl|
           (|List| (|Record| (|:| |var| (|Symbol|)) (|:| |pvar| (|Symbol|))))))
         (SEQ (LETT |pat_sl| (|HDPAGE;pattern_substitution_list| |cl| %))
              (QSETVELT |page| 3 |pat_sl|)
              (QSETVELT |page| 1 (|HDPAGE;substitute_pvars| |cl| |pat_sl| %))
              (EXIT
               (QSETVELT |page| 2
                         (|HDPAGE;compute_variable_alist| |page| |pat_sl|
                          %)))))) 

(SDEFUN |HDPAGE;button_names|
        ((|l| (|List| (|SExpression|))) (% (|List| (|SExpression|))))
        (SPROG ((#1=#:G155 NIL) (|el| NIL) (#2=#:G154 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL (SPADCALL |el| (QREFELT % 29)) 3
                                         (QREFELT % 48))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |HDPAGE;process_radio_buttons|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|default| (|String|)) (|button_name| #1=(|Symbol|))
          (|buttonName| NIL) (|#G43| #2=(|List| (|SExpression|))) (|info| NIL)
          (|message| NIL) (|#G42| #2#) (#3=#:G167 NIL) (|el| NIL)
          (|buttons| (|List| (|SExpression|))) (|group_name| #1#)
          (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (LETT |group_name| (SPADCALL (|SPADfirst| |l|) (QREFELT % 31)))
              (LETT |buttons| (CDR |l|))
              (QSETVELT |pr| 4
                        (SPADCALL
                         (CONS |group_name|
                               (SPADCALL (|HDPAGE;button_names| |buttons| %)
                                         (QREFELT % 21)))
                         (QVELT |pr| 4) (QREFELT % 24)))
              (LETT |default| "1")
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #3# |buttons|) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |el| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ
                     (PROGN
                      (LETT |#G42| (SPADCALL |el| (QREFELT % 29)))
                      (LETT |#G43| |#G42|)
                      (LETT |message| (|SPADfirst| |#G43|))
                      (LETT |#G43| (CDR |#G43|))
                      (LETT |info| (|SPADfirst| |#G43|))
                      (LETT |#G43| (CDR |#G43|))
                      (LETT |buttonName| (|SPADfirst| |#G43|))
                      |#G42|)
                     (LETT |button_name|
                           (SPADCALL |buttonName| (QREFELT % 31)))
                     (COND
                      ((QEQCAR
                        (|HDPAGE;hd_assoc| |button_name| (QVELT |pr| 5) %) 1)
                       (SEQ
                        (|HDPAGE;setup_default| |page| |button_name|
                         (LIST (SPADCALL '|button| (QREFELT % 49))
                               (SPADCALL |default| (QREFELT % 15)))
                         %)
                        (EXIT (LETT |default| "0")))))
                     (|HDPAGE;process_add1| |page| |message| %)
                     (EXIT (|HDPAGE;process_add1| |page| |info| %)))
                    (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_input_string1|
        ((|page| (%)) (|l1| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|filter| (|SExpression|)) (|name| (|Symbol|)) (|type| NIL)
          (|#G50| #1=(|List| (|SExpression|))) (|name_e| NIL) (|default| NIL)
          (|n_char| NIL) (|#G49| #1#) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (PROGN
               (LETT |#G49| (SPADCALL |l1| 4 (QREFELT % 50)))
               (LETT |#G50| |#G49|)
               (LETT |n_char| (|SPADfirst| |#G50|))
               (LETT |#G50| (CDR |#G50|))
               (LETT |default| (|SPADfirst| |#G50|))
               (LETT |#G50| (CDR |#G50|))
               (LETT |name_e| (|SPADfirst| |#G50|))
               (LETT |#G50| (CDR |#G50|))
               (LETT |type| (|SPADfirst| |#G50|))
               |#G49|)
              (LETT |name| (SPADCALL |name_e| (QREFELT % 31)))
              (LETT |filter|
                    (SPADCALL (SPADCALL |l1| 4 (QREFELT % 51)) (QREFELT % 21)))
              (COND
               ((QEQCAR (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %) 1)
                (|HDPAGE;setup_default| |page| |name|
                 (LIST (SPADCALL '|string| (QREFELT % 49)) |default| |type|
                       |filter|)
                 %)))
              (EXIT
               (COND
                ((QEQCAR (|HDPAGE;label_error_msg| |page| |name| %) 0)
                 (|error| "htpLabelErrorMsg unimplemented"))))))) 

(SDEFUN |HDPAGE;process_input_strings|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|mess2| NIL) (|#G59| #1=(|List| (|SExpression|))) (|mess1| NIL)
          (|#G58| #1#) (|l1| (|List| (|SExpression|))) (#2=#:G183 NIL)
          (|el| NIL) (|ia| (|HyperdocAssociationList|)) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|) (LETT |ia| (QVELT |pr| 5))
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #2# |l|) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 29)))
                         (PROGN
                          (LETT |#G58| (SPADCALL |l1| 2 (QREFELT % 50)))
                          (LETT |#G59| |#G58|)
                          (LETT |mess1| (|SPADfirst| |#G59|))
                          (LETT |#G59| (CDR |#G59|))
                          (LETT |mess2| (|SPADfirst| |#G59|))
                          |#G58|)
                         (|HDPAGE;process_input_string1| |page|
                          (SPADCALL |l1| 2 (QREFELT % 51)) %)
                         (|HDPAGE;process_add1| |page| |mess1| %)
                         (EXIT (|HDPAGE;process_add1| |page| |mess2| %)))
                    (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_bc_buttons|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|s_res|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|name| (|Symbol|)) (|default_val| (|SExpression|))
          (|l1| (|List| (|SExpression|))) (#1=#:G193 NIL) (|el| NIL)
          (|ia| (|HyperdocAssociationList|)) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|) (LETT |ia| (QVELT |pr| 5))
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 29)))
                         (LETT |default_val| (|SPADfirst| |l1|))
                         (LETT |name|
                               (SPADCALL (SPADCALL |l1| (QREFELT % 52))
                                         (QREFELT % 31)))
                         (LETT |s_res| (|HDPAGE;hd_assoc| |name| |ia| %))
                         (EXIT
                          (COND
                           ((QEQCAR |s_res| 1)
                            (|HDPAGE;setup_default| |page| |name|
                             (LIST (SPADCALL '|button| (QREFELT % 49))
                                   |default_val|)
                             %)))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_bc_strings|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|l1| (|List| (|SExpression|))) (#1=#:G199 NIL) (|el| NIL)
          (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 29)))
                         (EXIT (|HDPAGE;process_input_string1| |page| |l1| %)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;process_add|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((#1=#:G210 NIL) (|args| (|List| (|SExpression|))) (|op| (|Symbol|))
          (|l1| (|List| (|SExpression|))) (#2=#:G211 NIL) (#3=#:G212 NIL)
          (|el| NIL))
         (SEQ (LETT |el| NIL) (LETT #3# |l|) G190
              (COND
               ((OR (ATOM #3#) (PROGN (LETT |el| (CAR #3#)) NIL)) (GO G191)))
              (SEQ
               (EXIT
                (COND
                 ((SPADCALL |el| (QREFELT % 53))
                  (PROGN (LETT #2# |$NoValue|) (GO #4=#:G200)))
                 ('T
                  (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 29)))
                       (LETT |op| (SPADCALL (|SPADfirst| |l1|) (QREFELT % 31)))
                       (LETT |args| (CDR |l1|))
                       (COND
                        ((OR (EQUAL |op| '|radioButtons|)
                             (EQUAL |op| '|bcRadioButtons|))
                         (EXIT
                          (|HDPAGE;process_radio_buttons| |page| |args| %))))
                       (EXIT
                        (COND
                         ((EQUAL |op| '|inputStrings|)
                          (|HDPAGE;process_input_strings| |page| |args| %))
                         ((EQUAL |op| '|domainConditions|)
                          (|HDPAGE;process_domain_conditions| |page| |args| %))
                         ((EQUAL |op| '|bcButtons|)
                          (|HDPAGE;process_bc_buttons| |page| |args| %))
                         ('T
                          (SEQ
                           (EXIT
                            (COND
                             ((EQUAL |op| '|bcStrings|)
                              (PROGN
                               (LETT #1#
                                     (|HDPAGE;process_bc_strings| |page| |args|
                                      %))
                               (GO #5=#:G203)))))
                           #5# (EXIT #1#)))))))))
               #4# (EXIT #2#))
              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |HDPAGE;add_to;%LV;24|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SEQ (SPADCALL |page| |l| (QREFELT % 19))
             (EXIT (|HDPAGE;process_add| |page| |l| %)))) 

(SDEFUN |HDPAGE;label_error_msg|
        ((|page| (%)) (|name| (|Symbol|))
         (% (|Union| (|SExpression|) "failed")))
        (SPROG
         ((|res| (|SExpression|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND ((QEQCAR |alr| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |res|
                             (SPADCALL
                              (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 29)) 3
                              (QREFELT % 48)))
                       (EXIT
                        (COND
                         ((SPADCALL |res| (QREFELT % 55)) (CONS 1 "failed"))
                         (#1# (CONS 0 |res|))))))))))) 

(SDEFUN |HDPAGE;label_input_string|
        ((|page| (%)) (|name| (|Symbol|)) (% (|Union| (|String|) "failed")))
        (SPROG
         ((|s| (|SExpression|))
          (|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
              (EXIT
               (COND ((QEQCAR |alr| 1) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |s|
                             (SPADCALL
                              (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 29)) 1
                              (QREFELT % 48)))
                       (EXIT
                        (COND
                         ((SPADCALL |s| (QREFELT % 56))
                          (CONS 0 (SPADCALL |s| (QREFELT % 57))))
                         (#1# (CONS 1 "failed"))))))))))) 

(SDEFUN |HDPAGE;label_default|
        ((|page| (%)) (|name| (|Symbol|)) (% (|SExpression|)))
        (SPROG
         ((|alr|
           (|Union|
            (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
            "failed"))
          (|ms| (|String|)) (|mu| (|Union| (|String|) "failed"))
          (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (LETT |mu| (|HDPAGE;label_input_string| |page| |name| %))
              (EXIT
               (COND
                ((QEQCAR |mu| 0)
                 (SEQ (LETT |ms| (QCDR |mu|))
                      (EXIT
                       (COND ((EQUAL |ms| "t") (SPADCALL 1.0 (QREFELT % 59)))
                             ((EQUAL |ms| "nil") (SPADCALL 0.0 (QREFELT % 59)))
                             (#1='T (SPADCALL |ms| (QREFELT % 15)))))))
                (#1#
                 (SEQ (LETT |alr| (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %))
                      (EXIT
                       (COND ((QEQCAR |alr| 1) (SPADCALL NIL (QREFELT % 21)))
                             (#1#
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |alr|)) (QREFELT % 29)) 5
                               (QREFELT % 48)))))))))))) 

(SDEFUN |HDPAGE;render_as_string| ((|se| (|SExpression|)) (% (|String|)))
        (SPROG ((|sy| (|Symbol|)))
               (SEQ
                (COND
                 ((SPADCALL |se| (QREFELT % 56))
                  (SPADCALL |se| (QREFELT % 57)))
                 ((SPADCALL |se| (QREFELT % 30))
                  (SEQ (LETT |sy| (SPADCALL |se| (QREFELT % 31)))
                       (EXIT
                        (COND ((EQUAL |sy| '%) "\\%")
                              (#1='T (SPADCALL |sy| (QREFELT % 60)))))))
                 ((SPADCALL |se| (QREFELT % 61))
                  (STRINGIMAGE (SPADCALL |se| (QREFELT % 62))))
                 (#1#
                  (SEQ (PRETTYPRINT |se|)
                       (EXIT (|error| "render_as_string: unhandled item")))))))) 

(SDEFUN |HDPAGE;render_ls|
        ((|page| (%)) (|ls| (|List| (|String|))) (% (|Void|)))
        (SPROG ((#1=#:G256 NIL) (|s| NIL) (|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (SEQ (LETT |s| NIL) (LETT #1# |ls|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (QSETVELT |pr| 8 (CONS |s| (QVELT |pr| 8)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render1s| ((|page| (%)) (|s| (|String|)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT (QSETVELT |pr| 8 (CONS |s| (QVELT |pr| 8))))))) 

(SDEFUN |HDPAGE;render_l1|
        ((|page| (%)) (|l1| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG ((#1=#:G263 NIL) (|el| NIL) (|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (SEQ (LETT |el| NIL) (LETT #1# |l1|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETVELT |pr| 8
                                      (CONS (|HDPAGE;render_as_string| |el| %)
                                            (QVELT |pr| 8)))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render1| ((|page| (%)) (|s| (|SExpression|)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (EXIT
                     (COND
                      ((SPADCALL |s| (QREFELT % 28))
                       (|HDPAGE;render_l1| |page| (SPADCALL |s| (QREFELT % 29))
                        %))
                      ('T
                       (QSETVELT |pr| 8
                                 (CONS (|HDPAGE;render_as_string| |s| %)
                                       (QVELT |pr| 8))))))))) 

(SDEFUN |HDPAGE;render_item|
        ((|page| (%)) (|item| (|SExpression|)) (% (|Void|)))
        (COND
         ((SPADCALL |item| (QREFELT % 53)) (|HDPAGE;render1| |page| |item| %))
         ('T (|HDPAGE;render_page| |page| (SPADCALL |item| (QREFELT % 29)) %)))) 

(SDEFUN |HDPAGE;split_options|
        ((|links| (|SExpression|))
         (%
          (|Record| (|:| |links| (|List| (|SExpression|)))
                    (|:| |options| (|List| (|SExpression|))))))
        (SPROG
         ((|ll| (|List| (|SExpression|))) (|was_options| (|Boolean|))
          (|lo| (|List| (|SExpression|))) (#1=#:G277 NIL) (|el| NIL)
          (|l1| (|List| (|SExpression|))))
         (SEQ (LETT |l1| (SPADCALL |links| (QREFELT % 29))) (LETT |ll| NIL)
              (LETT |lo| NIL) (LETT |was_options| NIL)
              (SEQ (LETT |el| NIL) (LETT #1# |l1|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND (|was_options| (LETT |lo| (CONS |el| |lo|)))
                           ('T
                            (SEQ
                             (COND
                              ((SPADCALL |el| (QREFELT % 30))
                               (COND
                                ((EQUAL (SPADCALL |el| (QREFELT % 31))
                                        '|options|)
                                 (EXIT (LETT |was_options| 'T))))))
                             (EXIT (LETT |ll| (CONS |el| |ll|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |ll|) (NREVERSE |lo|)))))) 

(SDEFUN |HDPAGE;trim_options|
        ((|links| (|SExpression|)) (% (|List| (|SExpression|))))
        (SPROG
         ((|ll| (|List| (|SExpression|))) (#1=#:G286 NIL) (#2=#:G287 NIL)
          (|el| NIL) (|l1| (|List| (|SExpression|))))
         (SEQ (LETT |l1| (SPADCALL |links| (QREFELT % 29))) (LETT |ll| NIL)
              (SEQ
               (EXIT
                (SEQ (LETT |el| NIL) (LETT #2# |l1|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL |el| (QREFELT % 30))
                        (COND
                         ((EQUAL (SPADCALL |el| (QREFELT % 31)) '|options|)
                          (EXIT (PROGN (LETT #1# 1) (GO #3=#:G283)))))))
                      (EXIT (LETT |ll| (CONS |el| |ll|))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))
               #3# (EXIT #1#))
              (EXIT (NREVERSE |ll|))))) 

(SDEFUN |HDPAGE;render_button|
        ((|page| (%)) (|link| (|String|)) (|message| (|SExpression|))
         (|fn| (|String|)) (% (|Void|)))
        (SPROG
         ((|type| (|Symbol|)) (|id| #1=(|String|))
          (|el| (|List| (|SExpression|))) (#2=#:G295 NIL) (|en| NIL)
          (|name| #1#) (|pr| (|Rep|)))
         (SEQ (|HDPAGE;render_ls| |page| (LIST |link| "{") %)
              (|HDPAGE;render1| |page| |message| %)
              (|HDPAGE;render_ls| |page|
               (LIST "}{(|htDoneButton| '|" |fn| "| (PROGN ") %)
              (LETT |pr| |page|)
              (LETT |name| (SPADCALL (QVELT |pr| 0) (QREFELT % 60)))
              (SEQ (LETT |en| NIL)
                   (LETT #2# (SPADCALL (QVELT |pr| 5) (QREFELT % 64))) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |en| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |el| (SPADCALL (QCDR |en|) (QREFELT % 29)))
                        (LETT |id| (SPADCALL (QCAR |en|) (QREFELT % 60)))
                        (LETT |type|
                              (SPADCALL (SPADCALL |el| 4 (QREFELT % 48))
                                        (QREFELT % 31)))
                        (|HDPAGE;render_ls| |page|
                         (LIST "(|htpSetLabelInputString| " |name| " '|" |id|
                               "| ")
                         %)
                        (COND
                         ((EQUAL |type| '|string|)
                          (|HDPAGE;render1s| |page| "\"\\stringvalue{" %))
                         ('T (|HDPAGE;render1s| |page| "\"\\boxvalue{" %)))
                        (EXIT
                         (|HDPAGE;render_ls| |page| (LIST |id| "}\")") %)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|HDPAGE;render_ls| |page| (LIST " " |name| "))}") %))))) 

(SDEFUN |HDPAGE;render_link_button|
        ((|page| (%)) (|link| (|String|)) (|ld| (|SExpression|))
         (|items?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|fn| (|SExpression|)) (|val| (|List| (|SExpression|))) (|func| NIL)
          (|#G106| #1=(|List| (|SExpression|))) (|info| NIL) (|message| NIL)
          (|#G105| #1#) (|l1| (|List| (|SExpression|))))
         (SEQ (LETT |l1| (SPADCALL |ld| (QREFELT % 29)))
              (PROGN
               (LETT |#G105| (SPADCALL |l1| 3 (QREFELT % 50)))
               (LETT |#G106| |#G105|)
               (LETT |message| (|SPADfirst| |#G106|))
               (LETT |#G106| (CDR |#G106|))
               (LETT |info| (|SPADfirst| |#G106|))
               (LETT |#G106| (CDR |#G106|))
               (LETT |func| (|SPADfirst| |#G106|))
               |#G105|)
              (LETT |val| (SPADCALL |l1| 3 (QREFELT % 51)))
              (LETT |fn| (|mkCurryFun| |func| |val|))
              (COND (|items?| (|HDPAGE;render1s| |page| "\\item[" %)))
              (|HDPAGE;render_button| |page| |link| |message|
               (SPADCALL (SPADCALL |fn| (QREFELT % 31)) (QREFELT % 60)) %)
              (COND (|items?| (|HDPAGE;render1s| |page| "]\\space{}" %)))
              (EXIT
               (COND
                ((SPADCALL |info| (QREFELT % 28))
                 (|HDPAGE;render_page| |page| (SPADCALL |info| (QREFELT % 29))
                  %))
                ('T (|HDPAGE;render1| |page| |info| %))))))) 

(SDEFUN |HDPAGE;render_lisp_links|
        ((|page| (%)) (|arg| (|SExpression|)) (|memo?| (|Boolean|))
         (% (|Void|)))
        (SPROG
         ((#1=#:G302 NIL) (|ld| NIL) (|link| (|String|)) (|ind_s| (|String|))
          (|links| (|List| (|SExpression|))))
         (SEQ (LETT |links| (|HDPAGE;trim_options| |arg| %)) (LETT |ind_s| "5")
              (|HDPAGE;render_ls| |page|
               (LIST "\\newline\\indent{" |ind_s| "}\\beginitems") %)
              (LETT |link|
                    (COND (|memo?| "\\lispmemolink") ('T "\\lispdownlink")))
              (SEQ (LETT |ld| NIL) (LETT #1# |links|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ld| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (|HDPAGE;render_link_button| |page| |link| |ld| 'T %)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|HDPAGE;render1s| |page| "\\enditems\\indent{0} " %))))) 

(SDEFUN |HDPAGE;render_bc_links0|
        ((|page| (%)) (|arg| (|SExpression|)) (|link| (|String|)) (% (|Void|)))
        (SPROG ((#1=#:G307 NIL) (|ld| NIL) (|links| (|List| (|SExpression|))))
               (SEQ (LETT |links| (|HDPAGE;trim_options| |arg| %))
                    (EXIT
                     (SEQ (LETT |ld| NIL) (LETT #1# |links|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |ld| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (|HDPAGE;render_link_button| |page| |link| |ld| NIL
                             %)))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render_bc_links|
        ((|page| (%)) (|links| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_bc_links0| |page| |links| "\\lispdownlink" %)) 

(SDEFUN |HDPAGE;render_bc_lisp_links|
        ((|page| (%)) (|links| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_bc_links0| |page| |links| "\\lisplink" %)) 

(SDEFUN |HDPAGE;hd_assoc|
        ((|name| (|Symbol|)) (|al| (|HyperdocAssociationList|))
         (%
          (|Union|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))
           "failed")))
        (SPROG
         ((#1=#:G320 NIL)
          (|r|
           (|Record| (|:| |key| (|Symbol|)) (|:| |entry| (|SExpression|)))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL (NULL (SPADCALL |al| (QREFELT % 65)))) (GO G191)))
                 (SEQ (LETT |r| (SPADCALL |al| (QREFELT % 66)))
                      (EXIT
                       (COND
                        ((EQUAL |name| (QCAR |r|))
                         (PROGN (LETT #1# (CONS 0 |r|)) (GO #2=#:G319)))
                        ('T (LETT |al| (SPADCALL |al| (QREFELT % 67)))))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 1 "failed"))))
          #2# (EXIT #1#)))) 

(SDEFUN |HDPAGE;render_input_string1|
        ((|page| (%)) (|mess1| (|String|)) (|mess2| (|String|))
         (|l1| (|List| (|SExpression|))) (|items?| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|filter| (|SExpression|)) (|name| (|Symbol|)) (|type| NIL)
          (|#G130| #1=(|List| (|SExpression|))) (|name_e| NIL) (|default| NIL)
          (|n_char| NIL) (|#G129| #1#) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (PROGN
               (LETT |#G129| (SPADCALL |l1| 4 (QREFELT % 50)))
               (LETT |#G130| |#G129|)
               (LETT |n_char| (|SPADfirst| |#G130|))
               (LETT |#G130| (CDR |#G130|))
               (LETT |default| (|SPADfirst| |#G130|))
               (LETT |#G130| (CDR |#G130|))
               (LETT |name_e| (|SPADfirst| |#G130|))
               (LETT |#G130| (CDR |#G130|))
               (LETT |type| (|SPADfirst| |#G130|))
               |#G129|)
              (LETT |name| (SPADCALL |name_e| (QREFELT % 31)))
              (LETT |filter|
                    (SPADCALL (SPADCALL |l1| 4 (QREFELT % 51)) (QREFELT % 21)))
              (COND
               ((QEQCAR (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %) 1)
                (|HDPAGE;setup_default| |page| |name|
                 (LIST (SPADCALL '|string| (QREFELT % 49)) |default| |type|
                       |filter|)
                 %)))
              (COND
               ((QEQCAR (|HDPAGE;label_error_msg| |page| |name| %) 0)
                (|error| "htpLabelErrorMsg unimplemented")))
              (COND
               (|items?|
                (SEQ (|HDPAGE;render1s| |page| "\\item " %)
                     (EXIT (|HDPAGE;render1s| |page| |mess1| %)))))
              (EXIT
               (|HDPAGE;render_ls| |page|
                (LIST "\\inputstring{" (SPADCALL |name| (QREFELT % 60)) "}{"
                      (STRINGIMAGE (SPADCALL |n_char| (QREFELT % 62))) "}{"
                      (|HDPAGE;render_as_string|
                       (|HDPAGE;label_default| |page| |name| %) %)
                      "} " |mess2|)
                %))))) 

(SDEFUN |HDPAGE;render_bc_strings|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((#1=#:G330 NIL) (|el| NIL) (|strings| (|List| (|SExpression|)))
          (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (LETT |strings| (SPADCALL |arg| (QREFELT % 29)))
              (EXIT
               (SEQ (LETT |el| NIL) (LETT #1# |strings|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (|HDPAGE;render_input_string1| |page| "" ""
                       (SPADCALL |el| (QREFELT % 29)) NIL %)))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render_input_strings|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|mess2| NIL) (|#G142| #1=(|List| (|SExpression|))) (|mess1| NIL)
          (|#G141| #1#) (|l1| #2=(|List| (|SExpression|))) (#3=#:G336 NIL)
          (|el| NIL) (|strings| #2#))
         (SEQ (|HDPAGE;render1s| |page| "\\newline\\indent{5}\\beginitems " %)
              (LETT |strings| (SPADCALL |arg| (QREFELT % 29)))
              (SEQ (LETT |el| NIL) (LETT #3# |strings|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |el| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 29)))
                        (PROGN
                         (LETT |#G141| (SPADCALL |l1| 2 (QREFELT % 50)))
                         (LETT |#G142| |#G141|)
                         (LETT |mess1| (|SPADfirst| |#G142|))
                         (LETT |#G142| (CDR |#G142|))
                         (LETT |mess2| (|SPADfirst| |#G142|))
                         |#G141|)
                        (EXIT
                         (|HDPAGE;render_input_string1| |page|
                          (SPADCALL |mess1| (QREFELT % 57))
                          (SPADCALL |mess2| (QREFELT % 57))
                          (SPADCALL |l1| 2 (QREFELT % 51)) 'T %)))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|HDPAGE;render1s| |page| "\\enditems\\indent{0}\\newline "
                %))))) 

(SDEFUN |HDPAGE;render_radio_buttons0|
        ((|page| (%)) (|arg| (|SExpression|)) (|items?| (|Boolean|))
         (% (|Void|)))
        (SPROG
         ((|button_name| (|Symbol|)) (|buttonName| NIL)
          (|#G151| #1=(|List| (|SExpression|))) (|info| NIL) (|message| NIL)
          (|#G150| #1#) (#2=#:G342 NIL) (|el| NIL)
          (|hd_line| (|List| #3=(|String|))) (|boxes_name| #3#)
          (|buttons| (|List| (|SExpression|))) (|group_name| (|SExpression|))
          (|args| #1#) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|) (LETT |args| (SPADCALL |arg| (QREFELT % 29)))
              (LETT |group_name| (|SPADfirst| |args|))
              (LETT |buttons| (CDR |args|))
              (LETT |boxes_name| (SPADCALL (GENTEMP) (QREFELT % 60)))
              (LETT |hd_line|
                    (LIST "\\radioboxes{" |boxes_name|
                          "}{\\htbmfile{pick}}{\\htbmfile{unpick}}"))
              (COND
               (|items?|
                (LETT |hd_line|
                      (CONS "\\newline\\indent{5}"
                            (SPADCALL |hd_line| "\\beginitems "
                                      (QREFELT % 69))))))
              (|HDPAGE;render_ls| |page| |hd_line| %)
              (SEQ (LETT |el| NIL) (LETT #2# |buttons|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (PROGN
                     (LETT |#G150| (SPADCALL |el| (QREFELT % 29)))
                     (LETT |#G151| |#G150|)
                     (LETT |message| (|SPADfirst| |#G151|))
                     (LETT |#G151| (CDR |#G151|))
                     (LETT |info| (|SPADfirst| |#G151|))
                     (LETT |#G151| (CDR |#G151|))
                     (LETT |buttonName| (|SPADfirst| |#G151|))
                     |#G150|)
                    (LETT |button_name| (SPADCALL |buttonName| (QREFELT % 31)))
                    (COND (|items?| (|HDPAGE;render1s| |page| "\\item" %)))
                    (|HDPAGE;render_ls| |page|
                     (LIST "{\\em\\radiobox["
                           (|HDPAGE;render_as_string|
                            (|HDPAGE;label_default| |page| |button_name| %) %)
                           "]{" (SPADCALL |button_name| (QREFELT % 60)) "}{"
                           |boxes_name| "}")
                     %)
                    (COND (|items?| (|HDPAGE;render1s| |page| "\\space{}" %)))
                    (|HDPAGE;render_item| |page| |message| %)
                    (|HDPAGE;render1s| |page| "\\space{}}" %)
                    (EXIT (|HDPAGE;render_item| |page| |info| %)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                (|items?|
                 (|HDPAGE;render1s| |page| "\\enditems\\indent{0} " %))))))) 

(SDEFUN |HDPAGE;render_radio_buttons|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_radio_buttons0| |page| |arg| 'T %)) 

(SDEFUN |HDPAGE;render_bc_radio_buttons|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (|HDPAGE;render_radio_buttons0| |page| |arg| NIL %)) 

(SDEFUN |HDPAGE;render_bc_buttons|
        ((|page| (%)) (|args| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|k| (|SExpression|)) (|name| (|Symbol|)) (|name_e| NIL)
          (|#G163| #1=(|List| (|SExpression|))) (|default| NIL) (|#G162| #1#)
          (#2=#:G352 NIL) (|arg| NIL) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (EXIT
               (SEQ (LETT |arg| NIL)
                    (LETT #2# (SPADCALL |args| (QREFELT % 29))) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |arg| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (PROGN
                      (LETT |#G162| (SPADCALL |arg| (QREFELT % 29)))
                      (LETT |#G163| |#G162|)
                      (LETT |default| (|SPADfirst| |#G163|))
                      (LETT |#G163| (CDR |#G163|))
                      (LETT |name_e| (|SPADfirst| |#G163|))
                      |#G162|)
                     (LETT |name| (SPADCALL |name_e| (QREFELT % 31)))
                     (COND
                      ((QEQCAR (|HDPAGE;hd_assoc| |name| (QVELT |pr| 5) %) 1)
                       (|HDPAGE;setup_default| |page| |name|
                        (LIST (SPADCALL '|button| (QREFELT % 49)) |default|)
                        %)))
                     (LETT |k| (|HDPAGE;label_default| |page| |name| %))
                     (EXIT
                      (COND
                       ((EQUAL |k| 0.0)
                        (|HDPAGE;render_ls| |page|
                         (LIST "\\off{" (SPADCALL |name| (QREFELT % 60)) "}")
                         %))
                       ((EQUAL |k| 1.0)
                        (|HDPAGE;render_ls| |page|
                         (LIST "\\on{" (SPADCALL |name| (QREFELT % 60)) "}")
                         %))
                       ('T
                        (|HDPAGE;render_ls| |page|
                         (LIST "\\inputbox[" (|HDPAGE;render_as_string| |k| %)
                               "]{" (SPADCALL |name| (QREFELT % 60))
                               "}{\\htbmfile{pick}}{\\htbmfile{unpick}}")
                         %)))))
                    (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |HDPAGE;render_done_button|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|message| (|String|)) (|fn| (|String|)) (|label| (|String|))
          (|fun_e| NIL) (|#G169| #1=(|List| (|SExpression|))) (|lab_e| NIL)
          (|#G168| #1#))
         (SEQ
          (PROGN
           (LETT |#G168| (SPADCALL |arg| (QREFELT % 29)))
           (LETT |#G169| |#G168|)
           (LETT |lab_e| (|SPADfirst| |#G169|))
           (LETT |#G169| (CDR |#G169|))
           (LETT |fun_e| (|SPADfirst| |#G169|))
           |#G168|)
          (LETT |label| (SPADCALL |lab_e| (QREFELT % 57)))
          (LETT |fn|
                (SPADCALL (SPADCALL |fun_e| (QREFELT % 31)) (QREFELT % 60)))
          (LETT |message|
                (COND ((EQUAL |label| "Continue") "\\ContinueBitmap")
                      ((OR
                        (OR (EQUAL |label| "Push to enter names")
                            (EQUAL |label| "Select to Set Value"))
                        (EQUAL |label| "Select to Set Values"))
                       "\\ControlBitmap{ClickToSet}")
                      ('T
                       (SEQ
                        (SPADCALL (SPADCALL |label| (QREFELT % 70))
                                  (QREFELT % 34))
                        (EXIT
                         (|error|
                          "render_done_button: unimplemented label"))))))
          (EXIT
           (|HDPAGE;render_button| |page| "\\lispdownlink"
            (SPADCALL |message| (QREFELT % 15)) |fn| %))))) 

(SDEFUN |HDPAGE;render_doit_button|
        ((|page| (%)) (|arg| (|SExpression|)) (% (|Void|)))
        (SPROG
         ((|message| (|String|)) (|fn| #1=(|String|)) (|label| #1#)
          (|fun_e| NIL) (|#G175| #2=(|List| (|SExpression|))) (|lab_e| NIL)
          (|#G174| #2#) (|pr| (|Rep|)))
         (SEQ (LETT |pr| |page|)
              (PROGN
               (LETT |#G174| (SPADCALL |arg| (QREFELT % 29)))
               (LETT |#G175| |#G174|)
               (LETT |lab_e| (|SPADfirst| |#G175|))
               (LETT |#G175| (CDR |#G175|))
               (LETT |fun_e| (|SPADfirst| |#G175|))
               |#G174|)
              (LETT |label| (SPADCALL |lab_e| (QREFELT % 57)))
              (LETT |fn| (SPADCALL |fun_e| (QREFELT % 57)))
              (LETT |message|
                    (COND ((EQUAL |label| "Do It") "\\DoItBitmap")
                          ('T (|error| "unimplemented"))))
              (EXIT
               (|HDPAGE;render_ls| |page|
                (LIST "\\newline\\vspace{1}\\centerline{\\lispcommand{"
                      |message| "}{(|doDoitButton| "
                      (SPADCALL (QVELT |pr| 0) (QREFELT % 60)) " \""
                      (|htEscapeString| |fn|) "\")}}")
                %))))) 

(SDEFUN |HDPAGE;render_page_element|
        ((|page| (%)) (|op| (|Symbol|)) (|args| (|SExpression|)) (% (|Void|)))
        (COND ((EQUAL |op| '|text|) (|HDPAGE;render1| |page| |args| %))
              ((EQUAL |op| '|bcLinks|)
               (|HDPAGE;render_bc_links| |page| |args| %))
              ((EQUAL |op| '|bcLispLinks|)
               (|HDPAGE;render_bc_lisp_links| |page| |args| %))
              ((EQUAL |op| '|domainConditions|) (SPADCALL (QREFELT % 71)))
              ((EQUAL |op| '|bcStrings|)
               (|HDPAGE;render_bc_strings| |page| |args| %))
              ((EQUAL |op| '|bcRadioButtons|)
               (|HDPAGE;render_bc_radio_buttons| |page| |args| %))
              ((EQUAL |op| '|bcButtons|)
               (|HDPAGE;render_bc_buttons| |page| |args| %))
              ((EQUAL |op| '|radioButtons|)
               (|HDPAGE;render_radio_buttons| |page| |args| %))
              ((EQUAL |op| '|lispLinks|)
               (|HDPAGE;render_lisp_links| |page| |args| NIL %))
              ((EQUAL |op| '|doneButton|)
               (|HDPAGE;render_done_button| |page| |args| %))
              ((EQUAL |op| '|doitButton|)
               (|HDPAGE;render_doit_button| |page| |args| %))
              ((EQUAL |op| '|inputStrings|)
               (|HDPAGE;render_input_strings| |page| |args| %))
              ('T (|error| "unexpected page item")))) 

(SDEFUN |HDPAGE;render_page|
        ((|page| (%)) (|l| (|List| (|SExpression|))) (% (|Void|)))
        (SPROG
         ((|args| (|SExpression|)) (|op| (|Symbol|))
          (|l1| (|List| (|SExpression|))) (#1=#:G381 NIL) (|el| NIL))
         (SEQ (LETT |el| NIL) (LETT #1# |l|) G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |el| (CAR #1#)) NIL)) (GO G191)))
              (SEQ (LETT |op| '|text|)
                   (LETT |args|
                         (COND ((SPADCALL |el| (QREFELT % 56)) |el|)
                               ((SPADCALL |el| (QREFELT % 30))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |el| (QREFELT % 31))
                                           (QREFELT % 60))
                                 (QREFELT % 15)))
                               ((SPADCALL |el| (QREFELT % 53))
                                (|error| "unexpected atom"))
                               ('T
                                (SEQ (LETT |l1| (SPADCALL |el| (QREFELT % 29)))
                                     (LETT |op|
                                           (SPADCALL (|SPADfirst| |l1|)
                                                     (QREFELT % 31)))
                                     (EXIT
                                      (SPADCALL (CDR |l1|) (QREFELT % 21)))))))
                   (EXIT (|HDPAGE;render_page_element| |page| |op| |args| %)))
              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |HDPAGE;render_page0| ((|page| (%)) (% (|Void|)))
        (SPROG ((|l| (|String|)) (|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|) (QSETVELT |pr| 8 NIL)
                    (|HDPAGE;render_page| |page| (QVELT |pr| 7) %)
                    (QSETVELT |pr| 8 (NREVERSE (QVELT |pr| 8)))
                    (LETT |l| (SPADCALL (QVELT |pr| 8) (QREFELT % 72)))
                    (SPADCALL |l| (QREFELT % 74))
                    (EXIT (SPADCALL (QREFELT % 75)))))) 

(SDEFUN |HDPAGE;show;%V;55| ((|page| (%)) (% (|Void|)))
        (SPROG ((|pr| (|Rep|)))
               (SEQ (LETT |pr| |page|)
                    (QSETVELT |pr| 7 (NREVERSE (QVELT |pr| 7)))
                    (EXIT (|HDPAGE;render_page0| |page| %))))) 

(DECLAIM (NOTINLINE |HyperdocPage;|)) 

(DEFUN |HyperdocPage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HyperdocPage|))
          (LETT % (GETREFV 77))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HyperdocPage| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |name| (|Symbol|))
                              (|:| |domain_conditions|
                                   (|List| (|SExpression|)))
                              (|:| |variable_alist|
                                   (|HyperdocAssociationList|))
                              (|:| |pattern_vars|
                                   (|List|
                                    (|Record| (|:| |var| (|Symbol|))
                                              (|:| |pvar| (|Symbol|)))))
                              (|:| |radio_buttons| (|HyperdocAssociationList|))
                              (|:| |input_areas| (|HyperdocAssociationList|))
                              (|:| |property_list| (|HyperdocAssociationList|))
                              (|:| |page_description| (|List| (|SExpression|)))
                              (|:| |work_area| (|List| (|String|)))))
          %))) 

(DEFUN |HyperdocPage| ()
  (SPROG NIL
         (PROG (#1=#:G387)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HyperdocPage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HyperdocPage|
                             (LIST (CONS NIL (CONS 1 (|HyperdocPage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|HyperdocPage|)))))))))) 

(MAKEPROP '|HyperdocPage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Symbol|) |HDPAGE;name;%S;1|
              (|HyperdocAssociationList|) (0 . |empty|) |HDPAGE;new;Hal%;2|
              |HDPAGE;get_property_list;%Hal;3| (|String|) (|SExpression|)
              (4 . |convert|) (|Void|) |HDPAGE;add_to_description;%SV;4|
              (|List| 14) |HDPAGE;add_to_description;%LV;5| (|List| %)
              (9 . |convert|) (14 . |concat|)
              (|Record| (|:| |key| 7) (|:| |entry| 14)) (20 . |cons|)
              |HDPAGE;get_property;%SSe;7| |HDPAGE;set_property;%SSeV;8|
              (|Boolean|) (26 . |list?|) (31 . |destruct|) (36 . |symbol?|)
              (41 . |symbol|) (|OutputForm|) (46 . |message|) (51 . |print|)
              (56 . |coerce|) (|NonNegativeInteger|) (61 . ~=) (67 . |coerce|)
              (72 . =) (|Record| (|:| |var| 7) (|:| |pvar| 7)) (|List| 40)
              (78 . |coerce|) (|List| 7) (83 . |member?|) (89 . |concat!|)
              (95 . |reverse!|) (|Integer|) (100 . |elt|) (106 . |convert|)
              (111 . |first|) (117 . |rest|) (123 . |second|) (128 . |atom?|)
              |HDPAGE;add_to;%LV;24| (133 . |null?|) (138 . |string?|)
              (143 . |string|) (|DoubleFloat|) (148 . |convert|)
              (153 . |string|) (158 . |integer?|) (163 . |integer|) (|List| 23)
              (168 . |entries|) (173 . |empty?|) (178 . |first|) (183 . |rest|)
              (|List| 13) (188 . |concat|) (194 . |coerce|) (199 . |void|)
              (203 . |concat|) (|HyperdocConnection|) (208 . |send_line|)
              (213 . |end_page|) |HDPAGE;show;%V;55|)
           '#(|show| 217 |set_property| 222 |new| 229 |name| 234
              |get_property_list| 239 |get_property| 244 |add_to_description|
              250 |add_to| 262)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|new| ($$ (|HyperdocAssociationList|))) T)
                              '((|name| ((|Symbol|) $$)) T)
                              '((|add_to|
                                 ((|Void|) $$ (|List| (|SExpression|))))
                                T)
                              '((|add_to_description| ((|Void|) $$ (|String|)))
                                T)
                              '((|add_to_description|
                                 ((|Void|) $$ (|List| (|SExpression|))))
                                T)
                              '((|get_property_list|
                                 ((|HyperdocAssociationList|) $$))
                                T)
                              '((|get_property|
                                 ((|SExpression|) $$ (|Symbol|)))
                                T)
                              '((|set_property|
                                 ((|Void|) $$ (|Symbol|) (|SExpression|)))
                                T)
                              '((|show| ((|Void|) $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 76
                                            '(0 9 0 10 1 14 0 13 15 1 14 0 20
                                              21 2 18 0 0 0 22 2 9 0 23 0 24 1
                                              14 27 0 28 1 14 20 0 29 1 14 27 0
                                              30 1 14 7 0 31 1 32 0 13 33 1 32
                                              16 0 34 1 18 32 0 35 2 36 27 0 0
                                              37 1 14 32 0 38 2 14 27 0 0 39 1
                                              41 32 0 42 2 43 27 7 0 44 2 43 0
                                              0 0 45 1 9 0 0 46 2 18 14 0 47 48
                                              1 14 0 7 49 2 18 0 0 36 50 2 18 0
                                              0 36 51 1 18 14 0 52 1 14 27 0 53
                                              1 14 27 0 55 1 14 27 0 56 1 14 13
                                              0 57 1 14 0 58 59 1 7 13 0 60 1
                                              14 27 0 61 1 14 47 0 62 1 9 63 0
                                              64 1 9 27 0 65 1 9 23 0 66 1 9 0
                                              0 67 2 68 0 0 13 69 1 13 32 0 70
                                              0 16 0 71 1 13 0 20 72 1 73 16 13
                                              74 0 73 16 75 1 0 16 0 76 3 0 16
                                              0 7 14 26 1 0 0 9 11 1 0 7 0 8 1
                                              0 9 0 12 2 0 14 0 7 25 2 0 16 0
                                              18 19 2 0 16 0 13 17 2 0 16 0 18
                                              54)))))
           '|lookupComplete|)) 
