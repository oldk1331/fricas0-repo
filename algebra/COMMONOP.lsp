
(/VERSIONCHECK 2) 

(DEFUN |COMMONOP;operator;SBo;1| (|s| $)
  (PROG (#1=#:G131 #2=#:G133 #3=#:G134 |op|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL (QREFELT $ 9) (QREFELT $ 139))
          (|COMMONOP;startUp| 'NIL $)))
        (SEQ
         (EXIT
          (SEQ (LETT |op| NIL . #4=(|COMMONOP;operator;SBo;1|))
               (LETT #3# (QREFELT $ 134) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |op| |s| (QREFELT $ 140))
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2# (SPADCALL |op| (QREFELT $ 141)) . #4#)
                           (GO #2#))
                          . #4#)
                    (GO #1#))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (SPADCALL |s| (QREFELT $ 44)))))
      #2# (EXIT #2#))))) 

(DEFUN |COMMONOP;dpi| (|l| $) (SPADCALL '|%pi| (QREFELT $ 144))) 

(DEFUN |COMMONOP;dfact| (|x| $)
  (SPADCALL (SPADCALL '! (QREFELT $ 144))
            (COND ((ATOM |x|) |x|) ('T (SPADCALL |x| (QREFELT $ 145))))
            (QREFELT $ 146))) 

(DEFUN |COMMONOP;dquote| (|l| $)
  (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT $ 147)) (CDR |l|)
            (QREFELT $ 149))) 

(DEFUN |COMMONOP;dgamma| (|l| $)
  (SPADCALL (SPADCALL '|Gamma| (QREFELT $ 144)) |l| (QREFELT $ 149))) 

(DEFUN |COMMONOP;dEllipticE2| (|l| $)
  (SPADCALL (SPADCALL '|ellipticE| (QREFELT $ 144)) |l| (QREFELT $ 149))) 

(DEFUN |COMMONOP;setDummyVar| (|op| |n| $)
  (SPADCALL |op| '|%dummyVar| |n| (QREFELT $ 151))) 

(DEFUN |COMMONOP;dexp| (|x| $)
  (PROG (|e|)
    (RETURN
     (SEQ (LETT |e| (SPADCALL '|%e| (QREFELT $ 144)) |COMMONOP;dexp|)
          (EXIT
           (COND
            ((SPADCALL |x| (SPADCALL 1 (QREFELT $ 152)) (QREFELT $ 153)) |e|)
            ('T (SPADCALL |e| |x| (QREFELT $ 154))))))))) 

(DEFUN |COMMONOP;startUp| (|b| $)
  (PROG (#1=#:G200 |op| #2=#:G199 #3=#:G198 #4=#:G197 #5=#:G196 #6=#:G195
         #7=#:G194 #8=#:G193 #9=#:G192 #10=#:G191 #11=#:G190 #12=#:G189
         #13=#:G188)
    (RETURN
     (SEQ (SPADCALL (QREFELT $ 9) |b| (QREFELT $ 155))
          (SPADCALL (QREFELT $ 46) (ELT $ 145) (QREFELT $ 157))
          (SPADCALL (QREFELT $ 45) (ELT $ 158) (QREFELT $ 160))
          (SPADCALL (QREFELT $ 16) (CONS (|function| |COMMONOP;dpi|) $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 18) (CONS (|function| |COMMONOP;dexp|) $)
                    (QREFELT $ 157))
          (SPADCALL (QREFELT $ 60) (CONS (|function| |COMMONOP;dgamma|) $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 100)
                    (CONS (|function| |COMMONOP;dEllipticE2|) $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 114) (CONS (|function| |COMMONOP;dfact|) $)
                    (QREFELT $ 157))
          (SPADCALL (QREFELT $ 47) (CONS (|function| |COMMONOP;dquote|) $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 115) (CONS #'|COMMONOP;startUp!0| $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 116) (CONS #'|COMMONOP;startUp!1| $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 117) (CONS #'|COMMONOP;startUp!2| $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 118) (CONS #'|COMMONOP;startUp!3| $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 120) (CONS #'|COMMONOP;startUp!4| $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 111) (CONS #'|COMMONOP;startUp!5| $)
                    (QREFELT $ 160))
          (SPADCALL (QREFELT $ 46) (CONS #'|COMMONOP;startUp!6| $)
                    (QREFELT $ 180))
          (SPADCALL (QREFELT $ 117) (CONS #'|COMMONOP;startUp!7| $)
                    (QREFELT $ 180))
          (SPADCALL (QREFELT $ 15) (CONS #'|COMMONOP;startUp!8| $)
                    (QREFELT $ 180))
          (SEQ (LETT |op| NIL . #14=(|COMMONOP;startUp|))
               (LETT #13# (QREFELT $ 123) . #14#) G190
               (COND
                ((OR (ATOM #13#) (PROGN (LETT |op| (CAR #13#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|%alg| (QREFELT $ 190))))
               (LETT #13# (CDR #13#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #12# (QREFELT $ 124) . #14#) G190
               (COND
                ((OR (ATOM #12#) (PROGN (LETT |op| (CAR #12#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|rtrig| (QREFELT $ 190))))
               (LETT #12# (CDR #12#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #11# (QREFELT $ 125) . #14#) G190
               (COND
                ((OR (ATOM #11#) (PROGN (LETT |op| (CAR #11#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|htrig| (QREFELT $ 190))))
               (LETT #11# (CDR #11#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #10# (QREFELT $ 128) . #14#) G190
               (COND
                ((OR (ATOM #10#) (PROGN (LETT |op| (CAR #10#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|trig| (QREFELT $ 190))))
               (LETT #10# (CDR #10#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #9# (QREFELT $ 129) . #14#) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |op| (CAR #9#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|elem| (QREFELT $ 190))))
               (LETT #9# (CDR #9#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #8# (QREFELT $ 130) . #14#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |op| (CAR #8#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|prim| (QREFELT $ 190))))
               (LETT #8# (CDR #8#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #7# (QREFELT $ 131) . #14#) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |op| (CAR #7#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|comb| (QREFELT $ 190))))
               (LETT #7# (CDR #7#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #6# (QREFELT $ 132) . #14#) G190
               (COND
                ((OR (ATOM #6#) (PROGN (LETT |op| (CAR #6#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|special| (QREFELT $ 190))))
               (LETT #6# (CDR #6#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #5# (QREFELT $ 133) . #14#) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |op| (CAR #5#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|any| (QREFELT $ 190))))
               (LETT #5# (CDR #5#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #4# (QREFELT $ 135) . #14#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |op| (CAR #4#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|even| (QREFELT $ 190))))
               (LETT #4# (CDR #4#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #3# (QREFELT $ 136) . #14#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |op| (CAR #3#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |op| '|odd| (QREFELT $ 190))))
               (LETT #3# (CDR #3#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #2# (QREFELT $ 137) . #14#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |op| (CAR #2#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 1 $)))
               (LETT #2# (CDR #2#) . #14#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |op| NIL . #14#) (LETT #1# (QREFELT $ 138) . #14#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |op| (CAR #1#) . #14#) NIL))
                 (GO G191)))
               (SEQ (EXIT (|COMMONOP;setDummyVar| |op| 2 $)))
               (LETT #1# (CDR #1#) . #14#) (GO G190) G191 (EXIT NIL))
          (SPADCALL (QREFELT $ 46) '|linear| (QREFELT $ 190))
          (EXIT (SPADCALL (QREFELT $ 192))))))) 

(DEFUN |COMMONOP;startUp!8| (|z1| $)
  (SPADCALL
   (LIST (SPADCALL '^ (QREFELT $ 174)) (SPADCALL |z1| (QREFELT $ 181))
         (SPADCALL (|spadConstant| $ 185) (SPADCALL |z1| (QREFELT $ 188))
                   (QREFELT $ 189)))
   (QREFELT $ 178))) 

(DEFUN |COMMONOP;startUp!7| (|z1| $)
  (SPADCALL (SPADCALL (SPADCALL '^ (QREFELT $ 174)) |z1| (QREFELT $ 177))
            (QREFELT $ 178))) 

(DEFUN |COMMONOP;startUp!6| (|z1| $)
  (SPADCALL
   (SPADCALL (SPADCALL '|(| (QREFELT $ 174))
             (SPADCALL |z1| (SPADCALL '|)| (QREFELT $ 174)) (QREFELT $ 176))
             (QREFELT $ 177))
   (QREFELT $ 178))) 

(DEFUN |COMMONOP;startUp!5| (|z1| $)
  (SPADCALL
   (SPADCALL (SPADCALL |z1| (QREFELT $ 163))
             (SPADCALL (SPADCALL '|d| (QREFELT $ 144))
                       (SPADCALL |z1| (QREFELT $ 164)) (QREFELT $ 169))
             (QREFELT $ 170))
   (SPADCALL (QREFELT $ 171)) (SPADCALL |z1| (QREFELT $ 166)) (QREFELT $ 172))) 

(DEFUN |COMMONOP;startUp!4| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 163)) (SPADCALL |z1| (QREFELT $ 164))
            (SPADCALL |z1| (QREFELT $ 166)) (QREFELT $ 168))) 

(DEFUN |COMMONOP;startUp!3| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 163)) (SPADCALL |z1| (QREFELT $ 164))
            (SPADCALL |z1| (QREFELT $ 166)) (QREFELT $ 167))) 

(DEFUN |COMMONOP;startUp!2| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 163)) (SPADCALL |z1| (QREFELT $ 164))
            (QREFELT $ 154))) 

(DEFUN |COMMONOP;startUp!1| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 163)) (SPADCALL |z1| (QREFELT $ 164))
            (QREFELT $ 165))) 

(DEFUN |COMMONOP;startUp!0| (|z1| $)
  (SPADCALL (SPADCALL 'A (QREFELT $ 144)) |z1| (QREFELT $ 161))) 

(DECLAIM (NOTINLINE |CommonOperators;|)) 

(DEFUN |CommonOperators| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G202)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|CommonOperators|)
                . #2=(|CommonOperators|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|CommonOperators|
                         (LIST (CONS NIL (CONS 1 (|CommonOperators;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|CommonOperators|))))))))))) 

(DEFUN |CommonOperators;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|CommonOperators|) . #1=(|CommonOperators|))
      (LETT $ (GETREFV 193) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
      (QSETREFV $ 45 (SPADCALL '|%box| (QREFELT $ 44)))
      (QSETREFV $ 46 (SPADCALL '|%paren| (QREFELT $ 44)))
      (QSETREFV $ 47 (SPADCALL '|%quote| (QREFELT $ 44)))
      (QSETREFV $ 48 (SPADCALL '|%diff| 3 (QREFELT $ 13)))
      (QSETREFV $ 49 (SPADCALL '|Si| 1 (QREFELT $ 13)))
      (QSETREFV $ 50 (SPADCALL '|Ci| 1 (QREFELT $ 13)))
      (QSETREFV $ 51 (SPADCALL '|Shi| 1 (QREFELT $ 13)))
      (QSETREFV $ 52 (SPADCALL '|Chi| 1 (QREFELT $ 13)))
      (QSETREFV $ 53 (SPADCALL '|Ei| 1 (QREFELT $ 13)))
      (QSETREFV $ 54 (SPADCALL '|li| 1 (QREFELT $ 13)))
      (QSETREFV $ 55 (SPADCALL '|erf| 1 (QREFELT $ 13)))
      (QSETREFV $ 56 (SPADCALL '|dilog| 1 (QREFELT $ 13)))
      (QSETREFV $ 57 (SPADCALL '|fresnelS| 1 (QREFELT $ 13)))
      (QSETREFV $ 58 (SPADCALL '|fresnelC| 1 (QREFELT $ 13)))
      (QSETREFV $ 59 (SPADCALL '|Gamma| 1 (QREFELT $ 13)))
      (QSETREFV $ 60 (SPADCALL '|Gamma2| 2 (QREFELT $ 13)))
      (QSETREFV $ 61 (SPADCALL '|Beta| 2 (QREFELT $ 13)))
      (QSETREFV $ 62 (SPADCALL '|digamma| 1 (QREFELT $ 13)))
      (QSETREFV $ 63 (SPADCALL '|polygamma| 2 (QREFELT $ 13)))
      (QSETREFV $ 64 (SPADCALL '|besselJ| 2 (QREFELT $ 13)))
      (QSETREFV $ 65 (SPADCALL '|besselY| 2 (QREFELT $ 13)))
      (QSETREFV $ 66 (SPADCALL '|besselI| 2 (QREFELT $ 13)))
      (QSETREFV $ 67 (SPADCALL '|besselK| 2 (QREFELT $ 13)))
      (QSETREFV $ 68 (SPADCALL '|airyAi| 1 (QREFELT $ 13)))
      (QSETREFV $ 69 (SPADCALL '|airyAiPrime| 1 (QREFELT $ 13)))
      (QSETREFV $ 70 (SPADCALL '|airyBi| 1 (QREFELT $ 13)))
      (QSETREFV $ 71 (SPADCALL '|airyBiPrime| 1 (QREFELT $ 13)))
      (QSETREFV $ 72 (SPADCALL '|lambertW| 1 (QREFELT $ 13)))
      (QSETREFV $ 73 (SPADCALL '|polylog| 2 (QREFELT $ 13)))
      (QSETREFV $ 74 (SPADCALL '|weierstrassP| 3 (QREFELT $ 13)))
      (QSETREFV $ 75 (SPADCALL '|weierstrassPPrime| 3 (QREFELT $ 13)))
      (QSETREFV $ 76 (SPADCALL '|weierstrassSigma| 3 (QREFELT $ 13)))
      (QSETREFV $ 77 (SPADCALL '|weierstrassZeta| 3 (QREFELT $ 13)))
      (QSETREFV $ 78 (SPADCALL '|hypergeometricF| (QREFELT $ 44)))
      (QSETREFV $ 79 (SPADCALL '|meijerG| (QREFELT $ 44)))
      (QSETREFV $ 80 (SPADCALL '|whittakerM| 3 (QREFELT $ 13)))
      (QSETREFV $ 81 (SPADCALL '|whittakerW| 3 (QREFELT $ 13)))
      (QSETREFV $ 82 (SPADCALL '|angerJ| 2 (QREFELT $ 13)))
      (QSETREFV $ 83 (SPADCALL '|weberE| 2 (QREFELT $ 13)))
      (QSETREFV $ 84 (SPADCALL '|struveH| 2 (QREFELT $ 13)))
      (QSETREFV $ 85 (SPADCALL '|struveL| 2 (QREFELT $ 13)))
      (QSETREFV $ 86 (SPADCALL '|hankelH1| 2 (QREFELT $ 13)))
      (QSETREFV $ 87 (SPADCALL '|hankelH2| 2 (QREFELT $ 13)))
      (QSETREFV $ 88 (SPADCALL '|lommelS1| 3 (QREFELT $ 13)))
      (QSETREFV $ 89 (SPADCALL '|lommelS2| 3 (QREFELT $ 13)))
      (QSETREFV $ 90 (SPADCALL '|kummerM| 3 (QREFELT $ 13)))
      (QSETREFV $ 91 (SPADCALL '|kummerU| 3 (QREFELT $ 13)))
      (QSETREFV $ 92 (SPADCALL '|legendreP| 3 (QREFELT $ 13)))
      (QSETREFV $ 93 (SPADCALL '|legendreQ| 3 (QREFELT $ 13)))
      (QSETREFV $ 94 (SPADCALL '|kelvinBei| 2 (QREFELT $ 13)))
      (QSETREFV $ 95 (SPADCALL '|kelvinBer| 2 (QREFELT $ 13)))
      (QSETREFV $ 96 (SPADCALL '|kelvinKei| 2 (QREFELT $ 13)))
      (QSETREFV $ 97 (SPADCALL '|kelvinKer| 2 (QREFELT $ 13)))
      (QSETREFV $ 98 (SPADCALL '|ellipticK| 1 (QREFELT $ 13)))
      (QSETREFV $ 99 (SPADCALL '|ellipticE| 1 (QREFELT $ 13)))
      (QSETREFV $ 100 (SPADCALL '|ellipticE2| 2 (QREFELT $ 13)))
      (QSETREFV $ 101 (SPADCALL '|ellipticF| 2 (QREFELT $ 13)))
      (QSETREFV $ 102 (SPADCALL '|ellipticPi| 3 (QREFELT $ 13)))
      (QSETREFV $ 103 (SPADCALL '|jacobiSn| 2 (QREFELT $ 13)))
      (QSETREFV $ 104 (SPADCALL '|jacobiCn| 2 (QREFELT $ 13)))
      (QSETREFV $ 105 (SPADCALL '|jacobiDn| 2 (QREFELT $ 13)))
      (QSETREFV $ 106 (SPADCALL '|jacobiZeta| 2 (QREFELT $ 13)))
      (QSETREFV $ 107 (SPADCALL '|jacobiTheta| 2 (QREFELT $ 13)))
      (QSETREFV $ 108 (SPADCALL '|weierstrassPInverse| 3 (QREFELT $ 13)))
      (QSETREFV $ 109 (SPADCALL '|lerchPhi| 3 (QREFELT $ 13)))
      (QSETREFV $ 110 (SPADCALL '|riemannZeta| 1 (QREFELT $ 13)))
      (QSETREFV $ 111 (SPADCALL '|integral| 3 (QREFELT $ 13)))
      (QSETREFV $ 112 (SPADCALL '|%iint| (QREFELT $ 44)))
      (QSETREFV $ 113 (SPADCALL '|%defint| 5 (QREFELT $ 13)))
      (QSETREFV $ 114 (SPADCALL '|factorial| 1 (QREFELT $ 13)))
      (QSETREFV $ 115 (SPADCALL '|permutation| 2 (QREFELT $ 13)))
      (QSETREFV $ 116 (SPADCALL '|binomial| 2 (QREFELT $ 13)))
      (QSETREFV $ 117 (SPADCALL '|%power| 2 (QREFELT $ 13)))
      (QSETREFV $ 118 (SPADCALL '|summation| 3 (QREFELT $ 13)))
      (QSETREFV $ 119 (SPADCALL '|%defsum| 5 (QREFELT $ 13)))
      (QSETREFV $ 120 (SPADCALL '|product| 3 (QREFELT $ 13)))
      (QSETREFV $ 121 (SPADCALL '|%defprod| 5 (QREFELT $ 13)))
      (QSETREFV $ 122 (SPADCALL '|%root_sum| 3 (QREFELT $ 13)))
      (QSETREFV $ 123 (LIST (QREFELT $ 15) (QREFELT $ 14)))
      (QSETREFV $ 124
                (LIST (QREFELT $ 20) (QREFELT $ 21) (QREFELT $ 22)
                      (QREFELT $ 23) (QREFELT $ 24) (QREFELT $ 25)
                      (QREFELT $ 26) (QREFELT $ 27) (QREFELT $ 28)
                      (QREFELT $ 29) (QREFELT $ 30) (QREFELT $ 31)))
      (QSETREFV $ 125
                (LIST (QREFELT $ 32) (QREFELT $ 33) (QREFELT $ 34)
                      (QREFELT $ 35) (QREFELT $ 36) (QREFELT $ 37)
                      (QREFELT $ 38) (QREFELT $ 39) (QREFELT $ 40)
                      (QREFELT $ 41) (QREFELT $ 42) (QREFELT $ 43)))
      (QSETREFV $ 128
                (SPADCALL (QREFELT $ 124) (QREFELT $ 125) (QREFELT $ 127)))
      (QSETREFV $ 129
                (SPADCALL (QREFELT $ 128)
                          (LIST (QREFELT $ 16) (QREFELT $ 17) (QREFELT $ 18))
                          (QREFELT $ 127)))
      (QSETREFV $ 130
                (LIST (QREFELT $ 53) (QREFELT $ 54) (QREFELT $ 49)
                      (QREFELT $ 50) (QREFELT $ 51) (QREFELT $ 52)
                      (QREFELT $ 55) (QREFELT $ 56) (QREFELT $ 111)
                      (QREFELT $ 113) (QREFELT $ 57) (QREFELT $ 58)
                      (QREFELT $ 112)))
      (QSETREFV $ 131
                (LIST (QREFELT $ 114) (QREFELT $ 115) (QREFELT $ 116)
                      (QREFELT $ 117) (QREFELT $ 118) (QREFELT $ 119)
                      (QREFELT $ 120) (QREFELT $ 121)))
      (QSETREFV $ 132
                (LIST (QREFELT $ 59) (QREFELT $ 60) (QREFELT $ 61)
                      (QREFELT $ 62) (QREFELT $ 63) (QREFELT $ 19)
                      (QREFELT $ 64) (QREFELT $ 65) (QREFELT $ 66)
                      (QREFELT $ 67) (QREFELT $ 68) (QREFELT $ 70)
                      (QREFELT $ 69) (QREFELT $ 71) (QREFELT $ 72)
                      (QREFELT $ 73) (QREFELT $ 74) (QREFELT $ 75)
                      (QREFELT $ 77) (QREFELT $ 76) (QREFELT $ 78)
                      (QREFELT $ 79) (QREFELT $ 80) (QREFELT $ 81)
                      (QREFELT $ 82) (QREFELT $ 83) (QREFELT $ 84)
                      (QREFELT $ 85) (QREFELT $ 86) (QREFELT $ 87)
                      (QREFELT $ 88) (QREFELT $ 89) (QREFELT $ 90)
                      (QREFELT $ 91) (QREFELT $ 92) (QREFELT $ 93)
                      (QREFELT $ 94) (QREFELT $ 95) (QREFELT $ 96)
                      (QREFELT $ 97) (QREFELT $ 98) (QREFELT $ 99)
                      (QREFELT $ 100) (QREFELT $ 101) (QREFELT $ 102)
                      (QREFELT $ 103) (QREFELT $ 104) (QREFELT $ 105)
                      (QREFELT $ 106) (QREFELT $ 107) (QREFELT $ 109)
                      (QREFELT $ 110)))
      (QSETREFV $ 133
                (LIST (QREFELT $ 46) (QREFELT $ 48) (QREFELT $ 45)
                      (QREFELT $ 47)))
      (QSETREFV $ 134
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (QREFELT $ 123) (QREFELT $ 129) (QREFELT $ 127))
                    (QREFELT $ 130) (QREFELT $ 127))
                   (QREFELT $ 131) (QREFELT $ 127))
                  (QREFELT $ 132) (QREFELT $ 127))
                 (QREFELT $ 133) (QREFELT $ 127)))
      (QSETREFV $ 135
                (LIST (QREFELT $ 21) (QREFELT $ 24) (QREFELT $ 33)
                      (QREFELT $ 36) (QREFELT $ 19)))
      (QSETREFV $ 136
                (LIST (QREFELT $ 20) (QREFELT $ 25) (QREFELT $ 22)
                      (QREFELT $ 23) (QREFELT $ 26) (QREFELT $ 31)
                      (QREFELT $ 28) (QREFELT $ 32) (QREFELT $ 37)
                      (QREFELT $ 34) (QREFELT $ 35) (QREFELT $ 38)
                      (QREFELT $ 43) (QREFELT $ 40) (QREFELT $ 41)
                      (QREFELT $ 49) (QREFELT $ 51) (QREFELT $ 55)))
      (QSETREFV $ 137
                (LIST (QREFELT $ 48) (QREFELT $ 14) (QREFELT $ 111)
                      (QREFELT $ 122) (QREFELT $ 118) (QREFELT $ 120)))
      (QSETREFV $ 138 (LIST (QREFELT $ 113) (QREFELT $ 119) (QREFELT $ 121)))
      $)))) 

(MAKEPROP '|CommonOperators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|Reference| 6) (0 . |ref|)
              '|brandNew?| (|Symbol|) (|NonNegativeInteger|) (|BasicOperator|)
              (5 . |operator|) '|opalg| '|oproot| '|oppi| '|oplog| '|opexp|
              '|opabs| '|opsin| '|opcos| '|optan| '|opcot| '|opsec| '|opcsc|
              '|opasin| '|opacos| '|opatan| '|opacot| '|opasec| '|opacsc|
              '|opsinh| '|opcosh| '|optanh| '|opcoth| '|opsech| '|opcsch|
              '|opasinh| '|opacosh| '|opatanh| '|opacoth| '|opasech| '|opacsch|
              (11 . |operator|) '|opbox| '|oppren| '|opquote| '|opdiff| '|opsi|
              '|opci| '|opshi| '|opchi| '|opei| '|opli| '|operf| '|opli2|
              '|opfis| '|opfic| '|opGamma| '|opGamma2| '|opBeta| '|opdigamma|
              '|oppolygamma| '|opBesselJ| '|opBesselY| '|opBesselI|
              '|opBesselK| '|opAiryAi| '|opAiryAiPrime| '|opAiryBi|
              '|opAiryBiPrime| '|opLambertW| '|opPolylog| '|opWeierstrassP|
              '|opWeierstrassPPrime| '|opWeierstrassSigma| '|opWeierstrassZeta|
              '|opHypergeometricF| '|opMeijerG| '|opWhittakerM| '|opWhittakerW|
              '|opAngerJ| '|opWeberE| '|opStruveH| '|opStruveL| '|opHankelH1|
              '|opHankelH2| '|opLommelS1| '|opLommelS2| '|opKummerM|
              '|opKummerU| '|opLegendreP| '|opLegendreQ| '|opKelvinBei|
              '|opKelvinBer| '|opKelvinKei| '|opKelvinKer| '|opEllipticK|
              '|opEllipticE| '|opEllipticE2| '|opEllipticF| '|opEllipticPi|
              '|opJacobiSn| '|opJacobiCn| '|opJacobiDn| '|opJacobiZeta|
              '|opJacobiTheta| '|opWeierstrassPInverse| '|opLerchPhi|
              '|opRiemannZeta| '|opint| '|opiint| '|opdint| '|opfact| '|opperm|
              '|opbinom| '|oppow| '|opsum| '|opdsum| '|opprod| '|opdprod|
              '|oprootsum| '|algop| '|rtrigop| '|htrigop| (|List| 12)
              (16 . |concat|) '|trigop| '|elemop| '|primop| '|combop| '|specop|
              '|anyop| '|allop| '|evenop| '|oddop| '|dummyvarop1|
              '|dummyvarop2| (22 . |deref|) (27 . |is?|) (33 . |copy|)
              |COMMONOP;operator;SBo;1| (|OutputForm|) (38 . |coerce|)
              (43 . |paren|) (48 . |postfix|) (54 . |quote|) (|List| $)
              (59 . |prefix|) (|None|) (65 . |setProperty|) (72 . |coerce|)
              (77 . =) (83 . ^) (89 . |setelt|) (|Mapping| 143 143)
              (95 . |display|) (101 . |commaSeparate|) (|Mapping| 143 162)
              (106 . |display|) (112 . |supersub|) (|List| 143) (118 . |first|)
              (123 . |second|) (128 . |binomial|) (134 . |third|) (139 . |sum|)
              (146 . |prod|) (153 . |hconcat|) (159 . *) (165 . |empty|)
              (169 . |int|) (|InputForm|) (176 . |convert|) (|List| 173)
              (181 . |concat|) (187 . |concat|) (193 . |convert|)
              (|Mapping| 173 175) (198 . |input|) (204 . |first|) (209 . |One|)
              (|Integer|) (213 . |One|) (217 . |One|) (|DoubleFloat|)
              (221 . |One|) (225 . |second|) (230 . /) (236 . |assert|)
              (|Void|) (242 . |void|))
           '#(|operator| 246) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 192
                                                 '(1 7 0 6 8 2 12 0 10 11 13 1
                                                   12 0 10 44 2 126 0 0 0 127 1
                                                   7 6 0 139 2 12 6 0 10 140 1
                                                   12 0 0 141 1 10 143 0 144 1
                                                   143 0 0 145 2 143 0 0 0 146
                                                   1 143 0 0 147 2 143 0 0 148
                                                   149 3 12 0 0 10 150 151 1 11
                                                   143 0 152 2 143 6 0 0 153 2
                                                   143 0 0 0 154 2 7 6 0 6 155
                                                   2 12 0 0 156 157 1 143 0 148
                                                   158 2 12 0 0 159 160 2 143 0
                                                   0 148 161 1 162 143 0 163 1
                                                   162 143 0 164 2 143 0 0 0
                                                   165 1 162 143 0 166 3 143 0
                                                   0 0 0 167 3 143 0 0 0 0 168
                                                   2 143 0 0 0 169 2 143 0 0 0
                                                   170 0 143 0 171 3 143 0 0 0
                                                   0 172 1 10 173 0 174 2 175 0
                                                   0 173 176 2 175 0 173 0 177
                                                   1 173 0 148 178 2 12 0 0 179
                                                   180 1 175 173 0 181 0 11 0
                                                   182 0 183 0 184 0 173 0 185
                                                   0 186 0 187 1 175 173 0 188
                                                   2 173 0 0 0 189 2 12 0 0 10
                                                   190 0 191 0 192 1 0 12 10
                                                   142)))))
           '|lookupComplete|)) 

(MAKEPROP '|CommonOperators| 'NILADIC T) 
