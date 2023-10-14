
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
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
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
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
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

(SDEFUN |SINT;*;I2$;9| ((|i| |Integer|) (|y| $) ($ $))
        (|mul_SI| (SPADCALL |i| (QREFELT $ 33)) |y|)) 

(PUT '|SINT;Zero;$;10| '|SPADreplace| '(XLAM NIL 0)) 

(SDEFUN |SINT;Zero;$;10| (($ $)) 0) 

(PUT '|SINT;One;$;11| '|SPADreplace| '(XLAM NIL 1)) 

(SDEFUN |SINT;One;$;11| (($ $)) 1) 

(PUT '|SINT;base;$;12| '|SPADreplace| '(XLAM NIL 2)) 

(SDEFUN |SINT;base;$;12| (($ $)) 2) 

(PUT '|SINT;max;$;13| '|SPADreplace| '(XLAM NIL MOST-POSITIVE-FIXNUM)) 

(SDEFUN |SINT;max;$;13| (($ $)) MOST-POSITIVE-FIXNUM) 

(PUT '|SINT;min;$;14| '|SPADreplace| '(XLAM NIL MOST-NEGATIVE-FIXNUM)) 

(SDEFUN |SINT;min;$;14| (($ $)) MOST-NEGATIVE-FIXNUM) 

(PUT '|SINT;=;2$B;15| '|SPADreplace| '|eql_SI|) 

(SDEFUN |SINT;=;2$B;15| ((|x| $) (|y| $) ($ |Boolean|)) (|eql_SI| |x| |y|)) 

(PUT '|SINT;~;2$;16| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;~;2$;16| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;not;2$;17| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;not;2$;17| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;/\\;3$;18| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;/\\;3$;18| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;\\/;3$;19| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;\\/;3$;19| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;Not;2$;20| '|SPADreplace| '|not_SI|) 

(SDEFUN |SINT;Not;2$;20| ((|x| $) ($ $)) (|not_SI| |x|)) 

(PUT '|SINT;And;3$;21| '|SPADreplace| '|and_SI|) 

(SDEFUN |SINT;And;3$;21| ((|x| $) (|y| $) ($ $)) (|and_SI| |x| |y|)) 

(PUT '|SINT;Or;3$;22| '|SPADreplace| '|or_SI|) 

(SDEFUN |SINT;Or;3$;22| ((|x| $) (|y| $) ($ $)) (|or_SI| |x| |y|)) 

(PUT '|SINT;xor;3$;23| '|SPADreplace| '|xor_SI|) 

(SDEFUN |SINT;xor;3$;23| ((|x| $) (|y| $) ($ $)) (|xor_SI| |x| |y|)) 

(PUT '|SINT;<;2$B;24| '|SPADreplace| '|less_SI|) 

(SDEFUN |SINT;<;2$B;24| ((|x| $) (|y| $) ($ |Boolean|)) (|less_SI| |x| |y|)) 

(PUT '|SINT;inc;2$;25| '|SPADreplace| '|inc_SI|) 

(SDEFUN |SINT;inc;2$;25| ((|x| $) ($ $)) (|inc_SI| |x|)) 

(PUT '|SINT;dec;2$;26| '|SPADreplace| '|dec_SI|) 

(SDEFUN |SINT;dec;2$;26| ((|x| $) ($ $)) (|dec_SI| |x|)) 

(PUT '|SINT;-;2$;27| '|SPADreplace| '|minus_SI|) 

(SDEFUN |SINT;-;2$;27| ((|x| $) ($ $)) (|minus_SI| |x|)) 

(PUT '|SINT;+;3$;28| '|SPADreplace| '|add_SI|) 

(SDEFUN |SINT;+;3$;28| ((|x| $) (|y| $) ($ $)) (|add_SI| |x| |y|)) 

(PUT '|SINT;-;3$;29| '|SPADreplace| '|sub_SI|) 

(SDEFUN |SINT;-;3$;29| ((|x| $) (|y| $) ($ $)) (|sub_SI| |x| |y|)) 

(PUT '|SINT;*;3$;30| '|SPADreplace| '|mul_SI|) 

(SDEFUN |SINT;*;3$;30| ((|x| $) (|y| $) ($ $)) (|mul_SI| |x| |y|)) 

(SDEFUN |SINT;^;$Nni$;31| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (EXPT |x| |n|) (QREFELT $ 33))) 

(PUT '|SINT;quo;3$;32| '|SPADreplace| '|quo_SI|) 

(SDEFUN |SINT;quo;3$;32| ((|x| $) (|y| $) ($ $)) (|quo_SI| |x| |y|)) 

(PUT '|SINT;rem;3$;33| '|SPADreplace| '|rem_SI|) 

(SDEFUN |SINT;rem;3$;33| ((|x| $) (|y| $) ($ $)) (|rem_SI| |x| |y|)) 

(SDEFUN |SINT;divide;2$R;34|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |quotient| . #1=($)) (|:| |remainder| . #1#)))
        (CONS (|quo_SI| |x| |y|) (|rem_SI| |x| |y|))) 

(PUT '|SINT;gcd;3$;35| '|SPADreplace| 'GCD) 

(SDEFUN |SINT;gcd;3$;35| ((|x| $) (|y| $) ($ $)) (GCD |x| |y|)) 

(PUT '|SINT;abs;2$;36| '|SPADreplace| '|abs_SI|) 

(SDEFUN |SINT;abs;2$;36| ((|x| $) ($ $)) (|abs_SI| |x|)) 

(PUT '|SINT;odd?;$B;37| '|SPADreplace| '|odd?_SI|) 

(SDEFUN |SINT;odd?;$B;37| ((|x| $) ($ |Boolean|)) (|odd?_SI| |x|)) 

(PUT '|SINT;zero?;$B;38| '|SPADreplace| '|zero?_SI|) 

(SDEFUN |SINT;zero?;$B;38| ((|x| $) ($ |Boolean|)) (|zero?_SI| |x|)) 

(PUT '|SINT;one?;$B;39| '|SPADreplace| '(XLAM (|x|) (|eql_SI| |x| 1))) 

(SDEFUN |SINT;one?;$B;39| ((|x| $) ($ |Boolean|)) (|eql_SI| |x| 1)) 

(PUT '|SINT;max;3$;40| '|SPADreplace| '|max_SI|) 

(SDEFUN |SINT;max;3$;40| ((|x| $) (|y| $) ($ $)) (|max_SI| |x| |y|)) 

(PUT '|SINT;min;3$;41| '|SPADreplace| '|min_SI|) 

(SDEFUN |SINT;min;3$;41| ((|x| $) (|y| $) ($ $)) (|min_SI| |x| |y|)) 

(SDEFUN |SINT;hashUpdate!;Hs$Hs;42|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SINT;length;2$;43| '|SPADreplace| 'INTEGER-LENGTH) 

(SDEFUN |SINT;length;2$;43| ((|x| $) ($ $)) (INTEGER-LENGTH |x|)) 

(PUT '|SINT;shift;3$;44| '|SPADreplace| '|lshift_SI|) 

(SDEFUN |SINT;shift;3$;44| ((|x| $) (|n| $) ($ $)) (|lshift_SI| |x| |n|)) 

(PUT '|SINT;mulmod;4$;45| '|SPADreplace| '|mulmod_SI|) 

(SDEFUN |SINT;mulmod;4$;45| ((|a| $) (|b| $) (|p| $) ($ $))
        (|mulmod_SI| |a| |b| |p|)) 

(PUT '|SINT;addmod;4$;46| '|SPADreplace| '|addmod_SI|) 

(SDEFUN |SINT;addmod;4$;46| ((|a| $) (|b| $) (|p| $) ($ $))
        (|addmod_SI| |a| |b| |p|)) 

(PUT '|SINT;submod;4$;47| '|SPADreplace| '|submod_SI|) 

(SDEFUN |SINT;submod;4$;47| ((|a| $) (|b| $) (|p| $) ($ $))
        (|submod_SI| |a| |b| |p|)) 

(PUT '|SINT;negative?;$B;48| '|SPADreplace| '|negative?_SI|) 

(SDEFUN |SINT;negative?;$B;48| ((|x| $) ($ |Boolean|)) (|negative?_SI| |x|)) 

(PUT '|SINT;reducedSystem;MVR;49| '|SPADreplace| 'CONS) 

(SDEFUN |SINT;reducedSystem;MVR;49|
        ((|m| |Matrix| . #1=($)) (|v| |Vector| . #1#)
         ($ |Record| (|:| |mat| (|Matrix| #2=(|Integer|)))
          (|:| |vec| (|Vector| #2#))))
        (CONS |m| |v|)) 

(SDEFUN |SINT;positiveRemainder;3$;50| ((|x| $) (|n| $) ($ $))
        (SPROG ((|r| NIL))
               (SEQ
                (LETT |r| (|rem_SI| |x| |n|) |SINT;positiveRemainder;3$;50|)
                (EXIT
                 (COND
                  ((|negative?_SI| |r|)
                   (COND ((|negative?_SI| |n|) (|sub_SI| |x| |n|))
                         (#1='T (|add_SI| |r| |n|))))
                  (#1# |r|)))))) 

(PUT '|SINT;qconvert;I$;51| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SINT;qconvert;I$;51| ((|x| |Integer|) ($ $)) |x|) 

(SDEFUN |SINT;coerce;I$;52| ((|x| |Integer|) ($ $))
        (SEQ
         (COND
          ((SPADCALL |x| MOST-POSITIVE-FIXNUM (QREFELT $ 82))
           (COND ((>= |x| MOST-NEGATIVE-FIXNUM) (EXIT |x|)))))
         (EXIT (|error| "integer too large to represent in a machine word")))) 

(SDEFUN |SINT;random;$;53| (($ $))
        (SEQ (SETELT $ 6 (REMAINDER (* 314159269 (QREFELT $ 6)) 2147483647))
             (EXIT (REMAINDER (QREFELT $ 6) 67108864)))) 

(PUT '|SINT;random;2$;54| '|SPADreplace| 'RANDOM) 

(SDEFUN |SINT;random;2$;54| ((|n| $) ($ $)) (RANDOM |n|)) 

(SDEFUN |SINT;unitNormal;$R;55|
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
          (LETT $ (GETREFV 108) . #1#)
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
              |SINT;coerce;$Of;7| |SINT;convert;$I;8| (53 . |coerce|)
              |SINT;*;I2$;9|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;Zero;$;10|) $))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SINT;One;$;11|) $))
              |SINT;base;$;12| |SINT;max;$;13| |SINT;min;$;14| |SINT;=;2$B;15|
              |SINT;~;2$;16| |SINT;not;2$;17| |SINT;/\\;3$;18| |SINT;\\/;3$;19|
              |SINT;Not;2$;20| |SINT;And;3$;21| |SINT;Or;3$;22|
              |SINT;xor;3$;23| |SINT;<;2$B;24| |SINT;inc;2$;25|
              |SINT;dec;2$;26| |SINT;-;2$;27| |SINT;+;3$;28| |SINT;-;3$;29|
              |SINT;*;3$;30| (|NonNegativeInteger|) |SINT;^;$Nni$;31|
              |SINT;quo;3$;32| |SINT;rem;3$;33|
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SINT;divide;2$R;34| |SINT;gcd;3$;35| |SINT;abs;2$;36|
              |SINT;odd?;$B;37| |SINT;zero?;$B;38| |SINT;one?;$B;39|
              |SINT;max;3$;40| |SINT;min;3$;41| (|HashState|)
              |SINT;hashUpdate!;Hs$Hs;42| |SINT;length;2$;43|
              |SINT;shift;3$;44| |SINT;mulmod;4$;45| |SINT;addmod;4$;46|
              |SINT;submod;4$;47| |SINT;negative?;$B;48|
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 12))) (|Vector| $)
              |SINT;reducedSystem;MVR;49| |SINT;positiveRemainder;3$;50|
              |SINT;qconvert;I$;51| (58 . <=) |SINT;coerce;I$;52|
              |SINT;random;$;53| |SINT;random;2$;54|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              |SINT;unitNormal;$R;55| (|Fraction| 12) (|Union| 88 '"failed")
              (|Union| $ '"failed") (|Float|) (|DoubleFloat|)
              (|PatternMatchResult| 12 $) (|Pattern| 12) (|InputForm|)
              (|Union| 12 '"failed")
              (|Record| (|:| |coef| 98) (|:| |generator| $)) (|List| $)
              (|Union| 98 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 101 '"failed") (|Factored| $)
              (|SparseUnivariatePolynomial| $)
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
              |copy| 471 |convert| 476 |coerce| 501 |characteristic| 521 |bit?|
              525 |binomial| 531 |base| 537 |associates?| 541 |annihilate?| 547
              |addmod| 553 |abs| 560 ^ 565 |\\/| 577 |Zero| 583 |Or| 587 |One|
              593 |OMwrite| 597 |Not| 621 D 626 |And| 637 >= 643 > 649 = 655 <=
              661 < 667 |/\\| 673 - 679 + 690 * 696)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL |Algebra&| NIL |DifferentialRing&| NIL NIL
                |EntireRing&| |Module&| NIL NIL |Ring&| NIL NIL |Rng&| NIL NIL
                |AbelianGroup&| NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |Monoid&| NIL NIL NIL NIL |SemiGroup&| |AbelianSemiGroup&|
                |Logic&| NIL |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                NIL |RetractableTo&| NIL |PartialOrder&| NIL NIL NIL
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
                 (|Canonical|) (|OpenMath|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 91)
                 (|ConvertibleTo| 92) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 94) (|ConvertibleTo| 95) (|RetractableTo| 12)
                 (|ConvertibleTo| 12) (|PartialOrder|) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 29))
              (|makeByteWordVec2| 107
                                  '(1 8 7 0 9 3 8 7 0 10 10 11 2 8 7 0 12 13 1
                                    8 7 0 14 0 15 0 16 2 8 0 10 15 17 1 8 7 0
                                    18 1 8 7 0 19 1 8 7 0 20 1 12 29 0 30 1 0 0
                                    12 33 2 12 22 0 0 82 2 0 22 0 0 1 1 0 0 0
                                    41 1 0 22 0 65 2 0 0 0 0 48 1 0 86 0 87 1 0
                                    0 0 1 1 0 22 0 1 2 0 0 0 0 1 2 0 90 0 0 1 3
                                    0 0 0 0 0 75 1 0 0 0 1 1 0 103 0 1 2 0 22 0
                                    0 1 2 0 22 0 0 1 1 0 12 0 1 2 0 0 0 0 72 0
                                    0 0 1 1 0 96 0 1 1 0 12 0 1 2 0 0 0 0 59 1
                                    0 26 27 28 2 0 77 27 78 79 1 0 90 0 1 1 0
                                    89 0 1 1 0 22 0 1 1 0 88 0 1 0 0 0 84 1 0 0
                                    0 85 2 0 0 0 0 58 1 0 0 12 81 1 0 97 98 1 1
                                    0 22 0 1 3 0 0 0 0 0 1 2 0 0 0 0 80 1 0 22
                                    0 1 2 0 0 0 0 1 3 0 93 0 94 93 1 2 0 22 0 0
                                    1 1 0 22 0 66 1 0 22 0 64 1 0 0 0 42 1 0 90
                                    0 1 1 0 22 0 76 2 0 99 98 0 1 3 0 0 0 0 0
                                    73 0 0 0 39 2 0 0 0 0 68 0 0 0 38 2 0 0 0 0
                                    67 1 0 0 0 1 1 0 0 0 71 2 0 105 0 0 1 1 0 0
                                    98 1 2 0 0 0 0 1 1 0 10 0 1 2 0 0 0 0 1 0 0
                                    0 1 1 0 0 0 50 2 0 69 69 0 70 1 0 107 0 1 2
                                    0 104 104 104 1 1 0 0 98 1 2 0 0 0 0 62 1 0
                                    0 0 1 1 0 103 0 1 2 0 100 0 0 1 3 0 102 0 0
                                    0 1 2 0 90 0 0 1 2 0 99 98 0 1 1 0 22 0 1 1
                                    0 56 0 1 2 0 60 0 0 61 1 0 0 0 1 2 0 0 0 56
                                    1 1 0 0 0 51 1 0 0 0 1 1 0 91 0 1 1 0 92 0
                                    1 1 0 94 0 1 1 0 95 0 1 1 0 12 0 32 1 0 0
                                    12 83 1 0 0 12 83 1 0 0 0 1 1 0 29 0 31 0 0
                                    56 1 2 0 22 0 0 1 2 0 0 0 0 1 0 0 0 37 2 0
                                    22 0 0 1 2 0 22 0 0 1 3 0 0 0 0 0 74 1 0 0
                                    0 63 2 0 0 0 56 57 2 0 0 0 106 1 2 0 0 0 0
                                    44 0 0 0 35 2 0 0 0 0 47 0 0 0 36 3 0 7 8 0
                                    22 25 2 0 10 0 22 23 2 0 7 8 0 24 1 0 10 0
                                    21 1 0 0 0 45 1 0 0 0 1 2 0 0 0 56 1 2 0 0
                                    0 0 46 2 0 22 0 0 1 2 0 22 0 0 1 2 0 22 0 0
                                    40 2 0 22 0 0 1 2 0 22 0 0 49 2 0 0 0 0 43
                                    2 0 0 0 0 54 1 0 0 0 52 2 0 0 0 0 53 2 0 0
                                    0 0 55 2 0 0 12 0 34 2 0 0 56 0 1 2 0 0 106
                                    0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|SingleInteger| 'NILADIC T) 
