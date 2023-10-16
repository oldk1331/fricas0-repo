
(SDEFUN |COMMONOP;operator;SBo;1| ((|s| |Symbol|) ($ |BasicOperator|))
        (SPROG ((#1=#:G111 NIL) (#2=#:G112 NIL) (#3=#:G113 NIL) (|op| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (QREFELT $ 9) (QREFELT $ 159))
                    (|COMMONOP;startUp| NIL $)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |op| NIL) (LETT #3# (QREFELT $ 154)) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |op| |s| (QREFELT $ 160))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (SPADCALL |op| (QREFELT $ 161)))
                                     (GO #4=#:G110)))
                              (GO #5=#:G108))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (SPADCALL |s| (QREFELT $ 46)))))
                #4# (EXIT #2#)))) 

(SDEFUN |COMMONOP;dpi| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL '|%pi| (QREFELT $ 164))) 

(SDEFUN |COMMONOP;dfact| ((|x| |OutputForm|) ($ |OutputForm|))
        (SPADCALL (SPADCALL '! (QREFELT $ 164))
                  (COND ((ATOM |x|) |x|) ('T (SPADCALL |x| (QREFELT $ 165))))
                  (QREFELT $ 166))) 

(SDEFUN |COMMONOP;dquote| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT $ 167)) (CDR |l|)
                  (QREFELT $ 169))) 

(SDEFUN |COMMONOP;dgamma| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL '|Gamma| (QREFELT $ 164)) |l| (QREFELT $ 169))) 

(SDEFUN |COMMONOP;dEllipticE2| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPADCALL (SPADCALL '|ellipticE| (QREFELT $ 164)) |l| (QREFELT $ 169))) 

(SDEFUN |COMMONOP;setDummyVar|
        ((|op| |BasicOperator|) (|n| |NonNegativeInteger|) ($ |BasicOperator|))
        (SPADCALL |op| '|%dummyVar| |n| (QREFELT $ 171))) 

(SDEFUN |COMMONOP;dexp| ((|x| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|e| (|OutputForm|)))
               (SEQ (LETT |e| (SPADCALL '|%e| (QREFELT $ 164)))
                    (EXIT
                     (COND
                      ((SPADCALL |x| (SPADCALL 1 (QREFELT $ 172))
                                 (QREFELT $ 173))
                       |e|)
                      ('T (SPADCALL |e| |x| (QREFELT $ 174)))))))) 

(SDEFUN |COMMONOP;inputdefsum| ((|a| |List| (|InputForm|)) ($ |InputForm|))
        (SPROG ((|eq| #1=(|InputForm|)) (|seg| #1#))
               (SEQ
                (LETT |seg|
                      (SPADCALL
                       (LIST (SPADCALL 'SEGMENT (QREFELT $ 176))
                             (SPADCALL |a| 4 (QREFELT $ 179))
                             (SPADCALL |a| 5 (QREFELT $ 179)))
                       (QREFELT $ 180)))
                (LETT |eq|
                      (SPADCALL
                       (LIST (SPADCALL '|equation| (QREFELT $ 176))
                             (SPADCALL |a| 2 (QREFELT $ 179)) |seg|)
                       (QREFELT $ 180)))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|sum| (QREFELT $ 176))
                        (SPADCALL |a| 1 (QREFELT $ 179)) |eq|)
                  (QREFELT $ 180)))))) 

(SDEFUN |COMMONOP;inputdefprod| ((|a| |List| (|InputForm|)) ($ |InputForm|))
        (SPROG ((|eq| #1=(|InputForm|)) (|seg| #1#))
               (SEQ
                (LETT |seg|
                      (SPADCALL
                       (LIST (SPADCALL 'SEGMENT (QREFELT $ 176))
                             (SPADCALL |a| 4 (QREFELT $ 179))
                             (SPADCALL |a| 5 (QREFELT $ 179)))
                       (QREFELT $ 180)))
                (LETT |eq|
                      (SPADCALL
                       (LIST (SPADCALL '|equation| (QREFELT $ 176))
                             (SPADCALL |a| 2 (QREFELT $ 179)) |seg|)
                       (QREFELT $ 180)))
                (EXIT
                 (SPADCALL
                  (LIST (SPADCALL '|product| (QREFELT $ 176))
                        (SPADCALL |a| 1 (QREFELT $ 179)) |eq|)
                  (QREFELT $ 180)))))) 

(SDEFUN |COMMONOP;startUp| ((|b| |Boolean|) ($ |Void|))
        (SPROG
         ((#1=#:G185 NIL) (|op| NIL) (#2=#:G184 NIL) (#3=#:G183 NIL)
          (#4=#:G182 NIL) (#5=#:G181 NIL) (#6=#:G180 NIL) (#7=#:G179 NIL)
          (#8=#:G178 NIL) (#9=#:G177 NIL) (#10=#:G176 NIL) (#11=#:G175 NIL)
          (#12=#:G174 NIL) (#13=#:G173 NIL))
         (SEQ (SPADCALL (QREFELT $ 9) |b| (QREFELT $ 181))
              (SPADCALL (QREFELT $ 45) (ELT $ 165) (QREFELT $ 183))
              (SPADCALL (QREFELT $ 44) (ELT $ 184) (QREFELT $ 186))
              (SPADCALL (QREFELT $ 16) (CONS (|function| |COMMONOP;dpi|) $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 18) (CONS (|function| |COMMONOP;dexp|) $)
                        (QREFELT $ 183))
              (SPADCALL (QREFELT $ 61) (CONS (|function| |COMMONOP;dgamma|) $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 101)
                        (CONS (|function| |COMMONOP;dEllipticE2|) $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 124) (CONS (|function| |COMMONOP;dfact|) $)
                        (QREFELT $ 183))
              (SPADCALL (QREFELT $ 47) (CONS (|function| |COMMONOP;dquote|) $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 125) (CONS #'|COMMONOP;startUp!0| $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 126) (CONS #'|COMMONOP;startUp!1| $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 127) (CONS #'|COMMONOP;startUp!2| $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 128) (CONS #'|COMMONOP;startUp!3| $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 130) (CONS #'|COMMONOP;startUp!4| $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 121) (CONS #'|COMMONOP;startUp!5| $)
                        (QREFELT $ 186))
              (SPADCALL (QREFELT $ 45) (CONS #'|COMMONOP;startUp!6| $)
                        (QREFELT $ 203))
              (SPADCALL (QREFELT $ 127) (CONS #'|COMMONOP;startUp!7| $)
                        (QREFELT $ 203))
              (SPADCALL (QREFELT $ 15) (CONS #'|COMMONOP;startUp!8| $)
                        (QREFELT $ 203))
              (SPADCALL (QREFELT $ 129)
                        (CONS (|function| |COMMONOP;inputdefsum|) $)
                        (QREFELT $ 203))
              (SPADCALL (QREFELT $ 131)
                        (CONS (|function| |COMMONOP;inputdefprod|) $)
                        (QREFELT $ 203))
              (SEQ (LETT |op| NIL) (LETT #13# (QREFELT $ 143)) G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |op| (CAR #13#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|%alg| (QREFELT $ 210))))
                   (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #12# (QREFELT $ 144)) G190
                   (COND
                    ((OR (ATOM #12#) (PROGN (LETT |op| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|rtrig| (QREFELT $ 210))))
                   (LETT #12# (CDR #12#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #11# (QREFELT $ 145)) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |op| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|htrig| (QREFELT $ 210))))
                   (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #10# (QREFELT $ 148)) G190
                   (COND
                    ((OR (ATOM #10#) (PROGN (LETT |op| (CAR #10#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|trig| (QREFELT $ 210))))
                   (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #9# (QREFELT $ 149)) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |op| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|elem| (QREFELT $ 210))))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #8# (QREFELT $ 150)) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |op| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|prim| (QREFELT $ 210))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #7# (QREFELT $ 151)) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |op| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|comb| (QREFELT $ 210))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #6# (QREFELT $ 152)) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |op| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|special| (QREFELT $ 210))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #5# (QREFELT $ 153)) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |op| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|any| (QREFELT $ 210))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #4# (QREFELT $ 155)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |op| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|even| (QREFELT $ 210))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #3# (QREFELT $ 156)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |op| '|odd| (QREFELT $ 210))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #2# (QREFELT $ 157)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |op| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 1 $)))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |op| NIL) (LETT #1# (QREFELT $ 158)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |op| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 2 $)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (SPADCALL (QREFELT $ 45) '|linear| (QREFELT $ 210))
              (EXIT (SPADCALL (QREFELT $ 212)))))) 

(SDEFUN |COMMONOP;startUp!8| ((|z1| NIL) ($ NIL))
        (SPADCALL
         (LIST (SPADCALL '^ (QREFELT $ 199)) (SPADCALL |z1| (QREFELT $ 204))
               (SPADCALL (|spadConstant| $ 207) (SPADCALL |z1| (QREFELT $ 208))
                         (QREFELT $ 209)))
         (QREFELT $ 180))) 

(SDEFUN |COMMONOP;startUp!7| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL '^ (QREFELT $ 199)) |z1| (QREFELT $ 201))
                  (QREFELT $ 180))) 

(SDEFUN |COMMONOP;startUp!6| ((|z1| NIL) ($ NIL))
        (SPADCALL
         (SPADCALL (SPADCALL '|(| (QREFELT $ 199))
                   (SPADCALL |z1| (SPADCALL '|)| (QREFELT $ 199))
                             (QREFELT $ 200))
                   (QREFELT $ 201))
         (QREFELT $ 180))) 

(SDEFUN |COMMONOP;startUp!5| ((|z1| NIL) ($ NIL))
        (SPADCALL
         (SPADCALL (SPADCALL |z1| (QREFELT $ 189))
                   (SPADCALL (SPADCALL '|d| (QREFELT $ 164))
                             (SPADCALL |z1| (QREFELT $ 190)) (QREFELT $ 195))
                   (QREFELT $ 196))
         (SPADCALL (QREFELT $ 197)) (SPADCALL |z1| (QREFELT $ 192))
         (QREFELT $ 198))) 

(SDEFUN |COMMONOP;startUp!4| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 189))
                  (SPADCALL |z1| (QREFELT $ 190))
                  (SPADCALL |z1| (QREFELT $ 192)) (QREFELT $ 194))) 

(SDEFUN |COMMONOP;startUp!3| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 189))
                  (SPADCALL |z1| (QREFELT $ 190))
                  (SPADCALL |z1| (QREFELT $ 192)) (QREFELT $ 193))) 

(SDEFUN |COMMONOP;startUp!2| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 189))
                  (SPADCALL |z1| (QREFELT $ 190)) (QREFELT $ 174))) 

(SDEFUN |COMMONOP;startUp!1| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 189))
                  (SPADCALL |z1| (QREFELT $ 190)) (QREFELT $ 191))) 

(SDEFUN |COMMONOP;startUp!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL 'A (QREFELT $ 164)) |z1| (QREFELT $ 187))) 

(DECLAIM (NOTINLINE |CommonOperators;|)) 

(DEFUN |CommonOperators| ()
  (SPROG NIL
         (PROG (#1=#:G187)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CommonOperators|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CommonOperators|
                             (LIST (CONS NIL (CONS 1 (|CommonOperators;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CommonOperators|)))))))))) 

(DEFUN |CommonOperators;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CommonOperators|))
          (LETT $ (GETREFV 213))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CommonOperators| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 'T (QREFELT $ 8)))
          (QSETREFV $ 14 (SPADCALL '|rootOf| 2 (QREFELT $ 13)))
          (QSETREFV $ 15 (SPADCALL '|nthRoot| 2 (QREFELT $ 13)))
          (QSETREFV $ 16 (SPADCALL '|pi| 0 (QREFELT $ 13)))
          (QSETREFV $ 17 (SPADCALL '|log| 1 (QREFELT $ 13)))
          (QSETREFV $ 18 (SPADCALL '|exp| 1 (QREFELT $ 13)))
          (QSETREFV $ 19 (SPADCALL '|abs| 1 (QREFELT $ 13)))
          (QSETREFV $ 20 (SPADCALL '|sin| 1 (QREFELT $ 13)))
          (QSETREFV $ 21 (SPADCALL '|cos| 1 (QREFELT $ 13)))
          (QSETREFV $ 22 (SPADCALL '|tan| 1 (QREFELT $ 13)))
          (QSETREFV $ 23 (SPADCALL '|cot| 1 (QREFELT $ 13)))
          (QSETREFV $ 24 (SPADCALL '|sec| 1 (QREFELT $ 13)))
          (QSETREFV $ 25 (SPADCALL '|csc| 1 (QREFELT $ 13)))
          (QSETREFV $ 26 (SPADCALL '|asin| 1 (QREFELT $ 13)))
          (QSETREFV $ 27 (SPADCALL '|acos| 1 (QREFELT $ 13)))
          (QSETREFV $ 28 (SPADCALL '|atan| 1 (QREFELT $ 13)))
          (QSETREFV $ 29 (SPADCALL '|acot| 1 (QREFELT $ 13)))
          (QSETREFV $ 30 (SPADCALL '|asec| 1 (QREFELT $ 13)))
          (QSETREFV $ 31 (SPADCALL '|acsc| 1 (QREFELT $ 13)))
          (QSETREFV $ 32 (SPADCALL '|sinh| 1 (QREFELT $ 13)))
          (QSETREFV $ 33 (SPADCALL '|cosh| 1 (QREFELT $ 13)))
          (QSETREFV $ 34 (SPADCALL '|tanh| 1 (QREFELT $ 13)))
          (QSETREFV $ 35 (SPADCALL '|coth| 1 (QREFELT $ 13)))
          (QSETREFV $ 36 (SPADCALL '|sech| 1 (QREFELT $ 13)))
          (QSETREFV $ 37 (SPADCALL '|csch| 1 (QREFELT $ 13)))
          (QSETREFV $ 38 (SPADCALL '|asinh| 1 (QREFELT $ 13)))
          (QSETREFV $ 39 (SPADCALL '|acosh| 1 (QREFELT $ 13)))
          (QSETREFV $ 40 (SPADCALL '|atanh| 1 (QREFELT $ 13)))
          (QSETREFV $ 41 (SPADCALL '|acoth| 1 (QREFELT $ 13)))
          (QSETREFV $ 42 (SPADCALL '|asech| 1 (QREFELT $ 13)))
          (QSETREFV $ 43 (SPADCALL '|acsch| 1 (QREFELT $ 13)))
          (QSETREFV $ 44 (SPADCALL '|%box| 1 (QREFELT $ 13)))
          (QSETREFV $ 45 (SPADCALL '|%paren| 1 (QREFELT $ 13)))
          (QSETREFV $ 47 (SPADCALL '|%quote| (QREFELT $ 46)))
          (QSETREFV $ 48 (SPADCALL '|%diff| 3 (QREFELT $ 13)))
          (QSETREFV $ 49 (SPADCALL '|Si| 1 (QREFELT $ 13)))
          (QSETREFV $ 50 (SPADCALL '|Ci| 1 (QREFELT $ 13)))
          (QSETREFV $ 51 (SPADCALL '|Shi| 1 (QREFELT $ 13)))
          (QSETREFV $ 52 (SPADCALL '|Chi| 1 (QREFELT $ 13)))
          (QSETREFV $ 53 (SPADCALL '|Ei| 1 (QREFELT $ 13)))
          (QSETREFV $ 54 (SPADCALL '|li| 1 (QREFELT $ 13)))
          (QSETREFV $ 55 (SPADCALL '|erf| 1 (QREFELT $ 13)))
          (QSETREFV $ 56 (SPADCALL '|erfi| 1 (QREFELT $ 13)))
          (QSETREFV $ 57 (SPADCALL '|dilog| 1 (QREFELT $ 13)))
          (QSETREFV $ 58 (SPADCALL '|fresnelS| 1 (QREFELT $ 13)))
          (QSETREFV $ 59 (SPADCALL '|fresnelC| 1 (QREFELT $ 13)))
          (QSETREFV $ 60 (SPADCALL '|Gamma| 1 (QREFELT $ 13)))
          (QSETREFV $ 61 (SPADCALL '|Gamma2| 2 (QREFELT $ 13)))
          (QSETREFV $ 62 (SPADCALL '|Beta| 2 (QREFELT $ 13)))
          (QSETREFV $ 63 (SPADCALL '|digamma| 1 (QREFELT $ 13)))
          (QSETREFV $ 64 (SPADCALL '|polygamma| 2 (QREFELT $ 13)))
          (QSETREFV $ 65 (SPADCALL '|besselJ| 2 (QREFELT $ 13)))
          (QSETREFV $ 66 (SPADCALL '|besselY| 2 (QREFELT $ 13)))
          (QSETREFV $ 67 (SPADCALL '|besselI| 2 (QREFELT $ 13)))
          (QSETREFV $ 68 (SPADCALL '|besselK| 2 (QREFELT $ 13)))
          (QSETREFV $ 69 (SPADCALL '|airyAi| 1 (QREFELT $ 13)))
          (QSETREFV $ 70 (SPADCALL '|airyAiPrime| 1 (QREFELT $ 13)))
          (QSETREFV $ 71 (SPADCALL '|airyBi| 1 (QREFELT $ 13)))
          (QSETREFV $ 72 (SPADCALL '|airyBiPrime| 1 (QREFELT $ 13)))
          (QSETREFV $ 73 (SPADCALL '|lambertW| 1 (QREFELT $ 13)))
          (QSETREFV $ 74 (SPADCALL '|polylog| 2 (QREFELT $ 13)))
          (QSETREFV $ 75 (SPADCALL '|weierstrassP| 3 (QREFELT $ 13)))
          (QSETREFV $ 76 (SPADCALL '|weierstrassPPrime| 3 (QREFELT $ 13)))
          (QSETREFV $ 77 (SPADCALL '|weierstrassSigma| 3 (QREFELT $ 13)))
          (QSETREFV $ 78 (SPADCALL '|weierstrassZeta| 3 (QREFELT $ 13)))
          (QSETREFV $ 79 (SPADCALL '|hypergeometricF| (QREFELT $ 46)))
          (QSETREFV $ 80 (SPADCALL '|meijerG| (QREFELT $ 46)))
          (QSETREFV $ 81 (SPADCALL '|whittakerM| 3 (QREFELT $ 13)))
          (QSETREFV $ 82 (SPADCALL '|whittakerW| 3 (QREFELT $ 13)))
          (QSETREFV $ 83 (SPADCALL '|angerJ| 2 (QREFELT $ 13)))
          (QSETREFV $ 84 (SPADCALL '|weberE| 2 (QREFELT $ 13)))
          (QSETREFV $ 85 (SPADCALL '|struveH| 2 (QREFELT $ 13)))
          (QSETREFV $ 86 (SPADCALL '|struveL| 2 (QREFELT $ 13)))
          (QSETREFV $ 87 (SPADCALL '|hankelH1| 2 (QREFELT $ 13)))
          (QSETREFV $ 88 (SPADCALL '|hankelH2| 2 (QREFELT $ 13)))
          (QSETREFV $ 89 (SPADCALL '|lommelS1| 3 (QREFELT $ 13)))
          (QSETREFV $ 90 (SPADCALL '|lommelS2| 3 (QREFELT $ 13)))
          (QSETREFV $ 91 (SPADCALL '|kummerM| 3 (QREFELT $ 13)))
          (QSETREFV $ 92 (SPADCALL '|kummerU| 3 (QREFELT $ 13)))
          (QSETREFV $ 93 (SPADCALL '|legendreP| 3 (QREFELT $ 13)))
          (QSETREFV $ 94 (SPADCALL '|legendreQ| 3 (QREFELT $ 13)))
          (QSETREFV $ 95 (SPADCALL '|kelvinBei| 2 (QREFELT $ 13)))
          (QSETREFV $ 96 (SPADCALL '|kelvinBer| 2 (QREFELT $ 13)))
          (QSETREFV $ 97 (SPADCALL '|kelvinKei| 2 (QREFELT $ 13)))
          (QSETREFV $ 98 (SPADCALL '|kelvinKer| 2 (QREFELT $ 13)))
          (QSETREFV $ 99 (SPADCALL '|ellipticK| 1 (QREFELT $ 13)))
          (QSETREFV $ 100 (SPADCALL '|ellipticE| 1 (QREFELT $ 13)))
          (QSETREFV $ 101 (SPADCALL '|ellipticE2| 2 (QREFELT $ 13)))
          (QSETREFV $ 102 (SPADCALL '|ellipticF| 2 (QREFELT $ 13)))
          (QSETREFV $ 103 (SPADCALL '|ellipticPi| 3 (QREFELT $ 13)))
          (QSETREFV $ 104 (SPADCALL '|jacobiSn| 2 (QREFELT $ 13)))
          (QSETREFV $ 105 (SPADCALL '|jacobiCn| 2 (QREFELT $ 13)))
          (QSETREFV $ 106 (SPADCALL '|jacobiDn| 2 (QREFELT $ 13)))
          (QSETREFV $ 107 (SPADCALL '|jacobiZeta| 2 (QREFELT $ 13)))
          (QSETREFV $ 108 (SPADCALL '|jacobiTheta| 2 (QREFELT $ 13)))
          (QSETREFV $ 109 (SPADCALL '|weierstrassPInverse| 3 (QREFELT $ 13)))
          (QSETREFV $ 110 (SPADCALL '|lerchPhi| 3 (QREFELT $ 13)))
          (QSETREFV $ 111 (SPADCALL '|riemannZeta| 1 (QREFELT $ 13)))
          (QSETREFV $ 112 (SPADCALL '|charlierC| 3 (QREFELT $ 13)))
          (QSETREFV $ 113 (SPADCALL '|hermiteH| 2 (QREFELT $ 13)))
          (QSETREFV $ 114 (SPADCALL '|jacobiP| 4 (QREFELT $ 13)))
          (QSETREFV $ 115 (SPADCALL '|laguerreL| 3 (QREFELT $ 13)))
          (QSETREFV $ 116 (SPADCALL '|meixnerM| 4 (QREFELT $ 13)))
          (QSETREFV $ 117 (SPADCALL '|%logGamma| 1 (QREFELT $ 13)))
          (QSETREFV $ 118 (SPADCALL '|%eis| 1 (QREFELT $ 13)))
          (QSETREFV $ 119 (SPADCALL '|%erfs| 1 (QREFELT $ 13)))
          (QSETREFV $ 120 (SPADCALL '|%erfis| 1 (QREFELT $ 13)))
          (QSETREFV $ 121 (SPADCALL '|integral| 3 (QREFELT $ 13)))
          (QSETREFV $ 122 (SPADCALL '|%iint| (QREFELT $ 46)))
          (QSETREFV $ 123 (SPADCALL '|%defint| 5 (QREFELT $ 13)))
          (QSETREFV $ 124 (SPADCALL '|factorial| 1 (QREFELT $ 13)))
          (QSETREFV $ 125 (SPADCALL '|permutation| 2 (QREFELT $ 13)))
          (QSETREFV $ 126 (SPADCALL '|binomial| 2 (QREFELT $ 13)))
          (QSETREFV $ 127 (SPADCALL '|%power| 2 (QREFELT $ 13)))
          (QSETREFV $ 128 (SPADCALL '|summation| 3 (QREFELT $ 13)))
          (QSETREFV $ 129 (SPADCALL '|%defsum| 5 (QREFELT $ 13)))
          (QSETREFV $ 130 (SPADCALL '|product| 3 (QREFELT $ 13)))
          (QSETREFV $ 131 (SPADCALL '|%defprod| 5 (QREFELT $ 13)))
          (QSETREFV $ 132 (SPADCALL '|%root_sum| 3 (QREFELT $ 13)))
          (QSETREFV $ 133 (SPADCALL '|floor| 1 (QREFELT $ 13)))
          (QSETREFV $ 134 (SPADCALL '|ceil| 1 (QREFELT $ 13)))
          (QSETREFV $ 135 (SPADCALL '|real| 1 (QREFELT $ 13)))
          (QSETREFV $ 136 (SPADCALL '|imag| 1 (QREFELT $ 13)))
          (QSETREFV $ 137 (SPADCALL '|conjugate| 1 (QREFELT $ 13)))
          (QSETREFV $ 138 (SPADCALL '|arg| 1 (QREFELT $ 13)))
          (QSETREFV $ 139 (SPADCALL '|sign| 1 (QREFELT $ 13)))
          (QSETREFV $ 140 (SPADCALL '|diracDelta| 1 (QREFELT $ 13)))
          (QSETREFV $ 141 (SPADCALL '|max| (QREFELT $ 46)))
          (QSETREFV $ 142 (SPADCALL '|min| (QREFELT $ 46)))
          (QSETREFV $ 143 (LIST (QREFELT $ 15) (QREFELT $ 14)))
          (QSETREFV $ 144
                    (LIST (QREFELT $ 20) (QREFELT $ 21) (QREFELT $ 22)
                          (QREFELT $ 23) (QREFELT $ 24) (QREFELT $ 25)
                          (QREFELT $ 26) (QREFELT $ 27) (QREFELT $ 28)
                          (QREFELT $ 29) (QREFELT $ 30) (QREFELT $ 31)))
          (QSETREFV $ 145
                    (LIST (QREFELT $ 32) (QREFELT $ 33) (QREFELT $ 34)
                          (QREFELT $ 35) (QREFELT $ 36) (QREFELT $ 37)
                          (QREFELT $ 38) (QREFELT $ 39) (QREFELT $ 40)
                          (QREFELT $ 41) (QREFELT $ 42) (QREFELT $ 43)))
          (QSETREFV $ 148
                    (SPADCALL (QREFELT $ 144) (QREFELT $ 145) (QREFELT $ 147)))
          (QSETREFV $ 149
                    (SPADCALL (QREFELT $ 148)
                              (LIST (QREFELT $ 16) (QREFELT $ 17)
                                    (QREFELT $ 18))
                              (QREFELT $ 147)))
          (QSETREFV $ 150
                    (LIST (QREFELT $ 53) (QREFELT $ 54) (QREFELT $ 49)
                          (QREFELT $ 50) (QREFELT $ 51) (QREFELT $ 52)
                          (QREFELT $ 55) (QREFELT $ 56) (QREFELT $ 57)
                          (QREFELT $ 121) (QREFELT $ 123) (QREFELT $ 58)
                          (QREFELT $ 59) (QREFELT $ 122)))
          (QSETREFV $ 151
                    (LIST (QREFELT $ 124) (QREFELT $ 125) (QREFELT $ 126)
                          (QREFELT $ 127) (QREFELT $ 128) (QREFELT $ 129)
                          (QREFELT $ 130) (QREFELT $ 131)))
          (QSETREFV $ 152
                    (LIST (QREFELT $ 60) (QREFELT $ 61) (QREFELT $ 62)
                          (QREFELT $ 63) (QREFELT $ 64) (QREFELT $ 19)
                          (QREFELT $ 133) (QREFELT $ 134) (QREFELT $ 135)
                          (QREFELT $ 136) (QREFELT $ 139) (QREFELT $ 141)
                          (QREFELT $ 142) (QREFELT $ 140) (QREFELT $ 138)
                          (QREFELT $ 137) (QREFELT $ 117) (QREFELT $ 118)
                          (QREFELT $ 119) (QREFELT $ 120) (QREFELT $ 65)
                          (QREFELT $ 66) (QREFELT $ 67) (QREFELT $ 68)
                          (QREFELT $ 69) (QREFELT $ 71) (QREFELT $ 70)
                          (QREFELT $ 72) (QREFELT $ 73) (QREFELT $ 74)
                          (QREFELT $ 75) (QREFELT $ 76) (QREFELT $ 78)
                          (QREFELT $ 77) (QREFELT $ 79) (QREFELT $ 80)
                          (QREFELT $ 81) (QREFELT $ 82) (QREFELT $ 83)
                          (QREFELT $ 84) (QREFELT $ 85) (QREFELT $ 86)
                          (QREFELT $ 87) (QREFELT $ 88) (QREFELT $ 89)
                          (QREFELT $ 90) (QREFELT $ 91) (QREFELT $ 92)
                          (QREFELT $ 93) (QREFELT $ 94) (QREFELT $ 95)
                          (QREFELT $ 96) (QREFELT $ 97) (QREFELT $ 98)
                          (QREFELT $ 99) (QREFELT $ 100) (QREFELT $ 101)
                          (QREFELT $ 102) (QREFELT $ 103) (QREFELT $ 104)
                          (QREFELT $ 105) (QREFELT $ 106) (QREFELT $ 107)
                          (QREFELT $ 108) (QREFELT $ 110) (QREFELT $ 111)
                          (QREFELT $ 112) (QREFELT $ 113) (QREFELT $ 114)
                          (QREFELT $ 115) (QREFELT $ 116)))
          (QSETREFV $ 153
                    (LIST (QREFELT $ 45) (QREFELT $ 48) (QREFELT $ 44)
                          (QREFELT $ 47)))
          (QSETREFV $ 154
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (QREFELT $ 143) (QREFELT $ 149)
                                  (QREFELT $ 147))
                        (QREFELT $ 150) (QREFELT $ 147))
                       (QREFELT $ 151) (QREFELT $ 147))
                      (QREFELT $ 152) (QREFELT $ 147))
                     (QREFELT $ 153) (QREFELT $ 147)))
          (QSETREFV $ 155
                    (LIST (QREFELT $ 21) (QREFELT $ 24) (QREFELT $ 33)
                          (QREFELT $ 36) (QREFELT $ 19) (QREFELT $ 140)))
          (QSETREFV $ 156
                    (LIST (QREFELT $ 20) (QREFELT $ 25) (QREFELT $ 22)
                          (QREFELT $ 23) (QREFELT $ 26) (QREFELT $ 31)
                          (QREFELT $ 28) (QREFELT $ 32) (QREFELT $ 37)
                          (QREFELT $ 34) (QREFELT $ 35) (QREFELT $ 38)
                          (QREFELT $ 43) (QREFELT $ 40) (QREFELT $ 41)
                          (QREFELT $ 49) (QREFELT $ 51) (QREFELT $ 55)
                          (QREFELT $ 56) (QREFELT $ 58) (QREFELT $ 59)
                          (QREFELT $ 139) (QREFELT $ 135) (QREFELT $ 136)))
          (QSETREFV $ 157
                    (LIST (QREFELT $ 48) (QREFELT $ 14) (QREFELT $ 121)
                          (QREFELT $ 132) (QREFELT $ 128) (QREFELT $ 130)))
          (QSETREFV $ 158
                    (LIST (QREFELT $ 123) (QREFELT $ 129) (QREFELT $ 131)))
          $))) 

(MAKEPROP '|CommonOperators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|Reference| 6) (0 . |ref|)
              '|brandNew?| (|Symbol|) (|NonNegativeInteger|) (|BasicOperator|)
              (5 . |operator|) '|opalg| '|oproot| '|oppi| '|oplog| '|opexp|
              '|opabs| '|opsin| '|opcos| '|optan| '|opcot| '|opsec| '|opcsc|
              '|opasin| '|opacos| '|opatan| '|opacot| '|opasec| '|opacsc|
              '|opsinh| '|opcosh| '|optanh| '|opcoth| '|opsech| '|opcsch|
              '|opasinh| '|opacosh| '|opatanh| '|opacoth| '|opasech| '|opacsch|
              '|opbox| '|oppren| (11 . |operator|) '|opquote| '|opdiff| '|opsi|
              '|opci| '|opshi| '|opchi| '|opei| '|opli| '|operf| '|operfi|
              '|opli2| '|opfis| '|opfic| '|opGamma| '|opGamma2| '|opBeta|
              '|opdigamma| '|oppolygamma| '|opBesselJ| '|opBesselY|
              '|opBesselI| '|opBesselK| '|opAiryAi| '|opAiryAiPrime|
              '|opAiryBi| '|opAiryBiPrime| '|opLambertW| '|opPolylog|
              '|opWeierstrassP| '|opWeierstrassPPrime| '|opWeierstrassSigma|
              '|opWeierstrassZeta| '|opHypergeometricF| '|opMeijerG|
              '|opWhittakerM| '|opWhittakerW| '|opAngerJ| '|opWeberE|
              '|opStruveH| '|opStruveL| '|opHankelH1| '|opHankelH2|
              '|opLommelS1| '|opLommelS2| '|opKummerM| '|opKummerU|
              '|opLegendreP| '|opLegendreQ| '|opKelvinBei| '|opKelvinBer|
              '|opKelvinKei| '|opKelvinKer| '|opEllipticK| '|opEllipticE|
              '|opEllipticE2| '|opEllipticF| '|opEllipticPi| '|opJacobiSn|
              '|opJacobiCn| '|opJacobiDn| '|opJacobiZeta| '|opJacobiTheta|
              '|opWeierstrassPInverse| '|opLerchPhi| '|opRiemannZeta|
              '|opCharlierC| '|opHermiteH| '|opJacobiP| '|opLaguerreL|
              '|opMeixnerM| '|op_log_gamma| '|op_eis| '|op_erfs| '|op_erfis|
              '|opint| '|opiint| '|opdint| '|opfact| '|opperm| '|opbinom|
              '|oppow| '|opsum| '|opdsum| '|opprod| '|opdprod| '|oprootsum|
              '|opfloor| '|opceil| '|opreal| '|opimag| '|opconjugate| '|oparg|
              '|opsign| '|opDiracDelta| '|opmax| '|opmin| '|algop| '|rtrigop|
              '|htrigop| (|List| 12) (16 . |concat|) '|trigop| '|elemop|
              '|primop| '|combop| '|specop| '|anyop| '|allop| '|evenop|
              '|oddop| '|dummyvarop1| '|dummyvarop2| (22 . |deref|)
              (27 . |is?|) (33 . |copy|) |COMMONOP;operator;SBo;1|
              (|OutputForm|) (38 . |coerce|) (43 . |paren|) (48 . |postfix|)
              (54 . |quote|) (|List| $) (59 . |prefix|) (|None|)
              (65 . |setProperty|) (72 . |coerce|) (77 . =) (83 . ^)
              (|InputForm|) (89 . |convert|) (|Integer|) (|List| 175)
              (94 . |elt|) (100 . |convert|) (105 . |setelt!|)
              (|Mapping| 163 163) (111 . |display|) (117 . |commaSeparate|)
              (|Mapping| 163 188) (122 . |display|) (128 . |supersub|)
              (|List| 163) (134 . |first|) (139 . |second|) (144 . |binomial|)
              (150 . |third|) (155 . |sum|) (162 . |prod|) (169 . |hconcat|)
              (175 . *) (181 . |empty|) (185 . |int|) (192 . |convert|)
              (197 . |concat|) (203 . |concat|) (|Mapping| 175 178)
              (209 . |input|) (215 . |first|) (220 . |One|) (224 . |One|)
              (228 . |One|) (232 . |second|) (237 . /) (243 . |assert|)
              (|Void|) (249 . |void|))
           '#(|operator| 253) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|operator| ((|BasicOperator|) (|Symbol|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 212
                                            '(1 7 0 6 8 2 12 0 10 11 13 1 12 0
                                              10 46 2 146 0 0 0 147 1 7 6 0 159
                                              2 12 6 0 10 160 1 12 0 0 161 1 10
                                              163 0 164 1 163 0 0 165 2 163 0 0
                                              0 166 1 163 0 0 167 2 163 0 0 168
                                              169 3 12 0 0 10 170 171 1 11 163
                                              0 172 2 163 6 0 0 173 2 163 0 0 0
                                              174 1 175 0 10 176 2 178 175 0
                                              177 179 1 175 0 168 180 2 7 6 0 6
                                              181 2 12 0 0 182 183 1 163 0 168
                                              184 2 12 0 0 185 186 2 163 0 0
                                              168 187 1 188 163 0 189 1 188 163
                                              0 190 2 163 0 0 0 191 1 188 163 0
                                              192 3 163 0 0 0 0 193 3 163 0 0 0
                                              0 194 2 163 0 0 0 195 2 163 0 0 0
                                              196 0 163 0 197 3 163 0 0 0 0 198
                                              1 10 175 0 199 2 178 0 0 175 200
                                              2 178 0 175 0 201 2 12 0 0 202
                                              203 1 178 175 0 204 0 11 0 205 0
                                              177 0 206 0 175 0 207 1 178 175 0
                                              208 2 175 0 0 0 209 2 12 0 0 10
                                              210 0 211 0 212 1 0 12 10
                                              162)))))
           '|lookupComplete|)) 

(MAKEPROP '|CommonOperators| 'NILADIC T) 
