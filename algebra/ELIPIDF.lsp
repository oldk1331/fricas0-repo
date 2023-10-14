
(/VERSIONCHECK 2) 

(DEFUN |ELIPIDF;rabs| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 36))) 

(DEFUN |ELIPIDF;ellipticRC;3Df;2| (|x| |y| $)
  (PROG (Q |mu| |lambda| #1=#:G113 S0 S1 |sn2| |sn| |mu_inv|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mu| (|mul_DF| (QREFELT $ 7) (|add_DF| (|add_DF| |x| |y|) |y|))
              . #2=(|ELIPIDF;ellipticRC;3Df;2|))
        (LETT Q (|mul_DF| (QREFELT $ 16) (FLOAT-SIGN 1.0 (|sub_DF| |mu| |x|)))
              . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((|less_DF| Q (FLOAT-SIGN 1.0 |mu|))
                  (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|) . #2#)
                       (LETT |sn| (|mul_DF| |mu_inv| (|sub_DF| |y| |mu|))
                             . #2#)
                       (LETT |sn2| (|mul_DF| |sn| |sn|) . #2#)
                       (LETT S1
                             (|add_DF| (QREFELT $ 11)
                                       (|mul_DF| |sn2|
                                                 (|add_DF| (QREFELT $ 13)
                                                           (|mul_DF| |sn2|
                                                                     (QREFELT $
                                                                              15)))))
                             . #2#)
                       (LETT S0
                             (|add_DF| (QREFELT $ 10)
                                       (|mul_DF| |sn2|
                                                 (|add_DF| (QREFELT $ 12)
                                                           (|mul_DF| |sn2|
                                                                     (QREFELT $
                                                                              14)))))
                             . #2#)
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (|mul_DF| (|qsqrt_DF| |mu_inv|)
                                         (|add_DF| 1.0
                                                   (|mul_DF| |sn2|
                                                             (|add_DF| S0
                                                                       (|mul_DF|
                                                                        |sn|
                                                                        S1)))))
                               . #2#)
                         (GO #1#)))))
                 ('T
                  (SEQ
                   (LETT |lambda|
                         (|add_DF|
                          (|mul_DF|
                           (|mul_DF| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                     (|qsqrt_DF| |x|))
                           (|qsqrt_DF| |y|))
                          |y|)
                         . #2#)
                   (LETT |x| (|mul_DF| (QREFELT $ 8) (|add_DF| |x| |lambda|))
                         . #2#)
                   (LETT |y| (|mul_DF| (QREFELT $ 8) (|add_DF| |y| |lambda|))
                         . #2#)
                   (LETT |mu| (|mul_DF| (QREFELT $ 8) (|add_DF| |mu| |lambda|))
                         . #2#)
                   (EXIT (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticRF;4Df;3| (|x| |y| |z| $)
  (PROG (Q |mu| |lambda| |znroot| |ynroot| |xnroot| #1=#:G119 |s| |e3| |e2|
         |zndev| |yndev| |xndev| |mu_inv| |zadev| |yadev| |xadev|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mu| (|mul_DF| (QREFELT $ 7) (|add_DF| (|add_DF| |x| |y|) |z|))
              . #2=(|ELIPIDF;ellipticRF;4Df;3|))
        (LETT |xadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |x|)) . #2#)
        (LETT |yadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |y|)) . #2#)
        (LETT |zadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |z|)) . #2#)
        (LETT Q
              (|mul_DF| (QREFELT $ 21)
                        (|max_DF| |xadev| (|max_DF| |yadev| |zadev|)))
              . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((|less_DF| Q (FLOAT-SIGN 1.0 |mu|))
                  (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|) . #2#)
                       (LETT |xndev| (|mul_DF| (|sub_DF| |mu| |x|) |mu_inv|)
                             . #2#)
                       (LETT |yndev| (|mul_DF| (|sub_DF| |mu| |y|) |mu_inv|)
                             . #2#)
                       (LETT |zndev| (|mul_DF| (|sub_DF| |mu| |z|) |mu_inv|)
                             . #2#)
                       (LETT |e2|
                             (|sub_DF| (|mul_DF| |xndev| |yndev|)
                                       (|mul_DF| |zndev| |zndev|))
                             . #2#)
                       (LETT |e3| (|mul_DF| (|mul_DF| |xndev| |yndev|) |zndev|)
                             . #2#)
                       (LETT |s|
                             (|add_DF|
                              (|add_DF| 1.0
                                        (|mul_DF|
                                         (|sub_DF|
                                          (|sub_DF|
                                           (|mul_DF| (QREFELT $ 17) |e2|)
                                           (QREFELT $ 18))
                                          (|mul_DF| (QREFELT $ 11) |e3|))
                                         |e2|))
                              (|mul_DF| (QREFELT $ 20) |e3|))
                             . #2#)
                       (EXIT
                        (PROGN
                         (LETT #1# (|mul_DF| |s| (|qsqrt_DF| |mu_inv|)) . #2#)
                         (GO #1#)))))
                 ('T
                  (SEQ (LETT |xnroot| (|qsqrt_DF| |x|) . #2#)
                       (LETT |ynroot| (|qsqrt_DF| |y|) . #2#)
                       (LETT |znroot| (|qsqrt_DF| |z|) . #2#)
                       (LETT |lambda|
                             (|add_DF|
                              (|mul_DF| |xnroot| (|add_DF| |ynroot| |znroot|))
                              (|mul_DF| |ynroot| |znroot|))
                             . #2#)
                       (LETT |x|
                             (|mul_DF| (QREFELT $ 8) (|add_DF| |x| |lambda|))
                             . #2#)
                       (LETT |y|
                             (|mul_DF| (QREFELT $ 8) (|add_DF| |y| |lambda|))
                             . #2#)
                       (LETT |z|
                             (|mul_DF| (QREFELT $ 8) (|add_DF| |z| |lambda|))
                             . #2#)
                       (LETT |mu|
                             (|mul_DF| (QREFELT $ 8) (|add_DF| |mu| |lambda|))
                             . #2#)
                       (EXIT (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticRD;4Df;4| (|x| |y| |z| $)
  (PROG (Q |mu| |power4| |sigma| |lambda| |znroot| |ynroot| |xnroot| #1=#:G125
         |ss| |s2| |s1| |ef| |ed| |ec| |eb| |ea| |zndev| |yndev| |xndev|
         |mu_inv| |zadev| |yadev| |xadev|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |sigma| 0.0 . #2=(|ELIPIDF;ellipticRD;4Df;4|))
            (LETT |power4| 1.0 . #2#)
            (LETT |mu|
                  (|mul_DF| (QREFELT $ 9)
                            (|add_DF| (|add_DF| |x| |y|)
                                      (|mul_DF|
                                       (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                       |z|)))
                  . #2#)
            (LETT |xadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |x|)) . #2#)
            (LETT |yadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |y|)) . #2#)
            (LETT |zadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |z|)) . #2#)
            (LETT Q
                  (|mul_DF| (QREFELT $ 27)
                            (|max_DF| |xadev| (|max_DF| |yadev| |zadev|)))
                  . #2#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|less_DF| Q (FLOAT-SIGN 1.0 |mu|))
                      (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|) . #2#)
                           (LETT |xndev|
                                 (|mul_DF| (|sub_DF| |mu| |x|) |mu_inv|) . #2#)
                           (LETT |yndev|
                                 (|mul_DF| (|sub_DF| |mu| |y|) |mu_inv|) . #2#)
                           (LETT |zndev|
                                 (|mul_DF| (|sub_DF| |mu| |z|) |mu_inv|) . #2#)
                           (LETT |ea| (|mul_DF| |xndev| |yndev|) . #2#)
                           (LETT |eb| (|mul_DF| |zndev| |zndev|) . #2#)
                           (LETT |ec| (|sub_DF| |ea| |eb|) . #2#)
                           (LETT |ed|
                                 (|sub_DF| |ea|
                                           (|mul_DF|
                                            (FLOAT 6
                                                   MOST-POSITIVE-DOUBLE-FLOAT)
                                            |eb|))
                                 . #2#)
                           (LETT |ef| (|add_DF| (|add_DF| |ed| |ec|) |ec|)
                                 . #2#)
                           (LETT |s1|
                                 (|mul_DF| |ed|
                                           (|sub_DF|
                                            (|add_DF| (QREFELT $ 22)
                                                      (|mul_DF|
                                                       (|mul_DF| (QREFELT $ 8)
                                                                 (QREFELT $
                                                                          24))
                                                       |ed|))
                                            (|mul_DF|
                                             (|mul_DF|
                                              (|mul_DF| (QREFELT $ 26)
                                                        (QREFELT $ 25))
                                              |zndev|)
                                             |ef|)))
                                 . #2#)
                           (LETT |s2|
                                 (|mul_DF| |zndev|
                                           (|add_DF|
                                            (|mul_DF| (QREFELT $ 23) |ef|)
                                            (|mul_DF| |zndev|
                                                      (|add_DF|
                                                       (|minus_DF|
                                                        (|mul_DF|
                                                         (QREFELT $ 24) |ec|))
                                                       (|mul_DF|
                                                        (|mul_DF| |zndev|
                                                                  (QREFELT $
                                                                           25))
                                                        |ea|)))))
                                 . #2#)
                           (LETT |ss|
                                 (|mul_DF|
                                  (|mul_DF| (|add_DF| 1.0 (|add_DF| |s1| |s2|))
                                            |mu_inv|)
                                  (|qsqrt_DF| |mu_inv|))
                                 . #2#)
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (|add_DF|
                                    (|mul_DF|
                                     (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                     |sigma|)
                                    (|mul_DF| |power4| |ss|))
                                   . #2#)
                             (GO #1#)))))
                     ('T
                      (SEQ (LETT |xnroot| (|qsqrt_DF| |x|) . #2#)
                           (LETT |ynroot| (|qsqrt_DF| |y|) . #2#)
                           (LETT |znroot| (|qsqrt_DF| |z|) . #2#)
                           (LETT |lambda|
                                 (|add_DF|
                                  (|mul_DF| |xnroot|
                                            (|add_DF| |ynroot| |znroot|))
                                  (|mul_DF| |ynroot| |znroot|))
                                 . #2#)
                           (LETT |sigma|
                                 (|add_DF| |sigma|
                                           (|div_DF| |power4|
                                                     (|mul_DF| |znroot|
                                                               (|add_DF| |z|
                                                                         |lambda|))))
                                 . #2#)
                           (LETT |power4| (|mul_DF| (QREFELT $ 8) |power4|)
                                 . #2#)
                           (LETT |x|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |x| |lambda|))
                                 . #2#)
                           (LETT |y|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |y| |lambda|))
                                 . #2#)
                           (LETT |z|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |z| |lambda|))
                                 . #2#)
                           (LETT |mu|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |mu| |lambda|))
                                 . #2#)
                           (EXIT
                            (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticRJ;5Df;5| (|x| |y| |z| |p| $)
  (PROG (Q |mu| |power4| |sigma| |beta| |alfa| |lambda| |znroot| |ynroot|
         |xnroot| #1=#:G131 |ss| |s3| |s2| |s1| |e3| |e2| |ec| |eb| |ea|
         |pndev| |zndev| |yndev| |xndev| |mu_inv| |padev| |zadev| |yadev|
         |xadev|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |sigma| 0.0 . #2=(|ELIPIDF;ellipticRJ;5Df;5|))
            (LETT |power4| 1.0 . #2#)
            (LETT |mu|
                  (|mul_DF| (QREFELT $ 9)
                            (|add_DF|
                             (|add_DF| (|add_DF| (|add_DF| |x| |y|) |z|) |p|)
                             |p|))
                  . #2#)
            (LETT |xadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |x|)) . #2#)
            (LETT |yadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |y|)) . #2#)
            (LETT |zadev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |z|)) . #2#)
            (LETT |padev| (FLOAT-SIGN 1.0 (|sub_DF| |mu| |p|)) . #2#)
            (LETT Q
                  (|mul_DF| (QREFELT $ 27)
                            (|max_DF| (|max_DF| |xadev| |yadev|)
                                      (|max_DF| |zadev| |padev|)))
                  . #2#)
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|less_DF| Q (FLOAT-SIGN 1.0 |mu|))
                      (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|) . #2#)
                           (LETT |xndev|
                                 (|mul_DF| (|sub_DF| |mu| |x|) |mu_inv|) . #2#)
                           (LETT |yndev|
                                 (|mul_DF| (|sub_DF| |mu| |y|) |mu_inv|) . #2#)
                           (LETT |zndev|
                                 (|mul_DF| (|sub_DF| |mu| |z|) |mu_inv|) . #2#)
                           (LETT |pndev|
                                 (|mul_DF| (|sub_DF| |mu| |p|) |mu_inv|) . #2#)
                           (LETT |ea|
                                 (|add_DF|
                                  (|mul_DF| |xndev| (|add_DF| |yndev| |zndev|))
                                  (|mul_DF| |yndev| |zndev|))
                                 . #2#)
                           (LETT |eb|
                                 (|mul_DF| (|mul_DF| |xndev| |yndev|) |zndev|)
                                 . #2#)
                           (LETT |ec| (|mul_DF| |pndev| |pndev|) . #2#)
                           (LETT |e2|
                                 (|sub_DF| |ea|
                                           (|mul_DF|
                                            (FLOAT 3
                                                   MOST-POSITIVE-DOUBLE-FLOAT)
                                            |ec|))
                                 . #2#)
                           (LETT |e3|
                                 (|add_DF| |eb|
                                           (|mul_DF|
                                            (|mul_DF|
                                             (FLOAT 2
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |pndev|)
                                            (|sub_DF| |ea| |ec|)))
                                 . #2#)
                           (LETT |s1|
                                 (|mul_DF| |e2|
                                           (|sub_DF|
                                            (|add_DF|
                                             (|minus_DF| (QREFELT $ 28))
                                             (|mul_DF| (QREFELT $ 31) |e2|))
                                            (|mul_DF| (QREFELT $ 32) |e3|)))
                                 . #2#)
                           (LETT |s2|
                                 (|mul_DF| |eb|
                                           (|add_DF|
                                            (|mul_DF| (QREFELT $ 6)
                                                      (QREFELT $ 7))
                                            (|mul_DF| |pndev|
                                                      (|add_DF|
                                                       (|minus_DF|
                                                        (|add_DF|
                                                         (QREFELT $ 29)
                                                         (QREFELT $ 29)))
                                                       (|mul_DF| |pndev|
                                                                 (QREFELT $
                                                                          30))))))
                                 . #2#)
                           (LETT |s3|
                                 (|sub_DF|
                                  (|mul_DF| (|mul_DF| |pndev| |ea|)
                                            (|sub_DF| (QREFELT $ 7)
                                                      (|mul_DF| |pndev|
                                                                (QREFELT $
                                                                         29))))
                                  (|mul_DF| (|mul_DF| (QREFELT $ 7) |pndev|)
                                            |ec|))
                                 . #2#)
                           (LETT |ss|
                                 (|mul_DF|
                                  (|mul_DF|
                                   (|add_DF| 1.0
                                             (|add_DF| (|add_DF| |s1| |s2|)
                                                       |s3|))
                                   |mu_inv|)
                                  (|qsqrt_DF| |mu_inv|))
                                 . #2#)
                           (EXIT
                            (PROGN
                             (LETT #1#
                                   (|add_DF|
                                    (|mul_DF|
                                     (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                     |sigma|)
                                    (|mul_DF| |power4| |ss|))
                                   . #2#)
                             (GO #1#)))))
                     ('T
                      (SEQ (LETT |xnroot| (|qsqrt_DF| |x|) . #2#)
                           (LETT |ynroot| (|qsqrt_DF| |y|) . #2#)
                           (LETT |znroot| (|qsqrt_DF| |z|) . #2#)
                           (LETT |lambda|
                                 (|add_DF|
                                  (|mul_DF| |xnroot|
                                            (|add_DF| |ynroot| |znroot|))
                                  (|mul_DF| |ynroot| |znroot|))
                                 . #2#)
                           (LETT |alfa|
                                 (|add_DF|
                                  (|mul_DF| |p|
                                            (|add_DF|
                                             (|add_DF| |xnroot| |ynroot|)
                                             |znroot|))
                                  (|mul_DF| (|mul_DF| |xnroot| |ynroot|)
                                            |znroot|))
                                 . #2#)
                           (LETT |alfa| (|mul_DF| |alfa| |alfa|) . #2#)
                           (LETT |beta|
                                 (|mul_DF|
                                  (|mul_DF| |p| (|add_DF| |p| |lambda|))
                                  (|add_DF| |p| |lambda|))
                                 . #2#)
                           (LETT |sigma|
                                 (|add_DF| |sigma|
                                           (|mul_DF| |power4|
                                                     (SPADCALL |alfa| |beta|
                                                               (QREFELT $
                                                                        39))))
                                 . #2#)
                           (LETT |power4| (|mul_DF| (QREFELT $ 8) |power4|)
                                 . #2#)
                           (LETT |x|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |x| |lambda|))
                                 . #2#)
                           (LETT |y|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |y| |lambda|))
                                 . #2#)
                           (LETT |z|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |z| |lambda|))
                                 . #2#)
                           (LETT |p|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |p| |lambda|))
                                 . #2#)
                           (LETT |mu|
                                 (|mul_DF| (QREFELT $ 8)
                                           (|add_DF| |mu| |lambda|))
                                 . #2#)
                           (EXIT
                            (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticF;3Df;6| (|z| |m| $)
  (|mul_DF| |z|
            (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                      (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
                      (QREFELT $ 40)))) 

(DEFUN |ELIPIDF;ellipticK;2Df;7| (|m| $)
  (SPADCALL 0.0 (|sub_DF| 1.0 |m|) 1.0 (QREFELT $ 40))) 

(DEFUN |ELIPIDF;ellipticE;3Df;8| (|z| |m| $)
  (|sub_DF|
   (|mul_DF| |z|
             (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                       (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
                       (QREFELT $ 40)))
   (|mul_DF|
    (|mul_DF|
     (|mul_DF|
      (|mul_DF| (|div_DF| |m| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)) |z|) |z|)
     |z|)
    (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
              (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
              (QREFELT $ 41))))) 

(DEFUN |ELIPIDF;ellipticE;2Df;9| (|m| $)
  (|sub_DF| (SPADCALL 0.0 (|sub_DF| 1.0 |m|) 1.0 (QREFELT $ 40))
            (|mul_DF| (|div_DF| |m| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT))
                      (SPADCALL 0.0 (|sub_DF| 1.0 |m|) 1.0 (QREFELT $ 41))))) 

(DEFUN |ELIPIDF;ellipticPi;4Df;10| (|z| |n| |m| $)
  (|add_DF|
   (|mul_DF| |z|
             (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                       (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
                       (QREFELT $ 40)))
   (|mul_DF|
    (|mul_DF|
     (|mul_DF|
      (|mul_DF| (|div_DF| |n| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)) |z|) |z|)
     |z|)
    (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
              (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
              (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |n| |z|) |z|))
              (QREFELT $ 42))))) 

(DEFUN |ELIPIDF;ellipticRC;3C;11| (|x| |y| $)
  (PROG (Q |mu| |lambda| #1=#:G142 S0 S1 |sn2| |sn| |mu_inv|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mu|
              (SPADCALL (QREFELT $ 7)
                        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 48)) |y|
                                  (QREFELT $ 48))
                        (QREFELT $ 49))
              . #2=(|ELIPIDF;ellipticRC;3C;11|))
        (LETT Q
              (|mul_DF| (QREFELT $ 16)
                        (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT $ 50)) $))
              . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((|less_DF| Q (|ELIPIDF;rabs| |mu| $))
                  (SEQ
                   (LETT |mu_inv|
                         (SPADCALL (|spadConstant| $ 51) |mu| (QREFELT $ 52))
                         . #2#)
                   (LETT |sn|
                         (SPADCALL |mu_inv| (SPADCALL |y| |mu| (QREFELT $ 50))
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |sn2| (SPADCALL |sn| |sn| (QREFELT $ 53)) . #2#)
                   (LETT S1
                         (SPADCALL (SPADCALL (QREFELT $ 11) (QREFELT $ 54))
                                   (SPADCALL |sn2|
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 13)
                                                        (QREFELT $ 54))
                                              (SPADCALL |sn2|
                                                        (SPADCALL
                                                         (QREFELT $ 15)
                                                         (QREFELT $ 54))
                                                        (QREFELT $ 53))
                                              (QREFELT $ 48))
                                             (QREFELT $ 53))
                                   (QREFELT $ 48))
                         . #2#)
                   (LETT S0
                         (SPADCALL (SPADCALL (QREFELT $ 10) (QREFELT $ 54))
                                   (SPADCALL |sn2|
                                             (SPADCALL
                                              (SPADCALL (QREFELT $ 12)
                                                        (QREFELT $ 54))
                                              (SPADCALL |sn2|
                                                        (SPADCALL
                                                         (QREFELT $ 14)
                                                         (QREFELT $ 54))
                                                        (QREFELT $ 53))
                                              (QREFELT $ 48))
                                             (QREFELT $ 53))
                                   (QREFELT $ 48))
                         . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL (SPADCALL |mu_inv| (QREFELT $ 55))
                                     (SPADCALL (|spadConstant| $ 51)
                                               (SPADCALL |sn2|
                                                         (SPADCALL S0
                                                                   (SPADCALL
                                                                    |sn| S1
                                                                    (QREFELT $
                                                                             53))
                                                                   (QREFELT $
                                                                            48))
                                                         (QREFELT $ 53))
                                               (QREFELT $ 48))
                                     (QREFELT $ 53))
                           . #2#)
                     (GO #1#)))))
                 ('T
                  (SEQ
                   (LETT |lambda|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 (QREFELT $ 57))
                                     (SPADCALL |x| (QREFELT $ 55))
                                     (QREFELT $ 53))
                           (SPADCALL |y| (QREFELT $ 55)) (QREFELT $ 53))
                          |y| (QREFELT $ 48))
                         . #2#)
                   (LETT |x|
                         (SPADCALL (QREFELT $ 8)
                                   (SPADCALL |x| |lambda| (QREFELT $ 48))
                                   (QREFELT $ 49))
                         . #2#)
                   (LETT |y|
                         (SPADCALL (QREFELT $ 8)
                                   (SPADCALL |y| |lambda| (QREFELT $ 48))
                                   (QREFELT $ 49))
                         . #2#)
                   (LETT |mu|
                         (SPADCALL (QREFELT $ 8)
                                   (SPADCALL |mu| |lambda| (QREFELT $ 48))
                                   (QREFELT $ 49))
                         . #2#)
                   (EXIT (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticRF;4C;12| (|x| |y| |z| $)
  (PROG (Q |mu| |lambda| |znroot| |ynroot| |xnroot| #1=#:G148 |s| |e3| |e2|
         |zndev| |yndev| |xndev| |mu_inv| |zadev| |yadev| |xadev|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |mu|
              (SPADCALL (QREFELT $ 7)
                        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 48)) |z|
                                  (QREFELT $ 48))
                        (QREFELT $ 49))
              . #2=(|ELIPIDF;ellipticRF;4C;12|))
        (LETT |xadev| (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT $ 50)) $)
              . #2#)
        (LETT |yadev| (|ELIPIDF;rabs| (SPADCALL |mu| |y| (QREFELT $ 50)) $)
              . #2#)
        (LETT |zadev| (|ELIPIDF;rabs| (SPADCALL |mu| |z| (QREFELT $ 50)) $)
              . #2#)
        (LETT Q
              (|mul_DF| (QREFELT $ 21)
                        (|max_DF| |xadev| (|max_DF| |yadev| |zadev|)))
              . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((|less_DF| Q (|ELIPIDF;rabs| |mu| $))
                  (SEQ
                   (LETT |mu_inv|
                         (SPADCALL (|spadConstant| $ 51) |mu| (QREFELT $ 52))
                         . #2#)
                   (LETT |xndev|
                         (SPADCALL (SPADCALL |mu| |x| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |yndev|
                         (SPADCALL (SPADCALL |mu| |y| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |zndev|
                         (SPADCALL (SPADCALL |mu| |z| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |e2|
                         (SPADCALL (SPADCALL |xndev| |yndev| (QREFELT $ 53))
                                   (SPADCALL |zndev| |zndev| (QREFELT $ 53))
                                   (QREFELT $ 50))
                         . #2#)
                   (LETT |e3|
                         (SPADCALL (SPADCALL |xndev| |yndev| (QREFELT $ 53))
                                   |zndev| (QREFELT $ 53))
                         . #2#)
                   (LETT |s|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 51)
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QREFELT $ 17) |e2|
                                                 (QREFELT $ 49))
                                       (SPADCALL (QREFELT $ 18) (QREFELT $ 54))
                                       (QREFELT $ 50))
                                      (SPADCALL (QREFELT $ 11) |e3|
                                                (QREFELT $ 49))
                                      (QREFELT $ 50))
                                     |e2| (QREFELT $ 53))
                                    (QREFELT $ 48))
                          (SPADCALL (QREFELT $ 20) |e3| (QREFELT $ 49))
                          (QREFELT $ 48))
                         . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL |s| (SPADCALL |mu_inv| (QREFELT $ 55))
                                     (QREFELT $ 53))
                           . #2#)
                     (GO #1#)))))
                 ('T
                  (SEQ (LETT |xnroot| (SPADCALL |x| (QREFELT $ 55)) . #2#)
                       (LETT |ynroot| (SPADCALL |y| (QREFELT $ 55)) . #2#)
                       (LETT |znroot| (SPADCALL |z| (QREFELT $ 55)) . #2#)
                       (LETT |lambda|
                             (SPADCALL
                              (SPADCALL |xnroot|
                                        (SPADCALL |ynroot| |znroot|
                                                  (QREFELT $ 48))
                                        (QREFELT $ 53))
                              (SPADCALL |ynroot| |znroot| (QREFELT $ 53))
                              (QREFELT $ 48))
                             . #2#)
                       (LETT |x|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |x| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |y|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |y| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |z|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |z| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |mu|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |mu| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (EXIT (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticRD;4C;13| (|x| |y| |z| $)
  (PROG (Q |mu| |power4| |sigma| |lambda| |znroot| |ynroot| |xnroot| #1=#:G154
         |ss| |s2| |s1| |ef| |ed| |ec| |eb| |ea| |zndev| |yndev| |xndev|
         |mu_inv| |zadev| |yadev| |xadev|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |sigma| (|spadConstant| $ 60) . #2=(|ELIPIDF;ellipticRD;4C;13|))
        (LETT |power4| (|spadConstant| $ 51) . #2#)
        (LETT |mu|
              (SPADCALL (QREFELT $ 9)
                        (SPADCALL (SPADCALL |x| |y| (QREFELT $ 48))
                                  (SPADCALL (SPADCALL 3 (QREFELT $ 57)) |z|
                                            (QREFELT $ 53))
                                  (QREFELT $ 48))
                        (QREFELT $ 49))
              . #2#)
        (LETT |xadev| (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT $ 50)) $)
              . #2#)
        (LETT |yadev| (|ELIPIDF;rabs| (SPADCALL |mu| |y| (QREFELT $ 50)) $)
              . #2#)
        (LETT |zadev| (|ELIPIDF;rabs| (SPADCALL |mu| |z| (QREFELT $ 50)) $)
              . #2#)
        (LETT Q
              (|mul_DF| (QREFELT $ 27)
                        (|max_DF| |xadev| (|max_DF| |yadev| |zadev|)))
              . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((|less_DF| Q (|ELIPIDF;rabs| |mu| $))
                  (SEQ
                   (LETT |mu_inv|
                         (SPADCALL (|spadConstant| $ 51) |mu| (QREFELT $ 52))
                         . #2#)
                   (LETT |xndev|
                         (SPADCALL (SPADCALL |mu| |x| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |yndev|
                         (SPADCALL (SPADCALL |mu| |y| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |zndev|
                         (SPADCALL (SPADCALL |mu| |z| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |ea| (SPADCALL |xndev| |yndev| (QREFELT $ 53)) . #2#)
                   (LETT |eb| (SPADCALL |zndev| |zndev| (QREFELT $ 53)) . #2#)
                   (LETT |ec| (SPADCALL |ea| |eb| (QREFELT $ 50)) . #2#)
                   (LETT |ed|
                         (SPADCALL |ea|
                                   (SPADCALL
                                    (FLOAT 6 MOST-POSITIVE-DOUBLE-FLOAT) |eb|
                                    (QREFELT $ 49))
                                   (QREFELT $ 50))
                         . #2#)
                   (LETT |ef|
                         (SPADCALL (SPADCALL |ed| |ec| (QREFELT $ 48)) |ec|
                                   (QREFELT $ 48))
                         . #2#)
                   (LETT |s1|
                         (SPADCALL |ed|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 22) (QREFELT $ 54))
                                     (SPADCALL
                                      (|mul_DF| (QREFELT $ 8) (QREFELT $ 24))
                                      |ed| (QREFELT $ 49))
                                     (QREFELT $ 48))
                                    (SPADCALL
                                     (SPADCALL
                                      (|mul_DF| (QREFELT $ 26) (QREFELT $ 25))
                                      |zndev| (QREFELT $ 49))
                                     |ef| (QREFELT $ 53))
                                    (QREFELT $ 50))
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |s2|
                         (SPADCALL |zndev|
                                   (SPADCALL
                                    (SPADCALL (QREFELT $ 23) |ef|
                                              (QREFELT $ 49))
                                    (SPADCALL |zndev|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (QREFELT $ 24) |ec|
                                                          (QREFELT $ 49))
                                                (QREFELT $ 61))
                                               (SPADCALL
                                                (SPADCALL |zndev|
                                                          (QREFELT $ 25)
                                                          (QREFELT $ 62))
                                                |ea| (QREFELT $ 53))
                                               (QREFELT $ 48))
                                              (QREFELT $ 53))
                                    (QREFELT $ 48))
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |ss|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 51)
                                     (SPADCALL |s1| |s2| (QREFELT $ 48))
                                     (QREFELT $ 48))
                           |mu_inv| (QREFELT $ 53))
                          (SPADCALL |mu_inv| (QREFELT $ 55)) (QREFELT $ 53))
                         . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                      |sigma| (QREFELT $ 49))
                            (SPADCALL |power4| |ss| (QREFELT $ 53))
                            (QREFELT $ 48))
                           . #2#)
                     (GO #1#)))))
                 ('T
                  (SEQ (LETT |xnroot| (SPADCALL |x| (QREFELT $ 55)) . #2#)
                       (LETT |ynroot| (SPADCALL |y| (QREFELT $ 55)) . #2#)
                       (LETT |znroot| (SPADCALL |z| (QREFELT $ 55)) . #2#)
                       (LETT |lambda|
                             (SPADCALL
                              (SPADCALL |xnroot|
                                        (SPADCALL |ynroot| |znroot|
                                                  (QREFELT $ 48))
                                        (QREFELT $ 53))
                              (SPADCALL |ynroot| |znroot| (QREFELT $ 53))
                              (QREFELT $ 48))
                             . #2#)
                       (LETT |sigma|
                             (SPADCALL |sigma|
                                       (SPADCALL |power4|
                                                 (SPADCALL |znroot|
                                                           (SPADCALL |z|
                                                                     |lambda|
                                                                     (QREFELT $
                                                                              48))
                                                           (QREFELT $ 53))
                                                 (QREFELT $ 52))
                                       (QREFELT $ 48))
                             . #2#)
                       (LETT |power4|
                             (SPADCALL (QREFELT $ 8) |power4| (QREFELT $ 49))
                             . #2#)
                       (LETT |x|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |x| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |y|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |y| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |z|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |z| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |mu|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |mu| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (EXIT (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticRJ;5C;14| (|x| |y| |z| |p| $)
  (PROG (Q |mu| |power4| |sigma| |beta| |alfa| |lambda| |znroot| |ynroot|
         |xnroot| #1=#:G160 |ss| |s3| |s2| |s1| |e3| |e2| |ec| |eb| |ea|
         |pndev| |zndev| |yndev| |xndev| |mu_inv| |padev| |zadev| |yadev|
         |xadev|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |sigma| (|spadConstant| $ 60) . #2=(|ELIPIDF;ellipticRJ;5C;14|))
        (LETT |power4| (|spadConstant| $ 51) . #2#)
        (LETT |mu|
              (SPADCALL (QREFELT $ 9)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| |y| (QREFELT $ 48)) |z|
                                    (QREFELT $ 48))
                          |p| (QREFELT $ 48))
                         |p| (QREFELT $ 48))
                        (QREFELT $ 49))
              . #2#)
        (LETT |xadev| (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT $ 50)) $)
              . #2#)
        (LETT |yadev| (|ELIPIDF;rabs| (SPADCALL |mu| |y| (QREFELT $ 50)) $)
              . #2#)
        (LETT |zadev| (|ELIPIDF;rabs| (SPADCALL |mu| |z| (QREFELT $ 50)) $)
              . #2#)
        (LETT |padev| (|ELIPIDF;rabs| (SPADCALL |mu| |p| (QREFELT $ 50)) $)
              . #2#)
        (LETT Q
              (|mul_DF| (QREFELT $ 27)
                        (|max_DF| (|max_DF| |xadev| |yadev|)
                                  (|max_DF| |zadev| |padev|)))
              . #2#)
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (EXIT
                (COND
                 ((|less_DF| Q (|ELIPIDF;rabs| |mu| $))
                  (SEQ
                   (LETT |mu_inv|
                         (SPADCALL (|spadConstant| $ 51) |mu| (QREFELT $ 52))
                         . #2#)
                   (LETT |xndev|
                         (SPADCALL (SPADCALL |mu| |x| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |yndev|
                         (SPADCALL (SPADCALL |mu| |y| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |zndev|
                         (SPADCALL (SPADCALL |mu| |z| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |pndev|
                         (SPADCALL (SPADCALL |mu| |p| (QREFELT $ 50)) |mu_inv|
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |ea|
                         (SPADCALL
                          (SPADCALL |xndev|
                                    (SPADCALL |yndev| |zndev| (QREFELT $ 48))
                                    (QREFELT $ 53))
                          (SPADCALL |yndev| |zndev| (QREFELT $ 53))
                          (QREFELT $ 48))
                         . #2#)
                   (LETT |eb|
                         (SPADCALL (SPADCALL |xndev| |yndev| (QREFELT $ 53))
                                   |zndev| (QREFELT $ 53))
                         . #2#)
                   (LETT |ec| (SPADCALL |pndev| |pndev| (QREFELT $ 53)) . #2#)
                   (LETT |e2|
                         (SPADCALL |ea|
                                   (SPADCALL
                                    (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT) |ec|
                                    (QREFELT $ 49))
                                   (QREFELT $ 50))
                         . #2#)
                   (LETT |e3|
                         (SPADCALL |eb|
                                   (SPADCALL
                                    (SPADCALL
                                     (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                     |pndev| (QREFELT $ 49))
                                    (SPADCALL |ea| |ec| (QREFELT $ 50))
                                    (QREFELT $ 53))
                                   (QREFELT $ 48))
                         . #2#)
                   (LETT |s1|
                         (SPADCALL |e2|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (QREFELT $ 28) (QREFELT $ 54))
                                      (QREFELT $ 61))
                                     (SPADCALL (QREFELT $ 31) |e2|
                                               (QREFELT $ 49))
                                     (QREFELT $ 48))
                                    (SPADCALL (QREFELT $ 32) |e3|
                                              (QREFELT $ 49))
                                    (QREFELT $ 50))
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |s2|
                         (SPADCALL |eb|
                                   (SPADCALL
                                    (SPADCALL (QREFELT $ 6)
                                              (SPADCALL (QREFELT $ 7)
                                                        (QREFELT $ 54))
                                              (QREFELT $ 49))
                                    (SPADCALL |pndev|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (|add_DF| (QREFELT $ 29)
                                                           (QREFELT $ 29))
                                                 (QREFELT $ 54))
                                                (QREFELT $ 61))
                                               (SPADCALL |pndev| (QREFELT $ 30)
                                                         (QREFELT $ 62))
                                               (QREFELT $ 48))
                                              (QREFELT $ 53))
                                    (QREFELT $ 48))
                                   (QREFELT $ 53))
                         . #2#)
                   (LETT |s3|
                         (SPADCALL
                          (SPADCALL (SPADCALL |pndev| |ea| (QREFELT $ 53))
                                    (SPADCALL
                                     (SPADCALL (QREFELT $ 7) (QREFELT $ 54))
                                     (SPADCALL |pndev| (QREFELT $ 29)
                                               (QREFELT $ 62))
                                     (QREFELT $ 50))
                                    (QREFELT $ 53))
                          (SPADCALL
                           (SPADCALL (QREFELT $ 7) |pndev| (QREFELT $ 49)) |ec|
                           (QREFELT $ 53))
                          (QREFELT $ 50))
                         . #2#)
                   (LETT |ss|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 51)
                                     (SPADCALL
                                      (SPADCALL |s1| |s2| (QREFELT $ 48)) |s3|
                                      (QREFELT $ 48))
                                     (QREFELT $ 48))
                           |mu_inv| (QREFELT $ 53))
                          (SPADCALL |mu_inv| (QREFELT $ 55)) (QREFELT $ 53))
                         . #2#)
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (SPADCALL (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                      |sigma| (QREFELT $ 49))
                            (SPADCALL |power4| |ss| (QREFELT $ 53))
                            (QREFELT $ 48))
                           . #2#)
                     (GO #1#)))))
                 ('T
                  (SEQ (LETT |xnroot| (SPADCALL |x| (QREFELT $ 55)) . #2#)
                       (LETT |ynroot| (SPADCALL |y| (QREFELT $ 55)) . #2#)
                       (LETT |znroot| (SPADCALL |z| (QREFELT $ 55)) . #2#)
                       (LETT |lambda|
                             (SPADCALL
                              (SPADCALL |xnroot|
                                        (SPADCALL |ynroot| |znroot|
                                                  (QREFELT $ 48))
                                        (QREFELT $ 53))
                              (SPADCALL |ynroot| |znroot| (QREFELT $ 53))
                              (QREFELT $ 48))
                             . #2#)
                       (LETT |alfa|
                             (SPADCALL
                              (SPADCALL |p|
                                        (SPADCALL
                                         (SPADCALL |xnroot| |ynroot|
                                                   (QREFELT $ 48))
                                         |znroot| (QREFELT $ 48))
                                        (QREFELT $ 53))
                              (SPADCALL
                               (SPADCALL |xnroot| |ynroot| (QREFELT $ 53))
                               |znroot| (QREFELT $ 53))
                              (QREFELT $ 48))
                             . #2#)
                       (LETT |alfa| (SPADCALL |alfa| |alfa| (QREFELT $ 53))
                             . #2#)
                       (LETT |beta|
                             (SPADCALL
                              (SPADCALL |p|
                                        (SPADCALL |p| |lambda| (QREFELT $ 48))
                                        (QREFELT $ 53))
                              (SPADCALL |p| |lambda| (QREFELT $ 48))
                              (QREFELT $ 53))
                             . #2#)
                       (LETT |sigma|
                             (SPADCALL |sigma|
                                       (SPADCALL |power4|
                                                 (SPADCALL |alfa| |beta|
                                                           (QREFELT $ 58))
                                                 (QREFELT $ 53))
                                       (QREFELT $ 48))
                             . #2#)
                       (LETT |power4|
                             (SPADCALL (QREFELT $ 8) |power4| (QREFELT $ 49))
                             . #2#)
                       (LETT |x|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |x| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |y|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |y| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |z|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |z| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |p|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |p| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (LETT |mu|
                             (SPADCALL (QREFELT $ 8)
                                       (SPADCALL |mu| |lambda| (QREFELT $ 48))
                                       (QREFELT $ 49))
                             . #2#)
                       (EXIT (LETT Q (|mul_DF| (QREFELT $ 8) Q) . #2#)))))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |ELIPIDF;ellipticF;3C;15| (|z| |m| $)
  (SPADCALL |z|
            (SPADCALL
             (SPADCALL (|spadConstant| $ 51) (SPADCALL |z| |z| (QREFELT $ 53))
                       (QREFELT $ 50))
             (SPADCALL (|spadConstant| $ 51)
                       (SPADCALL (SPADCALL |m| |z| (QREFELT $ 53)) |z|
                                 (QREFELT $ 53))
                       (QREFELT $ 50))
             (|spadConstant| $ 51) (QREFELT $ 59))
            (QREFELT $ 53))) 

(DEFUN |ELIPIDF;ellipticK;2C;16| (|m| $)
  (SPADCALL (|spadConstant| $ 60)
            (SPADCALL (|spadConstant| $ 51) |m| (QREFELT $ 50))
            (|spadConstant| $ 51) (QREFELT $ 59))) 

(DEFUN |ELIPIDF;ellipticE;3C;17| (|z| |m| $)
  (SPADCALL
   (SPADCALL |z|
             (SPADCALL
              (SPADCALL (|spadConstant| $ 51) (SPADCALL |z| |z| (QREFELT $ 53))
                        (QREFELT $ 50))
              (SPADCALL (|spadConstant| $ 51)
                        (SPADCALL (SPADCALL |m| |z| (QREFELT $ 53)) |z|
                                  (QREFELT $ 53))
                        (QREFELT $ 50))
              (|spadConstant| $ 51) (QREFELT $ 59))
             (QREFELT $ 53))
   (SPADCALL
    (SPADCALL
     (SPADCALL
      (SPADCALL (SPADCALL |m| (SPADCALL 3 (QREFELT $ 57)) (QREFELT $ 52)) |z|
                (QREFELT $ 53))
      |z| (QREFELT $ 53))
     |z| (QREFELT $ 53))
    (SPADCALL
     (SPADCALL (|spadConstant| $ 51) (SPADCALL |z| |z| (QREFELT $ 53))
               (QREFELT $ 50))
     (SPADCALL (|spadConstant| $ 51)
               (SPADCALL (SPADCALL |m| |z| (QREFELT $ 53)) |z| (QREFELT $ 53))
               (QREFELT $ 50))
     (|spadConstant| $ 51) (QREFELT $ 63))
    (QREFELT $ 53))
   (QREFELT $ 50))) 

(DEFUN |ELIPIDF;ellipticE;2C;18| (|m| $)
  (SPADCALL
   (SPADCALL (|spadConstant| $ 60)
             (SPADCALL (|spadConstant| $ 51) |m| (QREFELT $ 50))
             (|spadConstant| $ 51) (QREFELT $ 59))
   (SPADCALL (SPADCALL |m| (SPADCALL 3 (QREFELT $ 57)) (QREFELT $ 52))
             (SPADCALL (|spadConstant| $ 60)
                       (SPADCALL (|spadConstant| $ 51) |m| (QREFELT $ 50))
                       (|spadConstant| $ 51) (QREFELT $ 63))
             (QREFELT $ 53))
   (QREFELT $ 50))) 

(DEFUN |ELIPIDF;ellipticPi;4C;19| (|z| |n| |m| $)
  (SPADCALL
   (SPADCALL |z|
             (SPADCALL
              (SPADCALL (|spadConstant| $ 51) (SPADCALL |z| |z| (QREFELT $ 53))
                        (QREFELT $ 50))
              (SPADCALL (|spadConstant| $ 51)
                        (SPADCALL (SPADCALL |m| |z| (QREFELT $ 53)) |z|
                                  (QREFELT $ 53))
                        (QREFELT $ 50))
              (|spadConstant| $ 51) (QREFELT $ 59))
             (QREFELT $ 53))
   (SPADCALL
    (SPADCALL
     (SPADCALL
      (SPADCALL (SPADCALL |n| (SPADCALL 3 (QREFELT $ 57)) (QREFELT $ 52)) |z|
                (QREFELT $ 53))
      |z| (QREFELT $ 53))
     |z| (QREFELT $ 53))
    (SPADCALL
     (SPADCALL (|spadConstant| $ 51) (SPADCALL |z| |z| (QREFELT $ 53))
               (QREFELT $ 50))
     (SPADCALL (|spadConstant| $ 51)
               (SPADCALL (SPADCALL |m| |z| (QREFELT $ 53)) |z| (QREFELT $ 53))
               (QREFELT $ 50))
     (|spadConstant| $ 51)
     (SPADCALL (|spadConstant| $ 51)
               (SPADCALL (SPADCALL |n| |z| (QREFELT $ 53)) |z| (QREFELT $ 53))
               (QREFELT $ 50))
     (QREFELT $ 64))
    (QREFELT $ 53))
   (QREFELT $ 48))) 

(DECLAIM (NOTINLINE |DoubleFloatEllipticIntegrals;|)) 

(DEFUN |DoubleFloatEllipticIntegrals| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G167)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|DoubleFloatEllipticIntegrals|)
                . #2=(|DoubleFloatEllipticIntegrals|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|DoubleFloatEllipticIntegrals|
                         (LIST
                          (CONS NIL
                                (CONS 1 (|DoubleFloatEllipticIntegrals;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache|
                    '|DoubleFloatEllipticIntegrals|))))))))))) 

(DEFUN |DoubleFloatEllipticIntegrals;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|DoubleFloatEllipticIntegrals|)
            . #1=(|DoubleFloatEllipticIntegrals|))
      (LETT $ (GETREFV 70) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DoubleFloatEllipticIntegrals| NIL
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 7 (|div_DF| 1.0 (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 8 (|div_DF| 1.0 (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 9 (|div_DF| 1.0 (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 10
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 11 (|div_DF| 1.0 (FLOAT 7 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 12
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 13
                (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 22 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 14
                (|div_DF| (FLOAT 159 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 208 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 15
                (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 16 (FLOAT 94 MOST-POSITIVE-DOUBLE-FLOAT))
      (QSETREFV $ 17 (|div_DF| 1.0 (FLOAT 24 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 18 (|div_DF| 1.0 (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 19
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 44 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 20 (|div_DF| 1.0 (FLOAT 14 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 21 (FLOAT 427 MOST-POSITIVE-DOUBLE-FLOAT))
      (QSETREFV $ 22
                (|minus_DF|
                 (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                           (FLOAT 14 MOST-POSITIVE-DOUBLE-FLOAT))))
      (QSETREFV $ 23 (|div_DF| 1.0 (FLOAT 6 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 24
                (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 22 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 25
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 26 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 26
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 27 (FLOAT 646 MOST-POSITIVE-DOUBLE-FLOAT))
      (QSETREFV $ 28
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 14 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 29
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 22 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 30
                (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 26 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 31
                (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 88 MOST-POSITIVE-DOUBLE-FLOAT)))
      (QSETREFV $ 32
                (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                          (FLOAT 52 MOST-POSITIVE-DOUBLE-FLOAT)))
      $)))) 

(MAKEPROP '|DoubleFloatEllipticIntegrals| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|half| '|one_third| '|one_fourth|
              '|one_fifth| '|c2_RC| '|c3_RC| '|c4_RC| '|c5_RC| '|c6_RC|
              '|c7_RC| '|inv_err_RC| '|c1_RF| '|c2_RF| '|c3_RF| '|c4_RF|
              '|inv_err_RF| '|c1_RD| '|c2_RD| '|c3_RD| '|c4_RD| '|c5_RD|
              '|inv_err_RJ| '|c1_RJ| '|c3_RJ| '|c4_RJ| '|c5_RJ| '|c6_RJ|
              (|Complex| 35) (0 . |abs|) (|DoubleFloat|) (5 . |real|)
              (|Fraction| 56) (10 . |One|) |ELIPIDF;ellipticRC;3Df;2|
              |ELIPIDF;ellipticRF;4Df;3| |ELIPIDF;ellipticRD;4Df;4|
              |ELIPIDF;ellipticRJ;5Df;5| |ELIPIDF;ellipticF;3Df;6|
              |ELIPIDF;ellipticK;2Df;7| |ELIPIDF;ellipticE;3Df;8|
              |ELIPIDF;ellipticE;2Df;9| |ELIPIDF;ellipticPi;4Df;10| (14 . +)
              (20 . *) (26 . -) (32 . |One|) (36 . /) (42 . *) (48 . |coerce|)
              (53 . |sqrt|) (|Integer|) (58 . |coerce|)
              |ELIPIDF;ellipticRC;3C;11| |ELIPIDF;ellipticRF;4C;12|
              (63 . |Zero|) (67 . -) (72 . *) |ELIPIDF;ellipticRD;4C;13|
              |ELIPIDF;ellipticRJ;5C;14| |ELIPIDF;ellipticF;3C;15|
              |ELIPIDF;ellipticK;2C;16| |ELIPIDF;ellipticE;3C;17|
              |ELIPIDF;ellipticE;2C;18| |ELIPIDF;ellipticPi;4C;19|)
           '#(|ellipticRJ| 78 |ellipticRF| 94 |ellipticRD| 108 |ellipticRC| 122
              |ellipticPi| 134 |ellipticK| 148 |ellipticF| 158 |ellipticE| 170)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 69
                                                 '(1 33 0 0 34 1 33 35 0 36 0
                                                   37 0 38 2 33 0 0 0 48 2 33 0
                                                   35 0 49 2 33 0 0 0 50 0 33 0
                                                   51 2 33 0 0 0 52 2 33 0 0 0
                                                   53 1 33 0 35 54 1 33 0 0 55
                                                   1 33 0 56 57 0 33 0 60 1 33
                                                   0 0 61 2 33 0 0 35 62 4 0 35
                                                   35 35 35 35 42 4 0 33 33 33
                                                   33 33 64 3 0 35 35 35 35 40
                                                   3 0 33 33 33 33 59 3 0 35 35
                                                   35 35 41 3 0 33 33 33 33 63
                                                   2 0 35 35 35 39 2 0 33 33 33
                                                   58 3 0 35 35 35 35 47 3 0 33
                                                   33 33 33 69 1 0 35 35 44 1 0
                                                   33 33 66 2 0 35 35 35 43 2 0
                                                   33 33 33 65 2 0 35 35 35 45
                                                   1 0 35 35 46 2 0 33 33 33 67
                                                   1 0 33 33 68)))))
           '|lookupComplete|)) 

(MAKEPROP '|DoubleFloatEllipticIntegrals| 'NILADIC T) 
