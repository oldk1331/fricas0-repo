
; )package "BOOT"

(IN-PACKAGE "BOOT")

; rread(key, rstream) ==
;   if IDENTP key then key := PNAME key
;   rread0(key, rstream)

(DEFUN |rread| (|key| |rstream|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((IDENTP |key|) (SETQ |key| (PNAME |key|))))
      (|rread0| |key| |rstream|)))))

; rread_list(key, rstream) ==
;     if IDENTP key then key := PNAME key
;     rread1(key, rstream, [])

(DEFUN |rread_list| (|key| |rstream|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((IDENTP |key|) (SETQ |key| (PNAME |key|))))
      (|rread1| |key| |rstream| NIL)))))

; rwrite(key,val,stream) ==
;   if IDENTP key then key := PNAME key
;   rwrite0(key,val,stream)

(DEFUN |rwrite| (|key| |val| |stream|)
  (PROG ()
    (RETURN
     (PROGN
      (COND ((IDENTP |key|) (SETQ |key| (PNAME |key|))))
      (|rwrite0| |key| |val| |stream|)))))
