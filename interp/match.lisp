
; )package "BOOT"

(IN-PACKAGE "BOOT")

; DEFPARAMETER($wildCard, char "*")

(DEFPARAMETER |$wildCard| (|char| '*))

; anySubstring?(part,whole,startpos) ==
;   np := SIZE part
;   nw := SIZE whole
;   or/[((k := i) and and/[CHAR_-EQUAL(ELT(part, ip),ELT(whole, iw))
;        for ip in 0..np - 1 for iw in i..]) for i in startpos..nw - np] => k

(DEFUN |anySubstring?| (|part| |whole| |startpos|)
  (PROG (|np| |nw| |k|)
    (RETURN
     (PROGN
      (SETQ |np| (SIZE |part|))
      (SETQ |nw| (SIZE |whole|))
      (COND
       (((LAMBDA (|bfVar#4| |bfVar#3| |i|)
           (LOOP
            (COND ((> |i| |bfVar#3|) (RETURN |bfVar#4|))
                  (#1='T
                   (PROGN
                    (SETQ |bfVar#4|
                            (AND (SETQ |k| |i|)
                                 ((LAMBDA (|bfVar#2| |bfVar#1| |ip| |iw|)
                                    (LOOP
                                     (COND
                                      ((> |ip| |bfVar#1|) (RETURN |bfVar#2|))
                                      (#1#
                                       (PROGN
                                        (SETQ |bfVar#2|
                                                (CHAR-EQUAL (ELT |part| |ip|)
                                                            (ELT |whole|
                                                                 |iw|)))
                                        (COND
                                         ((NOT |bfVar#2|) (RETURN NIL))))))
                                     (SETQ |ip| (+ |ip| 1))
                                     (SETQ |iw| (+ |iw| 1))))
                                  T (- |np| 1) 0 |i|)))
                    (COND (|bfVar#4| (RETURN |bfVar#4|))))))
            (SETQ |i| (+ |i| 1))))
         NIL (- |nw| |np|) |startpos|)
        |k|))))))

; stringPosition(s,t,startpos) ==
;   n := SIZE t
;   if startpos < 0 or startpos > n then error '"index out of range"
;   r := search_str(s, t, startpos)
;   if EQ(r,NIL) then n else r

(DEFUN |stringPosition| (|s| |t| |startpos|)
  (PROG (|n| |r|)
    (RETURN
     (PROGN
      (SETQ |n| (SIZE |t|))
      (COND
       ((OR (MINUSP |startpos|) (< |n| |startpos|))
        (|error| "index out of range")))
      (SETQ |r| (|search_str| |s| |t| |startpos|))
      (COND ((EQ |r| NIL) |n|) ('T |r|))))))

; superMatch?(opattern,subject) ==  --subject assumed to be DOWNCASEd
;   $wildCard : local := char '_*
;   pattern := patternCheck opattern
;   logicalMatch?(pattern,subject)

(DEFUN |superMatch?| (|opattern| |subject|)
  (PROG (|$wildCard| |pattern|)
    (DECLARE (SPECIAL |$wildCard|))
    (RETURN
     (PROGN
      (SETQ |$wildCard| (|char| '*))
      (SETQ |pattern| (|patternCheck| |opattern|))
      (|logicalMatch?| |pattern| |subject|)))))

; logicalMatch?(pattern,subject) ==  --subject assumed to be DOWNCASEd
;   pattern is [op,:argl] =>
;     op = "and" => and/[superMatch?(p,subject) for p in argl]
;     op = "or"  =>  or/[superMatch?(p,subject) for p in argl]
;     op = "not" =>  not superMatch?(first argl,subject)
;     systemError '"unknown pattern form"
;   basicMatch?(pattern,subject)

(DEFUN |logicalMatch?| (|pattern| |subject|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |pattern|)
            (PROGN
             (SETQ |op| (CAR |pattern|))
             (SETQ |argl| (CDR |pattern|))
             #1='T))
       (COND
        ((EQ |op| '|and|)
         ((LAMBDA (|bfVar#6| |bfVar#5| |p|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#5|) (PROGN (SETQ |p| (CAR |bfVar#5|)) NIL))
               (RETURN |bfVar#6|))
              (#1#
               (PROGN
                (SETQ |bfVar#6| (|superMatch?| |p| |subject|))
                (COND ((NOT |bfVar#6|) (RETURN NIL))))))
             (SETQ |bfVar#5| (CDR |bfVar#5|))))
          T |argl| NIL))
        ((EQ |op| '|or|)
         ((LAMBDA (|bfVar#8| |bfVar#7| |p|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#7|) (PROGN (SETQ |p| (CAR |bfVar#7|)) NIL))
               (RETURN |bfVar#8|))
              (#1#
               (PROGN
                (SETQ |bfVar#8| (|superMatch?| |p| |subject|))
                (COND (|bfVar#8| (RETURN |bfVar#8|))))))
             (SETQ |bfVar#7| (CDR |bfVar#7|))))
          NIL |argl| NIL))
        ((EQ |op| '|not|) (NULL (|superMatch?| (CAR |argl|) |subject|)))
        (#1# (|systemError| "unknown pattern form"))))
      (#1# (|basicMatch?| |pattern| |subject|))))))

; patternCheck pattern == main where
;  --checks for escape characters, maybe new $wildCard
;   main ==
;     u := pos(char '__,pattern)
;     null u => pattern
;     not(and/[equal(pattern,i + 1,$wildCard) for i in u]) =>
;       sayBrightly ['"Invalid use of underscores in pattern: ",pattern]
;       '"!!!!!!!!!!!!!!"
;     c := wild(pattern,'(_$ _# _% _& _@))
;     $oldWild  :local := $wildCard
;     $wildCard := c
;     pattern := mknew(pattern,first u,rest u,SUBSTRING(pattern,0,first u))
;     pattern
;   mknew(old,i,r,new) ==
;     new := STRCONC(new,old.(i + 1))  --add underscored character to string
;     null r => STRCONC(new,subWild(SUBSTRING(old,i + 2,nil),0))
;     mknew(old,first r,rest r,
;           STRCONC(new,subWild(SUBSTRING(old,i + 2,(first r) - i - 1),i + 1)))
;   subWild(s,i) ==
;     (k := charPosition($oldWild,s,i)) < #s =>
;       STRCONC(SUBSTRING(s,i,k - i),$wildCard,subWild(s,k + 1))
;     SUBSTRING(s,i,nil)
;   pos(c,s) ==
;     i := 0
;     n := MAXINDEX s
;     acc := nil
;     repeat
;       k := charPosition(c,s,i)
;       k > n => return NREVERSE acc
;       acc := [k,:acc]
;       i := k + 1
;   equal(p,n,c) ==
;     n > MAXINDEX p => false
;     p.n = c
;   wild(p,u) ==
;     for id in u repeat
;       c := char id
;       not(or/[p.i = c for i in 0..MAXINDEX(p)]) => return c

(DEFUN |patternCheck| (|pattern|)
  (PROG (|$oldWild| |c| |u|)
    (DECLARE (SPECIAL |$oldWild|))
    (RETURN
     (PROGN
      (SETQ |u| (|patternCheck,pos| (|char| '_) |pattern|))
      (COND ((NULL |u|) |pattern|)
            ((NULL
              ((LAMBDA (|bfVar#10| |bfVar#9| |i|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#9|)
                        (PROGN (SETQ |i| (CAR |bfVar#9|)) NIL))
                    (RETURN |bfVar#10|))
                   (#1='T
                    (PROGN
                     (SETQ |bfVar#10|
                             (|patternCheck,equal| |pattern| (+ |i| 1)
                              |$wildCard|))
                     (COND ((NOT |bfVar#10|) (RETURN NIL))))))
                  (SETQ |bfVar#9| (CDR |bfVar#9|))))
               T |u| NIL))
             (PROGN
              (|sayBrightly|
               (LIST "Invalid use of underscores in pattern: " |pattern|))
              "!!!!!!!!!!!!!!"))
            (#1#
             (PROGN
              (SETQ |c| (|patternCheck,wild| |pattern| '($ |#| % & @)))
              (SETQ |$oldWild| |$wildCard|)
              (SETQ |$wildCard| |c|)
              (SETQ |pattern|
                      (|patternCheck,mknew| |pattern| (CAR |u|) (CDR |u|)
                       (SUBSTRING |pattern| 0 (CAR |u|))))
              |pattern|)))))))
(DEFUN |patternCheck,mknew| (|old| |i| |r| |new|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |new| (STRCONC |new| (ELT |old| (+ |i| 1))))
      (COND
       ((NULL |r|)
        (STRCONC |new|
         (|patternCheck,subWild| (SUBSTRING |old| (+ |i| 2) NIL) 0)))
       ('T
        (|patternCheck,mknew| |old| (CAR |r|) (CDR |r|)
         (STRCONC |new|
          (|patternCheck,subWild|
           (SUBSTRING |old| (+ |i| 2) (- (- (CAR |r|) |i|) 1))
           (+ |i| 1))))))))))
(DEFUN |patternCheck,subWild| (|s| |i|)
  (PROG (|k|)
    (RETURN
     (COND
      ((< (SETQ |k| (|charPosition| |$oldWild| |s| |i|)) (LENGTH |s|))
       (STRCONC (SUBSTRING |s| |i| (- |k| |i|)) |$wildCard|
        (|patternCheck,subWild| |s| (+ |k| 1))))
      ('T (SUBSTRING |s| |i| NIL))))))
(DEFUN |patternCheck,pos| (|c| |s|)
  (PROG (|i| |n| |acc| |k|)
    (RETURN
     (PROGN
      (SETQ |i| 0)
      (SETQ |n| (MAXINDEX |s|))
      (SETQ |acc| NIL)
      ((LAMBDA ()
         (LOOP
          (COND (NIL (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |k| (|charPosition| |c| |s| |i|))
                  (COND ((< |n| |k|) (RETURN (NREVERSE |acc|)))
                        (#1#
                         (PROGN
                          (SETQ |acc| (CONS |k| |acc|))
                          (SETQ |i| (+ |k| 1)))))))))))))))
(DEFUN |patternCheck,equal| (|p| |n| |c|)
  (PROG ()
    (RETURN
     (COND ((< (MAXINDEX |p|) |n|) NIL) ('T (EQUAL (ELT |p| |n|) |c|))))))
(DEFUN |patternCheck,wild| (|p| |u|)
  (PROG (|c|)
    (RETURN
     ((LAMBDA (|bfVar#11| |id|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#11|) (PROGN (SETQ |id| (CAR |bfVar#11|)) NIL))
           (RETURN NIL))
          (#1='T
           (PROGN
            (SETQ |c| (|char| |id|))
            (COND
             ((NULL
               ((LAMBDA (|bfVar#13| |bfVar#12| |i|)
                  (LOOP
                   (COND ((> |i| |bfVar#12|) (RETURN |bfVar#13|))
                         (#1#
                          (PROGN
                           (SETQ |bfVar#13| (EQUAL (ELT |p| |i|) |c|))
                           (COND (|bfVar#13| (RETURN |bfVar#13|))))))
                   (SETQ |i| (+ |i| 1))))
                NIL (MAXINDEX |p|) 0))
              (RETURN |c|))))))
         (SETQ |bfVar#11| (CDR |bfVar#11|))))
      |u| NIL))))

; match?(pattern,subject) ==  --returns index of first character that matches
;   basicMatch?(pattern,DOWNCASE subject)

(DEFUN |match?| (|pattern| |subject|)
  (PROG () (RETURN (|basicMatch?| |pattern| (DOWNCASE |subject|)))))

; basicMatch?(pattern,target) ==
;   n := #pattern
;   p := charPosition($wildCard,pattern,0)
;   p = n => (pattern = target) and 0
;   if p ~= 0 then
;      -- pattern does not begin with a wild card
;      ans := 0
;      s := SUBSTRING(pattern,0,p) --[pattern.i for i in 0..p-1]
;      not substring?(s,target,0) => return false
;   else if n = 1 then return 0
;   i := p   -- starting position for searching the target
;   q := charPosition($wildCard,pattern,p+1)
;   ltarget := #target
;   while q ~= n repeat
;      s := SUBSTRING(pattern,p+1,q-p-1) --[pattern.i for i in (p+1..q-1)]
;      i := stringPosition(s,target,i)
;      if null ans then ans := stringPosition(s,target,p)
;      -- for patterns beginning with wildcard, ans gives position of first match
;      if i = ltarget then return (returnFlag := true)
;      i := i + #s
;      p := q
;      q := charPosition($wildCard,pattern,q+1)
;   returnFlag => false
;   if p ~= q-1 then
;      -- pattern does not end with a wildcard
;      s := SUBSTRING(pattern,p+1,q-p-1) --[pattern.i for i in (p+1..q-1)]
;      if not suffix?(s,target) then return false
;      if null ans then ans := 1  --pattern is a word preceded by a *
;   ans

(DEFUN |basicMatch?| (|pattern| |target|)
  (PROG (|n| |p| |ans| |s| |i| |q| |ltarget| |returnFlag|)
    (RETURN
     (PROGN
      (SETQ |n| (LENGTH |pattern|))
      (SETQ |p| (|charPosition| |$wildCard| |pattern| 0))
      (COND ((EQUAL |p| |n|) (AND (EQUAL |pattern| |target|) 0))
            (#1='T
             (PROGN
              (COND
               ((NOT (EQL |p| 0)) (SETQ |ans| 0)
                (SETQ |s| (SUBSTRING |pattern| 0 |p|))
                (COND ((NULL (|substring?| |s| |target| 0)) (RETURN NIL))))
               ((EQL |n| 1) (RETURN 0)))
              (SETQ |i| |p|)
              (SETQ |q| (|charPosition| |$wildCard| |pattern| (+ |p| 1)))
              (SETQ |ltarget| (LENGTH |target|))
              ((LAMBDA ()
                 (LOOP
                  (COND ((EQUAL |q| |n|) (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |s|
                                  (SUBSTRING |pattern| (+ |p| 1)
                                             (- (- |q| |p|) 1)))
                          (SETQ |i| (|stringPosition| |s| |target| |i|))
                          (COND
                           ((NULL |ans|)
                            (SETQ |ans| (|stringPosition| |s| |target| |p|))))
                          (COND
                           ((EQUAL |i| |ltarget|)
                            (RETURN (SETQ |returnFlag| T))))
                          (SETQ |i| (+ |i| (LENGTH |s|)))
                          (SETQ |p| |q|)
                          (SETQ |q|
                                  (|charPosition| |$wildCard| |pattern|
                                   (+ |q| 1)))))))))
              (COND (|returnFlag| NIL)
                    (#1#
                     (PROGN
                      (COND
                       ((NOT (EQUAL |p| (- |q| 1)))
                        (SETQ |s|
                                (SUBSTRING |pattern| (+ |p| 1)
                                           (- (- |q| |p|) 1)))
                        (COND ((NULL (|suffix?| |s| |target|)) (RETURN NIL)))
                        (COND ((NULL |ans|) (SETQ |ans| 1)))))
                      |ans|))))))))))

; stringMatches?(pattern, subject) ==
;     FIXP basicMatch?(pattern,subject) => true
;     false

(DEFUN |stringMatches?| (|pattern| |subject|)
  (PROG ()
    (RETURN (COND ((FIXP (|basicMatch?| |pattern| |subject|)) T) ('T NIL)))))

; suffix?(s,t) ==
;   m := #s; n := #t
;   if m > n then return false
;   substring?(s,t,(n-m))

(DEFUN |suffix?| (|s| |t|)
  (PROG (|m| |n|)
    (RETURN
     (PROGN
      (SETQ |m| (LENGTH |s|))
      (SETQ |n| (LENGTH |t|))
      (COND ((< |n| |m|) (RETURN NIL)))
      (|substring?| |s| |t| (- |n| |m|))))))
