
(/VERSIONCHECK 2) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;1|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 17))) 

(DEFUN |MODHPS;LLF_to_LPA;LILLIU;2| (|l| |sigma| |vars| |points| |p| $)
  (SPADCALL |l| |sigma| |p| (QREFELT $ 24))) 

(DEFUN |MODHPS;VSUPS_to_VPA;VLLIV;3| (|v| |vars| |points| |p| $)
  (SPADCALL |v| |p| (QREFELT $ 29))) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  (PROG ()
    (RETURN
     (COND ((SPADCALL |kind| '|diffHP| (QREFELT $ 33)) |check|)
           ('T
            (CONS #'|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4!0|
                  (VECTOR |gen| |sigma| |l| $))))))) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4!0| (|x| $$)
  (PROG ($ |l| |sigma| |gen|)
    (LETT $ (QREFELT $$ 3) . #1=(|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4|))
    (LETT |l| (QREFELT $$ 2) . #1#)
    (LETT |sigma| (QREFELT $$ 1) . #1#)
    (LETT |gen| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|MODHPS;check_sol_mod_diff| (SPADCALL |x| (QREFELT $ 35)) |l| |sigma|
       |gen| '|dummy| NIL $))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;5|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 40))) 

(DEFUN |MODHPS;LLF_to_LPA;LILLIU;6| (|l| |sigma| |vars| |points| |p| $)
  (SPADCALL |l| |sigma| |vars| |points| |p| (QREFELT $ 41))) 

(DEFUN |MODHPS;VSUPS_to_VPA;VLLIV;7| (|v| |vars| |points| |p| $)
  (SPADCALL |v| |vars| |points| |p| (QREFELT $ 43))) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  (PROG (|vars|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |kind| '|diffHP| (QREFELT $ 44)))
        (COND
         ((NULL (SPADCALL |kind| '|qdiffHP| (QREFELT $ 44)))
          (COND
           ((NULL (SPADCALL |kind| '|qmixed| (QREFELT $ 44)))
            (EXIT |check|)))))))
      (LETT |vars| (SPADCALL |l| |kind| |qvar| (QREFELT $ 45))
            |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|)
      (EXIT
       (CONS #'|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8!0|
             (VECTOR |vars| |qvar| |gen| |sigma| |l| $))))))) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8!0| (|x| $$)
  (PROG ($ |l| |sigma| |gen| |qvar| |vars|)
    (LETT $ (QREFELT $$ 5) . #1=(|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|))
    (LETT |l| (QREFELT $$ 4) . #1#)
    (LETT |sigma| (QREFELT $$ 3) . #1#)
    (LETT |gen| (QREFELT $$ 2) . #1#)
    (LETT |qvar| (QREFELT $$ 1) . #1#)
    (LETT |vars| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|MODHPS;check_sol_mod_diff| (SPADCALL |x| (QREFELT $ 35)) |l| |sigma|
       |gen| |qvar| |vars| $))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;9|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 49))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;10| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;10|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;11|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;12| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;12|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;13|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G255 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;13|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;14|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;15|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;16|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;17|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;18| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;18|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;19|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G297 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;19|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;20|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;21|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;22|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;23|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;24| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;24|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;25|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;26| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;26|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;27|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G357 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;27|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;28|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;29|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;30|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;31|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;32| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;32|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;33|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G399 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;33|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;34|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;35|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;36|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;37|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;38| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;38|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;39|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 49))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;40| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;40|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;41|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;42| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;42|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;43|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G477 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;43|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;44|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;45|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;46|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;47|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;48| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;48|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;49|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G519 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;49|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;50|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;51|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;52|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;53|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;54| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;54|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;55|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;56| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;56|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;57|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G579 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;57|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;58|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;59|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;60|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;61|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;62| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;62|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;63|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G621 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;63|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;64|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;65|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;66|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;67|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;68| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;68|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;69|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 40))) 

(DEFUN |MODHPS;LLF_to_LPA;LILLIU;70| (|l| |sigma| |vars| |points| |p| $)
  (SPADCALL |l| |sigma| |vars| |points| (QREFELT $ 55) (QREFELT $ 41))) 

(DEFUN |MODHPS;VSUPS_to_VPA;VLLIV;71| (|v| |vars| |points| |p| $)
  (SPADCALL |v| |vars| |points| (QREFELT $ 55) (QREFELT $ 43))) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  (PROG (|vars|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |kind| '|diffHP| (QREFELT $ 44)))
        (COND
         ((NULL (SPADCALL |kind| '|qdiffHP| (QREFELT $ 44)))
          (COND
           ((NULL (SPADCALL |kind| '|qmixed| (QREFELT $ 44)))
            (EXIT |check|)))))))
      (LETT |vars| (SPADCALL |l| |kind| |qvar| (QREFELT $ 45))
            |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|)
      (EXIT
       (CONS #'|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72!0|
             (VECTOR |vars| |qvar| |gen| |sigma| |l| $))))))) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72!0| (|x| $$)
  (PROG ($ |l| |sigma| |gen| |qvar| |vars|)
    (LETT $ (QREFELT $$ 5) . #1=(|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|))
    (LETT |l| (QREFELT $$ 4) . #1#)
    (LETT |sigma| (QREFELT $$ 3) . #1#)
    (LETT |gen| (QREFELT $$ 2) . #1#)
    (LETT |qvar| (QREFELT $$ 1) . #1#)
    (LETT |vars| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|MODHPS;check_sol_mod_diff| (SPADCALL |x| (QREFELT $ 35)) |l| |sigma|
       |gen| |qvar| |vars| $))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;73|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 49))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;74| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;74|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;75|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;76| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;76|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;77|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G730 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;77|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;78|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;79|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;80|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;81|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;82| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;82|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;83|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G772 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;83|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;84|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;85|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;86|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;87|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;88| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;88|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;89|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;90| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;90|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;91|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G832 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;91|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;92|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;93|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;94|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;95|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;96| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;96|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;97|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G874 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;97|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;98|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;99|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;100|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;101|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;102| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;102|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;103|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |sigma| |gen| |check| (QREFELT $ 49))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;104| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;104|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;105|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;106| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;106|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;107|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G952 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;107|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;108|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;109|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;110|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;111|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;112| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;112|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;113|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G994 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;113|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;114|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;115|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;116|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;117|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;118| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;118|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;119|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (SPADCALL |l| |degs| |kind| |qvar| |sigma| |gen| |check| (QREFELT $ 53))) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;120| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;120|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;121|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G1054 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;121|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;122|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;123|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;124|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;125|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;126| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;126|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;127|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (PROG (#1=#:G1096 |pp| |checkPF|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |checkPF| |check| . #2=(|MODHPS;HP_solve;LL2SNniMMU;127|))
            (LETT |pp|
                  (SPADCALL |l| |degs| |kind| (QREFELT $ 55) |sigma| |gen|
                            |checkPF| (QREFELT $ 60))
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |pp| 0)
               (PROGN (LETT #1# (CONS 0 (QCDR |pp|)) . #2#) (GO #1#)))
              ('T (PROGN (LETT #1# (CONS 1 (QCDR |pp|)) . #2#) (GO #1#)))))))
      #1# (EXIT #1#))))) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;128|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;129|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;130|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(DEFUN |MODHPS;HP_solve;LL2SNniMMU;131|
       (|l| |degs| |kind| |qvar| |sigma| |gen| |check| $)
  (CONS 1 'T)) 

(PUT '|MODHPS;gen_Monte_Carlo_check;ML2SNniMM;132| '|SPADreplace|
     '(XLAM (|check| |l| |kind| |qvar| |sigma| |gen|) |check|)) 

(DEFUN |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;132|
       (|check| |l| |kind| |qvar| |sigma| |gen| $)
  |check|) 

(DEFUN |MODHPS;check_sol_mod_diff|
       (|resv| |list| |sigma| |gen| |qvar| |vars| $)
  (PROG (#1=#:G1148 |min_ord| #2=#:G1139 |delta| |sigma0| |pa| #3=#:G1151 |j|
         |c0| #4=#:G1133 |ord| #5=#:G1150 |i| |nres| |gv0| |gvl| |gv0p| |lpt|
         |qval| #6=#:G1149 |var| |ii| |n0|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL (LENGTH |list|) 1 (QREFELT $ 61))
         (|error| "check_sol_mod_diff: #list ~= 1"))
        (#7='T
         (SEQ
          (LETT |n0| (LENGTH (|SPADfirst| |list|))
                . #8=(|MODHPS;check_sol_mod_diff|))
          (LETT |sigma0| (+ |n0| 2) . #8#) (LETT |min_ord| |sigma0| . #8#)
          (LETT |delta| (- |sigma0| |sigma|) . #8#)
          (EXIT
           (COND ((>= |delta| |sigma|) (|error| "delta too big"))
                 (#7#
                  (SEQ
                   (SEQ (LETT |ii| 1 . #8#) G190
                        (COND ((|greater_SI| |ii| 20) (GO G191)))
                        (SEQ
                         (SETELT $ 55
                                 (SPADCALL (+ (RANDOM 2000000) 2000000)
                                           (QREFELT $ 66)))
                         (LETT |lpt| NIL . #8#) (LETT |qval| 0 . #8#)
                         (SEQ (LETT |var| NIL . #8#) (LETT #6# |vars| . #8#)
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |var| (CAR #6#) . #8#) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |lpt| (CONS (RANDOM (QREFELT $ 55)) |lpt|)
                                     . #8#)
                               (EXIT
                                (COND
                                 ((EQUAL |var| |qvar|)
                                  (LETT |qval| (|SPADfirst| |lpt|) . #8#)))))
                              (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                              (EXIT NIL))
                         (LETT |lpt| (NREVERSE |lpt|) . #8#)
                         (LETT |gv0p|
                               (SPADCALL |list| (+ |n0| |delta|) |vars| |lpt|
                                         (QREFELT $ 55) (QREFELT $ 26))
                               . #8#)
                         (EXIT
                          (COND ((QEQCAR |gv0p| 1) "iterate")
                                ('T
                                 (SEQ (LETT |gvl| (QCDR |gv0p|) . #8#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL (LENGTH |gvl|) 1
                                                   (QREFELT $ 67))
                                         "check_sol_mod_diff: #gvl ~= 1")
                                        ('T
                                         (SEQ
                                          (LETT |gv0| (|SPADfirst| |gvl|)
                                                . #8#)
                                          (LETT |nres|
                                                (SPADCALL |resv| |vars| |lpt|
                                                          (QREFELT $ 55)
                                                          (QREFELT $ 31))
                                                . #8#)
                                          (LETT |pa|
                                                (SPADCALL |nres| |gvl| |gen|
                                                          |sigma0| |qval|
                                                          (QREFELT $ 55)
                                                          (QREFELT $ 70))
                                                . #8#)
                                          (LETT |ord| |sigma0| . #8#)
                                          (SEQ
                                           (EXIT
                                            (SEQ (LETT |i| 0 . #8#)
                                                 (LETT #5# (- |sigma0| 1)
                                                       . #8#)
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |i| #5#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL
                                                      (ELT_U32 |pa| |i|) 0
                                                      (QREFELT $ 61))
                                                     (SEQ
                                                      (LETT |ord| |i| . #8#)
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #4# |$NoValue|
                                                              . #8#)
                                                        (GO #4#))))))))
                                                 (LETT |i| (|inc_SI| |i|)
                                                       . #8#)
                                                 (GO G190) G191 (EXIT NIL)))
                                           #4# (EXIT #4#))
                                          (EXIT
                                           (COND
                                            ((< |ord| |sigma|)
                                             (PROGN
                                              (LETT #1# (CONS 2 "no_solution")
                                                    . #8#)
                                              (GO #1#)))
                                            ((< |ord| |sigma0|)
                                             (SEQ
                                              (LETT |c0| (ELT_U32 |pa| |ord|)
                                                    . #8#)
                                              (SEQ
                                               (EXIT
                                                (SEQ (LETT |j| 0 . #8#)
                                                     (LETT #3# (- |delta| 1)
                                                           . #8#)
                                                     G190
                                                     (COND
                                                      ((|greater_SI| |j| #3#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (SETELT_U32 |gv0|
                                                                  (+ |n0| |j|)
                                                                  1)
                                                      (LETT |pa|
                                                            (SPADCALL |nres|
                                                                      (LIST
                                                                       |gv0|)
                                                                      |gen|
                                                                      |sigma0|
                                                                      |qval|
                                                                      (QREFELT
                                                                       $ 55)
                                                                      (QREFELT
                                                                       $ 70))
                                                            . #8#)
                                                      (EXIT
                                                       (COND
                                                        ((SPADCALL
                                                          (ELT_U32 |pa| |ord|)
                                                          |c0| (QREFELT $ 61))
                                                         (SEQ
                                                          (LETT |sigma0| |ord|
                                                                . #8#)
                                                          (LETT |delta|
                                                                (- |sigma0|
                                                                   |sigma|)
                                                                . #8#)
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #2#
                                                                  |$NoValue|
                                                                  . #8#)
                                                            (GO #2#)))))
                                                        ('T
                                                         (SETELT_U32 |gv0|
                                                                     (+ |n0|
                                                                        |j|)
                                                                     0)))))
                                                     (LETT |j| (|inc_SI| |j|)
                                                           . #8#)
                                                     (GO G190) G191
                                                     (EXIT NIL)))
                                               #2# (EXIT #2#))
                                              (EXIT
                                               (COND
                                                ((< |ord| |min_ord|)
                                                 (LETT |min_ord| |ord|
                                                       . #8#)))))))))))))))))
                        (LETT |ii| (|inc_SI| |ii|) . #8#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT
                    (COND
                     ((< |min_ord| |sigma0|)
                      (PROGN (LETT #1# (CONS 1 "reject") . #8#) (GO #1#)))
                     (#7#
                      (PROGN
                       (LETT #1# (CONS 0 "good") . #8#)
                       (GO #1#)))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |ModularHermitePadeSolver| (&REST #1=#:G1152)
  (PROG ()
    (RETURN
     (PROG (#2=#:G1153)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ModularHermitePadeSolver|)
                                           '|domainEqualList|)
                . #3=(|ModularHermitePadeSolver|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ModularHermitePadeSolver;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ModularHermitePadeSolver|))))))))))) 

(DEFUN |ModularHermitePadeSolver;| (|#1| |#2|)
  (PROG (#1=#:G1079 #2=#:G1077 #3=#:G1037 #4=#:G1035 #5=#:G977 #6=#:G975
         #7=#:G935 #8=#:G933 #9=#:G857 #10=#:G855 #11=#:G815 #12=#:G813
         #13=#:G755 #14=#:G753 #15=#:G713 #16=#:G711 #17=#:G604 #18=#:G602
         #19=#:G562 #20=#:G560 #21=#:G502 #22=#:G500 #23=#:G460 #24=#:G458
         #25=#:G382 #26=#:G380 #27=#:G340 #28=#:G338 #29=#:G280 #30=#:G278
         #31=#:G238 #32=#:G236 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #33=(|ModularHermitePadeSolver|))
      (LETT DV$2 (|devaluate| |#2|) . #33#)
      (LETT |dv$| (LIST '|ModularHermitePadeSolver| DV$1 DV$2) . #33#)
      (LETT $ (GETREFV 73) . #33#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #33#))
      (|haddProp| |$ConstructorCache| '|ModularHermitePadeSolver|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|domainEqual| |#1| (|Fraction| (|Integer|)))
        (COND
         ((|domainEqual| |#2| (|Integer|))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;1|)
                           $))
           (QSETREFV $ 26
                     (CONS (|dispatchFunction| |MODHPS;LLF_to_LPA;LILLIU;2|)
                           $))
           (QSETREFV $ 31
                     (CONS (|dispatchFunction| |MODHPS;VSUPS_to_VPA;VLLIV;3|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;4|)
                      $))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|Integer|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|Integer|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;5|) $))
             (QSETREFV $ 26
                       (CONS (|dispatchFunction| |MODHPS;LLF_to_LPA;LILLIU;6|)
                             $))
             (QSETREFV $ 31
                       (CONS (|dispatchFunction| |MODHPS;VSUPS_to_VPA;VLLIV;7|)
                             $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;8|)
                        $))))
           ((|domainEqual| |#1| (|AlgebraicNumber|))
            (COND
             ((|domainEqual| |#2| (|AlgebraicNumber|))
              (PROGN
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;9|)
                          $))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;10|)
                          $))))
             ((|domainEqual| |#1|
                             (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
              (COND
               ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
                (PROGN
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;11|)
                            $))
                 (QSETREFV $ 36
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;12|)
                            $))))
               ('T
                (PROGN
                 (QSETREFV $ 55 (SPADCALL (QREFELT $ 54)))
                 (COND
                  ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
                   (COND
                    ((< (QREFELT $ 55) 32000000)
                     (COND
                      ((|domainEqual| |#1|
                                      (|PrimeField|
                                       (PROG1 (LETT #32# (QREFELT $ 55) . #33#)
                                         (|check_subtype| (> #32# 0)
                                                          '(|PositiveInteger|)
                                                          #32#))))
                       (COND
                        ((|domainEqual| |#2|
                                        (|PrimeField|
                                         (PROG1
                                             (LETT #31# (QREFELT $ 55) . #33#)
                                           (|check_subtype| (> #31# 0)
                                                            '(|PositiveInteger|)
                                                            #31#))))
                         (QSETREFV $ 21
                                   (CONS
                                    (|dispatchFunction|
                                     |MODHPS;HP_solve;LL2SNniMMU;13|)
                                    $)))
                        ('T
                         (QSETREFV $ 21
                                   (CONS
                                    (|dispatchFunction|
                                     |MODHPS;HP_solve;LL2SNniMMU;14|)
                                    $)))))
                      ('T
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;15|)
                                  $)))))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;16|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;17|)
                              $))))
                 (QSETREFV $ 36
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;18|)
                            $))))))
             ('T
              (PROGN
               (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
               (COND
                ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
                 (COND
                  ((< (QREFELT $ 55) 32000000)
                   (COND
                    ((|domainEqual| |#1|
                                    (|PrimeField|
                                     (PROG1 (LETT #30# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #30# 0)
                                                        '(|PositiveInteger|)
                                                        #30#))))
                     (COND
                      ((|domainEqual| |#2|
                                      (|PrimeField|
                                       (PROG1 (LETT #29# (QREFELT $ 55) . #33#)
                                         (|check_subtype| (> #29# 0)
                                                          '(|PositiveInteger|)
                                                          #29#))))
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;19|)
                                  $)))
                      ('T
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;20|)
                                  $)))))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;21|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;22|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;23|)
                            $))))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;24|)
                          $))))))
           ((|domainEqual| |#1|
                           (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
            (COND
             ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
              (PROGN
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;25|)
                          $))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;26|)
                          $))))
             ('T
              (PROGN
               (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
               (COND
                ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
                 (COND
                  ((< (QREFELT $ 55) 32000000)
                   (COND
                    ((|domainEqual| |#1|
                                    (|PrimeField|
                                     (PROG1 (LETT #28# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #28# 0)
                                                        '(|PositiveInteger|)
                                                        #28#))))
                     (COND
                      ((|domainEqual| |#2|
                                      (|PrimeField|
                                       (PROG1 (LETT #27# (QREFELT $ 55) . #33#)
                                         (|check_subtype| (> #27# 0)
                                                          '(|PositiveInteger|)
                                                          #27#))))
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;27|)
                                  $)))
                      ('T
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;28|)
                                  $)))))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;29|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;30|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;31|)
                            $))))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;32|)
                          $))))))
           ('T
            (PROGN
             (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
             (COND
              ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
               (COND
                ((< (QREFELT $ 55) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #26# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #26# 0)
                                                      '(|PositiveInteger|)
                                                      #26#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #25# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #25# 0)
                                                        '(|PositiveInteger|)
                                                        #25#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;33|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;34|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;35|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;36|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;37|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;38|)
                        $))))))
         ((|domainEqual| |#1| (|AlgebraicNumber|))
          (COND
           ((|domainEqual| |#2| (|AlgebraicNumber|))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;39|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;40|)
                        $))))
           ((|domainEqual| |#1|
                           (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
            (COND
             ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
              (PROGN
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;41|)
                          $))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;42|)
                          $))))
             ('T
              (PROGN
               (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
               (COND
                ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
                 (COND
                  ((< (QREFELT $ 55) 32000000)
                   (COND
                    ((|domainEqual| |#1|
                                    (|PrimeField|
                                     (PROG1 (LETT #24# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #24# 0)
                                                        '(|PositiveInteger|)
                                                        #24#))))
                     (COND
                      ((|domainEqual| |#2|
                                      (|PrimeField|
                                       (PROG1 (LETT #23# (QREFELT $ 55) . #33#)
                                         (|check_subtype| (> #23# 0)
                                                          '(|PositiveInteger|)
                                                          #23#))))
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;43|)
                                  $)))
                      ('T
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;44|)
                                  $)))))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;45|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;46|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;47|)
                            $))))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;48|)
                          $))))))
           ('T
            (PROGN
             (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
             (COND
              ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
               (COND
                ((< (QREFELT $ 55) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #22# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #22# 0)
                                                      '(|PositiveInteger|)
                                                      #22#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #21# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #21# 0)
                                                        '(|PositiveInteger|)
                                                        #21#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;49|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;50|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;51|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;52|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;53|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;54|)
                        $))))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;55|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;56|)
                        $))))
           ('T
            (PROGN
             (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
             (COND
              ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
               (COND
                ((< (QREFELT $ 55) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #20# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #20# 0)
                                                      '(|PositiveInteger|)
                                                      #20#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #19# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #19# 0)
                                                        '(|PositiveInteger|)
                                                        #19#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;57|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;58|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;59|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;60|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;61|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;62|)
                        $))))))
         ('T
          (PROGN
           (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
           (COND
            ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
             (COND
              ((< (QREFELT $ 55) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #18# (QREFELT $ 55) . #33#)
                                   (|check_subtype| (> #18# 0)
                                                    '(|PositiveInteger|)
                                                    #18#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #17# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #17# 0)
                                                      '(|PositiveInteger|)
                                                      #17#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;63|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;64|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;65|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;66|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;67|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;68|)
                      $))))))
       ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|Integer|))))
        (COND
         ((|domainEqual| |#2| (|Polynomial| (|Integer|)))
          (PROGN
           (QSETREFV $ 21
                     (CONS (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;69|)
                           $))
           (QSETREFV $ 26
                     (CONS (|dispatchFunction| |MODHPS;LLF_to_LPA;LILLIU;70|)
                           $))
           (QSETREFV $ 31
                     (CONS (|dispatchFunction| |MODHPS;VSUPS_to_VPA;VLLIV;71|)
                           $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;72|)
                      $))))
         ((|domainEqual| |#1| (|AlgebraicNumber|))
          (COND
           ((|domainEqual| |#2| (|AlgebraicNumber|))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;73|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;74|)
                        $))))
           ((|domainEqual| |#1|
                           (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
            (COND
             ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
              (PROGN
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;75|)
                          $))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;76|)
                          $))))
             ('T
              (PROGN
               (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
               (COND
                ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
                 (COND
                  ((< (QREFELT $ 55) 32000000)
                   (COND
                    ((|domainEqual| |#1|
                                    (|PrimeField|
                                     (PROG1 (LETT #16# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #16# 0)
                                                        '(|PositiveInteger|)
                                                        #16#))))
                     (COND
                      ((|domainEqual| |#2|
                                      (|PrimeField|
                                       (PROG1 (LETT #15# (QREFELT $ 55) . #33#)
                                         (|check_subtype| (> #15# 0)
                                                          '(|PositiveInteger|)
                                                          #15#))))
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;77|)
                                  $)))
                      ('T
                       (QSETREFV $ 21
                                 (CONS
                                  (|dispatchFunction|
                                   |MODHPS;HP_solve;LL2SNniMMU;78|)
                                  $)))))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;79|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;80|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;81|)
                            $))))
               (QSETREFV $ 36
                         (CONS
                          (|dispatchFunction|
                           |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;82|)
                          $))))))
           ('T
            (PROGN
             (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
             (COND
              ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
               (COND
                ((< (QREFELT $ 55) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #14# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #14# 0)
                                                      '(|PositiveInteger|)
                                                      #14#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #13# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #13# 0)
                                                        '(|PositiveInteger|)
                                                        #13#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;83|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;84|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;85|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;86|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;87|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;88|)
                        $))))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;89|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;90|)
                        $))))
           ('T
            (PROGN
             (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
             (COND
              ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
               (COND
                ((< (QREFELT $ 55) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #12# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #12# 0)
                                                      '(|PositiveInteger|)
                                                      #12#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #11# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #11# 0)
                                                        '(|PositiveInteger|)
                                                        #11#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;91|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;92|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;93|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;94|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;95|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;96|)
                        $))))))
         ('T
          (PROGN
           (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
           (COND
            ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
             (COND
              ((< (QREFELT $ 55) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #10# (QREFELT $ 55) . #33#)
                                   (|check_subtype| (> #10# 0)
                                                    '(|PositiveInteger|)
                                                    #10#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #9# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #9# 0)
                                                      '(|PositiveInteger|)
                                                      #9#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;97|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;98|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;99|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;100|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;101|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;102|)
                      $))))))
       ((|domainEqual| |#1| (|AlgebraicNumber|))
        (COND
         ((|domainEqual| |#2| (|AlgebraicNumber|))
          (PROGN
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;103|) $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;104|)
                      $))))
         ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
          (COND
           ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
            (PROGN
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;105|)
                        $))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;106|)
                        $))))
           ('T
            (PROGN
             (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
             (COND
              ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
               (COND
                ((< (QREFELT $ 55) 32000000)
                 (COND
                  ((|domainEqual| |#1|
                                  (|PrimeField|
                                   (PROG1 (LETT #8# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #8# 0)
                                                      '(|PositiveInteger|)
                                                      #8#))))
                   (COND
                    ((|domainEqual| |#2|
                                    (|PrimeField|
                                     (PROG1 (LETT #7# (QREFELT $ 55) . #33#)
                                       (|check_subtype| (> #7# 0)
                                                        '(|PositiveInteger|)
                                                        #7#))))
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;107|)
                                $)))
                    ('T
                     (QSETREFV $ 21
                               (CONS
                                (|dispatchFunction|
                                 |MODHPS;HP_solve;LL2SNniMMU;108|)
                                $)))))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;109|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;110|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;111|)
                          $))))
             (QSETREFV $ 36
                       (CONS
                        (|dispatchFunction|
                         |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;112|)
                        $))))))
         ('T
          (PROGN
           (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
           (COND
            ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
             (COND
              ((< (QREFELT $ 55) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #6# (QREFELT $ 55) . #33#)
                                   (|check_subtype| (> #6# 0)
                                                    '(|PositiveInteger|)
                                                    #6#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #5# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #5# 0)
                                                      '(|PositiveInteger|)
                                                      #5#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;113|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;114|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;115|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;116|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;117|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;118|)
                      $))))))
       ((|domainEqual| |#1| (|Fraction| (|Polynomial| (|AlgebraicNumber|))))
        (COND
         ((|domainEqual| |#2| (|Polynomial| (|AlgebraicNumber|)))
          (PROGN
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;119|) $))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;120|)
                      $))))
         ('T
          (PROGN
           (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
           (COND
            ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
             (COND
              ((< (QREFELT $ 55) 32000000)
               (COND
                ((|domainEqual| |#1|
                                (|PrimeField|
                                 (PROG1 (LETT #4# (QREFELT $ 55) . #33#)
                                   (|check_subtype| (> #4# 0)
                                                    '(|PositiveInteger|)
                                                    #4#))))
                 (COND
                  ((|domainEqual| |#2|
                                  (|PrimeField|
                                   (PROG1 (LETT #3# (QREFELT $ 55) . #33#)
                                     (|check_subtype| (> #3# 0)
                                                      '(|PositiveInteger|)
                                                      #3#))))
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;121|)
                              $)))
                  ('T
                   (QSETREFV $ 21
                             (CONS
                              (|dispatchFunction|
                               |MODHPS;HP_solve;LL2SNniMMU;122|)
                              $)))))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;123|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;124|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;125|)
                        $))))
           (QSETREFV $ 36
                     (CONS
                      (|dispatchFunction|
                       |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;126|)
                      $))))))
       ('T
        (PROGN
         (SETELT $ 55 (SPADCALL (QREFELT $ 54)))
         (COND
          ((SPADCALL (QREFELT $ 55) 0 (QREFELT $ 58))
           (COND
            ((< (QREFELT $ 55) 32000000)
             (COND
              ((|domainEqual| |#1|
                              (|PrimeField|
                               (PROG1 (LETT #2# (QREFELT $ 55) . #33#)
                                 (|check_subtype| (> #2# 0)
                                                  '(|PositiveInteger|) #2#))))
               (COND
                ((|domainEqual| |#2|
                                (|PrimeField|
                                 (PROG1 (LETT #1# (QREFELT $ 55) . #33#)
                                   (|check_subtype| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    #1#))))
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;127|)
                            $)))
                ('T
                 (QSETREFV $ 21
                           (CONS
                            (|dispatchFunction|
                             |MODHPS;HP_solve;LL2SNniMMU;128|)
                            $)))))
              ('T
               (QSETREFV $ 21
                         (CONS
                          (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;129|)
                          $)))))
            ('T
             (QSETREFV $ 21
                       (CONS
                        (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;130|)
                        $)))))
          ('T
           (QSETREFV $ 21
                     (CONS
                      (|dispatchFunction| |MODHPS;HP_solve;LL2SNniMMU;131|)
                      $))))
         (QSETREFV $ 36
                   (CONS
                    (|dispatchFunction|
                     |MODHPS;gen_Monte_Carlo_check;ML2SNniMM;132|)
                    $)))))
      $)))) 

(MAKEPROP '|ModularHermitePadeSolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| (|Matrix| (|SparseUnivariatePolynomial| 23)) 32)
              (|List| (|List| (|Fraction| 23))) (|List| 23) (|Symbol|)
              (|NonNegativeInteger|) (|Mapping| 27 69 23 23)
              (|Union| '"good" '"reject" '"no_solution")
              (|Mapping| 14 (|List| (|SparseUnivariatePolynomial| 23)))
              (|ModularHermitePade|) (0 . |HP_solve_I|)
              (|Union| (|Matrix| (|SparseUnivariatePolynomial| 7)) 32)
              (|List| (|List| 6)) (|Mapping| 14 34) (10 . |HP_solve|)
              (|Union| 69 '"failed") (|Integer|) (21 . |LLFI_to_LPA|)
              (|List| 11) (28 . |LLF_to_LPA|) (|Vector| 68)
              (|Vector| (|SparseUnivariatePolynomial| 23))
              (37 . |VSUPI_to_VPA|) (|Vector| (|SparseUnivariatePolynomial| 7))
              (43 . |VSUPS_to_VPA|) (|Boolean|) (51 . ~=)
              (|List| (|SparseUnivariatePolynomial| 7)) (57 . |vector|)
              (62 . |gen_Monte_Carlo_check|)
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|Polynomial| 23))) 32)
              (|List| (|List| (|Fraction| (|Polynomial| 23))))
              (|Mapping| 14
                         (|List|
                          (|SparseUnivariatePolynomial| (|Polynomial| 23))))
              (72 . |HP_solve_P|) (83 . |LLFPI_to_LPA|)
              (|Vector| (|SparseUnivariatePolynomial| (|Polynomial| 23)))
              (92 . |VSUPPI_to_VPA|) (100 . =) (106 . |get_variables|)
              (|Union|
               (|Matrix| (|SparseUnivariatePolynomial| (|AlgebraicNumber|)))
               32)
              (|List| (|List| (|AlgebraicNumber|)))
              (|Mapping| 14
                         (|List|
                          (|SparseUnivariatePolynomial| (|AlgebraicNumber|))))
              (113 . |HP_solve_A|)
              (|Union|
               (|Matrix|
                (|SparseUnivariatePolynomial|
                 (|Polynomial| (|AlgebraicNumber|))))
               32)
              (|List| (|List| (|Fraction| (|Polynomial| (|AlgebraicNumber|)))))
              (|Mapping| 14
                         (|List|
                          (|SparseUnivariatePolynomial|
                           (|Polynomial| (|AlgebraicNumber|)))))
              (123 . |HP_solve_PA|) (134 . |characteristic|) '|p|
              (138 . |Zero|) (142 . |Zero|) (146 . >) (|List| 10)
              (152 . |HP_solve_M|) (163 . ~=) (|SingleInteger|)
              (169 . |random|) (173 . |random|) (|IntegerPrimesPackage| 23)
              (177 . |nextPrime|) (182 . ~=) (|U32Vector|) (|List| 68)
              (188 . |check_sol1a|) (198 . |One|) (202 . |One|))
           '#(|gen_Monte_Carlo_check| 206 |VSUPS_to_VPA| 216 |LLF_to_LPA| 224
              |HP_solve| 233)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
                                                 '(6 16 8 9 10 11 12 13 15 17 7
                                                   0 18 19 10 11 11 12 13 20 21
                                                   3 16 22 9 23 23 24 5 0 22 19
                                                   23 25 10 23 26 2 16 27 28 23
                                                   29 4 0 27 30 25 10 23 31 2
                                                   11 32 0 0 33 1 30 0 34 35 6
                                                   0 20 20 19 11 11 12 13 36 7
                                                   16 37 38 10 11 11 12 13 39
                                                   40 5 16 22 38 23 25 10 23 41
                                                   4 16 27 42 25 10 23 43 2 11
                                                   32 0 0 44 3 16 25 38 11 11
                                                   45 6 16 46 47 10 11 12 13 48
                                                   49 7 16 50 51 10 11 11 12 13
                                                   52 53 0 6 12 54 0 6 0 56 0 7
                                                   0 57 2 12 32 0 0 58 7 16 8
                                                   59 10 11 23 12 13 15 60 2 23
                                                   32 0 0 61 0 62 0 63 0 32 0
                                                   64 1 65 23 23 66 2 12 32 0 0
                                                   67 6 16 68 27 69 13 23 23 23
                                                   70 0 6 0 71 0 7 0 72 6 0 20
                                                   20 19 11 11 12 13 36 4 0 27
                                                   30 25 10 23 31 5 0 22 19 23
                                                   25 10 23 26 7 0 18 19 10 11
                                                   11 12 13 20 21)))))
           '|lookupComplete|)) 
