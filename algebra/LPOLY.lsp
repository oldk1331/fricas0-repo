
(/VERSIONCHECK 2) 

(DEFUN |LPOLY;eval1| (|lw| |v| |nv| $)
  (PROG (|r| |l| |s|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |v| (SPADCALL |lw| (QREFELT $ 11)) (QREFELT $ 13)))
        (SPADCALL |lw| (QREFELT $ 14)))
       ('T
        (SEQ (LETT |s| (SPADCALL |lw| (QREFELT $ 16)) . #1=(|LPOLY;eval1|))
             (EXIT
              (COND
               ((QEQCAR |s| 0)
                (COND ((SPADCALL (QCDR |s|) |v| (QREFELT $ 17)) |nv|)
                      (#2='T (SPADCALL |lw| (QREFELT $ 14)))))
               (#2#
                (SEQ (LETT |l| (SPADCALL |lw| (QREFELT $ 18)) . #1#)
                     (LETT |r| (SPADCALL |lw| (QREFELT $ 19)) . #1#)
                     (EXIT
                      (SPADCALL (|LPOLY;eval1| |l| |v| |nv| $)
                                (|LPOLY;eval1| |r| |v| |nv| $)
                                (QREFELT $ 20)))))))))))))) 

(DEFUN |LPOLY;eval2| (|lw| |lv| |lnv| $)
  (PROG (|r| |l| |p| |s|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL |lw| (QREFELT $ 16)) . #1=(|LPOLY;eval2|))
          (EXIT
           (COND
            ((QEQCAR |s| 0)
             (SEQ (LETT |p| (SPADCALL (QCDR |s|) |lv| (QREFELT $ 22)) . #1#)
                  (EXIT
                   (COND ((EQL |p| 0) (SPADCALL |lw| (QREFELT $ 25)))
                         (#2='T (SPADCALL |lnv| |p| (QREFELT $ 27)))))))
            (#2#
             (SEQ (LETT |l| (SPADCALL |lw| (QREFELT $ 18)) . #1#)
                  (LETT |r| (SPADCALL |lw| (QREFELT $ 19)) . #1#)
                  (EXIT
                   (SPADCALL (|LPOLY;eval2| |l| |lv| |lnv| $)
                             (|LPOLY;eval2| |r| |lv| |lnv| $)
                             (QREFELT $ 20))))))))))) 

(DEFUN |LPOLY;eval;$VarSet2$;3| (|p| |v| |nv| $)
  (PROG (#1=#:G136 #2=#:G135 #3=#:G137 #4=#:G139 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;eval;$VarSet2$;3|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|LPOLY;eval1| (QCAR |t|) |v| |nv| $)
                               (QREFELT $ 28))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |LPOLY;eval;$LL$;4| (|p| |lv| |lnv| $)
  (PROG (#1=#:G141 #2=#:G140 #3=#:G142 #4=#:G144 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;eval;$LL$;4|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|)
                               (|LPOLY;eval2| (QCAR |t|) |lv| |lnv| $)
                               (QREFELT $ 28))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |LPOLY;lquo1| (|p| |lw| $)
  (COND ((SPADCALL |p| (QREFELT $ 34)) (|spadConstant| $ 35))
        ((SPADCALL |lw| (QREFELT $ 36))
         (SPADCALL |p| (SPADCALL |lw| (QREFELT $ 37)) (QREFELT $ 38)))
        ('T
         (SPADCALL
          (|LPOLY;lquo1| (|LPOLY;lquo1| |p| (SPADCALL |lw| (QREFELT $ 18)) $)
           (SPADCALL |lw| (QREFELT $ 19)) $)
          (|LPOLY;lquo1| (|LPOLY;lquo1| |p| (SPADCALL |lw| (QREFELT $ 19)) $)
           (SPADCALL |lw| (QREFELT $ 18)) $)
          (QREFELT $ 39))))) 

(DEFUN |LPOLY;rquo1| (|p| |lw| $)
  (COND ((SPADCALL |p| (QREFELT $ 34)) (|spadConstant| $ 35))
        ((SPADCALL |lw| (QREFELT $ 36))
         (SPADCALL |p| (SPADCALL |lw| (QREFELT $ 37)) (QREFELT $ 40)))
        ('T
         (SPADCALL
          (|LPOLY;rquo1| (|LPOLY;rquo1| |p| (SPADCALL |lw| (QREFELT $ 18)) $)
           (SPADCALL |lw| (QREFELT $ 19)) $)
          (|LPOLY;rquo1| (|LPOLY;rquo1| |p| (SPADCALL |lw| (QREFELT $ 19)) $)
           (SPADCALL |lw| (QREFELT $ 18)) $)
          (QREFELT $ 39))))) 

(DEFUN |LPOLY;coef;Xrp$R;7| (|p| |lp| $)
  (SPADCALL |p| (SPADCALL |lp| (QREFELT $ 41)) (QREFELT $ 42))) 

(DEFUN |LPOLY;lquo;Xrp$Xrp;8| (|p| |lp| $)
  (PROG (#1=#:G153 #2=#:G152 #3=#:G154 #4=#:G156 |t|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |lp| (|spadConstant| $ 23) (QREFELT $ 44))
        (|spadConstant| $ 35))
       (#5='T
        (PROGN
         (LETT #1# NIL . #6=(|LPOLY;lquo;Xrp$Xrp;8|))
         (SEQ (LETT |t| NIL . #6#) (LETT #4# |lp| . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL (QCDR |t|) (|LPOLY;lquo1| |p| (QCAR |t|) $)
                                 (QREFELT $ 45))
                       . #6#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 46)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#5# (|spadConstant| $ 35)))))))))) 

(DEFUN |LPOLY;rquo;Xrp$Xrp;9| (|p| |lp| $)
  (PROG (#1=#:G158 #2=#:G157 #3=#:G159 #4=#:G161 |t|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |lp| (|spadConstant| $ 23) (QREFELT $ 44))
        (|spadConstant| $ 35))
       (#5='T
        (PROGN
         (LETT #1# NIL . #6=(|LPOLY;rquo;Xrp$Xrp;9|))
         (SEQ (LETT |t| NIL . #6#) (LETT #4# |lp| . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3#
                       (SPADCALL (QCDR |t|) (|LPOLY;rquo1| |p| (QCAR |t|) $)
                                 (QREFELT $ 45))
                       . #6#)
                 (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 46)) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#5# (|spadConstant| $ 35)))))))))) 

(DEFUN |LPOLY;LiePolyIfCan;XdpU;10| (|p| $)
  (PROG (|p1| |r| |lp| #1=#:G174 |l| |coef| |w| |t|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL (SPADCALL |p| (QREFELT $ 50))) (CONS 1 "failed"))
             ('T
              (SEQ (LETT |p1| |p| . #2=(|LPOLY;LiePolyIfCan;XdpU;10|))
                   (LETT |r| (|spadConstant| $ 23) . #2#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |p1| (|spadConstant| $ 51)
                                     (QREFELT $ 52)))
                          (GO G191)))
                        (SEQ (LETT |t| (SPADCALL |p1| (QREFELT $ 54)) . #2#)
                             (LETT |w| (QCAR |t|) . #2#)
                             (LETT |coef| (QCDR |t|) . #2#)
                             (LETT |l| (SPADCALL |w| (QREFELT $ 57)) . #2#)
                             (EXIT
                              (COND
                               ((QEQCAR |l| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 "failed") . #2#)
                                 (GO #1#)))
                               ('T
                                (SEQ
                                 (LETT |lp|
                                       (SPADCALL |coef|
                                                 (SPADCALL (QCDR |l|)
                                                           (QREFELT $ 14))
                                                 (QREFELT $ 28))
                                       . #2#)
                                 (LETT |r| (SPADCALL |r| |lp| (QREFELT $ 29))
                                       . #2#)
                                 (EXIT
                                  (LETT |p1|
                                        (SPADCALL |p1|
                                                  (SPADCALL |lp|
                                                            (QREFELT $ 58))
                                                  (QREFELT $ 59))
                                        . #2#)))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (CONS 0 |r|))))))
      #1# (EXIT #1#))))) 

(DEFUN |LPOLY;makeLyndon| (|u| |v| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 62)) (SPADCALL |v| (QREFELT $ 62))
            (QREFELT $ 63))) 

(DEFUN |LPOLY;crw| (|u| |v| $)
  (COND ((SPADCALL |u| |v| (QREFELT $ 64)) (|spadConstant| $ 23))
        ((SPADCALL |u| |v| (QREFELT $ 65)) (|LPOLY;lyndon| |u| |v| $))
        ('T (SPADCALL (|LPOLY;lyndon| |v| |u| $) (QREFELT $ 66))))) 

(DEFUN |LPOLY;lyndon| (|u| |v| $)
  (PROG (|u2| |u1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |u| (QREFELT $ 36))
        (SPADCALL (|LPOLY;makeLyndon| |u| |v| $) (|spadConstant| $ 67)
                  (QREFELT $ 68)))
       (#1='T
        (SEQ (LETT |u1| (SPADCALL |u| (QREFELT $ 18)) . #2=(|LPOLY;lyndon|))
             (LETT |u2| (SPADCALL |u| (QREFELT $ 19)) . #2#)
             (EXIT
              (COND
               ((SPADCALL |u2| |v| (QREFELT $ 65))
                (SPADCALL (|LPOLY;cr1| |u1| (|LPOLY;lyndon| |u2| |v| $) $)
                          (|LPOLY;cr2| (|LPOLY;lyndon| |u1| |v| $) |u2| $)
                          (QREFELT $ 29)))
               (#1#
                (SPADCALL (|LPOLY;makeLyndon| |u| |v| $) (|spadConstant| $ 67)
                          (QREFELT $ 68)))))))))))) 

(DEFUN |LPOLY;cr1| (|l| |p| $)
  (PROG (#1=#:G182 #2=#:G181 #3=#:G183 #4=#:G185 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;cr1|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|LPOLY;crw| |l| (QCAR |t|) $)
                               (QREFELT $ 28))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |LPOLY;cr2| (|p| |l| $)
  (PROG (#1=#:G187 #2=#:G186 #3=#:G188 #4=#:G190 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;cr2|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|LPOLY;crw| (QCAR |t|) |l| $)
                               (QREFELT $ 28))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |LPOLY;DPoly| (|w| $)
  (PROG (|r| |l|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |w| (QREFELT $ 36))
        (SPADCALL (SPADCALL |w| (QREFELT $ 37)) (QREFELT $ 69)))
       ('T
        (SEQ
         (LETT |l| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT $ 18)) $)
               . #1=(|LPOLY;DPoly|))
         (LETT |r| (|LPOLY;DPoly| (SPADCALL |w| (QREFELT $ 19)) $) . #1#)
         (EXIT
          (SPADCALL (SPADCALL |l| |r| (QREFELT $ 70))
                    (SPADCALL |r| |l| (QREFELT $ 70)) (QREFELT $ 59)))))))))) 

(DEFUN |LPOLY;RPoly| (|w| $)
  (PROG (|r| |l|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |w| (QREFELT $ 36))
        (SPADCALL (SPADCALL |w| (QREFELT $ 37)) (QREFELT $ 71)))
       ('T
        (SEQ
         (LETT |l| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT $ 18)) $)
               . #1=(|LPOLY;RPoly|))
         (LETT |r| (|LPOLY;RPoly| (SPADCALL |w| (QREFELT $ 19)) $) . #1#)
         (EXIT
          (SPADCALL (SPADCALL |l| |r| (QREFELT $ 72))
                    (SPADCALL |r| |l| (QREFELT $ 72)) (QREFELT $ 39)))))))))) 

(DEFUN |LPOLY;coerce;VarSet$;18| (|v| $)
  (SPADCALL (SPADCALL |v| (QREFELT $ 73)) (|spadConstant| $ 67) (QREFELT $ 68))) 

(DEFUN |LPOLY;construct;3$;19| (|x| |y| $)
  (PROG (#1=#:G199 #2=#:G198 #3=#:G200 #4=#:G202 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;construct;3$;19|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |x| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|LPOLY;cr1| (QCAR |t|) |y| $)
                               (QREFELT $ 28))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |LPOLY;construct;Lw2$;20| (|l| |p| $) (|LPOLY;cr1| |l| |p| $)) 

(DEFUN |LPOLY;construct;$Lw$;21| (|p| |l| $) (|LPOLY;cr2| |p| |l| $)) 

(DEFUN |LPOLY;construct;2Lw$;22| (|u| |v| $) (|LPOLY;crw| |u| |v| $)) 

(DEFUN |LPOLY;coerce;$Xdp;23| (|p| $)
  (PROG (#1=#:G207 #2=#:G206 #3=#:G208 #4=#:G210 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;coerce;$Xdp;23|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|LPOLY;DPoly| (QCAR |t|) $)
                               (QREFELT $ 78))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 79)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 51)))))))) 

(DEFUN |LPOLY;coerce;$Xrp;24| (|p| $)
  (PROG (#1=#:G212 #2=#:G211 #3=#:G213 #4=#:G215 |t|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|LPOLY;coerce;$Xrp;24|))
       (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCDR |t|) (|LPOLY;RPoly| (QCAR |t|) $)
                               (QREFELT $ 45))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 46)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 35)))))))) 

(DEFUN |LPOLY;LiePoly;Lw$;25| (|l| $)
  (SPADCALL |l| (|spadConstant| $ 67) (QREFELT $ 68))) 

(DEFUN |LPOLY;varList;$L;26| (|p| $)
  (PROG (|le| #1=#:G218 #2=#:G217 #3=#:G219 #4=#:G222 |t|)
    (RETURN
     (SEQ
      (LETT |le|
            (PROGN
             (LETT #1# NIL . #5=(|LPOLY;varList;$L;26|))
             (SEQ (LETT |t| NIL . #5#) (LETT #4# |p| . #5#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3# (SPADCALL (QCAR |t|) (QREFELT $ 11)) . #5#)
                     (COND
                      (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 80)) . #5#))
                      ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                  (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) ('T (|IdentityError| '|setUnion|))))
            . #5#)
      (EXIT (SPADCALL |le| (QREFELT $ 81))))))) 

(DEFUN |LPOLY;mirror;2$;27| (|p| $)
  (PROG (#1=#:G227 |t| #2=#:G226)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|LPOLY;mirror;2$;27|))
       (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (CONS (QCAR |t|)
                           (COND
                            ((ODDP (SPADCALL (QCAR |t|) (QREFELT $ 84)))
                             (QCDR |t|))
                            ('T (SPADCALL (QCDR |t|) (QREFELT $ 85)))))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |LPOLY;trunc;$Nni$;28| (|p| |n| $)
  (COND
   ((SPADCALL (SPADCALL |p| (QREFELT $ 88)) |n| (QREFELT $ 89))
    (SPADCALL (SPADCALL |p| (QREFELT $ 90)) |n| (QREFELT $ 91)))
   ('T |p|))) 

(DEFUN |LPOLY;degree;$Nni;29| (|p| $)
  (COND ((NULL |p|) 0) ('T (SPADCALL (QCAR (|SPADfirst| |p|)) (QREFELT $ 84))))) 

(DEFUN |LPOLY;outTerm| (|r| |lw| $)
  (COND
   ((SPADCALL |r| (|spadConstant| $ 67) (QREFELT $ 92))
    (SPADCALL |lw| (QREFELT $ 94)))
   ('T
    (SPADCALL (SPADCALL |r| (QREFELT $ 95)) (SPADCALL |lw| (QREFELT $ 94))
              (QREFELT $ 96))))) 

(DEFUN |LPOLY;coerce;$Of;31| (|a| $)
  (PROG (#1=#:G238 |t| #2=#:G237)
    (RETURN
     (SEQ
      (COND ((NULL |a|) (SPADCALL (|spadConstant| $ 24) (QREFELT $ 95)))
            ('T
             (SPADCALL (ELT $ 97)
                       (NREVERSE
                        (PROGN
                         (LETT #2# NIL . #3=(|LPOLY;coerce;$Of;31|))
                         (SEQ (LETT |t| NIL . #3#) (LETT #1# |a| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (|LPOLY;outTerm| (QCDR |t|) (QCAR |t|)
                                        $)
                                       #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                       (QREFELT $ 100)))))))) 

(DECLAIM (NOTINLINE |LiePolynomial;|)) 

(DEFUN |LiePolynomial| (&REST #1=#:G246)
  (PROG ()
    (RETURN
     (PROG (#2=#:G247)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|LiePolynomial|)
                                           '|domainEqualList|)
                . #3=(|LiePolynomial|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |LiePolynomial;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|LiePolynomial|))))))))))) 

(DEFUN |LiePolynomial;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|LiePolynomial|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|LiePolynomial| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 112) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRing|))
                                          (AND
                                           (|HasCategory| |#2|
                                                          '(|OrderedAbelianMonoidSup|))
                                           (|HasCategory| (|LyndonWord| |#1|)
                                                          '(|OrderedSet|)))
                                          (OR
                                           (|HasCategory| |#2| '(|Comparable|))
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|))))
                                          (OR
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|))))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#2|
                                                          '(|AbelianMonoid|))
                                           (|HasCategory| |#2|
                                                          '(|CancellationAbelianMonoid|)))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#2|
                                                          '(|CancellationAbelianMonoid|)))
                                          (|HasCategory| |#2| '(|Field|))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianMonoid|))
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|)))
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|))))
                                          (OR
                                           (|HasCategory| |#2|
                                                          '(|AbelianGroup|))
                                           (|HasCategory| |#2|
                                                          '(|CancellationAbelianMonoid|))
                                           (AND
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            (|HasCategory| (|LyndonWord| |#1|)
                                                           '(|OrderedSet|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|LiePolynomial| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8
                (|List|
                 (|Record| (|:| |k| (|LyndonWord| |#1|)) (|:| |c| |#2|))))
      $)))) 

(MAKEPROP '|LiePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|FreeModule| 7 10) (|local| |#1|)
              (|local| |#2|) '|Rep| (|List| 6) (|LyndonWord| 6) (0 . |varList|)
              (|Boolean|) (5 . |member?|) |LPOLY;LiePoly;Lw$;25|
              (|Union| 6 '"failed") (11 . |retractIfCan|) (16 . =)
              (22 . |left|) (27 . |right|) |LPOLY;construct;3$;19| (|Integer|)
              (32 . |position|) (38 . |Zero|) (42 . |Zero|) (46 . |coerce|)
              (|List| $$) (51 . |elt|) (57 . *) (63 . +)
              |LPOLY;eval;$VarSet2$;3| (|List| $) |LPOLY;eval;$LL$;4|
              (|XRecursivePolynomial| 6 7) (69 . |constant?|) (74 . |Zero|)
              (78 . |retractable?|) (83 . |retract|) (88 . |lquo|) (94 . -)
              (100 . |rquo|) |LPOLY;coerce;$Xrp;24| (106 . |coef|)
              |LPOLY;coef;Xrp$R;7| (112 . =) (118 . *) (124 . +)
              |LPOLY;lquo;Xrp$Xrp;8| |LPOLY;rquo;Xrp$Xrp;9|
              (|XDistributedPolynomial| 6 7) (130 . |quasiRegular?|)
              (135 . |Zero|) (139 . ~=) (|Record| (|:| |k| 56) (|:| |c| 7))
              (145 . |mindegTerm|) (|Union| $ '"failed")
              (|OrderedFreeMonoid| 6) (150 . |lyndonIfCan|)
              |LPOLY;coerce;$Xdp;23| (155 . -) |LPOLY;LiePolyIfCan;XdpU;10|
              (|Magma| 6) (161 . |coerce|) (166 . *) (172 . =) (178 . |lexico|)
              (184 . -) (189 . |One|) (193 . |monom|) (199 . |coerce|)
              (204 . *) (210 . |coerce|) (215 . *) (221 . |coerce|)
              |LPOLY;coerce;VarSet$;18| |LPOLY;construct;Lw2$;20|
              |LPOLY;construct;$Lw$;21| |LPOLY;construct;2Lw$;22| (226 . *)
              (232 . +) (238 . |setUnion|) (244 . |sort|) |LPOLY;varList;$L;26|
              (|PositiveInteger|) (249 . |length|) (254 . -)
              |LPOLY;mirror;2$;27| (|NonNegativeInteger|)
              |LPOLY;degree;$Nni;29| (259 . >) (265 . |reductum|)
              |LPOLY;trunc;$Nni$;28| (270 . =) (|OutputForm|) (276 . |coerce|)
              (281 . |coerce|) (286 . *) (292 . +) (|Mapping| 93 93 93)
              (|List| 93) (298 . |reduce|) |LPOLY;coerce;$Of;31|
              (|Mapping| 7 10) (|Union| 10 '"failed")
              (|Record| (|:| |k| 10) (|:| |c| 7)) (|List| 104) (|Mapping| 7 7)
              (|List| 7) (|List| 10) (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 304 |zero?| 310 |varList| 315 |trunc| 320 |support| 326 |sup|
              331 |subtractIfCan| 337 |smaller?| 343 |sample| 349 |rquo| 353
              |retractIfCan| 359 |retract| 364 |reductum| 369
              |numberOfMonomials| 374 |monomials| 379 |monomial?| 384
              |monomial| 389 |monom| 395 |mirror| 401 |min| 406 |max| 412 |map|
              418 |lquo| 424 |listOfTerms| 430 |linearExtend| 435 |leadingTerm|
              441 |leadingSupport| 446 |leadingMonomial| 451
              |leadingCoefficient| 456 |latex| 461 |hashUpdate!| 466 |hash| 472
              |eval| 477 |degree| 491 |constructOrdered| 496 |construct| 501
              |coerce| 530 |coefficients| 555 |coefficient| 560 |coef| 566
              |Zero| 572 |LiePolyIfCan| 576 |LiePoly| 581 >= 586 > 592 = 598 <=
              604 < 610 / 616 - 622 + 633 * 639)
           'NIL
           (CONS
            (|makeByteWordVec2| 7
                                '(0 0 0 0 0 0 3 0 0 0 3 1 5 5 7 5 6 0 4 0 0 0 2
                                  5))
            (CONS
             '#(NIL |LieAlgebra&| |FreeModuleCategory&| |Module&| NIL NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |AbelianSemiGroup&| NIL |SetCategory&|
                |BasicType&| NIL |RetractableTo&| |PartialOrder&|)
             (CONS
              '#((|FreeLieAlgebra| 6 7) (|LieAlgebra| 7)
                 (|FreeModuleCategory| 7 (|LyndonWord| 6)) (|Module| 7)
                 (|IndexedDirectProductCategory| 7 (|LyndonWord| 6))
                 (|BiModule| 7 7) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|AbelianMonoid|) (|AbelianSemiGroup|)
                 (|Comparable|) (|SetCategory|) (|BasicType|)
                 (|CoercibleTo| 93) (|RetractableTo| (|LyndonWord| 6))
                 (|PartialOrder|))
              (|makeByteWordVec2| 111
                                  '(1 10 9 0 11 2 9 12 6 0 13 1 10 15 0 16 2 6
                                    12 0 0 17 1 10 0 0 18 1 10 0 0 19 2 9 21 6
                                    0 22 0 0 0 23 0 7 0 24 1 0 0 10 25 2 26 2 0
                                    21 27 2 0 0 7 0 28 2 0 0 0 0 29 1 33 12 0
                                    34 0 33 0 35 1 10 12 0 36 1 10 6 0 37 2 33
                                    0 0 6 38 2 33 0 0 0 39 2 33 0 0 6 40 2 33 7
                                    0 0 42 2 0 12 0 0 44 2 33 0 7 0 45 2 33 0 0
                                    0 46 1 49 12 0 50 0 49 0 51 2 49 12 0 0 52
                                    1 49 53 0 54 1 10 55 56 57 2 49 0 0 0 59 1
                                    10 61 0 62 2 61 0 0 0 63 2 10 12 0 0 64 2
                                    10 12 0 0 65 1 0 0 0 66 0 7 0 67 2 0 0 10 7
                                    68 1 49 0 6 69 2 49 0 0 0 70 1 33 0 6 71 2
                                    33 0 0 0 72 1 10 0 6 73 2 49 0 7 0 78 2 49
                                    0 0 0 79 2 9 0 0 0 80 1 9 0 0 81 1 10 83 0
                                    84 1 7 0 0 85 2 87 12 0 0 89 1 0 0 0 90 2 7
                                    12 0 0 92 1 10 93 0 94 1 7 93 0 95 2 93 0 0
                                    0 96 2 93 0 0 0 97 2 99 93 98 0 100 2 0 12
                                    0 0 1 1 9 12 0 1 1 0 9 0 82 2 0 0 0 87 91 1
                                    0 108 0 1 2 3 0 0 0 1 2 10 55 0 0 1 2 4 12
                                    0 0 1 0 9 0 1 2 0 33 33 0 48 1 2 103 0 1 1
                                    2 10 0 1 1 0 0 0 90 1 0 87 0 1 1 0 31 0 1 1
                                    0 12 0 1 2 0 0 7 10 1 2 0 0 10 7 68 1 0 0 0
                                    86 2 5 0 0 0 1 2 5 0 0 0 1 2 0 0 106 0 1 2
                                    0 33 33 0 47 1 0 105 0 1 2 11 7 102 0 1 1 0
                                    104 0 1 1 0 10 0 1 1 0 10 0 1 1 0 7 0 1 1 0
                                    109 0 1 2 0 111 111 0 1 1 0 110 0 1 3 0 0 0
                                    9 31 32 3 0 0 0 6 0 30 1 0 87 0 88 1 0 0
                                    105 1 2 0 0 10 0 75 2 0 0 0 10 76 2 0 0 10
                                    10 77 1 0 0 105 1 2 0 0 0 0 20 1 2 0 10 25
                                    1 0 33 0 41 1 0 0 6 74 1 0 49 0 58 1 0 93 0
                                    101 1 0 107 0 1 2 0 7 0 10 1 2 0 7 33 0 43
                                    0 9 0 23 1 0 55 49 60 1 0 0 10 14 2 5 12 0
                                    0 1 2 5 12 0 0 1 2 0 12 0 0 44 2 5 12 0 0 1
                                    2 5 12 0 0 1 2 8 0 0 7 1 2 1 0 0 0 1 1 1 0
                                    0 66 2 0 0 0 0 29 2 9 0 87 0 1 2 1 0 21 0 1
                                    2 0 0 7 10 1 2 0 0 10 7 1 2 0 0 0 7 1 2 0 0
                                    83 0 1 2 0 0 7 0 28)))))
           '|lookupComplete|)) 
