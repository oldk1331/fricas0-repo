 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; %id a     == [IDENTITY, a]
 
(DEFUN |%id| (|a|) (PROG () (RETURN (LIST IDENTITY |a|))))
 
; %origin x ==
;     [function porigin, x]
 
(DEFUN |%origin| (|x|) (PROG () (RETURN (LIST #'|porigin| |x|))))
 
; porigin x ==
;     (STRINGP x => x; pfname x)
 
(DEFUN |porigin| (|x|)
  (PROG () (RETURN (COND ((STRINGP |x|) |x|) ('T (|pfname| |x|))))))
 
; %fname x ==
;     [function pfname, x]
 
(DEFUN |%fname| (|x|) (PROG () (RETURN (LIST #'|pfname| |x|))))
 
; pfname x ==
;     PathnameString x
 
(DEFUN |pfname| (|x|) (PROG () (RETURN (|PathnameString| |x|))))
 
; ppos p ==
;     pfNoPosition? p => ['"no position"]
;     pfImmediate? p  => ['"console"]
;     cpos := pfCharPosn p
;     lpos := pfLinePosn p
;     org  := porigin pfFileName p
;     [org,'" ",'"line",'" ",lpos]
 
(DEFUN |ppos| (|p|)
  (PROG (|cpos| |lpos| |org|)
    (RETURN
     (COND ((|pfNoPosition?| |p|) (LIST "no position"))
           ((|pfImmediate?| |p|) (LIST "console"))
           ('T
            (PROGN
             (SETQ |cpos| (|pfCharPosn| |p|))
             (SETQ |lpos| (|pfLinePosn| |p|))
             (SETQ |org| (|porigin| (|pfFileName| |p|)))
             (LIST |org| " " "line" " " |lpos|)))))))
