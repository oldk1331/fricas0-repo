
(/VERSIONCHECK 2) 

(DEFUN |FSPECF;abs;2F;1| (|x| $) (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;Gamma;2F;2| (|x| $) (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;Gamma;3F;3| (|a| |x| $)
  (SPADCALL (QREFELT $ 15) |a| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;Beta;3F;4| (|x| |y| $)
  (SPADCALL (QREFELT $ 16) |x| |y| (QREFELT $ 38))) 

(DEFUN |FSPECF;digamma;2F;5| (|x| $)
  (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;polygamma;3F;6| (|k| |x| $)
  (SPADCALL (QREFELT $ 18) |k| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;besselJ;3F;7| (|a| |x| $)
  (SPADCALL (QREFELT $ 19) |a| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;besselY;3F;8| (|a| |x| $)
  (SPADCALL (QREFELT $ 20) |a| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;besselI;3F;9| (|a| |x| $)
  (SPADCALL (QREFELT $ 21) |a| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;besselK;3F;10| (|a| |x| $)
  (SPADCALL (QREFELT $ 22) |a| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;airyAi;2F;11| (|x| $)
  (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;airyAiPrime;2F;12| (|x| $)
  (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;airyBi;2F;13| (|x| $)
  (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;airyBiPrime;2F;14| (|x| $)
  (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;lambertW;2F;15| (|x| $)
  (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 35))) 

(DEFUN |FSPECF;polylog;3F;16| (|s| |x| $)
  (SPADCALL (QREFELT $ 28) |s| |x| (QREFELT $ 38))) 

(DEFUN |FSPECF;weierstrassP;4F;17| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 29) |g2| |g3| |x| (QREFELT $ 53))) 

(DEFUN |FSPECF;weierstrassPPrime;4F;18| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 30) |g2| |g3| |x| (QREFELT $ 53))) 

(DEFUN |FSPECF;weierstrassSigma;4F;19| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 31) |g2| |g3| |x| (QREFELT $ 53))) 

(DEFUN |FSPECF;weierstrassZeta;4F;20| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 32) |g2| |g3| |x| (QREFELT $ 53))) 

(DEFUN |FSPECF;hypergeometricF;2L2F;21| (|a| |b| |z| $)
  (PROG (|q| |p| |nbi| |nai|)
    (RETURN
     (SEQ (LETT |nai| (LENGTH |a|) . #1=(|FSPECF;hypergeometricF;2L2F;21|))
          (LETT |nbi| (LENGTH |b|) . #1#)
          (COND
           ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
            (COND
             ((SPADCALL |nai| (+ |nbi| 1) (QREFELT $ 65))
              (EXIT (|spadConstant| $ 63))))))
          (LETT |p| (SPADCALL (LENGTH |a|) (QREFELT $ 67)) . #1#)
          (LETT |q| (SPADCALL (LENGTH |b|) (QREFELT $ 67)) . #1#)
          (EXIT
           (SPADCALL (QREFELT $ 33)
                     (SPADCALL
                      (SPADCALL |a| (SPADCALL |b| (LIST |z|) (QREFELT $ 69))
                                (QREFELT $ 69))
                      (LIST |p| |q|) (QREFELT $ 69))
                     (QREFELT $ 71))))))) 

(DEFUN |FSPECF;meijerG;4L2F;22| (|a| |b| |c| |d| |z| $)
  (PROG (|m2| |m1| |n2| |n1|)
    (RETURN
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
                                                (SPADCALL |d| (LIST |z|)
                                                          (QREFELT $ 69))
                                                (QREFELT $ 69))
                                      (QREFELT $ 69))
                            (QREFELT $ 69))
                  (LIST |n1| |n2| |m1| |m2|) (QREFELT $ 69))
                 (QREFELT $ 71))))))) 

(DEFUN |FSPECF;grad2| (|l| |t| |op| |d2| $)
  (PROG (|x2| |x1|)
    (RETURN
     (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 89)) . #1=(|FSPECF;grad2|))
          (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL |op| (LIST (QREFELT $ 78) |x2|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |x1|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 90))
                      (SPADCALL |x1| |x2| |d2|) (QREFELT $ 92))
            (QREFELT $ 93))))))) 

(DEFUN |FSPECF;grad3| (|l| |t| |op| |d3| $)
  (PROG (|x3| |x2| |x1|)
    (RETURN
     (SEQ (LETT |x1| (SPADCALL |l| 1 (QREFELT $ 89)) . #1=(|FSPECF;grad3|))
          (LETT |x2| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
          (LETT |x3| (SPADCALL |l| 3 (QREFELT $ 89)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |x1| |t| (QREFELT $ 90))
                       (SPADCALL (QREFELT $ 75)
                                 (LIST
                                  (SPADCALL |op|
                                            (LIST (QREFELT $ 78) |x2| |x3|)
                                            (QREFELT $ 71))
                                  (QREFELT $ 78) |x1|)
                                 (QREFELT $ 91))
                       (QREFELT $ 92))
             (SPADCALL (SPADCALL |x2| |t| (QREFELT $ 90))
                       (SPADCALL (QREFELT $ 75)
                                 (LIST
                                  (SPADCALL |op|
                                            (LIST |x1| (QREFELT $ 78) |x3|)
                                            (QREFELT $ 71))
                                  (QREFELT $ 78) |x2|)
                                 (QREFELT $ 91))
                       (QREFELT $ 92))
             (QREFELT $ 93))
            (SPADCALL (SPADCALL |x3| |t| (QREFELT $ 90))
                      (SPADCALL |x1| |x2| |x3| |d3|) (QREFELT $ 92))
            (QREFELT $ 93))))))) 

(DEFUN |FSPECF;whittakerM;4F;25| (|k| |m| |z| $)
  (SPADCALL (QREFELT $ 94) |k| |m| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eWhittakerM| (|k| |m| |z| $)
  (SPADCALL (QREFELT $ 94) (LIST |k| |m| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elWhittakerM| (|l| $)
  (|FSPECF;eWhittakerM| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eWhittakerMGrad_z| (|k| |m| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (QREFELT $ 81) (SPADCALL |k| |z| (QREFELT $ 99)) (QREFELT $ 100))
    (SPADCALL |k| |m| |z| (QREFELT $ 95)) (QREFELT $ 92))
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT $ 81) |k| (QREFELT $ 93)) |m| (QREFELT $ 93))
    (SPADCALL (SPADCALL |k| (|spadConstant| $ 63) (QREFELT $ 93)) |m| |z|
              (QREFELT $ 95))
    (QREFELT $ 92))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dWhittakerM| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 94)
   (CONS (|function| |FSPECF;eWhittakerMGrad_z|) $) $)) 

(DEFUN |FSPECF;whittakerW;4F;30| (|k| |m| |z| $)
  (SPADCALL (QREFELT $ 103) |k| |m| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eWhittakerW| (|k| |m| |z| $)
  (SPADCALL (QREFELT $ 103) (LIST |k| |m| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elWhittakerW| (|l| $)
  (|FSPECF;eWhittakerW| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eWhittakerWGrad_z| (|k| |m| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (QREFELT $ 81) (SPADCALL |k| |z| (QREFELT $ 99)) (QREFELT $ 100))
    (SPADCALL |k| |m| |z| (QREFELT $ 104)) (QREFELT $ 92))
   (SPADCALL (SPADCALL |k| (|spadConstant| $ 63) (QREFELT $ 93)) |m| |z|
             (QREFELT $ 104))
   (QREFELT $ 100))) 

(DEFUN |FSPECF;dWhittakerW| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 103)
   (CONS (|function| |FSPECF;eWhittakerWGrad_z|) $) $)) 

(DEFUN |FSPECF;angerJ;3F;35| (|v| |z| $)
  (SPADCALL (QREFELT $ 105) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eAngerJ| (|v| |z| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
    (SPADCALL
     (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 107)) (QREFELT $ 92))
               (QREFELT $ 108))
     (SPADCALL |v| (SPADCALL (QREFELT $ 107)) (QREFELT $ 92)) (QREFELT $ 99)))
   ('T (SPADCALL (QREFELT $ 105) (LIST |v| |z|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elAngerJ| (|l| $)
  (|FSPECF;eAngerJ| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eAngerJGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 106))
     (QREFELT $ 109))
    (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 106)) (QREFELT $ 92))
              |z| (QREFELT $ 99))
    (QREFELT $ 93))
   (SPADCALL
    (SPADCALL (SPADCALL |v| (SPADCALL (QREFELT $ 107)) (QREFELT $ 92))
              (QREFELT $ 108))
    (SPADCALL (SPADCALL (QREFELT $ 107)) |z| (QREFELT $ 92)) (QREFELT $ 99))
   (QREFELT $ 100))) 

(DEFUN |FSPECF;dAngerJ| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 105)
   (CONS (|function| |FSPECF;eAngerJGrad_z|) $) $)) 

(DEFUN |FSPECF;eeAngerJ| (|l| $) (SPADCALL (QREFELT $ 105) |l| (QREFELT $ 91))) 

(DEFUN |FSPECF;weberE;3F;41| (|v| |z| $)
  (SPADCALL (QREFELT $ 110) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eWeberE| (|v| |z| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
    (SPADCALL
     (SPADCALL 2
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (QREFELT $ 81) |v| (QREFELT $ 92))
                           (SPADCALL (QREFELT $ 107)) (QREFELT $ 92))
                 (QREFELT $ 108))
                2 (QREFELT $ 112))
               (QREFELT $ 86))
     (SPADCALL |v| (SPADCALL (QREFELT $ 107)) (QREFELT $ 92)) (QREFELT $ 99)))
   ('T (SPADCALL (QREFELT $ 110) (LIST |v| |z|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elWeberE| (|l| $)
  (|FSPECF;eWeberE| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eWeberEGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 111))
     (QREFELT $ 109))
    (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 111)) (QREFELT $ 92))
              |z| (QREFELT $ 99))
    (QREFELT $ 93))
   (SPADCALL
    (SPADCALL (|spadConstant| $ 63)
              (SPADCALL
               (SPADCALL |v| (SPADCALL (QREFELT $ 107)) (QREFELT $ 92))
               (QREFELT $ 115))
              (QREFELT $ 100))
    (SPADCALL (SPADCALL (QREFELT $ 107)) |z| (QREFELT $ 92)) (QREFELT $ 99))
   (QREFELT $ 100))) 

(DEFUN |FSPECF;dWeberE| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 110)
   (CONS (|function| |FSPECF;eWeberEGrad_z|) $) $)) 

(DEFUN |FSPECF;eeWeberE| (|l| $) (SPADCALL (QREFELT $ 110) |l| (QREFELT $ 91))) 

(DEFUN |FSPECF;struveH;3F;47| (|v| |z| $)
  (SPADCALL (QREFELT $ 116) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eStruveH| (|v| |z| $)
  (SPADCALL (QREFELT $ 116) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elStruveH| (|l| $)
  (|FSPECF;eStruveH| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eStruveHGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 117))
     (QREFELT $ 109))
    (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 117)) (QREFELT $ 92))
              |z| (QREFELT $ 99))
    (QREFELT $ 93))
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT $ 81) |z| (QREFELT $ 92)) |v| (QREFELT $ 118))
    (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 107)) (QREFELT $ 119))
              (SPADCALL (SPADCALL |v| (QREFELT $ 88) (QREFELT $ 93))
                        (QREFELT $ 37))
              (QREFELT $ 92))
    (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dStruveH| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 116)
   (CONS (|function| |FSPECF;eStruveHGrad_z|) $) $)) 

(DEFUN |FSPECF;struveL;3F;52| (|v| |z| $)
  (SPADCALL (QREFELT $ 120) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eStruveL| (|v| |z| $)
  (SPADCALL (QREFELT $ 120) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elStruveL| (|l| $)
  (|FSPECF;eStruveL| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eStruveLGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
              (QREFELT $ 121))
    (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 121)) (QREFELT $ 92))
              |z| (QREFELT $ 99))
    (QREFELT $ 93))
   (SPADCALL
    (SPADCALL (SPADCALL (QREFELT $ 81) |z| (QREFELT $ 92)) |v| (QREFELT $ 118))
    (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 107)) (QREFELT $ 119))
              (SPADCALL (SPADCALL |v| (QREFELT $ 88) (QREFELT $ 93))
                        (QREFELT $ 37))
              (QREFELT $ 92))
    (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dStruveL| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 120)
   (CONS (|function| |FSPECF;eStruveLGrad_z|) $) $)) 

(DEFUN |FSPECF;hankelH1;3F;57| (|v| |z| $)
  (SPADCALL (QREFELT $ 122) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eHankelH1| (|v| |z| $)
  (SPADCALL (QREFELT $ 122) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elHankelH1| (|l| $)
  (|FSPECF;eHankelH1| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eHankelH1Grad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
              (QREFELT $ 123))
    (QREFELT $ 109))
   (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 123)) (QREFELT $ 92))
             |z| (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dHankelH1| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 122)
   (CONS (|function| |FSPECF;eHankelH1Grad_z|) $) $)) 

(DEFUN |FSPECF;hankelH2;3F;62| (|v| |z| $)
  (SPADCALL (QREFELT $ 124) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eHankelH2| (|v| |z| $)
  (SPADCALL (QREFELT $ 124) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elHankelH2| (|l| $)
  (|FSPECF;eHankelH2| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eHankelH2Grad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
              (QREFELT $ 125))
    (QREFELT $ 109))
   (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 125)) (QREFELT $ 92))
             |z| (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dHankelH2| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 124)
   (CONS (|function| |FSPECF;eHankelH2Grad_z|) $) $)) 

(DEFUN |FSPECF;lommelS1;4F;67| (|m| |v| |z| $)
  (SPADCALL (QREFELT $ 126) |m| |v| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eLommelS1| (|m| |v| |z| $)
  (SPADCALL (QREFELT $ 126) (LIST |m| |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elLommelS1| (|l| $)
  (|FSPECF;eLommelS1| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eLommelS1Grad_z| (|m| |v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 127)) (QREFELT $ 92)) |z|
     (QREFELT $ 99))
    (QREFELT $ 109))
   (SPADCALL
    (SPADCALL (SPADCALL |m| |v| (QREFELT $ 93)) (|spadConstant| $ 63)
              (QREFELT $ 100))
    (SPADCALL (SPADCALL |m| (|spadConstant| $ 63) (QREFELT $ 100))
              (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 100)) |z|
              (QREFELT $ 127))
    (QREFELT $ 92))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dLommelS1| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 126)
   (CONS (|function| |FSPECF;eLommelS1Grad_z|) $) $)) 

(DEFUN |FSPECF;lommelS2;4F;72| (|mu| |nu| |z| $)
  (SPADCALL (QREFELT $ 128) |mu| |nu| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eLommelS2| (|mu| |nu| |z| $)
  (SPADCALL (QREFELT $ 128) (LIST |mu| |nu| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elLommelS2| (|l| $)
  (|FSPECF;eLommelS2| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eLommelS2Grad_z| (|m| |v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL
     (SPADCALL |v| (SPADCALL |m| |v| |z| (QREFELT $ 129)) (QREFELT $ 92)) |z|
     (QREFELT $ 99))
    (QREFELT $ 109))
   (SPADCALL
    (SPADCALL (SPADCALL |m| |v| (QREFELT $ 93)) (|spadConstant| $ 63)
              (QREFELT $ 100))
    (SPADCALL (SPADCALL |m| (|spadConstant| $ 63) (QREFELT $ 100))
              (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 100)) |z|
              (QREFELT $ 129))
    (QREFELT $ 92))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dLommelS2| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 128)
   (CONS (|function| |FSPECF;eLommelS2Grad_z|) $) $)) 

(DEFUN |FSPECF;kummerM;4F;77| (|mu| |nu| |z| $)
  (SPADCALL (QREFELT $ 130) |mu| |nu| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eKummerM| (|a| |b| |z| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 63))
   ('T (SPADCALL (QREFELT $ 130) (LIST |a| |b| |z|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elKummerM| (|l| $)
  (|FSPECF;eKummerM| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eKummerMGrad_z| (|a| |b| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (SPADCALL |z| |a| (QREFELT $ 93)) |b| (QREFELT $ 100))
              (SPADCALL |a| |b| |z| (QREFELT $ 131)) (QREFELT $ 92))
    (SPADCALL (SPADCALL |b| |a| (QREFELT $ 100))
              (SPADCALL (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 100))
                        |b| |z| (QREFELT $ 131))
              (QREFELT $ 92))
    (QREFELT $ 93))
   |z| (QREFELT $ 99))) 

(DEFUN |FSPECF;dKummerM| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 130)
   (CONS (|function| |FSPECF;eKummerMGrad_z|) $) $)) 

(DEFUN |FSPECF;kummerU;4F;82| (|a| |b| |z| $)
  (SPADCALL (QREFELT $ 132) |a| |b| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eKummerU| (|a| |b| |z| $)
  (SPADCALL (QREFELT $ 132) (LIST |a| |b| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elKummerU| (|l| $)
  (|FSPECF;eKummerU| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eKummerUGrad_z| (|a| |b| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL (SPADCALL |z| |a| (QREFELT $ 93)) |b| (QREFELT $ 100))
              (SPADCALL |a| |b| |z| (QREFELT $ 133)) (QREFELT $ 92))
    (SPADCALL (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 100)) |b| |z|
              (QREFELT $ 133))
    (QREFELT $ 100))
   |z| (QREFELT $ 99))) 

(DEFUN |FSPECF;dKummerU| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 132)
   (CONS (|function| |FSPECF;eKummerUGrad_z|) $) $)) 

(DEFUN |FSPECF;legendreP;4F;87| (|nu| |mu| |z| $)
  (SPADCALL (QREFELT $ 134) |nu| |mu| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eLegendreP| (|nu| |mu| |z| $)
  (SPADCALL (QREFELT $ 134) (LIST |nu| |mu| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elLegendreP| (|l| $)
  (|FSPECF;eLegendreP| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eLegendrePGrad_z| (|nu| |mu| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 100)) (|spadConstant| $ 63)
              (QREFELT $ 93))
    (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 93)) |mu| |z|
              (QREFELT $ 135))
    (QREFELT $ 92))
   (SPADCALL
    (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
              (QREFELT $ 92))
    (SPADCALL |nu| |mu| |z| (QREFELT $ 135)) (QREFELT $ 92))
   (QREFELT $ 100))) 

(DEFUN |FSPECF;dLegendreP| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 134)
   (CONS (|function| |FSPECF;eLegendrePGrad_z|) $) $)) 

(DEFUN |FSPECF;legendreQ;4F;92| (|nu| |mu| |z| $)
  (SPADCALL (QREFELT $ 136) |nu| |mu| |z| (QREFELT $ 53))) 

(DEFUN |FSPECF;eLegendreQ| (|nu| |mu| |z| $)
  (SPADCALL (QREFELT $ 136) (LIST |nu| |mu| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elLegendreQ| (|l| $)
  (|FSPECF;eLegendreQ| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eLegendreQGrad_z| (|nu| |mu| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (SPADCALL |nu| |mu| (QREFELT $ 100)) (|spadConstant| $ 63)
              (QREFELT $ 93))
    (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 93)) |mu| |z|
              (QREFELT $ 137))
    (QREFELT $ 92))
   (SPADCALL
    (SPADCALL (SPADCALL |nu| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
              (QREFELT $ 92))
    (SPADCALL |nu| |mu| |z| (QREFELT $ 137)) (QREFELT $ 92))
   (QREFELT $ 100))) 

(DEFUN |FSPECF;dLegendreQ| (|l| |t| $)
  (|FSPECF;grad3| |l| |t| (QREFELT $ 136)
   (CONS (|function| |FSPECF;eLegendreQGrad_z|) $) $)) 

(DEFUN |FSPECF;kelvinBei;3F;97| (|v| |z| $)
  (SPADCALL (QREFELT $ 138) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eKelvinBei| (|v| |z| $)
  (SPADCALL (QREFELT $ 138) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elKelvinBei| (|l| $)
  (|FSPECF;eKelvinBei| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eKelvinBeiGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (QREFELT $ 81)
              (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 119))
              (QREFELT $ 92))
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 139))
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 140))
     (QREFELT $ 100))
    (QREFELT $ 92))
   (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 139)) (QREFELT $ 92))
             |z| (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dKelvinBei| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 138)
   (CONS (|function| |FSPECF;eKelvinBeiGrad_z|) $) $)) 

(DEFUN |FSPECF;kelvinBer;3F;102| (|v| |z| $)
  (SPADCALL (QREFELT $ 141) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eKelvinBer| (|v| |z| $)
  (SPADCALL (QREFELT $ 141) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elKelvinBer| (|l| $)
  (|FSPECF;eKelvinBer| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eKelvinBerGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (QREFELT $ 81)
              (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 119))
              (QREFELT $ 92))
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 140))
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 139))
     (QREFELT $ 93))
    (QREFELT $ 92))
   (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 140)) (QREFELT $ 92))
             |z| (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dKelvinBer| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 141)
   (CONS (|function| |FSPECF;eKelvinBerGrad_z|) $) $)) 

(DEFUN |FSPECF;kelvinKei;3F;107| (|v| |z| $)
  (SPADCALL (QREFELT $ 142) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eKelvinKei| (|v| |z| $)
  (SPADCALL (QREFELT $ 142) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elKelvinKei| (|l| $)
  (|FSPECF;eKelvinKei| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eKelvinKeiGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (QREFELT $ 81)
              (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 119))
              (QREFELT $ 92))
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 143))
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 144))
     (QREFELT $ 100))
    (QREFELT $ 92))
   (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 143)) (QREFELT $ 92))
             |z| (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dKelvinKei| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 142)
   (CONS (|function| |FSPECF;eKelvinKeiGrad_z|) $) $)) 

(DEFUN |FSPECF;kelvinKer;3F;112| (|v| |z| $)
  (SPADCALL (QREFELT $ 145) |v| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eKelvinKer| (|v| |z| $)
  (SPADCALL (QREFELT $ 145) (LIST |v| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elKelvinKer| (|l| $)
  (|FSPECF;eKelvinKer| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eKelvinKerGrad_z| (|v| |z| $)
  (SPADCALL
   (SPADCALL
    (SPADCALL (QREFELT $ 81)
              (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 119))
              (QREFELT $ 92))
    (SPADCALL
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 144))
     (SPADCALL (SPADCALL |v| (|spadConstant| $ 63) (QREFELT $ 93)) |z|
               (QREFELT $ 143))
     (QREFELT $ 93))
    (QREFELT $ 92))
   (SPADCALL (SPADCALL |v| (SPADCALL |v| |z| (QREFELT $ 144)) (QREFELT $ 92))
             |z| (QREFELT $ 99))
   (QREFELT $ 93))) 

(DEFUN |FSPECF;dKelvinKer| (|l| |t| $)
  (|FSPECF;grad2| |l| |t| (QREFELT $ 145)
   (CONS (|function| |FSPECF;eKelvinKerGrad_z|) $) $)) 

(DEFUN |FSPECF;ellipticK;2F;117| (|m| $)
  (SPADCALL (QREFELT $ 146) |m| (QREFELT $ 35))) 

(DEFUN |FSPECF;eEllipticK| (|m| $)
  (SPADCALL (QREFELT $ 146) (LIST |m|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elEllipticK| (|l| $)
  (|FSPECF;eEllipticK| (SPADCALL |l| 1 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;dEllipticK| (|m| $)
  (SPADCALL
   (SPADCALL (QREFELT $ 81)
             (SPADCALL (SPADCALL |m| (QREFELT $ 148))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
                        (SPADCALL |m| (QREFELT $ 147)) (QREFELT $ 92))
                       (QREFELT $ 100))
             (QREFELT $ 92))
   (SPADCALL |m| (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
             (QREFELT $ 92))
   (QREFELT $ 99))) 

(DEFUN |FSPECF;ellipticE;2F;121| (|m| $)
  (SPADCALL (QREFELT $ 153) |m| (QREFELT $ 35))) 

(DEFUN |FSPECF;eEllipticE| (|m| $)
  (SPADCALL (QREFELT $ 153) (LIST |m|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elEllipticE| (|l| $)
  (|FSPECF;eEllipticE| (SPADCALL |l| 1 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;dEllipticE| (|m| $)
  (SPADCALL
   (SPADCALL (QREFELT $ 81)
             (SPADCALL (SPADCALL |m| (QREFELT $ 148))
                       (SPADCALL |m| (QREFELT $ 147)) (QREFELT $ 100))
             (QREFELT $ 92))
   |m| (QREFELT $ 99))) 

(DEFUN |FSPECF;ellipticE;3F;125| (|z| |m| $)
  (SPADCALL (QREFELT $ 154) |z| |m| (QREFELT $ 38))) 

(DEFUN |FSPECF;eEllipticE2| (|z| |m| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 59))
   ((SPADCALL |z| (|spadConstant| $ 63) (QREFELT $ 61))
    (|FSPECF;eEllipticE| |m| $))
   ('T (SPADCALL (QREFELT $ 154) (LIST |z| |m|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elEllipticE2| (|l| $)
  (|FSPECF;eEllipticE2| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eEllipticE2Grad_z| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticE2Grad_z|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL (|spadConstant| $ 63)
                   (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 156))
                             (QREFELT $ 92))
                   (QREFELT $ 100))
         (QREFELT $ 119))
        (SPADCALL
         (SPADCALL (|spadConstant| $ 63) (SPADCALL |z| 2 (QREFELT $ 156))
                   (QREFELT $ 100))
         (QREFELT $ 119))
        (QREFELT $ 99))))))) 

(DEFUN |FSPECF;eEllipticE2Grad_m| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticE2Grad_m|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (QREFELT $ 81)
                  (SPADCALL (SPADCALL |z| |m| (QREFELT $ 155))
                            (SPADCALL |z| |m| (QREFELT $ 157)) (QREFELT $ 100))
                  (QREFELT $ 92))
        |m| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;inEllipticE2| (|li| $)
  (SPADCALL (CONS (SPADCALL '|ellipticE| (QREFELT $ 161)) |li|)
            (QREFELT $ 162))) 

(DEFUN |FSPECF;ellipticF;3F;131| (|z| |m| $)
  (SPADCALL (QREFELT $ 165) |z| |m| (QREFELT $ 38))) 

(DEFUN |FSPECF;eEllipticF| (|z| |m| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 59))
   ((SPADCALL |z| (|spadConstant| $ 63) (QREFELT $ 61))
    (SPADCALL |m| (QREFELT $ 147)))
   ('T (SPADCALL (QREFELT $ 165) (LIST |z| |m|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elEllipticF| (|l| $)
  (|FSPECF;eEllipticF| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eEllipticFGrad_z| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticFGrad_z|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL (|spadConstant| $ 63)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 156))
                                       (QREFELT $ 92))
                             (QREFELT $ 100))
                   (QREFELT $ 119))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |z| 2 (QREFELT $ 156)) (QREFELT $ 100))
                   (QREFELT $ 119))
                  (QREFELT $ 92))
                 (QREFELT $ 99))))))) 

(DEFUN |FSPECF;eEllipticFGrad_m| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticFGrad_m|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (QREFELT $ 81)
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT $ 155))
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 63) |m|
                                         (QREFELT $ 100))
                               (SPADCALL |z| |m| (QREFELT $ 157))
                               (QREFELT $ 92))
                              (QREFELT $ 100))
                    |m| (QREFELT $ 99))
                   (SPADCALL
                    (SPADCALL |z|
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 63)
                                         (SPADCALL |z| 2 (QREFELT $ 156))
                                         (QREFELT $ 100))
                               (QREFELT $ 119))
                              (QREFELT $ 92))
                    (SPADCALL
                     (SPADCALL (|spadConstant| $ 63)
                               (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 156))
                                         (QREFELT $ 92))
                               (QREFELT $ 100))
                     (QREFELT $ 119))
                    (QREFELT $ 99))
                   (QREFELT $ 100))
                  (QREFELT $ 92))
        (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
        (QREFELT $ 99))))))) 

(DEFUN |FSPECF;ellipticPi;4F;136| (|z| |n| |m| $)
  (SPADCALL (QREFELT $ 166) |z| |n| |m| (QREFELT $ 53))) 

(DEFUN |FSPECF;eEllipticPi| (|z| |n| |m| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 59))
   ('T (SPADCALL (QREFELT $ 166) (LIST |z| |n| |m|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elEllipticPi| (|l| $)
  (|FSPECF;eEllipticPi| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eEllipticPiGrad_z| (|l| $)
  (PROG (|m| |n| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticPiGrad_z|))
      (LETT |n| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (LETT |m| (SPADCALL |l| 3 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL (|spadConstant| $ 63)
                 (SPADCALL
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |n| (SPADCALL |z| 2 (QREFELT $ 156))
                                       (QREFELT $ 92))
                             (QREFELT $ 100))
                   (SPADCALL
                    (SPADCALL (|spadConstant| $ 63)
                              (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 156))
                                        (QREFELT $ 92))
                              (QREFELT $ 100))
                    (QREFELT $ 119))
                   (QREFELT $ 92))
                  (SPADCALL
                   (SPADCALL (|spadConstant| $ 63)
                             (SPADCALL |z| 2 (QREFELT $ 156)) (QREFELT $ 100))
                   (QREFELT $ 119))
                  (QREFELT $ 92))
                 (QREFELT $ 99))))))) 

(DEFUN |FSPECF;eEllipticPiGrad_n| (|l| $)
  (PROG (|t4| |t3| |t2| |t1| |m| |n| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticPiGrad_n|))
      (LETT |n| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (LETT |m| (SPADCALL |l| 3 (QREFELT $ 89)) . #1#)
      (LETT |t1|
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |n| 2 (QREFELT $ 156)) |m| (QREFELT $ 100))
               (SPADCALL |z| |n| |m| (QREFELT $ 167)) (QREFELT $ 92))
              (SPADCALL
               (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
                         (SPADCALL |n| |m| (QREFELT $ 100)) (QREFELT $ 92))
               |n| (QREFELT $ 92))
              (QREFELT $ 99))
             (QREFELT $ 109))
            . #1#)
      (LETT |t2|
            (SPADCALL (SPADCALL |z| |m| (QREFELT $ 157))
                      (SPADCALL
                       (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100)) |n|
                       (QREFELT $ 92))
                      (QREFELT $ 99))
            . #1#)
      (LETT |t3|
            (SPADCALL
             (SPADCALL (SPADCALL |z| |m| (QREFELT $ 155))
                       (SPADCALL
                        (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
                        (SPADCALL |n| |m| (QREFELT $ 100)) (QREFELT $ 92))
                       (QREFELT $ 99))
             (QREFELT $ 109))
            . #1#)
      (LETT |t4|
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL |n| |z| (QREFELT $ 92))
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 63)
                                   (SPADCALL |m|
                                             (SPADCALL |z| 2 (QREFELT $ 156))
                                             (QREFELT $ 92))
                                   (QREFELT $ 100))
                         (QREFELT $ 119))
                        (QREFELT $ 92))
              (SPADCALL
               (SPADCALL (|spadConstant| $ 63) (SPADCALL |z| 2 (QREFELT $ 156))
                         (QREFELT $ 100))
               (QREFELT $ 119))
              (QREFELT $ 92))
             (SPADCALL
              (SPADCALL
               (SPADCALL (|spadConstant| $ 63)
                         (SPADCALL |n| (SPADCALL |z| 2 (QREFELT $ 156))
                                   (QREFELT $ 92))
                         (QREFELT $ 100))
               (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
               (QREFELT $ 92))
              (SPADCALL |n| |m| (QREFELT $ 100)) (QREFELT $ 92))
             (QREFELT $ 99))
            . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 81)
                 (SPADCALL
                  (SPADCALL (SPADCALL |t1| |t2| (QREFELT $ 93)) |t3|
                            (QREFELT $ 93))
                  |t4| (QREFELT $ 93))
                 (QREFELT $ 92))))))) 

(DEFUN |FSPECF;eEllipticPiGrad_m| (|l| $)
  (PROG (|t2| |t1| |m| |n| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eEllipticPiGrad_m|))
      (LETT |n| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (LETT |m| (SPADCALL |l| 3 (QREFELT $ 89)) . #1#)
      (LETT |t1|
            (SPADCALL
             (SPADCALL (SPADCALL |m| |z| (QREFELT $ 92))
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 63)
                                  (SPADCALL |z| 2 (QREFELT $ 156))
                                  (QREFELT $ 100))
                        (QREFELT $ 119))
                       (QREFELT $ 92))
             (SPADCALL
              (SPADCALL (|spadConstant| $ 63)
                        (SPADCALL |m| (SPADCALL |z| 2 (QREFELT $ 156))
                                  (QREFELT $ 92))
                        (QREFELT $ 100))
              (QREFELT $ 119))
             (QREFELT $ 99))
            . #1#)
      (LETT |t2|
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 155)) (QREFELT $ 109))
              |t1| (QREFELT $ 93))
             (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
             (QREFELT $ 99))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (QREFELT $ 81)
                  (SPADCALL (SPADCALL |z| |n| |m| (QREFELT $ 167)) |t2|
                            (QREFELT $ 93))
                  (QREFELT $ 92))
        (SPADCALL |n| |m| (QREFELT $ 100)) (QREFELT $ 99))))))) 

(DEFUN |FSPECF;jacobiSn;3F;142| (|z| |m| $)
  (SPADCALL (QREFELT $ 168) |z| |m| (QREFELT $ 38))) 

(DEFUN |FSPECF;eJacobiSn| (|z| |m| $)
  (PROG (#1=#:G503 |args|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
         (|spadConstant| $ 59))
        ('T
         (SEQ
          (COND
           ((SPADCALL |z| (QREFELT $ 165) (QREFELT $ 170))
            (SEQ
             (LETT |args|
                   (SPADCALL (SPADCALL |z| (QREFELT $ 172)) (QREFELT $ 174))
                   . #2=(|FSPECF;eJacobiSn|))
             (EXIT
              (COND
               ((SPADCALL |m| (SPADCALL |args| 2 (QREFELT $ 89))
                          (QREFELT $ 61))
                (PROGN
                 (LETT #1# (SPADCALL |args| 1 (QREFELT $ 89)) . #2#)
                 (GO #1#))))))))
          (EXIT (SPADCALL (QREFELT $ 168) (LIST |z| |m|) (QREFELT $ 91)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;elJacobiSn| (|l| $)
  (|FSPECF;eJacobiSn| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;jacobiGradHelper| (|z| |m| $)
  (SPADCALL
   (SPADCALL |z|
             (SPADCALL
              (SPADCALL (SPADCALL |z| |m| (QREFELT $ 169)) |m| (QREFELT $ 155))
              (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
              (QREFELT $ 99))
             (QREFELT $ 100))
   |m| (QREFELT $ 99))) 

(DEFUN |FSPECF;eJacobiSnGrad_z| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiSnGrad_z|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |z| |m| (QREFELT $ 175))
                 (SPADCALL |z| |m| (QREFELT $ 176)) (QREFELT $ 92))))))) 

(DEFUN |FSPECF;eJacobiSnGrad_m| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiSnGrad_m|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 81)
                 (SPADCALL
                  (SPADCALL (|FSPECF;eJacobiSnGrad_z| |l| $)
                            (|FSPECF;jacobiGradHelper| |z| |m| $)
                            (QREFELT $ 92))
                  (SPADCALL
                   (SPADCALL (SPADCALL |z| |m| (QREFELT $ 169))
                             (SPADCALL (SPADCALL |z| |m| (QREFELT $ 175)) 2
                                       (QREFELT $ 112))
                             (QREFELT $ 92))
                   (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
                   (QREFELT $ 99))
                  (QREFELT $ 93))
                 (QREFELT $ 92))))))) 

(DEFUN |FSPECF;jacobiCn;3F;148| (|z| |m| $)
  (SPADCALL (QREFELT $ 177) |z| |m| (QREFELT $ 38))) 

(DEFUN |FSPECF;eJacobiCn| (|z| |m| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 63))
   ('T (SPADCALL (QREFELT $ 177) (LIST |z| |m|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elJacobiCn| (|l| $)
  (|FSPECF;eJacobiCn| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eJacobiCnGrad_z| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiCnGrad_z|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (SPADCALL |z| |m| (QREFELT $ 169))
                  (SPADCALL |z| |m| (QREFELT $ 176)) (QREFELT $ 92))
        (QREFELT $ 109))))))) 

(DEFUN |FSPECF;eJacobiCnGrad_m| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiCnGrad_m|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 81)
                 (SPADCALL
                  (SPADCALL (|FSPECF;eJacobiCnGrad_z| |l| $)
                            (|FSPECF;jacobiGradHelper| |z| |m| $)
                            (QREFELT $ 92))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT $ 169)) 2
                              (QREFELT $ 112))
                    (SPADCALL |z| |m| (QREFELT $ 175)) (QREFELT $ 92))
                   (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
                   (QREFELT $ 99))
                  (QREFELT $ 100))
                 (QREFELT $ 92))))))) 

(DEFUN |FSPECF;jacobiDn;3F;153| (|z| |m| $)
  (SPADCALL (QREFELT $ 178) |z| |m| (QREFELT $ 38))) 

(DEFUN |FSPECF;eJacobiDn| (|z| |m| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 63))
   ('T (SPADCALL (QREFELT $ 178) (LIST |z| |m|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elJacobiDn| (|l| $)
  (|FSPECF;eJacobiDn| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eJacobiDnGrad_z| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiDnGrad_z|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 169)) (QREFELT $ 92))
         (SPADCALL |z| |m| (QREFELT $ 175)) (QREFELT $ 92))
        (QREFELT $ 109))))))) 

(DEFUN |FSPECF;eJacobiDnGrad_m| (|l| $)
  (PROG (|m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiDnGrad_m|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (EXIT
       (SPADCALL (QREFELT $ 81)
                 (SPADCALL
                  (SPADCALL (|FSPECF;eJacobiDnGrad_z| |l| $)
                            (|FSPECF;jacobiGradHelper| |z| |m| $)
                            (QREFELT $ 92))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT $ 169)) 2
                              (QREFELT $ 112))
                    (SPADCALL |z| |m| (QREFELT $ 176)) (QREFELT $ 92))
                   (SPADCALL (|spadConstant| $ 63) |m| (QREFELT $ 100))
                   (QREFELT $ 99))
                  (QREFELT $ 100))
                 (QREFELT $ 92))))))) 

(DEFUN |FSPECF;jacobiZeta;3F;158| (|z| |m| $)
  (SPADCALL (QREFELT $ 179) |z| |m| (QREFELT $ 38))) 

(DEFUN |FSPECF;eJacobiZeta| (|z| |m| $)
  (COND
   ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 59))
   ('T (SPADCALL (QREFELT $ 179) (LIST |z| |m|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elJacobiZeta| (|l| $)
  (|FSPECF;eJacobiZeta| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;eJacobiZetaGrad_z| (|l| $)
  (PROG (|dn| |m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiZetaGrad_z|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 176)) . #1#)
      (EXIT
       (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 92))
                 (SPADCALL (SPADCALL |m| (QREFELT $ 148))
                           (SPADCALL |m| (QREFELT $ 147)) (QREFELT $ 99))
                 (QREFELT $ 100))))))) 

(DEFUN |FSPECF;eJacobiZetaGrad_m| (|l| $)
  (PROG (|res4| |res3| |res2| |res1| |dn| |er| |ee| |ek| |m| |z|)
    (RETURN
     (SEQ
      (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89))
            . #1=(|FSPECF;eJacobiZetaGrad_m|))
      (LETT |m| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
      (LETT |ek| (SPADCALL |m| (QREFELT $ 147)) . #1#)
      (LETT |ee| (SPADCALL |m| (QREFELT $ 148)) . #1#)
      (LETT |er| (SPADCALL |ee| |ek| (QREFELT $ 99)) . #1#)
      (LETT |dn| (SPADCALL |z| |m| (QREFELT $ 176)) . #1#)
      (LETT |res1|
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL |dn| |dn| (QREFELT $ 92)) |m| (QREFELT $ 93))
              (|spadConstant| $ 63) (QREFELT $ 100))
             (SPADCALL |z| |m| (QREFELT $ 180)) (QREFELT $ 92))
            . #1#)
      (LETT |res2|
            (SPADCALL |res1|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |m| (|spadConstant| $ 63) (QREFELT $ 100))
                         |z| (QREFELT $ 92))
                        |dn| (QREFELT $ 92))
                       |dn| (QREFELT $ 92))
                      (QREFELT $ 93))
            . #1#)
      (LETT |res3|
            (SPADCALL |res2|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL |m| (SPADCALL |z| |m| (QREFELT $ 175))
                                  (QREFELT $ 92))
                        (SPADCALL |z| |m| (QREFELT $ 176)) (QREFELT $ 92))
                       (SPADCALL |z| |m| (QREFELT $ 169)) (QREFELT $ 92))
                      (QREFELT $ 100))
            . #1#)
      (LETT |res4|
            (SPADCALL |res3|
                      (SPADCALL
                       (SPADCALL |z|
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| $ 63) |m|
                                            (QREFELT $ 100))
                                  (SPADCALL |dn| |dn| (QREFELT $ 92))
                                  (QREFELT $ 93))
                                 (QREFELT $ 92))
                       |er| (QREFELT $ 92))
                      (QREFELT $ 93))
            . #1#)
      (EXIT
       (SPADCALL
        (SPADCALL (QREFELT $ 81)
                  (SPADCALL |res4|
                            (SPADCALL (SPADCALL |z| |er| (QREFELT $ 92)) |er|
                                      (QREFELT $ 92))
                            (QREFELT $ 100))
                  (QREFELT $ 92))
        (SPADCALL (SPADCALL |m| |m| (QREFELT $ 92)) |m| (QREFELT $ 100))
        (QREFELT $ 99))))))) 

(DEFUN |FSPECF;jacobiTheta;3F;163| (|q| |z| $)
  (SPADCALL (QREFELT $ 181) |q| |z| (QREFELT $ 38))) 

(DEFUN |FSPECF;eJacobiTheta| (|q| |z| $)
  (SPADCALL (QREFELT $ 181) (LIST |q| |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elJacobiTheta| (|l| $)
  (|FSPECF;eJacobiTheta| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;lerchPhi;4F;166| (|z| |s| |a| $)
  (SPADCALL (QREFELT $ 183) |z| |s| |a| (QREFELT $ 53))) 

(DEFUN |FSPECF;eLerchPhi| (|z| |s| |a| $)
  (COND
   ((SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 61))
    (SPADCALL (SPADCALL |s| |z| (QREFELT $ 52)) |z| (QREFELT $ 99)))
   ('T (SPADCALL (QREFELT $ 183) (LIST |z| |s| |a|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;elLerchPhi| (|l| $)
  (|FSPECF;eLerchPhi| (SPADCALL |l| 1 (QREFELT $ 89))
   (SPADCALL |l| 2 (QREFELT $ 89)) (SPADCALL |l| 3 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;dLerchPhi| (|l| |t| $)
  (PROG (|da| |dz| |a| |s| |z|)
    (RETURN
     (SEQ (LETT |z| (SPADCALL |l| 1 (QREFELT $ 89)) . #1=(|FSPECF;dLerchPhi|))
          (LETT |s| (SPADCALL |l| 2 (QREFELT $ 89)) . #1#)
          (LETT |a| (SPADCALL |l| 3 (QREFELT $ 89)) . #1#)
          (LETT |dz|
                (SPADCALL
                 (SPADCALL (SPADCALL |z| |t| (QREFELT $ 90))
                           (SPADCALL
                            (SPADCALL |z|
                                      (SPADCALL |s| (|spadConstant| $ 63)
                                                (QREFELT $ 100))
                                      |a| (QREFELT $ 184))
                            (SPADCALL |a|
                                      (SPADCALL |z| |s| |a| (QREFELT $ 184))
                                      (QREFELT $ 92))
                            (QREFELT $ 100))
                           (QREFELT $ 92))
                 |z| (QREFELT $ 99))
                . #1#)
          (LETT |da|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |a| |t| (QREFELT $ 90)) |s|
                            (QREFELT $ 92))
                  (SPADCALL |z|
                            (SPADCALL |s| (|spadConstant| $ 63) (QREFELT $ 93))
                            |a| (QREFELT $ 184))
                  (QREFELT $ 92))
                 (QREFELT $ 109))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL (SPADCALL |s| |t| (QREFELT $ 90))
                       (SPADCALL (QREFELT $ 75)
                                 (LIST
                                  (SPADCALL (QREFELT $ 183)
                                            (LIST |z| (QREFELT $ 78) |a|)
                                            (QREFELT $ 71))
                                  (QREFELT $ 78) |s|)
                                 (QREFELT $ 91))
                       (QREFELT $ 92))
             |dz| (QREFELT $ 93))
            |da| (QREFELT $ 93))))))) 

(DEFUN |FSPECF;riemannZeta;2F;170| (|z| $)
  (SPADCALL (QREFELT $ 185) |z| (QREFELT $ 35))) 

(DEFUN |FSPECF;eRiemannZeta| (|z| $)
  (SPADCALL (QREFELT $ 185) (LIST |z|) (QREFELT $ 91))) 

(DEFUN |FSPECF;elRiemannZeta| (|l| $)
  (|FSPECF;eRiemannZeta| (SPADCALL |l| 1 (QREFELT $ 89)) $)) 

(DEFUN |FSPECF;belong?;BoB;173| (|op| $)
  (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 187))) 

(DEFUN |FSPECF;operator;2Bo;174| (|op| $)
  (COND ((SPADCALL |op| '|abs| (QREFELT $ 189)) (QREFELT $ 13))
        ((SPADCALL |op| '|Gamma| (QREFELT $ 189)) (QREFELT $ 14))
        ((SPADCALL |op| '|Gamma2| (QREFELT $ 189)) (QREFELT $ 15))
        ((SPADCALL |op| '|Beta| (QREFELT $ 189)) (QREFELT $ 16))
        ((SPADCALL |op| '|digamma| (QREFELT $ 189)) (QREFELT $ 17))
        ((SPADCALL |op| '|polygamma| (QREFELT $ 189)) (QREFELT $ 18))
        ((SPADCALL |op| '|besselJ| (QREFELT $ 189)) (QREFELT $ 19))
        ((SPADCALL |op| '|besselY| (QREFELT $ 189)) (QREFELT $ 20))
        ((SPADCALL |op| '|besselI| (QREFELT $ 189)) (QREFELT $ 21))
        ((SPADCALL |op| '|besselK| (QREFELT $ 189)) (QREFELT $ 22))
        ((SPADCALL |op| '|airyAi| (QREFELT $ 189)) (QREFELT $ 23))
        ((SPADCALL |op| '|airyAiPrime| (QREFELT $ 189)) (QREFELT $ 24))
        ((SPADCALL |op| '|airyBi| (QREFELT $ 189)) (QREFELT $ 25))
        ((SPADCALL |op| '|airyBiPrime| (QREFELT $ 189)) (QREFELT $ 26))
        ((SPADCALL |op| '|lambertW| (QREFELT $ 189)) (QREFELT $ 27))
        ((SPADCALL |op| '|polylog| (QREFELT $ 189)) (QREFELT $ 28))
        ((SPADCALL |op| '|weierstrassP| (QREFELT $ 189)) (QREFELT $ 29))
        ((SPADCALL |op| '|weierstrassPPrime| (QREFELT $ 189)) (QREFELT $ 30))
        ((SPADCALL |op| '|weierstrassSigma| (QREFELT $ 189)) (QREFELT $ 31))
        ((SPADCALL |op| '|weierstrassZeta| (QREFELT $ 189)) (QREFELT $ 32))
        ((SPADCALL |op| '|hypergeometricF| (QREFELT $ 189)) (QREFELT $ 33))
        ((SPADCALL |op| '|meijerG| (QREFELT $ 189)) (QREFELT $ 34))
        ((SPADCALL |op| '|whittakerM| (QREFELT $ 189)) (QREFELT $ 94))
        ((SPADCALL |op| '|whittakerW| (QREFELT $ 189)) (QREFELT $ 103))
        ((SPADCALL |op| '|angerJ| (QREFELT $ 189)) (QREFELT $ 105))
        ((SPADCALL |op| '|weberE| (QREFELT $ 189)) (QREFELT $ 110))
        ((SPADCALL |op| '|struveH| (QREFELT $ 189)) (QREFELT $ 116))
        ((SPADCALL |op| '|struveL| (QREFELT $ 189)) (QREFELT $ 120))
        ((SPADCALL |op| '|hankelH1| (QREFELT $ 189)) (QREFELT $ 122))
        ((SPADCALL |op| '|hankelH2| (QREFELT $ 189)) (QREFELT $ 124))
        ((SPADCALL |op| '|lommelS1| (QREFELT $ 189)) (QREFELT $ 126))
        ((SPADCALL |op| '|lommelS2| (QREFELT $ 189)) (QREFELT $ 128))
        ((SPADCALL |op| '|kummerM| (QREFELT $ 189)) (QREFELT $ 130))
        ((SPADCALL |op| '|kummerU| (QREFELT $ 189)) (QREFELT $ 132))
        ((SPADCALL |op| '|legendreP| (QREFELT $ 189)) (QREFELT $ 134))
        ((SPADCALL |op| '|legendreQ| (QREFELT $ 189)) (QREFELT $ 136))
        ((SPADCALL |op| '|kelvinBei| (QREFELT $ 189)) (QREFELT $ 138))
        ((SPADCALL |op| '|kelvinBer| (QREFELT $ 189)) (QREFELT $ 141))
        ((SPADCALL |op| '|kelvinKei| (QREFELT $ 189)) (QREFELT $ 142))
        ((SPADCALL |op| '|kelvinKer| (QREFELT $ 189)) (QREFELT $ 145))
        ((SPADCALL |op| '|ellipticK| (QREFELT $ 189)) (QREFELT $ 146))
        ((SPADCALL |op| '|ellipticE| (QREFELT $ 189)) (QREFELT $ 153))
        ((SPADCALL |op| '|ellipticE2| (QREFELT $ 189)) (QREFELT $ 154))
        ((SPADCALL |op| '|ellipticF| (QREFELT $ 189)) (QREFELT $ 165))
        ((SPADCALL |op| '|ellipticPi| (QREFELT $ 189)) (QREFELT $ 166))
        ((SPADCALL |op| '|jacobiSn| (QREFELT $ 189)) (QREFELT $ 168))
        ((SPADCALL |op| '|jacobiCn| (QREFELT $ 189)) (QREFELT $ 177))
        ((SPADCALL |op| '|jacobiDn| (QREFELT $ 189)) (QREFELT $ 178))
        ((SPADCALL |op| '|jacobiTheta| (QREFELT $ 189)) (QREFELT $ 181))
        ((SPADCALL |op| '|lerchPhi| (QREFELT $ 189)) (QREFELT $ 183))
        ((SPADCALL |op| '|riemannZeta| (QREFELT $ 189)) (QREFELT $ 185))
        ('T (|error| "Not a special operator")))) 

(DEFUN |FSPECF;iGamma| (|x| $)
  (COND ((SPADCALL |x| (|spadConstant| $ 63) (QREFELT $ 61)) |x|)
        ('T (SPADCALL (QREFELT $ 14) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iabs| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 192)) (|spadConstant| $ 59))
        ((SPADCALL |x| (QREFELT $ 13) (QREFELT $ 170)) |x|)
        ((SPADCALL |x| (|spadConstant| $ 59) (QREFELT $ 193))
         (SPADCALL (QREFELT $ 13) (SPADCALL |x| (QREFELT $ 109))
                   (QREFELT $ 191)))
        ('T (SPADCALL (QREFELT $ 13) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iBeta| (|x| |y| $)
  (SPADCALL (QREFELT $ 16) (LIST |x| |y|) (QREFELT $ 91))) 

(DEFUN |FSPECF;idigamma| (|x| $) (SPADCALL (QREFELT $ 17) |x| (QREFELT $ 191))) 

(DEFUN |FSPECF;iiipolygamma| (|n| |x| $)
  (SPADCALL (QREFELT $ 18) (LIST |n| |x|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iiiBesselJ| (|x| |y| $)
  (SPADCALL (QREFELT $ 19) (LIST |x| |y|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iiiBesselY| (|x| |y| $)
  (SPADCALL (QREFELT $ 20) (LIST |x| |y|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iiiBesselI| (|x| |y| $)
  (SPADCALL (QREFELT $ 21) (LIST |x| |y|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iiiBesselK| (|x| |y| $)
  (SPADCALL (QREFELT $ 22) (LIST |x| |y|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iAiryAi;2F;184| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 192))
    (SPADCALL (|spadConstant| $ 63)
              (SPADCALL
               (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 87)
                         (QREFELT $ 118))
               (SPADCALL (QREFELT $ 87) (QREFELT $ 37)) (QREFELT $ 92))
              (QREFELT $ 99)))
   ('T (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iAiryAiPrime;2F;185| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 192))
    (SPADCALL
     (SPADCALL (|spadConstant| $ 63)
               (SPADCALL
                (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 82)
                          (QREFELT $ 118))
                (SPADCALL (QREFELT $ 82) (QREFELT $ 37)) (QREFELT $ 92))
               (QREFELT $ 99))
     (QREFELT $ 109)))
   ('T (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iAiryBi;2F;186| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 192))
    (SPADCALL (|spadConstant| $ 63)
              (SPADCALL
               (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 84)
                         (QREFELT $ 118))
               (SPADCALL (QREFELT $ 87) (QREFELT $ 37)) (QREFELT $ 92))
              (QREFELT $ 99)))
   ('T (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iAiryBiPrime;2F;187| (|x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 192))
    (SPADCALL
     (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 84) (QREFELT $ 118))
     (SPADCALL (QREFELT $ 82) (QREFELT $ 37)) (QREFELT $ 99)))
   ('T (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iAiryAi;2F;188| (|x| $)
  (SPADCALL (QREFELT $ 23) |x| (QREFELT $ 191))) 

(DEFUN |FSPECF;iAiryAiPrime;2F;189| (|x| $)
  (SPADCALL (QREFELT $ 24) |x| (QREFELT $ 191))) 

(DEFUN |FSPECF;iAiryBi;2F;190| (|x| $)
  (SPADCALL (QREFELT $ 25) |x| (QREFELT $ 191))) 

(DEFUN |FSPECF;iAiryBiPrime;2F;191| (|x| $)
  (SPADCALL (QREFELT $ 26) |x| (QREFELT $ 191))) 

(DEFUN |FSPECF;iLambertW| (|x| $)
  (COND ((SPADCALL |x| (QREFELT $ 192)) (|spadConstant| $ 59))
        ('T (SPADCALL (QREFELT $ 27) |x| (QREFELT $ 191))))) 

(DEFUN |FSPECF;iiPolylog;3F;193| (|s| |x| $)
  (COND
   ((SPADCALL |s| (|spadConstant| $ 63) (QREFELT $ 61))
    (SPADCALL
     (SPADCALL (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 100))
               (QREFELT $ 198))
     (QREFELT $ 109)))
   ((SPADCALL |s| (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 61))
    (SPADCALL (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 100))
              (QREFELT $ 199)))
   ('T (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;iiPolylog;3F;194| (|s| |x| $)
  (COND
   ((SPADCALL |s| (|spadConstant| $ 63) (QREFELT $ 61))
    (SPADCALL
     (SPADCALL (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 100))
               (QREFELT $ 198))
     (QREFELT $ 109)))
   ('T (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;iiPolylog;3F;195| (|s| |x| $)
  (SPADCALL (QREFELT $ 28) (LIST |s| |x|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iPolylog| (|l| $)
  (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 200))) 

(DEFUN |FSPECF;iWeierstrassP| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 29) (LIST |g2| |g3| |x|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iWeierstrassPPrime| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 30) (LIST |g2| |g3| |x|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iWeierstrassSigma| (|g2| |g3| |x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 59) (QREFELT $ 61)) (|spadConstant| $ 59))
   ('T (SPADCALL (QREFELT $ 31) (LIST |g2| |g3| |x|) (QREFELT $ 91))))) 

(DEFUN |FSPECF;iWeierstrassZeta| (|g2| |g3| |x| $)
  (SPADCALL (QREFELT $ 32) (LIST |g2| |g3| |x|) (QREFELT $ 91))) 

(DEFUN |FSPECF;iiabs;2F;201| (|x| $)
  (PROG (#1=#:G710 |b| |a| |f| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 203)) . #2=(|FSPECF;iiabs;2F;201|))
      (EXIT
       (COND ((QEQCAR |r| 1) (|FSPECF;iabs| |x| $))
             (#3='T
              (SEQ
               (EXIT
                (SEQ (LETT |f| (QCDR |r|) . #2#)
                     (SEQ
                      (LETT |a|
                            (SPADCALL (SPADCALL |f| (QREFELT $ 206))
                                      (QREFELT $ 208))
                            . #2#)
                      (EXIT
                       (COND
                        ((QEQCAR |a| 1)
                         (PROGN
                          (LETT #1# (|FSPECF;iabs| |x| $) . #2#)
                          (GO #1#)))
                        (#3#
                         (SEQ
                          (LETT |b|
                                (SPADCALL (SPADCALL |f| (QREFELT $ 209))
                                          (QREFELT $ 208))
                                . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |b| 1)
                             (PROGN
                              (LETT #1# (|FSPECF;iabs| |x| $) . #2#)
                              (GO #1#))))))))))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (SPADCALL (QCDR |a|) (QREFELT $ 210))
                                 (QREFELT $ 211))
                       (SPADCALL (SPADCALL (QCDR |b|) (QREFELT $ 210))
                                 (QREFELT $ 211))
                       (QREFELT $ 99)))))
               #1# (EXIT #1#))))))))) 

(DEFUN |FSPECF;iiabs;2F;202| (|x| $) (|FSPECF;iabs| |x| $)) 

(DEFUN |FSPECF;iiGamma;2F;203| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 213)) |FSPECF;iiGamma;2F;203|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|FSPECF;iGamma| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 214))
                            (QREFELT $ 211))))))))) 

(DEFUN |FSPECF;iiBeta;LF;204| (|l| $)
  (PROG (#1=#:G724 |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 213))
               . #2=(|FSPECF;iiBeta;LF;204|))
         (EXIT
          (COND
           ((QEQCAR |r| 1)
            (PROGN
             (LETT #1#
                   (|FSPECF;iBeta| (|SPADfirst| |l|)
                    (SPADCALL |l| (QREFELT $ 201)) $)
                   . #2#)
             (GO #1#)))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 213))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |s| 1)
                (PROGN
                 (LETT #1#
                       (|FSPECF;iBeta| (|SPADfirst| |l|)
                        (SPADCALL |l| (QREFELT $ 201)) $)
                       . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 216))
                   (QREFELT $ 211)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iidigamma;2F;205| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 213)) |FSPECF;iidigamma;2F;205|)
          (EXIT
           (COND ((QEQCAR |r| 1) (|FSPECF;idigamma| |x| $))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 218))
                            (QREFELT $ 211))))))))) 

(DEFUN |FSPECF;iipolygamma;LF;206| (|l| $)
  (PROG (#1=#:G736 |r| |s|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |s| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 213))
               . #2=(|FSPECF;iipolygamma;LF;206|))
         (EXIT
          (COND
           ((QEQCAR |s| 1)
            (PROGN
             (LETT #1#
                   (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                    (SPADCALL |l| (QREFELT $ 201)) $)
                   . #2#)
             (GO #1#)))
           ('T
            (SEQ
             (LETT |r|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 213))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |r| 1)
                (PROGN
                 (LETT #1#
                       (|FSPECF;iiipolygamma| (|SPADfirst| |l|)
                        (SPADCALL |l| (QREFELT $ 201)) $)
                       . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |s|) (QCDR |r|) (QREFELT $ 220))
                   (QREFELT $ 211)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iiBesselJ;LF;207| (|l| $)
  (PROG (#1=#:G743 |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 213))
               . #2=(|FSPECF;iiBesselJ;LF;207|))
         (EXIT
          (COND
           ((QEQCAR |r| 1)
            (PROGN
             (LETT #1#
                   (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                    (SPADCALL |l| (QREFELT $ 201)) $)
                   . #2#)
             (GO #1#)))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 213))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |s| 1)
                (PROGN
                 (LETT #1#
                       (|FSPECF;iiiBesselJ| (|SPADfirst| |l|)
                        (SPADCALL |l| (QREFELT $ 201)) $)
                       . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 222))
                   (QREFELT $ 211)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iiBesselY;LF;208| (|l| $)
  (PROG (#1=#:G750 |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 213))
               . #2=(|FSPECF;iiBesselY;LF;208|))
         (EXIT
          (COND
           ((QEQCAR |r| 1)
            (PROGN
             (LETT #1#
                   (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                    (SPADCALL |l| (QREFELT $ 201)) $)
                   . #2#)
             (GO #1#)))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 213))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |s| 1)
                (PROGN
                 (LETT #1#
                       (|FSPECF;iiiBesselY| (|SPADfirst| |l|)
                        (SPADCALL |l| (QREFELT $ 201)) $)
                       . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 224))
                   (QREFELT $ 211)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iiBesselI;LF;209| (|l| $)
  (PROG (#1=#:G757 |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 213))
               . #2=(|FSPECF;iiBesselI;LF;209|))
         (EXIT
          (COND
           ((QEQCAR |r| 1)
            (PROGN
             (LETT #1#
                   (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                    (SPADCALL |l| (QREFELT $ 201)) $)
                   . #2#)
             (GO #1#)))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 213))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |s| 1)
                (PROGN
                 (LETT #1#
                       (|FSPECF;iiiBesselI| (|SPADfirst| |l|)
                        (SPADCALL |l| (QREFELT $ 201)) $)
                       . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 226))
                   (QREFELT $ 211)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iiBesselK;LF;210| (|l| $)
  (PROG (#1=#:G764 |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 213))
               . #2=(|FSPECF;iiBesselK;LF;210|))
         (EXIT
          (COND
           ((QEQCAR |r| 1)
            (PROGN
             (LETT #1#
                   (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                    (SPADCALL |l| (QREFELT $ 201)) $)
                   . #2#)
             (GO #1#)))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL (SPADCALL |l| (QREFELT $ 201)) (QREFELT $ 213))
                   . #2#)
             (EXIT
              (COND
               ((QEQCAR |s| 1)
                (PROGN
                 (LETT #1#
                       (|FSPECF;iiiBesselK| (|SPADfirst| |l|)
                        (SPADCALL |l| (QREFELT $ 201)) $)
                       . #2#)
                 (GO #1#))))))))))
        (EXIT
         (SPADCALL (SPADCALL (QCDR |r|) (QCDR |s|) (QREFELT $ 228))
                   (QREFELT $ 211)))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iiAiryAi;2F;211| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 213)) |FSPECF;iiAiryAi;2F;211|)
          (EXIT
           (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 194)))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 230))
                            (QREFELT $ 211))))))))) 

(DEFUN |FSPECF;iiAiryAiPrime;2F;212| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |x| (QREFELT $ 213)) |FSPECF;iiAiryAiPrime;2F;212|)
      (EXIT
       (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 195)))
             ('T
              (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 232))
                        (QREFELT $ 211))))))))) 

(DEFUN |FSPECF;iiAiryBi;2F;213| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 213)) |FSPECF;iiAiryBi;2F;213|)
          (EXIT
           (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 196)))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 234))
                            (QREFELT $ 211))))))))) 

(DEFUN |FSPECF;iiAiryBi;2F;214| (|x| $)
  (PROG (|r|)
    (RETURN
     (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 213)) |FSPECF;iiAiryBi;2F;214|)
          (EXIT
           (COND ((QEQCAR |r| 1) (SPADCALL |x| (QREFELT $ 197)))
                 ('T
                  (SPADCALL (SPADCALL (QCDR |r|) (QREFELT $ 236))
                            (QREFELT $ 211))))))))) 

(DEFUN |FSPECF;iiGamma;2F;215| (|x| $)
  (PROG (#1=#:G790 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (LETT |r| (SPADCALL |x| (QREFELT $ 238))
               . #2=(|FSPECF;iiGamma;2F;215|))
         (EXIT
          (COND
           ((QEQCAR |r| 0)
            (COND
             ((>= (QCDR |r|) 1)
              (PROGN
               (LETT #1#
                     (SPADCALL (SPADCALL (- (QCDR |r|) 1) (QREFELT $ 239))
                               (QREFELT $ 67))
                     . #2#)
               (GO #1#))))))))
        (EXIT (|FSPECF;iGamma| |x| $))))
      #1# (EXIT #1#))))) 

(DEFUN |FSPECF;iiGamma;2F;216| (|x| $) (|FSPECF;iGamma| |x| $)) 

(DEFUN |FSPECF;iiBeta;LF;217| (|l| $)
  (|FSPECF;iBeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) $)) 

(DEFUN |FSPECF;iidigamma;2F;218| (|x| $) (|FSPECF;idigamma| |x| $)) 

(DEFUN |FSPECF;iipolygamma;LF;219| (|l| $)
  (|FSPECF;iiipolygamma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) $)) 

(DEFUN |FSPECF;iiBesselJ;LF;220| (|l| $)
  (|FSPECF;iiiBesselJ| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) $)) 

(DEFUN |FSPECF;iiBesselY;LF;221| (|l| $)
  (|FSPECF;iiiBesselY| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) $)) 

(DEFUN |FSPECF;iiBesselI;LF;222| (|l| $)
  (|FSPECF;iiiBesselI| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) $)) 

(DEFUN |FSPECF;iiBesselK;LF;223| (|l| $)
  (|FSPECF;iiiBesselK| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201)) $)) 

(DEFUN |FSPECF;iiAiryAi;2F;224| (|x| $) (SPADCALL |x| (QREFELT $ 194))) 

(DEFUN |FSPECF;iiAiryAiPrime;2F;225| (|x| $) (SPADCALL |x| (QREFELT $ 195))) 

(DEFUN |FSPECF;iiAiryBi;2F;226| (|x| $) (SPADCALL |x| (QREFELT $ 196))) 

(DEFUN |FSPECF;iiAiryBiPrime;2F;227| (|x| $) (SPADCALL |x| (QREFELT $ 197))) 

(DEFUN |FSPECF;iiWeierstrassP| (|l| $)
  (|FSPECF;iWeierstrassP| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201))
   (SPADCALL |l| (QREFELT $ 241)) $)) 

(DEFUN |FSPECF;iiWeierstrassPPrime| (|l| $)
  (|FSPECF;iWeierstrassPPrime| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201))
   (SPADCALL |l| (QREFELT $ 241)) $)) 

(DEFUN |FSPECF;iiWeierstrassSigma| (|l| $)
  (|FSPECF;iWeierstrassSigma| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201))
   (SPADCALL |l| (QREFELT $ 241)) $)) 

(DEFUN |FSPECF;iiWeierstrassZeta| (|l| $)
  (|FSPECF;iWeierstrassZeta| (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201))
   (SPADCALL |l| (QREFELT $ 241)) $)) 

(DEFUN |FSPECF;iBesselJ| (|l| |t| $)
  (PROG (|x| |n|)
    (RETURN
     (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselJ|))
          (LETT |x| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |n| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL (QREFELT $ 19)
                                           (LIST (QREFELT $ 78) |x|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |n|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL
             (SPADCALL (SPADCALL |x| |t| (QREFELT $ 90)) (QREFELT $ 81)
                       (QREFELT $ 92))
             (SPADCALL
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
                        |x| (QREFELT $ 43))
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 93)) |x|
                        (QREFELT $ 43))
              (QREFELT $ 100))
             (QREFELT $ 92))
            (QREFELT $ 93))))))) 

(DEFUN |FSPECF;iBesselY| (|l| |t| $)
  (PROG (|x| |n|)
    (RETURN
     (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselY|))
          (LETT |x| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |n| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL (QREFELT $ 20)
                                           (LIST (QREFELT $ 78) |x|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |n|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL
             (SPADCALL (SPADCALL |x| |t| (QREFELT $ 90)) (QREFELT $ 81)
                       (QREFELT $ 92))
             (SPADCALL
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
                        |x| (QREFELT $ 44))
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 93)) |x|
                        (QREFELT $ 44))
              (QREFELT $ 100))
             (QREFELT $ 92))
            (QREFELT $ 93))))))) 

(DEFUN |FSPECF;iBesselI| (|l| |t| $)
  (PROG (|x| |n|)
    (RETURN
     (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselI|))
          (LETT |x| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |n| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL (QREFELT $ 21)
                                           (LIST (QREFELT $ 78) |x|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |n|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL
             (SPADCALL (SPADCALL |x| |t| (QREFELT $ 90)) (QREFELT $ 81)
                       (QREFELT $ 92))
             (SPADCALL
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
                        |x| (QREFELT $ 45))
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 93)) |x|
                        (QREFELT $ 45))
              (QREFELT $ 93))
             (QREFELT $ 92))
            (QREFELT $ 93))))))) 

(DEFUN |FSPECF;iBesselK| (|l| |t| $)
  (PROG (|x| |n|)
    (RETURN
     (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;iBesselK|))
          (LETT |x| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |n| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL (QREFELT $ 22)
                                           (LIST (QREFELT $ 78) |x|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |n|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL
             (SPADCALL (SPADCALL |x| |t| (QREFELT $ 90)) (QREFELT $ 81)
                       (QREFELT $ 92))
             (SPADCALL
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 100))
                        |x| (QREFELT $ 46))
              (SPADCALL (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 93)) |x|
                        (QREFELT $ 46))
              (QREFELT $ 93))
             (QREFELT $ 92))
            (QREFELT $ 100))))))) 

(DEFUN |FSPECF;dPolylog| (|l| |t| $)
  (PROG (|x| |s|)
    (RETURN
     (SEQ (LETT |s| (|SPADfirst| |l|) . #1=(|FSPECF;dPolylog|))
          (LETT |x| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |s| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL (QREFELT $ 28)
                                           (LIST (QREFELT $ 78) |x|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |s|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL
             (SPADCALL (SPADCALL |x| |t| (QREFELT $ 90))
                       (SPADCALL
                        (SPADCALL |s| (|spadConstant| $ 63) (QREFELT $ 100))
                        |x| (QREFELT $ 52))
                       (QREFELT $ 92))
             |x| (QREFELT $ 99))
            (QREFELT $ 93))))))) 

(DEFUN |FSPECF;ipolygamma| (|l| |x| $)
  (PROG (|y| |n|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |x| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 245))
                  (QREFELT $ 246))
        (|error|
         "cannot differentiate polygamma with respect to the first argument"))
       ('T
        (SEQ (LETT |n| (|SPADfirst| |l|) . #1=(|FSPECF;ipolygamma|))
             (LETT |y| (SPADCALL |l| (QREFELT $ 201)) . #1#)
             (EXIT
              (SPADCALL (SPADCALL |y| |x| (QREFELT $ 90))
                        (SPADCALL
                         (SPADCALL |n| (|spadConstant| $ 63) (QREFELT $ 93))
                         |y| (QREFELT $ 42))
                        (QREFELT $ 92)))))))))) 

(DEFUN |FSPECF;iBetaGrad1| (|l| $)
  (PROG (|y| |x|)
    (RETURN
     (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad1|))
          (LETT |y| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL (SPADCALL |x| |y| (QREFELT $ 40))
                     (SPADCALL (SPADCALL |x| (QREFELT $ 41))
                               (SPADCALL (SPADCALL |x| |y| (QREFELT $ 93))
                                         (QREFELT $ 41))
                               (QREFELT $ 100))
                     (QREFELT $ 92))))))) 

(DEFUN |FSPECF;iBetaGrad2| (|l| $)
  (PROG (|y| |x|)
    (RETURN
     (SEQ (LETT |x| (|SPADfirst| |l|) . #1=(|FSPECF;iBetaGrad2|))
          (LETT |y| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL (SPADCALL |x| |y| (QREFELT $ 40))
                     (SPADCALL (SPADCALL |y| (QREFELT $ 41))
                               (SPADCALL (SPADCALL |x| |y| (QREFELT $ 93))
                                         (QREFELT $ 41))
                               (QREFELT $ 100))
                     (QREFELT $ 92))))))) 

(DEFUN |FSPECF;iGamma2| (|l| |t| $)
  (PROG (|x| |a|)
    (RETURN
     (SEQ (LETT |a| (|SPADfirst| |l|) . #1=(|FSPECF;iGamma2|))
          (LETT |x| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |a| |t| (QREFELT $ 90))
                      (SPADCALL (QREFELT $ 75)
                                (LIST
                                 (SPADCALL (QREFELT $ 15)
                                           (LIST (QREFELT $ 78) |x|)
                                           (QREFELT $ 71))
                                 (QREFELT $ 78) |a|)
                                (QREFELT $ 91))
                      (QREFELT $ 92))
            (SPADCALL
             (SPADCALL (SPADCALL |x| |t| (QREFELT $ 90))
                       (SPADCALL |x|
                                 (SPADCALL |a| (|spadConstant| $ 63)
                                           (QREFELT $ 100))
                                 (QREFELT $ 118))
                       (QREFELT $ 92))
             (SPADCALL (SPADCALL |x| (QREFELT $ 109)) (QREFELT $ 247))
             (QREFELT $ 92))
            (QREFELT $ 100))))))) 

(DEFUN |FSPECF;inGamma2| (|li| $)
  (SPADCALL (CONS (SPADCALL '|Gamma| (QREFELT $ 161)) |li|) (QREFELT $ 162))) 

(DEFUN |FSPECF;dLambertW| (|x| $)
  (PROG (|lw|)
    (RETURN
     (SEQ (LETT |lw| (SPADCALL |x| (QREFELT $ 51)) |FSPECF;dLambertW|)
          (EXIT
           (SPADCALL |lw|
                     (SPADCALL |x|
                               (SPADCALL (|spadConstant| $ 63) |lw|
                                         (QREFELT $ 93))
                               (QREFELT $ 92))
                     (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassPGrad1| (|l| $)
  (PROG (|wp| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
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
                             (SPADCALL 9 (QREFELT $ 81) (QREFELT $ 86)) |g3|
                             (QREFELT $ 92))
                            (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                            (QREFELT $ 92))
                           (QREFELT $ 109))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 83)
                                     (SPADCALL |g2| 2 (QREFELT $ 156))
                                     (QREFELT $ 92))
                           |x| (QREFELT $ 92))
                          (QREFELT $ 93))
                         (QREFELT $ 92))
               (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86))
                         (SPADCALL |wp| 2 (QREFELT $ 156)) (QREFELT $ 92))
               (QREFELT $ 100))
              (SPADCALL
               (SPADCALL (QREFELT $ 81) (SPADCALL |g2| 2 (QREFELT $ 156))
                         (QREFELT $ 92))
               |wp| (QREFELT $ 92))
              (QREFELT $ 93))
             (SPADCALL
              (SPADCALL (SPADCALL 3 (QREFELT $ 81) (QREFELT $ 86)) |g2|
                        (QREFELT $ 92))
              |g3| (QREFELT $ 92))
             (QREFELT $ 93))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassPGrad2| (|l| $)
  (PROG (|wp| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 55))
                         (SPADCALL
                          (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 86))
                                    (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                                    (QREFELT $ 92))
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 81) (QREFELT $ 86))
                                     |g3| (QREFELT $ 92))
                           |x| (QREFELT $ 92))
                          (QREFELT $ 100))
                         (QREFELT $ 92))
               (SPADCALL (SPADCALL 6 |g2| (QREFELT $ 86))
                         (SPADCALL |wp| 2 (QREFELT $ 156)) (QREFELT $ 92))
               (QREFELT $ 93))
              (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |wp| (QREFELT $ 92))
              (QREFELT $ 100))
             (SPADCALL |g2| 2 (QREFELT $ 156)) (QREFELT $ 100))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassPGrad3| (|l| $)
  (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201))
            (SPADCALL |l| (QREFELT $ 241)) (QREFELT $ 55))) 

(DEFUN |FSPECF;iWeierstrassPPrimeGrad1| (|l| $)
  (PROG (|wpp2| |wpp| |wp| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 156)) (QREFELT $ 86))
                 (SPADCALL (QREFELT $ 81) |g2| (QREFELT $ 92)) (QREFELT $ 100))
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
                             (SPADCALL 9 (QREFELT $ 81) (QREFELT $ 86)) |g3|
                             (QREFELT $ 92))
                            (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                            (QREFELT $ 92))
                           (QREFELT $ 109))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 83)
                                     (SPADCALL |g2| 2 (QREFELT $ 156))
                                     (QREFELT $ 92))
                           |x| (QREFELT $ 92))
                          (QREFELT $ 93))
                         (QREFELT $ 92))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 81) (QREFELT $ 86))
                                     |g3| (QREFELT $ 92))
                           |wp| (QREFELT $ 92))
                          (SPADCALL (QREFELT $ 83)
                                    (SPADCALL |g2| 2 (QREFELT $ 156))
                                    (QREFELT $ 92))
                          (QREFELT $ 93))
                         (QREFELT $ 92))
               (QREFELT $ 93))
              (SPADCALL
               (SPADCALL (SPADCALL 18 |g3| (QREFELT $ 86)) |wp| (QREFELT $ 92))
               |wpp| (QREFELT $ 92))
              (QREFELT $ 100))
             (SPADCALL
              (SPADCALL (QREFELT $ 81) (SPADCALL |g2| 2 (QREFELT $ 156))
                        (QREFELT $ 92))
              |wpp| (QREFELT $ 92))
             (QREFELT $ 93))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassPPrimeGrad2| (|l| $)
  (PROG (|wpp2| |wpp| |wp| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassPPrimeGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (LETT |wpp| (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) . #1#)
          (LETT |wpp2|
                (SPADCALL
                 (SPADCALL 6 (SPADCALL |wp| 2 (QREFELT $ 156)) (QREFELT $ 86))
                 (SPADCALL (QREFELT $ 81) |g2| (QREFELT $ 92)) (QREFELT $ 100))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL |wpp2|
                         (SPADCALL
                          (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 86))
                                    (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                                    (QREFELT $ 92))
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 (QREFELT $ 81) (QREFELT $ 86))
                                     |g3| (QREFELT $ 92))
                           |x| (QREFELT $ 92))
                          (QREFELT $ 100))
                         (QREFELT $ 92))
               (SPADCALL |wpp|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 86)) |wp|
                                     (QREFELT $ 92))
                           (QREFELT $ 109))
                          (SPADCALL (SPADCALL 9 (QREFELT $ 81) (QREFELT $ 86))
                                    |g3| (QREFELT $ 92))
                          (QREFELT $ 100))
                         (QREFELT $ 92))
               (QREFELT $ 93))
              (SPADCALL
               (SPADCALL (SPADCALL 12 |g2| (QREFELT $ 86)) |wp| (QREFELT $ 92))
               |wpp| (QREFELT $ 92))
              (QREFELT $ 93))
             (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |wpp| (QREFELT $ 92))
             (QREFELT $ 100))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassPPrimeGrad3| (|l| $)
  (PROG (|g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) |FSPECF;iWeierstrassPPrimeGrad3|)
          (EXIT
           (SPADCALL
            (SPADCALL 6
                      (SPADCALL
                       (SPADCALL |g2| (SPADCALL |l| (QREFELT $ 201))
                                 (SPADCALL |l| (QREFELT $ 241)) (QREFELT $ 54))
                       2 (QREFELT $ 112))
                      (QREFELT $ 86))
            (SPADCALL (QREFELT $ 81) |g2| (QREFELT $ 92)) (QREFELT $ 100))))))) 

(DEFUN |FSPECF;iWeierstrassSigmaGrad1| (|l| $)
  (PROG (|wsp2| |wsp| |wz| |ws| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 56)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 57)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 92)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) |ws|
                            (QREFELT $ 92))
                  (QREFELT $ 109))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 156)) |ws|
                           (QREFELT $ 92))
                 (QREFELT $ 93))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 83)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |wsp2|
                                    (QREFELT $ 92))
                          (QREFELT $ 109))
                         (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 156)) |ws|
                                   (QREFELT $ 92))
                         (QREFELT $ 100))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 3 (QREFELT $ 83) (QREFELT $ 86))
                                     |g2| (QREFELT $ 92))
                           |g3| (QREFELT $ 92))
                          (SPADCALL |x| 2 (QREFELT $ 156)) (QREFELT $ 92))
                         |ws| (QREFELT $ 92))
                        (QREFELT $ 100))
                       (SPADCALL
                        (SPADCALL (SPADCALL |g2| 2 (QREFELT $ 156)) |x|
                                  (QREFELT $ 92))
                        |wsp| (QREFELT $ 92))
                       (QREFELT $ 93))
                      (QREFELT $ 92))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassSigmaGrad2| (|l| $)
  (PROG (|wsp2| |wsp| |wz| |ws| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |ws| (SPADCALL |g2| |g3| |x| (QREFELT $ 56)) . #1#)
          (LETT |wz| (SPADCALL |g2| |g3| |x| (QREFELT $ 57)) . #1#)
          (LETT |wsp| (SPADCALL |wz| |ws| (QREFELT $ 92)) . #1#)
          (LETT |wsp2|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) |ws|
                            (QREFELT $ 92))
                  (QREFELT $ 109))
                 (SPADCALL (SPADCALL |wz| 2 (QREFELT $ 156)) |ws|
                           (QREFELT $ 92))
                 (QREFELT $ 93))
                . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL (QREFELT $ 81)
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 3 |g2| (QREFELT $ 86)) |wsp2|
                                   (QREFELT $ 92))
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |ws|
                                   (QREFELT $ 92))
                         (QREFELT $ 93))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT $ 83)
                                    (SPADCALL |g2| 2 (QREFELT $ 156))
                                    (QREFELT $ 92))
                          (SPADCALL |x| 2 (QREFELT $ 156)) (QREFELT $ 92))
                         |ws| (QREFELT $ 92))
                        (QREFELT $ 93))
                       (SPADCALL
                        (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |x|
                                  (QREFELT $ 92))
                        |wsp| (QREFELT $ 92))
                       (QREFELT $ 100))
                      (QREFELT $ 92))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassSigmaGrad3| (|l| $)
  (PROG (|x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassSigmaGrad3|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (EXIT
           (SPADCALL (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                     (SPADCALL |g2| |g3| |x| (QREFELT $ 56))
                     (QREFELT $ 92))))))) 

(DEFUN |FSPECF;iWeierstrassZetaGrad1| (|l| $)
  (PROG (|wp| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassZetaGrad1|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (QREFELT $ 81) (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                         (QREFELT $ 92))
               (SPADCALL
                (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |wp| (QREFELT $ 92))
                (SPADCALL (QREFELT $ 81) (SPADCALL |g2| 2 (QREFELT $ 156))
                          (QREFELT $ 92))
                (QREFELT $ 93))
               (QREFELT $ 92))
              (SPADCALL
               (SPADCALL (SPADCALL (QREFELT $ 81) |g2| (QREFELT $ 92)) |x|
                         (QREFELT $ 92))
               (SPADCALL
                (SPADCALL (SPADCALL (QREFELT $ 81) |g2| (QREFELT $ 92)) |wp|
                          (QREFELT $ 92))
                (SPADCALL (SPADCALL 3 (QREFELT $ 83) (QREFELT $ 86)) |g3|
                          (QREFELT $ 92))
                (QREFELT $ 93))
               (QREFELT $ 92))
              (QREFELT $ 100))
             (SPADCALL
              (SPADCALL (SPADCALL 9 (QREFELT $ 83) (QREFELT $ 86)) |g3|
                        (QREFELT $ 92))
              (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) (QREFELT $ 92))
             (QREFELT $ 93))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassZetaGrad2| (|l| $)
  (PROG (|wp| |delta| |x| |g3| |g2|)
    (RETURN
     (SEQ (LETT |g2| (|SPADfirst| |l|) . #1=(|FSPECF;iWeierstrassZetaGrad2|))
          (LETT |g3| (SPADCALL |l| (QREFELT $ 201)) . #1#)
          (LETT |x| (SPADCALL |l| (QREFELT $ 241)) . #1#)
          (LETT |delta|
                (SPADCALL (SPADCALL |g2| 3 (QREFELT $ 156))
                          (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT $ 156))
                                    (QREFELT $ 86))
                          (QREFELT $ 100))
                . #1#)
          (LETT |wp| (SPADCALL |g2| |g3| |x| (QREFELT $ 54)) . #1#)
          (EXIT
           (SPADCALL
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL
                (SPADCALL 3 (SPADCALL |g2| |g3| |x| (QREFELT $ 57))
                          (QREFELT $ 86))
                (SPADCALL (SPADCALL |g2| |wp| (QREFELT $ 92))
                          (SPADCALL (SPADCALL 3 (QREFELT $ 81) (QREFELT $ 86))
                                    |g3| (QREFELT $ 92))
                          (QREFELT $ 93))
                (QREFELT $ 92))
               (QREFELT $ 109))
              (SPADCALL (SPADCALL (QREFELT $ 81) |x| (QREFELT $ 92))
                        (SPADCALL
                         (SPADCALL (SPADCALL 9 |g3| (QREFELT $ 86)) |wp|
                                   (QREFELT $ 92))
                         (SPADCALL (QREFELT $ 81)
                                   (SPADCALL |g2| 2 (QREFELT $ 156))
                                   (QREFELT $ 92))
                         (QREFELT $ 93))
                        (QREFELT $ 92))
              (QREFELT $ 93))
             (SPADCALL
              (SPADCALL (SPADCALL 3 (QREFELT $ 81) (QREFELT $ 86)) |g2|
                        (QREFELT $ 92))
              (SPADCALL |g2| |g3| |x| (QREFELT $ 55)) (QREFELT $ 92))
             (QREFELT $ 100))
            |delta| (QREFELT $ 99))))))) 

(DEFUN |FSPECF;iWeierstrassZetaGrad3| (|l| $)
  (SPADCALL
   (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT $ 201))
             (SPADCALL |l| (QREFELT $ 241)) (QREFELT $ 54))
   (QREFELT $ 109))) 

(DEFUN |FSPECF;get_int_listf| (|lf| $)
  (SPADCALL (ELT $ 248) |lf| (QREFELT $ 252))) 

(DEFUN |FSPECF;replace_i| (|lp| |v| |i| $)
  (PROG (#1=#:G984)
    (RETURN
     (SPADCALL
      (SPADCALL |lp|
                (PROG1 (LETT #1# (- |i| 1) |FSPECF;replace_i|)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                (QREFELT $ 253))
      (CONS |v| (SPADCALL |lp| |i| (QREFELT $ 254))) (QREFELT $ 69))))) 

(DEFUN |FSPECF;iiHypergeometricF;LF;257| (|l| $)
  (PROG (#1=#:G987 #2=#:G989 |q| |p| |pqi| |pq| |nn| #3=#:G986 |z| |n|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |n| (LENGTH |l|) . #4=(|FSPECF;iiHypergeometricF;LF;257|))
            (LETT |z| (SPADCALL |l| (- |n| 2) (QREFELT $ 89)) . #4#)
            (COND
             ((SPADCALL |z| (|spadConstant| $ 59) (QREFELT $ 61))
              (SEQ
               (EXIT
                (SEQ
                 (LETT |nn|
                       (PROG1 (LETT #3# (- |n| 2) . #4#)
                         (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|)
                                          #3#))
                       . #4#)
                 (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 254)) . #4#)
                 (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #4#)
                 (LETT |p| (|SPADfirst| |pqi|) . #4#)
                 (LETT |q| (|SPADfirst| (CDR |pqi|)) . #4#)
                 (EXIT
                  (COND
                   ((SPADCALL |p| (+ |q| 1) (QREFELT $ 255))
                    (PROGN
                     (LETT #1#
                           (PROGN
                            (LETT #2# (|spadConstant| $ 63) . #4#)
                            (GO #2#))
                           . #4#)
                     (GO #1#)))))))
               #1# (EXIT #1#))))
            (EXIT (SPADCALL (QREFELT $ 33) |l| (QREFELT $ 91)))))
      #2# (EXIT #2#))))) 

(DEFUN |FSPECF;idvsum| (|op| |n| |l| |x| $)
  (PROG (|res| |nl| |i| #1=#:G996 |a|)
    (RETURN
     (SEQ (LETT |res| (|spadConstant| $ 59) . #2=(|FSPECF;idvsum|))
          (SEQ (LETT |a| NIL . #2#) (LETT #1# |l| . #2#) (LETT |i| 1 . #2#)
               G190
               (COND
                ((OR (|greater_SI| |i| |n|) (ATOM #1#)
                     (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |nl| (|FSPECF;replace_i| |l| (QREFELT $ 78) |i| $) . #2#)
                (EXIT
                 (LETT |res|
                       (SPADCALL |res|
                                 (SPADCALL (SPADCALL |a| |x| (QREFELT $ 90))
                                           (SPADCALL (QREFELT $ 75)
                                                     (LIST
                                                      (SPADCALL |op| |nl|
                                                                (QREFELT $ 71))
                                                      (QREFELT $ 78) |a|)
                                                     (QREFELT $ 91))
                                           (QREFELT $ 92))
                                 (QREFELT $ 93))
                       . #2#)))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#) . #2#))
                     . #2#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |res|))))) 

(DEFUN |FSPECF;dvhypergeom| (|l| |x| $)
  (PROG (|aprod| |nl| |nl1| |nl0| |bprod| |b| |i| |a| |q| |p| |z| |l1| |ol|
         |pqi| |pq| |nn| #1=#:G997 |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #2=(|FSPECF;dvhypergeom|))
          (LETT |nn|
                (PROG1 (LETT #1# (- |n| 2) . #2#)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |pq| (SPADCALL |l| |nn| (QREFELT $ 254)) . #2#)
          (LETT |pqi| (|FSPECF;get_int_listf| |pq| $) . #2#)
          (LETT |ol| |l| . #2#)
          (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 253)) . #2#)
          (LETT |l1| (REVERSE |l|) . #2#) (LETT |z| (|SPADfirst| |l1|) . #2#)
          (LETT |p| (|SPADfirst| |pqi|) . #2#)
          (LETT |q| (|SPADfirst| (CDR |pqi|)) . #2#)
          (LETT |aprod| (|spadConstant| $ 63) . #2#) (LETT |nl| NIL . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |p|) (GO G191)))
               (SEQ (LETT |a| (|SPADfirst| |l|) . #2#)
                    (LETT |nl|
                          (CONS
                           (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 93))
                           |nl|)
                          . #2#)
                    (LETT |aprod| (SPADCALL |aprod| |a| (QREFELT $ 92)) . #2#)
                    (EXIT (LETT |l| (CDR |l|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |bprod| (|spadConstant| $ 63) . #2#)
          (SEQ (LETT |i| 1 . #2#) G190
               (COND ((|greater_SI| |i| |q|) (GO G191)))
               (SEQ (LETT |b| (|SPADfirst| |l|) . #2#)
                    (LETT |nl|
                          (CONS
                           (SPADCALL |b| (|spadConstant| $ 63) (QREFELT $ 93))
                           |nl|)
                          . #2#)
                    (LETT |bprod| (SPADCALL |bprod| |b| (QREFELT $ 92)) . #2#)
                    (EXIT (LETT |l| (CDR |l|) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |nl0| (NREVERSE |nl|) . #2#) (LETT |nl1| (CONS |z| |pq|) . #2#)
          (LETT |nl| (SPADCALL |nl0| |nl1| (QREFELT $ 69)) . #2#)
          (LETT |aprod| (SPADCALL |aprod| |bprod| (QREFELT $ 99)) . #2#)
          (EXIT
           (SPADCALL (|FSPECF;idvsum| (QREFELT $ 33) (- |nn| 1) |ol| |x| $)
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| |x| (QREFELT $ 90)) |aprod|
                                (QREFELT $ 92))
                      (SPADCALL (QREFELT $ 33) |nl| (QREFELT $ 71))
                      (QREFELT $ 92))
                     (QREFELT $ 93))))))) 

(DEFUN |FSPECF;add_pairs_to_list| (|lp| |l| $)
  (PROG (#1=#:G1008 |p|)
    (RETURN
     (SEQ
      (SEQ (LETT |p| NIL . #2=(|FSPECF;add_pairs_to_list|))
           (LETT #1# |lp| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL (LENGTH |p|) 2 (QREFELT $ 256))
               (|error| "not a list of pairs"))
              ('T
               (LETT |l|
                     (CONS (SPADCALL |p| 2 (QREFELT $ 89))
                           (CONS (SPADCALL |p| 1 (QREFELT $ 89)) |l|))
                     . #2#)))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |l|))))) 

(DEFUN |FSPECF;dvmeijer| (|l| |x| $)
  (PROG (|om| |nm| |l2| |sign| |na| |a| |n2| |n1| |z| |l1| |nli| |nl| |l0| |nn|
         #1=#:G1009 |n|)
    (RETURN
     (SEQ (LETT |n| (LENGTH |l|) . #2=(|FSPECF;dvmeijer|))
          (LETT |nn|
                (PROG1 (LETT #1# (- |n| 4) . #2#)
                  (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
                . #2#)
          (LETT |l0| |l| . #2#)
          (LETT |nl| (SPADCALL |l| |nn| (QREFELT $ 254)) . #2#)
          (LETT |nli| (|FSPECF;get_int_listf| |nl| $) . #2#)
          (LETT |l| (SPADCALL |l| |nn| (QREFELT $ 253)) . #2#)
          (LETT |l1| (REVERSE |l|) . #2#) (LETT |z| (|SPADfirst| |l1|) . #2#)
          (LETT |n1| (|SPADfirst| |nli|) . #2#)
          (LETT |n2| (SPADCALL |nli| 2 (QREFELT $ 257)) . #2#)
          (LETT |a| (|SPADfirst| |l|) . #2#)
          (LETT |sign| (|spadConstant| $ 63) . #2#)
          (COND
           ((OR (SPADCALL |n1| 0 (QREFELT $ 258))
                (SPADCALL |n2| 0 (QREFELT $ 258)))
            (SEQ
             (LETT |na| (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 100))
                   . #2#)
             (COND
              ((EQL |n1| 0)
               (LETT |sign| (SPADCALL (|spadConstant| $ 63) (QREFELT $ 109))
                     . #2#)))
             (EXIT (LETT |l2| (CONS |na| (CDR |l|)) . #2#))))
           ('T
            (SEQ (LETT |na| |a| . #2#)
                 (COND
                  ((SPADCALL (SPADCALL |nli| 3 (QREFELT $ 257)) 0
                             (QREFELT $ 258))
                   (LETT |sign|
                         (SPADCALL (|spadConstant| $ 63) (QREFELT $ 109))
                         . #2#)))
                 (EXIT
                  (LETT |l2|
                        (CONS
                         (SPADCALL |a| (|spadConstant| $ 63) (QREFELT $ 93))
                         (CDR |l|))
                        . #2#)))))
          (LETT |nm|
                (SPADCALL (QREFELT $ 34) (SPADCALL |l2| |nl| (QREFELT $ 69))
                          (QREFELT $ 71))
                . #2#)
          (LETT |om| (SPADCALL (QREFELT $ 34) |l0| (QREFELT $ 71)) . #2#)
          (EXIT
           (SPADCALL (|FSPECF;idvsum| (QREFELT $ 34) (- |nn| 1) |l0| |x| $)
                     (SPADCALL
                      (SPADCALL (SPADCALL |z| |x| (QREFELT $ 90))
                                (SPADCALL (SPADCALL |sign| |nm| (QREFELT $ 92))
                                          (SPADCALL |na| |om| (QREFELT $ 92))
                                          (QREFELT $ 93))
                                (QREFELT $ 92))
                      |z| (QREFELT $ 99))
                     (QREFELT $ 93))))))) 

(DEFUN |FSPECF;get_if_list| (|n| |lf| $)
  (PROG (|a| |i|)
    (RETURN
     (SEQ (LETT |a| NIL . #1=(|FSPECF;get_if_list|))
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |a| (CONS (|SPADfirst| |lf|) |a|) . #1#)
                    (EXIT (LETT |lf| (CDR |lf|) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (LETT |a|
                (CONS (SPADCALL '|construct| (QREFELT $ 161)) (NREVERSE |a|))
                . #1#)
          (EXIT (LIST |a| |lf|)))))) 

(DEFUN |FSPECF;get_if_lists| (|ln| |lf| $)
  (PROG (|rl| |al| #1=#:G1025 |n|)
    (RETURN
     (SEQ (LETT |rl| NIL . #2=(|FSPECF;get_if_lists|))
          (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |al| (|FSPECF;get_if_list| |n| |lf| $) . #2#)
                    (LETT |rl| (CONS (|SPADfirst| |al|) |rl|) . #2#)
                    (EXIT (LETT |lf| (|SPADfirst| (CDR |al|)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT (CONS |lf| |rl|)))))) 

(DEFUN |FSPECF;get_int_listi| (|n| |lo| $)
  (PROG (|rl| |p| |i| |n0| #1=#:G1026)
    (RETURN
     (SEQ
      (LETT |n0|
            (PROG1
                (LETT #1# (- (LENGTH |lo|) |n|) . #2=(|FSPECF;get_int_listi|))
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 260)) . #2#)
      (LETT |rl| NIL . #2#)
      (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 262)) . #2#)
                (LETT |rl| (CONS |p| |rl|) . #2#)
                (EXIT (LETT |lo| (CDR |lo|) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT |rl|))))) 

(DEFUN |FSPECF;get_of_list| (|n| |lo| $)
  (PROG (|a| |i|)
    (RETURN
     (SEQ (LETT |a| NIL . #1=(|FSPECF;get_of_list|))
          (SEQ (LETT |i| 1 . #1#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ (LETT |a| (CONS (|SPADfirst| |lo|) |a|) . #1#)
                    (EXIT (LETT |lo| (CDR |lo|) . #1#)))
               (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
          (LETT |a| (NREVERSE |a|) . #1#) (EXIT (LIST |a| |lo|)))))) 

(DEFUN |FSPECF;get_of_lists| (|ln| |lo| $)
  (PROG (|rl| |al| #1=#:G1039 |n|)
    (RETURN
     (SEQ (LETT |rl| NIL . #2=(|FSPECF;get_of_lists|))
          (SEQ (LETT |n| NIL . #2#) (LETT #1# |ln| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |al| (|FSPECF;get_of_list| |n| |lo| $) . #2#)
                    (LETT |rl| (CONS (|SPADfirst| |al|) |rl|) . #2#)
                    (EXIT (LETT |lo| (|SPADfirst| (CDR |al|)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT (CONS |lo| |rl|)))))) 

(DEFUN |FSPECF;get_int_listo| (|n| |lo| $)
  (PROG (|rl| |p| |i| |n0| #1=#:G1040)
    (RETURN
     (SEQ
      (LETT |n0|
            (PROG1
                (LETT #1# (- (LENGTH |lo|) |n|) . #2=(|FSPECF;get_int_listo|))
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 264)) . #2#)
      (LETT |rl| NIL . #2#)
      (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ (LETT |p| (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 262)) . #2#)
                (LETT |rl| (CONS |p| |rl|) . #2#)
                (EXIT (LETT |lo| (CDR |lo|) . #2#)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (LETT |rl| (NREVERSE |rl|) . #2#) (EXIT |rl|))))) 

(DEFUN |FSPECF;dhyper0| (|op| |lo| $)
  (PROG (|z| |b| |a| |al| |pql| |n0| #1=#:G1045)
    (RETURN
     (SEQ
      (LETT |n0|
            (PROG1 (LETT #1# (- (LENGTH |lo|) 2) . #2=(|FSPECF;dhyper0|))
              (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))
            . #2#)
      (LETT |pql| (|FSPECF;get_int_listo| 2 |lo| $) . #2#)
      (LETT |lo| (SPADCALL |lo| |n0| (QREFELT $ 265)) . #2#)
      (LETT |al| (|FSPECF;get_of_lists| |pql| |lo| $) . #2#)
      (LETT |lo| (|SPADfirst| |al|) . #2#) (LETT |al| (CDR |al|) . #2#)
      (LETT |a| (|SPADfirst| |al|) . #2#)
      (LETT |b| (|SPADfirst| (CDR |al|)) . #2#)
      (LETT |z| (|SPADfirst| |lo|) . #2#)
      (EXIT
       (SPADCALL |op|
                 (LIST (SPADCALL |a| (QREFELT $ 267))
                       (SPADCALL |b| (QREFELT $ 267)) |z|)
                 (QREFELT $ 268))))))) 

(DEFUN |FSPECF;dhyper| (|lo| $)
  (|FSPECF;dhyper0| (SPADCALL '|hypergeometricF| (QREFELT $ 269)) |lo| $)) 

(DEFUN |FSPECF;ddhyper| (|lo| $)
  (|FSPECF;dhyper0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(DEFUN |FSPECF;dmeijer0| (|op| |lo| $)
  (PROG (|z| |al| |nl| |n0| #1=#:G1050)
    (RETURN
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
                 (QREFELT $ 268))))))) 

(DEFUN |FSPECF;dmeijer| (|lo| $)
  (|FSPECF;dmeijer0| (SPADCALL '|meijerG| (QREFELT $ 269)) |lo| $)) 

(DEFUN |FSPECF;ddmeijer| (|lo| $)
  (|FSPECF;dmeijer0| (|SPADfirst| |lo|) (CDR |lo|) $)) 

(DEFUN |FSPECF;inhyper| (|lf| $)
  (PROG (|li| |zi| |bi| |b| |ai| |a| |al| |pqi|)
    (RETURN
     (SEQ
      (LETT |pqi| (|FSPECF;get_int_listi| 2 |lf| $) . #1=(|FSPECF;inhyper|))
      (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| $) . #1#)
      (LETT |lf| (|SPADfirst| |al|) . #1#) (LETT |al| (CDR |al|) . #1#)
      (LETT |a| (|SPADfirst| |al|) . #1#)
      (LETT |ai| (SPADCALL |a| (QREFELT $ 162)) . #1#)
      (LETT |b| (|SPADfirst| (CDR |al|)) . #1#)
      (LETT |bi| (SPADCALL |b| (QREFELT $ 162)) . #1#)
      (LETT |zi| (|SPADfirst| |lf|) . #1#)
      (LETT |li|
            (LIST (SPADCALL '|hypergeometricF| (QREFELT $ 161)) |ai| |bi| |zi|)
            . #1#)
      (EXIT (SPADCALL |li| (QREFELT $ 162))))))) 

(DEFUN |FSPECF;inmeijer| (|lf| $)
  (PROG (|li| |zi| |di| |d| |al| |ci| |c| |bi| |b| |ai| |a| |pqi|)
    (RETURN
     (SEQ
      (LETT |pqi| (|FSPECF;get_int_listi| 4 |lf| $) . #1=(|FSPECF;inmeijer|))
      (LETT |al| (|FSPECF;get_if_lists| |pqi| |lf| $) . #1#)
      (LETT |lf| (|SPADfirst| |al|) . #1#) (LETT |al| (CDR |al|) . #1#)
      (LETT |a| (|SPADfirst| |al|) . #1#)
      (LETT |ai| (SPADCALL |a| (QREFELT $ 162)) . #1#)
      (LETT |al| (CDR |al|) . #1#) (LETT |b| (|SPADfirst| |al|) . #1#)
      (LETT |bi| (SPADCALL |b| (QREFELT $ 162)) . #1#)
      (LETT |al| (CDR |al|) . #1#) (LETT |c| (|SPADfirst| |al|) . #1#)
      (LETT |ci| (SPADCALL |c| (QREFELT $ 162)) . #1#)
      (LETT |al| (CDR |al|) . #1#) (LETT |d| (|SPADfirst| |al|) . #1#)
      (LETT |di| (SPADCALL |d| (QREFELT $ 162)) . #1#)
      (LETT |zi| (|SPADfirst| |lf|) . #1#)
      (LETT |li|
            (LIST (SPADCALL '|meijerG| (QREFELT $ 161)) |ai| |bi| |ci| |di|
                  |zi|)
            . #1#)
      (EXIT (SPADCALL |li| (QREFELT $ 162))))))) 

(DEFUN |FSPECF;iiHypergeometricF;LF;276| (|l| $)
  (SPADCALL (QREFELT $ 33) |l| (QREFELT $ 91))) 

(DEFUN |FSPECF;iiMeijerG| (|l| $) (SPADCALL (QREFELT $ 34) |l| (QREFELT $ 91))) 

(DEFUN |FunctionalSpecialFunction| (&REST #1=#:G1131)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1132)
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
              (HREM |$ConstructorCache| '|FunctionalSpecialFunction|))))))))))) 

(DEFUN |FunctionalSpecialFunction;| (|#1| |#2|)
  (PROG (#1=#:G217 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
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
      (QSETREFV $ 78 (SPADCALL (SPADCALL (QREFELT $ 76)) (QREFELT $ 77)))
      (QSETREFV $ 81
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 2 (QREFELT $ 67)) (QREFELT $ 80))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) |#2| #1#)))
      (QSETREFV $ 82
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 3 (QREFELT $ 67)) (QREFELT $ 80))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) |#2| #1#)))
      (QSETREFV $ 83
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 4 (QREFELT $ 67)) (QREFELT $ 80))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) |#2| #1#)))
      (QSETREFV $ 84
                (PROG2
                    (LETT #1#
                          (SPADCALL (SPADCALL 6 (QREFELT $ 67)) (QREFELT $ 80))
                          . #2#)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) |#2| #1#)))
      (QSETREFV $ 87 (SPADCALL 2 (QREFELT $ 82) (QREFELT $ 86)))
      (QSETREFV $ 88 (SPADCALL 3 (QREFELT $ 81) (QREFELT $ 86)))
      (QSETREFV $ 94 (SPADCALL '|whittakerM| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 94) (CONS (|function| |FSPECF;elWhittakerM|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 94) '|%specialDiff|
                (CONS (|function| |FSPECF;dWhittakerM|) $) (QREFELT $ 102))
      (QSETREFV $ 103 (SPADCALL '|whittakerW| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 103) (CONS (|function| |FSPECF;elWhittakerW|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 103) '|%specialDiff|
                (CONS (|function| |FSPECF;dWhittakerW|) $) (QREFELT $ 102))
      (QSETREFV $ 105 (SPADCALL '|angerJ| (QREFELT $ 12)))
      (COND
       ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 105) (CONS (|function| |FSPECF;elAngerJ|) $)
                   (QREFELT $ 98))
         (SPADCALL (QREFELT $ 105) '|%specialDiff|
                   (CONS (|function| |FSPECF;dAngerJ|) $) (QREFELT $ 102))))
       ('T
        (PROGN
         (SPADCALL (QREFELT $ 105) (CONS (|function| |FSPECF;eeAngerJ|) $)
                   (QREFELT $ 98)))))
      (QSETREFV $ 110 (SPADCALL '|weberE| (QREFELT $ 12)))
      (COND
       ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 110) (CONS (|function| |FSPECF;elWeberE|) $)
                   (QREFELT $ 98))
         (SPADCALL (QREFELT $ 110) '|%specialDiff|
                   (CONS (|function| |FSPECF;dWeberE|) $) (QREFELT $ 102))))
       ('T
        (PROGN
         (SPADCALL (QREFELT $ 110) (CONS (|function| |FSPECF;eeWeberE|) $)
                   (QREFELT $ 98)))))
      (QSETREFV $ 116 (SPADCALL '|struveH| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 116) (CONS (|function| |FSPECF;elStruveH|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
        (COND
         ((|HasCategory| |#2| '(|RadicalCategory|))
          (PROGN
           (SPADCALL (QREFELT $ 116) '|%specialDiff|
                     (CONS (|function| |FSPECF;dStruveH|) $)
                     (QREFELT $ 102)))))))
      (QSETREFV $ 120 (SPADCALL '|struveL| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 120) (CONS (|function| |FSPECF;elStruveL|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|TranscendentalFunctionCategory|))
        (COND
         ((|HasCategory| |#2| '(|RadicalCategory|))
          (PROGN
           (SPADCALL (QREFELT $ 120) '|%specialDiff|
                     (CONS (|function| |FSPECF;dStruveL|) $)
                     (QREFELT $ 102)))))))
      (QSETREFV $ 122 (SPADCALL '|hankelH1| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 122) (CONS (|function| |FSPECF;elHankelH1|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 122) '|%specialDiff|
                (CONS (|function| |FSPECF;dHankelH1|) $) (QREFELT $ 102))
      (QSETREFV $ 124 (SPADCALL '|hankelH2| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 124) (CONS (|function| |FSPECF;elHankelH2|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 124) '|%specialDiff|
                (CONS (|function| |FSPECF;dHankelH2|) $) (QREFELT $ 102))
      (QSETREFV $ 126 (SPADCALL '|lommelS1| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 126) (CONS (|function| |FSPECF;elLommelS1|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 126) '|%specialDiff|
                (CONS (|function| |FSPECF;dLommelS1|) $) (QREFELT $ 102))
      (QSETREFV $ 128 (SPADCALL '|lommelS2| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 128) (CONS (|function| |FSPECF;elLommelS2|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 128) '|%specialDiff|
                (CONS (|function| |FSPECF;dLommelS2|) $) (QREFELT $ 102))
      (QSETREFV $ 130 (SPADCALL '|kummerM| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 130) (CONS (|function| |FSPECF;elKummerM|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 130) '|%specialDiff|
                (CONS (|function| |FSPECF;dKummerM|) $) (QREFELT $ 102))
      (QSETREFV $ 132 (SPADCALL '|kummerU| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 132) (CONS (|function| |FSPECF;elKummerU|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 132) '|%specialDiff|
                (CONS (|function| |FSPECF;dKummerU|) $) (QREFELT $ 102))
      (QSETREFV $ 134 (SPADCALL '|legendreP| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 134) (CONS (|function| |FSPECF;elLegendreP|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 134) '|%specialDiff|
                (CONS (|function| |FSPECF;dLegendreP|) $) (QREFELT $ 102))
      (QSETREFV $ 136 (SPADCALL '|legendreQ| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 136) (CONS (|function| |FSPECF;elLegendreQ|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 136) '|%specialDiff|
                (CONS (|function| |FSPECF;dLegendreQ|) $) (QREFELT $ 102))
      (QSETREFV $ 138 (SPADCALL '|kelvinBei| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 138) (CONS (|function| |FSPECF;elKelvinBei|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 138) '|%specialDiff|
                   (CONS (|function| |FSPECF;dKelvinBei|) $)
                   (QREFELT $ 102)))))
      (QSETREFV $ 141 (SPADCALL '|kelvinBer| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 141) (CONS (|function| |FSPECF;elKelvinBer|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 141) '|%specialDiff|
                   (CONS (|function| |FSPECF;dKelvinBer|) $)
                   (QREFELT $ 102)))))
      (QSETREFV $ 142 (SPADCALL '|kelvinKei| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 142) (CONS (|function| |FSPECF;elKelvinKei|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 142) '|%specialDiff|
                   (CONS (|function| |FSPECF;dKelvinKei|) $)
                   (QREFELT $ 102)))))
      (QSETREFV $ 145 (SPADCALL '|kelvinKer| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 145) (CONS (|function| |FSPECF;elKelvinKer|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 145) '|%specialDiff|
                   (CONS (|function| |FSPECF;dKelvinKer|) $)
                   (QREFELT $ 102)))))
      (QSETREFV $ 146 (SPADCALL '|ellipticK| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 146) (CONS (|function| |FSPECF;elEllipticK|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 146) (CONS (|function| |FSPECF;dEllipticK|) $)
                (QREFELT $ 152))
      (QSETREFV $ 153 (SPADCALL '|ellipticE| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 153) (CONS (|function| |FSPECF;elEllipticE|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 153) (CONS (|function| |FSPECF;dEllipticE|) $)
                (QREFELT $ 152))
      (QSETREFV $ 154 (SPADCALL '|ellipticE2| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 154) (CONS (|function| |FSPECF;elEllipticE2|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 154)
                   (LIST (CONS (|function| |FSPECF;eEllipticE2Grad_z|) $)
                         (CONS (|function| |FSPECF;eEllipticE2Grad_m|) $))
                   (QREFELT $ 159)))))
      (SPADCALL (QREFELT $ 154) (CONS (|function| |FSPECF;inEllipticE2|) $)
                (QREFELT $ 164))
      (QSETREFV $ 165 (SPADCALL '|ellipticF| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 165) (CONS (|function| |FSPECF;elEllipticF|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 165)
                   (LIST (CONS (|function| |FSPECF;eEllipticFGrad_z|) $)
                         (CONS (|function| |FSPECF;eEllipticFGrad_m|) $))
                   (QREFELT $ 159)))))
      (QSETREFV $ 166 (SPADCALL '|ellipticPi| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 166) (CONS (|function| |FSPECF;elEllipticPi|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|RadicalCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 166)
                   (LIST (CONS (|function| |FSPECF;eEllipticPiGrad_z|) $)
                         (CONS (|function| |FSPECF;eEllipticPiGrad_n|) $)
                         (CONS (|function| |FSPECF;eEllipticPiGrad_m|) $))
                   (QREFELT $ 159)))))
      (QSETREFV $ 168 (SPADCALL '|jacobiSn| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 168) (CONS (|function| |FSPECF;elJacobiSn|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 168)
                (LIST (CONS (|function| |FSPECF;eJacobiSnGrad_z|) $)
                      (CONS (|function| |FSPECF;eJacobiSnGrad_m|) $))
                (QREFELT $ 159))
      (QSETREFV $ 177 (SPADCALL '|jacobiCn| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 177) (CONS (|function| |FSPECF;elJacobiCn|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 177)
                (LIST (CONS (|function| |FSPECF;eJacobiCnGrad_z|) $)
                      (CONS (|function| |FSPECF;eJacobiCnGrad_m|) $))
                (QREFELT $ 159))
      (QSETREFV $ 178 (SPADCALL '|jacobiDn| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 178) (CONS (|function| |FSPECF;elJacobiDn|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 178)
                (LIST (CONS (|function| |FSPECF;eJacobiDnGrad_z|) $)
                      (CONS (|function| |FSPECF;eJacobiDnGrad_m|) $))
                (QREFELT $ 159))
      (QSETREFV $ 179 (SPADCALL '|jacobiZeta| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 179) (CONS (|function| |FSPECF;elJacobiZeta|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 179)
                (LIST (CONS (|function| |FSPECF;eJacobiZetaGrad_z|) $)
                      (CONS (|function| |FSPECF;eJacobiZetaGrad_m|) $))
                (QREFELT $ 159))
      (QSETREFV $ 181 (SPADCALL '|jacobiTheta| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 181) (CONS (|function| |FSPECF;elJacobiTheta|) $)
                (QREFELT $ 98))
      (QSETREFV $ 183 (SPADCALL '|lerchPhi| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 183) (CONS (|function| |FSPECF;elLerchPhi|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 183) '|%specialDiff|
                (CONS (|function| |FSPECF;dLerchPhi|) $) (QREFELT $ 102))
      (QSETREFV $ 185 (SPADCALL '|riemannZeta| (QREFELT $ 12)))
      (SPADCALL (QREFELT $ 185) (CONS (|function| |FSPECF;elRiemannZeta|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
        (PROGN
         (QSETREFV $ 194 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;184|) $))
         (QSETREFV $ 195
                   (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;185|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;186|) $))
         (QSETREFV $ 197
                   (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;187|)
                         $))))
       ('T
        (PROGN
         (QSETREFV $ 194 (CONS (|dispatchFunction| |FSPECF;iAiryAi;2F;188|) $))
         (QSETREFV $ 195
                   (CONS (|dispatchFunction| |FSPECF;iAiryAiPrime;2F;189|) $))
         (QSETREFV $ 196 (CONS (|dispatchFunction| |FSPECF;iAiryBi;2F;190|) $))
         (QSETREFV $ 197
                   (CONS (|dispatchFunction| |FSPECF;iAiryBiPrime;2F;191|)
                         $)))))
      (COND
       ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
        (COND
         ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
          (QSETREFV $ 200
                    (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;193|) $)))
         ('T
          (QSETREFV $ 200
                    (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;194|) $)))))
       ('T
        (QSETREFV $ 200
                  (CONS (|dispatchFunction| |FSPECF;iiPolylog;3F;195|) $))))
      (COND
       ((|HasSignature| |#1|
                        (LIST '|abs|
                              (LIST (|devaluate| |#1|) (|devaluate| |#1|))))
        (PROGN
         (QSETREFV $ 212 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;201|) $))))
       ('T
        (QSETREFV $ 212 (CONS (|dispatchFunction| |FSPECF;iiabs;2F;202|) $))))
      (COND
       ((|HasCategory| |#1| '(|SpecialFunctionCategory|))
        (PROGN
         (QSETREFV $ 215 (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;203|) $))
         (QSETREFV $ 217 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;204|) $))
         (QSETREFV $ 219
                   (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;205|) $))
         (QSETREFV $ 221
                   (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;206|) $))
         (QSETREFV $ 223
                   (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;207|) $))
         (QSETREFV $ 225
                   (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;208|) $))
         (QSETREFV $ 227
                   (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;209|) $))
         (QSETREFV $ 229
                   (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;210|) $))
         (QSETREFV $ 231
                   (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;211|) $))
         (QSETREFV $ 233
                   (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;212|) $))
         (QSETREFV $ 235
                   (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;213|) $))
         (QSETREFV $ 235
                   (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;214|) $))))
       ('T
        (PROGN
         (COND
          ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
           (QSETREFV $ 215
                     (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;215|) $)))
          ('T
           (QSETREFV $ 215
                     (CONS (|dispatchFunction| |FSPECF;iiGamma;2F;216|) $))))
         (QSETREFV $ 217 (CONS (|dispatchFunction| |FSPECF;iiBeta;LF;217|) $))
         (QSETREFV $ 219
                   (CONS (|dispatchFunction| |FSPECF;iidigamma;2F;218|) $))
         (QSETREFV $ 221
                   (CONS (|dispatchFunction| |FSPECF;iipolygamma;LF;219|) $))
         (QSETREFV $ 223
                   (CONS (|dispatchFunction| |FSPECF;iiBesselJ;LF;220|) $))
         (QSETREFV $ 225
                   (CONS (|dispatchFunction| |FSPECF;iiBesselY;LF;221|) $))
         (QSETREFV $ 227
                   (CONS (|dispatchFunction| |FSPECF;iiBesselI;LF;222|) $))
         (QSETREFV $ 229
                   (CONS (|dispatchFunction| |FSPECF;iiBesselK;LF;223|) $))
         (QSETREFV $ 231
                   (CONS (|dispatchFunction| |FSPECF;iiAiryAi;2F;224|) $))
         (QSETREFV $ 233
                   (CONS (|dispatchFunction| |FSPECF;iiAiryAiPrime;2F;225|) $))
         (QSETREFV $ 235
                   (CONS (|dispatchFunction| |FSPECF;iiAiryBi;2F;226|) $))
         (QSETREFV $ 240
                   (CONS (|dispatchFunction| |FSPECF;iiAiryBiPrime;2F;227|)
                         $)))))
      (SPADCALL (QREFELT $ 14) (ELT $ 215) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 13) (ELT $ 212) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 16) (ELT $ 217) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 17) (ELT $ 219) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 18) (ELT $ 221) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 19) (ELT $ 223) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 20) (ELT $ 225) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 21) (ELT $ 227) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 22) (ELT $ 229) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 23) (ELT $ 231) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 24) (ELT $ 233) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 25) (ELT $ 235) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 26) (ELT $ 240) (QREFELT $ 242))
      (SPADCALL (QREFELT $ 27) (CONS (|function| |FSPECF;iLambertW|) $)
                (QREFELT $ 242))
      (SPADCALL (QREFELT $ 28) (CONS (|function| |FSPECF;iPolylog|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 29) (CONS (|function| |FSPECF;iiWeierstrassP|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 30)
                (CONS (|function| |FSPECF;iiWeierstrassPPrime|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 31)
                (CONS (|function| |FSPECF;iiWeierstrassSigma|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 32) (CONS (|function| |FSPECF;iiWeierstrassZeta|) $)
                (QREFELT $ 98))
      (SPADCALL (QREFELT $ 33) (ELT $ 243) (QREFELT $ 98))
      (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;iiMeijerG|) $)
                (QREFELT $ 98))
      (COND
       ((|HasCategory| |#2| '(|ElementaryFunctionCategory|))
        (PROGN
         (SPADCALL (QREFELT $ 15) '|%specialDiff|
                   (CONS (|function| |FSPECF;iGamma2|) $) (QREFELT $ 102)))))
      (SPADCALL (QREFELT $ 15) (CONS (|function| |FSPECF;inGamma2|) $)
                (QREFELT $ 164))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 243
                   (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;257|)
                         $))
         (SPADCALL (QREFELT $ 33) '|%diffDisp|
                   (CONS (|function| |FSPECF;ddhyper|) $) (QREFELT $ 102))
         (SPADCALL (QREFELT $ 34) '|%diffDisp|
                   (CONS (|function| |FSPECF;ddmeijer|) $) (QREFELT $ 102))
         (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;dhyper|) $)
                   (QREFELT $ 275))
         (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;dmeijer|) $)
                   (QREFELT $ 275))
         (SPADCALL (QREFELT $ 33) '|%specialDiff|
                   (CONS (|function| |FSPECF;dvhypergeom|) $) (QREFELT $ 102))
         (SPADCALL (QREFELT $ 34) '|%specialDiff|
                   (CONS (|function| |FSPECF;dvmeijer|) $) (QREFELT $ 102))
         (SPADCALL (QREFELT $ 33) (CONS (|function| |FSPECF;inhyper|) $)
                   (QREFELT $ 164))
         (SPADCALL (QREFELT $ 34) (CONS (|function| |FSPECF;inmeijer|) $)
                   (QREFELT $ 164))))
       ('T
        (QSETREFV $ 243
                  (CONS (|dispatchFunction| |FSPECF;iiHypergeometricF;LF;276|)
                        $))))
      (SPADCALL (QREFELT $ 13) (CONS #'|FunctionalSpecialFunction!0| $)
                (QREFELT $ 152))
      (SPADCALL (QREFELT $ 14) (CONS #'|FunctionalSpecialFunction!1| $)
                (QREFELT $ 152))
      (SPADCALL (QREFELT $ 16)
                (LIST (CONS (|function| |FSPECF;iBetaGrad1|) $)
                      (CONS (|function| |FSPECF;iBetaGrad2|) $))
                (QREFELT $ 159))
      (SPADCALL (QREFELT $ 17) (CONS #'|FunctionalSpecialFunction!2| $)
                (QREFELT $ 152))
      (SPADCALL (QREFELT $ 23) (ELT $ 48) (QREFELT $ 152))
      (SPADCALL (QREFELT $ 24) (CONS #'|FunctionalSpecialFunction!3| $)
                (QREFELT $ 152))
      (SPADCALL (QREFELT $ 25) (ELT $ 50) (QREFELT $ 152))
      (SPADCALL (QREFELT $ 26) (CONS #'|FunctionalSpecialFunction!4| $)
                (QREFELT $ 152))
      (SPADCALL (QREFELT $ 27) (CONS (|function| |FSPECF;dLambertW|) $)
                (QREFELT $ 152))
      (SPADCALL (QREFELT $ 29)
                (LIST (CONS (|function| |FSPECF;iWeierstrassPGrad1|) $)
                      (CONS (|function| |FSPECF;iWeierstrassPGrad2|) $)
                      (CONS (|function| |FSPECF;iWeierstrassPGrad3|) $))
                (QREFELT $ 159))
      (SPADCALL (QREFELT $ 30)
                (LIST (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad1|) $)
                      (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad2|) $)
                      (CONS (|function| |FSPECF;iWeierstrassPPrimeGrad3|) $))
                (QREFELT $ 159))
      (SPADCALL (QREFELT $ 31)
                (LIST (CONS (|function| |FSPECF;iWeierstrassSigmaGrad1|) $)
                      (CONS (|function| |FSPECF;iWeierstrassSigmaGrad2|) $)
                      (CONS (|function| |FSPECF;iWeierstrassSigmaGrad3|) $))
                (QREFELT $ 159))
      (SPADCALL (QREFELT $ 32)
                (LIST (CONS (|function| |FSPECF;iWeierstrassZetaGrad1|) $)
                      (CONS (|function| |FSPECF;iWeierstrassZetaGrad2|) $)
                      (CONS (|function| |FSPECF;iWeierstrassZetaGrad3|) $))
                (QREFELT $ 159))
      (SPADCALL (QREFELT $ 18) '|%specialDiff|
                (CONS (|function| |FSPECF;ipolygamma|) $) (QREFELT $ 102))
      (SPADCALL (QREFELT $ 19) '|%specialDiff|
                (CONS (|function| |FSPECF;iBesselJ|) $) (QREFELT $ 102))
      (SPADCALL (QREFELT $ 20) '|%specialDiff|
                (CONS (|function| |FSPECF;iBesselY|) $) (QREFELT $ 102))
      (SPADCALL (QREFELT $ 21) '|%specialDiff|
                (CONS (|function| |FSPECF;iBesselI|) $) (QREFELT $ 102))
      (SPADCALL (QREFELT $ 22) '|%specialDiff|
                (CONS (|function| |FSPECF;iBesselK|) $) (QREFELT $ 102))
      (SPADCALL (QREFELT $ 28) '|%specialDiff|
                (CONS (|function| |FSPECF;dPolylog|) $) (QREFELT $ 102))
      $)))) 

(DEFUN |FunctionalSpecialFunction!4| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 49)) (QREFELT $ 92))) 

(DEFUN |FunctionalSpecialFunction!3| (|x| $)
  (SPADCALL |x| (SPADCALL |x| (QREFELT $ 47)) (QREFELT $ 92))) 

(DEFUN |FunctionalSpecialFunction!2| (|x| $)
  (SPADCALL (|spadConstant| $ 63) |x| (QREFELT $ 42))) 

(DEFUN |FunctionalSpecialFunction!1| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 41)) (SPADCALL |x| (QREFELT $ 37))
            (QREFELT $ 92))) 

(DEFUN |FunctionalSpecialFunction!0| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 36)) (SPADCALL |x| (QREFELT $ 276))
            (QREFELT $ 92))) 

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
              '|opdiff| (92 . |new|) (96 . |coerce|) '|dm|
              (|Union| $ '"failed") (101 . |recip|) '|ahalf| '|athird|
              '|afourth| '|asixth| (|PositiveInteger|) (106 . *) '|twothirds|
              '|threehalfs| (112 . |elt|) (118 . |differentiate|)
              (124 . |kernel|) (130 . *) (136 . +) '|opWhittakerM|
              |FSPECF;whittakerM;4F;25| (|Mapping| 7 68)
              (|BasicOperatorFunctions1| 7) (142 . |evaluate|) (148 . /)
              (154 . -) (|None|) (160 . |setProperty|) '|opWhittakerW|
              |FSPECF;whittakerW;4F;30| '|opAngerJ| |FSPECF;angerJ;3F;35|
              (167 . |pi|) (171 . |sin|) (176 . -) '|opWeberE|
              |FSPECF;weberE;3F;41| (181 . ^)
              (|SparseMultivariatePolynomial| 6 173) (187 . |One|)
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
              (|List| 96) (223 . |derivative|) (|InputForm|) (229 . |convert|)
              (234 . |convert|) (|Mapping| 160 259) (239 . |input|)
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
              (305 . |iAiryBiPrime|) (310 . |log|) (315 . |dilog|)
              (320 . |iiPolylog|) (326 . |second|) (|Union| 205 '#1="failed")
              (331 . |retractIfCan|) (|Polynomial| 6) (|Fraction| 204)
              (336 . |numer|) (|Union| 6 '"failed") (341 . |retractIfCan|)
              (346 . |denom|) (351 . |abs|) (356 . |coerce|) (361 . |iiabs|)
              (366 . |retractIfCan|) (371 . |Gamma|) (376 . |iiGamma|)
              (381 . |Beta|) (387 . |iiBeta|) (392 . |digamma|)
              (397 . |iidigamma|) (402 . |polygamma|) (408 . |iipolygamma|)
              (413 . |besselJ|) (419 . |iiBesselJ|) (424 . |besselY|)
              (430 . |iiBesselY|) (435 . |besselI|) (441 . |iiBesselI|)
              (446 . |besselK|) (452 . |iiBesselK|) (457 . |airyAi|)
              (462 . |iiAiryAi|) (467 . |airyAiPrime|) (472 . |iiAiryAiPrime|)
              (477 . |airyBi|) (482 . |iiAiryBi|) (487 . |airyBiPrime|)
              (|Union| 66 '#1#) (492 . |retractIfCan|) (497 . |factorial|)
              (502 . |iiAiryBiPrime|) (507 . |third|) (512 . |evaluate|)
              (518 . |iiHypergeometricF|) (|List| 10) (523 . |variables|)
              (528 . |member?|) (534 . |exp|) (539 . |retract|) (|List| 66)
              (|Mapping| 66 7) (|ListFunctions2| 7 66) (544 . |map|)
              (550 . |first|) (556 . |rest|) (562 . <=) (568 . ~=)
              (574 . |elt|) (580 . >) (|List| 160) (586 . |rest|)
              (|SExpression|) (592 . |integer|) (|List| 266) (597 . |rest|)
              (603 . |first|) (|OutputForm|) (609 . |bracket|) (614 . |prefix|)
              (620 . |coerce|) (|Mapping| 266 263) (|List| 263)
              (|ListFunctions2| 263 266) (625 . |map|) (631 . |concat|)
              (637 . |display|) (643 . |inv|))
           '#(|whittakerW| 648 |whittakerM| 655 |weierstrassZeta| 662
              |weierstrassSigma| 669 |weierstrassPPrime| 676 |weierstrassP| 683
              |weberE| 690 |struveL| 696 |struveH| 702 |riemannZeta| 708
              |polylog| 713 |polygamma| 719 |operator| 725 |meijerG| 730
              |lommelS2| 739 |lommelS1| 746 |lerchPhi| 753 |legendreQ| 760
              |legendreP| 767 |lambertW| 774 |kummerU| 779 |kummerM| 786
              |kelvinKer| 793 |kelvinKei| 799 |kelvinBer| 805 |kelvinBei| 811
              |jacobiZeta| 817 |jacobiTheta| 823 |jacobiSn| 829 |jacobiDn| 835
              |jacobiCn| 841 |iipolygamma| 847 |iidigamma| 852 |iiabs| 857
              |iiPolylog| 862 |iiHypergeometricF| 868 |iiGamma| 873 |iiBeta|
              878 |iiBesselY| 883 |iiBesselK| 888 |iiBesselJ| 893 |iiBesselI|
              898 |iiAiryBiPrime| 903 |iiAiryBi| 908 |iiAiryAiPrime| 913
              |iiAiryAi| 918 |iAiryBiPrime| 923 |iAiryBi| 928 |iAiryAiPrime|
              933 |iAiryAi| 938 |hypergeometricF| 943 |hankelH2| 950 |hankelH1|
              956 |ellipticPi| 962 |ellipticK| 969 |ellipticF| 974 |ellipticE|
              980 |digamma| 991 |besselY| 996 |besselK| 1002 |besselJ| 1008
              |besselI| 1014 |belong?| 1020 |angerJ| 1025 |airyBiPrime| 1031
              |airyBi| 1036 |airyAiPrime| 1041 |airyAi| 1046 |abs| 1051 |Gamma|
              1056 |Beta| 1067)
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
                                                   68 68 7 73 1 7 9 9 74 0 10 0
                                                   76 1 7 0 10 77 1 7 79 0 80 2
                                                   7 0 85 0 86 2 68 7 0 66 89 2
                                                   7 0 0 10 90 2 7 0 9 70 91 2
                                                   7 0 0 0 92 2 7 0 0 0 93 2 97
                                                   9 9 96 98 2 7 0 0 0 99 2 7 0
                                                   0 0 100 3 9 0 0 10 101 102 0
                                                   7 0 107 1 7 0 0 108 1 7 0 0
                                                   109 2 7 0 0 66 112 0 113 0
                                                   114 1 7 0 0 115 2 7 0 0 0
                                                   118 1 7 0 0 119 0 149 0 150
                                                   2 97 9 9 151 152 2 7 0 0 85
                                                   156 2 97 9 9 158 159 1 10
                                                   160 0 161 1 160 0 70 162 2 9
                                                   0 0 163 164 2 7 60 0 9 170 1
                                                   7 171 0 172 1 173 68 0 174 2
                                                   9 60 0 10 187 2 9 60 0 10
                                                   189 2 7 0 9 0 191 1 7 60 0
                                                   192 2 7 60 0 0 193 1 0 7 7
                                                   194 1 0 7 7 195 1 0 7 7 196
                                                   1 0 7 7 197 1 7 0 0 198 1 7
                                                   0 0 199 2 0 7 7 7 200 1 68 7
                                                   0 201 1 7 202 0 203 1 205
                                                   204 0 206 1 204 207 0 208 1
                                                   205 204 0 209 1 6 0 0 210 1
                                                   7 0 6 211 1 0 7 7 212 1 7
                                                   207 0 213 1 6 0 0 214 1 0 7
                                                   7 215 2 6 0 0 0 216 1 0 7 68
                                                   217 1 6 0 0 218 1 0 7 7 219
                                                   2 6 0 0 0 220 1 0 7 68 221 2
                                                   6 0 0 0 222 1 0 7 68 223 2 6
                                                   0 0 0 224 1 0 7 68 225 2 6 0
                                                   0 0 226 1 0 7 68 227 2 6 0 0
                                                   0 228 1 0 7 68 229 1 6 0 0
                                                   230 1 0 7 7 231 1 6 0 0 232
                                                   1 0 7 7 233 1 6 0 0 234 1 0
                                                   7 7 235 1 6 0 0 236 1 7 237
                                                   0 238 1 66 0 0 239 1 0 7 7
                                                   240 1 68 7 0 241 2 97 9 9
                                                   151 242 1 0 7 68 243 1 7 244
                                                   0 245 2 244 60 10 0 246 1 7
                                                   0 0 247 1 7 66 0 248 2 251
                                                   249 250 68 252 2 68 0 0 64
                                                   253 2 68 0 0 64 254 2 66 60
                                                   0 0 255 2 64 60 0 0 256 2
                                                   249 66 0 66 257 2 66 60 0 0
                                                   258 2 259 0 0 64 260 1 261
                                                   66 0 262 2 263 0 0 64 264 2
                                                   263 0 0 64 265 1 266 0 70
                                                   267 2 266 0 0 70 268 1 10
                                                   266 0 269 2 272 263 270 271
                                                   273 2 263 0 0 0 274 2 9 0 0
                                                   270 275 1 7 0 0 276 3 0 7 7
                                                   7 7 104 3 0 7 7 7 7 95 3 0 7
                                                   7 7 7 57 3 0 7 7 7 7 56 3 0
                                                   7 7 7 7 55 3 0 7 7 7 7 54 2
                                                   0 7 7 7 111 2 0 7 7 7 121 2
                                                   0 7 7 7 117 1 0 7 7 186 2 0
                                                   7 7 7 52 2 0 7 7 7 42 1 0 9
                                                   9 190 5 1 7 68 68 68 68 7 73
                                                   3 0 7 7 7 7 129 3 0 7 7 7 7
                                                   127 3 0 7 7 7 7 184 3 0 7 7
                                                   7 7 137 3 0 7 7 7 7 135 1 0
                                                   7 7 51 3 0 7 7 7 7 133 3 0 7
                                                   7 7 7 131 2 0 7 7 7 144 2 0
                                                   7 7 7 143 2 0 7 7 7 140 2 0
                                                   7 7 7 139 2 0 7 7 7 180 2 0
                                                   7 7 7 182 2 0 7 7 7 169 2 0
                                                   7 7 7 176 2 0 7 7 7 175 1 0
                                                   7 68 221 1 0 7 7 219 1 0 7 7
                                                   212 2 0 7 7 7 200 1 0 7 68
                                                   243 1 0 7 7 215 1 0 7 68 217
                                                   1 0 7 68 225 1 0 7 68 229 1
                                                   0 7 68 223 1 0 7 68 227 1 0
                                                   7 7 240 1 0 7 7 235 1 0 7 7
                                                   233 1 0 7 7 231 1 0 7 7 197
                                                   1 0 7 7 196 1 0 7 7 195 1 0
                                                   7 7 194 3 1 7 68 68 7 72 2 0
                                                   7 7 7 125 2 0 7 7 7 123 3 0
                                                   7 7 7 7 167 1 0 7 7 147 2 0
                                                   7 7 7 157 1 0 7 7 148 2 0 7
                                                   7 7 155 1 0 7 7 41 2 0 7 7 7
                                                   44 2 0 7 7 7 46 2 0 7 7 7 43
                                                   2 0 7 7 7 45 1 0 60 9 188 2
                                                   0 7 7 7 106 1 0 7 7 50 1 0 7
                                                   7 49 1 0 7 7 48 1 0 7 7 47 1
                                                   0 7 7 36 1 0 7 7 37 2 0 7 7
                                                   7 39 2 0 7 7 7 40)))))
           '|lookupComplete|)) 
