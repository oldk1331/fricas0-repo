
(SDEFUN |SINT;writeOMSingleInt| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ
         (COND
          ((|less_SI| |x| 0)
           (SEQ (SPADCALL |dev| (QREFELT $ 9))
                (SPADCALL |dev| "arith1" "unary_minus" (QREFELT $ 11))
                (SPADCALL |dev| (|minus_SI| |x|) (QREFELT $ 13))
                (EXIT (SPADCALL |dev| (QREFELT $ 14)))))
          ('T (SPADCALL |dev| |x| (QREFELT $ 13)))))) 

(SDEFUN |SINT;OMwrite;$S;2| ((|x| $) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| (|None|)))
               (SEQ (LETT |s| "" . #1=(|SINT;OMwrite;$S;2|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 16))
                                    (QREFELT $ 17))
                          . #1#)
                    (SPADCALL |dev| (QREFELT $ 18))
                    (|SINT;writeOMSingleInt| |dev| |x| $)
                    (SPADCALL |dev| (QREFELT $ 19))
                    (SPADCALL |dev| (QREFELT $ 20))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |SINT;OMwrite;$BS;3| ((|x| $) (|wholeObj| |Boolean|) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| (|None|)))
               (SEQ (LETT |s| "" . #1=(|SINT;OMwrite;$BS;3|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 16))
                                    (QREFELT $ 17))
                          . #1#)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))
                    (|SINT;writeOMSingleInt| |dev| |x| $)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 19))))
                    (SPADCALL |dev| (QREFELT $ 20))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |SINT;OMwrite;Omd$V;4| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 18))
             (|SINT;writeOMSingleInt| |dev| |x| $)
             (EXIT (SPADCALL |dev| (QREFELT $ 19))))) 

(SDEFUN |SINT;OMwrite;Omd$BV;5|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 18))))
             (|SINT;writeOMSingleInt| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 19))))))) 

(PUT '|SINT;reducedSystem;MM;6| '|SPADreplace| '(XLAM (|m|) |m|)) 

(SDEFUN |SINT;reducedSystem;MM;6| ((|m| |Matrix| $) ($ |Matrix| (|Integer|)))
        |m|) 

(SDEFUN |SINT;coerce;$Of;7| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 30))) 

(PUT '|SINT;convert;$I;8| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;convert;$I;8| ((|x| $) ($ |Integer|)) |x|) 

(PUT '|SINT;convert;$S;9| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |SINT;convert;$S;9| ((|x| $) ($ |String|)) (STRINGIMAGE |x|)) 

(SDEFUN |SINT;*;I2$;10| ((|i| |Integer|) (|y| $) ($ $))
        (|mul_SI| (SPADCALL |i| (QREFELT $ 34)) |y|)) 

(PUT '|SINT;Zero;$;11| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |SINT;Zero;$;11| (($ $)) 0) 

(PUT '|SINT;One;$;12| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |SINT;One;$;12| (($ $)) 1) 

(PUT '|SINT;base;$;13| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |SINT;base;$;13| (($ $)) 2) 

(PUT '|SINT;max;$;14| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-FIXNUM)) 

(SDEFUN |SINT;max;$;14| (($ $)) MOST-POSITIVE-FIXNUM) 

(PUT '|SINT;min;$;15| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-FIXNUM)) 

(SDEFUN |SINT;min;$;15| (($ $)) MOST-NEGATIVE-FIXNUM) 

(PUT '|SINT;=;2$B;16| '|SPADreplace| '|eql_SI|) 

(SDEFUN |SINT;=;2$B;16| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(PUT '|SINT;~;2$;17| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;~;2$;17| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;not;2$;18| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;not;2$;18| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;/\\;3$;19| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;/\\;3$;19| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;\\/;3$;20| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;\\/;3$;20| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;Not;2$;21| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;Not;2$;21| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;And;3$;22| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;And;3$;22| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;Or;3$;23| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;Or;3$;23| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;xor;3$;24| '|SPADreplace| '|xor_SI|) 

(SDEFUN |SINT;xor;3$;24| ((|x| $) (|y| $) ($ $)) (|xor_SI| |x| |y|)) 

(PUT '|SINT;<;2$B;25| '|SPADreplace| '|less_SI|) 

(SDEFUN |SINT;<;2$B;25| ((|x| $) (|y| $) ($ |Boolean|)) (|less_SI| |x| |y|)) 

(PUT '|SINT;inc;2$;26| '|SPADreplace| '|inc_SI|) 

(SDEFUN |SINT;inc;2$;26| ((|x| $) ($ $)) (|inc_SI| |x|)) 

(PUT '|SINT;dec;2$;27| '|SPADreplace| '|dec_SI|) 

(SDEFUN |SINT;dec;2$;27| ((|x| $) ($ $)) (|dec_SI| |x|)) 

(PUT '|SINT;-;2$;28| '|SPADreplace| '|minus_SI|) 

(SDEFUN |SINT;-;2$;28| ((|x| $) ($ $)) (|minus_SI| |x|)) 

(PUT '|SINT;+;3$;29| '|SPADreplace| '|add_SI|) 

(SDEFUN |SINT;+;3$;29| ((|x| $) (|y| $) ($ $)) (|add_SI| |x| |y|)) 

(PUT '|SINT;-;3$;30| '|SPADreplace| '|sub_SI|) 

(SDEFUN |SINT;-;3$;30| ((|x| $) (|y| $) ($ $)) (|sub_SI| |x| |y|)) 

(PUT '|SINT;*;3$;31| '|SPADreplace| '|mul_SI|) 

(SDEFUN |SINT;*;3$;31| ((|x| $) (|y| $) ($ $)) (|mul_SI| |x| |y|)) 

(SDEFUN |SINT;^;$Nni$;32| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (EXPT |x| |n|) (QREFELT $ 34))) 

(PUT '|SINT;quo;3$;33| '|SPADreplace| '|quo_SI|) 

(SDEFUN |SINT;quo;3$;33| ((|x| $) (|y| $) ($ $)) (|quo_SI| |x| |y|)) 

(PUT '|SINT;rem;3$;34| '|SPADreplace| '|rem_SI|) 

(SDEFUN |SINT;rem;3$;34| ((|x| $) (|y| $) ($ $)) (|rem_SI| |x| |y|)) 

(SDEFUN |SINT;divide;2$R;35|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (CONS (|quo_SI| |x| |y|) (|rem_SI| |x| |y|))) 

(PUT '|SINT;gcd;3$;36| '|SPADreplace| 'GCD) 

(SDEFUN |SINT;gcd;3$;36| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(PUT '|SINT;abs;2$;37| '|SPADreplace| '|abs_SI|) 

(SDEFUN |SINT;abs;2$;37| ((|x| $) ($ $)) (|abs_SI| |x|)) 

(PUT '|SINT;odd?;$B;38| '|SPADreplace| '|odd?_SI|) 

(SDEFUN |SINT;odd?;$B;38| ((|x| $) ($ |Boolean|)) (|odd?_SI| |x|)) 

(PUT '|SINT;zero?;$B;39| '|SPADreplace| '|zero?_SI|) 

(SDEFUN |SINT;zero?;$B;39| ((|x| $) ($ |Boolean|)) (|zero?_SI| |x|)) 

(PUT '|SINT;one?;$B;40| '|SPADreplace| '(XLAM (|x|) (|eql_SI| |x| 1))) 

(SDEFUN |SINT;one?;$B;40| ((|x| $) ($ |Boolean|)) (|eql_SI| |x| 1)) 

(PUT '|SINT;max;3$;41| '|SPADreplace| '|max_SI|) 

(SDEFUN |SINT;max;3$;41| ((|x| $) (|y| $) ($ $)) (|max_SI| |x| |y|)) 

(PUT '|SINT;min;3$;42| '|SPADreplace| '|min_SI|) 

(SDEFUN |SINT;min;3$;42| ((|x| $) (|y| $) ($ $)) (|min_SI| |x| |y|)) 

(SDEFUN |SINT;hashUpdate!;Hs$Hs;43|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SINT;length;2$;44| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |SINT;length;2$;44| ((|x| $) ($ $)) (INTEGER-LENGTH |x|)) 

(PUT '|SINT;shift;3$;45| '|SPADreplace| '|lshift_SI|) 

(SDEFUN |SINT;shift;3$;45| ((|x| $) (|n| $) ($ $)) (|lshift_SI| |x| |n|)) 

(PUT '|SINT;mulmod;4$;46| '|SPADreplace| '|mulmod_SI|) 

(SDEFUN |SINT;mulmod;4$;46| ((|a| $) (|b| $) (|p| $) ($ $))
        (|mulmod_SI| |a| |b| |p|)) 

(PUT '|SINT;addmod;4$;47| '|SPADreplace| '|addmod_SI|) 

(SDEFUN |SINT;addmod;4$;47| ((|a| $) (|b| $) (|p| $) ($ $))
        (|addmod_SI| |a| |b| |p|)) 

(PUT '|SINT;submod;4$;48| '|SPADreplace| '|submod_SI|) 

(SDEFUN |SINT;submod;4$;48| ((|a| $) (|b| $) (|p| $) ($ $))
        (|submod_SI| |a| |b| |p|)) 

(PUT '|SINT;negative?;$B;49| '|SPADreplace| '|negative?_SI|) 

(SDEFUN |SINT;negative?;$B;49| ((|x| $) ($ |Boolean|)) (|negative?_SI| |x|)) 

(PUT '|SINT;reducedSystem;MVR;50| '|SPADreplace| 'CONS) 

(SDEFUN |SINT;reducedSystem;MVR;50|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| #2=(|Integer|)))
          (|:| |vec| (|Vector| #2#))))
        (CONS |m| |v|)) 

(SDEFUN |SINT;positiveRemainder;3$;51| ((|x| $) (|n| $) ($ $))
        (SPROG ((|r| ($)))
               (SEQ
                (LETT |r| (|rem_SI| |x| |n|) |SINT;positiveRemainder;3$;51|)
                (EXIT
                 (COND
                  ((|negative?_SI| |r|)
                   (COND ((|negative?_SI| |n|) (|sub_SI| |x| |n|))
                         (#1='T (|add_SI| |r| |n|))))
                  (#1# |r|)))))) 

(PUT '|SINT;qconvert;I$;52| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;qconvert;I$;52| ((|x| |Integer|) ($ $)) |x|) 

(SDEFUN |SINT;coerce;I$;53| ((|x| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| MOST-POSITIVE-FIXNUM (QREFELT $ 83))
           (COND ((>= |x| MOST-NEGATIVE-FIXNUM) (EXIT |x|)))))
         (EXIT (|error| "integer too large to represent in a machine word")))) 

(SDEFUN |SINT;random;$;54| (($ $))
        (SEQ (SETELT $ 6 (REMAINDER (* 314159269 (QREFELT $ 6)) 2147483647))
             (EXIT (REMAINDER (QREFELT $ 6) 67108864)))) 

(PUT '|SINT;random;2$;55| '|SPADreplace| 'RANDOM) 

(SDEFUN |SINT;random;2$;55| ((|n| $) ($ $)) (RANDOM |n|)) 

(SDEFUN |SINT;unitNormal;$R;56|
        ((|x| $)
         ($ |Record| (|:| |unit| . #1=($)) (|:| |canonical| . #1#)
          (|:| |associate| . #1#)))
        (COND ((|less_SI| |x| 0) (VECTOR -1 (|minus_SI| |x|) -1))
              ('T (VECTOR 1 |x| 1)))) 

(DECLAIM (NOTINLINE |SingleInteger;|)) 

(DEFUN |SingleInteger| ()
  (SPROG NIL
         (PROG (#1=#:G1873)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SingleInteger|)
                    . #2=(|SingleInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SingleInteger|
                             (LIST (CONS NIL (CONS 1 (|SingleInteger;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|SingleInteger|)))))))))) 

(DEFUN |SingleInteger;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SingleInteger|) . #1=(|SingleInteger|))
          (LETT $ (GETREFV 109) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|SingleInteger| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 1)
          $))) 

(MAKEPROP '|SingleInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|seed| (|Void|) (|OpenMathDevice|)
              (0 . |OMputApp|) (|String|) (5 . |OMputSymbol|) (|Integer|)
              (12 . |OMputInteger|) (18 . |OMputEndApp|) (|OpenMathEncoding|)
              (23 . |OMencodingXML|) (27 . |OMopenString|) (33 . |OMputObject|)
              (38 . |OMputEndObject|) (43 . |OMclose|) |SINT;OMwrite;$S;2|
              (|Boolean|) |SINT;OMwrite;$BS;3| |SINT;OMwrite;Omd$V;4|
              |SINT;OMwrite;Omd$BV;5| (|Matrix| 12) (|Matrix| $)
              |SINT;reducedSystem;MM;6| (|OutputForm|) (48 . |coerce|)
              |SINT;coerce;$Of;7| |SINT;convert;$I;8| |SINT;convert;$S;9|
              (53 . |coerce|) |SINT;*;I2$;10|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;Zero;$;11|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;One;$;12|) $))
              |SINT;base;$;13| |SINT;max;$;14| |SINT;min;$;15| |SINT;=;2$B;16|
              |SINT;~;2$;17| |SINT;not;2$;18| |SINT;/\\;3$;19| |SINT;\\/;3$;20|
              |SINT;Not;2$;21| |SINT;And;3$;22| |SINT;Or;3$;23|
              |SINT;xor;3$;24| |SINT;<;2$B;25| |SINT;inc;2$;26|
              |SINT;dec;2$;27| |SINT;-;2$;28| |SINT;+;3$;29| |SINT;-;3$;30|
              |SINT;*;3$;31| (|NonNegativeInteger|) |SINT;^;$Nni$;32|
              |SINT;quo;3$;33| |SINT;rem;3$;34|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SINT;divide;2$R;35| |SINT;gcd;3$;36| |SINT;abs;2$;37|
              |SINT;odd?;$B;38| |SINT;zero?;$B;39| |SINT;one?;$B;40|
              |SINT;max;3$;41| |SINT;min;3$;42| (|HashState|)
              |SINT;hashUpdate!;Hs$Hs;43| |SINT;length;2$;44|
              |SINT;shift;3$;45| |SINT;mulmod;4$;46| |SINT;addmod;4$;47|
              |SINT;submod;4$;48| |SINT;negative?;$B;49|
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 12))) (|Vector| $)
              |SINT;reducedSystem;MVR;50| |SINT;positiveRemainder;3$;51|
              |SINT;qconvert;I$;52| (58 . <=) |SINT;coerce;I$;53|
              |SINT;random;$;54| |SINT;random;2$;55|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |SINT;unitNormal;$R;56| (|Union| 90 '"failed") (|Fraction| 12)
              (|DoubleFloat|) (|Union| $ '"failed") (|Float|)
              (|PatternMatchResult| 12 $) (|Pattern| 12) (|InputForm|)
              (|Union| 12 '"failed") (|Union| 99 '"failed") (|List| $)
              (|Record| (|:| |coef| 99) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 101 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 64 ~ 70 |zero?| 75 |xor| 80 |unitNormal| 86 |unitCanonical| 91
              |unit?| 96 |symmetricRemainder| 101 |subtractIfCan| 107 |submod|
              113 |squareFreePart| 120 |squareFree| 125 |smaller?| 130
              |sizeLess?| 136 |sign| 142 |shift| 147 |sample| 153
              |retractIfCan| 157 |retract| 162 |rem| 167 |reducedSystem| 173
              |recip| 184 |rationalIfCan| 189 |rational?| 194 |rational| 199
              |random| 204 |quo| 213 |qconvert| 219 |principalIdeal| 224
              |prime?| 229 |powmod| 234 |positiveRemainder| 241 |positive?| 247
              |permutation| 252 |patternMatch| 258 |opposite?| 265 |one?| 271
              |odd?| 276 |not| 281 |nextItem| 286 |negative?| 291
              |multiEuclidean| 296 |mulmod| 302 |min| 309 |max| 319 |mask| 329
              |length| 334 |lcmCoef| 339 |lcm| 345 |latex| 356 |invmod| 361
              |init| 367 |inc| 371 |hashUpdate!| 376 |hash| 382 |gcdPolynomial|
              387 |gcd| 393 |factorial| 404 |factor| 409 |extendedEuclidean|
              414 |exquo| 427 |expressIdealMember| 433 |even?| 439
              |euclideanSize| 444 |divide| 449 |differentiate| 455 |dec| 466
              |copy| 471 |convert| 476 |coerce| 506 |characteristic| 526 |bit?|
              530 |binomial| 536 |base| 542 |associates?| 546 |annihilate?| 552
              |addmod| 558 |abs| 565 ^ 570 |\\/| 582 |Zero| 588 |Or| 592 |One|
              598 |OMwrite| 602 |Not| 626 D 631 |And| 642 >= 648 > 654 = 660 <=
              666 < 672 |/\\| 678 - 684 + 695 * 701)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| NIL |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |Logic&| NIL |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                NIL NIL |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|LeftOreRing|) (|Algebra| $$)
                 (|LinearlyExplicitRingOver| 12) (|DifferentialRing|)
                 (|CharacteristicZero|) (|CommutativeRing|) (|EntireRing|)
                 (|Module| $$) (|OrderedAbelianGroup|) (|BiModule| $$ $$)
                 (|Ring|) (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| $$) (|Rng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRing|) (|OrderedSet|) (|AbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|StepThrough|) (|PatternMatchable| 12)
                 (|Comparable|) (|SemiGroup|) (|AbelianSemiGroup|) (|Logic|)
                 (|RealConstant|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|OpenMath|) (|ConvertibleTo| 10)
                 (|multiplicativeValuation|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 93) (|ConvertibleTo| 91)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 95)
                 (|ConvertibleTo| 96) (|RetractableTo| 12) (|ConvertibleTo| 12)
                 (|PartialOrder|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 29))
              (|makeByteWordVec2| 108
                                  '(1 8 7 0 9 3 8 7 0 10 10 11 2 8 7 0 12 13 1
                                    8 7 0 14 0 15 0 16 2 8 0 10 15 17 1 8 7 0
                                    18 1 8 7 0 19 1 8 7 0 20 1 12 29 0 30 1 0 0
                                    12 34 2 12 22 0 0 83 2 0 22 0 0 1 1 0 0 0
                                    42 1 0 22 0 66 2 0 0 0 0 49 1 0 87 0 88 1 0
                                    0 0 1 1 0 22 0 1 2 0 0 0 0 1 2 0 92 0 0 1 3
                                    0 0 0 0 0 76 1 0 0 0 1 1 0 104 0 1 2 0 22 0
                                    0 1 2 0 22 0 0 1 1 0 12 0 1 2 0 0 0 0 73 0
                                    0 0 1 1 0 97 0 1 1 0 12 0 1 2 0 0 0 0 60 2
                                    0 78 27 79 80 1 0 26 27 28 1 0 92 0 1 1 0
                                    89 0 1 1 0 22 0 1 1 0 90 0 1 1 0 0 0 86 0 0
                                    0 85 2 0 0 0 0 59 1 0 0 12 82 1 0 100 99 1
                                    1 0 22 0 1 3 0 0 0 0 0 1 2 0 0 0 0 81 1 0
                                    22 0 1 2 0 0 0 0 1 3 0 94 0 95 94 1 2 0 22
                                    0 0 1 1 0 22 0 67 1 0 22 0 65 1 0 0 0 43 1
                                    0 92 0 1 1 0 22 0 77 2 0 98 99 0 1 3 0 0 0
                                    0 0 74 0 0 0 40 2 0 0 0 0 69 0 0 0 39 2 0 0
                                    0 0 68 1 0 0 0 1 1 0 0 0 72 2 0 106 0 0 1 2
                                    0 0 0 0 1 1 0 0 99 1 1 0 10 0 1 2 0 0 0 0 1
                                    0 0 0 1 1 0 0 0 51 2 0 70 70 0 71 1 0 108 0
                                    1 2 0 105 105 105 1 2 0 0 0 0 63 1 0 0 99 1
                                    1 0 0 0 1 1 0 104 0 1 3 0 102 0 0 0 1 2 0
                                    103 0 0 1 2 0 92 0 0 1 2 0 98 99 0 1 1 0 22
                                    0 1 1 0 57 0 1 2 0 61 0 0 62 1 0 0 0 1 2 0
                                    0 0 57 1 1 0 0 0 52 1 0 0 0 1 1 0 10 0 33 1
                                    0 91 0 1 1 0 93 0 1 1 0 96 0 1 1 0 95 0 1 1
                                    0 12 0 32 1 0 0 12 84 1 0 0 0 1 1 0 0 12 84
                                    1 0 29 0 31 0 0 57 1 2 0 22 0 0 1 2 0 0 0 0
                                    1 0 0 0 38 2 0 22 0 0 1 2 0 22 0 0 1 3 0 0
                                    0 0 0 75 1 0 0 0 64 2 0 0 0 57 58 2 0 0 0
                                    107 1 2 0 0 0 0 45 0 0 0 36 2 0 0 0 0 48 0
                                    0 0 37 3 0 7 8 0 22 25 2 0 10 0 22 23 2 0 7
                                    8 0 24 1 0 10 0 21 1 0 0 0 46 1 0 0 0 1 2 0
                                    0 0 57 1 2 0 0 0 0 47 2 0 22 0 0 1 2 0 22 0
                                    0 1 2 0 22 0 0 41 2 0 22 0 0 1 2 0 22 0 0
                                    50 2 0 0 0 0 44 1 0 0 0 53 2 0 0 0 0 55 2 0
                                    0 0 0 54 2 0 0 12 0 35 2 0 0 0 0 56 2 0 0
                                    57 0 1 2 0 0 107 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SingleInteger| 'NILADIC T) 
