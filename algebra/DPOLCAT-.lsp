
(/VERSIONCHECK 2) 

(DEFUN |DPOLCAT-;makeVariable;SM;1| (|s| $)
  (PROG () (RETURN (CONS #'|DPOLCAT-;makeVariable;SM;1!0| (VECTOR $ |s|))))) 

(DEFUN |DPOLCAT-;makeVariable;SM;1!0| (|n| $$)
  (PROG (|s| $)
    (LETT |s| (QREFELT $$ 1) . #1=(|DPOLCAT-;makeVariable;SM;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN (SPADCALL (SPADCALL |s| |n| (QREFELT $ 12)) (QREFELT $ 13)))))) 

(DEFUN |DPOLCAT-;differentiate;AMA;2| (|p| |d| $)
  (PROG (#1=#:G156 |ans| #2=#:G162 #3=#:G161 #4=#:G163 #5=#:G169 |v| #6=#:G159
         |lc| |t| |u| |l|)
    (RETURN
     (SEQ
      (LETT |ans| (|spadConstant| $ 16) . #7=(|DPOLCAT-;differentiate;AMA;2|))
      (LETT |l| (SPADCALL |p| (QREFELT $ 18)) . #7#)
      (SEQ G190
           (COND
            ((NULL (QEQCAR (LETT |u| (SPADCALL |p| (QREFELT $ 20)) . #7#) 1))
             (GO G191)))
           (SEQ (LETT |t| (SPADCALL |p| (QREFELT $ 21)) . #7#)
                (LETT |lc| (SPADCALL |t| (QREFELT $ 22)) . #7#)
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL |ans|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |lc| |d|) (QREFELT $ 23))
                                  (PROG2
                                      (LETT #6#
                                            (SPADCALL |t| |lc| (QREFELT $ 25))
                                            . #7#)
                                      (QCDR #6#)
                                    (|check_union| (QEQCAR #6# 0) (QREFELT $ 6)
                                                   #6#))
                                  (QREFELT $ 26))
                                 (QREFELT $ 27))
                       (PROGN
                        (LETT #2# NIL . #7#)
                        (SEQ (LETT |v| NIL . #7#) (LETT #5# |l| . #7#) G190
                             (COND
                              ((OR (ATOM #5#)
                                   (PROGN (LETT |v| (CAR #5#) . #7#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #4#
                                      (SPADCALL
                                       (SPADCALL |t| |v| (QREFELT $ 28))
                                       (SPADCALL (SPADCALL |v| (QREFELT $ 29))
                                                 (QREFELT $ 13))
                                       (QREFELT $ 26))
                                      . #7#)
                                (COND
                                 (#2#
                                  (LETT #3# (SPADCALL #3# #4# (QREFELT $ 27))
                                        . #7#))
                                 ('T
                                  (PROGN
                                   (LETT #3# #4# . #7#)
                                   (LETT #2# 'T . #7#)))))))
                             (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#2# #3#) ('T (|spadConstant| $ 16))))
                       (QREFELT $ 27))
                      . #7#)
                (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 30)) . #7#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL |ans|
                 (SPADCALL
                  (SPADCALL
                   (PROG2 (LETT #1# |u| . #7#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                   |d|)
                  (QREFELT $ 23))
                 (QREFELT $ 27))))))) 

(DEFUN |DPOLCAT-;order;ANni;3| (|p| $)
  (PROG (#1=#:G171 #2=#:G170 #3=#:G172 #4=#:G175 |v|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |p| (QREFELT $ 34)) 0)
            (#5='T
             (PROGN
              (LETT #1# NIL . #6=(|DPOLCAT-;order;ANni;3|))
              (SEQ (LETT |v| NIL . #6#)
                   (LETT #4# (SPADCALL |p| (QREFELT $ 18)) . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |v| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3# (SPADCALL |v| (QREFELT $ 35)) . #6#)
                      (COND (#1# (LETT #2# (MAX #2# #3#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#5# (|IdentityError| '|max|)))))))))) 

(DEFUN |DPOLCAT-;order;ASNni;4| (|p| |s| $)
  (PROG (#1=#:G178 #2=#:G177 #3=#:G179 #4=#:G185 #5=#:G127 |vv| #6=#:G184 |v|
         #7=#:G183)
    (RETURN
     (SEQ
      (COND
       ((OR (SPADCALL |p| (QREFELT $ 34))
            (NULL
             (LETT |vv|
                   (PROGN
                    (LETT #7# NIL . #8=(|DPOLCAT-;order;ASNni;4|))
                    (SEQ (LETT |v| NIL . #8#)
                         (LETT #6# (SPADCALL |p| (QREFELT $ 18)) . #8#) G190
                         (COND
                          ((OR (ATOM #6#)
                               (PROGN (LETT |v| (CAR #6#) . #8#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |v| (QREFELT $ 37)) |s|
                                       (QREFELT $ 38))
                             (LETT #7# (CONS (SPADCALL |v| (QREFELT $ 35)) #7#)
                                   . #8#)))))
                         (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                         (EXIT (NREVERSE #7#))))
                   . #8#)))
        0)
       ('T
        (PROGN
         (LETT #1# NIL . #8#)
         (SEQ (LETT #5# NIL . #8#) (LETT #4# |vv| . #8#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #8#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3# #5# . #8#)
                 (COND (#1# (LETT #2# (MAX #2# #3#) . #8#))
                       ('T
                        (PROGN (LETT #2# #3# . #8#) (LETT #1# 'T . #8#)))))))
              (LETT #4# (CDR #4#) . #8#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) ('T (|IdentityError| '|max|)))))))))) 

(DEFUN |DPOLCAT-;degree;ASNni;5| (|p| |s| $)
  (PROG (|d| #1=#:G188 #2=#:G187 #3=#:G189 #4=#:G197 #5=#:G128 |lv| #6=#:G196
         |v| #7=#:G195 #8=#:G194 |lp|)
    (RETURN
     (SEQ (LETT |d| 0 . #9=(|DPOLCAT-;degree;ASNni;5|))
          (SEQ (LETT |lp| NIL . #9#)
               (LETT #8# (SPADCALL |p| (QREFELT $ 41)) . #9#) G190
               (COND
                ((OR (ATOM #8#) (PROGN (LETT |lp| (CAR #8#) . #9#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lv|
                      (PROGN
                       (LETT #7# NIL . #9#)
                       (SEQ (LETT |v| NIL . #9#)
                            (LETT #6# (SPADCALL |lp| (QREFELT $ 18)) . #9#)
                            G190
                            (COND
                             ((OR (ATOM #6#)
                                  (PROGN (LETT |v| (CAR #6#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL (SPADCALL |v| (QREFELT $ 37)) |s|
                                          (QREFELT $ 38))
                                (LETT #7# (CONS |v| #7#) . #9#)))))
                            (LETT #6# (CDR #6#) . #9#) (GO G190) G191
                            (EXIT (NREVERSE #7#))))
                      . #9#)
                (EXIT
                 (COND
                  ((NULL (NULL |lv|))
                   (LETT |d|
                         (MAX |d|
                              (PROGN
                               (LETT #1# NIL . #9#)
                               (SEQ (LETT #5# NIL . #9#)
                                    (LETT #4#
                                          (SPADCALL |lp| |lv| (QREFELT $ 43))
                                          . #9#)
                                    G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT #5# (CAR #4#) . #9#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3# #5# . #9#)
                                       (COND (#1# (LETT #2# (+ #2# #3#) . #9#))
                                             ('T
                                              (PROGN
                                               (LETT #2# #3# . #9#)
                                               (LETT #1# 'T . #9#)))))))
                                    (LETT #4# (CDR #4#) . #9#) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#1# #2#) ('T 0))))
                         . #9#)))))
               (LETT #8# (CDR #8#) . #9#) (GO G190) G191 (EXIT NIL))
          (EXIT |d|))))) 

(DEFUN |DPOLCAT-;weights;AL;6| (|p| $)
  (PROG (|ws| |w| #1=#:G200 #2=#:G199 #3=#:G201 #4=#:G209 #5=#:G211 |v|
         #6=#:G212 |d| #7=#:G210 #8=#:G129 |dv| |lv| #9=#:G208 |lp| |mp|)
    (RETURN
     (SEQ (LETT |ws| NIL . #10=(|DPOLCAT-;weights;AL;6|))
          (EXIT
           (COND ((NULL (LETT |mp| (SPADCALL |p| (QREFELT $ 41)) . #10#)) |ws|)
                 ('T
                  (SEQ
                   (SEQ (LETT |lp| NIL . #10#) (LETT #9# |mp| . #10#) G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |lp| (CAR #9#) . #10#) NIL))
                          (GO G191)))
                        (SEQ (LETT |lv| (SPADCALL |lp| (QREFELT $ 18)) . #10#)
                             (EXIT
                              (COND
                               ((NULL (NULL |lv|))
                                (SEQ
                                 (LETT |dv| (SPADCALL |lp| |lv| (QREFELT $ 43))
                                       . #10#)
                                 (LETT |w|
                                       (PROGN
                                        (LETT #1# NIL . #10#)
                                        (SEQ (LETT #8# NIL . #10#)
                                             (LETT #4#
                                                   (PROGN
                                                    (LETT #7# NIL . #10#)
                                                    (SEQ (LETT |d| NIL . #10#)
                                                         (LETT #6# |dv| . #10#)
                                                         (LETT |v| NIL . #10#)
                                                         (LETT #5# |lv| . #10#)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #5#)
                                                               (PROGN
                                                                (LETT |v|
                                                                      (CAR #5#)
                                                                      . #10#)
                                                                NIL)
                                                               (ATOM #6#)
                                                               (PROGN
                                                                (LETT |d|
                                                                      (CAR #6#)
                                                                      . #10#)
                                                                NIL))
                                                           (GO G191)))
                                                         (SEQ
                                                          (EXIT
                                                           (LETT #7#
                                                                 (CONS
                                                                  (*
                                                                   (SPADCALL
                                                                    |v|
                                                                    (QREFELT $
                                                                             45))
                                                                   |d|)
                                                                  #7#)
                                                                 . #10#)))
                                                         (LETT #5#
                                                               (PROG1 (CDR #5#)
                                                                 (LETT #6#
                                                                       (CDR
                                                                        #6#)
                                                                       . #10#))
                                                               . #10#)
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #7#))))
                                                   . #10#)
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT #8# (CAR #4#) . #10#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #3# #8# . #10#)
                                                (COND
                                                 (#1#
                                                  (LETT #2# (+ #2# #3#)
                                                        . #10#))
                                                 ('T
                                                  (PROGN
                                                   (LETT #2# #3# . #10#)
                                                   (LETT #1# 'T . #10#)))))))
                                             (LETT #4# (CDR #4#) . #10#)
                                             (GO G190) G191 (EXIT NIL))
                                        (COND (#1# #2#) ('T 0)))
                                       . #10#)
                                 (EXIT
                                  (LETT |ws| (SPADCALL |ws| |w| (QREFELT $ 46))
                                        . #10#)))))))
                        (LETT #9# (CDR #9#) . #10#) (GO G190) G191 (EXIT NIL))
                   (EXIT |ws|))))))))) 

(DEFUN |DPOLCAT-;weight;ANni;7| (|p| $)
  (PROG (#1=#:G214 #2=#:G213 #3=#:G215 #4=#:G218 #5=#:G130 |ws|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |ws| (SPADCALL |p| (QREFELT $ 48))
               . #6=(|DPOLCAT-;weight;ANni;7|)))
        0)
       (#7='T
        (PROGN
         (LETT #1# NIL . #6#)
         (SEQ (LETT #5# NIL . #6#) (LETT #4# |ws| . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3# #5# . #6#)
                 (COND (#1# (LETT #2# (MAX #2# #3#) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#7# (|IdentityError| '|max|)))))))))) 

(DEFUN |DPOLCAT-;weights;ASL;8| (|p| |s| $)
  (PROG (|ws| |w| #1=#:G222 #2=#:G221 #3=#:G223 #4=#:G233 #5=#:G235 |v|
         #6=#:G236 |d| #7=#:G234 #8=#:G131 |dv| |lv| #9=#:G232 #10=#:G231
         #11=#:G230 |lp| |mp|)
    (RETURN
     (SEQ (LETT |ws| NIL . #12=(|DPOLCAT-;weights;ASL;8|))
          (EXIT
           (COND ((NULL (LETT |mp| (SPADCALL |p| (QREFELT $ 41)) . #12#)) |ws|)
                 ('T
                  (SEQ
                   (SEQ (LETT |lp| NIL . #12#) (LETT #11# |mp| . #12#) G190
                        (COND
                         ((OR (ATOM #11#)
                              (PROGN (LETT |lp| (CAR #11#) . #12#) NIL))
                          (GO G191)))
                        (SEQ
                         (LETT |lv|
                               (PROGN
                                (LETT #10# NIL . #12#)
                                (SEQ (LETT |v| NIL . #12#)
                                     (LETT #9# (SPADCALL |lp| (QREFELT $ 18))
                                           . #12#)
                                     G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN
                                            (LETT |v| (CAR #9#) . #12#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |v| (QREFELT $ 37)) |s|
                                          (QREFELT $ 38))
                                         (LETT #10# (CONS |v| #10#) . #12#)))))
                                     (LETT #9# (CDR #9#) . #12#) (GO G190) G191
                                     (EXIT (NREVERSE #10#))))
                               . #12#)
                         (EXIT
                          (COND
                           ((NULL (NULL |lv|))
                            (SEQ
                             (LETT |dv| (SPADCALL |lp| |lv| (QREFELT $ 43))
                                   . #12#)
                             (LETT |w|
                                   (PROGN
                                    (LETT #1# NIL . #12#)
                                    (SEQ (LETT #8# NIL . #12#)
                                         (LETT #4#
                                               (PROGN
                                                (LETT #7# NIL . #12#)
                                                (SEQ (LETT |d| NIL . #12#)
                                                     (LETT #6# |dv| . #12#)
                                                     (LETT |v| NIL . #12#)
                                                     (LETT #5# |lv| . #12#)
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #5#)
                                                           (PROGN
                                                            (LETT |v| (CAR #5#)
                                                                  . #12#)
                                                            NIL)
                                                           (ATOM #6#)
                                                           (PROGN
                                                            (LETT |d| (CAR #6#)
                                                                  . #12#)
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #7#
                                                             (CONS
                                                              (*
                                                               (SPADCALL |v|
                                                                         (QREFELT
                                                                          $
                                                                          45))
                                                               |d|)
                                                              #7#)
                                                             . #12#)))
                                                     (LETT #5#
                                                           (PROG1 (CDR #5#)
                                                             (LETT #6#
                                                                   (CDR #6#)
                                                                   . #12#))
                                                           . #12#)
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #7#))))
                                               . #12#)
                                         G190
                                         (COND
                                          ((OR (ATOM #4#)
                                               (PROGN
                                                (LETT #8# (CAR #4#) . #12#)
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #3# #8# . #12#)
                                            (COND
                                             (#1#
                                              (LETT #2# (+ #2# #3#) . #12#))
                                             ('T
                                              (PROGN
                                               (LETT #2# #3# . #12#)
                                               (LETT #1# 'T . #12#)))))))
                                         (LETT #4# (CDR #4#) . #12#) (GO G190)
                                         G191 (EXIT NIL))
                                    (COND (#1# #2#) ('T 0)))
                                   . #12#)
                             (EXIT
                              (LETT |ws| (SPADCALL |ws| |w| (QREFELT $ 46))
                                    . #12#)))))))
                        (LETT #11# (CDR #11#) . #12#) (GO G190) G191
                        (EXIT NIL))
                   (EXIT |ws|))))))))) 

(DEFUN |DPOLCAT-;weight;ASNni;9| (|p| |s| $)
  (PROG (#1=#:G238 #2=#:G237 #3=#:G239 #4=#:G242 #5=#:G132 |ws|)
    (RETURN
     (SEQ
      (COND
       ((NULL
         (LETT |ws| (SPADCALL |p| |s| (QREFELT $ 51))
               . #6=(|DPOLCAT-;weight;ASNni;9|)))
        0)
       (#7='T
        (PROGN
         (LETT #1# NIL . #6#)
         (SEQ (LETT #5# NIL . #6#) (LETT #4# |ws| . #6#) G190
              (COND
               ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (PROGN
                 (LETT #3# #5# . #6#)
                 (COND (#1# (LETT #2# (MAX #2# #3#) . #6#))
                       ('T
                        (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
              (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
         (COND (#1# #2#) (#7# (|IdentityError| '|max|)))))))))) 

(DEFUN |DPOLCAT-;isobaric?;AB;10| (|p| $)
  (EQL
   (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 48)) (QREFELT $ 53))
             (QREFELT $ 54))
   1)) 

(DEFUN |DPOLCAT-;leader;AV;11| (|p| $)
  (PROG (#1=#:G245 #2=#:G244 #3=#:G246 #4=#:G249 #5=#:G133 |vl|)
    (RETURN
     (SEQ
      (LETT |vl| (SPADCALL |p| (QREFELT $ 18)) . #6=(|DPOLCAT-;leader;AV;11|))
      (EXIT
       (COND ((NULL |vl|) (|error| "leader is not defined "))
             (#7='T
              (PROGN
               (LETT #1# NIL . #6#)
               (SEQ (LETT #5# NIL . #6#) (LETT #4# |vl| . #6#) G190
                    (COND
                     ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) . #6#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (PROGN
                       (LETT #3# #5# . #6#)
                       (COND
                        (#1#
                         (LETT #2# (SPADCALL #2# #3# (QREFELT $ 56)) . #6#))
                        ('T
                         (PROGN (LETT #2# #3# . #6#) (LETT #1# 'T . #6#)))))))
                    (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
               (COND (#1# #2#) (#7# (|IdentityError| '|max|))))))))))) 

(DEFUN |DPOLCAT-;initial;2A;12| (|p| $)
  (SPADCALL (SPADCALL |p| (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 60))
            (QREFELT $ 62))) 

(DEFUN |DPOLCAT-;separant;2A;13| (|p| $)
  (SPADCALL |p| (SPADCALL |p| (QREFELT $ 58)) (QREFELT $ 28))) 

(DEFUN |DPOLCAT-;coerce;SA;14| (|s| $)
  (SPADCALL (SPADCALL |s| (QREFELT $ 65)) (QREFELT $ 13))) 

(DEFUN |DPOLCAT-;retractIfCan;AU;15| (|p| $)
  (PROG (|v|)
    (RETURN
     (SEQ
      (LETT |v| (SPADCALL |p| (QREFELT $ 68)) |DPOLCAT-;retractIfCan;AU;15|)
      (EXIT
       (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
             ('T (SPADCALL (QCDR |v|) (QREFELT $ 70))))))))) 

(DEFUN |DPOLCAT-;differentialVariables;AL;16| (|p| $)
  (PROG (#1=#:G264 |v| #2=#:G263)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|DPOLCAT-;differentialVariables;AL;16|))
        (SEQ (LETT |v| NIL . #3#)
             (LETT #1# (SPADCALL |p| (QREFELT $ 18)) . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 37)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 73)))))) 

(DEFUN |DPOLCAT-;makeVariable;AM;17| (|p| $)
  (PROG () (RETURN (CONS #'|DPOLCAT-;makeVariable;AM;17!0| (VECTOR $ |p|))))) 

(DEFUN |DPOLCAT-;makeVariable;AM;17!0| (|n| $$)
  (PROG (|p| $)
    (LETT |p| (QREFELT $$ 1) . #1=(|DPOLCAT-;makeVariable;AM;17|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |p| |n| (QREFELT $ 75)))))) 

(DEFUN |DPOLCAT-;eval;ALLA;18| (|p| |sl| |rl| $)
  (PROG (|rrl| |t| |i| #1=#:G282 #2=#:G281 |r| |vl| |j| #3=#:G280 #4=#:G279 |s|
         #5=#:G278 |ordp|)
    (RETURN
     (SEQ
      (LETT |ordp| (SPADCALL |p| (QREFELT $ 77))
            . #6=(|DPOLCAT-;eval;ALLA;18|))
      (LETT |vl|
            (SPADCALL
             (PROGN
              (LETT #5# NIL . #6#)
              (SEQ (LETT |s| NIL . #6#) (LETT #4# |sl| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #5#
                           (CONS
                            (PROGN
                             (LETT #3# NIL . #6#)
                             (SEQ (LETT |j| 0 . #6#) G190
                                  (COND ((|greater_SI| |j| |ordp|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL |s| |j| (QREFELT $ 12))
                                           #3#)
                                          . #6#)))
                                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190)
                                  G191 (EXIT (NREVERSE #3#))))
                            #5#)
                           . #6#)))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                   (EXIT (NREVERSE #5#))))
             (QREFELT $ 78))
            . #6#)
      (LETT |rrl| NIL . #6#)
      (SEQ (LETT |r| NIL . #6#) (LETT #2# |rl| . #6#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #6#) NIL)) (GO G191)))
           (SEQ (LETT |t| |r| . #6#)
                (EXIT
                 (LETT |rrl|
                       (SPADCALL |rrl|
                                 (CONS |r|
                                       (PROGN
                                        (LETT #1# NIL . #6#)
                                        (SEQ (LETT |i| 1 . #6#) G190
                                             (COND
                                              ((|greater_SI| |i| |ordp|)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #1#
                                                     (CONS
                                                      (LETT |t|
                                                            (SPADCALL |t|
                                                                      (QREFELT
                                                                       $ 79))
                                                            . #6#)
                                                      #1#)
                                                     . #6#)))
                                             (LETT |i| (|inc_SI| |i|) . #6#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #1#)))))
                                 (QREFELT $ 81))
                       . #6#)))
           (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |p| |vl| |rrl| (QREFELT $ 82))))))) 

(DEFUN |DPOLCAT-;eval;ALLA;19| (|p| |sl| |rl| $)
  (PROG (|rrl| |t| |i| #1=#:G298 #2=#:G297 |r| |vl| |j| #3=#:G296 #4=#:G295 |s|
         #5=#:G294 |ordp|)
    (RETURN
     (SEQ
      (LETT |ordp| (SPADCALL |p| (QREFELT $ 77))
            . #6=(|DPOLCAT-;eval;ALLA;19|))
      (LETT |vl|
            (SPADCALL
             (PROGN
              (LETT #5# NIL . #6#)
              (SEQ (LETT |s| NIL . #6#) (LETT #4# |sl| . #6#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #5#
                           (CONS
                            (PROGN
                             (LETT #3# NIL . #6#)
                             (SEQ (LETT |j| 0 . #6#) G190
                                  (COND ((|greater_SI| |j| |ordp|) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL |s| |j| (QREFELT $ 12))
                                           #3#)
                                          . #6#)))
                                  (LETT |j| (|inc_SI| |j|) . #6#) (GO G190)
                                  G191 (EXIT (NREVERSE #3#))))
                            #5#)
                           . #6#)))
                   (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                   (EXIT (NREVERSE #5#))))
             (QREFELT $ 78))
            . #6#)
      (LETT |rrl| NIL . #6#)
      (SEQ (LETT |r| NIL . #6#) (LETT #2# |rl| . #6#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#) . #6#) NIL)) (GO G191)))
           (SEQ (LETT |t| |r| . #6#)
                (EXIT
                 (LETT |rrl|
                       (SPADCALL |rrl|
                                 (CONS |r|
                                       (PROGN
                                        (LETT #1# NIL . #6#)
                                        (SEQ (LETT |i| 1 . #6#) G190
                                             (COND
                                              ((|greater_SI| |i| |ordp|)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #1#
                                                     (CONS
                                                      (LETT |t|
                                                            (SPADCALL |t|
                                                                      (QREFELT
                                                                       $ 84))
                                                            . #6#)
                                                      #1#)
                                                     . #6#)))
                                             (LETT |i| (|inc_SI| |i|) . #6#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #1#)))))
                                 (QREFELT $ 86))
                       . #6#)))
           (LETT #2# (CDR #2#) . #6#) (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL |p| |vl| |rrl| (QREFELT $ 87))))))) 

(DEFUN |DPOLCAT-;eval;ALA;20| (|p| |l| $)
  (PROG (#1=#:G305 |e| #2=#:G304 #3=#:G303 #4=#:G302)
    (RETURN
     (SEQ
      (SPADCALL |p|
                (PROGN
                 (LETT #4# NIL . #5=(|DPOLCAT-;eval;ALA;20|))
                 (SEQ (LETT |e| NIL . #5#) (LETT #3# |l| . #5#) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL (SPADCALL |e| (QREFELT $ 90))
                                         (QREFELT $ 91))
                               #4#)
                              . #5#)))
                      (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #4#))))
                (PROGN
                 (LETT #2# NIL . #5#)
                 (SEQ (LETT |e| NIL . #5#) (LETT #1# |l| . #5#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #5#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 92)) #2#)
                              . #5#)))
                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 93)))))) 

(DECLAIM (NOTINLINE |DifferentialPolynomialCategory&;|)) 

(DEFUN |DifferentialPolynomialCategory&| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DifferentialPolynomialCategory&|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|DifferentialPolynomialCategory&| DV$1 DV$2 DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 104) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#2|
                                                         '(|DifferentialRing|))))
                      . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| '(|IntegralDomain|))
        (QSETREFV $ 32
                  (CONS (|dispatchFunction| |DPOLCAT-;differentiate;AMA;2|)
                        $))))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 76
                   (CONS (|dispatchFunction| |DPOLCAT-;makeVariable;AM;17|) $))
         (QSETREFV $ 83 (CONS (|dispatchFunction| |DPOLCAT-;eval;ALLA;18|) $))
         (QSETREFV $ 88 (CONS (|dispatchFunction| |DPOLCAT-;eval;ALLA;19|) $))
         (QSETREFV $ 95
                   (CONS (|dispatchFunction| |DPOLCAT-;eval;ALA;20|) $)))))
      $)))) 

(MAKEPROP '|DifferentialPolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (0 . |makeVariable|) (6 . |coerce|)
              (|Mapping| $ 11) |DPOLCAT-;makeVariable;SM;1| (11 . |Zero|)
              (|List| 9) (15 . |variables|) (|Union| 7 '#1="failed")
              (20 . |retractIfCan|) (25 . |leadingMonomial|)
              (30 . |leadingCoefficient|) (35 . |coerce|) (|Union| $ '"failed")
              (40 . |exquo|) (46 . *) (52 . +) (58 . |differentiate|)
              (64 . |differentiate|) (69 . |reductum|) (|Mapping| 7 7)
              (74 . |differentiate|) (|Boolean|) (80 . |ground?|)
              (85 . |order|) |DPOLCAT-;order;ANni;3| (90 . |variable|) (95 . =)
              |DPOLCAT-;order;ASNni;4| (|List| $) (101 . |monomials|)
              (|List| 11) (106 . |degree|) |DPOLCAT-;degree;ASNni;5|
              (112 . |weight|) (117 . |concat|) |DPOLCAT-;weights;AL;6|
              (123 . |weights|) |DPOLCAT-;weight;ANni;7|
              |DPOLCAT-;weights;ASL;8| (128 . |weights|)
              |DPOLCAT-;weight;ASNni;9| (134 . |removeDuplicates|) (139 . |#|)
              |DPOLCAT-;isobaric?;AB;10| (144 . |max|) |DPOLCAT-;leader;AV;11|
              (150 . |leader|) (|SparseUnivariatePolynomial| $)
              (155 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (161 . |leadingCoefficient|) |DPOLCAT-;initial;2A;12|
              |DPOLCAT-;separant;2A;13| (166 . |coerce|)
              |DPOLCAT-;coerce;SA;14| (|Union| 9 '#1#) (171 . |retractIfCan|)
              (|Union| 8 '#1#) (176 . |retractIfCan|)
              |DPOLCAT-;retractIfCan;AU;15| (|List| 8)
              (181 . |removeDuplicates|) |DPOLCAT-;differentialVariables;AL;16|
              (186 . |differentiate|) (192 . |makeVariable|) (197 . |order|)
              (202 . |concat|) (207 . |differentiate|) (|List| 7)
              (212 . |concat|) (218 . |eval|) (225 . |eval|)
              (232 . |differentiate|) (|List| 6) (237 . |concat|)
              (243 . |eval|) (250 . |eval|) (|Equation| 6) (257 . |lhs|)
              (262 . |retract|) (267 . |rhs|) (272 . |eval|) (|List| 98)
              (279 . |eval|) (|Symbol|) (|List| 96) (|Equation| $)
              (|Union| 101 '#1#) (|Union| 103 '#1#) (|Fraction| 103)
              (|OutputForm|) (|Integer|))
           '#(|weights| 285 |weight| 296 |separant| 307 |retractIfCan| 312
              |order| 317 |makeVariable| 328 |leader| 338 |isobaric?| 343
              |initial| 348 |eval| 353 |differentiate| 373
              |differentialVariables| 379 |degree| 384 |coerce| 390)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 95
                                                 '(2 9 0 8 11 12 1 6 0 9 13 0 6
                                                   0 16 1 6 17 0 18 1 6 19 0 20
                                                   1 6 0 0 21 1 6 7 0 22 1 6 0
                                                   7 23 2 6 24 0 7 25 2 6 0 0 0
                                                   26 2 6 0 0 0 27 2 6 0 0 9 28
                                                   1 9 0 0 29 1 6 0 0 30 2 0 0
                                                   0 31 32 1 6 33 0 34 1 9 11 0
                                                   35 1 9 8 0 37 2 8 33 0 0 38
                                                   1 6 40 0 41 2 6 42 0 17 43 1
                                                   9 11 0 45 2 42 0 0 11 46 1 6
                                                   42 0 48 2 6 42 0 8 51 1 42 0
                                                   0 53 1 42 11 0 54 2 9 0 0 0
                                                   56 1 6 9 0 58 2 6 59 0 9 60
                                                   1 61 6 0 62 1 9 0 8 65 1 6
                                                   67 0 68 1 9 69 0 70 1 72 0 0
                                                   73 2 6 0 0 11 75 1 0 14 0 76
                                                   1 6 11 0 77 1 17 0 40 78 1 7
                                                   0 0 79 2 80 0 0 0 81 3 6 0 0
                                                   17 80 82 3 0 0 0 72 80 83 1
                                                   6 0 0 84 2 85 0 0 0 86 3 6 0
                                                   0 17 40 87 3 0 0 0 72 40 88
                                                   1 89 6 0 90 1 6 8 0 91 1 89
                                                   6 0 92 3 6 0 0 72 40 93 2 0
                                                   0 0 94 95 2 0 42 0 8 50 1 0
                                                   42 0 47 2 0 11 0 8 52 1 0 11
                                                   0 49 1 0 0 0 64 1 0 69 0 71
                                                   2 0 11 0 8 39 1 0 11 0 36 1
                                                   0 14 0 76 1 0 14 8 15 1 0 9
                                                   0 57 1 0 33 0 55 1 0 0 0 63
                                                   3 0 0 0 72 80 83 3 0 0 0 72
                                                   40 88 2 0 0 0 94 95 2 0 0 0
                                                   31 32 1 0 72 0 74 2 0 11 0 8
                                                   44 1 0 0 8 66)))))
           '|lookupComplete|)) 
