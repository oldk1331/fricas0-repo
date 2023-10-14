
(SDEFUN |FSPECF;abs;2F;1| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;Gamma;2F;2| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;Gamma;3F;3| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 15) |a| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;Beta;3F;4| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 16) |x| |y| (QREFELT $ 38))) 

(SDEFUN |FSPECF;digamma;2F;5| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;polygamma;3F;6| ((|k| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) |k| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;besselJ;3F;7| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 19) |a| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;besselY;3F;8| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 20) |a| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;besselI;3F;9| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 21) |a| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;besselK;3F;10| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 22) |a| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;airyAi;2F;11| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;airyAiPrime;2F;12| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;airyBi;2F;13| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;airyBiPrime;2F;14| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;lambertW;2F;15| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 35))) 

(SDEFUN |FSPECF;polylog;3F;16| ((|s| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) |s| |x| (QREFELT $ 38))) 

(SDEFUN |FSPECF;weierstrassP;4F;17| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) |g2| |g3| |x| (QREFELT $ 53))) 

(SDEFUN |FSPECF;weierstrassPPrime;4F;18| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) |g2| |g3| |x| (QREFELT $ 53))) 

(SDEFUN |FSPECF;weierstrassSigma;4F;19| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 31) |g2| |g3| |x| (QREFELT $ 53))) 

(SDEFUN |FSPECF;weierstrassZeta;4F;20| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) |g2| |g3| |x| (QREFELT $ 53))) 

(SDEFUN |FSPECF;hypergeometricF;2L2F;21|
        ((|a| |List| F) (|b| |List| F) (|z| F) ($ F))
        (SPROG
         ((|q| (F)) (|p| (F)) (|nbi| #1=(|NonNegativeInteger|)) (|nai| #1#))
         (SEQ (LETT |nai| (LENGTH |a|) . #2=(|FSPECF;hypergeometricF;2L2F;21|))
              (LETT |nbi| (LENGTH |b|) . #2#)
              (COND
               ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
                (COND
                 ((SPADCALL |nai| (+ |nbi| 1) (QREFELT $ 65))
                  (EXIT (|spadConstant| $ 63))))))
              (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT $ 67)) . #2#)
              (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT $ 67)) . #2#)
              (EXIT
               (SPADCALL (QREFELT $ 33)
                         (SPADCALL
                          (SPADCALL |a|
                                    (SPADCALL |b| (LIST |z|) (QREFELT $ 69))
                                    (QREFELT $ 69))
                          (LIST |p| |q|) (QREFELT $ 69))
                         (QREFELT $ 71)))))) 

(SDEFUN |FSPECF;meijerG;4L2F;22|
        ((|a| |List| F) (|b| |List| F) (|c| |List| F) (|d| |List| F) (|z| F)
         ($ F))
        (SPROG ((|m2| (F)) (|m1| (F)) (|n2| (F)) (|n1| (F)))
               (SEQ
                (LETT |n1| (SPADCALL (LENGTH |a|) (QREFELT $ 67))
                      . #1=(|FSPECF;meijerG;4L2F;22|))
                (LETT |n2| (SPADCALL (LENGTH |b|) (QREFELT $ 67)) . #1#)
                (LETT |m1| (SPADCALL (LENGTH |c|) (QREFELT $ 67)) . #1#)
                (LETT |m2| (SPADCALL (LENGTH |d|) (QREFELT $ 67)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 34)
                           (SPADCALL
                            (SPADCALL |a|
                                      (SPADCALL |b|
                                                (SPADCALL |c|
                                                          (SPADCALL |d|
                                                                    (LIST |z|)
                                                                    (QREFELT $
                                                                             69))
                                                          (QREFELT $ 69))
                                                (QREFELT $ 69))
                                      (QREFELT $ 69))
                            (LIST |n1| |n2| |m1| |m2|) (QREFELT $ 69))
                           (QREFELT $ 71)))))) 

(SDEFUN |FSPECF;grad2|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d2| |Mapping| F F F) ($ F))
        (SPROG ((|dm| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ
                (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;grad2|))
                (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 87)) (QREFELT $ 88))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 89))
                            (SPADCALL (QREFELT $ 75)
                                      (LIST
                                       (SPADCALL |op| (LIST |dm| |x2|)
                                                 (QREFELT $ 71))
                                       |dm| |x1|)
                                      (QREFELT $ 90))
                            (QREFELT $ 91))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 89))
                            (SPADCALL |x1| |x2| |d2|) (QREFELT $ 91))
                  (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;grad3|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d3| |Mapping| F F F F) ($ F))
        (SPROG ((|dm2| (F)) (|dm1| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ
                (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;grad3|))
                (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (LETT |x3| (SPADCALL |l| 3 (QREFELT $ 86)) . #1#)
                (LETT |dm1| (SPADCALL (SPADCALL (QREFELT $ 87)) (QREFELT $ 88))
                      . #1#)
                (LETT |dm2| (SPADCALL (SPADCALL (QREFELT $ 87)) (QREFELT $ 88))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 89))
                             (SPADCALL (QREFELT $ 75)
                                       (LIST
                                        (SPADCALL |op| (LIST |dm1| |x2| |x3|)
                                                  (QREFELT $ 71))
                                        |dm1| |x1|)
                                       (QREFELT $ 90))
                             (QREFELT $ 91))
                   (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 89))
                             (SPADCALL (QREFELT $ 75)
                                       (LIST
                                        (SPADCALL |op| (LIST |x1| |dm2| |x3|)
                                                  (QREFELT $ 71))
                                        |dm2| |x2|)
                                       (QREFELT $ 90))
                             (QREFELT $ 91))
                   (QREFELT $ 92))
                  (SPADCALL (SPADCALL |x3| |t| (QREFELT $ 89))
                            (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT $ 91))
                  (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;whittakerM;4F;25| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 93) |k| |m| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eWhittakerM| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 93) (LIST |k| |m| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elWhittakerM| ((|l| |List| F) ($ F))
        (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eWhittakerMGrad_z| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 78) (SPADCALL |k| |z| (QREFELT $ 98))
                    (QREFELT $ 99))
          (SPADCALL |k| |m| |z| (QREFELT $ 94)) (QREFELT $ 91))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 78) |k| (QREFELT $ 92)) |m|
                    (QREFELT $ 92))
          (SPADCALL (SPADCALL |k| (|spadConstant| $ 63) (QREFELT $ 92)) |m| |z|
                    (QREFELT $ 94))
          (QREFELT $ 91))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dWhittakerM| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 93)
         (CONS (|function| |FSPECF;eWhittakerMGrad_z|) $) $)) 

(SDEFUN |FSPECF;whittakerW;4F;30| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 102) |k| |m| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eWhittakerW| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 102) (LIST |k| |m| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elWhittakerW| ((|l| |List| F) ($ F))
        (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eWhittakerWGrad_z| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 78) (SPADCALL |k| |z| (QREFELT $ 98))
                    (QREFELT $ 99))
          (SPADCALL |k| |m| |z| (QREFELT $ 103)) (QREFELT $ 91))
         (SPADCALL (SPADCALL |k| (|spadConstant| $ 63) (QREFELT $ 92)) |m| |z|
                   (QREFELT $ 103))
         (QREFELT $ 99))) 

(SDEFUN |FSPECF;dWhittakerW| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 102)
         (CONS (|function| |FSPECF;eWhittakerWGrad_z|) $) $)) 

(SDEFUN |FSPECF;angerJ;3F;35| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 104) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eAngerJ| ((|v| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 106)) (QREFELT $ 91))
                     (QREFELT $ 107))
           (SPADCALL |v| (SPADCALL (QREFELT $ 106)) (QREFELT $ 91))
           (QREFELT $ 98)))
         ('T (SPADCALL (QREFELT $ 104) (LIST |v| |z|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elAngerJ| ((|l| |List| F) ($ F))
        (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eAngerJGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 105))
           (QREFELT $ 108))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 105)) (QREFELT $ 91)) |z|
           (QREFELT $ 98))
          (QREFELT $ 92))
         (SPADCALL
          (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 106)) (QREFELT $ 91))
                    (QREFELT $ 107))
          (SPADCALL (SPADCALL (QREFELT $ 106)) |z| (QREFELT $ 91))
          (QREFELT $ 98))
         (QREFELT $ 99))) 

(SDEFUN |FSPECF;dAngerJ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 104)
         (CONS (|function| |FSPECF;eAngerJGrad_z|) $) $)) 

(SDEFUN |FSPECF;eeAngerJ| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 104) |l| (QREFELT $ 90))) 

(SDEFUN |FSPECF;weberE;3F;41| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 109) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eWeberE| ((|v| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (SPADCALL
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 78) |v| (QREFELT $ 91))
                                 (SPADCALL (QREFELT $ 106)) (QREFELT $ 91))
                       (QREFELT $ 107))
                      2 (QREFELT $ 111))
                     (QREFELT $ 83))
           (SPADCALL |v| (SPADCALL (QREFELT $ 106)) (QREFELT $ 91))
           (QREFELT $ 98)))
         ('T (SPADCALL (QREFELT $ 109) (LIST |v| |z|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elWeberE| ((|l| |List| F) ($ F))
        (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eWeberEGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 110))
           (QREFELT $ 108))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 110)) (QREFELT $ 91)) |z|
           (QREFELT $ 98))
          (QREFELT $ 92))
         (SPADCALL
          (SPADCALL (|spadConstant| $ 63)
                    (SPADCALL
                     (SPADCALL |v| (SPADCALL (QREFELT $ 106)) (QREFELT $ 91))
                     (QREFELT $ 114))
                    (QREFELT $ 99))
          (SPADCALL (SPADCALL (QREFELT $ 106)) |z| (QREFELT $ 91))
          (QREFELT $ 98))
         (QREFELT $ 99))) 

(SDEFUN |FSPECF;dWeberE| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 109)
         (CONS (|function| |FSPECF;eWeberEGrad_z|) $) $)) 

(SDEFUN |FSPECF;eeWeberE| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 109) |l| (QREFELT $ 90))) 

(SDEFUN |FSPECF;struveH;3F;47| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 115) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eStruveH| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 115) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elStruveH| ((|l| |List| F) ($ F))
        (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eStruveHGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 116))
           (QREFELT $ 108))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 116)) (QREFELT $ 91)) |z|
           (QREFELT $ 98))
          (QREFELT $ 92))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 78) |z| (QREFELT $ 91)) |v|
                    (QREFELT $ 117))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 106)) (QREFELT $ 118))
                    (SPADCALL (SPADCALL |v| (QREFELT $ 85) (QREFELT $ 92))
                              (QREFELT $ 37))
                    (QREFELT $ 91))
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dStruveH| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 115)
         (CONS (|function| |FSPECF;eStruveHGrad_z|) $) $)) 

(SDEFUN |FSPECF;struveL;3F;52| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 119) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eStruveL| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 119) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elStruveL| ((|l| |List| F) ($ F))
        (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eStruveLGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                    (QREFELT $ 120))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 120)) (QREFELT $ 91)) |z|
           (QREFELT $ 98))
          (QREFELT $ 92))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 78) |z| (QREFELT $ 91)) |v|
                    (QREFELT $ 117))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 106)) (QREFELT $ 118))
                    (SPADCALL (SPADCALL |v| (QREFELT $ 85) (QREFELT $ 92))
                              (QREFELT $ 37))
                    (QREFELT $ 91))
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dStruveL| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 119)
         (CONS (|function| |FSPECF;eStruveLGrad_z|) $) $)) 

(SDEFUN |FSPECF;hankelH1;3F;57| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 121) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eHankelH1| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 121) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elHankelH1| ((|l| |List| F) ($ F))
        (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eHankelH1Grad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                    (QREFELT $ 122))
          (QREFELT $ 108))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 122)) (QREFELT $ 91)) |z|
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dHankelH1| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 121)
         (CONS (|function| |FSPECF;eHankelH1Grad_z|) $) $)) 

(SDEFUN |FSPECF;hankelH2;3F;62| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 123) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eHankelH2| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 123) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elHankelH2| ((|l| |List| F) ($ F))
        (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eHankelH2Grad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                    (QREFELT $ 124))
          (QREFELT $ 108))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 124)) (QREFELT $ 91)) |z|
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dHankelH2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 123)
         (CONS (|function| |FSPECF;eHankelH2Grad_z|) $) $)) 

(SDEFUN |FSPECF;lommelS1;4F;67| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 125) |m| |v| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eLommelS1| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 125) (LIST |m| |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elLommelS1| ((|l| |List| F) ($ F))
        (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eLommelS1Grad_z| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 126)) (QREFELT $ 91))
           |z| (QREFELT $ 98))
          (QREFELT $ 108))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT $ 92)) (|spadConstant| $ 63)
                    (QREFELT $ 99))
          (SPADCALL (SPADCALL |m| (|spadConstant| $ 63) (QREFELT $ 99))
                    (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 99)) |z|
                    (QREFELT $ 126))
          (QREFELT $ 91))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dLommelS1| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 125)
         (CONS (|function| |FSPECF;eLommelS1Grad_z|) $) $)) 

(SDEFUN |FSPECF;lommelS2;4F;72| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 127) |mu| |nu| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eLommelS2| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 127) (LIST |mu| |nu| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elLommelS2| ((|l| |List| F) ($ F))
        (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eLommelS2Grad_z| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 128)) (QREFELT $ 91))
           |z| (QREFELT $ 98))
          (QREFELT $ 108))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT $ 92)) (|spadConstant| $ 63)
                    (QREFELT $ 99))
          (SPADCALL (SPADCALL |m| (|spadConstant| $ 63) (QREFELT $ 99))
                    (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 99)) |z|
                    (QREFELT $ 128))
          (QREFELT $ 91))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dLommelS2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 127)
         (CONS (|function| |FSPECF;eLommelS2Grad_z|) $) $)) 

(SDEFUN |FSPECF;kummerM;4F;77| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 129) |mu| |nu| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eKummerM| ((|a| F) (|b| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 63))
         ('T (SPADCALL (QREFELT $ 129) (LIST |a| |b| |z|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elKummerM| ((|l| |List| F) ($ F))
        (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eKummerMGrad_z| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT $ 92)) |b| (QREFELT $ 99))
           (SPADCALL |a| |b| |z| (QREFELT $ 130)) (QREFELT $ 91))
          (SPADCALL (SPADCALL |b| |a| (QREFELT $ 99))
                    (SPADCALL
                     (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 99)) |b|
                     |z| (QREFELT $ 130))
                    (QREFELT $ 91))
          (QREFELT $ 92))
         |z| (QREFELT $ 98))) 

(SDEFUN |FSPECF;dKummerM| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 129)
         (CONS (|function| |FSPECF;eKummerMGrad_z|) $) $)) 

(SDEFUN |FSPECF;kummerU;4F;82| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 131) |a| |b| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eKummerU| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 131) (LIST |a| |b| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elKummerU| ((|l| |List| F) ($ F))
        (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eKummerUGrad_z| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT $ 92)) |b| (QREFELT $ 99))
           (SPADCALL |a| |b| |z| (QREFELT $ 132)) (QREFELT $ 91))
          (SPADCALL (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 99)) |b| |z|
                    (QREFELT $ 132))
          (QREFELT $ 99))
         |z| (QREFELT $ 98))) 

(SDEFUN |FSPECF;dKummerU| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 131)
         (CONS (|function| |FSPECF;eKummerUGrad_z|) $) $)) 

(SDEFUN |FSPECF;legendreP;4F;87| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 133) |nu| |mu| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eLegendreP| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 133) (LIST |nu| |mu| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elLegendreP| ((|l| |List| F) ($ F))
        (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eLegendrePGrad_z| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 99)) (|spadConstant| $ 63)
                    (QREFELT $ 92))
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 92)) |mu|
                    |z| (QREFELT $ 134))
          (QREFELT $ 91))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                    (QREFELT $ 91))
          (SPADCALL |nu| |mu| |z| (QREFELT $ 134)) (QREFELT $ 91))
         (QREFELT $ 99))) 

(SDEFUN |FSPECF;dLegendreP| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 133)
         (CONS (|function| |FSPECF;eLegendrePGrad_z|) $) $)) 

(SDEFUN |FSPECF;legendreQ;4F;92| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 135) |nu| |mu| |z| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eLegendreQ| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 135) (LIST |nu| |mu| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elLegendreQ| ((|l| |List| F) ($ F))
        (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eLegendreQGrad_z| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 99)) (|spadConstant| $ 63)
                    (QREFELT $ 92))
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 92)) |mu|
                    |z| (QREFELT $ 136))
          (QREFELT $ 91))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                    (QREFELT $ 91))
          (SPADCALL |nu| |mu| |z| (QREFELT $ 136)) (QREFELT $ 91))
         (QREFELT $ 99))) 

(SDEFUN |FSPECF;dLegendreQ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 135)
         (CONS (|function| |FSPECF;eLegendreQGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinBei;3F;97| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 137) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eKelvinBei| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 137) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elKelvinBei| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eKelvinBeiGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 78)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 118))
                    (QREFELT $ 91))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 138))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 139))
           (QREFELT $ 99))
          (QREFELT $ 91))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 138)) (QREFELT $ 91)) |z|
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dKelvinBei| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 137)
         (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinBer;3F;102| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 140) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eKelvinBer| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 140) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elKelvinBer| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eKelvinBerGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 78)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 118))
                    (QREFELT $ 91))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 139))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 138))
           (QREFELT $ 92))
          (QREFELT $ 91))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 139)) (QREFELT $ 91)) |z|
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dKelvinBer| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 140)
         (CONS (|function| |FSPECF;eKelvinBerGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinKei;3F;107| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 141) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eKelvinKei| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 141) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elKelvinKei| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eKelvinKeiGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 78)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 118))
                    (QREFELT $ 91))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 142))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 143))
           (QREFELT $ 99))
          (QREFELT $ 91))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 142)) (QREFELT $ 91)) |z|
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dKelvinKei| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 141)
         (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinKer;3F;112| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 144) |v| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eKelvinKer| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 144) (LIST |v| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elKelvinKer| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eKelvinKerGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 78)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 118))
                    (QREFELT $ 91))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 143))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 92)) |z|
                     (QREFELT $ 142))
           (QREFELT $ 92))
          (QREFELT $ 91))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 143)) (QREFELT $ 91)) |z|
          (QREFELT $ 98))
         (QREFELT $ 92))) 

(SDEFUN |FSPECF;dKelvinKer| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 144)
         (CONS (|function| |FSPECF;eKelvinKerGrad_z|) $) $)) 

(SDEFUN |FSPECF;ellipticK;2F;117| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 145) |m| (QREFELT $ 35))) 

(SDEFUN |FSPECF;eEllipticK| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 145) (LIST |m|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elEllipticK| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;dEllipticK| ((|m| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 78)
                   (SPADCALL (SPADCALL |m| (QREFELT $ 147))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 63) |m|
                                        (QREFELT $ 99))
                              (SPADCALL |m| (QREFELT $ 146)) (QREFELT $ 91))
                             (QREFELT $ 99))
                   (QREFELT $ 91))
         (SPADCALL |m| (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 99))
                   (QREFELT $ 91))
         (QREFELT $ 98))) 

(SDEFUN |FSPECF;ellipticE;2F;121| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 152) |m| (QREFELT $ 35))) 

(SDEFUN |FSPECF;eEllipticE| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 152) (LIST |m|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elEllipticE| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;dEllipticE| ((|m| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 78)
                   (SPADCALL (SPADCALL |m| (QREFELT $ 147))
                             (SPADCALL |m| (QREFELT $ 146)) (QREFELT $ 99))
                   (QREFELT $ 91))
         |m| (QREFELT $ 98))) 

(SDEFUN |FSPECF;ellipticE;3F;125| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 153) |z| |m| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eEllipticE2| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 59))
         ((SPADCALL |z| (|spadConstant| $ 63) (QREFELT $ 61))
          (|FSPECF;eEllipticE| |m| $))
         ('T (SPADCALL (QREFELT $ 153) (LIST |z| |m|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elEllipticE2| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eEllipticE2Grad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eEllipticE2Grad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 155))
                                       (QREFELT $ 91))
                             (QREFELT $ 99))
                   (QREFELT $ 118))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |z| 2 (QREFELT $ 155)) (QREFELT $ 99))
                   (QREFELT $ 118))
                  (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;eEllipticE2Grad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eEllipticE2Grad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 78)
                            (SPADCALL (SPADCALL |z| |m| (QREFELT $ 154))
                                      (SPADCALL |z| |m| (QREFELT $ 156))
                                      (QREFELT $ 99))
                            (QREFELT $ 91))
                  |m| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;inEllipticE2| ((|li| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT $ 160)) |li|)
                  (QREFELT $ 161))) 

(SDEFUN |FSPECF;ellipticF;3F;131| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 164) |z| |m| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eEllipticF| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 59))
         ((SPADCALL |z| (|spadConstant| $ 63) (QREFELT $ 61))
          (SPADCALL |m| (QREFELT $ 146)))
         ('T (SPADCALL (QREFELT $ 164) (LIST |z| |m|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elEllipticF| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eEllipticFGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eEllipticFGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 63)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 63)
                                       (SPADCALL |m|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 155))
                                                 (QREFELT $ 91))
                                       (QREFELT $ 99))
                             (QREFELT $ 118))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 63)
                                       (SPADCALL |z| 2 (QREFELT $ 155))
                                       (QREFELT $ 99))
                             (QREFELT $ 118))
                            (QREFELT $ 91))
                           (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;eEllipticFGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eEllipticFGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 78)
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 154))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 63) |m|
                                                   (QREFELT $ 99))
                                         (SPADCALL |z| |m| (QREFELT $ 156))
                                         (QREFELT $ 91))
                                        (QREFELT $ 99))
                              |m| (QREFELT $ 98))
                             (SPADCALL
                              (SPADCALL |z|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 63)
                                                   (SPADCALL |z| 2
                                                             (QREFELT $ 155))
                                                   (QREFELT $ 99))
                                         (QREFELT $ 118))
                                        (QREFELT $ 91))
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 63)
                                         (SPADCALL |m|
                                                   (SPADCALL |z| 2
                                                             (QREFELT $ 155))
                                                   (QREFELT $ 91))
                                         (QREFELT $ 99))
                               (QREFELT $ 118))
                              (QREFELT $ 98))
                             (QREFELT $ 99))
                            (QREFELT $ 91))
                  (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 99))
                  (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;ellipticPi;4F;136| ((|z| F) (|n| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 165) |z| |n| |m| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eEllipticPi| ((|z| F) (|n| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 59))
         ('T (SPADCALL (QREFELT $ 165) (LIST |z| |n| |m|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elEllipticPi| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eEllipticPiGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eEllipticPiGrad_z|))
                (LETT |n| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (LETT |m| (SPADCALL |l| 3 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 63)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 63)
                                       (SPADCALL |n|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 155))
                                                 (QREFELT $ 91))
                                       (QREFELT $ 99))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 63)
                                        (SPADCALL |m|
                                                  (SPADCALL |z| 2
                                                            (QREFELT $ 155))
                                                  (QREFELT $ 91))
                                        (QREFELT $ 99))
                              (QREFELT $ 118))
                             (QREFELT $ 91))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 63)
                                       (SPADCALL |z| 2 (QREFELT $ 155))
                                       (QREFELT $ 99))
                             (QREFELT $ 118))
                            (QREFELT $ 91))
                           (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_n| ((|l| |List| F) ($ F))
        (SPROG
         ((|t4| (F)) (|t3| (F)) (|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F))
          (|z| (F)))
         (SEQ
          (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                . #1=(|FSPECF;eEllipticPiGrad_n|))
          (LETT |n| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
          (LETT |m| (SPADCALL |l| 3 (QREFELT $ 86)) . #1#)
          (LETT |t1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |n| 2 (QREFELT $ 155)) |m|
                             (QREFELT $ 99))
                   (SPADCALL |z| |n| |m| (QREFELT $ 166)) (QREFELT $ 91))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                    (SPADCALL |n| |m| (QREFELT $ 99)) (QREFELT $ 91))
                   |n| (QREFELT $ 91))
                  (QREFELT $ 98))
                 (QREFELT $ 108))
                . #1#)
          (LETT |t2|
                (SPADCALL (SPADCALL |z| |m| (QREFELT $ 156))
                          (SPADCALL
                           (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                           |n| (QREFELT $ 91))
                          (QREFELT $ 98))
                . #1#)
          (LETT |t3|
                (SPADCALL
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 154))
                           (SPADCALL
                            (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                            (SPADCALL |n| |m| (QREFELT $ 99)) (QREFELT $ 91))
                           (QREFELT $ 98))
                 (QREFELT $ 108))
                . #1#)
          (LETT |t4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |n| |z| (QREFELT $ 91))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 63)
                                       (SPADCALL |m|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 155))
                                                 (QREFELT $ 91))
                                       (QREFELT $ 99))
                             (QREFELT $ 118))
                            (QREFELT $ 91))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |z| 2 (QREFELT $ 155)) (QREFELT $ 99))
                   (QREFELT $ 118))
                  (QREFELT $ 91))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |n| (SPADCALL |z| 2 (QREFELT $ 155))
                                       (QREFELT $ 91))
                             (QREFELT $ 99))
                   (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                   (QREFELT $ 91))
                  (SPADCALL |n| |m| (QREFELT $ 99)) (QREFELT $ 91))
                 (QREFELT $ 98))
                . #1#)
          (EXIT
           (SPADCALL (QREFELT $ 78)
                     (SPADCALL
                      (SPADCALL (SPADCALL |t1| |t2| (QREFELT $ 92)) |t3|
                                (QREFELT $ 92))
                      |t4| (QREFELT $ 92))
                     (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eEllipticPiGrad_m|))
                (LETT |n| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (LETT |m| (SPADCALL |l| 3 (QREFELT $ 86)) . #1#)
                (LETT |t1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |m| |z| (QREFELT $ 91))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 63)
                                            (SPADCALL |z| 2 (QREFELT $ 155))
                                            (QREFELT $ 99))
                                  (QREFELT $ 118))
                                 (QREFELT $ 91))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 63)
                                  (SPADCALL |m|
                                            (SPADCALL |z| 2 (QREFELT $ 155))
                                            (QREFELT $ 91))
                                  (QREFELT $ 99))
                        (QREFELT $ 118))
                       (QREFELT $ 98))
                      . #1#)
                (LETT |t2|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| |m| (QREFELT $ 154))
                                  (QREFELT $ 108))
                        |t1| (QREFELT $ 92))
                       (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 99))
                       (QREFELT $ 98))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 78)
                            (SPADCALL (SPADCALL |z| |n| |m| (QREFELT $ 166))
                                      |t2| (QREFELT $ 92))
                            (QREFELT $ 91))
                  (SPADCALL |n| |m| (QREFELT $ 99)) (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;jacobiSn;3F;142| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 167) |z| |m| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eJacobiSn| ((|z| F) (|m| F) ($ F))
        (SPROG ((#1=#:G484 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
                   (|spadConstant| $ 59))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |z| (QREFELT $ 164) (QREFELT $ 169))
                      (SEQ
                       (LETT |args|
                             (SPADCALL (SPADCALL |z| (QREFELT $ 171))
                                       (QREFELT $ 173))
                             . #2=(|FSPECF;eJacobiSn|))
                       (EXIT
                        (COND
                         ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT $ 86))
                                    (QREFELT $ 61))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 1 (QREFELT $ 86)) . #2#)
                           (GO #1#))))))))
                    (EXIT
                     (SPADCALL (QREFELT $ 167) (LIST |z| |m|)
                               (QREFELT $ 90)))))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;elJacobiSn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;jacobiGradHelper| ((|z| F) (|m| F) ($ F))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT $ 168)) |m|
                              (QREFELT $ 154))
                    (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 99))
                    (QREFELT $ 98))
                   (QREFELT $ 99))
         |m| (QREFELT $ 98))) 

(SDEFUN |FSPECF;eJacobiSnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiSnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 174))
                           (SPADCALL |z| |m| (QREFELT $ 175))
                           (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;eJacobiSnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiSnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 78)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 91))
                            (SPADCALL
                             (SPADCALL (SPADCALL |z| |m| (QREFELT $ 168))
                                       (SPADCALL
                                        (SPADCALL |z| |m| (QREFELT $ 174)) 2
                                        (QREFELT $ 111))
                                       (QREFELT $ 91))
                             (SPADCALL (|spadConstant| $ 63) |m|
                                       (QREFELT $ 99))
                             (QREFELT $ 98))
                            (QREFELT $ 92))
                           (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;jacobiCn;3F;148| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 176) |z| |m| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eJacobiCn| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 63))
         ('T (SPADCALL (QREFELT $ 176) (LIST |z| |m|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elJacobiCn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eJacobiCnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiCnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| |m| (QREFELT $ 168))
                            (SPADCALL |z| |m| (QREFELT $ 175)) (QREFELT $ 91))
                  (QREFELT $ 108)))))) 

(SDEFUN |FSPECF;eJacobiCnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiCnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 78)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 91))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 168)) 2
                                        (QREFELT $ 111))
                              (SPADCALL |z| |m| (QREFELT $ 174))
                              (QREFELT $ 91))
                             (SPADCALL (|spadConstant| $ 63) |m|
                                       (QREFELT $ 99))
                             (QREFELT $ 98))
                            (QREFELT $ 99))
                           (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;jacobiDn;3F;153| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 177) |z| |m| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eJacobiDn| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 63))
         ('T (SPADCALL (QREFELT $ 177) (LIST |z| |m|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elJacobiDn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eJacobiDnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiDnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 168))
                             (QREFELT $ 91))
                   (SPADCALL |z| |m| (QREFELT $ 174)) (QREFELT $ 91))
                  (QREFELT $ 108)))))) 

(SDEFUN |FSPECF;eJacobiDnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiDnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 78)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 91))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 168)) 2
                                        (QREFELT $ 111))
                              (SPADCALL |z| |m| (QREFELT $ 175))
                              (QREFELT $ 91))
                             (SPADCALL (|spadConstant| $ 63) |m|
                                       (QREFELT $ 99))
                             (QREFELT $ 98))
                            (QREFELT $ 99))
                           (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;jacobiZeta;3F;158| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 178) |z| |m| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eJacobiZeta| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 59))
         ('T (SPADCALL (QREFELT $ 178) (LIST |z| |m|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elJacobiZeta| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;eJacobiZetaGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|dn| (F)) (|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;eJacobiZetaGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 175)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 91))
                           (SPADCALL (SPADCALL |m| (QREFELT $ 147))
                                     (SPADCALL |m| (QREFELT $ 146))
                                     (QREFELT $ 98))
                           (QREFELT $ 99)))))) 

(SDEFUN |FSPECF;eJacobiZetaGrad_m| ((|l| |List| F) ($ F))
        (SPROG
         ((|res4| (F)) (|res3| (F)) (|res2| (F)) (|res1| (F)) (|dn| (F))
          (|er| (F)) (|ee| (F)) (|ek| (F)) (|m| (F)) (|z| (F)))
         (SEQ
          (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                . #1=(|FSPECF;eJacobiZetaGrad_m|))
          (LETT |m| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
          (LETT |ek| (SPADCALL |m| (QREFELT $ 146)) . #1#)
          (LETT |ee| (SPADCALL |m| (QREFELT $ 147)) . #1#)
          (LETT |er| (SPADCALL |ee| |ek| (QREFELT $ 98)) . #1#)
          (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 175)) . #1#)
          (LETT |res1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 91)) |m|
                            (QREFELT $ 92))
                  (|spadConstant| $ 63) (QREFELT $ 99))
                 (SPADCALL |z| |m| (QREFELT $ 179)) (QREFELT $ 91))
                . #1#)
          (LETT |res2|
                (SPADCALL |res1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |m| (|spadConstant| $ 63)
                                       (QREFELT $ 99))
                             |z| (QREFELT $ 91))
                            |dn| (QREFELT $ 91))
                           |dn| (QREFELT $ 91))
                          (QREFELT $ 92))
                . #1#)
          (LETT |res3|
                (SPADCALL |res2|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 174))
                                      (QREFELT $ 91))
                            (SPADCALL |z| |m| (QREFELT $ 175)) (QREFELT $ 91))
                           (SPADCALL |z| |m| (QREFELT $ 168)) (QREFELT $ 91))
                          (QREFELT $ 99))
                . #1#)
          (LETT |res4|
                (SPADCALL |res3|
                          (SPADCALL
                           (SPADCALL |z|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 63) |m|
                                                (QREFELT $ 99))
                                      (SPADCALL |dn| |dn| (QREFELT $ 91))
                                      (QREFELT $ 92))
                                     (QREFELT $ 91))
                           |er| (QREFELT $ 91))
                          (QREFELT $ 92))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 78)
                      (SPADCALL |res4|
                                (SPADCALL (SPADCALL |z| |er| (QREFELT $ 91))
                                          |er| (QREFELT $ 91))
                                (QREFELT $ 99))
                      (QREFELT $ 91))
            (SPADCALL (SPADCALL |m| |m| (QREFELT $ 91)) |m| (QREFELT $ 99))
            (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;jacobiTheta;3F;163| ((|q| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 180) |q| |z| (QREFELT $ 38))) 

(SDEFUN |FSPECF;eJacobiTheta| ((|q| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 180) (LIST |q| |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elJacobiTheta| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;lerchPhi;4F;166| ((|z| F) (|s| F) (|a| F) ($ F))
        (SPADCALL (QREFELT $ 182) |z| |s| |a| (QREFELT $ 53))) 

(SDEFUN |FSPECF;eLerchPhi| ((|z| F) (|s| F) (|a| F) ($ F))
        (COND
         ((SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 61))
          (SPADCALL (SPADCALL |s| |z| (QREFELT $ 52)) |z| (QREFELT $ 98)))
         ('T (SPADCALL (QREFELT $ 182) (LIST |z| |s| |a|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;elLerchPhi| ((|l| |List| F) ($ F))
        (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT $ 86))
         (SPADCALL |l| 2 (QREFELT $ 86)) (SPADCALL |l| 3 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;dLerchPhi| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|dm| (F)) (|da| (F)) (|dz| (F)) (|a| (F)) (|s| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 86))
                      . #1=(|FSPECF;dLerchPhi|))
                (LETT |s| (SPADCALL |l| 2 (QREFELT $ 86)) . #1#)
                (LETT |a| (SPADCALL |l| 3 (QREFELT $ 86)) . #1#)
                (LETT |dz|
                      (SPADCALL
                       (SPADCALL (SPADCALL |z| |t| (QREFELT $ 89))
                                 (SPADCALL
                                  (SPADCALL |z|
                                            (SPADCALL |s| (|spadConstant| $ 63)
                                                      (QREFELT $ 99))
                                            |a| (QREFELT $ 183))
                                  (SPADCALL |a|
                                            (SPADCALL |z| |s| |a|
                                                      (QREFELT $ 183))
                                            (QREFELT $ 91))
                                  (QREFELT $ 99))
                                 (QREFELT $ 91))
                       |z| (QREFELT $ 98))
                      . #1#)
                (LETT |da|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |a| |t| (QREFELT $ 89)) |s|
                                  (QREFELT $ 91))
                        (SPADCALL |z|
                                  (SPADCALL |s| (|spadConstant| $ 63)
                                            (QREFELT $ 92))
                                  |a| (QREFELT $ 183))
                        (QREFELT $ 91))
                       (QREFELT $ 108))
                      . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 87)) (QREFELT $ 88))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |s| |t| (QREFELT $ 89))
                             (SPADCALL (QREFELT $ 75)
                                       (LIST
                                        (SPADCALL (QREFELT $ 182)
                                                  (LIST |z| |dm| |a|)
                                                  (QREFELT $ 71))
                                        |dm| |s|)
                                       (QREFELT $ 90))
                             (QREFELT $ 91))
                   |dz| (QREFELT $ 92))
                  |da| (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;riemannZeta;2F;170| ((|z| F) ($ F))
        (SPADCALL (QREFELT $ 184) |z| (QREFELT $ 35))) 

(SDEFUN |FSPECF;eRiemannZeta| ((|z| F) ($ F))
        (SPADCALL (QREFELT $ 184) (LIST |z|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;elRiemannZeta| ((|l| |List| F) ($ F))
        (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT $ 86)) $)) 

(SDEFUN |FSPECF;belong?;BoB;173| ((|op| |BasicOperator|) ($ |Boolean|))
        (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 186))) 

(SDEFUN |FSPECF;operator;2Bo;174| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|abs| (QREFELT $ 188)) (QREFELT $ 13))
              ((SPADCALL |op| '|Gamma| (QREFELT $ 188)) (QREFELT $ 14))
              ((SPADCALL |op| '|Gamma2| (QREFELT $ 188)) (QREFELT $ 15))
              ((SPADCALL |op| '|Beta| (QREFELT $ 188)) (QREFELT $ 16))
              ((SPADCALL |op| '|digamma| (QREFELT $ 188)) (QREFELT $ 17))
              ((SPADCALL |op| '|polygamma| (QREFELT $ 188)) (QREFELT $ 18))
              ((SPADCALL |op| '|besselJ| (QREFELT $ 188)) (QREFELT $ 19))
              ((SPADCALL |op| '|besselY| (QREFELT $ 188)) (QREFELT $ 20))
              ((SPADCALL |op| '|besselI| (QREFELT $ 188)) (QREFELT $ 21))
              ((SPADCALL |op| '|besselK| (QREFELT $ 188)) (QREFELT $ 22))
              ((SPADCALL |op| '|airyAi| (QREFELT $ 188)) (QREFELT $ 23))
              ((SPADCALL |op| '|airyAiPrime| (QREFELT $ 188)) (QREFELT $ 24))
              ((SPADCALL |op| '|airyBi| (QREFELT $ 188)) (QREFELT $ 25))
              ((SPADCALL |op| '|airyBiPrime| (QREFELT $ 188)) (QREFELT $ 26))
              ((SPADCALL |op| '|lambertW| (QREFELT $ 188)) (QREFELT $ 27))
              ((SPADCALL |op| '|polylog| (QREFELT $ 188)) (QREFELT $ 28))
              ((SPADCALL |op| '|weierstrassP| (QREFELT $ 188)) (QREFELT $ 29))
              ((SPADCALL |op| '|weierstrassPPrime| (QREFELT $ 188))
               (QREFELT $ 30))
              ((SPADCALL |op| '|weierstrassSigma| (QREFELT $ 188))
               (QREFELT $ 31))
              ((SPADCALL |op| '|weierstrassZeta| (QREFELT $ 188))
               (QREFELT $ 32))
              ((SPADCALL |op| '|hypergeometricF| (QREFELT $ 188))
               (QREFELT $ 33))
              ((SPADCALL |op| '|meijerG| (QREFELT $ 188)) (QREFELT $ 34))
              ((SPADCALL |op| '|whittakerM| (QREFELT $ 188)) (QREFELT $ 93))
              ((SPADCALL |op| '|whittakerW| (QREFELT $ 188)) (QREFELT $ 102))
              ((SPADCALL |op| '|angerJ| (QREFELT $ 188)) (QREFELT $ 104))
              ((SPADCALL |op| '|weberE| (QREFELT $ 188)) (QREFELT $ 109))
              ((SPADCALL |op| '|struveH| (QREFELT $ 188)) (QREFELT $ 115))
              ((SPADCALL |op| '|struveL| (QREFELT $ 188)) (QREFELT $ 119))
              ((SPADCALL |op| '|hankelH1| (QREFELT $ 188)) (QREFELT $ 121))
              ((SPADCALL |op| '|hankelH2| (QREFELT $ 188)) (QREFELT $ 123))
              ((SPADCALL |op| '|lommelS1| (QREFELT $ 188)) (QREFELT $ 125))
              ((SPADCALL |op| '|lommelS2| (QREFELT $ 188)) (QREFELT $ 127))
              ((SPADCALL |op| '|kummerM| (QREFELT $ 188)) (QREFELT $ 129))
              ((SPADCALL |op| '|kummerU| (QREFELT $ 188)) (QREFELT $ 131))
              ((SPADCALL |op| '|legendreP| (QREFELT $ 188)) (QREFELT $ 133))
              ((SPADCALL |op| '|legendreQ| (QREFELT $ 188)) (QREFELT $ 135))
              ((SPADCALL |op| '|kelvinBei| (QREFELT $ 188)) (QREFELT $ 137))
              ((SPADCALL |op| '|kelvinBer| (QREFELT $ 188)) (QREFELT $ 140))
              ((SPADCALL |op| '|kelvinKei| (QREFELT $ 188)) (QREFELT $ 141))
              ((SPADCALL |op| '|kelvinKer| (QREFELT $ 188)) (QREFELT $ 144))
              ((SPADCALL |op| '|ellipticK| (QREFELT $ 188)) (QREFELT $ 145))
              ((SPADCALL |op| '|ellipticE| (QREFELT $ 188)) (QREFELT $ 152))
              ((SPADCALL |op| '|ellipticE2| (QREFELT $ 188)) (QREFELT $ 153))
              ((SPADCALL |op| '|ellipticF| (QREFELT $ 188)) (QREFELT $ 164))
              ((SPADCALL |op| '|ellipticPi| (QREFELT $ 188)) (QREFELT $ 165))
              ((SPADCALL |op| '|jacobiSn| (QREFELT $ 188)) (QREFELT $ 167))
              ((SPADCALL |op| '|jacobiCn| (QREFELT $ 188)) (QREFELT $ 176))
              ((SPADCALL |op| '|jacobiDn| (QREFELT $ 188)) (QREFELT $ 177))
              ((SPADCALL |op| '|jacobiZeta| (QREFELT $ 188)) (QREFELT $ 178))
              ((SPADCALL |op| '|jacobiTheta| (QREFELT $ 188)) (QREFELT $ 180))
              ((SPADCALL |op| '|lerchPhi| (QREFELT $ 188)) (QREFELT $ 182))
              ((SPADCALL |op| '|riemannZeta| (QREFELT $ 188)) (QREFELT $ 184))
              ('T (|error| "Not a special operator")))) 

(SDEFUN |FSPECF;iGamma| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (|spadConstant| $ 63) (QREFELT $ 61)) |x|)
              ('T (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iabs| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 191)) (|spadConstant| $ 59))
              ((SPADCALL |x| (QREFELT $ 13) (QREFELT $ 169)) |x|)
              ((SPADCALL |x| (|spadConstant| $ 59) (QREFELT $ 192))
               (SPADCALL (QREFELT $ 13) (SPADCALL |x| (QREFELT $ 108))
                         (QREFELT $ 190)))
              ('T (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iBeta| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 16) (LIST |x| |y|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;idigamma| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 190))) 

(SDEFUN |FSPECF;iiipolygamma| ((|n| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) (LIST |n| |x|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iiiBesselJ| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 19) (LIST |x| |y|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iiiBesselY| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 20) (LIST |x| |y|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iiiBesselI| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 21) (LIST |x| |y|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iiiBesselK| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 22) (LIST |x| |y|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iAiryAi;2F;184| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 191))
          (SPADCALL (|spadConstant| $ 63)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 84)
                               (QREFELT $ 117))
                     (SPADCALL (QREFELT $ 84) (QREFELT $ 37)) (QREFELT $ 91))
                    (QREFELT $ 98)))
         ('T (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;185| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 191))
          (SPADCALL
           (SPADCALL (|spadConstant| $ 63)
                     (SPADCALL
                      (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 79)
                                (QREFELT $ 117))
                      (SPADCALL (QREFELT $ 79) (QREFELT $ 37)) (QREFELT $ 91))
                     (QREFELT $ 98))
           (QREFELT $ 108)))
         ('T (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iAiryBi;2F;186| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 191))
          (SPADCALL (|spadConstant| $ 63)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 81)
                               (QREFELT $ 117))
                     (SPADCALL (QREFELT $ 84) (QREFELT $ 37)) (QREFELT $ 91))
                    (QREFELT $ 98)))
         ('T (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;187| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 191))
          (SPADCALL
           (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 81)
                     (QREFELT $ 117))
           (SPADCALL (QREFELT $ 79) (QREFELT $ 37)) (QREFELT $ 98)))
         ('T (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iAiryAi;2F;188| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 190))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;189| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 190))) 

(SDEFUN |FSPECF;iAiryBi;2F;190| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 190))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;191| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 190))) 

(SDEFUN |FSPECF;iLambertW;2F;192| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 191)) (|spadConstant| $ 59))
              ((SPADCALL |x| (SPADCALL (|spadConstant| $ 63) (QREFELT $ 197))
                         (QREFELT $ 61))
               (|spadConstant| $ 63))
              ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iLambertW;2F;193| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 191)) (|spadConstant| $ 59))
              ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 190))))) 

(SDEFUN |FSPECF;iiPolylog;3F;194| ((|s| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |s| (|spadConstant| $ 63) (QREFELT $ 61))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 99))
                     (QREFELT $ 199))
           (QREFELT $ 108)))
         ((SPADCALL |s| (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 61))
          (SPADCALL (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 99))
                    (QREFELT $ 200)))
         ('T (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;iiPolylog;3F;195| ((|s| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |s| (|spadConstant| $ 63) (QREFELT $ 61))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 99))
                     (QREFELT $ 199))
           (QREFELT $ 108)))
         ('T (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;iiPolylog;3F;196| ((|s| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iPolylog| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
                  (QREFELT $ 201))) 

(SDEFUN |FSPECF;iWeierstrassP| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) (LIST |g2| |g3| |x|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iWeierstrassPPrime| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) (LIST |g2| |g3| |x|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iWeierstrassSigma| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 59) (QREFELT $ 61))
          (|spadConstant| $ 59))
         ('T (SPADCALL (QREFELT $ 31) (LIST |g2| |g3| |x|) (QREFELT $ 90))))) 

(SDEFUN |FSPECF;iWeierstrassZeta| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) (LIST |g2| |g3| |x|) (QREFELT $ 90))) 

(SDEFUN |FSPECF;iiabs;2F;202| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G695 NIL) (|b| #2=(|Union| R "failed")) (|a| #2#)
          (|f| (|Fraction| (|Polynomial| R)))
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ
          (LETT |r| (SPADCALL |x| (QREFELT $ 204))
                . #3=(|FSPECF;iiabs;2F;202|))
          (EXIT
           (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| $))
                 (#4='T
                  (SEQ
                   (EXIT
                    (SEQ (LETT |f| (QCDR |r|) . #3#)
                         (SEQ
                          (LETT |a|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 207))
                                          (QREFELT $ 209))
                                . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |a| 1)
                             (PROGN
                              (LETT #1# (|FSPECF;iabs| |x| $) . #3#)
                              (GO #1#)))
                            (#4#
                             (SEQ
                              (LETT |b|
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 210))
                                              (QREFELT $ 209))
                                    . #3#)
                              (EXIT
                               (COND
                                ((QEQCAR |b| 1)
                                 (PROGN
                                  (LETT #1# (|FSPECF;iabs| |x| $) . #3#)
                                  (GO #1#))))))))))
                         (EXIT
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 211))
                                     (QREFELT $ 212))
                           (SPADCALL (SPADCALL (QCDR |b|) (QREFELT $ 211))
                                     (QREFELT $ 212))
                           (QREFELT $ 98)))))
                   #1# (EXIT #1#)))))))) 

(SDEFUN |FSPECF;iiabs;2F;203| ((|x| F) ($ F)) (|FSPECF;iabs| |x| $)) 

(SDEFUN |FSPECF;iiGamma;2F;204| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 214))
                      |FSPECF;iiGamma;2F;204|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 215))
                                  (QREFELT $ 212)))))))) 

(SDEFUN |FSPECF;iiBeta;LF;205| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G709 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 214))
                         . #3=(|FSPECF;iiBeta;LF;205|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iBeta| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 202)) $)
                             . #3#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 202))
                                       (QREFELT $ 214))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iBeta| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 202)) $)
                                 . #3#)
                           (GO #1#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 217))
                             (QREFELT $ 212)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iidigamma;2F;206| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 214))
                      |FSPECF;iidigamma;2F;206|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 219))
                                  (QREFELT $ 212)))))))) 

(SDEFUN |FSPECF;iipolygamma;LF;207| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G721 NIL) (|r| #2=(|Union| R "failed")) (|s| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 214))
                         . #3=(|FSPECF;iipolygamma;LF;207|))
                   (EXIT
                    (COND
                     ((QEQCAR |s| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 202)) $)
                             . #3#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT |r|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 202))
                                       (QREFELT $ 214))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 202)) $)
                                 . #3#)
                           (GO #1#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT $ 221))
                             (QREFELT $ 212)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselJ;LF;208| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G728 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 214))
                         . #3=(|FSPECF;iiBesselJ;LF;208|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 202)) $)
                             . #3#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 202))
                                       (QREFELT $ 214))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 202)) $)
                                 . #3#)
                           (GO #1#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 223))
                             (QREFELT $ 212)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselY;LF;209| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G735 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 214))
                         . #3=(|FSPECF;iiBesselY;LF;209|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 202)) $)
                             . #3#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 202))
                                       (QREFELT $ 214))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 202)) $)
                                 . #3#)
                           (GO #1#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 225))
                             (QREFELT $ 212)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselI;LF;210| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G742 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 214))
                         . #3=(|FSPECF;iiBesselI;LF;210|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 202)) $)
                             . #3#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 202))
                                       (QREFELT $ 214))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 202)) $)
                                 . #3#)
                           (GO #1#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 227))
                             (QREFELT $ 212)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselK;LF;211| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G749 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 214))
                         . #3=(|FSPECF;iiBesselK;LF;211|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 202)) $)
                             . #3#)
                       (GO #1#)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 202))
                                       (QREFELT $ 214))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 202)) $)
                                 . #3#)
                           (GO #1#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 229))
                             (QREFELT $ 212)))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiAiryAi;2F;212| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 214))
                      |FSPECF;iiAiryAi;2F;212|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 193)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 231))
                                  (QREFELT $ 212)))))))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;213| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 214))
                      |FSPECF;iiAiryAiPrime;2F;213|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 194)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 233))
                                  (QREFELT $ 212)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;214| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 214))
                      |FSPECF;iiAiryBi;2F;214|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 195)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 235))
                                  (QREFELT $ 212)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;215| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 214))
                      |FSPECF;iiAiryBi;2F;215|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 196)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 237))
                                  (QREFELT $ 212)))))))) 

(SDEFUN |FSPECF;iiGamma;2F;216| ((|x| F) ($ F))
        (SPROG ((#1=#:G775 NIL) (|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL |x| (QREFELT $ 239))
                         . #2=(|FSPECF;iiGamma;2F;216|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 0)
                      (COND
                       ((>= (QCDR |r|) 1)
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (- (QCDR |r|) 1) (QREFELT $ 240))
                                (QREFELT $ 67))
                               . #2#)
                         (GO #1#))))))))
                  (EXIT (|FSPECF;iGamma| |x| $))))
                #1# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiGamma;2F;217| ((|x| F) ($ F)) (|FSPECF;iGamma| |x| $)) 

(SDEFUN |FSPECF;iiBeta;LF;218| ((|l| |List| F) ($ F))
        (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202)) $)) 

(SDEFUN |FSPECF;iidigamma;2F;219| ((|x| F) ($ F)) (|FSPECF;idigamma| |x| $)) 

(SDEFUN |FSPECF;iipolygamma;LF;220| ((|l| |List| F) ($ F))
        (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
         $)) 

(SDEFUN |FSPECF;iiBesselJ;LF;221| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
         $)) 

(SDEFUN |FSPECF;iiBesselY;LF;222| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
         $)) 

(SDEFUN |FSPECF;iiBesselI;LF;223| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
         $)) 

(SDEFUN |FSPECF;iiBesselK;LF;224| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
         $)) 

(SDEFUN |FSPECF;iiAiryAi;2F;225| ((|x| F) ($ F)) (SPADCALL |x| (QREFELT $ 193))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;226| ((|x| F) ($ F))
        (SPADCALL |x| (QREFELT $ 194))) 

(SDEFUN |FSPECF;iiAiryBi;2F;227| ((|x| F) ($ F)) (SPADCALL |x| (QREFELT $ 195))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;228| ((|x| F) ($ F))
        (SPADCALL |x| (QREFELT $ 196))) 

(SDEFUN |FSPECF;iiWeierstrassP| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassP| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 202)) (SPADCALL |l| (QREFELT $ 242)) $)) 

(SDEFUN |FSPECF;iiWeierstrassPPrime| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 202)) (SPADCALL |l| (QREFELT $ 242)) $)) 

(SDEFUN |FSPECF;iiWeierstrassSigma| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 202)) (SPADCALL |l| (QREFELT $ 242)) $)) 

(SDEFUN |FSPECF;iiWeierstrassZeta| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 202)) (SPADCALL |l| (QREFELT $ 242)) $)) 

(SDEFUN |FSPECF;diff1| ((|op| |BasicOperator|) (|n| F) (|x| F) ($ F))
        (SPROG ((|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 87)) (QREFELT $ 88))
                      |FSPECF;diff1|)
                (EXIT
                 (SPADCALL (QREFELT $ 75)
                           (LIST (SPADCALL |op| (LIST |dm| |x|) (QREFELT $ 71))
                                 |dm| |n|)
                           (QREFELT $ 90)))))) 

(SDEFUN |FSPECF;iBesselJ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselJ|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 89))
                                (|FSPECF;diff1| (QREFELT $ 19) |n| |x| $)
                                (QREFELT $ 91))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 89))
                                 (QREFELT $ 78) (QREFELT $ 91))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                         |x| (QREFELT $ 43))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 92))
                         |x| (QREFELT $ 43))
                        (QREFELT $ 99))
                       (QREFELT $ 91))
                      (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;iBesselY| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselY|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 89))
                                (|FSPECF;diff1| (QREFELT $ 20) |n| |x| $)
                                (QREFELT $ 91))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 89))
                                 (QREFELT $ 78) (QREFELT $ 91))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                         |x| (QREFELT $ 44))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 92))
                         |x| (QREFELT $ 44))
                        (QREFELT $ 99))
                       (QREFELT $ 91))
                      (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;iBesselI| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselI|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 89))
                                (|FSPECF;diff1| (QREFELT $ 21) |n| |x| $)
                                (QREFELT $ 91))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 89))
                                 (QREFELT $ 78) (QREFELT $ 91))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                         |x| (QREFELT $ 45))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 92))
                         |x| (QREFELT $ 45))
                        (QREFELT $ 92))
                       (QREFELT $ 91))
                      (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;iBesselK| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselK|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 89))
                                (|FSPECF;diff1| (QREFELT $ 22) |n| |x| $)
                                (QREFELT $ 91))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 89))
                                 (QREFELT $ 78) (QREFELT $ 91))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 99))
                         |x| (QREFELT $ 46))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 92))
                         |x| (QREFELT $ 46))
                        (QREFELT $ 92))
                       (QREFELT $ 91))
                      (QREFELT $ 99)))))) 

(SDEFUN |FSPECF;dPolylog| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|s| (F)))
               (SEQ (LETT |s| (|SPADfirst| |l|) . #1=(|FSPECF;dPolylog|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |s| |t| (QREFELT $ 89))
                                (|FSPECF;diff1| (QREFELT $ 28) |s| |x| $)
                                (QREFELT $ 91))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 89))
                                 (SPADCALL
                                  (SPADCALL |s| (|spadConstant| $ 63)
                                            (QREFELT $ 99))
                                  |x| (QREFELT $ 52))
                                 (QREFELT $ 91))
                       |x| (QREFELT $ 98))
                      (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;ipolygamma| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|y| (F)) (|n| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 246))
                            (QREFELT $ 247))
                  (|error|
                   "cannot differentiate polygamma with respect to the first argument"))
                 ('T
                  (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;ipolygamma|))
                       (LETT |y| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                       (EXIT
                        (SPADCALL (SPADCALL |y| |x| (QREFELT $ 89))
                                  (SPADCALL
                                   (SPADCALL |n| (|spadConstant| $ 63)
                                             (QREFELT $ 92))
                                   |y| (QREFELT $ 42))
                                  (QREFELT $ 91))))))))) 

(SDEFUN |FSPECF;iBetaGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad1|))
                    (LETT |y| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT $ 40))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 41))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT $ 92))
                                          (QREFELT $ 41))
                                         (QREFELT $ 99))
                               (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;iBetaGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad2|))
                    (LETT |y| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT $ 40))
                               (SPADCALL (SPADCALL |y| (QREFELT $ 41))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT $ 92))
                                          (QREFELT $ 41))
                                         (QREFELT $ 99))
                               (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;iGamma2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|a| (F)))
               (SEQ (LETT |a| (|SPADfirst| |l|) . #1=(|FSPECF;iGamma2|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |t| (QREFELT $ 89))
                                (|FSPECF;diff1| (QREFELT $ 15) |a| |x| $)
                                (QREFELT $ 91))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 89))
                                 (SPADCALL |x|
                                           (SPADCALL |a| (|spadConstant| $ 63)
                                                     (QREFELT $ 99))
                                           (QREFELT $ 117))
                                 (QREFELT $ 91))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 108))
                                 (QREFELT $ 197))
                       (QREFELT $ 91))
                      (QREFELT $ 99)))))) 

(SDEFUN |FSPECF;inGamma2| ((|li| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT $ 160)) |li|)
                  (QREFELT $ 161))) 

(SDEFUN |FSPECF;dLambertW| ((|x| F) ($ F))
        (SPROG ((|lw| (F)))
               (SEQ
                (LETT |lw| (SPADCALL |x| (QREFELT $ 51)) |FSPECF;dLambertW|)
                (EXIT
                 (SPADCALL |lw|
                           (SPADCALL |x|
                                     (SPADCALL (|spadConstant| $ 63) |lw|
                                               (QREFELT $ 92))
                                     (QREFELT $ 91))
                           (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassPGrad1|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                          (QREFELT $ 83))
                                (QREFELT $ 99))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 55))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL 9 (QREFELT $ 78) (QREFELT $ 83))
                                   |g3| (QREFELT $ 91))
                                  (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                                  (QREFELT $ 91))
                                 (QREFELT $ 108))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 80)
                                           (SPADCALL |g2| 2 (QREFELT $ 155))
                                           (QREFELT $ 91))
                                 |x| (QREFELT $ 91))
                                (QREFELT $ 92))
                               (QREFELT $ 91))
                     (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83))
                               (SPADCALL |wp| 2 (QREFELT $ 155))
                               (QREFELT $ 91))
                     (QREFELT $ 99))
                    (SPADCALL
                     (SPADCALL (QREFELT $ 78) (SPADCALL |g2| 2 (QREFELT $ 155))
                               (QREFELT $ 91))
                     |wp| (QREFELT $ 91))
                    (QREFELT $ 92))
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 78) (QREFELT $ 83)) |g2|
                              (QREFELT $ 91))
                    |g3| (QREFELT $ 91))
                   (QREFELT $ 92))
                  |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassPGrad2|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                          (QREFELT $ 83))
                                (QREFELT $ 99))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 55))
                               (SPADCALL
                                (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 83))
                                          (SPADCALL |g2| |g3| |x|
                                                    (QREFELT $ 57))
                                          (QREFELT $ 91))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL 9 (QREFELT $ 78) (QREFELT $ 83))
                                  |g3| (QREFELT $ 91))
                                 |x| (QREFELT $ 91))
                                (QREFELT $ 99))
                               (QREFELT $ 91))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT $ 83))
                               (SPADCALL |wp| 2 (QREFELT $ 155))
                               (QREFELT $ 91))
                     (QREFELT $ 92))
                    (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |wp|
                              (QREFELT $ 91))
                    (QREFELT $ 99))
                   (SPADCALL |g2| 2 (QREFELT $ 155)) (QREFELT $ 99))
                  |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad3| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
                  (SPADCALL |l| (QREFELT $ 242)) (QREFELT $ 55))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad1| ((|l| |List| F) ($ F))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                    (QREFELT $ 83))
                          (QREFELT $ 99))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 155)) (QREFELT $ 83))
                 (SPADCALL (QREFELT $ 78) |g2| (QREFELT $ 91)) (QREFELT $ 99))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL |wpp2|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL 9 (QREFELT $ 78) (QREFELT $ 83)) |g3|
                             (QREFELT $ 91))
                            (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                            (QREFELT $ 91))
                           (QREFELT $ 108))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 80)
                                     (SPADCALL |g2| 2 (QREFELT $ 155))
                                     (QREFELT $ 91))
                           |x| (QREFELT $ 91))
                          (QREFELT $ 92))
                         (QREFELT $ 91))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 78) (QREFELT $ 83))
                                     |g3| (QREFELT $ 91))
                           |wp| (QREFELT $ 91))
                          (SPADCALL (QREFELT $ 80)
                                    (SPADCALL |g2| 2 (QREFELT $ 155))
                                    (QREFELT $ 91))
                          (QREFELT $ 92))
                         (QREFELT $ 91))
               (QREFELT $ 92))
              (SPADCALL
               (SPADCALL (SPADCALL 18 |g3| (QREFELT $ 83)) |wp| (QREFELT $ 91))
               |wpp| (QREFELT $ 91))
              (QREFELT $ 99))
             (SPADCALL
              (SPADCALL (QREFELT $ 78) (SPADCALL |g2| 2 (QREFELT $ 155))
                        (QREFELT $ 91))
              |wpp| (QREFELT $ 91))
             (QREFELT $ 92))
            |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad2| ((|l| |List| F) ($ F))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                    (QREFELT $ 83))
                          (QREFELT $ 99))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 155)) (QREFELT $ 83))
                 (SPADCALL (QREFELT $ 78) |g2| (QREFELT $ 91)) (QREFELT $ 99))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL |wpp2|
                         (SPADCALL
                          (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 83))
                                    (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                                    (QREFELT $ 91))
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 78) (QREFELT $ 83))
                                     |g3| (QREFELT $ 91))
                           |x| (QREFELT $ 91))
                          (QREFELT $ 99))
                         (QREFELT $ 91))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 83)) |wp|
                                     (QREFELT $ 91))
                           (QREFELT $ 108))
                          (SPADCALL (SPADCALL 9 (QREFELT $ 78) (QREFELT $ 83))
                                    |g3| (QREFELT $ 91))
                          (QREFELT $ 99))
                         (QREFELT $ 91))
               (QREFELT $ 92))
              (SPADCALL
               (SPADCALL (SPADCALL 12 |g2| (QREFELT $ 83)) |wp| (QREFELT $ 91))
               |wpp| (QREFELT $ 91))
              (QREFELT $ 92))
             (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |wpp| (QREFELT $ 91))
             (QREFELT $ 99))
            |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad3| ((|l| |List| F) ($ F))
        (SPROG ((|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|) |FSPECF;iWeierstrassPPrimeGrad3|)
                (EXIT
                 (SPADCALL
                  (SPADCALL 6
                            (SPADCALL
                             (SPADCALL |g2| (SPADCALL |l| (QREFELT $ 202))
                                       (SPADCALL |l| (QREFELT $ 242))
                                       (QREFELT $ 54))
                             2 (QREFELT $ 111))
                            (QREFELT $ 83))
                  (SPADCALL (QREFELT $ 78) |g2| (QREFELT $ 91))
                  (QREFELT $ 99)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad1| ((|l| |List| F) ($ F))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                    (QREFELT $ 83))
                          (QREFELT $ 99))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 56)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 57)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 91)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) |ws|
                            (QREFELT $ 91))
                  (QREFELT $ 108))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 155)) |ws|
                           (QREFELT $ 91))
                 (QREFELT $ 92))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 80)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |wsp2|
                                    (QREFELT $ 91))
                          (QREFELT $ 108))
                         (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 155)) |ws|
                                   (QREFELT $ 91))
                         (QREFELT $ 99))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 (QREFELT $ 80) (QREFELT $ 83))
                                     |g2| (QREFELT $ 91))
                           |g3| (QREFELT $ 91))
                          (SPADCALL |x| 2 (QREFELT $ 155)) (QREFELT $ 91))
                         |ws| (QREFELT $ 91))
                        (QREFELT $ 99))
                       (SPADCALL
                        (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 155)) |x|
                                  (QREFELT $ 91))
                        |wsp| (QREFELT $ 91))
                       (QREFELT $ 92))
                      (QREFELT $ 91))
            |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad2| ((|l| |List| F) ($ F))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                    (QREFELT $ 83))
                          (QREFELT $ 99))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 56)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 57)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 91)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) |ws|
                            (QREFELT $ 91))
                  (QREFELT $ 108))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 155)) |ws|
                           (QREFELT $ 91))
                 (QREFELT $ 92))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 78)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 83)) |wsp2|
                                   (QREFELT $ 91))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |ws|
                                   (QREFELT $ 91))
                         (QREFELT $ 92))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT $ 80)
                                    (SPADCALL |g2| 2 (QREFELT $ 155))
                                    (QREFELT $ 91))
                          (SPADCALL |x| 2 (QREFELT $ 155)) (QREFELT $ 91))
                         |ws| (QREFELT $ 91))
                        (QREFELT $ 92))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |x|
                                  (QREFELT $ 91))
                        |wsp| (QREFELT $ 91))
                       (QREFELT $ 99))
                      (QREFELT $ 91))
            |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad3| ((|l| |List| F) ($ F))
        (SPROG ((|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassSigmaGrad3|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                           (SPADCALL |g2| |g3| |x| (QREFELT $ 56))
                           (QREFELT $ 91)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassZetaGrad1|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                          (QREFELT $ 83))
                                (QREFELT $ 99))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (QREFELT $ 78)
                               (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                               (QREFELT $ 91))
                     (SPADCALL
                      (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |wp|
                                (QREFELT $ 91))
                      (SPADCALL (QREFELT $ 78)
                                (SPADCALL |g2| 2 (QREFELT $ 155))
                                (QREFELT $ 91))
                      (QREFELT $ 92))
                     (QREFELT $ 91))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 78) |g2| (QREFELT $ 91))
                               |x| (QREFELT $ 91))
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 78) |g2| (QREFELT $ 91))
                                |wp| (QREFELT $ 91))
                      (SPADCALL (SPADCALL 3 (QREFELT $ 80) (QREFELT $ 83)) |g3|
                                (QREFELT $ 91))
                      (QREFELT $ 92))
                     (QREFELT $ 91))
                    (QREFELT $ 99))
                   (SPADCALL
                    (SPADCALL (SPADCALL 9 (QREFELT $ 80) (QREFELT $ 83)) |g3|
                              (QREFELT $ 91))
                    (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) (QREFELT $ 91))
                   (QREFELT $ 92))
                  |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassZetaGrad2|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 202)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 242)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 155))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 155))
                                          (QREFELT $ 83))
                                (QREFELT $ 99))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                                (QREFELT $ 83))
                      (SPADCALL (SPADCALL |g2| |wp| (QREFELT $ 91))
                                (SPADCALL
                                 (SPADCALL 3 (QREFELT $ 78) (QREFELT $ 83))
                                 |g3| (QREFELT $ 91))
                                (QREFELT $ 92))
                      (QREFELT $ 91))
                     (QREFELT $ 108))
                    (SPADCALL (SPADCALL (QREFELT $ 78) |x| (QREFELT $ 91))
                              (SPADCALL
                               (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 83)) |wp|
                                         (QREFELT $ 91))
                               (SPADCALL (QREFELT $ 78)
                                         (SPADCALL |g2| 2 (QREFELT $ 155))
                                         (QREFELT $ 91))
                               (QREFELT $ 92))
                              (QREFELT $ 91))
                    (QREFELT $ 92))
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 78) (QREFELT $ 83)) |g2|
                              (QREFELT $ 91))
                    (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) (QREFELT $ 91))
                   (QREFELT $ 99))
                  |delta| (QREFELT $ 98)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad3| ((|l| |List| F) ($ F))
        (SPADCALL
         (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 202))
                   (SPADCALL |l| (QREFELT $ 242)) (QREFELT $ 54))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;get_int_listf| ((|lf| |List| F) ($ |List| (|Integer|)))
        (SPADCALL (ELT $ 248) |lf| (QREFELT $ 252))) 

(SDEFUN |FSPECF;replace_i|
        ((|lp| |List| F) (|v| F) (|i| |NonNegativeInteger|) ($ |List| F))
        (SPROG ((#1=#:G890 NIL))
               (SPADCALL
                (SPADCALL |lp|
                          (PROG1 (LETT #1# (- |i| 1) |FSPECF;replace_i|)
                            (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                             #1#))
                          (QREFELT $ 253))
                (CONS |v| (SPADCALL |lp| |i| (QREFELT $ 254))) (QREFELT $ 69)))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;259| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G893 NIL) (#2=#:G895 NIL) (|q| #3=(|Integer|)) (|p| #3#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#4=#:G892 NIL) (|z| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (LENGTH |l|) . #5=(|FSPECF;iiHypergeometricF;LF;259|))
            (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT $ 86)) . #5#)
            (COND
             ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
              (SEQ
               (EXIT
                (SEQ
                 (LETT |nn|
                       (PROG1 (LETT #4# (- |n| 2) . #5#)
                         (|check_subtype| (>= #4# 0) '(|NonNegativeInteger|)
                                          #4#))
                       . #5#)
                 (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 254)) . #5#)
                 (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #5#)
                 (LETT |p| (|SPADfirst| |pqi|) . #5#)
                 (LETT |q| (|SPADfirst| (CDR |pqi|)) . #5#)
                 (EXIT
                  (COND
                   ((SPADCALL |p| (+ |q| 1) (QREFELT $ 255))
                    (PROGN
                     (LETT #1#
                           (PROGN
                            (LETT #2# (|spadConstant| $ 63) . #5#)
                            (GO #2#))
                           . #5#)
                     (GO #1#)))))))
               #1# (EXIT #1#))))
            (EXIT (SPADCALL (QREFELT $ 33) |l| (QREFELT $ 90)))))
          #2# (EXIT #2#)))) 

(SDEFUN |FSPECF;idvsum|
        ((|op| |BasicOperator|) (|n| |Integer|) (|l| |List| F) (|x| |Symbol|)
         ($ F))
        (SPROG
         ((|res| (F)) (|nl| (|List| F)) (|dm| (F)) (|i| NIL) (#1=#:G902 NIL)
          (|a| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 59) . #2=(|FSPECF;idvsum|))
              (SEQ (LETT |a| NIL . #2#) (LETT #1# |l| . #2#) (LETT |i| 1 . #2#)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                         (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT $ 87)) (QREFELT $ 88))
                          . #2#)
                    (LETT |nl| (|FSPECF;replace_i| |l| |dm| |i| $) . #2#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |a| |x| (QREFELT $ 89))
                                      (SPADCALL (QREFELT $ 75)
                                                (LIST
                                                 (SPADCALL |op| |nl|
                                                           (QREFELT $ 71))
                                                 |dm| |a|)
                                                (QREFELT $ 90))
                                      (QREFELT $ 91))
                                     (QREFELT $ 92))
                           . #2#)))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#))
                         . #2#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSPECF;dvhypergeom| ((|l| . #1=(|List| F)) (|x| |Symbol|) ($ F))
        (SPROG
         ((|aprod| (F)) (|nl| (|List| F)) (|nl1| (|List| F)) (|nl0| (|List| F))
          (|bprod| (F)) (|b| (F)) (|i| NIL) (|a| (F)) (|q| #2=(|Integer|))
          (|p| #2#) (|z| (F)) (|l1| (|List| F)) (|ol| #1#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#3=#:G903 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #4=(|FSPECF;dvhypergeom|))
              (LETT |nn|
                    (PROG1 (LETT #3# (- |n| 2) . #4#)
                      (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
                    . #4#)
              (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 254)) . #4#)
              (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #4#)
              (LETT |ol| |l| . #4#)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 253)) . #4#)
              (LETT |l1| (REVERSE |l|) . #4#)
              (LETT |z| (|SPADfirst| |l1|) . #4#)
              (LETT |p| (|SPADfirst| |pqi|) . #4#)
              (LETT |q| (|SPADfirst| (CDR |pqi|)) . #4#)
              (LETT |aprod| (|spadConstant| $ 63) . #4#) (LETT |nl| NIL . #4#)
              (SEQ (LETT |i| 1 . #4#) G190
                   (COND ((|greater_SI| |i| |p|) (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| |l|) . #4#)
                        (LETT |nl|
                              (CONS
                               (SPADCALL |a| (|spadConstant| $ 63)
                                         (QREFELT $ 92))
                               |nl|)
                              . #4#)
                        (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT $ 91))
                              . #4#)
                        (EXIT (LETT |l| (CDR |l|) . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |bprod| (|spadConstant| $ 63) . #4#)
              (SEQ (LETT |i| 1 . #4#) G190
                   (COND ((|greater_SI| |i| |q|) (GO G191)))
                   (SEQ (LETT |b| (|SPADfirst| |l|) . #4#)
                        (LETT |nl|
                              (CONS
                               (SPADCALL |b| (|spadConstant| $ 63)
                                         (QREFELT $ 92))
                               |nl|)
                              . #4#)
                        (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT $ 91))
                              . #4#)
                        (EXIT (LETT |l| (CDR |l|) . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |nl0| (NREVERSE |nl|) . #4#)
              (LETT |nl1| (CONS |z| |pq|) . #4#)
              (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT $ 69)) . #4#)
              (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT $ 98)) . #4#)
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT $ 33) (- |nn| 1) |ol| |x| $)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT $ 89)) |aprod|
                                    (QREFELT $ 91))
                          (SPADCALL (QREFELT $ 33) |nl| (QREFELT $ 71))
                          (QREFELT $ 91))
                         (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;add_pairs_to_list|
        ((|lp| |List| (|List| F)) (|l| |List| F) ($ |List| F))
        (SPROG ((#1=#:G914 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL . #2=(|FSPECF;add_pairs_to_list|))
                     (LETT #1# |lp| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |p|) 2 (QREFELT $ 256))
                         (|error| "not a list of pairs"))
                        ('T
                         (LETT |l|
                               (CONS (SPADCALL |p| 2 (QREFELT $ 86))
                                     (CONS (SPADCALL |p| 1 (QREFELT $ 86))
                                           |l|))
                               . #2#)))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))) 

(SDEFUN |FSPECF;dvmeijer| ((|l| . #1=(|List| F)) (|x| |Symbol|) ($ F))
        (SPROG
         ((|om| (F)) (|nm| (F)) (|l2| (|List| F)) (|sign| (F)) (|na| (F))
          (|a| (F)) (|n2| (|Integer|)) (|n1| (|Integer|)) (|z| (F))
          (|l1| (|List| F)) (|nli| (|List| (|Integer|))) (|nl| (|List| F))
          (|l0| #1#) (|nn| (|NonNegativeInteger|)) (#2=#:G915 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #3=(|FSPECF;dvmeijer|))
              (LETT |nn|
                    (PROG1 (LETT #2# (- |n| 4) . #3#)
                      (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                    . #3#)
              (LETT |l0| |l| . #3#)
              (LETT |nl| (SPADCALL |l| |nn| (QREFELT $ 254)) . #3#)
              (LETT |nli| (|FSPECF;get_int_listf| |nl| $) . #3#)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 253)) . #3#)
              (LETT |l1| (REVERSE |l|) . #3#)
              (LETT |z| (|SPADfirst| |l1|) . #3#)
              (LETT |n1| (|SPADfirst| |nli|) . #3#)
              (LETT |n2| (SPADCALL |nli| 2 (QREFELT $ 257)) . #3#)
              (LETT |a| (|SPADfirst| |l|) . #3#)
              (LETT |sign| (|spadConstant| $ 63) . #3#)
              (COND
               ((OR (SPADCALL |n1| 0 (QREFELT $ 258))
                    (SPADCALL |n2| 0 (QREFELT $ 258)))
                (SEQ
                 (LETT |na| (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 99))
                       . #3#)
                 (COND
                  ((EQL |n1| 0)
                   (LETT |sign|
                         (SPADCALL (|spadConstant| $ 63) (QREFELT $ 108))
                         . #3#)))
                 (EXIT (LETT |l2| (CONS |na| (CDR |l|)) . #3#))))
               ('T
                (SEQ (LETT |na| |a| . #3#)
                     (COND
                      ((SPADCALL (SPADCALL |nli| 3 (QREFELT $ 257)) 0
                                 (QREFELT $ 258))
                       (LETT |sign|
                             (SPADCALL (|spadConstant| $ 63) (QREFELT $ 108))
                             . #3#)))
                     (EXIT
                      (LETT |l2|
                            (CONS
                             (SPADCALL |a| (|spadConstant| $ 63)
                                       (QREFELT $ 92))
                             (CDR |l|))
                            . #3#)))))
              (LETT |nm|
                    (SPADCALL (QREFELT $ 34)
                              (SPADCALL |l2| |nl| (QREFELT $ 69))
                              (QREFELT $ 71))
                    . #3#)
              (LETT |om| (SPADCALL (QREFELT $ 34) |l0| (QREFELT $ 71)) . #3#)
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT $ 34) (- |nn| 1) |l0| |x| $)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT $ 89))
                                    (SPADCALL
                                     (SPADCALL |sign| |nm| (QREFELT $ 91))
                                     (SPADCALL |na| |om| (QREFELT $ 91))
                                     (QREFELT $ 92))
                                    (QREFELT $ 91))
                          |z| (QREFELT $ 98))
                         (QREFELT $ 92)))))) 

(SDEFUN |FSPECF;get_if_list|
        ((|n| |Integer|) (|lf| |List| (|InputForm|))
         ($ |List| (|List| (|InputForm|))))
        (SPROG ((|a| (|List| (|InputForm|))) (|i| NIL))
               (SEQ (LETT |a| NIL . #1=(|FSPECF;get_if_list|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| |n|) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|) . #1#)
                              (EXIT (LETT |lf| (CDR |lf|) . #1#)))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a|
                          (CONS (SPADCALL '|construct| (QREFELT $ 160))
                                (NREVERSE |a|))
                          . #1#)
                    (EXIT (LIST |a| |lf|))))) 

(SDEFUN |FSPECF;get_if_lists|
        ((|ln| |List| (|Integer|)) (|lf| |List| (|InputForm|))
         ($ |List| (|List| (|InputForm|))))
        (SPROG
         ((|rl| (|List| (|List| (|InputForm|))))
          (|al| (|List| (|List| (|InputForm|)))) (#1=#:G931 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL . #2=(|FSPECF;get_if_lists|))
              (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_if_list| |n| |lf| $) . #2#)
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|) . #2#)
                        (EXIT (LETT |lf| (|SPADfirst| (CDR |al|)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT (CONS |lf| |rl|))))) 

(SDEFUN |FSPECF;get_int_listi|
        ((|n| |Integer|) (|lo| |List| (|InputForm|)) ($ |List| (|Integer|)))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (|i| NIL)
          (|n0| (|NonNegativeInteger|)) (#1=#:G932 NIL))
         (SEQ
          (LETT |n0|
                (PROG1
                    (LETT #1# (- (LENGTH |lo|) |n|)
                          . #2=(|FSPECF;get_int_listi|))
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 260)) . #2#)
          (LETT |rl| NIL . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 262)) . #2#)
                (LETT |rl| (CONS |p| |rl|) . #2#)
                (EXIT (LETT |lo| (CDR |lo|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT |rl|)))) 

(SDEFUN |FSPECF;get_of_list|
        ((|n| |Integer|) (|lo| |List| (|OutputForm|))
         ($ |List| (|List| (|OutputForm|))))
        (SPROG ((|a| (|List| (|OutputForm|))) (|i| NIL))
               (SEQ (LETT |a| NIL . #1=(|FSPECF;get_of_list|))
                    (SEQ (LETT |i| 1 . #1#) G190
                         (COND ((|greater_SI| |i| |n|) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lo|) |a|) . #1#)
                              (EXIT (LETT |lo| (CDR |lo|) . #1#)))
                         (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a| (NREVERSE |a|) . #1#) (EXIT (LIST |a| |lo|))))) 

(SDEFUN |FSPECF;get_of_lists|
        ((|ln| |List| (|Integer|)) (|lo| |List| (|OutputForm|))
         ($ |List| (|List| (|OutputForm|))))
        (SPROG
         ((|rl| (|List| (|List| (|OutputForm|))))
          (|al| (|List| (|List| (|OutputForm|)))) (#1=#:G945 NIL) (|n| NIL))
         (SEQ (LETT |rl| NIL . #2=(|FSPECF;get_of_lists|))
              (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |al| (|FSPECF;get_of_list| |n| |lo| $) . #2#)
                        (LETT |rl| (CONS (|SPADfirst| |al|) |rl|) . #2#)
                        (EXIT (LETT |lo| (|SPADfirst| (CDR |al|)) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT (CONS |lo| |rl|))))) 

(SDEFUN |FSPECF;get_int_listo|
        ((|n| |Integer|) (|lo| |List| (|OutputForm|)) ($ |List| (|Integer|)))
        (SPROG
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (|i| NIL)
          (|n0| (|NonNegativeInteger|)) (#1=#:G946 NIL))
         (SEQ
          (LETT |n0|
                (PROG1
                    (LETT #1# (- (LENGTH |lo|) |n|)
                          . #2=(|FSPECF;get_int_listo|))
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 264)) . #2#)
          (LETT |rl| NIL . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 262)) . #2#)
                (LETT |rl| (CONS |p| |rl|) . #2#)
                (EXIT (LETT |lo| (CDR |lo|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT |rl|)))) 

(SDEFUN |FSPECF;dhyper0|
        ((|op| |OutputForm|) (|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|z| (|OutputForm|)) (|b| #1=(|List| (|OutputForm|))) (|a| #1#)
          (|al| (|List| (|List| (|OutputForm|)))) (|pql| (|List| (|Integer|)))
          (|n0| (|NonNegativeInteger|)) (#2=#:G951 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) 2) . #3=(|FSPECF;dhyper0|))
                  (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
                . #3#)
          (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| $) . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 265)) . #3#)
          (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| $) . #3#)
          (LETT |lo| (|SPADfirst| |al|) . #3#) (LETT |al| (CDR |al|) . #3#)
          (LETT |a| (|SPADfirst| |al|) . #3#)
          (LETT |b| (|SPADfirst| (CDR |al|)) . #3#)
          (LETT |z| (|SPADfirst| |lo|) . #3#)
          (EXIT
           (SPADCALL |op|
                     (LIST (SPADCALL |a| (QREFELT $ 267))
                           (SPADCALL |b| (QREFELT $ 267)) |z|)
                     (QREFELT $ 268)))))) 

(SDEFUN |FSPECF;dhyper| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT $ 269)) |lo| $)) 

(SDEFUN |FSPECF;ddhyper| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(SDEFUN |FSPECF;dmeijer0|
        ((|op| |OutputForm|) (|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|z| (|OutputForm|)) (|al| (|List| (|List| (|OutputForm|))))
          (|nl| (|List| (|Integer|))) (|n0| (|NonNegativeInteger|))
          (#1=#:G956 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #1# (- (LENGTH |lo|) 4) . #2=(|FSPECF;dmeijer0|))
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |nl| (|FSPECF;get_int_listo| 4 |lo| $) . #2#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 265)) . #2#)
          (LETT |al| (|FSPECF;get_of_lists| |nl| |lo| $) . #2#)
          (LETT |lo| (|SPADfirst| |al|) . #2#) (LETT |al| (CDR |al|) . #2#)
          (LETT |z| (|SPADfirst| |lo|) . #2#)
          (EXIT
           (SPADCALL |op|
                     (SPADCALL (SPADCALL (ELT $ 267) |al| (QREFELT $ 273))
                               (LIST |z|) (QREFELT $ 274))
                     (QREFELT $ 268)))))) 

(SDEFUN |FSPECF;dmeijer| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT $ 269)) |lo| $)) 

(SDEFUN |FSPECF;ddmeijer| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dmeijer0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(SDEFUN |FSPECF;inhyper| ((|lf| |List| (|InputForm|)) ($ |InputForm|))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|bi| #2=(|InputForm|))
          (|b| #3=(|List| (|InputForm|))) (|ai| #2#) (|a| #3#)
          (|al| (|List| (|List| (|InputForm|)))) (|pqi| (|List| (|Integer|))))
         (SEQ
          (LETT |pqi| (|FSPECF;get_int_listi| 2 |lf| $)
                . #4=(|FSPECF;inhyper|))
          (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| $) . #4#)
          (LETT |lf| (|SPADfirst| |al|) . #4#) (LETT |al| (CDR |al|) . #4#)
          (LETT |a| (|SPADfirst| |al|) . #4#)
          (LETT |ai| (SPADCALL |a| (QREFELT $ 161)) . #4#)
          (LETT |b| (|SPADfirst| (CDR |al|)) . #4#)
          (LETT |bi| (SPADCALL |b| (QREFELT $ 161)) . #4#)
          (LETT |zi| (|SPADfirst| |lf|) . #4#)
          (LETT |li|
                (LIST (SPADCALL '|hypergeometricF| (QREFELT $ 160)) |ai| |bi|
                      |zi|)
                . #4#)
          (EXIT (SPADCALL |li| (QREFELT $ 161)))))) 

(SDEFUN |FSPECF;inmeijer| ((|lf| |List| (|InputForm|)) ($ |InputForm|))
        (SPROG
         ((|li| (|List| #1=(|InputForm|))) (|zi| #1#) (|di| #2=(|InputForm|))
          (|d| #3=(|List| (|InputForm|)))
          (|al| (|List| (|List| (|InputForm|)))) (|ci| #2#) (|c| #3#)
          (|bi| #2#) (|b| #3#) (|ai| #2#) (|a| #3#)
          (|pqi| (|List| (|Integer|))))
         (SEQ
          (LETT |pqi| (|FSPECF;get_int_listi| 4 |lf| $)
                . #4=(|FSPECF;inmeijer|))
          (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| $) . #4#)
          (LETT |lf| (|SPADfirst| |al|) . #4#) (LETT |al| (CDR |al|) . #4#)
          (LETT |a| (|SPADfirst| |al|) . #4#)
          (LETT |ai| (SPADCALL |a| (QREFELT $ 161)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |b| (|SPADfirst| |al|) . #4#)
          (LETT |bi| (SPADCALL |b| (QREFELT $ 161)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |c| (|SPADfirst| |al|) . #4#)
          (LETT |ci| (SPADCALL |c| (QREFELT $ 161)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |d| (|SPADfirst| |al|) . #4#)
          (LETT |di| (SPADCALL |d| (QREFELT $ 161)) . #4#)
          (LETT |zi| (|SPADfirst| |lf|) . #4#)
          (LETT |li|
                (LIST (SPADCALL '|meijerG| (QREFELT $ 160)) |ai| |bi| |ci| |di|
                      |zi|)
                . #4#)
          (EXIT (SPADCALL |li| (QREFELT $ 161)))))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;278| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 33) |l| (QREFELT $ 90))) 

(SDEFUN |FSPECF;iiMeijerG| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 34) |l| (QREFELT $ 90))) 

(DECLAIM (NOTINLINE |FunctionalSpecialFunction;|)) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1037)
  (SPROG NIL
         (PROG (#2=#:G1038)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionalSpecialFunction|)
                                               '|domainEqualList|)
                    . #3=(|FunctionalSpecialFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionalSpecialFunction;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FunctionalSpecialFunction|)))))))))) 

(DEFUN |FunctionalSpecialFunction;| (|#1| |#2|)
  (SPROG
   ((#1=#:G198 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FunctionalSpecialFunction|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FunctionalSpecialFunction| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 277) . #2#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))))
                    . #2#))
    (|haddProp| |$ConstructorCache| '|FunctionalSpecialFunction|
                (LIST DV$1 DV$2) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 8 '|special|)
    (QSETREFV $ 13 (SPADCALL '|abs| (QREFELT $ 12)))
    (QSETREFV $ 14 (SPADCALL '|Gamma| (QREFELT $ 12)))
    (QSETREFV $ 15 (SPADCALL '|Gamma2| (QREFELT $ 12)))
    (QSETREFV $ 16 (SPADCALL '|Beta| (QREFELT $ 12)))
    (QSETREFV $ 17 (SPADCALL '|digamma| (QREFELT $ 12)))
    (QSETREFV $ 18 (SPADCALL '|polygamma| (QREFELT $ 12)))
    (QSETREFV $ 19 (SPADCALL '|besselJ| (QREFELT $ 12)))
    (QSETREFV $ 20 (SPADCALL '|besselY| (QREFELT $ 12)))
    (QSETREFV $ 21 (SPADCALL '|besselI| (QREFELT $ 12)))
    (QSETREFV $ 22 (SPADCALL '|besselK| (QREFELT $ 12)))
    (QSETREFV $ 23 (SPADCALL '|airyAi| (QREFELT $ 12)))
    (QSETREFV $ 24 (SPADCALL '|airyAiPrime| (QREFELT $ 12)))
    (QSETREFV $ 25 (SPADCALL '|airyBi| (QREFELT $ 12)))
    (QSETREFV $ 26 (SPADCALL '|airyBiPrime| (QREFELT $ 12)))
    (QSETREFV $ 27 (SPADCALL '|lambertW| (QREFELT $ 12)))
    (QSETREFV $ 28 (SPADCALL '|polylog| (QREFELT $ 12)))
    (QSETREFV $ 29 (SPADCALL '|weierstrassP| (QREFELT $ 12)))
    (QSETREFV $ 30 (SPADCALL '|weierstrassPPrime| (QREFELT $ 12)))
    (QSETREFV $ 31 (SPADCALL '|weierstrassSigma| (QREFELT $ 12)))
    (QSETREFV $ 32 (SPADCALL '|weierstrassZeta| (QREFELT $ 12)))
    (QSETREFV $ 33 (SPADCALL '|hypergeometricF| (QREFELT $ 12)))
    (QSETREFV $ 34 (SPADCALL '|meijerG| (QREFELT $ 12)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 72
                 (CONS (|dispatchFunction| |FSPECF;hypergeometricF;2L2F;21|)
                       $))
       (QSETREFV $ 73
                 (CONS (|dispatchFunction| |FSPECF;meijerG;4L2F;22|) $)))))
    (QSETREFV $ 75
              (SPADCALL (SPADCALL '|%diff| (QREFELT $ 12)) (QREFELT $ 74)))
    (QSETREFV $ 78
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 77))
                        . #2#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) |#2| #1#)))
    (QSETREFV $ 79
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 77))
                        . #2#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) |#2| #1#)))
    (QSETREFV $ 80
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 4 (QREFELT $ 67)) (QREFELT $ 77))
                        . #2#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) |#2| #1#)))
    (QSETREFV $ 81
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 6 (QREFELT $ 67)) (QREFELT $ 77))
                        . #2#)
                  (QCDR #1#)
                (|check_union| (QEQCAR #1# 0) |#2| #1#)))
    (QSETREFV $ 84 (SPADCALL 2 (QREFELT $ 79) (QREFELT $ 83)))
    (QSETREFV $ 85 (SPADCALL 3 (QREFELT $ 78) (QREFELT $ 83)))
    (QSETREFV $ 93 (SPADCALL '|whittakerM| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 93) (CONS (|function| |FSPECF;elWhittakerM|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 93) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerM|) $) (QREFELT $ 101))
    (QSETREFV $ 102 (SPADCALL '|whittakerW| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 102) (CONS (|function| |FSPECF;elWhittakerW|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 102) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerW|) $) (QREFELT $ 101))
    (QSETREFV $ 104 (SPADCALL '|angerJ| (QREFELT $ 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 104) (CONS (|function| |FSPECF;elAngerJ|) $)
                 (QREFELT $ 97))
       (SPADCALL (QREFELT $ 104) '|%specialDiff|
                 (CONS (|function| |FSPECF;dAngerJ|) $) (QREFELT $ 101))))
     ('T
      (PROGN
       (SPADCALL (QREFELT $ 104) (CONS (|function| |FSPECF;eeAngerJ|) $)
                 (QREFELT $ 97)))))
    (QSETREFV $ 109 (SPADCALL '|weberE| (QREFELT $ 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 109) (CONS (|function| |FSPECF;elWeberE|) $)
                 (QREFELT $ 97))
       (SPADCALL (QREFELT $ 109) '|%specialDiff|
                 (CONS (|function| |FSPECF;dWeberE|) $) (QREFELT $ 101))))
     ('T
      (PROGN
       (SPADCALL (QREFELT $ 109) (CONS (|function| |FSPECF;eeWeberE|) $)
                 (QREFELT $ 97)))))
    (QSETREFV $ 115 (SPADCALL '|struveH| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 115) (CONS (|function| |FSPECF;elStruveH|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 115) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveH|) $)
                   (QREFELT $ 101)))))))
    (QSETREFV $ 119 (SPADCALL '|struveL| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 119) (CONS (|function| |FSPECF;elStruveL|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 119) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveL|) $)
                   (QREFELT $ 101)))))))
    (QSETREFV $ 121 (SPADCALL '|hankelH1| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 121) (CONS (|function| |FSPECF;elHankelH1|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 121) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH1|) $) (QREFELT $ 101))
    (QSETREFV $ 123 (SPADCALL '|hankelH2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 123) (CONS (|function| |FSPECF;elHankelH2|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 123) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH2|) $) (QREFELT $ 101))
    (QSETREFV $ 125 (SPADCALL '|lommelS1| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 125) (CONS (|function| |FSPECF;elLommelS1|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 125) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS1|) $) (QREFELT $ 101))
    (QSETREFV $ 127 (SPADCALL '|lommelS2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 127) (CONS (|function| |FSPECF;elLommelS2|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 127) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS2|) $) (QREFELT $ 101))
    (QSETREFV $ 129 (SPADCALL '|kummerM| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 129) (CONS (|function| |FSPECF;elKummerM|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 129) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerM|) $) (QREFELT $ 101))
    (QSETREFV $ 131 (SPADCALL '|kummerU| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 131) (CONS (|function| |FSPECF;elKummerU|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 131) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerU|) $) (QREFELT $ 101))
    (QSETREFV $ 133 (SPADCALL '|legendreP| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 133) (CONS (|function| |FSPECF;elLegendreP|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 133) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreP|) $) (QREFELT $ 101))
    (QSETREFV $ 135 (SPADCALL '|legendreQ| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 135) (CONS (|function| |FSPECF;elLegendreQ|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 135) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreQ|) $) (QREFELT $ 101))
    (QSETREFV $ 137 (SPADCALL '|kelvinBei| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 137) (CONS (|function| |FSPECF;elKelvinBei|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 137) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBei|) $) (QREFELT $ 101)))))
    (QSETREFV $ 140 (SPADCALL '|kelvinBer| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 140) (CONS (|function| |FSPECF;elKelvinBer|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 140) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBer|) $) (QREFELT $ 101)))))
    (QSETREFV $ 141 (SPADCALL '|kelvinKei| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 141) (CONS (|function| |FSPECF;elKelvinKei|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 141) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKei|) $) (QREFELT $ 101)))))
    (QSETREFV $ 144 (SPADCALL '|kelvinKer| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 144) (CONS (|function| |FSPECF;elKelvinKer|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 144) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKer|) $) (QREFELT $ 101)))))
    (QSETREFV $ 145 (SPADCALL '|ellipticK| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 145) (CONS (|function| |FSPECF;elEllipticK|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 145) (CONS (|function| |FSPECF;dEllipticK|) $)
              (QREFELT $ 151))
    (QSETREFV $ 152 (SPADCALL '|ellipticE| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 152) (CONS (|function| |FSPECF;elEllipticE|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 152) (CONS (|function| |FSPECF;dEllipticE|) $)
              (QREFELT $ 151))
    (QSETREFV $ 153 (SPADCALL '|ellipticE2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 153) (CONS (|function| |FSPECF;elEllipticE2|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 153)
                 (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticE2Grad_m|) $))
                 (QREFELT $ 158)))))
    (SPADCALL (QREFELT $ 153) (CONS (|function| |FSPECF;inEllipticE2|) $)
              (QREFELT $ 163))
    (QSETREFV $ 164 (SPADCALL '|ellipticF| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 164) (CONS (|function| |FSPECF;elEllipticF|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 164)
                 (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticFGrad_m|) $))
                 (QREFELT $ 158)))))
    (QSETREFV $ 165 (SPADCALL '|ellipticPi| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 165) (CONS (|function| |FSPECF;elEllipticPi|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 165)
                 (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_n|) $)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_m|) $))
                 (QREFELT $ 158)))))
    (QSETREFV $ 167 (SPADCALL '|jacobiSn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 167) (CONS (|function| |FSPECF;elJacobiSn|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 167)
              (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiSnGrad_m|) $))
              (QREFELT $ 158))
    (QSETREFV $ 176 (SPADCALL '|jacobiCn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 176) (CONS (|function| |FSPECF;elJacobiCn|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 176)
              (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiCnGrad_m|) $))
              (QREFELT $ 158))
    (QSETREFV $ 177 (SPADCALL '|jacobiDn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 177) (CONS (|function| |FSPECF;elJacobiDn|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 177)
              (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiDnGrad_m|) $))
              (QREFELT $ 158))
    (QSETREFV $ 178 (SPADCALL '|jacobiZeta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 178) (CONS (|function| |FSPECF;elJacobiZeta|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 178)
              (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) $))
              (QREFELT $ 158))
    (QSETREFV $ 180 (SPADCALL '|jacobiTheta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 180) (CONS (|function| |FSPECF;elJacobiTheta|) $)
              (QREFELT $ 97))
    (QSETREFV $ 182 (SPADCALL '|lerchPhi| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 182) (CONS (|function| |FSPECF;elLerchPhi|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 182) '|%specialDiff|
              (CONS (|function| |FSPECF;dLerchPhi|) $) (QREFELT $ 101))
    (QSETREFV $ 184 (SPADCALL '|riemannZeta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 184) (CONS (|function| |FSPECF;elRiemannZeta|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (QSETREFV $ 193 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;184|) $))
       (QSETREFV $ 194
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;185|) $))
       (QSETREFV $ 195 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;186|) $))
       (QSETREFV $ 196
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;187|) $))))
     ('T
      (PROGN
       (QSETREFV $ 193 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;188|) $))
       (QSETREFV $ 194
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;189|) $))
       (QSETREFV $ 195 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;190|) $))
       (QSETREFV $ 196
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;191|) $)))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (QSETREFV $ 198 (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;192|) $)))
     ('T
      (QSETREFV $ 198
                (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;193|) $))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
        (QSETREFV $ 201
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;194|) $)))
       ('T
        (QSETREFV $ 201
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;195|) $)))))
     ('T
      (QSETREFV $ 201
                (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;196|) $))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|abs|
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
      (PROGN
       (QSETREFV $ 213 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;202|) $))))
     ('T (QSETREFV $ 213 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;203|) $))))
    (COND
     ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
      (PROGN
       (QSETREFV $ 216 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;204|) $))
       (QSETREFV $ 218 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;205|) $))
       (QSETREFV $ 220 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;206|) $))
       (QSETREFV $ 222
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;207|) $))
       (QSETREFV $ 224 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;208|) $))
       (QSETREFV $ 226 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;209|) $))
       (QSETREFV $ 228 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;210|) $))
       (QSETREFV $ 230 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;211|) $))
       (QSETREFV $ 232 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;212|) $))
       (QSETREFV $ 234
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;213|) $))
       (QSETREFV $ 236 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;214|) $))
       (QSETREFV $ 236
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;215|) $))))
     ('T
      (PROGN
       (COND
        ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (QSETREFV $ 216
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;216|) $)))
        ('T
         (QSETREFV $ 216
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;217|) $))))
       (QSETREFV $ 218 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;218|) $))
       (QSETREFV $ 220 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;219|) $))
       (QSETREFV $ 222
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;220|) $))
       (QSETREFV $ 224 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;221|) $))
       (QSETREFV $ 226 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;222|) $))
       (QSETREFV $ 228 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;223|) $))
       (QSETREFV $ 230 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;224|) $))
       (QSETREFV $ 232 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;225|) $))
       (QSETREFV $ 234
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;226|) $))
       (QSETREFV $ 236 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;227|) $))
       (QSETREFV $ 241
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;228|)
                       $)))))
    (SPADCALL (QREFELT $ 14) (ELT $ 216) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 13) (ELT $ 213) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 16) (ELT $ 218) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 17) (ELT $ 220) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 18) (ELT $ 222) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 19) (ELT $ 224) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 20) (ELT $ 226) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 21) (ELT $ 228) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 22) (ELT $ 230) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 23) (ELT $ 232) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 24) (ELT $ 234) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 25) (ELT $ 236) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 26) (ELT $ 241) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 27) (ELT $ 198) (QREFELT $ 243))
    (SPADCALL (QREFELT $ 28) (CONS (|function| |FSPECF;iPolylog|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 29) (CONS (|function| |FSPECF;iiWeierstrassP|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 30) (CONS (|function| |FSPECF;iiWeierstrassPPrime|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 31) (CONS (|function| |FSPECF;iiWeierstrassSigma|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 32) (CONS (|function| |FSPECF;iiWeierstrassZeta|) $)
              (QREFELT $ 97))
    (SPADCALL (QREFELT $ 33) (ELT $ 244) (QREFELT $ 97))
    (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;iiMeijerG|) $)
              (QREFELT $ 97))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 15) '|%specialDiff|
                 (CONS (|function| |FSPECF;iGamma2|) $) (QREFELT $ 101)))))
    (SPADCALL (QREFELT $ 15) (CONS (|function| |FSPECF;inGamma2|) $)
              (QREFELT $ 163))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 244
                 (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;259|)
                       $))
       (SPADCALL (QREFELT $ 33) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddhyper|) $) (QREFELT $ 101))
       (SPADCALL (QREFELT $ 34) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddmeijer|) $) (QREFELT $ 101))
       (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;dhyper|) $)
                 (QREFELT $ 275))
       (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;dmeijer|) $)
                 (QREFELT $ 275))
       (SPADCALL (QREFELT $ 33) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvhypergeom|) $) (QREFELT $ 101))
       (SPADCALL (QREFELT $ 34) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvmeijer|) $) (QREFELT $ 101))
       (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;inhyper|) $)
                 (QREFELT $ 163))
       (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;inmeijer|) $)
                 (QREFELT $ 163))))
     ('T
      (QSETREFV $ 244
                (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;278|)
                      $))))
    (SPADCALL (QREFELT $ 13) (CONS #'|FunctionalSpecialFunction!0| $)
              (QREFELT $ 151))
    (SPADCALL (QREFELT $ 14) (CONS #'|FunctionalSpecialFunction!1| $)
              (QREFELT $ 151))
    (SPADCALL (QREFELT $ 16)
              (LIST (CONS (|function| |FSPECF;iBetaGrad1|) $)
                    (CONS (|function| |FSPECF;iBetaGrad2|) $))
              (QREFELT $ 158))
    (SPADCALL (QREFELT $ 17) (CONS #'|FunctionalSpecialFunction!2| $)
              (QREFELT $ 151))
    (SPADCALL (QREFELT $ 23) (ELT $ 48) (QREFELT $ 151))
    (SPADCALL (QREFELT $ 24) (CONS #'|FunctionalSpecialFunction!3| $)
              (QREFELT $ 151))
    (SPADCALL (QREFELT $ 25) (ELT $ 50) (QREFELT $ 151))
    (SPADCALL (QREFELT $ 26) (CONS #'|FunctionalSpecialFunction!4| $)
              (QREFELT $ 151))
    (SPADCALL (QREFELT $ 27) (CONS (|function| |FSPECF;dLambertW|) $)
              (QREFELT $ 151))
    (SPADCALL (QREFELT $ 29)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad3|) $))
              (QREFELT $ 158))
    (SPADCALL (QREFELT $ 30)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) $))
              (QREFELT $ 158))
    (SPADCALL (QREFELT $ 31)
              (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) $))
              (QREFELT $ 158))
    (SPADCALL (QREFELT $ 32)
              (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) $))
              (QREFELT $ 158))
    (SPADCALL (QREFELT $ 18) '|%specialDiff|
              (CONS (|function| |FSPECF;ipolygamma|) $) (QREFELT $ 101))
    (SPADCALL (QREFELT $ 19) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselJ|) $) (QREFELT $ 101))
    (SPADCALL (QREFELT $ 20) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselY|) $) (QREFELT $ 101))
    (SPADCALL (QREFELT $ 21) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselI|) $) (QREFELT $ 101))
    (SPADCALL (QREFELT $ 22) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselK|) $) (QREFELT $ 101))
    (SPADCALL (QREFELT $ 28) '|%specialDiff|
              (CONS (|function| |FSPECF;dPolylog|) $) (QREFELT $ 101))
    $))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 49)) (QREFELT $ 91))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 47)) (QREFELT $ 91))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| $)
  (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 42))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 41)) (SPADCALL |x| (QREFELT $ 37))
            (QREFELT $ 91))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (SPADCALL |x| (QREFELT $ 276))
            (QREFELT $ 91))) 

(MAKEPROP '|FunctionalSpecialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPECIAL
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opabs| '|opGamma| '|opGamma2| '|opBeta| '|opdigamma|
              '|oppolygamma| '|opBesselJ| '|opBesselY| '|opBesselI|
              '|opBesselK| '|opAiryAi| '|opAiryAiPrime| '|opAiryBi|
              '|opAiryBiPrime| '|opLambertW| '|opPolylog| '|opWeierstrassP|
              '|opWeierstrassPPrime| '|opWeierstrassSigma| '|opWeierstrassZeta|
              '|opHypergeometricF| '|opMeijerG| (5 . |elt|) |FSPECF;abs;2F;1|
              |FSPECF;Gamma;2F;2| (11 . |elt|) |FSPECF;Gamma;3F;3|
              |FSPECF;Beta;3F;4| |FSPECF;digamma;2F;5| |FSPECF;polygamma;3F;6|
              |FSPECF;besselJ;3F;7| |FSPECF;besselY;3F;8| |FSPECF;besselI;3F;9|
              |FSPECF;besselK;3F;10| |FSPECF;airyAi;2F;11|
              |FSPECF;airyAiPrime;2F;12| |FSPECF;airyBi;2F;13|
              |FSPECF;airyBiPrime;2F;14| |FSPECF;lambertW;2F;15|
              |FSPECF;polylog;3F;16| (18 . |elt|) |FSPECF;weierstrassP;4F;17|
              |FSPECF;weierstrassPPrime;4F;18| |FSPECF;weierstrassSigma;4F;19|
              |FSPECF;weierstrassZeta;4F;20| (26 . |Zero|) (30 . |Zero|)
              (|Boolean|) (34 . =) (40 . |One|) (44 . |One|)
              (|NonNegativeInteger|) (48 . <=) (|Integer|) (54 . |coerce|)
              (|List| 7) (59 . |concat|) (|List| $) (65 . |elt|)
              (71 . |hypergeometricF|) (78 . |meijerG|) (87 . |operator|)
              '|opdiff| (|Union| $ '"failed") (92 . |recip|) '|ahalf| '|athird|
              '|afourth| '|asixth| (|PositiveInteger|) (97 . *) '|twothirds|
              '|threehalfs| (103 . |elt|) (109 . |new|) (113 . |coerce|)
              (118 . |differentiate|) (124 . |kernel|) (130 . *) (136 . +)
              '|opWhittakerM| |FSPECF;whittakerM;4F;25| (|Mapping| 7 68)
              (|BasicOperatorFunctions1| 7) (142 . |evaluate|) (148 . /)
              (154 . -) (|None|) (160 . |setProperty|) '|opWhittakerW|
              |FSPECF;whittakerW;4F;30| '|opAngerJ| |FSPECF;angerJ;3F;35|
              (167 . |pi|) (171 . |sin|) (176 . -) '|opWeberE|
              |FSPECF;weberE;3F;41| (181 . ^)
              (|SparseMultivariatePolynomial| 6 172) (187 . |One|)
              (191 . |cos|) '|opStruveH| |FSPECF;struveH;3F;47| (196 . ^)
              (202 . |sqrt|) '|opStruveL| |FSPECF;struveL;3F;52| '|opHankelH1|
              |FSPECF;hankelH1;3F;57| '|opHankelH2| |FSPECF;hankelH2;3F;62|
              '|opLommelS1| |FSPECF;lommelS1;4F;67| '|opLommelS2|
              |FSPECF;lommelS2;4F;72| '|opKummerM| |FSPECF;kummerM;4F;77|
              '|opKummerU| |FSPECF;kummerU;4F;82| '|opLegendreP|
              |FSPECF;legendreP;4F;87| '|opLegendreQ| |FSPECF;legendreQ;4F;92|
              '|opKelvinBei| |FSPECF;kelvinBei;3F;97| |FSPECF;kelvinBer;3F;102|
              '|opKelvinBer| '|opKelvinKei| |FSPECF;kelvinKei;3F;107|
              |FSPECF;kelvinKer;3F;112| '|opKelvinKer| '|opEllipticK|
              |FSPECF;ellipticK;2F;117| |FSPECF;ellipticE;2F;121|
              (|Fraction| 66) (207 . |One|) (|Mapping| 7 7)
              (211 . |derivative|) '|opEllipticE| '|opEllipticE2|
              |FSPECF;ellipticE;3F;125| (217 . ^) |FSPECF;ellipticF;3F;131|
              (|List| 95) (223 . |derivative|) (|InputForm|) (229 . |convert|)
              (234 . |convert|) (|Mapping| 159 259) (239 . |input|)
              '|opEllipticF| '|opEllipticPi| |FSPECF;ellipticPi;4F;136|
              '|opJacobiSn| |FSPECF;jacobiSn;3F;142| (245 . |is?|) (|Kernel| $)
              (251 . |retract|) (|Kernel| 7) (256 . |argument|)
              |FSPECF;jacobiCn;3F;148| |FSPECF;jacobiDn;3F;153| '|opJacobiCn|
              '|opJacobiDn| '|opJacobiZeta| |FSPECF;jacobiZeta;3F;158|
              '|opJacobiTheta| |FSPECF;jacobiTheta;3F;163| '|opLerchPhi|
              |FSPECF;lerchPhi;4F;166| '|opRiemannZeta|
              |FSPECF;riemannZeta;2F;170| (261 . |has?|)
              |FSPECF;belong?;BoB;173| (267 . |is?|) |FSPECF;operator;2Bo;174|
              (273 . |kernel|) (279 . |zero?|) (284 . |smaller?|)
              (290 . |iAiryAi|) (295 . |iAiryAiPrime|) (300 . |iAiryBi|)
              (305 . |iAiryBiPrime|) (310 . |exp|) (315 . |iLambertW|)
              (320 . |log|) (325 . |dilog|) (330 . |iiPolylog|)
              (336 . |second|) (|Union| 206 '#1="failed")
              (341 . |retractIfCan|) (|Polynomial| 6) (|Fraction| 205)
              (346 . |numer|) (|Union| 6 '"failed") (351 . |retractIfCan|)
              (356 . |denom|) (361 . |abs|) (366 . |coerce|) (371 . |iiabs|)
              (376 . |retractIfCan|) (381 . |Gamma|) (386 . |iiGamma|)
              (391 . |Beta|) (397 . |iiBeta|) (402 . |digamma|)
              (407 . |iidigamma|) (412 . |polygamma|) (418 . |iipolygamma|)
              (423 . |besselJ|) (429 . |iiBesselJ|) (434 . |besselY|)
              (440 . |iiBesselY|) (445 . |besselI|) (451 . |iiBesselI|)
              (456 . |besselK|) (462 . |iiBesselK|) (467 . |airyAi|)
              (472 . |iiAiryAi|) (477 . |airyAiPrime|) (482 . |iiAiryAiPrime|)
              (487 . |airyBi|) (492 . |iiAiryBi|) (497 . |airyBiPrime|)
              (|Union| 66 '#1#) (502 . |retractIfCan|) (507 . |factorial|)
              (512 . |iiAiryBiPrime|) (517 . |third|) (522 . |evaluate|)
              (528 . |iiHypergeometricF|) (|List| 10) (533 . |variables|)
              (538 . |member?|) (544 . |retract|) (|List| 66) (|Mapping| 66 7)
              (|ListFunctions2| 7 66) (549 . |map|) (555 . |first|)
              (561 . |rest|) (567 . <=) (573 . ~=) (579 . |elt|) (585 . >)
              (|List| 159) (591 . |rest|) (|SExpression|) (597 . |integer|)
              (|List| 266) (602 . |rest|) (608 . |first|) (|OutputForm|)
              (614 . |bracket|) (619 . |prefix|) (625 . |coerce|)
              (|Mapping| 266 263) (|List| 263) (|ListFunctions2| 263 266)
              (630 . |map|) (636 . |concat|) (642 . |display|) (648 . |inv|))
           '#(|whittakerW| 653 |whittakerM| 660 |weierstrassZeta| 667
              |weierstrassSigma| 674 |weierstrassPPrime| 681 |weierstrassP| 688
              |weberE| 695 |struveL| 701 |struveH| 707 |riemannZeta| 713
              |polylog| 718 |polygamma| 724 |operator| 730 |meijerG| 735
              |lommelS2| 744 |lommelS1| 751 |lerchPhi| 758 |legendreQ| 765
              |legendreP| 772 |lambertW| 779 |kummerU| 784 |kummerM| 791
              |kelvinKer| 798 |kelvinKei| 804 |kelvinBer| 810 |kelvinBei| 816
              |jacobiZeta| 822 |jacobiTheta| 828 |jacobiSn| 834 |jacobiDn| 840
              |jacobiCn| 846 |iipolygamma| 852 |iidigamma| 857 |iiabs| 862
              |iiPolylog| 867 |iiHypergeometricF| 873 |iiGamma| 878 |iiBeta|
              883 |iiBesselY| 888 |iiBesselK| 893 |iiBesselJ| 898 |iiBesselI|
              903 |iiAiryBiPrime| 908 |iiAiryBi| 913 |iiAiryAiPrime| 918
              |iiAiryAi| 923 |iLambertW| 928 |iAiryBiPrime| 933 |iAiryBi| 938
              |iAiryAiPrime| 943 |iAiryAi| 948 |hypergeometricF| 953 |hankelH2|
              960 |hankelH1| 966 |ellipticPi| 972 |ellipticK| 979 |ellipticF|
              984 |ellipticE| 990 |digamma| 1001 |besselY| 1006 |besselK| 1012
              |besselJ| 1018 |besselI| 1024 |belong?| 1030 |angerJ| 1035
              |airyBiPrime| 1041 |airyBi| 1046 |airyAiPrime| 1051 |airyAi| 1056
              |abs| 1061 |Gamma| 1066 |Beta| 1077)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 276
                                                 '(1 11 9 10 12 2 7 0 9 0 35 3
                                                   7 0 9 0 0 38 4 7 0 9 0 0 0
                                                   53 0 6 0 58 0 7 0 59 2 7 60
                                                   0 0 61 0 6 0 62 0 7 0 63 2
                                                   64 60 0 0 65 1 7 0 66 67 2
                                                   68 0 0 0 69 2 7 0 9 70 71 3
                                                   0 7 68 68 7 72 5 0 7 68 68
                                                   68 68 7 73 1 7 9 9 74 1 7 76
                                                   0 77 2 7 0 82 0 83 2 68 7 0
                                                   66 86 0 10 0 87 1 7 0 10 88
                                                   2 7 0 0 10 89 2 7 0 9 70 90
                                                   2 7 0 0 0 91 2 7 0 0 0 92 2
                                                   96 9 9 95 97 2 7 0 0 0 98 2
                                                   7 0 0 0 99 3 9 0 0 10 100
                                                   101 0 7 0 106 1 7 0 0 107 1
                                                   7 0 0 108 2 7 0 0 66 111 0
                                                   112 0 113 1 7 0 0 114 2 7 0
                                                   0 0 117 1 7 0 0 118 0 148 0
                                                   149 2 96 9 9 150 151 2 7 0 0
                                                   82 155 2 96 9 9 157 158 1 10
                                                   159 0 160 1 159 0 70 161 2 9
                                                   0 0 162 163 2 7 60 0 9 169 1
                                                   7 170 0 171 1 172 68 0 173 2
                                                   9 60 0 10 186 2 9 60 0 10
                                                   188 2 7 0 9 0 190 1 7 60 0
                                                   191 2 7 60 0 0 192 1 0 7 7
                                                   193 1 0 7 7 194 1 0 7 7 195
                                                   1 0 7 7 196 1 7 0 0 197 1 0
                                                   7 7 198 1 7 0 0 199 1 7 0 0
                                                   200 2 0 7 7 7 201 1 68 7 0
                                                   202 1 7 203 0 204 1 206 205
                                                   0 207 1 205 208 0 209 1 206
                                                   205 0 210 1 6 0 0 211 1 7 0
                                                   6 212 1 0 7 7 213 1 7 208 0
                                                   214 1 6 0 0 215 1 0 7 7 216
                                                   2 6 0 0 0 217 1 0 7 68 218 1
                                                   6 0 0 219 1 0 7 7 220 2 6 0
                                                   0 0 221 1 0 7 68 222 2 6 0 0
                                                   0 223 1 0 7 68 224 2 6 0 0 0
                                                   225 1 0 7 68 226 2 6 0 0 0
                                                   227 1 0 7 68 228 2 6 0 0 0
                                                   229 1 0 7 68 230 1 6 0 0 231
                                                   1 0 7 7 232 1 6 0 0 233 1 0
                                                   7 7 234 1 6 0 0 235 1 0 7 7
                                                   236 1 6 0 0 237 1 7 238 0
                                                   239 1 66 0 0 240 1 0 7 7 241
                                                   1 68 7 0 242 2 96 9 9 150
                                                   243 1 0 7 68 244 1 7 245 0
                                                   246 2 245 60 10 0 247 1 7 66
                                                   0 248 2 251 249 250 68 252 2
                                                   68 0 0 64 253 2 68 0 0 64
                                                   254 2 66 60 0 0 255 2 64 60
                                                   0 0 256 2 249 66 0 66 257 2
                                                   66 60 0 0 258 2 259 0 0 64
                                                   260 1 261 66 0 262 2 263 0 0
                                                   64 264 2 263 0 0 64 265 1
                                                   266 0 70 267 2 266 0 0 70
                                                   268 1 10 266 0 269 2 272 263
                                                   270 271 273 2 263 0 0 0 274
                                                   2 9 0 0 270 275 1 7 0 0 276
                                                   3 0 7 7 7 7 103 3 0 7 7 7 7
                                                   94 3 0 7 7 7 7 57 3 0 7 7 7
                                                   7 56 3 0 7 7 7 7 55 3 0 7 7
                                                   7 7 54 2 0 7 7 7 110 2 0 7 7
                                                   7 120 2 0 7 7 7 116 1 0 7 7
                                                   185 2 0 7 7 7 52 2 0 7 7 7
                                                   42 1 0 9 9 189 5 1 7 68 68
                                                   68 68 7 73 3 0 7 7 7 7 128 3
                                                   0 7 7 7 7 126 3 0 7 7 7 7
                                                   183 3 0 7 7 7 7 136 3 0 7 7
                                                   7 7 134 1 0 7 7 51 3 0 7 7 7
                                                   7 132 3 0 7 7 7 7 130 2 0 7
                                                   7 7 143 2 0 7 7 7 142 2 0 7
                                                   7 7 139 2 0 7 7 7 138 2 0 7
                                                   7 7 179 2 0 7 7 7 181 2 0 7
                                                   7 7 168 2 0 7 7 7 175 2 0 7
                                                   7 7 174 1 0 7 68 222 1 0 7 7
                                                   220 1 0 7 7 213 2 0 7 7 7
                                                   201 1 0 7 68 244 1 0 7 7 216
                                                   1 0 7 68 218 1 0 7 68 226 1
                                                   0 7 68 230 1 0 7 68 224 1 0
                                                   7 68 228 1 0 7 7 241 1 0 7 7
                                                   236 1 0 7 7 234 1 0 7 7 232
                                                   1 0 7 7 198 1 0 7 7 196 1 0
                                                   7 7 195 1 0 7 7 194 1 0 7 7
                                                   193 3 1 7 68 68 7 72 2 0 7 7
                                                   7 124 2 0 7 7 7 122 3 0 7 7
                                                   7 7 166 1 0 7 7 146 2 0 7 7
                                                   7 156 2 0 7 7 7 154 1 0 7 7
                                                   147 1 0 7 7 41 2 0 7 7 7 44
                                                   2 0 7 7 7 46 2 0 7 7 7 43 2
                                                   0 7 7 7 45 1 0 60 9 187 2 0
                                                   7 7 7 105 1 0 7 7 50 1 0 7 7
                                                   49 1 0 7 7 48 1 0 7 7 47 1 0
                                                   7 7 36 1 0 7 7 37 2 0 7 7 7
                                                   39 2 0 7 7 7 40)))))
           '|lookupComplete|)) 
