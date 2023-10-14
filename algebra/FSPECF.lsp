
(SDEFUN |FSPECF;abs;2F;1| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;Gamma;2F;2| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;Gamma;3F;3| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 15) |a| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;Beta;3F;4| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 16) |x| |y| (QREFELT $ 47))) 

(SDEFUN |FSPECF;digamma;2F;5| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;polygamma;3F;6| ((|k| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) |k| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;besselJ;3F;7| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 19) |a| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;besselY;3F;8| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 20) |a| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;besselI;3F;9| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 21) |a| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;besselK;3F;10| ((|a| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 22) |a| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;airyAi;2F;11| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;airyAiPrime;2F;12| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;airyBi;2F;13| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;airyBiPrime;2F;14| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;lambertW;2F;15| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 44))) 

(SDEFUN |FSPECF;polylog;3F;16| ((|s| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) |s| |x| (QREFELT $ 47))) 

(SDEFUN |FSPECF;weierstrassP;4F;17| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) |g2| |g3| |x| (QREFELT $ 62))) 

(SDEFUN |FSPECF;weierstrassPPrime;4F;18| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) |g2| |g3| |x| (QREFELT $ 62))) 

(SDEFUN |FSPECF;weierstrassSigma;4F;19| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 31) |g2| |g3| |x| (QREFELT $ 62))) 

(SDEFUN |FSPECF;weierstrassZeta;4F;20| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) |g2| |g3| |x| (QREFELT $ 62))) 

(SDEFUN |FSPECF;hypergeometricF;2L2F;21|
        ((|a| |List| F) (|b| |List| F) (|z| F) ($ F))
        (SPROG
         ((|q| (F)) (|p| (F)) (|nbi| #1=(|NonNegativeInteger|)) (|nai| #1#))
         (SEQ (LETT |nai| (LENGTH |a|) . #2=(|FSPECF;hypergeometricF;2L2F;21|))
              (LETT |nbi| (LENGTH |b|) . #2#)
              (COND
               ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
                (COND
                 ((SPADCALL |nai| (+ |nbi| 1) (QREFELT $ 74))
                  (EXIT (|spadConstant| $ 72))))))
              (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT $ 76)) . #2#)
              (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT $ 76)) . #2#)
              (EXIT
               (SPADCALL (QREFELT $ 33)
                         (SPADCALL
                          (SPADCALL |a|
                                    (SPADCALL |b| (LIST |z|) (QREFELT $ 78))
                                    (QREFELT $ 78))
                          (LIST |p| |q|) (QREFELT $ 78))
                         (QREFELT $ 80)))))) 

(SDEFUN |FSPECF;meijerG;4L2F;22|
        ((|a| |List| F) (|b| |List| F) (|c| |List| F) (|d| |List| F) (|z| F)
         ($ F))
        (SPROG ((|m2| (F)) (|m1| (F)) (|n2| (F)) (|n1| (F)))
               (SEQ
                (LETT |n1| (SPADCALL (LENGTH |a|) (QREFELT $ 76))
                      . #1=(|FSPECF;meijerG;4L2F;22|))
                (LETT |n2| (SPADCALL (LENGTH |b|) (QREFELT $ 76)) . #1#)
                (LETT |m1| (SPADCALL (LENGTH |c|) (QREFELT $ 76)) . #1#)
                (LETT |m2| (SPADCALL (LENGTH |d|) (QREFELT $ 76)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 34)
                           (SPADCALL
                            (SPADCALL |a|
                                      (SPADCALL |b|
                                                (SPADCALL |c|
                                                          (SPADCALL |d|
                                                                    (LIST |z|)
                                                                    (QREFELT $
                                                                             78))
                                                          (QREFELT $ 78))
                                                (QREFELT $ 78))
                                      (QREFELT $ 78))
                            (LIST |n1| |n2| |m1| |m2|) (QREFELT $ 78))
                           (QREFELT $ 80)))))) 

(SDEFUN |FSPECF;grad2|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d2| |Mapping| F F F) ($ F))
        (SPROG ((|dm| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ
                (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;grad2|))
                (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 98))
                            (SPADCALL (QREFELT $ 84)
                                      (LIST
                                       (SPADCALL |op| (LIST |dm| |x2|)
                                                 (QREFELT $ 80))
                                       |dm| |x1|)
                                      (QREFELT $ 99))
                            (QREFELT $ 100))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 98))
                            (SPADCALL |x1| |x2| |d2|) (QREFELT $ 100))
                  (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;grad3|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d3| |Mapping| F F F F) ($ F))
        (SPROG ((|dm2| (F)) (|dm1| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
               (SEQ
                (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;grad3|))
                (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (LETT |x3| (SPADCALL |l| 3 (QREFELT $ 95)) . #1#)
                (LETT |dm1| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                      . #1#)
                (LETT |dm2| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 98))
                             (SPADCALL (QREFELT $ 84)
                                       (LIST
                                        (SPADCALL |op| (LIST |dm1| |x2| |x3|)
                                                  (QREFELT $ 80))
                                        |dm1| |x1|)
                                       (QREFELT $ 99))
                             (QREFELT $ 100))
                   (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 98))
                             (SPADCALL (QREFELT $ 84)
                                       (LIST
                                        (SPADCALL |op| (LIST |x1| |dm2| |x3|)
                                                  (QREFELT $ 80))
                                        |dm2| |x2|)
                                       (QREFELT $ 99))
                             (QREFELT $ 100))
                   (QREFELT $ 101))
                  (SPADCALL (SPADCALL |x3| |t| (QREFELT $ 98))
                            (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT $ 100))
                  (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;grad4|
        ((|l| |List| F) (|t| |Symbol|) (|op| |BasicOperator|)
         (|d4| |Mapping| F F F F F) ($ F))
        (SPROG
         ((|kd3| (F)) (|kd2| (F)) (|kd1| (F)) (|dm3| (F)) (|dm2| (F))
          (|dm1| (F)) (|x4| (F)) (|x3| (F)) (|x2| (F)) (|x1| (F)))
         (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 95)) . #1=(|FSPECF;grad4|))
              (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
              (LETT |x3| (SPADCALL |l| 3 (QREFELT $ 95)) . #1#)
              (LETT |x4| (SPADCALL |l| 4 (QREFELT $ 95)) . #1#)
              (LETT |dm1| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                    . #1#)
              (LETT |dm2| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                    . #1#)
              (LETT |dm3| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                    . #1#)
              (LETT |kd1|
                    (SPADCALL (QREFELT $ 84)
                              (LIST
                               (SPADCALL |op| (LIST |dm1| |x2| |x3| |x4|)
                                         (QREFELT $ 80))
                               |dm1| |x1|)
                              (QREFELT $ 99))
                    . #1#)
              (LETT |kd2|
                    (SPADCALL (QREFELT $ 84)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |dm2| |x3| |x4|)
                                         (QREFELT $ 80))
                               |dm2| |x2|)
                              (QREFELT $ 99))
                    . #1#)
              (LETT |kd3|
                    (SPADCALL (QREFELT $ 84)
                              (LIST
                               (SPADCALL |op| (LIST |x1| |x2| |dm3| |x4|)
                                         (QREFELT $ 80))
                               |dm3| |x3|)
                              (QREFELT $ 99))
                    . #1#)
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 98)) |kd1|
                            (QREFELT $ 100))
                  (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 98)) |kd2|
                            (QREFELT $ 100))
                  (QREFELT $ 101))
                 (SPADCALL (SPADCALL |x3| |t| (QREFELT $ 98)) |kd3|
                           (QREFELT $ 100))
                 (QREFELT $ 101))
                (SPADCALL (SPADCALL |x4| |t| (QREFELT $ 98))
                          (SPADCALL |x1| |x2| |x3| |x4| |d4|) (QREFELT $ 100))
                (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;whittakerM;4F;26| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 102) |k| |m| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eWhittakerM| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 102) (LIST |k| |m| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elWhittakerM| ((|l| |List| F) ($ F))
        (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eWhittakerMGrad_z| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 87) (SPADCALL |k| |z| (QREFELT $ 107))
                    (QREFELT $ 108))
          (SPADCALL |k| |m| |z| (QREFELT $ 103)) (QREFELT $ 100))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT $ 87) |k| (QREFELT $ 101)) |m|
                     (QREFELT $ 101))
           (SPADCALL (SPADCALL |k| (|spadConstant| $ 72) (QREFELT $ 101)) |m|
                     |z| (QREFELT $ 103))
           (QREFELT $ 100))
          |z| (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dWhittakerM| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 102)
         (CONS (|function| |FSPECF;eWhittakerMGrad_z|) $) $)) 

(SDEFUN |FSPECF;whittakerW;4F;31| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 111) |k| |m| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eWhittakerW| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 111) (LIST |k| |m| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elWhittakerW| ((|l| |List| F) ($ F))
        (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eWhittakerWGrad_z| ((|k| F) (|m| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 87) (SPADCALL |k| |z| (QREFELT $ 107))
                    (QREFELT $ 108))
          (SPADCALL |k| |m| |z| (QREFELT $ 112)) (QREFELT $ 100))
         (SPADCALL
          (SPADCALL (SPADCALL |k| (|spadConstant| $ 72) (QREFELT $ 101)) |m|
                    |z| (QREFELT $ 112))
          |z| (QREFELT $ 107))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;dWhittakerW| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 111)
         (CONS (|function| |FSPECF;eWhittakerWGrad_z|) $) $)) 

(SDEFUN |FSPECF;angerJ;3F;36| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 113) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eAngerJ| ((|v| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 115)) (QREFELT $ 100))
                     (QREFELT $ 116))
           (SPADCALL |v| (SPADCALL (QREFELT $ 115)) (QREFELT $ 100))
           (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 113) (LIST |v| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elAngerJ| ((|l| |List| F) ($ F))
        (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eAngerJGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 114))
           (QREFELT $ 117))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 114)) (QREFELT $ 100))
           |z| (QREFELT $ 107))
          (QREFELT $ 101))
         (SPADCALL
          (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 115)) (QREFELT $ 100))
                    (QREFELT $ 116))
          (SPADCALL (SPADCALL (QREFELT $ 115)) |z| (QREFELT $ 100))
          (QREFELT $ 107))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;dAngerJ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 113)
         (CONS (|function| |FSPECF;eAngerJGrad_z|) $) $)) 

(SDEFUN |FSPECF;eeAngerJ| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 113) |l| (QREFELT $ 99))) 

(SDEFUN |FSPECF;weberE;3F;42| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 118) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eWeberE| ((|v| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (SPADCALL
           (SPADCALL 2
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT $ 87) |v| (QREFELT $ 100))
                                 (SPADCALL (QREFELT $ 115)) (QREFELT $ 100))
                       (QREFELT $ 116))
                      2 (QREFELT $ 120))
                     (QREFELT $ 92))
           (SPADCALL |v| (SPADCALL (QREFELT $ 115)) (QREFELT $ 100))
           (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 118) (LIST |v| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elWeberE| ((|l| |List| F) ($ F))
        (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eWeberEGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 119))
           (QREFELT $ 117))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 119)) (QREFELT $ 100))
           |z| (QREFELT $ 107))
          (QREFELT $ 101))
         (SPADCALL
          (SPADCALL (|spadConstant| $ 72)
                    (SPADCALL
                     (SPADCALL |v| (SPADCALL (QREFELT $ 115)) (QREFELT $ 100))
                     (QREFELT $ 123))
                    (QREFELT $ 108))
          (SPADCALL (SPADCALL (QREFELT $ 115)) |z| (QREFELT $ 100))
          (QREFELT $ 107))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;dWeberE| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 118)
         (CONS (|function| |FSPECF;eWeberEGrad_z|) $) $)) 

(SDEFUN |FSPECF;eeWeberE| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 118) |l| (QREFELT $ 99))) 

(SDEFUN |FSPECF;struveH;3F;48| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 124) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eStruveH| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 124) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elStruveH| ((|l| |List| F) ($ F))
        (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eStruveHGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 125))
           (QREFELT $ 117))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 125)) (QREFELT $ 100))
           |z| (QREFELT $ 107))
          (QREFELT $ 101))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 87) |z| (QREFELT $ 100)) |v|
                    (QREFELT $ 126))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 115)) (QREFELT $ 127))
                    (SPADCALL (SPADCALL |v| (QREFELT $ 94) (QREFELT $ 101))
                              (QREFELT $ 46))
                    (QREFELT $ 100))
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dStruveH| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 124)
         (CONS (|function| |FSPECF;eStruveHGrad_z|) $) $)) 

(SDEFUN |FSPECF;struveL;3F;53| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 128) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eStruveL| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 128) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elStruveL| ((|l| |List| F) ($ F))
        (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eStruveLGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                    (QREFELT $ 129))
          (SPADCALL
           (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 129)) (QREFELT $ 100))
           |z| (QREFELT $ 107))
          (QREFELT $ 101))
         (SPADCALL
          (SPADCALL (SPADCALL (QREFELT $ 87) |z| (QREFELT $ 100)) |v|
                    (QREFELT $ 126))
          (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 115)) (QREFELT $ 127))
                    (SPADCALL (SPADCALL |v| (QREFELT $ 94) (QREFELT $ 101))
                              (QREFELT $ 46))
                    (QREFELT $ 100))
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dStruveL| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 128)
         (CONS (|function| |FSPECF;eStruveLGrad_z|) $) $)) 

(SDEFUN |FSPECF;hankelH1;3F;58| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 130) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eHankelH1| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 130) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elHankelH1| ((|l| |List| F) ($ F))
        (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eHankelH1Grad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                    (QREFELT $ 131))
          (QREFELT $ 117))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 131)) (QREFELT $ 100)) |z|
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dHankelH1| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 130)
         (CONS (|function| |FSPECF;eHankelH1Grad_z|) $) $)) 

(SDEFUN |FSPECF;hankelH2;3F;63| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 132) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eHankelH2| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 132) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elHankelH2| ((|l| |List| F) ($ F))
        (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eHankelH2Grad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                    (QREFELT $ 133))
          (QREFELT $ 117))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 133)) (QREFELT $ 100)) |z|
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dHankelH2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 132)
         (CONS (|function| |FSPECF;eHankelH2Grad_z|) $) $)) 

(SDEFUN |FSPECF;lommelS1;4F;68| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 134) |m| |v| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eLommelS1| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 134) (LIST |m| |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elLommelS1| ((|l| |List| F) ($ F))
        (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eLommelS1Grad_z| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 135))
                     (QREFELT $ 100))
           |z| (QREFELT $ 107))
          (QREFELT $ 117))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT $ 101)) (|spadConstant| $ 72)
                    (QREFELT $ 108))
          (SPADCALL (SPADCALL |m| (|spadConstant| $ 72) (QREFELT $ 108))
                    (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 108)) |z|
                    (QREFELT $ 135))
          (QREFELT $ 100))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dLommelS1| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 134)
         (CONS (|function| |FSPECF;eLommelS1Grad_z|) $) $)) 

(SDEFUN |FSPECF;lommelS2;4F;73| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 136) |mu| |nu| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eLommelS2| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 136) (LIST |mu| |nu| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elLommelS2| ((|l| |List| F) ($ F))
        (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eLommelS2Grad_z| ((|m| F) (|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 137))
                     (QREFELT $ 100))
           |z| (QREFELT $ 107))
          (QREFELT $ 117))
         (SPADCALL
          (SPADCALL (SPADCALL |m| |v| (QREFELT $ 101)) (|spadConstant| $ 72)
                    (QREFELT $ 108))
          (SPADCALL (SPADCALL |m| (|spadConstant| $ 72) (QREFELT $ 108))
                    (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 108)) |z|
                    (QREFELT $ 137))
          (QREFELT $ 100))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dLommelS2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 136)
         (CONS (|function| |FSPECF;eLommelS2Grad_z|) $) $)) 

(SDEFUN |FSPECF;kummerM;4F;78| ((|mu| F) (|nu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 138) |mu| |nu| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eKummerM| ((|a| F) (|b| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ('T (SPADCALL (QREFELT $ 138) (LIST |a| |b| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elKummerM| ((|l| |List| F) ($ F))
        (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eKummerMGrad_z| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT $ 101)) |b| (QREFELT $ 108))
           (SPADCALL |a| |b| |z| (QREFELT $ 139)) (QREFELT $ 100))
          (SPADCALL (SPADCALL |b| |a| (QREFELT $ 108))
                    (SPADCALL
                     (SPADCALL |a| (|spadConstant| $ 72) (QREFELT $ 108)) |b|
                     |z| (QREFELT $ 139))
                    (QREFELT $ 100))
          (QREFELT $ 101))
         |z| (QREFELT $ 107))) 

(SDEFUN |FSPECF;dKummerM| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 138)
         (CONS (|function| |FSPECF;eKummerMGrad_z|) $) $)) 

(SDEFUN |FSPECF;kummerU;4F;83| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 140) |a| |b| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eKummerU| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 140) (LIST |a| |b| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elKummerU| ((|l| |List| F) ($ F))
        (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eKummerUGrad_z| ((|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL |z| |a| (QREFELT $ 101)) |b| (QREFELT $ 108))
           (SPADCALL |a| |b| |z| (QREFELT $ 141)) (QREFELT $ 100))
          (SPADCALL (SPADCALL |a| (|spadConstant| $ 72) (QREFELT $ 108)) |b|
                    |z| (QREFELT $ 141))
          (QREFELT $ 108))
         |z| (QREFELT $ 107))) 

(SDEFUN |FSPECF;dKummerU| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 140)
         (CONS (|function| |FSPECF;eKummerUGrad_z|) $) $)) 

(SDEFUN |FSPECF;legendreP;4F;88| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 142) |nu| |mu| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eLegendreP| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 142) (LIST |nu| |mu| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elLegendreP| ((|l| |List| F) ($ F))
        (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eLegendrePGrad_z| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 108)) (|spadConstant| $ 72)
                    (QREFELT $ 101))
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 72) (QREFELT $ 101)) |mu|
                    |z| (QREFELT $ 143))
          (QREFELT $ 100))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                    (QREFELT $ 100))
          (SPADCALL |nu| |mu| |z| (QREFELT $ 143)) (QREFELT $ 100))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;dLegendreP| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 142)
         (CONS (|function| |FSPECF;eLegendrePGrad_z|) $) $)) 

(SDEFUN |FSPECF;legendreQ;4F;93| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 144) |nu| |mu| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eLegendreQ| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 144) (LIST |nu| |mu| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elLegendreQ| ((|l| |List| F) ($ F))
        (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eLegendreQGrad_z| ((|nu| F) (|mu| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 108)) (|spadConstant| $ 72)
                    (QREFELT $ 101))
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 72) (QREFELT $ 101)) |mu|
                    |z| (QREFELT $ 145))
          (QREFELT $ 100))
         (SPADCALL
          (SPADCALL (SPADCALL |nu| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                    (QREFELT $ 100))
          (SPADCALL |nu| |mu| |z| (QREFELT $ 145)) (QREFELT $ 100))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;dLegendreQ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 144)
         (CONS (|function| |FSPECF;eLegendreQGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinBei;3F;98| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 146) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eKelvinBei| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 146) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elKelvinBei| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eKelvinBeiGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 87)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 76)) (QREFELT $ 127))
                    (QREFELT $ 100))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 147))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 148))
           (QREFELT $ 108))
          (QREFELT $ 100))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 147)) (QREFELT $ 100)) |z|
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dKelvinBei| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 146)
         (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinBer;3F;103| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 149) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eKelvinBer| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 149) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elKelvinBer| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eKelvinBerGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 87)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 76)) (QREFELT $ 127))
                    (QREFELT $ 100))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 148))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 147))
           (QREFELT $ 101))
          (QREFELT $ 100))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 148)) (QREFELT $ 100)) |z|
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dKelvinBer| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 149)
         (CONS (|function| |FSPECF;eKelvinBerGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinKei;3F;108| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 150) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eKelvinKei| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 150) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elKelvinKei| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eKelvinKeiGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 87)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 76)) (QREFELT $ 127))
                    (QREFELT $ 100))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 151))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 152))
           (QREFELT $ 108))
          (QREFELT $ 100))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 151)) (QREFELT $ 100)) |z|
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dKelvinKei| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 150)
         (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) $) $)) 

(SDEFUN |FSPECF;kelvinKer;3F;113| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 153) |v| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eKelvinKer| ((|v| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 153) (LIST |v| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elKelvinKer| ((|l| |List| F) ($ F))
        (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eKelvinKerGrad_z| ((|v| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (QREFELT $ 87)
                    (SPADCALL (SPADCALL 2 (QREFELT $ 76)) (QREFELT $ 127))
                    (QREFELT $ 100))
          (SPADCALL
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 152))
           (SPADCALL (SPADCALL |v| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                     (QREFELT $ 151))
           (QREFELT $ 101))
          (QREFELT $ 100))
         (SPADCALL
          (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 152)) (QREFELT $ 100)) |z|
          (QREFELT $ 107))
         (QREFELT $ 101))) 

(SDEFUN |FSPECF;dKelvinKer| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 153)
         (CONS (|function| |FSPECF;eKelvinKerGrad_z|) $) $)) 

(SDEFUN |FSPECF;ellipticK;2F;118| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 154) |m| (QREFELT $ 44))) 

(SDEFUN |FSPECF;eEllipticK| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 154) (LIST |m|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elEllipticK| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;dEllipticK| ((|m| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 87)
                   (SPADCALL (SPADCALL |m| (QREFELT $ 156))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 72) |m|
                                        (QREFELT $ 108))
                              (SPADCALL |m| (QREFELT $ 155)) (QREFELT $ 100))
                             (QREFELT $ 108))
                   (QREFELT $ 100))
         (SPADCALL |m| (SPADCALL (|spadConstant| $ 72) |m| (QREFELT $ 108))
                   (QREFELT $ 100))
         (QREFELT $ 107))) 

(SDEFUN |FSPECF;ellipticE;2F;122| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 161) |m| (QREFELT $ 44))) 

(SDEFUN |FSPECF;eEllipticE| ((|m| F) ($ F))
        (SPADCALL (QREFELT $ 161) (LIST |m|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elEllipticE| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;dEllipticE| ((|m| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 87)
                   (SPADCALL (SPADCALL |m| (QREFELT $ 156))
                             (SPADCALL |m| (QREFELT $ 155)) (QREFELT $ 108))
                   (QREFELT $ 100))
         |m| (QREFELT $ 107))) 

(SDEFUN |FSPECF;ellipticE;3F;126| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 162) |z| |m| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eEllipticE2| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 68))
         ((SPADCALL |z| (|spadConstant| $ 72) (QREFELT $ 70))
          (|FSPECF;eEllipticE| |m| $))
         ('T (SPADCALL (QREFELT $ 162) (LIST |z| |m|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elEllipticE2| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eEllipticE2Grad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eEllipticE2Grad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 72)
                             (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 164))
                                       (QREFELT $ 100))
                             (QREFELT $ 108))
                   (QREFELT $ 127))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 72)
                             (SPADCALL |z| 2 (QREFELT $ 164)) (QREFELT $ 108))
                   (QREFELT $ 127))
                  (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;eEllipticE2Grad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eEllipticE2Grad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 87)
                            (SPADCALL (SPADCALL |z| |m| (QREFELT $ 163))
                                      (SPADCALL |z| |m| (QREFELT $ 165))
                                      (QREFELT $ 108))
                            (QREFELT $ 100))
                  |m| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;inEllipticE2| ((|li| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT $ 169)) |li|)
                  (QREFELT $ 170))) 

(SDEFUN |FSPECF;ellipticF;3F;132| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 173) |z| |m| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eEllipticF| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 68))
         ((SPADCALL |z| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL |m| (QREFELT $ 155)))
         ('T (SPADCALL (QREFELT $ 173) (LIST |z| |m|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elEllipticF| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eEllipticFGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eEllipticFGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 72)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 72)
                                       (SPADCALL |m|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 164))
                                                 (QREFELT $ 100))
                                       (QREFELT $ 108))
                             (QREFELT $ 127))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 72)
                                       (SPADCALL |z| 2 (QREFELT $ 164))
                                       (QREFELT $ 108))
                             (QREFELT $ 127))
                            (QREFELT $ 100))
                           (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;eEllipticFGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eEllipticFGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 87)
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 163))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 72) |m|
                                                   (QREFELT $ 108))
                                         (SPADCALL |z| |m| (QREFELT $ 165))
                                         (QREFELT $ 100))
                                        (QREFELT $ 108))
                              |m| (QREFELT $ 107))
                             (SPADCALL
                              (SPADCALL |z|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| $ 72)
                                                   (SPADCALL |z| 2
                                                             (QREFELT $ 164))
                                                   (QREFELT $ 108))
                                         (QREFELT $ 127))
                                        (QREFELT $ 100))
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 72)
                                         (SPADCALL |m|
                                                   (SPADCALL |z| 2
                                                             (QREFELT $ 164))
                                                   (QREFELT $ 100))
                                         (QREFELT $ 108))
                               (QREFELT $ 127))
                              (QREFELT $ 107))
                             (QREFELT $ 108))
                            (QREFELT $ 100))
                  (SPADCALL (|spadConstant| $ 72) |m| (QREFELT $ 108))
                  (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;ellipticPi;4F;137| ((|z| F) (|n| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 174) |z| |n| |m| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eEllipticPi| ((|z| F) (|n| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 68))
         ('T (SPADCALL (QREFELT $ 174) (LIST |z| |n| |m|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elEllipticPi| ((|l| |List| F) ($ F))
        (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eEllipticPiGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eEllipticPiGrad_z|))
                (LETT |n| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (LETT |m| (SPADCALL |l| 3 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL (|spadConstant| $ 72)
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 72)
                                       (SPADCALL |n|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 164))
                                                 (QREFELT $ 100))
                                       (QREFELT $ 108))
                             (SPADCALL
                              (SPADCALL (|spadConstant| $ 72)
                                        (SPADCALL |m|
                                                  (SPADCALL |z| 2
                                                            (QREFELT $ 164))
                                                  (QREFELT $ 100))
                                        (QREFELT $ 108))
                              (QREFELT $ 127))
                             (QREFELT $ 100))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 72)
                                       (SPADCALL |z| 2 (QREFELT $ 164))
                                       (QREFELT $ 108))
                             (QREFELT $ 127))
                            (QREFELT $ 100))
                           (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_n| ((|l| |List| F) ($ F))
        (SPROG
         ((|t4| (F)) (|t3| (F)) (|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F))
          (|z| (F)))
         (SEQ
          (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                . #1=(|FSPECF;eEllipticPiGrad_n|))
          (LETT |n| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
          (LETT |m| (SPADCALL |l| 3 (QREFELT $ 95)) . #1#)
          (LETT |t1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |n| 2 (QREFELT $ 164)) |m|
                             (QREFELT $ 108))
                   (SPADCALL |z| |n| |m| (QREFELT $ 175)) (QREFELT $ 100))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                    (SPADCALL |n| |m| (QREFELT $ 108)) (QREFELT $ 100))
                   |n| (QREFELT $ 100))
                  (QREFELT $ 107))
                 (QREFELT $ 117))
                . #1#)
          (LETT |t2|
                (SPADCALL (SPADCALL |z| |m| (QREFELT $ 165))
                          (SPADCALL
                           (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                           |n| (QREFELT $ 100))
                          (QREFELT $ 107))
                . #1#)
          (LETT |t3|
                (SPADCALL
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 163))
                           (SPADCALL
                            (SPADCALL |n| (|spadConstant| $ 72)
                                      (QREFELT $ 108))
                            (SPADCALL |n| |m| (QREFELT $ 108)) (QREFELT $ 100))
                           (QREFELT $ 107))
                 (QREFELT $ 117))
                . #1#)
          (LETT |t4|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |n| |z| (QREFELT $ 100))
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 72)
                                       (SPADCALL |m|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 164))
                                                 (QREFELT $ 100))
                                       (QREFELT $ 108))
                             (QREFELT $ 127))
                            (QREFELT $ 100))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 72)
                             (SPADCALL |z| 2 (QREFELT $ 164)) (QREFELT $ 108))
                   (QREFELT $ 127))
                  (QREFELT $ 100))
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 72)
                             (SPADCALL |n| (SPADCALL |z| 2 (QREFELT $ 164))
                                       (QREFELT $ 100))
                             (QREFELT $ 108))
                   (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                   (QREFELT $ 100))
                  (SPADCALL |n| |m| (QREFELT $ 108)) (QREFELT $ 100))
                 (QREFELT $ 107))
                . #1#)
          (EXIT
           (SPADCALL (QREFELT $ 87)
                     (SPADCALL
                      (SPADCALL (SPADCALL |t1| |t2| (QREFELT $ 101)) |t3|
                                (QREFELT $ 101))
                      |t4| (QREFELT $ 101))
                     (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;eEllipticPiGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|t2| (F)) (|t1| (F)) (|m| (F)) (|n| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eEllipticPiGrad_m|))
                (LETT |n| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (LETT |m| (SPADCALL |l| 3 (QREFELT $ 95)) . #1#)
                (LETT |t1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |m| |z| (QREFELT $ 100))
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 72)
                                            (SPADCALL |z| 2 (QREFELT $ 164))
                                            (QREFELT $ 108))
                                  (QREFELT $ 127))
                                 (QREFELT $ 100))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 72)
                                  (SPADCALL |m|
                                            (SPADCALL |z| 2 (QREFELT $ 164))
                                            (QREFELT $ 100))
                                  (QREFELT $ 108))
                        (QREFELT $ 127))
                       (QREFELT $ 107))
                      . #1#)
                (LETT |t2|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |z| |m| (QREFELT $ 163))
                                  (QREFELT $ 117))
                        |t1| (QREFELT $ 101))
                       (SPADCALL (|spadConstant| $ 72) |m| (QREFELT $ 108))
                       (QREFELT $ 107))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT $ 87)
                            (SPADCALL (SPADCALL |z| |n| |m| (QREFELT $ 175))
                                      |t2| (QREFELT $ 101))
                            (QREFELT $ 100))
                  (SPADCALL |n| |m| (QREFELT $ 108)) (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;jacobiSn;3F;143| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 176) |z| |m| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eJacobiSn| ((|z| F) (|m| F) ($ F))
        (SPROG ((#1=#:G501 NIL) (|args| (|List| F)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
                   (|spadConstant| $ 68))
                  ('T
                   (SEQ
                    (COND
                     ((SPADCALL |z| (QREFELT $ 173) (QREFELT $ 178))
                      (SEQ
                       (LETT |args|
                             (SPADCALL (SPADCALL |z| (QREFELT $ 180))
                                       (QREFELT $ 182))
                             . #2=(|FSPECF;eJacobiSn|))
                       (EXIT
                        (COND
                         ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT $ 95))
                                    (QREFELT $ 70))
                          (PROGN
                           (LETT #1# (SPADCALL |args| 1 (QREFELT $ 95)) . #2#)
                           (GO #3=#:G500))))))))
                    (EXIT
                     (SPADCALL (QREFELT $ 176) (LIST |z| |m|)
                               (QREFELT $ 99)))))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;elJacobiSn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;jacobiGradHelper| ((|z| F) (|m| F) ($ F))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT $ 177)) |m|
                              (QREFELT $ 163))
                    (SPADCALL (|spadConstant| $ 72) |m| (QREFELT $ 108))
                    (QREFELT $ 107))
                   (QREFELT $ 108))
         |m| (QREFELT $ 107))) 

(SDEFUN |FSPECF;eJacobiSnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiSnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |z| |m| (QREFELT $ 183))
                           (SPADCALL |z| |m| (QREFELT $ 184))
                           (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;eJacobiSnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiSnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 87)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 100))
                            (SPADCALL
                             (SPADCALL (SPADCALL |z| |m| (QREFELT $ 177))
                                       (SPADCALL
                                        (SPADCALL |z| |m| (QREFELT $ 183)) 2
                                        (QREFELT $ 120))
                                       (QREFELT $ 100))
                             (SPADCALL (|spadConstant| $ 72) |m|
                                       (QREFELT $ 108))
                             (QREFELT $ 107))
                            (QREFELT $ 101))
                           (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;jacobiCn;3F;149| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 185) |z| |m| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eJacobiCn| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ('T (SPADCALL (QREFELT $ 185) (LIST |z| |m|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elJacobiCn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eJacobiCnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiCnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |z| |m| (QREFELT $ 177))
                            (SPADCALL |z| |m| (QREFELT $ 184)) (QREFELT $ 100))
                  (QREFELT $ 117)))))) 

(SDEFUN |FSPECF;eJacobiCnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiCnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 87)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 100))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 177)) 2
                                        (QREFELT $ 120))
                              (SPADCALL |z| |m| (QREFELT $ 183))
                              (QREFELT $ 100))
                             (SPADCALL (|spadConstant| $ 72) |m|
                                       (QREFELT $ 108))
                             (QREFELT $ 107))
                            (QREFELT $ 108))
                           (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;jacobiDn;3F;154| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 186) |z| |m| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eJacobiDn| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ('T (SPADCALL (QREFELT $ 186) (LIST |z| |m|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elJacobiDn| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eJacobiDnGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiDnGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 177))
                             (QREFELT $ 100))
                   (SPADCALL |z| |m| (QREFELT $ 183)) (QREFELT $ 100))
                  (QREFELT $ 117)))))) 

(SDEFUN |FSPECF;eJacobiDnGrad_m| ((|l| |List| F) ($ F))
        (SPROG ((|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiDnGrad_m|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (EXIT
                 (SPADCALL (QREFELT $ 87)
                           (SPADCALL
                            (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| $)
                                      (|FSPECF;jacobiGradHelper| |z| |m| $)
                                      (QREFELT $ 100))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 177)) 2
                                        (QREFELT $ 120))
                              (SPADCALL |z| |m| (QREFELT $ 184))
                              (QREFELT $ 100))
                             (SPADCALL (|spadConstant| $ 72) |m|
                                       (QREFELT $ 108))
                             (QREFELT $ 107))
                            (QREFELT $ 108))
                           (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;jacobiZeta;3F;159| ((|z| F) (|m| F) ($ F))
        (SPADCALL (QREFELT $ 187) |z| |m| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eJacobiZeta| ((|z| F) (|m| F) ($ F))
        (COND
         ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 68))
         ('T (SPADCALL (QREFELT $ 187) (LIST |z| |m|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elJacobiZeta| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eJacobiZetaGrad_z| ((|l| |List| F) ($ F))
        (SPROG ((|dn| (F)) (|m| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;eJacobiZetaGrad_z|))
                (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 184)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 100))
                           (SPADCALL (SPADCALL |m| (QREFELT $ 156))
                                     (SPADCALL |m| (QREFELT $ 155))
                                     (QREFELT $ 107))
                           (QREFELT $ 108)))))) 

(SDEFUN |FSPECF;eJacobiZetaGrad_m| ((|l| |List| F) ($ F))
        (SPROG
         ((|res4| (F)) (|res3| (F)) (|res2| (F)) (|res1| (F)) (|dn| (F))
          (|er| (F)) (|ee| (F)) (|ek| (F)) (|m| (F)) (|z| (F)))
         (SEQ
          (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                . #1=(|FSPECF;eJacobiZetaGrad_m|))
          (LETT |m| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
          (LETT |ek| (SPADCALL |m| (QREFELT $ 155)) . #1#)
          (LETT |ee| (SPADCALL |m| (QREFELT $ 156)) . #1#)
          (LETT |er| (SPADCALL |ee| |ek| (QREFELT $ 107)) . #1#)
          (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 184)) . #1#)
          (LETT |res1|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 100)) |m|
                            (QREFELT $ 101))
                  (|spadConstant| $ 72) (QREFELT $ 108))
                 (SPADCALL |z| |m| (QREFELT $ 188)) (QREFELT $ 100))
                . #1#)
          (LETT |res2|
                (SPADCALL |res1|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL |m| (|spadConstant| $ 72)
                                       (QREFELT $ 108))
                             |z| (QREFELT $ 100))
                            |dn| (QREFELT $ 100))
                           |dn| (QREFELT $ 100))
                          (QREFELT $ 101))
                . #1#)
          (LETT |res3|
                (SPADCALL |res2|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 183))
                                      (QREFELT $ 100))
                            (SPADCALL |z| |m| (QREFELT $ 184)) (QREFELT $ 100))
                           (SPADCALL |z| |m| (QREFELT $ 177)) (QREFELT $ 100))
                          (QREFELT $ 108))
                . #1#)
          (LETT |res4|
                (SPADCALL |res3|
                          (SPADCALL
                           (SPADCALL |z|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| $ 72) |m|
                                                (QREFELT $ 108))
                                      (SPADCALL |dn| |dn| (QREFELT $ 100))
                                      (QREFELT $ 101))
                                     (QREFELT $ 100))
                           |er| (QREFELT $ 100))
                          (QREFELT $ 101))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 87)
                      (SPADCALL |res4|
                                (SPADCALL (SPADCALL |z| |er| (QREFELT $ 100))
                                          |er| (QREFELT $ 100))
                                (QREFELT $ 108))
                      (QREFELT $ 100))
            (SPADCALL (SPADCALL |m| |m| (QREFELT $ 100)) |m| (QREFELT $ 108))
            (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;jacobiTheta;3F;164| ((|q| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 189) |q| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eJacobiTheta| ((|q| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 189) (LIST |q| |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elJacobiTheta| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;lerchPhi;4F;167| ((|z| F) (|s| F) (|a| F) ($ F))
        (SPADCALL (QREFELT $ 191) |z| |s| |a| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eLerchPhi| ((|z| F) (|s| F) (|a| F) ($ F))
        (COND
         ((SPADCALL |a| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL (SPADCALL |s| |z| (QREFELT $ 61)) |z| (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 191) (LIST |z| |s| |a|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elLerchPhi| ((|l| |List| F) ($ F))
        (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;dLerchPhi| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|dm| (F)) (|da| (F)) (|dz| (F)) (|a| (F)) (|s| (F)) (|z| (F)))
               (SEQ
                (LETT |z| (SPADCALL |l| 1 (QREFELT $ 95))
                      . #1=(|FSPECF;dLerchPhi|))
                (LETT |s| (SPADCALL |l| 2 (QREFELT $ 95)) . #1#)
                (LETT |a| (SPADCALL |l| 3 (QREFELT $ 95)) . #1#)
                (LETT |dz|
                      (SPADCALL
                       (SPADCALL (SPADCALL |z| |t| (QREFELT $ 98))
                                 (SPADCALL
                                  (SPADCALL |z|
                                            (SPADCALL |s| (|spadConstant| $ 72)
                                                      (QREFELT $ 108))
                                            |a| (QREFELT $ 192))
                                  (SPADCALL |a|
                                            (SPADCALL |z| |s| |a|
                                                      (QREFELT $ 192))
                                            (QREFELT $ 100))
                                  (QREFELT $ 108))
                                 (QREFELT $ 100))
                       |z| (QREFELT $ 107))
                      . #1#)
                (LETT |da|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |a| |t| (QREFELT $ 98)) |s|
                                  (QREFELT $ 100))
                        (SPADCALL |z|
                                  (SPADCALL |s| (|spadConstant| $ 72)
                                            (QREFELT $ 101))
                                  |a| (QREFELT $ 192))
                        (QREFELT $ 100))
                       (QREFELT $ 117))
                      . #1#)
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                      . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (SPADCALL |s| |t| (QREFELT $ 98))
                             (SPADCALL (QREFELT $ 84)
                                       (LIST
                                        (SPADCALL (QREFELT $ 191)
                                                  (LIST |z| |dm| |a|)
                                                  (QREFELT $ 80))
                                        |dm| |s|)
                                       (QREFELT $ 99))
                             (QREFELT $ 100))
                   |dz| (QREFELT $ 101))
                  |da| (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;riemannZeta;2F;171| ((|z| F) ($ F))
        (SPADCALL (QREFELT $ 193) |z| (QREFELT $ 44))) 

(SDEFUN |FSPECF;eRiemannZeta| ((|z| F) ($ F))
        (SPADCALL (QREFELT $ 193) (LIST |z|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;elRiemannZeta| ((|l| |List| F) ($ F))
        (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;charlierC;4F;174| ((|n| F) (|a| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 35) |n| |a| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eCharlierC| ((|n| F) (|a| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ((SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL (SPADCALL |z| |a| (QREFELT $ 108)) |a| (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 35) (LIST |n| |a| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elCharlierC| ((|l| |List| F) ($ F))
        (|FSPECF;eCharlierC| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;hermiteH;3F;177| ((|n| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 36) |n| |z| (QREFELT $ 47))) 

(SDEFUN |FSPECF;eHermiteH| ((|n| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117))
                    (QREFELT $ 70))
          (|spadConstant| $ 68))
         ((SPADCALL |n| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ((SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL (SPADCALL 2 (QREFELT $ 76)) |z| (QREFELT $ 100)))
         ('T (SPADCALL (QREFELT $ 36) (LIST |n| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elHermiteH| ((|l| |List| F) ($ F))
        (|FSPECF;eHermiteH| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eHermiteHGrad_z| ((|n| F) (|z| F) ($ F))
        (SPADCALL (SPADCALL (SPADCALL 2 (QREFELT $ 76)) |n| (QREFELT $ 100))
                  (SPADCALL
                   (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108)) |z|
                   (QREFELT $ 196))
                  (QREFELT $ 100))) 

(SDEFUN |FSPECF;dHermiteH| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad2| |l| |t| (QREFELT $ 36)
         (CONS (|function| |FSPECF;eHermiteHGrad_z|) $) $)) 

(SDEFUN |FSPECF;jacobiP;5F;182| ((|n| F) (|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 37) |n| |a| |b| |z| (QREFELT $ 197))) 

(SDEFUN |FSPECF;eJacobiP| ((|n| F) (|a| F) (|b| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117))
                    (QREFELT $ 70))
          (|spadConstant| $ 68))
         ((SPADCALL |n| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ((SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL
           (SPADCALL (QREFELT $ 87) (SPADCALL |a| |b| (QREFELT $ 108))
                     (QREFELT $ 100))
           (SPADCALL
            (SPADCALL (|spadConstant| $ 72)
                      (SPADCALL (QREFELT $ 87)
                                (SPADCALL |a| |b| (QREFELT $ 101))
                                (QREFELT $ 100))
                      (QREFELT $ 101))
            |z| (QREFELT $ 100))
           (QREFELT $ 101)))
         ('T (SPADCALL (QREFELT $ 37) (LIST |n| |a| |b| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elJacobiP| ((|l| |List| F) ($ F))
        (|FSPECF;eJacobiP| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95))
         (SPADCALL |l| 4 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eJacobiPGrad_z| ((|n| F) (|a| F) (|b| F) (|z| F) ($ F))
        (SPADCALL
         (SPADCALL (QREFELT $ 87)
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| |b| (QREFELT $ 101)) |n|
                              (QREFELT $ 101))
                    (|spadConstant| $ 72) (QREFELT $ 101))
                   (QREFELT $ 100))
         (SPADCALL (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                   (SPADCALL |a| (|spadConstant| $ 72) (QREFELT $ 101))
                   (SPADCALL |b| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                   (QREFELT $ 198))
         (QREFELT $ 100))) 

(SDEFUN |FSPECF;dJacobiP| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad4| |l| |t| (QREFELT $ 37)
         (CONS (|function| |FSPECF;eJacobiPGrad_z|) $) $)) 

(SDEFUN |FSPECF;laguerreL;4F;187| ((|n| F) (|a| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 38) |n| |a| |z| (QREFELT $ 62))) 

(SDEFUN |FSPECF;eLaguerreL| ((|n| F) (|a| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117))
                    (QREFELT $ 70))
          (|spadConstant| $ 68))
         ((SPADCALL |n| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ((SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL (SPADCALL (|spadConstant| $ 72) |a| (QREFELT $ 101)) |z|
                    (QREFELT $ 108)))
         ('T (SPADCALL (QREFELT $ 38) (LIST |n| |a| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elLaguerreL| ((|l| |List| F) ($ F))
        (|FSPECF;eLaguerreL| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;eLaguerreLGrad_z| ((|n| F) (|a| F) (|z| F) ($ F))
        (SPADCALL (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                  (SPADCALL |a| (|spadConstant| $ 72) (QREFELT $ 101)) |z|
                  (QREFELT $ 199))) 

(SDEFUN |FSPECF;dLaguerreL| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (|FSPECF;grad3| |l| |t| (QREFELT $ 38)
         (CONS (|function| |FSPECF;eLaguerreLGrad_z|) $) $)) 

(SDEFUN |FSPECF;meixnerM;5F;192| ((|n| F) (|b| F) (|c| F) (|z| F) ($ F))
        (SPADCALL (QREFELT $ 39) |n| |b| |c| |z| (QREFELT $ 197))) 

(SDEFUN |FSPECF;eMeixnerM| ((|n| F) (|b| F) (|c| F) (|z| F) ($ F))
        (COND
         ((SPADCALL |n| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 72))
         ((SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |c| (|spadConstant| $ 72) (QREFELT $ 108)) |z|
                      (QREFELT $ 100))
            (SPADCALL |c| |b| (QREFELT $ 100)) (QREFELT $ 107))
           (|spadConstant| $ 72) (QREFELT $ 101)))
         ('T (SPADCALL (QREFELT $ 39) (LIST |n| |b| |c| |z|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;elMeixnerM| ((|l| |List| F) ($ F))
        (|FSPECF;eMeixnerM| (SPADCALL |l| 1 (QREFELT $ 95))
         (SPADCALL |l| 2 (QREFELT $ 95)) (SPADCALL |l| 3 (QREFELT $ 95))
         (SPADCALL |l| 4 (QREFELT $ 95)) $)) 

(SDEFUN |FSPECF;belong?;BoB;195| ((|op| |BasicOperator|) ($ |Boolean|))
        (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 201))) 

(SDEFUN |FSPECF;operator;2Bo;196| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|abs| (QREFELT $ 203)) (QREFELT $ 13))
              ((SPADCALL |op| '|Gamma| (QREFELT $ 203)) (QREFELT $ 14))
              ((SPADCALL |op| '|Gamma2| (QREFELT $ 203)) (QREFELT $ 15))
              ((SPADCALL |op| '|Beta| (QREFELT $ 203)) (QREFELT $ 16))
              ((SPADCALL |op| '|digamma| (QREFELT $ 203)) (QREFELT $ 17))
              ((SPADCALL |op| '|polygamma| (QREFELT $ 203)) (QREFELT $ 18))
              ((SPADCALL |op| '|besselJ| (QREFELT $ 203)) (QREFELT $ 19))
              ((SPADCALL |op| '|besselY| (QREFELT $ 203)) (QREFELT $ 20))
              ((SPADCALL |op| '|besselI| (QREFELT $ 203)) (QREFELT $ 21))
              ((SPADCALL |op| '|besselK| (QREFELT $ 203)) (QREFELT $ 22))
              ((SPADCALL |op| '|airyAi| (QREFELT $ 203)) (QREFELT $ 23))
              ((SPADCALL |op| '|airyAiPrime| (QREFELT $ 203)) (QREFELT $ 24))
              ((SPADCALL |op| '|airyBi| (QREFELT $ 203)) (QREFELT $ 25))
              ((SPADCALL |op| '|airyBiPrime| (QREFELT $ 203)) (QREFELT $ 26))
              ((SPADCALL |op| '|lambertW| (QREFELT $ 203)) (QREFELT $ 27))
              ((SPADCALL |op| '|polylog| (QREFELT $ 203)) (QREFELT $ 28))
              ((SPADCALL |op| '|weierstrassP| (QREFELT $ 203)) (QREFELT $ 29))
              ((SPADCALL |op| '|weierstrassPPrime| (QREFELT $ 203))
               (QREFELT $ 30))
              ((SPADCALL |op| '|weierstrassSigma| (QREFELT $ 203))
               (QREFELT $ 31))
              ((SPADCALL |op| '|weierstrassZeta| (QREFELT $ 203))
               (QREFELT $ 32))
              ((SPADCALL |op| '|hypergeometricF| (QREFELT $ 203))
               (QREFELT $ 33))
              ((SPADCALL |op| '|meijerG| (QREFELT $ 203)) (QREFELT $ 34))
              ((SPADCALL |op| '|whittakerM| (QREFELT $ 203)) (QREFELT $ 102))
              ((SPADCALL |op| '|whittakerW| (QREFELT $ 203)) (QREFELT $ 111))
              ((SPADCALL |op| '|angerJ| (QREFELT $ 203)) (QREFELT $ 113))
              ((SPADCALL |op| '|weberE| (QREFELT $ 203)) (QREFELT $ 118))
              ((SPADCALL |op| '|struveH| (QREFELT $ 203)) (QREFELT $ 124))
              ((SPADCALL |op| '|struveL| (QREFELT $ 203)) (QREFELT $ 128))
              ((SPADCALL |op| '|hankelH1| (QREFELT $ 203)) (QREFELT $ 130))
              ((SPADCALL |op| '|hankelH2| (QREFELT $ 203)) (QREFELT $ 132))
              ((SPADCALL |op| '|lommelS1| (QREFELT $ 203)) (QREFELT $ 134))
              ((SPADCALL |op| '|lommelS2| (QREFELT $ 203)) (QREFELT $ 136))
              ((SPADCALL |op| '|kummerM| (QREFELT $ 203)) (QREFELT $ 138))
              ((SPADCALL |op| '|kummerU| (QREFELT $ 203)) (QREFELT $ 140))
              ((SPADCALL |op| '|legendreP| (QREFELT $ 203)) (QREFELT $ 142))
              ((SPADCALL |op| '|legendreQ| (QREFELT $ 203)) (QREFELT $ 144))
              ((SPADCALL |op| '|kelvinBei| (QREFELT $ 203)) (QREFELT $ 146))
              ((SPADCALL |op| '|kelvinBer| (QREFELT $ 203)) (QREFELT $ 149))
              ((SPADCALL |op| '|kelvinKei| (QREFELT $ 203)) (QREFELT $ 150))
              ((SPADCALL |op| '|kelvinKer| (QREFELT $ 203)) (QREFELT $ 153))
              ((SPADCALL |op| '|ellipticK| (QREFELT $ 203)) (QREFELT $ 154))
              ((SPADCALL |op| '|ellipticE| (QREFELT $ 203)) (QREFELT $ 161))
              ((SPADCALL |op| '|ellipticE2| (QREFELT $ 203)) (QREFELT $ 162))
              ((SPADCALL |op| '|ellipticF| (QREFELT $ 203)) (QREFELT $ 173))
              ((SPADCALL |op| '|ellipticPi| (QREFELT $ 203)) (QREFELT $ 174))
              ((SPADCALL |op| '|jacobiSn| (QREFELT $ 203)) (QREFELT $ 176))
              ((SPADCALL |op| '|jacobiCn| (QREFELT $ 203)) (QREFELT $ 185))
              ((SPADCALL |op| '|jacobiDn| (QREFELT $ 203)) (QREFELT $ 186))
              ((SPADCALL |op| '|jacobiZeta| (QREFELT $ 203)) (QREFELT $ 187))
              ((SPADCALL |op| '|jacobiTheta| (QREFELT $ 203)) (QREFELT $ 189))
              ((SPADCALL |op| '|lerchPhi| (QREFELT $ 203)) (QREFELT $ 191))
              ((SPADCALL |op| '|riemannZeta| (QREFELT $ 203)) (QREFELT $ 193))
              ((SPADCALL |op| '|charlierC| (QREFELT $ 203)) (QREFELT $ 35))
              ((SPADCALL |op| '|hermiteH| (QREFELT $ 203)) (QREFELT $ 36))
              ((SPADCALL |op| '|jacobiP| (QREFELT $ 203)) (QREFELT $ 37))
              ((SPADCALL |op| '|laguerreL| (QREFELT $ 203)) (QREFELT $ 38))
              ((SPADCALL |op| '|meixnerM| (QREFELT $ 203)) (QREFELT $ 39))
              ((SPADCALL |op| '|%logGamma| (QREFELT $ 203)) (QREFELT $ 40))
              ((SPADCALL |op| '|%eis| (QREFELT $ 203)) (QREFELT $ 41))
              ((SPADCALL |op| '|%erfs| (QREFELT $ 203)) (QREFELT $ 42))
              ((SPADCALL |op| '|%erfis| (QREFELT $ 203)) (QREFELT $ 43))
              ('T (|error| "Not a special operator")))) 

(SDEFUN |FSPECF;iGamma| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (|spadConstant| $ 72) (QREFELT $ 70)) |x|)
              ('T (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iabs| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 206)) (|spadConstant| $ 68))
              ((SPADCALL |x| (QREFELT $ 13) (QREFELT $ 178)) |x|)
              ((SPADCALL |x| (|spadConstant| $ 68) (QREFELT $ 207))
               (SPADCALL (QREFELT $ 13) (SPADCALL |x| (QREFELT $ 117))
                         (QREFELT $ 205)))
              ('T (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iBeta| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 16) (LIST |x| |y|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;idigamma| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 205))) 

(SDEFUN |FSPECF;iiipolygamma| ((|n| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 18) (LIST |n| |x|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iiiBesselJ| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 19) (LIST |x| |y|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iiiBesselY| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 20) (LIST |x| |y|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iiiBesselI| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 21) (LIST |x| |y|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iiiBesselK| ((|x| F) (|y| F) ($ F))
        (SPADCALL (QREFELT $ 22) (LIST |x| |y|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iAiryAi;2F;206| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 206))
          (SPADCALL (|spadConstant| $ 72)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT $ 76)) (QREFELT $ 93)
                               (QREFELT $ 126))
                     (SPADCALL (QREFELT $ 93) (QREFELT $ 46)) (QREFELT $ 100))
                    (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;207| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 206))
          (SPADCALL
           (SPADCALL (|spadConstant| $ 72)
                     (SPADCALL
                      (SPADCALL (SPADCALL 3 (QREFELT $ 76)) (QREFELT $ 88)
                                (QREFELT $ 126))
                      (SPADCALL (QREFELT $ 88) (QREFELT $ 46)) (QREFELT $ 100))
                     (QREFELT $ 107))
           (QREFELT $ 117)))
         ('T (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iAiryBi;2F;208| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 206))
          (SPADCALL (|spadConstant| $ 72)
                    (SPADCALL
                     (SPADCALL (SPADCALL 3 (QREFELT $ 76)) (QREFELT $ 90)
                               (QREFELT $ 126))
                     (SPADCALL (QREFELT $ 93) (QREFELT $ 46)) (QREFELT $ 100))
                    (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;209| ((|x| F) ($ F))
        (COND
         ((SPADCALL |x| (QREFELT $ 206))
          (SPADCALL
           (SPADCALL (SPADCALL 3 (QREFELT $ 76)) (QREFELT $ 90)
                     (QREFELT $ 126))
           (SPADCALL (QREFELT $ 88) (QREFELT $ 46)) (QREFELT $ 107)))
         ('T (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iAiryAi;2F;210| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 205))) 

(SDEFUN |FSPECF;iAiryAiPrime;2F;211| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 205))) 

(SDEFUN |FSPECF;iAiryBi;2F;212| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 205))) 

(SDEFUN |FSPECF;iAiryBiPrime;2F;213| ((|x| F) ($ F))
        (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 205))) 

(SDEFUN |FSPECF;iLambertW;2F;214| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 206)) (|spadConstant| $ 68))
              ((SPADCALL |x| (SPADCALL (|spadConstant| $ 72) (QREFELT $ 212))
                         (QREFELT $ 70))
               (|spadConstant| $ 72))
              ((SPADCALL |x|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117))
                           (QREFELT $ 212))
                          (QREFELT $ 117))
                         (QREFELT $ 70))
               (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117)))
              ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iLambertW;2F;215| ((|x| F) ($ F))
        (COND ((SPADCALL |x| (QREFELT $ 206)) (|spadConstant| $ 68))
              ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 205))))) 

(SDEFUN |FSPECF;iiPolylog;3F;216| ((|s| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |s| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 72) |x| (QREFELT $ 108))
                     (QREFELT $ 214))
           (QREFELT $ 117)))
         ((SPADCALL |s| (SPADCALL 2 (QREFELT $ 76)) (QREFELT $ 70))
          (SPADCALL (SPADCALL (|spadConstant| $ 72) |x| (QREFELT $ 108))
                    (QREFELT $ 215)))
         ('T (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;iiPolylog;3F;217| ((|s| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |s| (|spadConstant| $ 72) (QREFELT $ 70))
          (SPADCALL
           (SPADCALL (SPADCALL (|spadConstant| $ 72) |x| (QREFELT $ 108))
                     (QREFELT $ 214))
           (QREFELT $ 117)))
         ('T (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;iiPolylog;3F;218| ((|s| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iPolylog| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
                  (QREFELT $ 216))) 

(SDEFUN |FSPECF;iWeierstrassP| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 29) (LIST |g2| |g3| |x|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iWeierstrassPPrime| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 30) (LIST |g2| |g3| |x|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iWeierstrassSigma| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (COND
         ((SPADCALL |x| (|spadConstant| $ 68) (QREFELT $ 70))
          (|spadConstant| $ 68))
         ('T (SPADCALL (QREFELT $ 31) (LIST |g2| |g3| |x|) (QREFELT $ 99))))) 

(SDEFUN |FSPECF;iWeierstrassZeta| ((|g2| F) (|g3| F) (|x| F) ($ F))
        (SPADCALL (QREFELT $ 32) (LIST |g2| |g3| |x|) (QREFELT $ 99))) 

(SDEFUN |FSPECF;iiabs;2F;224| ((|x| F) ($ F))
        (SPROG
         ((#1=#:G785 NIL) (|b| #2=(|Union| R "failed")) (|a| #2#)
          (|f| (|Fraction| (|Polynomial| R)))
          (|r| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
         (SEQ
          (LETT |r| (SPADCALL |x| (QREFELT $ 219))
                . #3=(|FSPECF;iiabs;2F;224|))
          (EXIT
           (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| $))
                 (#4='T
                  (SEQ
                   (EXIT
                    (SEQ (LETT |f| (QCDR |r|) . #3#)
                         (SEQ
                          (LETT |a|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 222))
                                          (QREFELT $ 224))
                                . #3#)
                          (EXIT
                           (COND
                            ((QEQCAR |a| 1)
                             (PROGN
                              (LETT #1# (|FSPECF;iabs| |x| $) . #3#)
                              (GO #5=#:G782)))
                            (#4#
                             (SEQ
                              (LETT |b|
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 225))
                                              (QREFELT $ 224))
                                    . #3#)
                              (EXIT
                               (COND
                                ((QEQCAR |b| 1)
                                 (PROGN
                                  (LETT #1# (|FSPECF;iabs| |x| $) . #3#)
                                  (GO #5#))))))))))
                         (EXIT
                          (SPADCALL
                           (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 226))
                                     (QREFELT $ 227))
                           (SPADCALL (SPADCALL (QCDR |b|) (QREFELT $ 226))
                                     (QREFELT $ 227))
                           (QREFELT $ 107)))))
                   #5# (EXIT #1#)))))))) 

(SDEFUN |FSPECF;iiabs;2F;225| ((|x| F) ($ F)) (|FSPECF;iabs| |x| $)) 

(SDEFUN |FSPECF;iiGamma;2F;226| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 229))
                      |FSPECF;iiGamma;2F;226|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 230))
                                  (QREFELT $ 227)))))))) 

(SDEFUN |FSPECF;iiBeta;LF;227| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G799 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 229))
                         . #3=(|FSPECF;iiBeta;LF;227|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iBeta| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 217)) $)
                             . #3#)
                       (GO #4=#:G797)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 217))
                                       (QREFELT $ 229))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iBeta| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 217)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 232))
                             (QREFELT $ 227)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iidigamma;2F;228| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 229))
                      |FSPECF;iidigamma;2F;228|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| $))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 234))
                                  (QREFELT $ 227)))))))) 

(SDEFUN |FSPECF;iipolygamma;LF;229| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G812 NIL) (|r| #2=(|Union| R "failed")) (|s| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 229))
                         . #3=(|FSPECF;iipolygamma;LF;229|))
                   (EXIT
                    (COND
                     ((QEQCAR |s| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 217)) $)
                             . #3#)
                       (GO #4=#:G810)))
                     ('T
                      (SEQ
                       (LETT |r|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 217))
                                       (QREFELT $ 229))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 217)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT $ 236))
                             (QREFELT $ 227)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselJ;LF;230| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G820 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 229))
                         . #3=(|FSPECF;iiBesselJ;LF;230|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 217)) $)
                             . #3#)
                       (GO #4=#:G818)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 217))
                                       (QREFELT $ 229))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 217)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 238))
                             (QREFELT $ 227)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselY;LF;231| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G828 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 229))
                         . #3=(|FSPECF;iiBesselY;LF;231|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 217)) $)
                             . #3#)
                       (GO #4=#:G826)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 217))
                                       (QREFELT $ 229))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 217)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 240))
                             (QREFELT $ 227)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselI;LF;232| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G836 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 229))
                         . #3=(|FSPECF;iiBesselI;LF;232|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 217)) $)
                             . #3#)
                       (GO #4=#:G834)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 217))
                                       (QREFELT $ 229))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 217)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 242))
                             (QREFELT $ 227)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiBesselK;LF;233| ((|l| |List| F) ($ F))
        (SPROG ((#1=#:G844 NIL) (|s| #2=(|Union| R "failed")) (|r| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 229))
                         . #3=(|FSPECF;iiBesselK;LF;233|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (PROGN
                       (LETT #1#
                             (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                              (SPADCALL |l| (QREFELT $ 217)) $)
                             . #3#)
                       (GO #4=#:G842)))
                     ('T
                      (SEQ
                       (LETT |s|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 217))
                                       (QREFELT $ 229))
                             . #3#)
                       (EXIT
                        (COND
                         ((QEQCAR |s| 1)
                          (PROGN
                           (LETT #1#
                                 (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                                  (SPADCALL |l| (QREFELT $ 217)) $)
                                 . #3#)
                           (GO #4#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 244))
                             (QREFELT $ 227)))))
                #4# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiAiryAi;2F;234| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 229))
                      |FSPECF;iiAiryAi;2F;234|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 208)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 246))
                                  (QREFELT $ 227)))))))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;235| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 229))
                      |FSPECF;iiAiryAiPrime;2F;235|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 209)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 248))
                                  (QREFELT $ 227)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;236| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 229))
                      |FSPECF;iiAiryBi;2F;236|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 210)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 250))
                                  (QREFELT $ 227)))))))) 

(SDEFUN |FSPECF;iiAiryBi;2F;237| ((|x| F) ($ F))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 229))
                      |FSPECF;iiAiryBi;2F;237|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 211)))
                       ('T
                        (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 252))
                                  (QREFELT $ 227)))))))) 

(SDEFUN |FSPECF;iiGamma;2F;238| ((|x| F) ($ F))
        (SPROG ((#1=#:G871 NIL) (|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |r| (SPADCALL |x| (QREFELT $ 254))
                         . #2=(|FSPECF;iiGamma;2F;238|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 0)
                      (COND
                       ((>= (QCDR |r|) 1)
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (SPADCALL (- (QCDR |r|) 1) (QREFELT $ 255))
                                (QREFELT $ 76))
                               . #2#)
                         (GO #3=#:G869))))))))
                  (EXIT (|FSPECF;iGamma| |x| $))))
                #3# (EXIT #1#)))) 

(SDEFUN |FSPECF;iiGamma;2F;239| ((|x| F) ($ F)) (|FSPECF;iGamma| |x| $)) 

(SDEFUN |FSPECF;iiBeta;LF;240| ((|l| |List| F) ($ F))
        (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217)) $)) 

(SDEFUN |FSPECF;iidigamma;2F;241| ((|x| F) ($ F)) (|FSPECF;idigamma| |x| $)) 

(SDEFUN |FSPECF;iipolygamma;LF;242| ((|l| |List| F) ($ F))
        (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
         $)) 

(SDEFUN |FSPECF;iiBesselJ;LF;243| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
         $)) 

(SDEFUN |FSPECF;iiBesselY;LF;244| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
         $)) 

(SDEFUN |FSPECF;iiBesselI;LF;245| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
         $)) 

(SDEFUN |FSPECF;iiBesselK;LF;246| ((|l| |List| F) ($ F))
        (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
         $)) 

(SDEFUN |FSPECF;iiAiryAi;2F;247| ((|x| F) ($ F)) (SPADCALL |x| (QREFELT $ 208))) 

(SDEFUN |FSPECF;iiAiryAiPrime;2F;248| ((|x| F) ($ F))
        (SPADCALL |x| (QREFELT $ 209))) 

(SDEFUN |FSPECF;iiAiryBi;2F;249| ((|x| F) ($ F)) (SPADCALL |x| (QREFELT $ 210))) 

(SDEFUN |FSPECF;iiAiryBiPrime;2F;250| ((|x| F) ($ F))
        (SPADCALL |x| (QREFELT $ 211))) 

(SDEFUN |FSPECF;iiWeierstrassP| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassP| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 217)) (SPADCALL |l| (QREFELT $ 257)) $)) 

(SDEFUN |FSPECF;iiWeierstrassPPrime| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 217)) (SPADCALL |l| (QREFELT $ 257)) $)) 

(SDEFUN |FSPECF;iiWeierstrassSigma| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 217)) (SPADCALL |l| (QREFELT $ 257)) $)) 

(SDEFUN |FSPECF;iiWeierstrassZeta| ((|l| |List| F) ($ F))
        (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|)
         (SPADCALL |l| (QREFELT $ 217)) (SPADCALL |l| (QREFELT $ 257)) $)) 

(SDEFUN |FSPECF;diff1| ((|op| |BasicOperator|) (|n| F) (|x| F) ($ F))
        (SPROG ((|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                      |FSPECF;diff1|)
                (EXIT
                 (SPADCALL (QREFELT $ 84)
                           (LIST (SPADCALL |op| (LIST |dm| |x|) (QREFELT $ 80))
                                 |dm| |n|)
                           (QREFELT $ 99)))))) 

(SDEFUN |FSPECF;iBesselJ| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselJ|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 98))
                                (|FSPECF;diff1| (QREFELT $ 19) |n| |x| $)
                                (QREFELT $ 100))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 98))
                                 (QREFELT $ 87) (QREFELT $ 100))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                         |x| (QREFELT $ 52))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 101))
                         |x| (QREFELT $ 52))
                        (QREFELT $ 108))
                       (QREFELT $ 100))
                      (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;iBesselY| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselY|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 98))
                                (|FSPECF;diff1| (QREFELT $ 20) |n| |x| $)
                                (QREFELT $ 100))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 98))
                                 (QREFELT $ 87) (QREFELT $ 100))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                         |x| (QREFELT $ 53))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 101))
                         |x| (QREFELT $ 53))
                        (QREFELT $ 108))
                       (QREFELT $ 100))
                      (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;iBesselI| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselI|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 98))
                                (|FSPECF;diff1| (QREFELT $ 21) |n| |x| $)
                                (QREFELT $ 100))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 98))
                                 (QREFELT $ 87) (QREFELT $ 100))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                         |x| (QREFELT $ 54))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 101))
                         |x| (QREFELT $ 54))
                        (QREFELT $ 101))
                       (QREFELT $ 100))
                      (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;iBesselK| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|n| (F)))
               (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselK|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |n| |t| (QREFELT $ 98))
                                (|FSPECF;diff1| (QREFELT $ 22) |n| |x| $)
                                (QREFELT $ 100))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 98))
                                 (QREFELT $ 87) (QREFELT $ 100))
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 108))
                         |x| (QREFELT $ 55))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 72) (QREFELT $ 101))
                         |x| (QREFELT $ 55))
                        (QREFELT $ 101))
                       (QREFELT $ 100))
                      (QREFELT $ 108)))))) 

(SDEFUN |FSPECF;dPolylog| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|s| (F)))
               (SEQ (LETT |s| (|SPADfirst| |l|) . #1=(|FSPECF;dPolylog|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |s| |t| (QREFELT $ 98))
                                (|FSPECF;diff1| (QREFELT $ 28) |s| |x| $)
                                (QREFELT $ 100))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 98))
                                 (SPADCALL
                                  (SPADCALL |s| (|spadConstant| $ 72)
                                            (QREFELT $ 108))
                                  |x| (QREFELT $ 61))
                                 (QREFELT $ 100))
                       |x| (QREFELT $ 107))
                      (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;ipolygamma| ((|l| |List| F) (|x| |Symbol|) ($ F))
        (SPROG ((|y| (F)) (|n| (F)))
               (SEQ
                (COND
                 ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 261))
                            (QREFELT $ 262))
                  (|error|
                   "cannot differentiate polygamma with respect to the first argument"))
                 ('T
                  (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;ipolygamma|))
                       (LETT |y| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                       (EXIT
                        (SPADCALL (SPADCALL |y| |x| (QREFELT $ 98))
                                  (SPADCALL
                                   (SPADCALL |n| (|spadConstant| $ 72)
                                             (QREFELT $ 101))
                                   |y| (QREFELT $ 51))
                                  (QREFELT $ 100))))))))) 

(SDEFUN |FSPECF;iBetaGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad1|))
                    (LETT |y| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT $ 49))
                               (SPADCALL (SPADCALL |x| (QREFELT $ 50))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT $ 101))
                                          (QREFELT $ 50))
                                         (QREFELT $ 108))
                               (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;iBetaGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|y| (F)) (|x| (F)))
               (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad2|))
                    (LETT |y| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL (SPADCALL |x| |y| (QREFELT $ 49))
                               (SPADCALL (SPADCALL |y| (QREFELT $ 50))
                                         (SPADCALL
                                          (SPADCALL |x| |y| (QREFELT $ 101))
                                          (QREFELT $ 50))
                                         (QREFELT $ 108))
                               (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;iGamma2| ((|l| |List| F) (|t| |Symbol|) ($ F))
        (SPROG ((|x| (F)) (|a| (F)))
               (SEQ (LETT |a| (|SPADfirst| |l|) . #1=(|FSPECF;iGamma2|))
                    (LETT |x| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| |t| (QREFELT $ 98))
                                (|FSPECF;diff1| (QREFELT $ 15) |a| |x| $)
                                (QREFELT $ 100))
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| |t| (QREFELT $ 98))
                                 (SPADCALL |x|
                                           (SPADCALL |a| (|spadConstant| $ 72)
                                                     (QREFELT $ 108))
                                           (QREFELT $ 126))
                                 (QREFELT $ 100))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 117))
                                 (QREFELT $ 212))
                       (QREFELT $ 100))
                      (QREFELT $ 108)))))) 

(SDEFUN |FSPECF;inGamma2| ((|li| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT $ 169)) |li|)
                  (QREFELT $ 170))) 

(SDEFUN |FSPECF;dLambertW| ((|x| F) ($ F))
        (SPROG ((|lw| (F)))
               (SEQ
                (LETT |lw| (SPADCALL |x| (QREFELT $ 60)) |FSPECF;dLambertW|)
                (EXIT
                 (SPADCALL |lw|
                           (SPADCALL |x|
                                     (SPADCALL (|spadConstant| $ 72) |lw|
                                               (QREFELT $ 101))
                                     (QREFELT $ 100))
                           (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassPGrad1|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                          (QREFELT $ 92))
                                (QREFELT $ 108))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 64))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL 9 (QREFELT $ 87) (QREFELT $ 92))
                                   |g3| (QREFELT $ 100))
                                  (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                                  (QREFELT $ 100))
                                 (QREFELT $ 117))
                                (SPADCALL
                                 (SPADCALL (QREFELT $ 89)
                                           (SPADCALL |g2| 2 (QREFELT $ 164))
                                           (QREFELT $ 100))
                                 |x| (QREFELT $ 100))
                                (QREFELT $ 101))
                               (QREFELT $ 100))
                     (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92))
                               (SPADCALL |wp| 2 (QREFELT $ 164))
                               (QREFELT $ 100))
                     (QREFELT $ 108))
                    (SPADCALL
                     (SPADCALL (QREFELT $ 87) (SPADCALL |g2| 2 (QREFELT $ 164))
                               (QREFELT $ 100))
                     |wp| (QREFELT $ 100))
                    (QREFELT $ 101))
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 87) (QREFELT $ 92)) |g2|
                              (QREFELT $ 100))
                    |g3| (QREFELT $ 100))
                   (QREFELT $ 101))
                  |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassPGrad2|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                          (QREFELT $ 92))
                                (QREFELT $ 108))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 64))
                               (SPADCALL
                                (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 92))
                                          (SPADCALL |g2| |g3| |x|
                                                    (QREFELT $ 66))
                                          (QREFELT $ 100))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL 9 (QREFELT $ 87) (QREFELT $ 92))
                                  |g3| (QREFELT $ 100))
                                 |x| (QREFELT $ 100))
                                (QREFELT $ 108))
                               (QREFELT $ 100))
                     (SPADCALL (SPADCALL 6 |g2| (QREFELT $ 92))
                               (SPADCALL |wp| 2 (QREFELT $ 164))
                               (QREFELT $ 100))
                     (QREFELT $ 101))
                    (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |wp|
                              (QREFELT $ 100))
                    (QREFELT $ 108))
                   (SPADCALL |g2| 2 (QREFELT $ 164)) (QREFELT $ 108))
                  |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassPGrad3| ((|l| |List| F) ($ F))
        (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
                  (SPADCALL |l| (QREFELT $ 257)) (QREFELT $ 64))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad1| ((|l| |List| F) ($ F))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                    (QREFELT $ 92))
                          (QREFELT $ 108))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 64)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 164)) (QREFELT $ 92))
                 (SPADCALL (QREFELT $ 87) |g2| (QREFELT $ 100))
                 (QREFELT $ 108))
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
                             (SPADCALL 9 (QREFELT $ 87) (QREFELT $ 92)) |g3|
                             (QREFELT $ 100))
                            (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                            (QREFELT $ 100))
                           (QREFELT $ 117))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 89)
                                     (SPADCALL |g2| 2 (QREFELT $ 164))
                                     (QREFELT $ 100))
                           |x| (QREFELT $ 100))
                          (QREFELT $ 101))
                         (QREFELT $ 100))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 87) (QREFELT $ 92))
                                     |g3| (QREFELT $ 100))
                           |wp| (QREFELT $ 100))
                          (SPADCALL (QREFELT $ 89)
                                    (SPADCALL |g2| 2 (QREFELT $ 164))
                                    (QREFELT $ 100))
                          (QREFELT $ 101))
                         (QREFELT $ 100))
               (QREFELT $ 101))
              (SPADCALL
               (SPADCALL (SPADCALL 18 |g3| (QREFELT $ 92)) |wp|
                         (QREFELT $ 100))
               |wpp| (QREFELT $ 100))
              (QREFELT $ 108))
             (SPADCALL
              (SPADCALL (QREFELT $ 87) (SPADCALL |g2| 2 (QREFELT $ 164))
                        (QREFELT $ 100))
              |wpp| (QREFELT $ 100))
             (QREFELT $ 101))
            |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad2| ((|l| |List| F) ($ F))
        (SPROG
         ((|wpp2| (F)) (|wpp| (F)) (|wp| (F)) (|delta| (F)) (|x| (F))
          (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                    (QREFELT $ 92))
                          (QREFELT $ 108))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 64)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 164)) (QREFELT $ 92))
                 (SPADCALL (QREFELT $ 87) |g2| (QREFELT $ 100))
                 (QREFELT $ 108))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL |wpp2|
                         (SPADCALL
                          (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 92))
                                    (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                                    (QREFELT $ 100))
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 87) (QREFELT $ 92))
                                     |g3| (QREFELT $ 100))
                           |x| (QREFELT $ 100))
                          (QREFELT $ 108))
                         (QREFELT $ 100))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 92)) |wp|
                                     (QREFELT $ 100))
                           (QREFELT $ 117))
                          (SPADCALL (SPADCALL 9 (QREFELT $ 87) (QREFELT $ 92))
                                    |g3| (QREFELT $ 100))
                          (QREFELT $ 108))
                         (QREFELT $ 100))
               (QREFELT $ 101))
              (SPADCALL
               (SPADCALL (SPADCALL 12 |g2| (QREFELT $ 92)) |wp|
                         (QREFELT $ 100))
               |wpp| (QREFELT $ 100))
              (QREFELT $ 101))
             (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |wpp| (QREFELT $ 100))
             (QREFELT $ 108))
            |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassPPrimeGrad3| ((|l| |List| F) ($ F))
        (SPROG ((|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|) |FSPECF;iWeierstrassPPrimeGrad3|)
                (EXIT
                 (SPADCALL
                  (SPADCALL 6
                            (SPADCALL
                             (SPADCALL |g2| (SPADCALL |l| (QREFELT $ 217))
                                       (SPADCALL |l| (QREFELT $ 257))
                                       (QREFELT $ 63))
                             2 (QREFELT $ 120))
                            (QREFELT $ 92))
                  (SPADCALL (QREFELT $ 87) |g2| (QREFELT $ 100))
                  (QREFELT $ 108)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad1| ((|l| |List| F) ($ F))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                    (QREFELT $ 92))
                          (QREFELT $ 108))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 66)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 100)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) |ws|
                            (QREFELT $ 100))
                  (QREFELT $ 117))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 164)) |ws|
                           (QREFELT $ 100))
                 (QREFELT $ 101))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 89)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |wsp2|
                                    (QREFELT $ 100))
                          (QREFELT $ 117))
                         (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 164)) |ws|
                                   (QREFELT $ 100))
                         (QREFELT $ 108))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 (QREFELT $ 89) (QREFELT $ 92))
                                     |g2| (QREFELT $ 100))
                           |g3| (QREFELT $ 100))
                          (SPADCALL |x| 2 (QREFELT $ 164)) (QREFELT $ 100))
                         |ws| (QREFELT $ 100))
                        (QREFELT $ 108))
                       (SPADCALL
                        (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 164)) |x|
                                  (QREFELT $ 100))
                        |wsp| (QREFELT $ 100))
                       (QREFELT $ 101))
                      (QREFELT $ 100))
            |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad2| ((|l| |List| F) ($ F))
        (SPROG
         ((|wsp2| (F)) (|wsp| (F)) (|wz| (F)) (|ws| (F)) (|delta| (F))
          (|x| (F)) (|g3| (F)) (|g2| (F)))
         (SEQ
          (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                    (QREFELT $ 92))
                          (QREFELT $ 108))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 65)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 66)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 100)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) |ws|
                            (QREFELT $ 100))
                  (QREFELT $ 117))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 164)) |ws|
                           (QREFELT $ 100))
                 (QREFELT $ 101))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 87)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 92)) |wsp2|
                                   (QREFELT $ 100))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |ws|
                                   (QREFELT $ 100))
                         (QREFELT $ 101))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT $ 89)
                                    (SPADCALL |g2| 2 (QREFELT $ 164))
                                    (QREFELT $ 100))
                          (SPADCALL |x| 2 (QREFELT $ 164)) (QREFELT $ 100))
                         |ws| (QREFELT $ 100))
                        (QREFELT $ 101))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |x|
                                  (QREFELT $ 100))
                        |wsp| (QREFELT $ 100))
                       (QREFELT $ 108))
                      (QREFELT $ 100))
            |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassSigmaGrad3| ((|l| |List| F) ($ F))
        (SPROG ((|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassSigmaGrad3|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
                (EXIT
                 (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                           (SPADCALL |g2| |g3| |x| (QREFELT $ 65))
                           (QREFELT $ 100)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad1| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassZetaGrad1|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                          (QREFELT $ 92))
                                (QREFELT $ 108))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (QREFELT $ 87)
                               (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                               (QREFELT $ 100))
                     (SPADCALL
                      (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |wp|
                                (QREFELT $ 100))
                      (SPADCALL (QREFELT $ 87)
                                (SPADCALL |g2| 2 (QREFELT $ 164))
                                (QREFELT $ 100))
                      (QREFELT $ 101))
                     (QREFELT $ 100))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT $ 87) |g2| (QREFELT $ 100))
                               |x| (QREFELT $ 100))
                     (SPADCALL
                      (SPADCALL (SPADCALL (QREFELT $ 87) |g2| (QREFELT $ 100))
                                |wp| (QREFELT $ 100))
                      (SPADCALL (SPADCALL 3 (QREFELT $ 89) (QREFELT $ 92)) |g3|
                                (QREFELT $ 100))
                      (QREFELT $ 101))
                     (QREFELT $ 100))
                    (QREFELT $ 108))
                   (SPADCALL
                    (SPADCALL (SPADCALL 9 (QREFELT $ 89) (QREFELT $ 92)) |g3|
                              (QREFELT $ 100))
                    (SPADCALL |g2| |g3| |x| (QREFELT $ 64)) (QREFELT $ 100))
                   (QREFELT $ 101))
                  |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad2| ((|l| |List| F) ($ F))
        (SPROG ((|wp| (F)) (|delta| (F)) (|x| (F)) (|g3| (F)) (|g2| (F)))
               (SEQ
                (LETT |g2| (|SPADfirst| |l|)
                      . #1=(|FSPECF;iWeierstrassZetaGrad2|))
                (LETT |g3| (SPADCALL |l| (QREFELT $ 217)) . #1#)
                (LETT |x| (SPADCALL |l| (QREFELT $ 257)) . #1#)
                (LETT |delta|
                      (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 164))
                                (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 164))
                                          (QREFELT $ 92))
                                (QREFELT $ 108))
                      . #1#)
                (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 63)) . #1#)
                (EXIT
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT $ 66))
                                (QREFELT $ 92))
                      (SPADCALL (SPADCALL |g2| |wp| (QREFELT $ 100))
                                (SPADCALL
                                 (SPADCALL 3 (QREFELT $ 87) (QREFELT $ 92))
                                 |g3| (QREFELT $ 100))
                                (QREFELT $ 101))
                      (QREFELT $ 100))
                     (QREFELT $ 117))
                    (SPADCALL (SPADCALL (QREFELT $ 87) |x| (QREFELT $ 100))
                              (SPADCALL
                               (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 92)) |wp|
                                         (QREFELT $ 100))
                               (SPADCALL (QREFELT $ 87)
                                         (SPADCALL |g2| 2 (QREFELT $ 164))
                                         (QREFELT $ 100))
                               (QREFELT $ 101))
                              (QREFELT $ 100))
                    (QREFELT $ 101))
                   (SPADCALL
                    (SPADCALL (SPADCALL 3 (QREFELT $ 87) (QREFELT $ 92)) |g2|
                              (QREFELT $ 100))
                    (SPADCALL |g2| |g3| |x| (QREFELT $ 64)) (QREFELT $ 100))
                   (QREFELT $ 108))
                  |delta| (QREFELT $ 107)))))) 

(SDEFUN |FSPECF;iWeierstrassZetaGrad3| ((|l| |List| F) ($ F))
        (SPADCALL
         (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 217))
                   (SPADCALL |l| (QREFELT $ 257)) (QREFELT $ 63))
         (QREFELT $ 117))) 

(SDEFUN |FSPECF;get_int_listf| ((|lf| |List| F) ($ |List| (|Integer|)))
        (SPADCALL (ELT $ 263) |lf| (QREFELT $ 267))) 

(SDEFUN |FSPECF;replace_i|
        ((|lp| |List| F) (|v| F) (|i| |NonNegativeInteger|) ($ |List| F))
        (SPROG ((#1=#:G985 NIL))
               (SPADCALL
                (SPADCALL |lp|
                          (PROG1 (LETT #1# (- |i| 1) |FSPECF;replace_i|)
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 268))
                (CONS |v| (SPADCALL |lp| |i| (QREFELT $ 269))) (QREFELT $ 78)))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;281| ((|l| |List| F) ($ F))
        (SPROG
         ((#1=#:G991 NIL) (#2=#:G992 NIL) (|q| #3=(|Integer|)) (|p| #3#)
          (|pqi| (|List| (|Integer|))) (|pq| (|List| F))
          (|nn| (|NonNegativeInteger|)) (#4=#:G987 NIL) (|z| (F))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (LENGTH |l|) . #5=(|FSPECF;iiHypergeometricF;LF;281|))
            (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT $ 95)) . #5#)
            (COND
             ((SPADCALL |z| (|spadConstant| $ 68) (QREFELT $ 70))
              (SEQ
               (EXIT
                (SEQ
                 (LETT |nn|
                       (PROG1 (LETT #4# (- |n| 2) . #5#)
                         (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #4#))
                       . #5#)
                 (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 269)) . #5#)
                 (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #5#)
                 (LETT |p| (|SPADfirst| |pqi|) . #5#)
                 (LETT |q| (|SPADfirst| (CDR |pqi|)) . #5#)
                 (EXIT
                  (COND
                   ((SPADCALL |p| (+ |q| 1) (QREFELT $ 270))
                    (PROGN
                     (LETT #1#
                           (PROGN
                            (LETT #2# (|spadConstant| $ 72) . #5#)
                            (GO #6=#:G990))
                           . #5#)
                     (GO #7=#:G988)))))))
               #7# (EXIT #1#))))
            (EXIT (SPADCALL (QREFELT $ 33) |l| (QREFELT $ 99)))))
          #6# (EXIT #2#)))) 

(SDEFUN |FSPECF;idvsum|
        ((|op| |BasicOperator|) (|n| |Integer|) (|l| |List| F) (|x| |Symbol|)
         ($ F))
        (SPROG
         ((|res| (F)) (|nl| (|List| F)) (|dm| (F)) (#1=#:G999 NIL) (|i| NIL)
          (#2=#:G1000 NIL) (|a| NIL))
         (SEQ (LETT |res| (|spadConstant| $ 68) . #3=(|FSPECF;idvsum|))
              (SEQ (LETT |a| NIL . #3#) (LETT #2# |l| . #3#) (LETT |i| 1 . #3#)
                   (LETT #1# |n| . #3#) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                         (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |dm|
                          (SPADCALL (SPADCALL (QREFELT $ 96)) (QREFELT $ 97))
                          . #3#)
                    (LETT |nl| (|FSPECF;replace_i| |l| |dm| |i| $) . #3#)
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |a| |x| (QREFELT $ 98))
                                      (SPADCALL (QREFELT $ 84)
                                                (LIST
                                                 (SPADCALL |op| |nl|
                                                           (QREFELT $ 80))
                                                 |dm| |a|)
                                                (QREFELT $ 99))
                                      (QREFELT $ 100))
                                     (QREFELT $ 101))
                           . #3#)))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSPECF;dvhypergeom| ((|l| . #1=(|List| F)) (|x| |Symbol|) ($ F))
        (SPROG
         ((|aprod| (F)) (|nl| (|List| F)) (|nl1| (|List| F)) (|nl0| (|List| F))
          (|bprod| (F)) (|b| (F)) (#2=#:G1009 NIL) (|i| NIL) (|a| (F))
          (#3=#:G1008 NIL) (|q| #4=(|Integer|)) (|p| #4#) (|z| (F))
          (|l1| (|List| F)) (|ol| #1#) (|pqi| (|List| (|Integer|)))
          (|pq| (|List| F)) (|nn| (|NonNegativeInteger|)) (#5=#:G1001 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #6=(|FSPECF;dvhypergeom|))
              (LETT |nn|
                    (PROG1 (LETT #5# (- |n| 2) . #6#)
                      (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #5#))
                    . #6#)
              (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 269)) . #6#)
              (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #6#)
              (LETT |ol| |l| . #6#)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 268)) . #6#)
              (LETT |l1| (REVERSE |l|) . #6#)
              (LETT |z| (|SPADfirst| |l1|) . #6#)
              (LETT |p| (|SPADfirst| |pqi|) . #6#)
              (LETT |q| (|SPADfirst| (CDR |pqi|)) . #6#)
              (LETT |aprod| (|spadConstant| $ 72) . #6#) (LETT |nl| NIL . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #3# |p| . #6#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |a| (|SPADfirst| |l|) . #6#)
                        (LETT |nl|
                              (CONS
                               (SPADCALL |a| (|spadConstant| $ 72)
                                         (QREFELT $ 101))
                               |nl|)
                              . #6#)
                        (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT $ 100))
                              . #6#)
                        (EXIT (LETT |l| (CDR |l|) . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |bprod| (|spadConstant| $ 72) . #6#)
              (SEQ (LETT |i| 1 . #6#) (LETT #2# |q| . #6#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |b| (|SPADfirst| |l|) . #6#)
                        (LETT |nl|
                              (CONS
                               (SPADCALL |b| (|spadConstant| $ 72)
                                         (QREFELT $ 101))
                               |nl|)
                              . #6#)
                        (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT $ 100))
                              . #6#)
                        (EXIT (LETT |l| (CDR |l|) . #6#)))
                   (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
              (LETT |nl0| (NREVERSE |nl|) . #6#)
              (LETT |nl1| (CONS |z| |pq|) . #6#)
              (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT $ 78)) . #6#)
              (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT $ 107)) . #6#)
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT $ 33) (- |nn| 1) |ol| |x| $)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT $ 98)) |aprod|
                                    (QREFELT $ 100))
                          (SPADCALL (QREFELT $ 33) |nl| (QREFELT $ 80))
                          (QREFELT $ 100))
                         (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;add_pairs_to_list|
        ((|lp| |List| (|List| F)) (|l| |List| F) ($ |List| F))
        (SPROG ((#1=#:G1014 NIL) (|p| NIL))
               (SEQ
                (SEQ (LETT |p| NIL . #2=(|FSPECF;add_pairs_to_list|))
                     (LETT #1# |lp| . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (LENGTH |p|) 2 (QREFELT $ 271))
                         (|error| "not a list of pairs"))
                        ('T
                         (LETT |l|
                               (CONS (SPADCALL |p| 2 (QREFELT $ 95))
                                     (CONS (SPADCALL |p| 1 (QREFELT $ 95))
                                           |l|))
                               . #2#)))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |l|)))) 

(SDEFUN |FSPECF;dvmeijer| ((|l| . #1=(|List| F)) (|x| |Symbol|) ($ F))
        (SPROG
         ((|om| (F)) (|nm| (F)) (|l2| (|List| F)) (|sign| (F)) (|na| (F))
          (|a| (F)) (|n2| (|Integer|)) (|n1| (|Integer|)) (|z| (F))
          (|l1| (|List| F)) (|nli| (|List| (|Integer|))) (|nl| (|List| F))
          (|l0| #1#) (|nn| (|NonNegativeInteger|)) (#2=#:G1015 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|) . #3=(|FSPECF;dvmeijer|))
              (LETT |nn|
                    (PROG1 (LETT #2# (- |n| 4) . #3#)
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#))
                    . #3#)
              (LETT |l0| |l| . #3#)
              (LETT |nl| (SPADCALL |l| |nn| (QREFELT $ 269)) . #3#)
              (LETT |nli| (|FSPECF;get_int_listf| |nl| $) . #3#)
              (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 268)) . #3#)
              (LETT |l1| (REVERSE |l|) . #3#)
              (LETT |z| (|SPADfirst| |l1|) . #3#)
              (LETT |n1| (|SPADfirst| |nli|) . #3#)
              (LETT |n2| (SPADCALL |nli| 2 (QREFELT $ 272)) . #3#)
              (LETT |a| (|SPADfirst| |l|) . #3#)
              (LETT |sign| (|spadConstant| $ 72) . #3#)
              (COND
               ((OR (SPADCALL |n1| 0 (QREFELT $ 273))
                    (SPADCALL |n2| 0 (QREFELT $ 273)))
                (SEQ
                 (LETT |na|
                       (SPADCALL |a| (|spadConstant| $ 72) (QREFELT $ 108))
                       . #3#)
                 (COND
                  ((EQL |n1| 0)
                   (LETT |sign|
                         (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117))
                         . #3#)))
                 (EXIT (LETT |l2| (CONS |na| (CDR |l|)) . #3#))))
               ('T
                (SEQ (LETT |na| |a| . #3#)
                     (COND
                      ((SPADCALL (SPADCALL |nli| 3 (QREFELT $ 272)) 0
                                 (QREFELT $ 273))
                       (LETT |sign|
                             (SPADCALL (|spadConstant| $ 72) (QREFELT $ 117))
                             . #3#)))
                     (EXIT
                      (LETT |l2|
                            (CONS
                             (SPADCALL |a| (|spadConstant| $ 72)
                                       (QREFELT $ 101))
                             (CDR |l|))
                            . #3#)))))
              (LETT |nm|
                    (SPADCALL (QREFELT $ 34)
                              (SPADCALL |l2| |nl| (QREFELT $ 78))
                              (QREFELT $ 80))
                    . #3#)
              (LETT |om| (SPADCALL (QREFELT $ 34) |l0| (QREFELT $ 80)) . #3#)
              (EXIT
               (SPADCALL (|FSPECF;idvsum| (QREFELT $ 34) (- |nn| 1) |l0| |x| $)
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| |x| (QREFELT $ 98))
                                    (SPADCALL
                                     (SPADCALL |sign| |nm| (QREFELT $ 100))
                                     (SPADCALL |na| |om| (QREFELT $ 100))
                                     (QREFELT $ 101))
                                    (QREFELT $ 100))
                          |z| (QREFELT $ 107))
                         (QREFELT $ 101)))))) 

(SDEFUN |FSPECF;get_if_list|
        ((|n| |Integer|) (|lf| |List| (|InputForm|))
         ($ |List| (|List| (|InputForm|))))
        (SPROG ((|a| (|List| (|InputForm|))) (#1=#:G1027 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL . #2=(|FSPECF;get_if_list|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|) . #2#)
                              (EXIT (LETT |lf| (CDR |lf|) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a|
                          (CONS (SPADCALL '|construct| (QREFELT $ 169))
                                (NREVERSE |a|))
                          . #2#)
                    (EXIT (LIST |a| |lf|))))) 

(SDEFUN |FSPECF;get_if_lists|
        ((|ln| |List| (|Integer|)) (|lf| |List| (|InputForm|))
         ($ |List| (|List| (|InputForm|))))
        (SPROG
         ((|rl| (|List| (|List| (|InputForm|))))
          (|al| (|List| (|List| (|InputForm|)))) (#1=#:G1032 NIL) (|n| NIL))
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
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1038 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1033 NIL))
         (SEQ
          (LETT |n0|
                (PROG1
                    (LETT #2# (- (LENGTH |lo|) |n|)
                          . #3=(|FSPECF;get_int_listi|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 275)) . #3#)
          (LETT |rl| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 277)) . #3#)
                (LETT |rl| (CONS |p| |rl|) . #3#)
                (EXIT (LETT |lo| (CDR |lo|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #3#) (EXIT |rl|)))) 

(SDEFUN |FSPECF;get_of_list|
        ((|n| |Integer|) (|lo| |List| (|OutputForm|))
         ($ |List| (|List| (|OutputForm|))))
        (SPROG ((|a| (|List| (|OutputForm|))) (#1=#:G1043 NIL) (|i| NIL))
               (SEQ (LETT |a| NIL . #2=(|FSPECF;get_of_list|))
                    (SEQ (LETT |i| 1 . #2#) (LETT #1# |n| . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (LETT |a| (CONS (|SPADfirst| |lo|) |a|) . #2#)
                              (EXIT (LETT |lo| (CDR |lo|) . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |a| (NREVERSE |a|) . #2#) (EXIT (LIST |a| |lo|))))) 

(SDEFUN |FSPECF;get_of_lists|
        ((|ln| |List| (|Integer|)) (|lo| |List| (|OutputForm|))
         ($ |List| (|List| (|OutputForm|))))
        (SPROG
         ((|rl| (|List| (|List| (|OutputForm|))))
          (|al| (|List| (|List| (|OutputForm|)))) (#1=#:G1048 NIL) (|n| NIL))
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
         ((|rl| (|List| (|Integer|))) (|p| (|Integer|)) (#1=#:G1054 NIL)
          (|i| NIL) (|n0| (|NonNegativeInteger|)) (#2=#:G1049 NIL))
         (SEQ
          (LETT |n0|
                (PROG1
                    (LETT #2# (- (LENGTH |lo|) |n|)
                          . #3=(|FSPECF;get_int_listo|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 279)) . #3#)
          (LETT |rl| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 277)) . #3#)
                (LETT |rl| (CONS |p| |rl|) . #3#)
                (EXIT (LETT |lo| (CDR |lo|) . #3#)))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #3#) (EXIT |rl|)))) 

(SDEFUN |FSPECF;dhyper0|
        ((|op| |OutputForm|) (|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|z| (|OutputForm|)) (|b| #1=(|List| (|OutputForm|))) (|a| #1#)
          (|al| (|List| (|List| (|OutputForm|)))) (|pql| (|List| (|Integer|)))
          (|n0| (|NonNegativeInteger|)) (#2=#:G1055 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #2# (- (LENGTH |lo|) 2) . #3=(|FSPECF;dhyper0|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #3#)
          (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| $) . #3#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 280)) . #3#)
          (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| $) . #3#)
          (LETT |lo| (|SPADfirst| |al|) . #3#) (LETT |al| (CDR |al|) . #3#)
          (LETT |a| (|SPADfirst| |al|) . #3#)
          (LETT |b| (|SPADfirst| (CDR |al|)) . #3#)
          (LETT |z| (|SPADfirst| |lo|) . #3#)
          (EXIT
           (SPADCALL |op|
                     (LIST (SPADCALL |a| (QREFELT $ 282))
                           (SPADCALL |b| (QREFELT $ 282)) |z|)
                     (QREFELT $ 283)))))) 

(SDEFUN |FSPECF;dhyper| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT $ 284)) |lo| $)) 

(SDEFUN |FSPECF;ddhyper| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(SDEFUN |FSPECF;dmeijer0|
        ((|op| |OutputForm|) (|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG
         ((|z| (|OutputForm|)) (|al| (|List| (|List| (|OutputForm|))))
          (|nl| (|List| (|Integer|))) (|n0| (|NonNegativeInteger|))
          (#1=#:G1060 NIL))
         (SEQ
          (LETT |n0|
                (PROG1 (LETT #1# (- (LENGTH |lo|) 4) . #2=(|FSPECF;dmeijer0|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                . #2#)
          (LETT |nl| (|FSPECF;get_int_listo| 4 |lo| $) . #2#)
          (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 280)) . #2#)
          (LETT |al| (|FSPECF;get_of_lists| |nl| |lo| $) . #2#)
          (LETT |lo| (|SPADfirst| |al|) . #2#) (LETT |al| (CDR |al|) . #2#)
          (LETT |z| (|SPADfirst| |lo|) . #2#)
          (EXIT
           (SPADCALL |op|
                     (SPADCALL (SPADCALL (ELT $ 282) |al| (QREFELT $ 288))
                               (LIST |z|) (QREFELT $ 289))
                     (QREFELT $ 283)))))) 

(SDEFUN |FSPECF;dmeijer| ((|lo| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT $ 284)) |lo| $)) 

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
          (LETT |ai| (SPADCALL |a| (QREFELT $ 170)) . #4#)
          (LETT |b| (|SPADfirst| (CDR |al|)) . #4#)
          (LETT |bi| (SPADCALL |b| (QREFELT $ 170)) . #4#)
          (LETT |zi| (|SPADfirst| |lf|) . #4#)
          (LETT |li|
                (LIST (SPADCALL '|hypergeometricF| (QREFELT $ 169)) |ai| |bi|
                      |zi|)
                . #4#)
          (EXIT (SPADCALL |li| (QREFELT $ 170)))))) 

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
          (LETT |ai| (SPADCALL |a| (QREFELT $ 170)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |b| (|SPADfirst| |al|) . #4#)
          (LETT |bi| (SPADCALL |b| (QREFELT $ 170)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |c| (|SPADfirst| |al|) . #4#)
          (LETT |ci| (SPADCALL |c| (QREFELT $ 170)) . #4#)
          (LETT |al| (CDR |al|) . #4#) (LETT |d| (|SPADfirst| |al|) . #4#)
          (LETT |di| (SPADCALL |d| (QREFELT $ 170)) . #4#)
          (LETT |zi| (|SPADfirst| |lf|) . #4#)
          (LETT |li|
                (LIST (SPADCALL '|meijerG| (QREFELT $ 169)) |ai| |bi| |ci| |di|
                      |zi|)
                . #4#)
          (EXIT (SPADCALL |li| (QREFELT $ 170)))))) 

(SDEFUN |FSPECF;iiHypergeometricF;LF;300| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 33) |l| (QREFELT $ 99))) 

(SDEFUN |FSPECF;iiMeijerG| ((|l| |List| F) ($ F))
        (SPADCALL (QREFELT $ 34) |l| (QREFELT $ 99))) 

(SDEFUN |FSPECF;d_eis| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL (QREFELT $ 41) |x| (QREFELT $ 205))
                   (QREFELT $ 117))
         (SPADCALL (|spadConstant| $ 72) |x| (QREFELT $ 107)) (QREFELT $ 101))) 

(SDEFUN |FSPECF;d_erfs| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL (SPADCALL 2 |x| (QREFELT $ 92))
                   (SPADCALL (QREFELT $ 42) |x| (QREFELT $ 205))
                   (QREFELT $ 100))
         (SPADCALL (SPADCALL 2 (QREFELT $ 76))
                   (SPADCALL (SPADCALL (QREFELT $ 115)) (QREFELT $ 127))
                   (QREFELT $ 107))
         (QREFELT $ 108))) 

(SDEFUN |FSPECF;d_erfis| ((|x| F) ($ F))
        (SPADCALL
         (SPADCALL
          (SPADCALL (SPADCALL 2 |x| (QREFELT $ 92))
                    (SPADCALL (QREFELT $ 43) |x| (QREFELT $ 205))
                    (QREFELT $ 100))
          (QREFELT $ 117))
         (SPADCALL (SPADCALL 2 (QREFELT $ 76))
                   (SPADCALL (SPADCALL (QREFELT $ 115)) (QREFELT $ 127))
                   (QREFELT $ 107))
         (QREFELT $ 101))) 

(DECLAIM (NOTINLINE |FunctionalSpecialFunction;|)) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1147)
  (SPROG NIL
         (PROG (#2=#:G1148)
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
   ((#1=#:G212 NIL) (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #2=(|FunctionalSpecialFunction|))
    (LETT DV$2 (|devaluate| |#2|) . #2#)
    (LETT |dv$| (LIST '|FunctionalSpecialFunction| DV$1 DV$2) . #2#)
    (LETT $ (GETREFV 292) . #2#)
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
    (QSETREFV $ 35 (SPADCALL '|charlierC| (QREFELT $ 12)))
    (QSETREFV $ 36 (SPADCALL '|hermiteH| (QREFELT $ 12)))
    (QSETREFV $ 37 (SPADCALL '|jacobiP| (QREFELT $ 12)))
    (QSETREFV $ 38 (SPADCALL '|laguerreL| (QREFELT $ 12)))
    (QSETREFV $ 39 (SPADCALL '|meixnerM| (QREFELT $ 12)))
    (QSETREFV $ 40 (SPADCALL '|%logGamma| (QREFELT $ 12)))
    (QSETREFV $ 41 (SPADCALL '|%eis| (QREFELT $ 12)))
    (QSETREFV $ 42 (SPADCALL '|%erfs| (QREFELT $ 12)))
    (QSETREFV $ 43 (SPADCALL '|%erfis| (QREFELT $ 12)))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 81
                 (CONS (|dispatchFunction| |FSPECF;hypergeometricF;2L2F;21|)
                       $))
       (QSETREFV $ 82
                 (CONS (|dispatchFunction| |FSPECF;meijerG;4L2F;22|) $)))))
    (QSETREFV $ 84
              (SPADCALL (SPADCALL '|%diff| (QREFELT $ 12)) (QREFELT $ 83)))
    (QSETREFV $ 87
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 2 (QREFELT $ 76)) (QREFELT $ 86))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3="failed")
                                #1#)))
    (QSETREFV $ 88
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 3 (QREFELT $ 76)) (QREFELT $ 86))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3#) #1#)))
    (QSETREFV $ 89
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 4 (QREFELT $ 76)) (QREFELT $ 86))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3#) #1#)))
    (QSETREFV $ 90
              (PROG2
                  (LETT #1#
                        (SPADCALL (SPADCALL 6 (QREFELT $ 76)) (QREFELT $ 86))
                        . #2#)
                  (QCDR #1#)
                (|check_union2| (QEQCAR #1# 0) |#2| (|Union| |#2| #3#) #1#)))
    (QSETREFV $ 93 (SPADCALL 2 (QREFELT $ 88) (QREFELT $ 92)))
    (QSETREFV $ 94 (SPADCALL 3 (QREFELT $ 87) (QREFELT $ 92)))
    (QSETREFV $ 102 (SPADCALL '|whittakerM| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 102) (CONS (|function| |FSPECF;elWhittakerM|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 102) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerM|) $) (QREFELT $ 110))
    (QSETREFV $ 111 (SPADCALL '|whittakerW| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 111) (CONS (|function| |FSPECF;elWhittakerW|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 111) '|%specialDiff|
              (CONS (|function| |FSPECF;dWhittakerW|) $) (QREFELT $ 110))
    (QSETREFV $ 113 (SPADCALL '|angerJ| (QREFELT $ 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 113) (CONS (|function| |FSPECF;elAngerJ|) $)
                 (QREFELT $ 106))
       (SPADCALL (QREFELT $ 113) '|%specialDiff|
                 (CONS (|function| |FSPECF;dAngerJ|) $) (QREFELT $ 110))))
     ('T
      (PROGN
       (SPADCALL (QREFELT $ 113) (CONS (|function| |FSPECF;eeAngerJ|) $)
                 (QREFELT $ 106)))))
    (QSETREFV $ 118 (SPADCALL '|weberE| (QREFELT $ 12)))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 118) (CONS (|function| |FSPECF;elWeberE|) $)
                 (QREFELT $ 106))
       (SPADCALL (QREFELT $ 118) '|%specialDiff|
                 (CONS (|function| |FSPECF;dWeberE|) $) (QREFELT $ 110))))
     ('T
      (PROGN
       (SPADCALL (QREFELT $ 118) (CONS (|function| |FSPECF;eeWeberE|) $)
                 (QREFELT $ 106)))))
    (QSETREFV $ 124 (SPADCALL '|struveH| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 124) (CONS (|function| |FSPECF;elStruveH|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 124) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveH|) $)
                   (QREFELT $ 110)))))))
    (QSETREFV $ 128 (SPADCALL '|struveL| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 128) (CONS (|function| |FSPECF;elStruveL|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 128) '|%specialDiff|
                   (CONS (|function| |FSPECF;dStruveL|) $)
                   (QREFELT $ 110)))))))
    (QSETREFV $ 130 (SPADCALL '|hankelH1| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 130) (CONS (|function| |FSPECF;elHankelH1|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 130) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH1|) $) (QREFELT $ 110))
    (QSETREFV $ 132 (SPADCALL '|hankelH2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 132) (CONS (|function| |FSPECF;elHankelH2|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 132) '|%specialDiff|
              (CONS (|function| |FSPECF;dHankelH2|) $) (QREFELT $ 110))
    (QSETREFV $ 134 (SPADCALL '|lommelS1| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 134) (CONS (|function| |FSPECF;elLommelS1|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 134) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS1|) $) (QREFELT $ 110))
    (QSETREFV $ 136 (SPADCALL '|lommelS2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 136) (CONS (|function| |FSPECF;elLommelS2|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 136) '|%specialDiff|
              (CONS (|function| |FSPECF;dLommelS2|) $) (QREFELT $ 110))
    (QSETREFV $ 138 (SPADCALL '|kummerM| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 138) (CONS (|function| |FSPECF;elKummerM|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 138) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerM|) $) (QREFELT $ 110))
    (QSETREFV $ 140 (SPADCALL '|kummerU| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 140) (CONS (|function| |FSPECF;elKummerU|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 140) '|%specialDiff|
              (CONS (|function| |FSPECF;dKummerU|) $) (QREFELT $ 110))
    (QSETREFV $ 142 (SPADCALL '|legendreP| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 142) (CONS (|function| |FSPECF;elLegendreP|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 142) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreP|) $) (QREFELT $ 110))
    (QSETREFV $ 144 (SPADCALL '|legendreQ| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 144) (CONS (|function| |FSPECF;elLegendreQ|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 144) '|%specialDiff|
              (CONS (|function| |FSPECF;dLegendreQ|) $) (QREFELT $ 110))
    (QSETREFV $ 146 (SPADCALL '|kelvinBei| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 146) (CONS (|function| |FSPECF;elKelvinBei|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 146) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBei|) $) (QREFELT $ 110)))))
    (QSETREFV $ 149 (SPADCALL '|kelvinBer| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 149) (CONS (|function| |FSPECF;elKelvinBer|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 149) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinBer|) $) (QREFELT $ 110)))))
    (QSETREFV $ 150 (SPADCALL '|kelvinKei| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 150) (CONS (|function| |FSPECF;elKelvinKei|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 150) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKei|) $) (QREFELT $ 110)))))
    (QSETREFV $ 153 (SPADCALL '|kelvinKer| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 153) (CONS (|function| |FSPECF;elKelvinKer|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 153) '|%specialDiff|
                 (CONS (|function| |FSPECF;dKelvinKer|) $) (QREFELT $ 110)))))
    (QSETREFV $ 154 (SPADCALL '|ellipticK| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 154) (CONS (|function| |FSPECF;elEllipticK|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 154) (CONS (|function| |FSPECF;dEllipticK|) $)
              (QREFELT $ 160))
    (QSETREFV $ 161 (SPADCALL '|ellipticE| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 161) (CONS (|function| |FSPECF;elEllipticE|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 161) (CONS (|function| |FSPECF;dEllipticE|) $)
              (QREFELT $ 160))
    (QSETREFV $ 162 (SPADCALL '|ellipticE2| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 162) (CONS (|function| |FSPECF;elEllipticE2|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 162)
                 (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticE2Grad_m|) $))
                 (QREFELT $ 167)))))
    (SPADCALL (QREFELT $ 162) (CONS (|function| |FSPECF;inEllipticE2|) $)
              (QREFELT $ 172))
    (QSETREFV $ 173 (SPADCALL '|ellipticF| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 173) (CONS (|function| |FSPECF;elEllipticF|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 173)
                 (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticFGrad_m|) $))
                 (QREFELT $ 167)))))
    (QSETREFV $ 174 (SPADCALL '|ellipticPi| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 174) (CONS (|function| |FSPECF;elEllipticPi|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|RadicalCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 174)
                 (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) $)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_n|) $)
                       (CONS (|function| |FSPECF;eEllipticPiGrad_m|) $))
                 (QREFELT $ 167)))))
    (QSETREFV $ 176 (SPADCALL '|jacobiSn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 176) (CONS (|function| |FSPECF;elJacobiSn|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 176)
              (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiSnGrad_m|) $))
              (QREFELT $ 167))
    (QSETREFV $ 185 (SPADCALL '|jacobiCn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 185) (CONS (|function| |FSPECF;elJacobiCn|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 185)
              (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiCnGrad_m|) $))
              (QREFELT $ 167))
    (QSETREFV $ 186 (SPADCALL '|jacobiDn| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 186) (CONS (|function| |FSPECF;elJacobiDn|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 186)
              (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiDnGrad_m|) $))
              (QREFELT $ 167))
    (QSETREFV $ 187 (SPADCALL '|jacobiZeta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 187) (CONS (|function| |FSPECF;elJacobiZeta|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 187)
              (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) $)
                    (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) $))
              (QREFELT $ 167))
    (QSETREFV $ 189 (SPADCALL '|jacobiTheta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 189) (CONS (|function| |FSPECF;elJacobiTheta|) $)
              (QREFELT $ 106))
    (QSETREFV $ 191 (SPADCALL '|lerchPhi| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 191) (CONS (|function| |FSPECF;elLerchPhi|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 191) '|%specialDiff|
              (CONS (|function| |FSPECF;dLerchPhi|) $) (QREFELT $ 110))
    (QSETREFV $ 193 (SPADCALL '|riemannZeta| (QREFELT $ 12)))
    (SPADCALL (QREFELT $ 193) (CONS (|function| |FSPECF;elRiemannZeta|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 35) (CONS (|function| |FSPECF;elCharlierC|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 36) (CONS (|function| |FSPECF;elHermiteH|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 36) '|%specialDiff|
              (CONS (|function| |FSPECF;dHermiteH|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 37) (CONS (|function| |FSPECF;elJacobiP|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 37) '|%specialDiff|
              (CONS (|function| |FSPECF;dJacobiP|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 38) (CONS (|function| |FSPECF;elLaguerreL|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 38) '|%specialDiff|
              (CONS (|function| |FSPECF;dLaguerreL|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 39) (CONS (|function| |FSPECF;elMeixnerM|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (QSETREFV $ 208 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;206|) $))
       (QSETREFV $ 209
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;207|) $))
       (QSETREFV $ 210 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;208|) $))
       (QSETREFV $ 211
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;209|) $))))
     ('T
      (PROGN
       (QSETREFV $ 208 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;210|) $))
       (QSETREFV $ 209
                 (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;211|) $))
       (QSETREFV $ 210 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;212|) $))
       (QSETREFV $ 211
                 (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;213|) $)))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (QSETREFV $ 213 (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;214|) $)))
     ('T
      (QSETREFV $ 213
                (CONS (|dispatchFunction| |FSPECF;iLambertW;2F;215|) $))))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
        (QSETREFV $ 216
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;216|) $)))
       ('T
        (QSETREFV $ 216
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;217|) $)))))
     ('T
      (QSETREFV $ 216
                (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;218|) $))))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|abs|
                            (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
      (PROGN
       (QSETREFV $ 228 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;224|) $))))
     ('T (QSETREFV $ 228 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;225|) $))))
    (COND
     ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
      (PROGN
       (QSETREFV $ 231 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;226|) $))
       (QSETREFV $ 233 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;227|) $))
       (QSETREFV $ 235 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;228|) $))
       (QSETREFV $ 237
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;229|) $))
       (QSETREFV $ 239 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;230|) $))
       (QSETREFV $ 241 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;231|) $))
       (QSETREFV $ 243 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;232|) $))
       (QSETREFV $ 245 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;233|) $))
       (QSETREFV $ 247 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;234|) $))
       (QSETREFV $ 249
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;235|) $))
       (QSETREFV $ 251 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;236|) $))
       (QSETREFV $ 251
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;237|) $))))
     ('T
      (PROGN
       (COND
        ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (QSETREFV $ 231
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;238|) $)))
        ('T
         (QSETREFV $ 231
                   (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;239|) $))))
       (QSETREFV $ 233 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;240|) $))
       (QSETREFV $ 235 (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;241|) $))
       (QSETREFV $ 237
                 (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;242|) $))
       (QSETREFV $ 239 (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;243|) $))
       (QSETREFV $ 241 (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;244|) $))
       (QSETREFV $ 243 (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;245|) $))
       (QSETREFV $ 245 (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;246|) $))
       (QSETREFV $ 247 (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;247|) $))
       (QSETREFV $ 249
                 (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;248|) $))
       (QSETREFV $ 251 (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;249|) $))
       (QSETREFV $ 256
                 (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;250|)
                       $)))))
    (SPADCALL (QREFELT $ 14) (ELT $ 231) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 13) (ELT $ 228) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 16) (ELT $ 233) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 17) (ELT $ 235) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 18) (ELT $ 237) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 19) (ELT $ 239) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 20) (ELT $ 241) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 21) (ELT $ 243) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 22) (ELT $ 245) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 23) (ELT $ 247) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 24) (ELT $ 249) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 25) (ELT $ 251) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 26) (ELT $ 256) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 27) (ELT $ 213) (QREFELT $ 258))
    (SPADCALL (QREFELT $ 28) (CONS (|function| |FSPECF;iPolylog|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 29) (CONS (|function| |FSPECF;iiWeierstrassP|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 30) (CONS (|function| |FSPECF;iiWeierstrassPPrime|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 31) (CONS (|function| |FSPECF;iiWeierstrassSigma|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 32) (CONS (|function| |FSPECF;iiWeierstrassZeta|) $)
              (QREFELT $ 106))
    (SPADCALL (QREFELT $ 33) (ELT $ 259) (QREFELT $ 106))
    (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;iiMeijerG|) $)
              (QREFELT $ 106))
    (COND
     ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
      (PROGN
       (SPADCALL (QREFELT $ 15) '|%specialDiff|
                 (CONS (|function| |FSPECF;iGamma2|) $) (QREFELT $ 110)))))
    (SPADCALL (QREFELT $ 15) (CONS (|function| |FSPECF;inGamma2|) $)
              (QREFELT $ 172))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 259
                 (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;281|)
                       $))
       (SPADCALL (QREFELT $ 33) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddhyper|) $) (QREFELT $ 110))
       (SPADCALL (QREFELT $ 34) '|%diffDisp|
                 (CONS (|function| |FSPECF;ddmeijer|) $) (QREFELT $ 110))
       (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;dhyper|) $)
                 (QREFELT $ 290))
       (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;dmeijer|) $)
                 (QREFELT $ 290))
       (SPADCALL (QREFELT $ 33) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvhypergeom|) $) (QREFELT $ 110))
       (SPADCALL (QREFELT $ 34) '|%specialDiff|
                 (CONS (|function| |FSPECF;dvmeijer|) $) (QREFELT $ 110))
       (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;inhyper|) $)
                 (QREFELT $ 172))
       (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;inmeijer|) $)
                 (QREFELT $ 172))))
     ('T
      (QSETREFV $ 259
                (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;300|)
                      $))))
    (COND
     ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 42) (CONS (|function| |FSPECF;d_erfs|) $)
                   (QREFELT $ 160))
         (SPADCALL (QREFELT $ 43) (CONS (|function| |FSPECF;d_erfis|) $)
                   (QREFELT $ 160)))))))
    (SPADCALL (QREFELT $ 13) (CONS #'|FunctionalSpecialFunction!0| $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 14) (CONS #'|FunctionalSpecialFunction!1| $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 40) (ELT $ 50) (QREFELT $ 160))
    (SPADCALL (QREFELT $ 16)
              (LIST (CONS (|function| |FSPECF;iBetaGrad1|) $)
                    (CONS (|function| |FSPECF;iBetaGrad2|) $))
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 17) (CONS #'|FunctionalSpecialFunction!2| $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 41) (CONS (|function| |FSPECF;d_eis|) $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 23) (ELT $ 57) (QREFELT $ 160))
    (SPADCALL (QREFELT $ 24) (CONS #'|FunctionalSpecialFunction!3| $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 25) (ELT $ 59) (QREFELT $ 160))
    (SPADCALL (QREFELT $ 26) (CONS #'|FunctionalSpecialFunction!4| $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 27) (CONS (|function| |FSPECF;dLambertW|) $)
              (QREFELT $ 160))
    (SPADCALL (QREFELT $ 29)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPGrad3|) $))
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 30)
              (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) $))
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 31)
              (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) $))
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 32)
              (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) $)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) $)
                    (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) $))
              (QREFELT $ 167))
    (SPADCALL (QREFELT $ 18) '|%specialDiff|
              (CONS (|function| |FSPECF;ipolygamma|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 19) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselJ|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 20) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselY|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 21) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselI|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 22) '|%specialDiff|
              (CONS (|function| |FSPECF;iBesselK|) $) (QREFELT $ 110))
    (SPADCALL (QREFELT $ 28) '|%specialDiff|
              (CONS (|function| |FSPECF;dPolylog|) $) (QREFELT $ 110))
    $))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 58)) (QREFELT $ 100))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 56)) (QREFELT $ 100))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| $)
  (SPADCALL (|spadConstant| $ 72) |x| (QREFELT $ 51))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 50)) (SPADCALL |x| (QREFELT $ 46))
            (QREFELT $ 100))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (SPADCALL |x| (QREFELT $ 291))
            (QREFELT $ 100))) 

(MAKEPROP '|FunctionalSpecialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPECIAL
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opabs| '|opGamma| '|opGamma2| '|opBeta| '|opdigamma|
              '|oppolygamma| '|opBesselJ| '|opBesselY| '|opBesselI|
              '|opBesselK| '|opAiryAi| '|opAiryAiPrime| '|opAiryBi|
              '|opAiryBiPrime| '|opLambertW| '|opPolylog| '|opWeierstrassP|
              '|opWeierstrassPPrime| '|opWeierstrassSigma| '|opWeierstrassZeta|
              '|opHypergeometricF| '|opMeijerG| '|opCharlierC| '|opHermiteH|
              '|opJacobiP| '|opLaguerreL| '|opMeixnerM| '|op_log_gamma|
              '|op_eis| '|op_erfs| '|op_erfis| (5 . |elt|) |FSPECF;abs;2F;1|
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
              '|opWhittakerM| |FSPECF;whittakerM;4F;26| (|Mapping| 7 77)
              (|BasicOperatorFunctions1| 7) (142 . |evaluate|) (148 . /)
              (154 . -) (|None|) (160 . |setProperty|) '|opWhittakerW|
              |FSPECF;whittakerW;4F;31| '|opAngerJ| |FSPECF;angerJ;3F;36|
              (167 . |pi|) (171 . |sin|) (176 . -) '|opWeberE|
              |FSPECF;weberE;3F;42| (181 . ^)
              (|SparseMultivariatePolynomial| 6 181) (187 . |One|)
              (191 . |cos|) '|opStruveH| |FSPECF;struveH;3F;48| (196 . ^)
              (202 . |sqrt|) '|opStruveL| |FSPECF;struveL;3F;53| '|opHankelH1|
              |FSPECF;hankelH1;3F;58| '|opHankelH2| |FSPECF;hankelH2;3F;63|
              '|opLommelS1| |FSPECF;lommelS1;4F;68| '|opLommelS2|
              |FSPECF;lommelS2;4F;73| '|opKummerM| |FSPECF;kummerM;4F;78|
              '|opKummerU| |FSPECF;kummerU;4F;83| '|opLegendreP|
              |FSPECF;legendreP;4F;88| '|opLegendreQ| |FSPECF;legendreQ;4F;93|
              '|opKelvinBei| |FSPECF;kelvinBei;3F;98| |FSPECF;kelvinBer;3F;103|
              '|opKelvinBer| '|opKelvinKei| |FSPECF;kelvinKei;3F;108|
              |FSPECF;kelvinKer;3F;113| '|opKelvinKer| '|opEllipticK|
              |FSPECF;ellipticK;2F;118| |FSPECF;ellipticE;2F;122|
              (|Fraction| 75) (207 . |One|) (|Mapping| 7 7)
              (211 . |derivative|) '|opEllipticE| '|opEllipticE2|
              |FSPECF;ellipticE;3F;126| (217 . ^) |FSPECF;ellipticF;3F;132|
              (|List| 104) (223 . |derivative|) (|InputForm|) (229 . |convert|)
              (234 . |convert|) (|Mapping| 168 274) (239 . |input|)
              '|opEllipticF| '|opEllipticPi| |FSPECF;ellipticPi;4F;137|
              '|opJacobiSn| |FSPECF;jacobiSn;3F;143| (245 . |is?|) (|Kernel| $)
              (251 . |retract|) (|Kernel| 7) (256 . |argument|)
              |FSPECF;jacobiCn;3F;149| |FSPECF;jacobiDn;3F;154| '|opJacobiCn|
              '|opJacobiDn| '|opJacobiZeta| |FSPECF;jacobiZeta;3F;159|
              '|opJacobiTheta| |FSPECF;jacobiTheta;3F;164| '|opLerchPhi|
              |FSPECF;lerchPhi;4F;167| '|opRiemannZeta|
              |FSPECF;riemannZeta;2F;171| |FSPECF;charlierC;4F;174|
              |FSPECF;hermiteH;3F;177| (261 . |elt|) |FSPECF;jacobiP;5F;182|
              |FSPECF;laguerreL;4F;187| |FSPECF;meixnerM;5F;192| (270 . |has?|)
              |FSPECF;belong?;BoB;195| (276 . |is?|) |FSPECF;operator;2Bo;196|
              (282 . |kernel|) (288 . |zero?|) (293 . |smaller?|)
              (299 . |iAiryAi|) (304 . |iAiryAiPrime|) (309 . |iAiryBi|)
              (314 . |iAiryBiPrime|) (319 . |exp|) (324 . |iLambertW|)
              (329 . |log|) (334 . |dilog|) (339 . |iiPolylog|)
              (345 . |second|) (|Union| 221 '#1="failed")
              (350 . |retractIfCan|) (|Polynomial| 6) (|Fraction| 220)
              (355 . |numer|) (|Union| 6 '"failed") (360 . |retractIfCan|)
              (365 . |denom|) (370 . |abs|) (375 . |coerce|) (380 . |iiabs|)
              (385 . |retractIfCan|) (390 . |Gamma|) (395 . |iiGamma|)
              (400 . |Beta|) (406 . |iiBeta|) (411 . |digamma|)
              (416 . |iidigamma|) (421 . |polygamma|) (427 . |iipolygamma|)
              (432 . |besselJ|) (438 . |iiBesselJ|) (443 . |besselY|)
              (449 . |iiBesselY|) (454 . |besselI|) (460 . |iiBesselI|)
              (465 . |besselK|) (471 . |iiBesselK|) (476 . |airyAi|)
              (481 . |iiAiryAi|) (486 . |airyAiPrime|) (491 . |iiAiryAiPrime|)
              (496 . |airyBi|) (501 . |iiAiryBi|) (506 . |airyBiPrime|)
              (|Union| 75 '#1#) (511 . |retractIfCan|) (516 . |factorial|)
              (521 . |iiAiryBiPrime|) (526 . |third|) (531 . |evaluate|)
              (537 . |iiHypergeometricF|) (|List| 10) (542 . |variables|)
              (547 . |member?|) (553 . |retract|) (|List| 75) (|Mapping| 75 7)
              (|ListFunctions2| 7 75) (558 . |map|) (564 . |first|)
              (570 . |rest|) (576 . <=) (582 . ~=) (588 . |elt|) (594 . >)
              (|List| 168) (600 . |rest|) (|SExpression|) (606 . |integer|)
              (|List| 281) (611 . |rest|) (617 . |first|) (|OutputForm|)
              (623 . |bracket|) (628 . |prefix|) (634 . |coerce|)
              (|Mapping| 281 278) (|List| 278) (|ListFunctions2| 278 281)
              (639 . |map|) (645 . |concat|) (651 . |display|) (657 . |inv|))
           '#(|whittakerW| 662 |whittakerM| 669 |weierstrassZeta| 676
              |weierstrassSigma| 683 |weierstrassPPrime| 690 |weierstrassP| 697
              |weberE| 704 |struveL| 710 |struveH| 716 |riemannZeta| 722
              |polylog| 727 |polygamma| 733 |operator| 739 |meixnerM| 744
              |meijerG| 752 |lommelS2| 761 |lommelS1| 768 |lerchPhi| 775
              |legendreQ| 782 |legendreP| 789 |lambertW| 796 |laguerreL| 801
              |kummerU| 808 |kummerM| 815 |kelvinKer| 822 |kelvinKei| 828
              |kelvinBer| 834 |kelvinBei| 840 |jacobiZeta| 846 |jacobiTheta|
              852 |jacobiSn| 858 |jacobiP| 864 |jacobiDn| 872 |jacobiCn| 878
              |iipolygamma| 884 |iidigamma| 889 |iiabs| 894 |iiPolylog| 899
              |iiHypergeometricF| 905 |iiGamma| 910 |iiBeta| 915 |iiBesselY|
              920 |iiBesselK| 925 |iiBesselJ| 930 |iiBesselI| 935
              |iiAiryBiPrime| 940 |iiAiryBi| 945 |iiAiryAiPrime| 950 |iiAiryAi|
              955 |iLambertW| 960 |iAiryBiPrime| 965 |iAiryBi| 970
              |iAiryAiPrime| 975 |iAiryAi| 980 |hypergeometricF| 985 |hermiteH|
              992 |hankelH2| 998 |hankelH1| 1004 |ellipticPi| 1010 |ellipticK|
              1017 |ellipticF| 1022 |ellipticE| 1028 |digamma| 1039 |charlierC|
              1044 |besselY| 1051 |besselK| 1057 |besselJ| 1063 |besselI| 1069
              |belong?| 1075 |angerJ| 1080 |airyBiPrime| 1086 |airyBi| 1091
              |airyAiPrime| 1096 |airyAi| 1101 |abs| 1106 |Gamma| 1111 |Beta|
              1122)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 291
                                                 '(1 11 9 10 12 2 7 0 9 0 44 3
                                                   7 0 9 0 0 47 4 7 0 9 0 0 0
                                                   62 0 6 0 67 0 7 0 68 2 7 69
                                                   0 0 70 0 6 0 71 0 7 0 72 2
                                                   73 69 0 0 74 1 7 0 75 76 2
                                                   77 0 0 0 78 2 7 0 9 79 80 3
                                                   0 7 77 77 7 81 5 0 7 77 77
                                                   77 77 7 82 1 7 9 9 83 1 7 85
                                                   0 86 2 7 0 91 0 92 2 77 7 0
                                                   75 95 0 10 0 96 1 7 0 10 97
                                                   2 7 0 0 10 98 2 7 0 9 79 99
                                                   2 7 0 0 0 100 2 7 0 0 0 101
                                                   2 105 9 9 104 106 2 7 0 0 0
                                                   107 2 7 0 0 0 108 3 9 0 0 10
                                                   109 110 0 7 0 115 1 7 0 0
                                                   116 1 7 0 0 117 2 7 0 0 75
                                                   120 0 121 0 122 1 7 0 0 123
                                                   2 7 0 0 0 126 1 7 0 0 127 0
                                                   157 0 158 2 105 9 9 159 160
                                                   2 7 0 0 91 164 2 105 9 9 166
                                                   167 1 10 168 0 169 1 168 0
                                                   79 170 2 9 0 0 171 172 2 7
                                                   69 0 9 178 1 7 179 0 180 1
                                                   181 77 0 182 5 7 0 9 0 0 0 0
                                                   197 2 9 69 0 10 201 2 9 69 0
                                                   10 203 2 7 0 9 0 205 1 7 69
                                                   0 206 2 7 69 0 0 207 1 0 7 7
                                                   208 1 0 7 7 209 1 0 7 7 210
                                                   1 0 7 7 211 1 7 0 0 212 1 0
                                                   7 7 213 1 7 0 0 214 1 7 0 0
                                                   215 2 0 7 7 7 216 1 77 7 0
                                                   217 1 7 218 0 219 1 221 220
                                                   0 222 1 220 223 0 224 1 221
                                                   220 0 225 1 6 0 0 226 1 7 0
                                                   6 227 1 0 7 7 228 1 7 223 0
                                                   229 1 6 0 0 230 1 0 7 7 231
                                                   2 6 0 0 0 232 1 0 7 77 233 1
                                                   6 0 0 234 1 0 7 7 235 2 6 0
                                                   0 0 236 1 0 7 77 237 2 6 0 0
                                                   0 238 1 0 7 77 239 2 6 0 0 0
                                                   240 1 0 7 77 241 2 6 0 0 0
                                                   242 1 0 7 77 243 2 6 0 0 0
                                                   244 1 0 7 77 245 1 6 0 0 246
                                                   1 0 7 7 247 1 6 0 0 248 1 0
                                                   7 7 249 1 6 0 0 250 1 0 7 7
                                                   251 1 6 0 0 252 1 7 253 0
                                                   254 1 75 0 0 255 1 0 7 7 256
                                                   1 77 7 0 257 2 105 9 9 159
                                                   258 1 0 7 77 259 1 7 260 0
                                                   261 2 260 69 10 0 262 1 7 75
                                                   0 263 2 266 264 265 77 267 2
                                                   77 0 0 73 268 2 77 0 0 73
                                                   269 2 75 69 0 0 270 2 73 69
                                                   0 0 271 2 264 75 0 75 272 2
                                                   75 69 0 0 273 2 274 0 0 73
                                                   275 1 276 75 0 277 2 278 0 0
                                                   73 279 2 278 0 0 73 280 1
                                                   281 0 79 282 2 281 0 0 79
                                                   283 1 10 281 0 284 2 287 278
                                                   285 286 288 2 278 0 0 0 289
                                                   2 9 0 0 285 290 1 7 0 0 291
                                                   3 0 7 7 7 7 112 3 0 7 7 7 7
                                                   103 3 0 7 7 7 7 66 3 0 7 7 7
                                                   7 65 3 0 7 7 7 7 64 3 0 7 7
                                                   7 7 63 2 0 7 7 7 119 2 0 7 7
                                                   7 129 2 0 7 7 7 125 1 0 7 7
                                                   194 2 0 7 7 7 61 2 0 7 7 7
                                                   51 1 0 9 9 204 4 0 7 7 7 7 7
                                                   200 5 1 7 77 77 77 77 7 82 3
                                                   0 7 7 7 7 137 3 0 7 7 7 7
                                                   135 3 0 7 7 7 7 192 3 0 7 7
                                                   7 7 145 3 0 7 7 7 7 143 1 0
                                                   7 7 60 3 0 7 7 7 7 199 3 0 7
                                                   7 7 7 141 3 0 7 7 7 7 139 2
                                                   0 7 7 7 152 2 0 7 7 7 151 2
                                                   0 7 7 7 148 2 0 7 7 7 147 2
                                                   0 7 7 7 188 2 0 7 7 7 190 2
                                                   0 7 7 7 177 4 0 7 7 7 7 7
                                                   198 2 0 7 7 7 184 2 0 7 7 7
                                                   183 1 0 7 77 237 1 0 7 7 235
                                                   1 0 7 7 228 2 0 7 7 7 216 1
                                                   0 7 77 259 1 0 7 7 231 1 0 7
                                                   77 233 1 0 7 77 241 1 0 7 77
                                                   245 1 0 7 77 239 1 0 7 77
                                                   243 1 0 7 7 256 1 0 7 7 251
                                                   1 0 7 7 249 1 0 7 7 247 1 0
                                                   7 7 213 1 0 7 7 211 1 0 7 7
                                                   210 1 0 7 7 209 1 0 7 7 208
                                                   3 1 7 77 77 7 81 2 0 7 7 7
                                                   196 2 0 7 7 7 133 2 0 7 7 7
                                                   131 3 0 7 7 7 7 175 1 0 7 7
                                                   155 2 0 7 7 7 165 1 0 7 7
                                                   156 2 0 7 7 7 163 1 0 7 7 50
                                                   3 0 7 7 7 7 195 2 0 7 7 7 53
                                                   2 0 7 7 7 55 2 0 7 7 7 52 2
                                                   0 7 7 7 54 1 0 69 9 202 2 0
                                                   7 7 7 114 1 0 7 7 59 1 0 7 7
                                                   58 1 0 7 7 57 1 0 7 7 56 1 0
                                                   7 7 45 1 0 7 7 46 2 0 7 7 7
                                                   48 2 0 7 7 7 49)))))
           '|lookupComplete|)) 
