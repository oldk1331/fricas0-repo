 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; parseTransform x ==
;   $defOp: local:= nil
;   x := SUBST('$, '%, x) -- for new compiler compatibility
;   parseTran x
 
(DEFUN |parseTransform| (|x|)
  (PROG (|$defOp|)
    (DECLARE (SPECIAL |$defOp|))
    (RETURN
     (PROGN
      (SETQ |$defOp| NIL)
      (SETQ |x| (SUBST '$ '% |x|))
      (|parseTran| |x|)))))
 
; parseTran x ==
;   atom x => parseAtom x
;   [op, :argl] := x
;   u := (op is ['elt, ., x] => x; op)
;   SYMBOLP(u) and (fn := GET(u, 'parseTran)) =>
;       if op ~= u then SAY(["parseTran op ~= u", op, u])
;       FUNCALL(fn, argl)
;   [parseTran op, :parseTranList argl]
 
(DEFUN |parseTran| (|x|)
  (PROG (|op| |argl| |ISTMP#1| |ISTMP#2| |u| |fn|)
    (RETURN
     (COND ((ATOM |x|) (|parseAtom| |x|))
           (#1='T
            (PROGN
             (SETQ |op| (CAR |x|))
             (SETQ |argl| (CDR |x|))
             (SETQ |u|
                     (COND
                      ((AND (CONSP |op|) (EQ (CAR |op|) '|elt|)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |op|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |x| (CAR |ISTMP#2|))
                                         #1#))))))
                       |x|)
                      (#1# |op|)))
             (COND
              ((AND (SYMBOLP |u|) (SETQ |fn| (GET |u| '|parseTran|)))
               (PROGN
                (COND
                 ((NOT (EQUAL |op| |u|))
                  (SAY (LIST '|parseTran op ~= u| |op| |u|))))
                (FUNCALL |fn| |argl|)))
              (#1# (CONS (|parseTran| |op|) (|parseTranList| |argl|))))))))))
 
; parseAtom x ==
;  -- next line for compatibility with new compiler
;   x = 'break => parseLeave ['$NoValue]
;   x
 
(DEFUN |parseAtom| (|x|)
  (PROG ()
    (RETURN
     (COND ((EQ |x| '|break|) (|parseLeave| (LIST '|$NoValue|))) ('T |x|)))))
 
; parseTranList l == [parseTran(y) for y in l]
 
(DEFUN |parseTranList| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#2| |bfVar#1| |y|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#1|) (PROGN (SETQ |y| (CAR |bfVar#1|)) NIL))
           (RETURN (NREVERSE |bfVar#2|)))
          ('T (SETQ |bfVar#2| (CONS (|parseTran| |y|) |bfVar#2|))))
         (SETQ |bfVar#1| (CDR |bfVar#1|))))
      NIL |l| NIL))))
 
; parseIs [a,b] == ["is",parseTran a,transIs parseTran b]
 
(DEFUN |parseIs| (|bfVar#3|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#3|))
      (SETQ |b| (CADR |bfVar#3|))
      (LIST '|is| (|parseTran| |a|) (|transIs| (|parseTran| |b|)))))))
 
; parseIsnt [a,b] == ["isnt",parseTran a,transIs parseTran b]
 
(DEFUN |parseIsnt| (|bfVar#4|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#4|))
      (SETQ |b| (CADR |bfVar#4|))
      (LIST '|isnt| (|parseTran| |a|) (|transIs| (|parseTran| |b|)))))))
 
; transIs u ==
;   isListConstructor u => ['construct,:transIs1 u]
;   u
 
(DEFUN |transIs| (|u|)
  (PROG ()
    (RETURN
     (COND ((|isListConstructor| |u|) (CONS '|construct| (|transIs1| |u|)))
           ('T |u|)))))
 
; isListConstructor u == u is [op,:.] and op in '(construct append cons)
 
(DEFUN |isListConstructor| (|u|)
  (PROG (|op|)
    (RETURN
     (AND (CONSP |u|) (PROGN (SETQ |op| (CAR |u|)) 'T)
          (|member| |op| '(|construct| |append| |cons|))))))
 
; transIs1 u ==
;   u is ['construct,:l] => [transIs x for x in l]
;   u is ['append,x,y] =>
;     h:= [":",transIs x]
;     (v:= transIs1 y) is [":",z] => [h,z]
;     v="nil" => first rest h
;     atom v => [h,[":",v]]
;     [h,:v]
;   u is ['cons,x,y] =>
;     h:= transIs x
;     (v:= transIs1 y) is [":",z] => [h,z]
;     v="nil" => [h]
;     atom v => [h,[":",v]]
;     [h,:v]
;   u
 
(DEFUN |transIs1| (|u|)
  (PROG (|l| |ISTMP#1| |x| |ISTMP#2| |y| |h| |v| |z|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) '|construct|)
            (PROGN (SETQ |l| (CDR |u|)) #1='T))
       ((LAMBDA (|bfVar#6| |bfVar#5| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#5|) (PROGN (SETQ |x| (CAR |bfVar#5|)) NIL))
             (RETURN (NREVERSE |bfVar#6|)))
            (#1# (SETQ |bfVar#6| (CONS (|transIs| |x|) |bfVar#6|))))
           (SETQ |bfVar#5| (CDR |bfVar#5|))))
        NIL |l| NIL))
      ((AND (CONSP |u|) (EQ (CAR |u|) '|append|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1#))))))
       (PROGN
        (SETQ |h| (LIST '|:| (|transIs| |x|)))
        (COND
         ((PROGN
           (SETQ |ISTMP#1| (SETQ |v| (|transIs1| |y|)))
           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                (PROGN
                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                      (PROGN (SETQ |z| (CAR |ISTMP#2|)) #1#)))))
          (LIST |h| |z|))
         ((EQ |v| '|nil|) (CAR (CDR |h|)))
         ((ATOM |v|) (LIST |h| (LIST '|:| |v|))) (#1# (CONS |h| |v|)))))
      ((AND (CONSP |u|) (EQ (CAR |u|) '|cons|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1#))))))
       (PROGN
        (SETQ |h| (|transIs| |x|))
        (COND
         ((PROGN
           (SETQ |ISTMP#1| (SETQ |v| (|transIs1| |y|)))
           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                (PROGN
                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                 (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                      (PROGN (SETQ |z| (CAR |ISTMP#2|)) #1#)))))
          (LIST |h| |z|))
         ((EQ |v| '|nil|) (LIST |h|)) ((ATOM |v|) (LIST |h| (LIST '|:| |v|)))
         (#1# (CONS |h| |v|)))))
      (#1# |u|)))))
 
; parseLET [x,y] ==
;   p := ['LET,parseTran x,parseTranCheckForRecord(y,opOf x)]
;   opOf x = 'cons => ['LET,transIs p.1,p.2]
;   p
 
(DEFUN |parseLET| (|bfVar#7|)
  (PROG (|x| |y| |p|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#7|))
      (SETQ |y| (CADR |bfVar#7|))
      (SETQ |p|
              (LIST 'LET (|parseTran| |x|)
                    (|parseTranCheckForRecord| |y| (|opOf| |x|))))
      (COND
       ((EQ (|opOf| |x|) '|cons|)
        (LIST 'LET (|transIs| (ELT |p| 1)) (ELT |p| 2)))
       ('T |p|))))))
 
; parseColon u ==
;   u is [x] => [":",parseTran x]
;   u is [x, typ] => [":", parseTran x, parseTran typ]
 
(DEFUN |parseColon| (|u|)
  (PROG (|x| |ISTMP#1| |typ|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CDR |u|) NIL) (PROGN (SETQ |x| (CAR |u|)) #1='T))
       (LIST '|:| (|parseTran| |x|)))
      ((AND (CONSP |u|)
            (PROGN
             (SETQ |x| (CAR |u|))
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |typ| (CAR |ISTMP#1|)) #1#))))
       (LIST '|:| (|parseTran| |x|) (|parseTran| |typ|)))))))
 
; parseCoerce [x,typ] ==
;   ["::",parseTran x,parseTran typ]
 
(DEFUN |parseCoerce| (|bfVar#8|)
  (PROG (|x| |typ|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#8|))
      (SETQ |typ| (CADR |bfVar#8|))
      (LIST '|::| (|parseTran| |x|) (|parseTran| |typ|))))))
 
; parseAtSign [x,typ] ==
;   ["@",parseTran x,parseTran typ]
 
(DEFUN |parseAtSign| (|bfVar#9|)
  (PROG (|x| |typ|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#9|))
      (SETQ |typ| (CADR |bfVar#9|))
      (LIST '@ (|parseTran| |x|) (|parseTran| |typ|))))))
 
; parsePretend [x,typ] ==
;   ['pretend,parseTran x,parseTran typ]
 
(DEFUN |parsePretend| (|bfVar#10|)
  (PROG (|x| |typ|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#10|))
      (SETQ |typ| (CADR |bfVar#10|))
      (LIST '|pretend| (|parseTran| |x|) (|parseTran| |typ|))))))
 
; parseHas [x,y] ==
;   mkand [['has,x,u] for u in fn y] where
;     mkand x ==
;       x is [a] => a
;       ["and",:x]
;     fn y ==
;       y is [":" ,op,['Mapping,:map]] =>
;          op:= (STRINGP op => INTERN op; op)
;          [['SIGNATURE,op,map]]
;       y is ['Join,:u] => "append"/[fn z for z in u]
;       y is ['CATEGORY,:u] => "append"/[fn z for z in u]
;       y is ['SIGNATURE,:.] => [y]
;       [makeNonAtomic y]
 
(DEFUN |parseHas| (|bfVar#17|)
  (PROG (|x| |y|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#17|))
      (SETQ |y| (CADR |bfVar#17|))
      (|parseHas,mkand|
       ((LAMBDA (|bfVar#12| |bfVar#11| |u|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#11|) (PROGN (SETQ |u| (CAR |bfVar#11|)) NIL))
             (RETURN (NREVERSE |bfVar#12|)))
            ('T (SETQ |bfVar#12| (CONS (LIST '|has| |x| |u|) |bfVar#12|))))
           (SETQ |bfVar#11| (CDR |bfVar#11|))))
        NIL (|parseHas,fn| |y|) NIL))))))
(DEFUN |parseHas,mkand| (|x|)
  (PROG (|a|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CDR |x|) NIL) (PROGN (SETQ |a| (CAR |x|)) #1='T))
       |a|)
      (#1# (CONS '|and| |x|))))))
(DEFUN |parseHas,fn| (|y|)
  (PROG (|ISTMP#1| |op| |ISTMP#2| |ISTMP#3| |map| |u|)
    (RETURN
     (COND
      ((AND (CONSP |y|) (EQ (CAR |y|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |y|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |op| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN
                         (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '|Mapping|)
                              (PROGN (SETQ |map| (CDR |ISTMP#3|)) #1='T))))))))
       (PROGN
        (SETQ |op| (COND ((STRINGP |op|) (INTERN |op|)) (#1# |op|)))
        (LIST (LIST 'SIGNATURE |op| |map|))))
      ((AND (CONSP |y|) (EQ (CAR |y|) '|Join|)
            (PROGN (SETQ |u| (CDR |y|)) #1#))
       ((LAMBDA (|bfVar#14| |bfVar#13| |z|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#13|) (PROGN (SETQ |z| (CAR |bfVar#13|)) NIL))
             (RETURN |bfVar#14|))
            (#1# (SETQ |bfVar#14| (APPEND |bfVar#14| (|parseHas,fn| |z|)))))
           (SETQ |bfVar#13| (CDR |bfVar#13|))))
        NIL |u| NIL))
      ((AND (CONSP |y|) (EQ (CAR |y|) 'CATEGORY)
            (PROGN (SETQ |u| (CDR |y|)) #1#))
       ((LAMBDA (|bfVar#16| |bfVar#15| |z|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#15|) (PROGN (SETQ |z| (CAR |bfVar#15|)) NIL))
             (RETURN |bfVar#16|))
            (#1# (SETQ |bfVar#16| (APPEND |bfVar#16| (|parseHas,fn| |z|)))))
           (SETQ |bfVar#15| (CDR |bfVar#15|))))
        NIL |u| NIL))
      ((AND (CONSP |y|) (EQ (CAR |y|) 'SIGNATURE)) (LIST |y|))
      (#1# (LIST (|makeNonAtomic| |y|)))))))
 
; parseDEF [$lhs,tList,specialList,body] ==
;   setDefOp $lhs
;   ['DEF,parseLhs $lhs,parseTranList tList,parseTranList specialList,
;     parseTranCheckForRecord(body,opOf $lhs)]
 
(DEFUN |parseDEF| (|bfVar#18|)
  (PROG (|$lhs| |body| |specialList| |tList|)
    (DECLARE (SPECIAL |$lhs|))
    (RETURN
     (PROGN
      (SETQ |$lhs| (CAR |bfVar#18|))
      (SETQ |tList| (CADR . #1=(|bfVar#18|)))
      (SETQ |specialList| (CADDR . #1#))
      (SETQ |body| (CADDDR . #1#))
      (|setDefOp| |$lhs|)
      (LIST 'DEF (|parseLhs| |$lhs|) (|parseTranList| |tList|)
            (|parseTranList| |specialList|)
            (|parseTranCheckForRecord| |body| (|opOf| |$lhs|)))))))
 
; parseLhs x ==
;   atom x => parseTran x
;   atom first x => [parseTran first x,:[transIs parseTran y for y in rest x]]
;   parseTran x
 
(DEFUN |parseLhs| (|x|)
  (PROG ()
    (RETURN
     (COND ((ATOM |x|) (|parseTran| |x|))
           ((ATOM (CAR |x|))
            (CONS (|parseTran| (CAR |x|))
                  ((LAMBDA (|bfVar#20| |bfVar#19| |y|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#19|)
                            (PROGN (SETQ |y| (CAR |bfVar#19|)) NIL))
                        (RETURN (NREVERSE |bfVar#20|)))
                       (#1='T
                        (SETQ |bfVar#20|
                                (CONS (|transIs| (|parseTran| |y|))
                                      |bfVar#20|))))
                      (SETQ |bfVar#19| (CDR |bfVar#19|))))
                   NIL (CDR |x|) NIL)))
           (#1# (|parseTran| |x|))))))
 
; parseMDEF [$lhs,tList,specialList,body] ==
;   ['MDEF,parseTran $lhs,parseTranList tList,parseTranList specialList,
;     parseTranCheckForRecord(body,opOf $lhs)]
 
(DEFUN |parseMDEF| (|bfVar#21|)
  (PROG (|$lhs| |body| |specialList| |tList|)
    (DECLARE (SPECIAL |$lhs|))
    (RETURN
     (PROGN
      (SETQ |$lhs| (CAR |bfVar#21|))
      (SETQ |tList| (CADR . #1=(|bfVar#21|)))
      (SETQ |specialList| (CADDR . #1#))
      (SETQ |body| (CADDDR . #1#))
      (LIST 'MDEF (|parseTran| |$lhs|) (|parseTranList| |tList|)
            (|parseTranList| |specialList|)
            (|parseTranCheckForRecord| |body| (|opOf| |$lhs|)))))))
 
; parseTranCheckForRecord(x,op) ==
;   (x:= parseTran x) is ['Record,:l] =>
;     or/[y for y in l | y isnt [":",.,.]] =>
;       postError ['"   Constructor",:bright x,'"has missing label"]
;     x
;   x
 
(DEFUN |parseTranCheckForRecord| (|x| |op|)
  (PROG (|ISTMP#1| |l| |ISTMP#2|)
    (RETURN
     (COND
      ((PROGN
        (SETQ |ISTMP#1| (SETQ |x| (|parseTran| |x|)))
        (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Record|)
             (PROGN (SETQ |l| (CDR |ISTMP#1|)) #1='T)))
       (COND
        (((LAMBDA (|bfVar#23| |bfVar#22| |y|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#22|) (PROGN (SETQ |y| (CAR |bfVar#22|)) NIL))
               (RETURN |bfVar#23|))
              (#1#
               (AND
                (NOT
                 (AND (CONSP |y|) (EQ (CAR |y|) '|:|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |y|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|)
                                  (EQ (CDR |ISTMP#2|) NIL)))))))
                (PROGN
                 (SETQ |bfVar#23| |y|)
                 (COND (|bfVar#23| (RETURN |bfVar#23|)))))))
             (SETQ |bfVar#22| (CDR |bfVar#22|))))
          NIL |l| NIL)
         (|postError|
          (CONS "   Constructor"
                (APPEND (|bright| |x|) (CONS "has missing label" NIL)))))
        (#1# |x|)))
      (#1# |x|)))))
 
; parseCategory x ==
;   l:= parseTranList x
;   key:=
;     CONTAINED("$",l) => "domain"
;     'package
;   ['CATEGORY,key,:l]
 
(DEFUN |parseCategory| (|x|)
  (PROG (|l| |key|)
    (RETURN
     (PROGN
      (SETQ |l| (|parseTranList| |x|))
      (SETQ |key| (COND ((CONTAINED '$ |l|) '|domain|) ('T '|package|)))
      (CONS 'CATEGORY (CONS |key| |l|))))))
 
; parseAnd u ==
;   null u => 'true
;   null rest u => first u
;   parseIf [parseTran first u,parseAnd rest u,"false"]
 
(DEFUN |parseAnd| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) '|true|) ((NULL (CDR |u|)) (CAR |u|))
           ('T
            (|parseIf|
             (LIST (|parseTran| (CAR |u|)) (|parseAnd| (CDR |u|))
                   '|false|)))))))
 
; parseOr u ==
;   null u => 'false
;   null rest u => first u
;   (x:= parseTran first u) is ['not,y] => parseIf [y,parseOr rest u,'true]
;   true => parseIf [x,'true,parseOr rest u]
 
(DEFUN |parseOr| (|u|)
  (PROG (|x| |ISTMP#1| |ISTMP#2| |y|)
    (RETURN
     (COND ((NULL |u|) '|false|) ((NULL (CDR |u|)) (CAR |u|))
           ((PROGN
             (SETQ |ISTMP#1| (SETQ |x| (|parseTran| (CAR |u|))))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|not|)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |y| (CAR |ISTMP#2|)) 'T)))))
            (|parseIf| (LIST |y| (|parseOr| (CDR |u|)) '|true|)))
           (T (|parseIf| (LIST |x| '|true| (|parseOr| (CDR |u|)))))))))
 
; parseNot u ==
;   parseTran ['IF,first u,:'(false true)]
 
(DEFUN |parseNot| (|u|)
  (PROG ()
    (RETURN (|parseTran| (CONS 'IF (CONS (CAR |u|) '(|false| |true|)))))))
 
; parseExit [a,:b] ==
;   --  note: I wanted to convert 1s to 0s here to facilitate indexing in
;   --   comp code; unfortunately, parseTran-ning is sometimes done more
;   --   than once so that the count can be decremented more than once
;   a:= parseTran a
;   b:= parseTran b
;   b =>
;     null INTEGERP a =>
;       (MOAN('"first arg ",a,'" for exit must be integer"); ['exit,1,a])
;     ['exit,a,:b]
;   ['exit,1,a]
 
(DEFUN |parseExit| (|bfVar#24|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#24|))
      (SETQ |b| (CDR |bfVar#24|))
      (SETQ |a| (|parseTran| |a|))
      (SETQ |b| (|parseTran| |b|))
      (COND
       (|b|
        (COND
         ((NULL (INTEGERP |a|))
          (PROGN
           (MOAN "first arg " |a| " for exit must be integer")
           (LIST '|exit| 1 |a|)))
         (#1='T (CONS '|exit| (CONS |a| |b|)))))
       (#1# (LIST '|exit| 1 |a|)))))))
 
; parseLeave [a,:b] ==
;   a:= parseTran a
;   b:= parseTran b
;   b =>
;     null INTEGERP a =>
;       (MOAN('"first arg ",a,'" for 'leave' must be integer"); ['leave,1,a])
;     ['leave,a,:b]
;   ['leave,1,a]
 
(DEFUN |parseLeave| (|bfVar#25|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#25|))
      (SETQ |b| (CDR |bfVar#25|))
      (SETQ |a| (|parseTran| |a|))
      (SETQ |b| (|parseTran| |b|))
      (COND
       (|b|
        (COND
         ((NULL (INTEGERP |a|))
          (PROGN
           (MOAN "first arg " |a| " for 'leave' must be integer")
           (LIST '|leave| 1 |a|)))
         (#1='T (CONS '|leave| (CONS |a| |b|)))))
       (#1# (LIST '|leave| 1 |a|)))))))
 
; parseReturn [a,:b] ==
;   a:= parseTran a
;   b:= parseTran b
;   b =>
;     (if a~=1 then MOAN '"multiple-level 'return' not allowed"; ["return",1,:b])
;   ["return",1,a]
 
(DEFUN |parseReturn| (|bfVar#26|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CAR |bfVar#26|))
      (SETQ |b| (CDR |bfVar#26|))
      (SETQ |a| (|parseTran| |a|))
      (SETQ |b| (|parseTran| |b|))
      (COND
       (|b|
        (PROGN
         (COND
          ((NOT (EQL |a| 1)) (MOAN "multiple-level 'return' not allowed")))
         (CONS '|return| (CONS 1 |b|))))
       ('T (LIST '|return| 1 |a|)))))))
 
; parseJoin l ==
;   ['Join,:fn parseTranList l] where
;     fn l ==
;       null l => nil
;       l is [['Join,:x],:y] => [:x,:fn y]
;       [first l,:fn rest l]
 
(DEFUN |parseJoin| (|l|)
  (PROG () (RETURN (CONS '|Join| (|parseJoin,fn| (|parseTranList| |l|))))))
(DEFUN |parseJoin,fn| (|l|)
  (PROG (|ISTMP#1| |x| |y|)
    (RETURN
     (COND ((NULL |l|) NIL)
           ((AND (CONSP |l|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |l|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Join|)
                       (PROGN (SETQ |x| (CDR |ISTMP#1|)) #1='T)))
                 (PROGN (SETQ |y| (CDR |l|)) #1#))
            (APPEND |x| (|parseJoin,fn| |y|)))
           (#1# (CONS (CAR |l|) (|parseJoin,fn| (CDR |l|))))))))
 
; parseInBy [i,n,inc] ==
;   (u:= parseIn [i,n]) isnt ['STEP,i,a,j,:r] =>
;     postError ["   You cannot use",:bright '"by",
;       '"except for an explicitly indexed sequence."]
;   inc:= parseTran inc
;   ['STEP,i,a,parseTran inc,:r]
 
(DEFUN |parseInBy| (|bfVar#27|)
  (PROG (|i| |n| |inc| |u| |ISTMP#1| |ISTMP#2| |ISTMP#3| |a| |ISTMP#4| |j| |r|)
    (RETURN
     (PROGN
      (SETQ |i| (CAR |bfVar#27|))
      (SETQ |n| (CADR . #1=(|bfVar#27|)))
      (SETQ |inc| (CADDR . #1#))
      (COND
       ((NOT
         (PROGN
          (SETQ |ISTMP#1| (SETQ |u| (|parseIn| (LIST |i| |n|))))
          (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'STEP)
               (PROGN
                (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                (AND (CONSP |ISTMP#2|)
                     (PROGN
                      (SETQ |i| (CAR |ISTMP#2|))
                      (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                      (AND (CONSP |ISTMP#3|)
                           (PROGN
                            (SETQ |a| (CAR |ISTMP#3|))
                            (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                            (AND (CONSP |ISTMP#4|)
                                 (PROGN
                                  (SETQ |j| (CAR |ISTMP#4|))
                                  (SETQ |r| (CDR |ISTMP#4|))
                                  #2='T))))))))))
        (|postError|
         (CONS '|   You cannot use|
               (APPEND (|bright| "by")
                       (CONS "except for an explicitly indexed sequence."
                             NIL)))))
       (#2#
        (PROGN
         (SETQ |inc| (|parseTran| |inc|))
         (CONS 'STEP
               (CONS |i| (CONS |a| (CONS (|parseTran| |inc|) |r|)))))))))))
 
; parseSegment p ==
;   p is [a,b] =>
;     b => ['SEGMENT,parseTran a, parseTran b]
;     ['SEGMENT,parseTran a]
;   ['SEGMENT,:p]
 
(DEFUN |parseSegment| (|p|)
  (PROG (|a| |ISTMP#1| |b|)
    (RETURN
     (COND
      ((AND (CONSP |p|)
            (PROGN
             (SETQ |a| (CAR |p|))
             (SETQ |ISTMP#1| (CDR |p|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |b| (CAR |ISTMP#1|)) #1='T))))
       (COND (|b| (LIST 'SEGMENT (|parseTran| |a|) (|parseTran| |b|)))
             (#1# (LIST 'SEGMENT (|parseTran| |a|)))))
      (#1# (CONS 'SEGMENT |p|))))))
 
; parseIn [i,n] ==
;   i:= parseTran i
;   n:= parseTran n
;   n is ['SEGMENT,a] => ['STEP,i,a,1]
;   n is ['reverse,['SEGMENT,a]] =>
;     postError ['"  You cannot reverse an infinite sequence."]
;   n is ['SEGMENT,a,b] => (b => ['STEP,i,a,1,b]; ['STEP,i,a,1])
;   n is ['reverse,['SEGMENT,a,b]] =>
;     b => ['STEP,i,b,-1,a]
;     postError ['"  You cannot reverse an infinite sequence."]
;   n is ['tails,s] => ['ON,i,s]
;   ['IN,i,n]
 
(DEFUN |parseIn| (|bfVar#28|)
  (PROG (|i| |n| |ISTMP#1| |a| |ISTMP#2| |ISTMP#3| |b| |ISTMP#4| |s|)
    (RETURN
     (PROGN
      (SETQ |i| (CAR |bfVar#28|))
      (SETQ |n| (CADR |bfVar#28|))
      (SETQ |i| (|parseTran| |i|))
      (SETQ |n| (|parseTran| |n|))
      (COND
       ((AND (CONSP |n|) (EQ (CAR |n|) 'SEGMENT)
             (PROGN
              (SETQ |ISTMP#1| (CDR |n|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1='T))))
        (LIST 'STEP |i| |a| 1))
       ((AND (CONSP |n|) (EQ (CAR |n|) '|reverse|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |n|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN
                    (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) 'SEGMENT)
                         (PROGN
                          (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                               (PROGN (SETQ |a| (CAR |ISTMP#3|)) #1#))))))))
        (|postError| (LIST "  You cannot reverse an infinite sequence.")))
       ((AND (CONSP |n|) (EQ (CAR |n|) 'SEGMENT)
             (PROGN
              (SETQ |ISTMP#1| (CDR |n|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |a| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
        (COND (|b| (LIST 'STEP |i| |a| 1 |b|)) (#1# (LIST 'STEP |i| |a| 1))))
       ((AND (CONSP |n|) (EQ (CAR |n|) '|reverse|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |n|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN
                    (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) 'SEGMENT)
                         (PROGN
                          (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|)
                               (PROGN
                                (SETQ |a| (CAR |ISTMP#3|))
                                (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                (AND (CONSP |ISTMP#4|) (EQ (CDR |ISTMP#4|) NIL)
                                     (PROGN
                                      (SETQ |b| (CAR |ISTMP#4|))
                                      #1#))))))))))
        (COND (|b| (LIST 'STEP |i| |b| (- 1) |a|))
              (#1#
               (|postError|
                (LIST "  You cannot reverse an infinite sequence.")))))
       ((AND (CONSP |n|) (EQ (CAR |n|) '|tails|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |n|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |s| (CAR |ISTMP#1|)) #1#))))
        (LIST 'ON |i| |s|))
       (#1# (LIST 'IN |i| |n|)))))))
 
; parseIf t ==
;   t isnt [p,a,b] => t
;   ifTran(parseTran p,parseTran a,parseTran b) where
;     ifTran(p,a,b) ==
;       p = 'true  => a
;       p = 'false  => b
;       p is ['not,p'] => ifTran(p',b,a)
;       p is ['IF,p',a',b'] => ifTran(p',ifTran(a',COPY a,COPY b),ifTran(b',a,b))
;       p is ['SEQ,:l,['exit,1,p']] =>
;         ['SEQ,:l,['exit,1,ifTran(p',incExitLevel a,incExitLevel b)]]
;          --this assumes that l has no exits
;       a is ['IF, =p,a',.] => ['IF,p,a',b]
;       b is ['IF, =p,.,b'] => ['IF,p,a,b']
;       makeSimplePredicateOrNil p is ['SEQ,:s,['exit,1,val]] =>
;         parseTran ['SEQ,:s,['exit,1,incExitLevel ['IF,val,a,b]]]
;       ['IF,p,a,b]
 
(DEFUN |parseIf| (|t|)
  (PROG (|p| |ISTMP#1| |a| |ISTMP#2| |b|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|)
             (PROGN
              (SETQ |p| (CAR |t|))
              (SETQ |ISTMP#1| (CDR |t|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |a| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1='T)))))))
       |t|)
      (#1#
       (|parseIf,ifTran| (|parseTran| |p|) (|parseTran| |a|)
        (|parseTran| |b|)))))))
(DEFUN |parseIf,ifTran| (|p| |a| |b|)
  (PROG (|ISTMP#1| |p'| |ISTMP#2| |a'| |ISTMP#3| |b'| |ISTMP#4| |ISTMP#5| |l|
         |ISTMP#6| |val| |s|)
    (RETURN
     (COND ((EQ |p| '|true|) |a|) ((EQ |p| '|false|) |b|)
           ((AND (CONSP |p|) (EQ (CAR |p|) '|not|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |p|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |p'| (CAR |ISTMP#1|)) #1='T))))
            (|parseIf,ifTran| |p'| |b| |a|))
           ((AND (CONSP |p|) (EQ (CAR |p|) 'IF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |p|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |p'| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |a'| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |b'| (CAR |ISTMP#3|))
                                    #1#))))))))
            (|parseIf,ifTran| |p'|
             (|parseIf,ifTran| |a'| (COPY |a|) (COPY |b|))
             (|parseIf,ifTran| |b'| |a| |b|)))
           ((AND (CONSP |p|) (EQ (CAR |p|) 'SEQ)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |p|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1#)
                       (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                        (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '|exit|)
                             (PROGN
                              (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                              (AND (CONSP |ISTMP#4|) (EQUAL (CAR |ISTMP#4|) 1)
                                   (PROGN
                                    (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                    (AND (CONSP |ISTMP#5|)
                                         (EQ (CDR |ISTMP#5|) NIL)
                                         (PROGN
                                          (SETQ |p'| (CAR |ISTMP#5|))
                                          #1#)))))))
                       (PROGN (SETQ |l| (CDR |ISTMP#2|)) #1#)
                       (PROGN (SETQ |l| (NREVERSE |l|)) #1#))))
            (CONS 'SEQ
                  (APPEND |l|
                          (CONS
                           (LIST '|exit| 1
                                 (|parseIf,ifTran| |p'| (|incExitLevel| |a|)
                                  (|incExitLevel| |b|)))
                           NIL))))
           ((AND (CONSP |a|) (EQ (CAR |a|) 'IF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |a|))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |p|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |a'| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|)
                                   (EQ (CDR |ISTMP#3|) NIL))))))))
            (LIST 'IF |p| |a'| |b|))
           ((AND (CONSP |b|) (EQ (CAR |b|) 'IF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |b|))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |p|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |b'| (CAR |ISTMP#3|))
                                    #1#))))))))
            (LIST 'IF |p| |a| |b'|))
           ((PROGN
             (SETQ |ISTMP#1| (|makeSimplePredicateOrNil| |p|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'SEQ)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN (SETQ |ISTMP#3| (REVERSE |ISTMP#2|)) #1#)
                        (CONSP |ISTMP#3|)
                        (PROGN
                         (SETQ |ISTMP#4| (CAR |ISTMP#3|))
                         (AND (CONSP |ISTMP#4|) (EQ (CAR |ISTMP#4|) '|exit|)
                              (PROGN
                               (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                               (AND (CONSP |ISTMP#5|) (EQUAL (CAR |ISTMP#5|) 1)
                                    (PROGN
                                     (SETQ |ISTMP#6| (CDR |ISTMP#5|))
                                     (AND (CONSP |ISTMP#6|)
                                          (EQ (CDR |ISTMP#6|) NIL)
                                          (PROGN
                                           (SETQ |val| (CAR |ISTMP#6|))
                                           #1#)))))))
                        (PROGN (SETQ |s| (CDR |ISTMP#3|)) #1#)
                        (PROGN (SETQ |s| (NREVERSE |s|)) #1#)))))
            (|parseTran|
             (CONS 'SEQ
                   (APPEND |s|
                           (CONS
                            (LIST '|exit| 1
                                  (|incExitLevel| (LIST 'IF |val| |a| |b|)))
                            NIL)))))
           (#1# (LIST 'IF |p| |a| |b|))))))
 
; makeSimplePredicateOrNil p ==
;   isSimple p => nil
;   u:= isAlmostSimple p => u
;   true => wrapSEQExit [['LET,g:= GENSYM(),p],g]
 
(DEFUN |makeSimplePredicateOrNil| (|p|)
  (PROG (|u| |g|)
    (RETURN
     (COND ((|isSimple| |p|) NIL) ((SETQ |u| (|isAlmostSimple| |p|)) |u|)
           (T
            (|wrapSEQExit| (LIST (LIST 'LET (SETQ |g| (GENSYM)) |p|) |g|)))))))
 
; parseWhere l == ["where", :parseTranList(l)]
 
(DEFUN |parseWhere| (|l|)
  (PROG () (RETURN (CONS '|where| (|parseTranList| |l|)))))
 
; parseSeq l ==
;   not (l is [:.,['exit,:.]]) =>
;     postError ['"   Invalid ending to block: ",last l]
;   transSeq(parseTranList(l))
 
(DEFUN |parseSeq| (|l|)
  (PROG (|ISTMP#1| |ISTMP#2|)
    (RETURN
     (COND
      ((NULL
        (AND (CONSP |l|) (PROGN (SETQ |ISTMP#1| (REVERSE |l|)) #1='T)
             (CONSP |ISTMP#1|)
             (PROGN
              (SETQ |ISTMP#2| (CAR |ISTMP#1|))
              (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|exit|)))))
       (|postError| (LIST "   Invalid ending to block: " (|last| |l|))))
      (#1# (|transSeq| (|parseTranList| |l|)))))))
 
; transSeq l ==
;   null l => nil
;   null rest l => decExitLevel first l
;   [item,:tail]:= l
;   item is ['SEQ,:l,['exit,1,['IF,p,['exit, =2,q],'noBranch]]] and
;     (and/[x is ['LET,:.] for x in l]) =>
;       ['SEQ,:[decExitLevel x for x in l],['exit,1,['IF,decExitLevel p,
;         decExitLevel q,transSeq tail]]]
;   item is ['IF,a,['exit,1,b],'noBranch] =>
;     ['IF,decExitLevel a,decExitLevel b,transSeq tail]
;   item is ['IF,a,'noBranch,['exit,1,b]] =>
;     ['IF,decExitLevel a,transSeq tail,decExitLevel b]
;   (y:= transSeq tail) is ['SEQ,:s] => ['SEQ,item,:s]
;   ['SEQ,item,['exit,1,incExitLevel y]]
 
(DEFUN |transSeq| (|l|)
  (PROG (|item| |tail| |ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |ISTMP#5|
         |ISTMP#6| |ISTMP#7| |p| |ISTMP#8| |ISTMP#9| |ISTMP#10| |ISTMP#11| |q|
         |ISTMP#12| |a| |b| |y| |s|)
    (RETURN
     (COND ((NULL |l|) NIL) ((NULL (CDR |l|)) (|decExitLevel| (CAR |l|)))
           (#1='T
            (PROGN
             (SETQ |item| (CAR |l|))
             (SETQ |tail| (CDR |l|))
             (COND
              ((AND (CONSP |item|) (EQ (CAR |item|) 'SEQ)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |item|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1#)
                          (CONSP |ISTMP#2|)
                          (PROGN
                           (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                           (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '|exit|)
                                (PROGN
                                 (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                 (AND (CONSP |ISTMP#4|)
                                      (EQUAL (CAR |ISTMP#4|) 1)
                                      (PROGN
                                       (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                       (AND (CONSP |ISTMP#5|)
                                            (EQ (CDR |ISTMP#5|) NIL)
                                            (PROGN
                                             (SETQ |ISTMP#6| (CAR |ISTMP#5|))
                                             (AND (CONSP |ISTMP#6|)
                                                  (EQ (CAR |ISTMP#6|) 'IF)
                                                  (PROGN
                                                   (SETQ |ISTMP#7|
                                                           (CDR |ISTMP#6|))
                                                   (AND (CONSP |ISTMP#7|)
                                                        (PROGN
                                                         (SETQ |p|
                                                                 (CAR
                                                                  |ISTMP#7|))
                                                         (SETQ |ISTMP#8|
                                                                 (CDR
                                                                  |ISTMP#7|))
                                                         (AND (CONSP |ISTMP#8|)
                                                              (PROGN
                                                               (SETQ |ISTMP#9|
                                                                       (CAR
                                                                        |ISTMP#8|))
                                                               (AND
                                                                (CONSP
                                                                 |ISTMP#9|)
                                                                (EQ
                                                                 (CAR
                                                                  |ISTMP#9|)
                                                                 '|exit|)
                                                                (PROGN
                                                                 (SETQ |ISTMP#10|
                                                                         (CDR
                                                                          |ISTMP#9|))
                                                                 (AND
                                                                  (CONSP
                                                                   |ISTMP#10|)
                                                                  (EQUAL
                                                                   (CAR
                                                                    |ISTMP#10|)
                                                                   2)
                                                                  (PROGN
                                                                   (SETQ |ISTMP#11|
                                                                           (CDR
                                                                            |ISTMP#10|))
                                                                   (AND
                                                                    (CONSP
                                                                     |ISTMP#11|)
                                                                    (EQ
                                                                     (CDR
                                                                      |ISTMP#11|)
                                                                     NIL)
                                                                    (PROGN
                                                                     (SETQ |q|
                                                                             (CAR
                                                                              |ISTMP#11|))
                                                                     #1#)))))))
                                                              (PROGN
                                                               (SETQ |ISTMP#12|
                                                                       (CDR
                                                                        |ISTMP#8|))
                                                               (AND
                                                                (CONSP
                                                                 |ISTMP#12|)
                                                                (EQ
                                                                 (CDR
                                                                  |ISTMP#12|)
                                                                 NIL)
                                                                (EQ
                                                                 (CAR
                                                                  |ISTMP#12|)
                                                                 '|noBranch|)))))))))))))))
                          (PROGN (SETQ |l| (CDR |ISTMP#2|)) #1#)
                          (PROGN (SETQ |l| (NREVERSE |l|)) #1#)))
                    ((LAMBDA (|bfVar#30| |bfVar#29| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#29|)
                              (PROGN (SETQ |x| (CAR |bfVar#29|)) NIL))
                          (RETURN |bfVar#30|))
                         (#1#
                          (PROGN
                           (SETQ |bfVar#30|
                                   (AND (CONSP |x|) (EQ (CAR |x|) 'LET)))
                           (COND ((NOT |bfVar#30|) (RETURN NIL))))))
                        (SETQ |bfVar#29| (CDR |bfVar#29|))))
                     T |l| NIL))
               (CONS 'SEQ
                     (APPEND
                      ((LAMBDA (|bfVar#32| |bfVar#31| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#31|)
                                (PROGN (SETQ |x| (CAR |bfVar#31|)) NIL))
                            (RETURN (NREVERSE |bfVar#32|)))
                           (#1#
                            (SETQ |bfVar#32|
                                    (CONS (|decExitLevel| |x|) |bfVar#32|))))
                          (SETQ |bfVar#31| (CDR |bfVar#31|))))
                       NIL |l| NIL)
                      (CONS
                       (LIST '|exit| 1
                             (LIST 'IF (|decExitLevel| |p|)
                                   (|decExitLevel| |q|) (|transSeq| |tail|)))
                       NIL))))
              ((AND (CONSP |item|) (EQ (CAR |item|) 'IF)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |item|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |a| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|)
                                (PROGN
                                 (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                                 (AND (CONSP |ISTMP#3|)
                                      (EQ (CAR |ISTMP#3|) '|exit|)
                                      (PROGN
                                       (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                       (AND (CONSP |ISTMP#4|)
                                            (EQUAL (CAR |ISTMP#4|) 1)
                                            (PROGN
                                             (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                             (AND (CONSP |ISTMP#5|)
                                                  (EQ (CDR |ISTMP#5|) NIL)
                                                  (PROGN
                                                   (SETQ |b| (CAR |ISTMP#5|))
                                                   #1#)))))))
                                (PROGN
                                 (SETQ |ISTMP#6| (CDR |ISTMP#2|))
                                 (AND (CONSP |ISTMP#6|)
                                      (EQ (CDR |ISTMP#6|) NIL)
                                      (EQ (CAR |ISTMP#6|) '|noBranch|))))))))
               (LIST 'IF (|decExitLevel| |a|) (|decExitLevel| |b|)
                     (|transSeq| |tail|)))
              ((AND (CONSP |item|) (EQ (CAR |item|) 'IF)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |item|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |a| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|)
                                (EQ (CAR |ISTMP#2|) '|noBranch|)
                                (PROGN
                                 (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                 (AND (CONSP |ISTMP#3|)
                                      (EQ (CDR |ISTMP#3|) NIL)
                                      (PROGN
                                       (SETQ |ISTMP#4| (CAR |ISTMP#3|))
                                       (AND (CONSP |ISTMP#4|)
                                            (EQ (CAR |ISTMP#4|) '|exit|)
                                            (PROGN
                                             (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                             (AND (CONSP |ISTMP#5|)
                                                  (EQUAL (CAR |ISTMP#5|) 1)
                                                  (PROGN
                                                   (SETQ |ISTMP#6|
                                                           (CDR |ISTMP#5|))
                                                   (AND (CONSP |ISTMP#6|)
                                                        (EQ (CDR |ISTMP#6|)
                                                            NIL)
                                                        (PROGN
                                                         (SETQ |b|
                                                                 (CAR
                                                                  |ISTMP#6|))
                                                         #1#))))))))))))))
               (LIST 'IF (|decExitLevel| |a|) (|transSeq| |tail|)
                     (|decExitLevel| |b|)))
              ((PROGN
                (SETQ |ISTMP#1| (SETQ |y| (|transSeq| |tail|)))
                (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'SEQ)
                     (PROGN (SETQ |s| (CDR |ISTMP#1|)) #1#)))
               (CONS 'SEQ (CONS |item| |s|)))
              (#1#
               (LIST 'SEQ |item| (LIST '|exit| 1 (|incExitLevel| |y|)))))))))))
