 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; ncTag x ==
;    not PAIRP x => ncBug('S2CB0031,[])
;    x := QCAR x
;    IDENTP x => x
;    not PAIRP x => ncBug('S2CB0031,[])
;    QCAR x
 
(DEFUN |ncTag| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL (CONSP |x|)) (|ncBug| 'S2CB0031 NIL))
           (#1='T
            (PROGN
             (SETQ |x| (QCAR |x|))
             (COND ((IDENTP |x|) |x|)
                   ((NULL (CONSP |x|)) (|ncBug| 'S2CB0031 NIL))
                   (#1# (QCAR |x|)))))))))
 
; ncAlist x ==
;    not PAIRP x => ncBug('S2CB0031,[])
;    x := QCAR x
;    IDENTP x => NIL
;    not PAIRP x => ncBug('S2CB0031,[])
;    QCDR x
 
(DEFUN |ncAlist| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL (CONSP |x|)) (|ncBug| 'S2CB0031 NIL))
           (#1='T
            (PROGN
             (SETQ |x| (QCAR |x|))
             (COND ((IDENTP |x|) NIL)
                   ((NULL (CONSP |x|)) (|ncBug| 'S2CB0031 NIL))
                   (#1# (QCDR |x|)))))))))
 
; ncEltQ(x,k) ==
;    r := ASSQ(k,ncAlist x)
;    NULL r => ncBug ('S2CB0007,[k])
;    CDR r
 
(DEFUN |ncEltQ| (|x| |k|)
  (PROG (|r|)
    (RETURN
     (PROGN
      (SETQ |r| (ASSQ |k| (|ncAlist| |x|)))
      (COND ((NULL |r|) (|ncBug| 'S2CB0007 (LIST |k|))) ('T (CDR |r|)))))))
 
; ncPutQ(x,k,v) ==
;    LISTP k =>
;       for key in k for val in v repeat ncPutQ(x,key,val)
;       v
;    r := ASSQ(k,ncAlist x)
;    if NULL r then
;       r := CONS( CONS(k,v), ncAlist x)
;       RPLACA(x,CONS(ncTag x,r))
;    else
;       RPLACD(r,v)
;    v
 
(DEFUN |ncPutQ| (|x| |k| |v|)
  (PROG (|r|)
    (RETURN
     (COND
      ((LISTP |k|)
       (PROGN
        ((LAMBDA (|bfVar#1| |key| |bfVar#2| |val|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#1|) (PROGN (SETQ |key| (CAR |bfVar#1|)) NIL)
                  (ATOM |bfVar#2|) (PROGN (SETQ |val| (CAR |bfVar#2|)) NIL))
              (RETURN NIL))
             (#1='T (|ncPutQ| |x| |key| |val|)))
            (SETQ |bfVar#1| (CDR |bfVar#1|))
            (SETQ |bfVar#2| (CDR |bfVar#2|))))
         |k| NIL |v| NIL)
        |v|))
      (#1#
       (PROGN
        (SETQ |r| (ASSQ |k| (|ncAlist| |x|)))
        (COND
         ((NULL |r|) (SETQ |r| (CONS (CONS |k| |v|) (|ncAlist| |x|)))
          (RPLACA |x| (CONS (|ncTag| |x|) |r|)))
         (#1# (RPLACD |r| |v|)))
        |v|))))))
