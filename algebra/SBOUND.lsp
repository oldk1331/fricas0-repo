
(/VERSIONCHECK 2) 

(PUT '|SBOUND;nullBoundary;$;1| '|SPADreplace| '(XLAM NIL (CONS 0 "none"))) 

(DEFUN |SBOUND;nullBoundary;$;1| ($) (CONS 0 "none")) 

(DEFUN |SBOUND;boxBoundary;2PT$;2| (|c1| |c2| $)
  (CONS 1
        (VECTOR '|box| (SPADCALL |c1| |c2| (QREFELT $ 9))
                (SPADCALL |c1| |c2| (QREFELT $ 10))))) 

(DEFUN |SBOUND;ellipseBoundary;2PT$;3| (|c1| |c2| $)
  (CONS 1 (VECTOR '|ellipoid| |c1| |c2|))) 

(DEFUN |SBOUND;union;L$;4| (|x| $) (CONS 2 (CONS '|union| |x|))) 

(DEFUN |SBOUND;intersection;L$;5| (|x| $) (CONS 2 (CONS '|intersection| |x|))) 

(DEFUN |SBOUND;sunion;3$;6| (|x| |y| $)
  (PROG (|ymax| #1=#:G148 |ymin| |xmax| |xmin| #2=#:G179 |res| #3=#:G181 |ptr|
         |p| #4=#:G149 #5=#:G180)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |x| 0)
          (PROGN (LETT #2# |y| . #6=(|SBOUND;sunion;3$;6|)) (GO #2#))))
        (COND ((QEQCAR |y| 0) (PROGN (LETT #2# |x| . #6#) (GO #2#))))
        (COND
         ((QEQCAR |x| 2)
          (SEQ
           (LETT |p|
                 (QCDR
                  (PROG2 (LETT #4# |x| . #6#)
                      (QCDR #4#)
                    (|check_union| (QEQCAR #4# 2)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |parts| (|List| $)))
                                   #4#)))
                 . #6#)
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 18)) 0)
             (PROGN (LETT #2# |y| . #6#) (GO #2#))))
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 18)) 1)
             (PROGN
              (LETT #2#
                    (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |y| (QREFELT $ 20))
                    . #6#)
              (GO #2#))))
           (LETT |res|
                 (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |y| (QREFELT $ 20))
                 . #6#)
           (SEQ (LETT |ptr| 2 . #6#)
                (LETT #5# (SPADCALL |p| (QREFELT $ 18)) . #6#) G190
                (COND ((|greater_SI| |ptr| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT |res|
                        (SPADCALL |res| (SPADCALL |p| |ptr| (QREFELT $ 22))
                                  (QREFELT $ 20))
                        . #6#)))
                (LETT |ptr| (|inc_SI| |ptr|) . #6#) (GO G190) G191 (EXIT NIL))
           (EXIT (PROGN (LETT #2# |res| . #6#) (GO #2#))))))
        (COND
         ((QEQCAR |y| 2)
          (SEQ
           (LETT |p|
                 (QCDR
                  (PROG2 (LETT #4# |y| . #6#)
                      (QCDR #4#)
                    (|check_union| (QEQCAR #4# 2)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |parts| (|List| $)))
                                   #4#)))
                 . #6#)
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 18)) 0)
             (PROGN (LETT #2# |x| . #6#) (GO #2#))))
           (COND
            ((EQL (SPADCALL |p| (QREFELT $ 18)) 1)
             (PROGN
              (LETT #2#
                    (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |x| (QREFELT $ 20))
                    . #6#)
              (GO #2#))))
           (LETT |res|
                 (SPADCALL (SPADCALL |p| (QREFELT $ 19)) |x| (QREFELT $ 20))
                 . #6#)
           (SEQ (LETT |ptr| 2 . #6#)
                (LETT #3# (SPADCALL |p| (QREFELT $ 18)) . #6#) G190
                (COND ((|greater_SI| |ptr| #3#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT |res|
                        (SPADCALL |res| (SPADCALL |p| |ptr| (QREFELT $ 22))
                                  (QREFELT $ 20))
                        . #6#)))
                (LETT |ptr| (|inc_SI| |ptr|) . #6#) (GO G190) G191 (EXIT NIL))
           (EXIT (PROGN (LETT #2# |res| . #6#) (GO #2#))))))
        (LETT |xmin|
              (QVELT
               (PROG2 (LETT #1# |x| . #6#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 1)
                                (|Record| (|:| |ty| (|Symbol|))
                                          (|:| |control1| (QREFELT $ 6))
                                          (|:| |control2| (QREFELT $ 6)))
                                #1#))
               1)
              . #6#)
        (LETT |xmax|
              (QVELT
               (PROG2 (LETT #1# |x| . #6#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 1)
                                (|Record| (|:| |ty| (|Symbol|))
                                          (|:| |control1| (QREFELT $ 6))
                                          (|:| |control2| (QREFELT $ 6)))
                                #1#))
               2)
              . #6#)
        (LETT |ymin|
              (QVELT
               (PROG2 (LETT #1# |y| . #6#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 1)
                                (|Record| (|:| |ty| (|Symbol|))
                                          (|:| |control1| (QREFELT $ 6))
                                          (|:| |control2| (QREFELT $ 6)))
                                #1#))
               1)
              . #6#)
        (LETT |ymax|
              (QVELT
               (PROG2 (LETT #1# |y| . #6#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 1)
                                (|Record| (|:| |ty| (|Symbol|))
                                          (|:| |control1| (QREFELT $ 6))
                                          (|:| |control2| (QREFELT $ 6)))
                                #1#))
               2)
              . #6#)
        (COND
         ((EQUAL
           (QVELT
            (PROG2 (LETT #1# |x| . #6#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 1)
                             (|Record| (|:| |ty| (|Symbol|))
                                       (|:| |control1| (QREFELT $ 6))
                                       (|:| |control2| (QREFELT $ 6)))
                             #1#))
            0)
           '|ellipoid|)
          (SEQ
           (LETT |xmin|
                 (SPADCALL
                  (QVELT
                   (PROG2 (LETT #1# |x| . #6#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |ty| (|Symbol|))
                                              (|:| |control1| (QREFELT $ 6))
                                              (|:| |control2| (QREFELT $ 6)))
                                    #1#))
                   1)
                  (QVELT
                   (PROG2 (LETT #1# |x| . #6#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |ty| (|Symbol|))
                                              (|:| |control1| (QREFELT $ 6))
                                              (|:| |control2| (QREFELT $ 6)))
                                    #1#))
                   2)
                  (QREFELT $ 23))
                 . #6#)
           (EXIT
            (LETT |xmax|
                  (SPADCALL
                   (QVELT
                    (PROG2 (LETT #1# |x| . #6#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    1)
                   (QVELT
                    (PROG2 (LETT #1# |x| . #6#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    2)
                   (QREFELT $ 24))
                  . #6#)))))
        (COND
         ((EQUAL
           (QVELT
            (PROG2 (LETT #1# |y| . #6#)
                (QCDR #1#)
              (|check_union| (QEQCAR #1# 1)
                             (|Record| (|:| |ty| (|Symbol|))
                                       (|:| |control1| (QREFELT $ 6))
                                       (|:| |control2| (QREFELT $ 6)))
                             #1#))
            0)
           '|ellipoid|)
          (SEQ
           (LETT |ymin|
                 (SPADCALL
                  (QVELT
                   (PROG2 (LETT #1# |y| . #6#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |ty| (|Symbol|))
                                              (|:| |control1| (QREFELT $ 6))
                                              (|:| |control2| (QREFELT $ 6)))
                                    #1#))
                   1)
                  (QVELT
                   (PROG2 (LETT #1# |y| . #6#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |ty| (|Symbol|))
                                              (|:| |control1| (QREFELT $ 6))
                                              (|:| |control2| (QREFELT $ 6)))
                                    #1#))
                   2)
                  (QREFELT $ 23))
                 . #6#)
           (EXIT
            (LETT |ymax|
                  (SPADCALL
                   (QVELT
                    (PROG2 (LETT #1# |y| . #6#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    1)
                   (QVELT
                    (PROG2 (LETT #1# |y| . #6#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    2)
                   (QREFELT $ 24))
                  . #6#)))))
        (EXIT
         (CONS 1
               (VECTOR '|box| (SPADCALL |xmin| |ymin| (QREFELT $ 9))
                       (SPADCALL |xmax| |ymax| (QREFELT $ 10)))))))
      #2# (EXIT #2#))))) 

(DEFUN |SBOUND;extendToPoint;$PT$;7| (|n| |p| $)
  (PROG (|xmax| |xmin| #1=#:G192 |res| #2=#:G193 |ptr| |pa| #3=#:G149)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (PROGN
           (LETT #1# (CONS 1 (VECTOR '|box| |p| |p|))
                 . #4=(|SBOUND;extendToPoint;$PT$;7|))
           (GO #1#))))
        (COND
         ((QEQCAR |n| 2)
          (SEQ
           (LETT |pa|
                 (QCDR
                  (PROG2 (LETT #3# |n| . #4#)
                      (QCDR #3#)
                    (|check_union| (QEQCAR #3# 2)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |parts| (|List| $)))
                                   #3#)))
                 . #4#)
           (COND
            ((EQL (SPADCALL |pa| (QREFELT $ 18)) 0)
             (PROGN
              (LETT #1# (CONS 1 (VECTOR '|box| |p| |p|)) . #4#)
              (GO #1#))))
           (COND
            ((EQL (SPADCALL |pa| (QREFELT $ 18)) 1)
             (PROGN
              (LETT #1#
                    (SPADCALL (SPADCALL |pa| (QREFELT $ 19)) |p|
                              (QREFELT $ 25))
                    . #4#)
              (GO #1#))))
           (LETT |res|
                 (SPADCALL (SPADCALL |pa| (QREFELT $ 19)) |p| (QREFELT $ 25))
                 . #4#)
           (SEQ (LETT |ptr| 2 . #4#)
                (LETT #2# (SPADCALL |pa| (QREFELT $ 18)) . #4#) G190
                (COND ((|greater_SI| |ptr| #2#) (GO G191)))
                (SEQ
                 (EXIT
                  (LETT |res|
                        (SPADCALL |res| (SPADCALL |pa| |ptr| (QREFELT $ 22))
                                  (QREFELT $ 20))
                        . #4#)))
                (LETT |ptr| (|inc_SI| |ptr|) . #4#) (GO G190) G191 (EXIT NIL))
           (EXIT (PROGN (LETT #1# |res| . #4#) (GO #1#))))))
        (LETT |xmin| (SPADCALL |n| (QREFELT $ 26)) . #4#)
        (LETT |xmax| (SPADCALL |n| (QREFELT $ 27)) . #4#)
        (EXIT
         (CONS 1
               (VECTOR '|box| (SPADCALL |xmin| |p| (QREFELT $ 9))
                       (SPADCALL |xmax| |p| (QREFELT $ 10)))))))
      #1# (EXIT #1#))))) 

(DEFUN |SBOUND;containsPoint?;$PTB;8| (|n| |p| $)
  (PROG (#1=#:G148 #2=#:G202 |rDist| |pDist| |pRel| #3=#:G203 |sub| |pa|
         #4=#:G149)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (PROGN
           (LETT #2# 'NIL . #5=(|SBOUND;containsPoint?;$PTB;8|))
           (GO #2#))))
        (COND
         ((QEQCAR |n| 2)
          (SEQ
           (LETT |pa|
                 (QCDR
                  (PROG2 (LETT #4# |n| . #5#)
                      (QCDR #4#)
                    (|check_union| (QEQCAR #4# 2)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |parts| (|List| $)))
                                   #4#)))
                 . #5#)
           (SEQ (LETT |sub| NIL . #5#) (LETT #3# |pa| . #5#) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |sub| (CAR #3#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (COND
                   ((SPADCALL |sub| |p| (QREFELT $ 29))
                    (PROGN (LETT #2# 'T . #5#) (GO #2#))))))
                (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
           (EXIT (PROGN (LETT #2# 'NIL . #5#) (GO #2#))))))
        (COND
         ((SPADCALL |n| (QREFELT $ 30))
          (SEQ
           (LETT |pRel|
                 (SPADCALL
                  (QVELT
                   (PROG2 (LETT #1# |n| . #5#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 1)
                                    (|Record| (|:| |ty| (|Symbol|))
                                              (|:| |control1| (QREFELT $ 6))
                                              (|:| |control2| (QREFELT $ 6)))
                                    #1#))
                   1)
                  |p| (QREFELT $ 23))
                 . #5#)
           (LETT |pDist|
                 (|add_DF|
                  (|mul_DF| (SPADCALL |pRel| (QREFELT $ 32))
                            (SPADCALL |pRel| (QREFELT $ 32)))
                  (|mul_DF| (SPADCALL |pRel| (QREFELT $ 33))
                            (SPADCALL |pRel| (QREFELT $ 33))))
                 . #5#)
           (LETT |rDist|
                 (|add_DF|
                  (|mul_DF|
                   (SPADCALL
                    (QVELT
                     (PROG2 (LETT #1# |n| . #5#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      #1#))
                     2)
                    (QREFELT $ 32))
                   (SPADCALL
                    (QVELT
                     (PROG2 (LETT #1# |n| . #5#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      #1#))
                     2)
                    (QREFELT $ 32)))
                  (|mul_DF|
                   (SPADCALL
                    (QVELT
                     (PROG2 (LETT #1# |n| . #5#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      #1#))
                     2)
                    (QREFELT $ 33))
                   (SPADCALL
                    (QVELT
                     (PROG2 (LETT #1# |n| . #5#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      #1#))
                     2)
                    (QREFELT $ 33))))
                 . #5#)
           (EXIT
            (PROGN
             (LETT #2# (SPADCALL |rDist| |pDist| (QREFELT $ 34)) . #5#)
             (GO #2#))))))
        (EXIT
         (SPADCALL |p|
                   (QVELT
                    (PROG2 (LETT #1# |n| . #5#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    1)
                   (QVELT
                    (PROG2 (LETT #1# |n| . #5#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    2)
                   (QREFELT $ 35)))))
      #2# (EXIT #2#))))) 

(DEFUN |SBOUND;lineIntersect;$2PT;9| (|n| |p| $)
  (PROG (|y| |x| |yp| |xp| |b| |a| |rad| #1=#:G148 |pRel| |cent| #2=#:G215
         |divisor| |ab| |centre|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((QEQCAR |n| 0)
          (PROGN
           (LETT #2# |p| . #3=(|SBOUND;lineIntersect;$2PT;9|))
           (GO #2#))))
        (COND
         ((QEQCAR |n| 2)
          (|error| "cant compute lineIntersect with compound border")))
        (COND
         ((SPADCALL |n| (QREFELT $ 30))
          (SEQ
           (LETT |centre|
                 (QVELT
                  (PROG2 (LETT #1# |n| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 1)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |control1| (QREFELT $ 6))
                                             (|:| |control2| (QREFELT $ 6)))
                                   #1#))
                  1)
                 . #3#)
           (LETT |rad|
                 (QVELT
                  (PROG2 (LETT #1# |n| . #3#)
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 1)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |control1| (QREFELT $ 6))
                                             (|:| |control2| (QREFELT $ 6)))
                                   #1#))
                  2)
                 . #3#)
           (LETT |pRel| (SPADCALL |p| |centre| (QREFELT $ 23)) . #3#)
           (LETT |a| (SPADCALL |rad| (QREFELT $ 32)) . #3#)
           (LETT |b| (SPADCALL |rad| (QREFELT $ 33)) . #3#)
           (LETT |xp| (SPADCALL |pRel| (QREFELT $ 32)) . #3#)
           (LETT |yp| (SPADCALL |pRel| (QREFELT $ 33)) . #3#)
           (LETT |ab| (|mul_DF| |a| |b|) . #3#)
           (LETT |divisor|
                 (SPADCALL
                  (|add_DF| (|mul_DF| (|mul_DF| (|mul_DF| |a| |a|) |yp|) |yp|)
                            (|mul_DF| (|mul_DF| (|mul_DF| |b| |b|) |xp|) |xp|))
                  (QREFELT $ 36))
                 . #3#)
           (LETT |x| 0.0 . #3#) (LETT |y| 0.0 . #3#)
           (COND
            ((NULL (|eql_DF| |divisor| 0.0))
             (SEQ (LETT |x| (|div_DF| (|mul_DF| |ab| |xp|) |divisor|) . #3#)
                  (EXIT
                   (LETT |y| (|div_DF| (|mul_DF| |ab| |yp|) |divisor|)
                         . #3#)))))
           (EXIT
            (PROGN
             (LETT #2#
                   (SPADCALL |centre| (SPADCALL |x| |y| (QREFELT $ 37))
                             (QREFELT $ 24))
                   . #3#)
             (GO #2#))))))
        (LETT |cent|
              (SPADCALL
               (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40)) (QREFELT $ 41))
               (SPADCALL
                (QVELT
                 (PROG2 (LETT #1# |n| . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |ty| (|Symbol|))
                                            (|:| |control1| (QREFELT $ 6))
                                            (|:| |control2| (QREFELT $ 6)))
                                  #1#))
                 1)
                (QVELT
                 (PROG2 (LETT #1# |n| . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |ty| (|Symbol|))
                                            (|:| |control1| (QREFELT $ 6))
                                            (|:| |control2| (QREFELT $ 6)))
                                  #1#))
                 2)
                (QREFELT $ 24))
               (QREFELT $ 42))
              . #3#)
        (LETT |pRel| (SPADCALL |p| |cent| (QREFELT $ 23)) . #3#)
        (LETT |rad|
              (SPADCALL
               (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40)) (QREFELT $ 41))
               (SPADCALL
                (QVELT
                 (PROG2 (LETT #1# |n| . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |ty| (|Symbol|))
                                            (|:| |control1| (QREFELT $ 6))
                                            (|:| |control2| (QREFELT $ 6)))
                                  #1#))
                 2)
                (QVELT
                 (PROG2 (LETT #1# |n| . #3#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 1)
                                  (|Record| (|:| |ty| (|Symbol|))
                                            (|:| |control1| (QREFELT $ 6))
                                            (|:| |control2| (QREFELT $ 6)))
                                  #1#))
                 1)
                (QREFELT $ 23))
               (QREFELT $ 42))
              . #3#)
        (LETT |a| (SPADCALL |rad| (QREFELT $ 32)) . #3#)
        (LETT |b| (SPADCALL |rad| (QREFELT $ 33)) . #3#)
        (LETT |xp| (SPADCALL |pRel| (QREFELT $ 32)) . #3#)
        (LETT |yp| (SPADCALL |pRel| (QREFELT $ 33)) . #3#)
        (LETT |x|
              (COND
               ((SPADCALL |yp| 0.0 (QREFELT $ 45))
                (|div_DF| (|mul_DF| |b| |xp|) |yp|))
               (#4='T (|add_DF| |a| 1.0)))
              . #3#)
        (LETT |y|
              (COND ((SPADCALL |yp| 0.0 (QREFELT $ 34)) |b|)
                    (#4# (|minus_DF| |b|)))
              . #3#)
        (COND ((|less_DF| |yp| 0.0) (LETT |x| (|minus_DF| |x|) . #3#)))
        (COND
         ((OR (SPADCALL |x| |a| (QREFELT $ 34))
              (|less_DF| |x| (|minus_DF| |a|)))
          (SEQ
           (LETT |y|
                 (COND
                  ((SPADCALL |xp| 0.0 (QREFELT $ 45))
                   (|div_DF| (|mul_DF| |a| |yp|) |xp|))
                  (#4# |b|))
                 . #3#)
           (LETT |x|
                 (COND ((SPADCALL |xp| 0.0 (QREFELT $ 34)) |a|)
                       (#4# (|minus_DF| |a|)))
                 . #3#)
           (EXIT
            (COND ((|less_DF| |xp| 0.0) (LETT |y| (|minus_DF| |y|) . #3#)))))))
        (EXIT
         (SPADCALL |cent| (SPADCALL |x| |y| (QREFELT $ 37)) (QREFELT $ 24)))))
      #2# (EXIT #2#))))) 

(PUT '|SBOUND;isNull?;$B;10| '|SPADreplace| '(XLAM (|n|) (QEQCAR |n| 0))) 

(DEFUN |SBOUND;isNull?;$B;10| (|n| $) (QEQCAR |n| 0)) 

(DEFUN |SBOUND;isEllipse?;$B;11| (|n| $)
  (PROG (#1=#:G223)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL (QEQCAR |n| 1))
          (PROGN (LETT #1# 'NIL |SBOUND;isEllipse?;$B;11|) (GO #1#))))
        (EXIT (EQUAL (QVELT (CDR |n|) 0) '|ellipoid|))))
      #1# (EXIT #1#))))) 

(DEFUN |SBOUND;isBox?;$B;12| (|n| $)
  (PROG (#1=#:G230)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((NULL (QEQCAR |n| 1))
          (PROGN (LETT #1# 'NIL |SBOUND;isBox?;$B;12|) (GO #1#))))
        (EXIT (EQUAL (QVELT (CDR |n|) 0) '|box|))))
      #1# (EXIT #1#))))) 

(DEFUN |SBOUND;getMin;$PT;13| (|n| $)
  (PROG (#1=#:G148 #2=#:G234)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| (QREFELT $ 30))
          (PROGN
           (LETT #2#
                 (SPADCALL
                  (SPADCALL
                   (QVELT
                    (PROG2 (LETT #1# |n| . #3=(|SBOUND;getMin;$PT;13|))
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    1)
                   (QVELT
                    (PROG2 (LETT #1# |n| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    2)
                   (QREFELT $ 23))
                  (QREFELT $ 49))
                 . #3#)
           (GO #2#))))
        (EXIT
         (QVELT
          (PROG2 (LETT #1# |n| . #3#)
              (QCDR #1#)
            (|check_union| (QEQCAR #1# 1)
                           (|Record| (|:| |ty| (|Symbol|))
                                     (|:| |control1| (QREFELT $ 6))
                                     (|:| |control2| (QREFELT $ 6)))
                           #1#))
          1))))
      #2# (EXIT #2#))))) 

(DEFUN |SBOUND;getMax;$PT;14| (|n| $)
  (PROG (#1=#:G148 #2=#:G238)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| (QREFELT $ 30))
          (PROGN
           (LETT #2#
                 (SPADCALL
                  (SPADCALL
                   (QVELT
                    (PROG2 (LETT #1# |n| . #3=(|SBOUND;getMax;$PT;14|))
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    1)
                   (QVELT
                    (PROG2 (LETT #1# |n| . #3#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 1)
                                     (|Record| (|:| |ty| (|Symbol|))
                                               (|:| |control1| (QREFELT $ 6))
                                               (|:| |control2| (QREFELT $ 6)))
                                     #1#))
                    2)
                   (QREFELT $ 24))
                  (QREFELT $ 49))
                 . #3#)
           (GO #2#))))
        (EXIT
         (QVELT
          (PROG2 (LETT #1# |n| . #3#)
              (QCDR #1#)
            (|check_union| (QEQCAR #1# 1)
                           (|Record| (|:| |ty| (|Symbol|))
                                     (|:| |control1| (QREFELT $ 6))
                                     (|:| |control2| (QREFELT $ 6)))
                           #1#))
          2))))
      #2# (EXIT #2#))))) 

(DEFUN |SBOUND;getCentre;$PT;15| (|n| $)
  (PROG (#1=#:G148 #2=#:G242)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((SPADCALL |n| (QREFELT $ 30))
          (PROGN
           (LETT #2#
                 (QVELT
                  (PROG2 (LETT #1# |n| . #3=(|SBOUND;getCentre;$PT;15|))
                      (QCDR #1#)
                    (|check_union| (QEQCAR #1# 1)
                                   (|Record| (|:| |ty| (|Symbol|))
                                             (|:| |control1| (QREFELT $ 6))
                                             (|:| |control2| (QREFELT $ 6)))
                                   #1#))
                  1)
                 . #3#)
           (GO #2#))))
        (EXIT
         (SPADCALL (SPADCALL (SPADCALL 5 -1 10 (QREFELT $ 40)) (QREFELT $ 41))
                   (SPADCALL
                    (QVELT
                     (PROG2 (LETT #1# |n| . #3#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      #1#))
                     1)
                    (QVELT
                     (PROG2 (LETT #1# |n| . #3#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 1)
                                      (|Record| (|:| |ty| (|Symbol|))
                                                (|:| |control1| (QREFELT $ 6))
                                                (|:| |control2| (QREFELT $ 6)))
                                      #1#))
                     2)
                    (QREFELT $ 24))
                   (QREFELT $ 42)))))
      #2# (EXIT #2#))))) 

(DEFUN |SBOUND;link;2$L;16| (|m| |n| $)
  (PROG (|bn| |bm|)
    (RETURN
     (SEQ
      (LETT |bm| (SPADCALL |m| (SPADCALL |n| (QREFELT $ 50)) (QREFELT $ 46))
            . #1=(|SBOUND;link;2$L;16|))
      (LETT |bn| (SPADCALL |n| (SPADCALL |m| (QREFELT $ 50)) (QREFELT $ 46))
            . #1#)
      (EXIT (LIST |bm| |bn|)))))) 

(DEFUN |SBOUND;coerce;$Of;17| (|n| $)
  (PROG (|sub| #1=#:G254 #2=#:G149 |x| #3=#:G253 #4=#:G252 #5=#:G148 |s| |ty|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ty| (SPADCALL '|none | (QREFELT $ 55))
              . #6=(|SBOUND;coerce;$Of;17|))
        (COND
         ((QEQCAR |n| 1)
          (LETT |ty| (SPADCALL (QVELT (CDR |n|) 0) (QREFELT $ 56)) . #6#)))
        (COND
         ((QEQCAR |n| 2)
          (LETT |ty| (SPADCALL (QCAR (CDR |n|)) (QREFELT $ 56)) . #6#)))
        (LETT |s|
              (SPADCALL (SPADCALL '|bound | (QREFELT $ 55)) |ty|
                        (QREFELT $ 57))
              . #6#)
        (COND ((QEQCAR |n| 0) (PROGN (LETT #4# |s| . #6#) (GO #4#))))
        (COND
         ((QEQCAR |n| 1)
          (PROGN
           (LETT #4#
                 (SPADCALL
                  (LIST |s| ":"
                        (SPADCALL
                         (QVELT
                          (PROG2 (LETT #5# |n| . #6#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 1)
                                           (|Record| (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                           #5#))
                          1)
                         (QREFELT $ 58))
                        (SPADCALL '-> (QREFELT $ 55))
                        (SPADCALL
                         (QVELT
                          (PROG2 (LETT #5# |n| . #6#)
                              (QCDR #5#)
                            (|check_union| (QEQCAR #5# 1)
                                           (|Record| (|:| |ty| (|Symbol|))
                                                     (|:| |control1|
                                                          (QREFELT $ 6))
                                                     (|:| |control2|
                                                          (QREFELT $ 6)))
                                           #5#))
                          2)
                         (QREFELT $ 58)))
                  (QREFELT $ 59))
                 . #6#)
           (GO #4#))))
        (LETT |sub|
              (SPADCALL
               (PROGN
                (LETT #3# NIL . #6#)
                (SEQ (LETT |x| NIL . #6#)
                     (LETT #1#
                           (QCDR
                            (PROG2 (LETT #2# |n| . #6#)
                                (QCDR #2#)
                              (|check_union| (QEQCAR #2# 2)
                                             (|Record| (|:| |ty| (|Symbol|))
                                                       (|:| |parts|
                                                            (|List| $)))
                                             #2#)))
                           . #6#)
                     G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #6#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #3# (CONS (SPADCALL |x| (QREFELT $ 60)) #3#)
                             . #6#)))
                     (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                     (EXIT (NREVERSE #3#))))
               (QREFELT $ 61))
              . #6#)
        (EXIT
         (SPADCALL (LIST |s| (SPADCALL '|:| (QREFELT $ 55)) |sub|)
                   (QREFELT $ 59)))))
      #4# (EXIT #4#))))) 

(DEFUN |SBoundary| (#1=#:G255)
  (PROG ()
    (RETURN
     (PROG (#2=#:G256)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|SBoundary|)
                                           '|domainEqualList|)
                . #3=(|SBoundary|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|SBoundary;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|SBoundary|))))))))))) 

(DEFUN |SBoundary;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SBoundary|))
      (LETT |dv$| (LIST '|SBoundary| DV$1) . #1#)
      (LETT $ (GETREFV 62) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SBoundary| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 7
                (|Union| (|:| |nul| "none")
                         (|:| |simple|
                              (|Record| (|:| |ty| (|Symbol|))
                                        (|:| |control1| |#1|)
                                        (|:| |control2| |#1|)))
                         (|:| |compound|
                              (|Record| (|:| |ty| (|Symbol|))
                                        (|:| |parts| (|List| $))))))
      $)))) 

(MAKEPROP '|SBoundary| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |SBOUND;nullBoundary;$;1| (0 . |min|) (6 . |max|)
              |SBOUND;boxBoundary;2PT$;2| |SBOUND;ellipseBoundary;2PT$;3|
              (|List| $) |SBOUND;union;L$;4| |SBOUND;intersection;L$;5|
              (|NonNegativeInteger|) (|List| $$) (12 . |#|) (17 . |first|)
              |SBOUND;sunion;3$;6| (|Integer|) (22 . |elt|) (28 . -) (34 . +)
              |SBOUND;extendToPoint;$PT$;7| |SBOUND;getMin;$PT;13|
              |SBOUND;getMax;$PT;14| (|Boolean|) |SBOUND;containsPoint?;$PTB;8|
              |SBOUND;isEllipse?;$B;11| (|DoubleFloat|) (40 . |screenCoordX|)
              (45 . |screenCoordY|) (50 . >) (56 . |inBounds?|) (63 . |sqrt|)
              (68 . |svec|) (|PositiveInteger|) (|Float|) (74 . |float|)
              (81 . |coerce|) (86 . *) (|Fraction| 21) (92 . |Zero|) (96 . ~=)
              |SBOUND;lineIntersect;$2PT;9| |SBOUND;isNull?;$B;10|
              |SBOUND;isBox?;$B;12| (102 . |toPoint|) |SBOUND;getCentre;$PT;15|
              (|List| 6) |SBOUND;link;2$L;16| (|Symbol|) (|OutputForm|)
              (107 . |outputForm|) (112 . |coerce|) (117 . |hconcat|)
              (123 . |coerce|) (128 . |hconcat|) |SBOUND;coerce;$Of;17|
              (133 . |bracket|))
           '#(|union| 138 |sunion| 143 |nullBoundary| 149 |link| 153
              |lineIntersect| 159 |isNull?| 165 |isEllipse?| 170 |isBox?| 175
              |intersection| 180 |getMin| 185 |getMax| 190 |getCentre| 195
              |extendToPoint| 200 |ellipseBoundary| 206 |containsPoint?| 212
              |coerce| 218 |boxBoundary| 223)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 61
                                                 '(2 6 0 0 0 9 2 6 0 0 0 10 1
                                                   17 16 0 18 1 17 2 0 19 2 17
                                                   2 0 21 22 2 6 0 0 0 23 2 6 0
                                                   0 0 24 1 6 31 0 32 1 6 31 0
                                                   33 2 31 28 0 0 34 3 6 28 0 0
                                                   0 35 1 31 0 0 36 2 6 0 31 31
                                                   37 3 39 0 21 21 38 40 1 39
                                                   31 0 41 2 6 0 31 0 42 0 43 0
                                                   44 2 31 28 0 0 45 1 6 0 0 49
                                                   1 54 0 53 55 1 53 54 0 56 2
                                                   54 0 0 0 57 1 6 54 0 58 1 54
                                                   0 13 59 1 54 0 13 61 1 0 0
                                                   13 14 2 0 0 0 0 20 0 0 0 8 2
                                                   0 51 0 0 52 2 0 6 0 6 46 1 0
                                                   28 0 47 1 0 28 0 30 1 0 28 0
                                                   48 1 0 0 13 15 1 0 6 0 26 1
                                                   0 6 0 27 1 0 6 0 50 2 0 0 0
                                                   6 25 2 0 0 6 6 12 2 0 28 0 6
                                                   29 1 0 54 0 60 2 0 0 6 6
                                                   11)))))
           '|lookupComplete|)) 
