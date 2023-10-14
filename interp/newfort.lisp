 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; assignment2Fortran1(name,e) ==
;   $fortError : fluid := nil
;   checkLines fortran2Lines statement2Fortran ["=",name,e]
 
(DEFUN |assignment2Fortran1| (|name| |e|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (|checkLines|
       (|fortran2Lines| (|statement2Fortran| (LIST '= |name| |e|))))))))
 
; integerAssignment2Fortran1(name,e) ==
;   $fortError : fluid := nil
;   $fortInts2Floats : fluid := nil
;   checkLines fortran2Lines statement2Fortran ["=",name,e]
 
(DEFUN |integerAssignment2Fortran1| (|name| |e|)
  (PROG (|$fortInts2Floats| |$fortError|)
    (DECLARE (SPECIAL |$fortInts2Floats| |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (SETQ |$fortInts2Floats| NIL)
      (|checkLines|
       (|fortran2Lines| (|statement2Fortran| (LIST '= |name| |e|))))))))
 
; statement2Fortran e ==
;   -- takes an object of type Expression and returns a list of
;   -- strings. Any part of the expression which is a list starting
;   -- with 'FORTRAN is merely passed on in the list of strings. The
;   -- list of strings may contain '"%l".
;   -- This is used when formatting e.g. a DO loop from Lisp
;   $exp2FortTempVarIndex : local := 0
;   $fortName : fluid := "DUMMY"
;   $fortInts2Floats : fluid := nil
;   fortranCleanUp exp2Fort1 segment fortPre exp2FortOptimize outputTran e
 
(DEFUN |statement2Fortran| (|e|)
  (PROG (|$fortInts2Floats| |$fortName| |$exp2FortTempVarIndex|)
    (DECLARE (SPECIAL |$fortInts2Floats| |$fortName| |$exp2FortTempVarIndex|))
    (RETURN
     (PROGN
      (SETQ |$exp2FortTempVarIndex| 0)
      (SETQ |$fortName| 'DUMMY)
      (SETQ |$fortInts2Floats| NIL)
      (|fortranCleanUp|
       (|exp2Fort1|
        (|segment| (|fortPre| (|exp2FortOptimize| (|outputTran| |e|))))))))))
 
; expression2Fortran e ==
;   -- takes an object of type Expression and returns a list of
;   -- strings. Any part of the expression which is a list starting
;   -- with 'FORTRAN is merely passed on in the list of strings. The
;   -- list of strings may contain '"%l".
;   $exp2FortTempVarIndex : local := 0
;   $fortName : fluid := newFortranTempVar()
;   $fortInts2Floats : fluid := nil
;   fortranCleanUp exp2Fort1 segment fortPre exp2FortOptimize outputTran e
 
(DEFUN |expression2Fortran| (|e|)
  (PROG (|$fortInts2Floats| |$fortName| |$exp2FortTempVarIndex|)
    (DECLARE (SPECIAL |$fortInts2Floats| |$fortName| |$exp2FortTempVarIndex|))
    (RETURN
     (PROGN
      (SETQ |$exp2FortTempVarIndex| 0)
      (SETQ |$fortName| (|newFortranTempVar|))
      (SETQ |$fortInts2Floats| NIL)
      (|fortranCleanUp|
       (|exp2Fort1|
        (|segment| (|fortPre| (|exp2FortOptimize| (|outputTran| |e|))))))))))
 
; expression2Fortran1(name,e) ==
;   -- takes an object of type Expression and returns a list of
;   -- strings. Any part of the expression which is a list starting
;   -- with 'FORTRAN is merely passed on in the list of strings. The
;   -- list of strings may contain '"%l".
;   $exp2FortTempVarIndex : local := 0
;   $fortName : fluid := name
;   fortranCleanUp exp2Fort1 segment fortPre exp2FortOptimize outputTran e
 
(DEFUN |expression2Fortran1| (|name| |e|)
  (PROG (|$fortName| |$exp2FortTempVarIndex|)
    (DECLARE (SPECIAL |$fortName| |$exp2FortTempVarIndex|))
    (RETURN
     (PROGN
      (SETQ |$exp2FortTempVarIndex| 0)
      (SETQ |$fortName| |name|)
      (|fortranCleanUp|
       (|exp2Fort1|
        (|segment| (|fortPre| (|exp2FortOptimize| (|outputTran| |e|))))))))))
 
; newFortranTempVar() ==
;   $exp2FortTempVarIndex := 1 + $exp2FortTempVarIndex
;   newVar := INTERN STRCONC('"T",STRINGIMAGE $exp2FortTempVarIndex)
;   updateSymbolTable(newVar,$defaultFortranType)
;   newVar
 
(DEFUN |newFortranTempVar| ()
  (PROG (|newVar|)
    (RETURN
     (PROGN
      (SETQ |$exp2FortTempVarIndex| (+ 1 |$exp2FortTempVarIndex|))
      (SETQ |newVar|
              (INTERN (STRCONC "T" (STRINGIMAGE |$exp2FortTempVarIndex|))))
      (|updateSymbolTable| |newVar| |$defaultFortranType|)
      |newVar|))))
 
; fortranCleanUp l ==
;   -- takes reversed list and cleans up a bit, putting it in
;   -- correct order
;   oldTok := NIL
;   m := NIL
;   for e in l repeat
;     if not (oldTok = '"-" and e = '"+") then m := [e,:m]
;     oldTok := e
;   m
 
(DEFUN |fortranCleanUp| (|l|)
  (PROG (|oldTok| |m|)
    (RETURN
     (PROGN
      (SETQ |oldTok| NIL)
      (SETQ |m| NIL)
      ((LAMBDA (|bfVar#1| |e|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |e| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (COND
              ((NULL (AND (EQUAL |oldTok| "-") (EQUAL |e| "+")))
               (SETQ |m| (CONS |e| |m|))))
             (SETQ |oldTok| |e|))))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       |l| NIL)
      |m|))))
 
; exp2Fort1 l ==
;   s := nil
;   for e in l repeat s := [:exp2Fort2(e,0,nil),:s]
;   s
 
(DEFUN |exp2Fort1| (|l|)
  (PROG (|s|)
    (RETURN
     (PROGN
      (SETQ |s| NIL)
      ((LAMBDA (|bfVar#2| |e|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |e| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           ('T (SETQ |s| (APPEND (|exp2Fort2| |e| 0 NIL) |s|))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |l| NIL)
      |s|))))
 
; exp2Fort2(e,prec,oldOp) ==
;   null e    => nil
;   atom e    => [object2String e]
;   e is [ "=",lhs,rhs] or e is [ '"=",lhs,rhs] =>
;     ['"%l",:exp2Fort2(rhs,prec,'"="),'"=",:exp2Fort2(lhs,prec,'"=")]
; 
;   unaryOps    := ['"-",'"~"]
;   unaryPrecs  := [700,50]
;   binaryOps   := ['"|",'"**",'"/",'".LT.",'".GT.",'".EQ.",'".LE.",'".GE.", _
;                   '"OVER",'".AND.",'".OR."]
;   binaryPrecs := [0, 900, 800, 400, 400, 400, 400, 400, 800, 70, 90]
;   naryOps     := ['"-",'"+",'"*",'",",'" ",'"ROW",'""]
;   naryPrecs   := [700,  700, 800,  110,   0,     0,  0]
;   nonUnaryOps := append(binaryOps,naryOps)
;   [op,:args] := e
;   op := object2String op
;   nargs := #args
;   nargs = 0 => exp2FortFn(op,args,0)
;   nargs = 1 =>
;     (p := position(op,unaryOps)) > -1 =>
;       nprec := unaryPrecs.p
;       s := [:exp2Fort2(first args,nprec,op),op]
;       op = '"-" and atom first args => s
;       op = oldOp and op in ['"*",'"+"] => s
;       nprec <= prec => ['")",:s,'"("]
;       s
;     exp2FortFn(op,args,nargs)
;   op = '"CMPLX" =>
;     ['")",:exp2Fort2(SECOND args, prec, op),'",",:exp2Fort2(first args,prec,op),'"("]
;   member(op,nonUnaryOps) =>
;     if nargs > 0 then arg1 := first args
;     nargs = 1 and op in '("+" "*") => exp2Fort2(arg1,prec,op)
;     if nargs > 1 then arg2 := first rest args
;     p := position(op,binaryOps)
;     if p = -1
;       then
;         p := position(op,naryOps)
;         nprec := naryPrecs.p
;       else nprec := binaryPrecs.p
;     s := nil
;     for arg in args repeat
;       op = '"+" and (arg is [m,a]) and m in '(_- "=") =>
;         if not s then s := ['junk]
;         s:= [op,:exp2Fort2(a,nprec,op),'"-",:rest s]
;       s := [op,:exp2Fort2(arg,nprec,op),:s]
;     s := rest s
;     op = oldOp and op in ['"*",'"+"] => s
;     nprec <= prec => ['")",:s,'"("]
;     s
;   exp2FortFn(op,args,nargs)
 
(DEFUN |exp2Fort2| (|e| |prec| |oldOp|)
  (PROG (|ISTMP#1| |lhs| |ISTMP#2| |rhs| |unaryOps| |unaryPrecs| |binaryOps|
         |binaryPrecs| |naryOps| |naryPrecs| |nonUnaryOps| |op| |args| |nargs|
         |p| |nprec| |s| |arg1| |arg2| |m| |a|)
    (RETURN
     (COND ((NULL |e|) NIL) ((ATOM |e|) (LIST (|object2String| |e|)))
           ((OR
             (AND (CONSP |e|) (EQ (CAR |e|) '=)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |e|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |lhs| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |rhs| (CAR |ISTMP#2|)) #1='T))))))
             (AND (CONSP |e|) (EQUAL (CAR |e|) '"=")
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |e|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |lhs| (CAR |ISTMP#1|))
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                              (PROGN (SETQ |rhs| (CAR |ISTMP#2|)) #1#)))))))
            (CONS "%l"
                  (APPEND (|exp2Fort2| |rhs| |prec| "=")
                          (CONS "=" (|exp2Fort2| |lhs| |prec| "=")))))
           (#1#
            (PROGN
             (SETQ |unaryOps| (LIST "-" "~"))
             (SETQ |unaryPrecs| (LIST 700 50))
             (SETQ |binaryOps|
                     (LIST "|" "**" "/" ".LT." ".GT." ".EQ." ".LE." ".GE."
                           "OVER" ".AND." ".OR."))
             (SETQ |binaryPrecs|
                     (LIST 0 900 800 400 400 400 400 400 800 70 90))
             (SETQ |naryOps| (LIST "-" "+" "*" "," " " "ROW" ""))
             (SETQ |naryPrecs| (LIST 700 700 800 110 0 0 0))
             (SETQ |nonUnaryOps| (APPEND |binaryOps| |naryOps|))
             (SETQ |op| (CAR |e|))
             (SETQ |args| (CDR |e|))
             (SETQ |op| (|object2String| |op|))
             (SETQ |nargs| (LENGTH |args|))
             (COND ((EQL |nargs| 0) (|exp2FortFn| |op| |args| 0))
                   ((EQL |nargs| 1)
                    (COND
                     ((< (- 1) (SETQ |p| (|position| |op| |unaryOps|)))
                      (PROGN
                       (SETQ |nprec| (ELT |unaryPrecs| |p|))
                       (SETQ |s|
                               (APPEND (|exp2Fort2| (CAR |args|) |nprec| |op|)
                                       (CONS |op| NIL)))
                       (COND ((AND (EQUAL |op| "-") (ATOM (CAR |args|))) |s|)
                             ((AND (EQUAL |op| |oldOp|)
                                   (|member| |op| (LIST "*" "+")))
                              |s|)
                             ((NOT (< |prec| |nprec|))
                              (CONS ")" (APPEND |s| (CONS "(" NIL))))
                             (#1# |s|))))
                     (#1# (|exp2FortFn| |op| |args| |nargs|))))
                   ((EQUAL |op| "CMPLX")
                    (CONS ")"
                          (APPEND (|exp2Fort2| (SECOND |args|) |prec| |op|)
                                  (CONS ","
                                        (APPEND
                                         (|exp2Fort2| (CAR |args|) |prec| |op|)
                                         (CONS "(" NIL))))))
                   ((|member| |op| |nonUnaryOps|)
                    (PROGN
                     (COND ((< 0 |nargs|) (SETQ |arg1| (CAR |args|))))
                     (COND
                      ((AND (EQL |nargs| 1) (|member| |op| '("+" "*")))
                       (|exp2Fort2| |arg1| |prec| |op|))
                      (#1#
                       (PROGN
                        (COND ((< 1 |nargs|) (SETQ |arg2| (CAR (CDR |args|)))))
                        (SETQ |p| (|position| |op| |binaryOps|))
                        (COND
                         ((EQUAL |p| (- 1))
                          (SETQ |p| (|position| |op| |naryOps|))
                          (SETQ |nprec| (ELT |naryPrecs| |p|)))
                         (#1# (SETQ |nprec| (ELT |binaryPrecs| |p|))))
                        (SETQ |s| NIL)
                        ((LAMBDA (|bfVar#3| |arg|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#3|)
                                  (PROGN (SETQ |arg| (CAR |bfVar#3|)) NIL))
                              (RETURN NIL))
                             (#1#
                              (COND
                               ((AND (EQUAL |op| "+") (CONSP |arg|)
                                     (PROGN
                                      (SETQ |m| (CAR |arg|))
                                      (SETQ |ISTMP#1| (CDR |arg|))
                                      (AND (CONSP |ISTMP#1|)
                                           (EQ (CDR |ISTMP#1|) NIL)
                                           (PROGN
                                            (SETQ |a| (CAR |ISTMP#1|))
                                            #1#)))
                                     (|member| |m| '(- "=")))
                                (PROGN
                                 (COND ((NULL |s|) (SETQ |s| (LIST '|junk|))))
                                 (SETQ |s|
                                         (CONS |op|
                                               (APPEND
                                                (|exp2Fort2| |a| |nprec| |op|)
                                                (CONS "-" (CDR |s|)))))))
                               (#1#
                                (SETQ |s|
                                        (CONS |op|
                                              (APPEND
                                               (|exp2Fort2| |arg| |nprec| |op|)
                                               |s|)))))))
                            (SETQ |bfVar#3| (CDR |bfVar#3|))))
                         |args| NIL)
                        (SETQ |s| (CDR |s|))
                        (COND
                         ((AND (EQUAL |op| |oldOp|)
                               (|member| |op| (LIST "*" "+")))
                          |s|)
                         ((NOT (< |prec| |nprec|))
                          (CONS ")" (APPEND |s| (CONS "(" NIL))))
                         (#1# |s|)))))))
                   (#1# (|exp2FortFn| |op| |args| |nargs|)))))))))
 
; exp2FortFn(op,args,nargs) ==
;   s := ['"(",op]
;   while args repeat
;     s := ['",",:exp2Fort2(first args,0,op),:s]
;     args := rest args
;   if nargs > 0 then ['")",:rest s]
;   else ['")",:s]
 
(DEFUN |exp2FortFn| (|op| |args| |nargs|)
  (PROG (|s|)
    (RETURN
     (PROGN
      (SETQ |s| (LIST "(" |op|))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |args|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |s|
                          (CONS ","
                                (APPEND (|exp2Fort2| (CAR |args|) 0 |op|)
                                        |s|)))
                  (SETQ |args| (CDR |args|))))))))
      (COND ((< 0 |nargs|) (CONS ")" (CDR |s|))) (#1# (CONS ")" |s|)))))))
 
; exp2FortOptimize e ==
;   -- $fortranOptimizationLevel means:
;   --   0         just extract arrays
;   --   1         extract common subexpressions
;   --   2         try to optimize computing of powers
;   $exprStack : local := NIL
;   atom e => [e]
;   $fortranOptimizationLevel = 0 =>
;     e1 := exp2FortOptimizeArray e
;     NREVERSE [e1,:$exprStack]
;   e := minimalise e
;   for e1 in exp2FortOptimizeCS  e repeat
;     e2 := exp2FortOptimizeArray e1
;     $exprStack := [e2,:$exprStack]
;   NREVERSE $exprStack
 
(DEFUN |exp2FortOptimize| (|e|)
  (PROG (|$exprStack| |e2| |e1|)
    (DECLARE (SPECIAL |$exprStack|))
    (RETURN
     (PROGN
      (SETQ |$exprStack| NIL)
      (COND ((ATOM |e|) (LIST |e|))
            ((EQL |$fortranOptimizationLevel| 0)
             (PROGN
              (SETQ |e1| (|exp2FortOptimizeArray| |e|))
              (NREVERSE (CONS |e1| |$exprStack|))))
            (#1='T
             (PROGN
              (SETQ |e| (|minimalise| |e|))
              ((LAMBDA (|bfVar#4| |e1|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#4|)
                        (PROGN (SETQ |e1| (CAR |bfVar#4|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (PROGN
                     (SETQ |e2| (|exp2FortOptimizeArray| |e1|))
                     (SETQ |$exprStack| (CONS |e2| |$exprStack|)))))
                  (SETQ |bfVar#4| (CDR |bfVar#4|))))
               (|exp2FortOptimizeCS| |e|) NIL)
              (NREVERSE |$exprStack|))))))))
 
; exp2FortOptimizeCS e ==
;   $fortCsList : local := NIL
;   $fortCsHash : local := MAKE_-HASHTABLE 'EQ
;   $fortCsExprStack : local := NIL
;   $fortCsFuncStack : local := NIL
;   f := exp2FortOptimizeCS1 e
;   NREVERSE [f,:$fortCsList]
 
(DEFUN |exp2FortOptimizeCS| (|e|)
  (PROG (|$fortCsFuncStack| |$fortCsExprStack| |$fortCsHash| |$fortCsList| |f|)
    (DECLARE
     (SPECIAL |$fortCsFuncStack| |$fortCsExprStack| |$fortCsHash|
      |$fortCsList|))
    (RETURN
     (PROGN
      (SETQ |$fortCsList| NIL)
      (SETQ |$fortCsHash| (MAKE-HASHTABLE 'EQ))
      (SETQ |$fortCsExprStack| NIL)
      (SETQ |$fortCsFuncStack| NIL)
      (SETQ |f| (|exp2FortOptimizeCS1| |e|))
      (NREVERSE (CONS |f| |$fortCsList|))))))
 
; beenHere(e,n) ==
;   n.0 := n.0 + 1                      -- increase count (initially 1)
;   n.0 = 2 =>                          -- first time back again
;     var := n.1 := newFortranTempVar() -- stuff n.1 with new var
;     exprStk := n.2                    -- get expression
;     if exprStk then
; -- using COPY-TREE : RPLAC does not smash $fortCsList
; -- which led to inconsistencies in assignment of temp. vars.
;       $fortCsList := COPY_-TREE [['"=",var,e],:$fortCsList]
;       loc := first exprStk
;       fun := first(n.3)
;       fun = 'CAR =>
;         RPLACA(loc,var)
;       fun = 'CDR =>
;         if PAIRP QCDR loc
;           then RPLACD(loc,[var])
;           else RPLACD(loc,var)
;       SAY '"whoops"
;     var
;   n.1                     -- been here before, so just get variable
 
(DEFUN |beenHere| (|e| |n|)
  (PROG (|var| |exprStk| |loc| |fun|)
    (RETURN
     (PROGN
      (SETF (ELT |n| 0) (+ (ELT |n| 0) 1))
      (COND
       ((EQL (ELT |n| 0) 2)
        (PROGN
         (SETQ |var| (SETF (ELT |n| 1) (|newFortranTempVar|)))
         (SETQ |exprStk| (ELT |n| 2))
         (COND
          (|exprStk|
           (SETQ |$fortCsList|
                   (COPY-TREE (CONS (LIST "=" |var| |e|) |$fortCsList|)))
           (SETQ |loc| (CAR |exprStk|)) (SETQ |fun| (CAR (ELT |n| 3)))
           (COND ((EQ |fun| 'CAR) (RPLACA |loc| |var|))
                 ((EQ |fun| 'CDR)
                  (COND ((CONSP (QCDR |loc|)) (RPLACD |loc| (LIST |var|)))
                        (#1='T (RPLACD |loc| |var|))))
                 (#1# (SAY "whoops")))))
         |var|))
       (#1# (ELT |n| 1)))))))
 
; exp2FortOptimizeCS1 e ==
;   -- we do nothing with atoms or simple lists containing atoms
;   atom(e) or (atom first e and null rest e) => e
;   e is [op,arg] and object2Identifier op = "-" and atom arg => e
; 
;   -- see if we have been here before
;   not (object2Identifier QCAR e in '(ROW AGGLST)) and
;     (n := HGET($fortCsHash,e)) => beenHere(e,n) -- where
; 
;   -- descend sucessive CARs of CDRs of e
;   f := e
;   while f repeat
;     pushCsStacks(f,'CAR) where pushCsStacks(x,y) ==
;       $fortCsExprStack := [x,:$fortCsExprStack]
;       $fortCsFuncStack := [y,:$fortCsFuncStack]
;     RPLACA(f,exp2FortOptimizeCS1 QCAR f)
;     popCsStacks(0) where popCsStacks(x) ==
;       $fortCsFuncStack := QCDR $fortCsFuncStack
;       $fortCsExprStack := QCDR $fortCsExprStack
;     g := QCDR f
;     -- check to see of we have an non-NIL atomic CDR
;     g and atom g =>
;       pushCsStacks(f,'CDR)
;       RPLACD(f,exp2FortOptimizeCS1 g)
;       popCsStacks(0)
;       f := NIL
;     f := g
; 
;   MEMQ(object2Identifier QCAR e,'(ROW AGGLST)) => e
; 
;   -- see if we have already seen this expression
;   n := HGET($fortCsHash,e)
;   null n =>
;     n := VECTOR(1,NIL,$fortCsExprStack,$fortCsFuncStack)
;     HPUT($fortCsHash,e,n)
;     e
;   beenHere(e,n)
 
(DEFUN |exp2FortOptimizeCS1| (|e|)
  (PROG (|op| |ISTMP#1| |arg| |n| |f| |g|)
    (RETURN
     (COND ((OR (ATOM |e|) (AND (ATOM (CAR |e|)) (NULL (CDR |e|)))) |e|)
           ((AND (CONSP |e|)
                 (PROGN
                  (SETQ |op| (CAR |e|))
                  (SETQ |ISTMP#1| (CDR |e|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |arg| (CAR |ISTMP#1|)) #1='T)))
                 (EQ (|object2Identifier| |op|) '-) (ATOM |arg|))
            |e|)
           ((AND
             (NULL (|member| (|object2Identifier| (QCAR |e|)) '(ROW AGGLST)))
             (SETQ |n| (HGET |$fortCsHash| |e|)))
            (|beenHere| |e| |n|))
           (#1#
            (PROGN
             (SETQ |f| |e|)
             ((LAMBDA ()
                (LOOP
                 (COND ((NOT |f|) (RETURN NIL))
                       (#1#
                        (PROGN
                         (|exp2FortOptimizeCS1,pushCsStacks| |f| 'CAR)
                         (RPLACA |f| (|exp2FortOptimizeCS1| (QCAR |f|)))
                         (|exp2FortOptimizeCS1,popCsStacks| 0)
                         (SETQ |g| (QCDR |f|))
                         (COND
                          ((AND |g| (ATOM |g|))
                           (PROGN
                            (|pushCsStacks| |f| 'CDR)
                            (RPLACD |f| (|exp2FortOptimizeCS1| |g|))
                            (|popCsStacks| 0)
                            (SETQ |f| NIL)))
                          (#1# (SETQ |f| |g|)))))))))
             (COND ((MEMQ (|object2Identifier| (QCAR |e|)) '(ROW AGGLST)) |e|)
                   (#1#
                    (PROGN
                     (SETQ |n| (HGET |$fortCsHash| |e|))
                     (COND
                      ((NULL |n|)
                       (PROGN
                        (SETQ |n|
                                (VECTOR 1 NIL |$fortCsExprStack|
                                        |$fortCsFuncStack|))
                        (HPUT |$fortCsHash| |e| |n|)
                        |e|))
                      (#1# (|beenHere| |e| |n|))))))))))))
(DEFUN |exp2FortOptimizeCS1,popCsStacks| (|x|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$fortCsFuncStack| (QCDR |$fortCsFuncStack|))
      (SETQ |$fortCsExprStack| (QCDR |$fortCsExprStack|))))))
(DEFUN |exp2FortOptimizeCS1,pushCsStacks| (|x| |y|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$fortCsExprStack| (CONS |x| |$fortCsExprStack|))
      (SETQ |$fortCsFuncStack| (CONS |y| |$fortCsFuncStack|))))))
 
; exp2FortOptimizeArray e ==
;   -- this handles arrays
;   atom e => e
;   [op,:args] := e
;   op1 := object2Identifier op
;   op1 in '(BRACE BRACKET) =>
;     args is [['AGGLST,:elts]] =>
;       LISTP first elts and first first elts in '(BRACE BRACKET) => fortError1 e
;       -- var := newFortranTempVar()
;       var := $fortName
;       $exprStack := [[op,var,['AGGLST,:exp2FortOptimizeArray elts]],
;         :$exprStack]
;       var
;   EQ(op1,'MATRIX) =>
;     -- var := newFortranTempVar()
;     var := $fortName
;     -- args looks like [NIL,[ROW,...],[ROW,...]]
;     $exprStack := [[op,var,:exp2FortOptimizeArray args],:$exprStack]
;     var
;   [exp2FortOptimizeArray op,:exp2FortOptimizeArray args]
 
(DEFUN |exp2FortOptimizeArray| (|e|)
  (PROG (|op| |args| |op1| |ISTMP#1| |elts| |var|)
    (RETURN
     (COND ((ATOM |e|) |e|)
           (#1='T
            (PROGN
             (SETQ |op| (CAR |e|))
             (SETQ |args| (CDR |e|))
             (SETQ |op1| (|object2Identifier| |op|))
             (COND
              ((|member| |op1| '(BRACE BRACKET))
               (COND
                ((AND (CONSP |args|) (EQ (CDR |args|) NIL)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |args|))
                       (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'AGGLST)
                            (PROGN (SETQ |elts| (CDR |ISTMP#1|)) #1#))))
                 (IDENTITY
                  (COND
                   ((AND (LISTP (CAR |elts|))
                         (|member| (CAR (CAR |elts|)) '(BRACE BRACKET)))
                    (|fortError1| |e|))
                   (#1#
                    (PROGN
                     (SETQ |var| |$fortName|)
                     (SETQ |$exprStack|
                             (CONS
                              (LIST |op| |var|
                                    (CONS 'AGGLST
                                          (|exp2FortOptimizeArray| |elts|)))
                              |$exprStack|))
                     |var|)))))))
              ((EQ |op1| 'MATRIX)
               (PROGN
                (SETQ |var| |$fortName|)
                (SETQ |$exprStack|
                        (CONS
                         (CONS |op|
                               (CONS |var| (|exp2FortOptimizeArray| |args|)))
                         |$exprStack|))
                |var|))
              (#1#
               (CONS (|exp2FortOptimizeArray| |op|)
                     (|exp2FortOptimizeArray| |args|))))))))))
 
; fortran2Lines f ==
;   -- f is a list of strings
;   -- returns: a list of strings where each string is a valid
;   -- FORTRAN line in fixed form
; 
;   -- collect strings up to first %l or end of list. Then feed to
;   -- fortran2Lines1.
;   fs := NIL
;   lines := NIL
;   while f repeat
;     while f and (ff := first(f)) ~= '"%l" repeat
;       fs := [ff,:fs]
;       f := rest f
;     if f and first(f) = '"%l" then f := rest f
;     lines := append(fortran2Lines1 nreverse fs,lines)
;     fs := nil
;   nreverse lines
 
(DEFUN |fortran2Lines| (|f|)
  (PROG (|fs| |lines| |ff|)
    (RETURN
     (PROGN
      (SETQ |fs| NIL)
      (SETQ |lines| NIL)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |f|) (RETURN NIL))
                (#1='T
                 (PROGN
                  ((LAMBDA ()
                     (LOOP
                      (COND
                       ((NOT
                         (AND |f| (NOT (EQUAL (SETQ |ff| (CAR |f|)) "%l"))))
                        (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |fs| (CONS |ff| |fs|))
                         (SETQ |f| (CDR |f|))))))))
                  (COND
                   ((AND |f| (EQUAL (CAR |f|) "%l")) (SETQ |f| (CDR |f|))))
                  (SETQ |lines|
                          (APPEND (|fortran2Lines1| (NREVERSE |fs|)) |lines|))
                  (SETQ |fs| NIL)))))))
      (NREVERSE |lines|)))))
 
; fortran2Lines1 f ==
;   -- f is a list of strings making up 1 FORTRAN statement
;   -- return: a reverse list of FORTRAN lines
;   normPref := make_spaces($fortIndent)
;   --contPref := STRCONC(MAKE_-STRING($fortIndent-1),"&")
;   contPref := STRCONC("     &", make_spaces($fortIndent - 6))
;   lines := NIL
;   ll := $fortIndent
;   while f repeat
;     ok := true
;     line := normPref
;     ff := first f
;     while ok repeat
;       (ll + (sff := SIZE ff)) <= $fortLength =>
;         ll := ll + sff
;         line := STRCONC(line,ff)
;         f := rest f
;         if f then ff := first f
;         else ok := nil
;       -- fill the line out to exactly $fortLength spaces if possible by splitting
;       -- up symbols.  This is helpful when doing the segmentation
;       -- calculations, and also means that very long strings (e.g. numbers
;       -- with more than $fortLength-$fortIndent digits) are printed in a
;       -- legal format. MCD
;       if (ll < $fortLength) and (ll + sff) > $fortLength then
;         spaceLeft := $fortLength - ll
;         line := STRCONC(line,SUBSEQ(ff,0,spaceLeft))
;         ff := SUBSEQ(ff,spaceLeft)
;       lines := [line,:lines]
;       ll := $fortIndent
;       line := contPref
;     if ll > $fortIndent then lines := [line,:lines]
;   lines
 
(DEFUN |fortran2Lines1| (|f|)
  (PROG (|normPref| |contPref| |lines| |ll| |ok| |line| |ff| |sff| |spaceLeft|)
    (RETURN
     (PROGN
      (SETQ |normPref| (|make_spaces| |$fortIndent|))
      (SETQ |contPref| (STRCONC '|     &| (|make_spaces| (- |$fortIndent| 6))))
      (SETQ |lines| NIL)
      (SETQ |ll| |$fortIndent|)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |f|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |ok| T)
                  (SETQ |line| |normPref|)
                  (SETQ |ff| (CAR |f|))
                  ((LAMBDA ()
                     (LOOP
                      (COND ((NOT |ok|) (RETURN NIL))
                            (#1#
                             (COND
                              ((NOT
                                (< |$fortLength|
                                   (+ |ll| (SETQ |sff| (SIZE |ff|)))))
                               (PROGN
                                (SETQ |ll| (+ |ll| |sff|))
                                (SETQ |line| (STRCONC |line| |ff|))
                                (SETQ |f| (CDR |f|))
                                (COND (|f| (SETQ |ff| (CAR |f|)))
                                      (#1# (SETQ |ok| NIL)))))
                              (#1#
                               (PROGN
                                (COND
                                 ((AND (< |ll| |$fortLength|)
                                       (< |$fortLength| (+ |ll| |sff|)))
                                  (SETQ |spaceLeft| (- |$fortLength| |ll|))
                                  (SETQ |line|
                                          (STRCONC |line|
                                           (SUBSEQ |ff| 0 |spaceLeft|)))
                                  (SETQ |ff| (SUBSEQ |ff| |spaceLeft|))))
                                (SETQ |lines| (CONS |line| |lines|))
                                (SETQ |ll| |$fortIndent|)
                                (SETQ |line| |contPref|)))))))))
                  (COND
                   ((< |$fortIndent| |ll|)
                    (SETQ |lines| (CONS |line| |lines|))))))))))
      |lines|))))
 
; fortError1 u ==
;   $fortError := "t"
;   sayErrorly("Fortran translation error",
;              "   No corresponding Fortran structure for:")
;   mathPrint u
 
(DEFUN |fortError1| (|u|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$fortError| '|t|)
      (|sayErrorly| '|Fortran translation error|
       '|   No corresponding Fortran structure for:|)
      (|mathPrint| |u|)))))
 
; fortError(u,v) ==
;   $fortError := "t"
;   msg := STRCONC("   ",STRINGIMAGE u);
;   sayErrorly("Fortran translation error",msg)
;   mathPrint v
 
(DEFUN |fortError| (|u| |v|)
  (PROG (|msg|)
    (RETURN
     (PROGN
      (SETQ |$fortError| '|t|)
      (SETQ |msg| (STRCONC '|   | (STRINGIMAGE |u|)))
      (|sayErrorly| '|Fortran translation error| |msg|)
      (|mathPrint| |v|)))))
 
; dispStatement x ==
;   $fortError : fluid := nil
;   displayLines fortran2Lines statement2Fortran x
 
(DEFUN |dispStatement| (|x|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (|displayLines| (|fortran2Lines| (|statement2Fortran| |x|)))))))
 
; getStatement(x,ints2Floats?) ==
;   $fortInts2Floats : fluid := ints2Floats?
;   $fortError : fluid := nil
;   checkLines fortran2Lines statement2Fortran x
 
(DEFUN |getStatement| (|x| |ints2Floats?|)
  (PROG (|$fortError| |$fortInts2Floats|)
    (DECLARE (SPECIAL |$fortError| |$fortInts2Floats|))
    (RETURN
     (PROGN
      (SETQ |$fortInts2Floats| |ints2Floats?|)
      (SETQ |$fortError| NIL)
      (|checkLines| (|fortran2Lines| (|statement2Fortran| |x|)))))))
 
; fortexp0 x ==
;   f := expression2Fortran x
;   p := position('"%l",f)
;   p < 0 => f
;   l := NIL
;   while p < 0 repeat
;     [t,:f] := f
;     l := [t,:l]
;   NREVERSE ['"...",:l]
 
(DEFUN |fortexp0| (|x|)
  (PROG (|f| |p| |l| |LETTMP#1| |t|)
    (RETURN
     (PROGN
      (SETQ |f| (|expression2Fortran| |x|))
      (SETQ |p| (|position| "%l" |f|))
      (COND ((MINUSP |p|) |f|)
            (#1='T
             (PROGN
              (SETQ |l| NIL)
              ((LAMBDA ()
                 (LOOP
                  (COND ((NOT (MINUSP |p|)) (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |LETTMP#1| |f|)
                          (SETQ |t| (CAR |LETTMP#1|))
                          (SETQ |f| (CDR |LETTMP#1|))
                          (SETQ |l| (CONS |t| |l|))))))))
              (NREVERSE (CONS "..." |l|)))))))))
 
; dispfortexp x ==
;   if atom(x) or x is [op,:.] and not object2Identifier op in
;     '(_= MATRIX construct ) then
;       var := INTERN STRCONC('"R",object2String $IOindex)
;       x := ['"=",var,x]
;   dispfortexp1 x
 
(DEFUN |dispfortexp| (|x|)
  (PROG (|op| |var|)
    (RETURN
     (PROGN
      (COND
       ((OR (ATOM |x|)
            (AND (CONSP |x|) (PROGN (SETQ |op| (CAR |x|)) 'T)
                 (|member| (NULL (|object2Identifier| |op|))
                  '(= MATRIX |construct|))))
        (SETQ |var| (INTERN (STRCONC "R" (|object2String| |$IOindex|))))
        (SETQ |x| (LIST "=" |var| |x|))))
      (|dispfortexp1| |x|)))))
 
; dispfortexpf (xf, fortranName) ==
;   $fortError : fluid := nil
;   linef := fortran2Lines BUTLAST(expression2Fortran1(fortranName,xf),2)
;   displayLines linef
 
(DEFUN |dispfortexpf| (|xf| |fortranName|)
  (PROG (|$fortError| |linef|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (SETQ |linef|
              (|fortran2Lines|
               (BUTLAST (|expression2Fortran1| |fortranName| |xf|) 2)))
      (|displayLines| |linef|)))))
 
; dispfortexpj (xj, fortranName) ==
;   $fortName : fluid := fortranName
;   $fortError : fluid := nil
;   linej := fortran2Lines BUTLAST(expression2Fortran1(fortranName,xj),2)
;   displayLines linej
 
(DEFUN |dispfortexpj| (|xj| |fortranName|)
  (PROG (|$fortError| |$fortName| |linej|)
    (DECLARE (SPECIAL |$fortError| |$fortName|))
    (RETURN
     (PROGN
      (SETQ |$fortName| |fortranName|)
      (SETQ |$fortError| NIL)
      (SETQ |linej|
              (|fortran2Lines|
               (BUTLAST (|expression2Fortran1| |fortranName| |xj|) 2)))
      (|displayLines| |linej|)))))
 
; dispfortexp1 x ==
;   $fortError : fluid := nil
;   displayLines fortran2Lines expression2Fortran x
 
(DEFUN |dispfortexp1| (|x|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (|displayLines| (|fortran2Lines| (|expression2Fortran| |x|)))))))
 
; getfortexp1 x ==
;   $fortError : fluid := nil
;   checkLines fortran2Lines expression2Fortran x
 
(DEFUN |getfortexp1| (|x|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (|checkLines| (|fortran2Lines| (|expression2Fortran| |x|)))))))
 
; displayLines1 lines ==
;   for l in lines repeat
;     PRINTEXP(l,$fortranOutputStream)
;     TERPRI($fortranOutputStream)
 
(DEFUN |displayLines1| (|lines|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#5| |l|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#5|) (PROGN (SETQ |l| (CAR |bfVar#5|)) NIL))
           (RETURN NIL))
          ('T
           (PROGN
            (PRINTEXP |l| |$fortranOutputStream|)
            (TERPRI |$fortranOutputStream|))))
         (SETQ |bfVar#5| (CDR |bfVar#5|))))
      |lines| NIL))))
 
; displayLines lines ==
;   if not $fortError then displayLines1 lines
 
(DEFUN |displayLines| (|lines|)
  (PROG () (RETURN (COND ((NULL |$fortError|) (|displayLines1| |lines|))))))
 
; checkLines lines ==
;   $fortError => []
;   lines
 
(DEFUN |checkLines| (|lines|)
  (PROG () (RETURN (COND (|$fortError| NIL) ('T |lines|)))))
 
; dispfortarrayexp (fortranName,m) ==
;   $fortError : fluid := nil
;   displayLines fortran2Lines BUTLAST(expression2Fortran1(fortranName,m),2)
 
(DEFUN |dispfortarrayexp| (|fortranName| |m|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (|displayLines|
       (|fortran2Lines|
        (BUTLAST (|expression2Fortran1| |fortranName| |m|) 2)))))))
 
; getfortarrayexp(fortranName,m,ints2floats?) ==
;   $fortInts2Floats : fluid := ints2floats?
;   $fortError : fluid := nil
;   checkLines fortran2Lines BUTLAST(expression2Fortran1(fortranName,m),2)
 
(DEFUN |getfortarrayexp| (|fortranName| |m| |ints2floats?|)
  (PROG (|$fortError| |$fortInts2Floats|)
    (DECLARE (SPECIAL |$fortError| |$fortInts2Floats|))
    (RETURN
     (PROGN
      (SETQ |$fortInts2Floats| |ints2floats?|)
      (SETQ |$fortError| NIL)
      (|checkLines|
       (|fortran2Lines|
        (BUTLAST (|expression2Fortran1| |fortranName| |m|) 2)))))))
 
; $currentSubprogram := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$currentSubprogram| NIL))
 
; $symbolTable := nil
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$symbolTable| NIL))
 
; exp2FortSpecial(op,args,nargs) ==
;   op = "CONCAT" and first args in ["<",">","<=",">=","~","and","or"] =>
;     mkFortFn(first args,CDADAR rest args,#(CDADAR rest args))
;   op = "CONCAT" and CADR(args)="EQ" =>
;     mkFortFn("EQ",[first args, CADDR args],2)
;   --the next line is NEVER used by FORTRAN code but is needed when
;   --  called to get a linearized form for the browser
;   op = "QUOTE" =>
;     atom (arg := first args) => STRINGIMAGE arg
;     tailPart := "STRCONC"/[STRCONC('",",x) for x in rest arg]
;     STRCONC('"[",first arg,tailPart,'"]")
;   op = "PAREN" =>
;     args := first args
;     not(first(args)="CONCATB") => fortError1 [op,:args]
;     -- Have a matrix element
;     mkMat(args)
;   op = "SUB" =>
;     $fortInts2Floats : fluid := nil
;     mkFortFn(first args,rest args,#(rest args))
;   op in ["BRACE","BRACKET"] =>
;     args is [var,['AGGLST,:elts]] =>
;       var := object2String var
;       si := $fortranArrayStartingIndex
;       hidim := #elts - 1 + si
;       if LISTP first elts and #elts=1 and first elts is [sOp,:sArgs] then
;         sOp in ['"SEGMENT","SEGMENT"] =>
;           #sArgs=1 => fortError1 first elts
;           not(NUMBERP(first sArgs) and NUMBERP(SECOND sArgs)) =>
;             fortError("Cannot expand segment: ",first elts)
;           first sArgs > SECOND sArgs => fortError1
;             '"Lower bound of segment exceeds upper bound."
;           for e in first sArgs .. SECOND sArgs for i in si.. repeat
;             $exprStack := [["=",[var,object2String i],fortPre1(e)],:$exprStack]
;       for e in elts for i in si.. repeat
;         $exprStack := [["=",[var,object2String i],fortPre1(e)],:$exprStack]
;     fortError1 [op,:args]
;   op in ["CONCAT","CONCATB"] =>
;     nargs = 0 => NIL
;     nargs = 1 => fortPre1 first args
;     nargs = 2 and first rest args in ["!",'"!"] =>
;       mkFortFn("FACTORIAL",[first args],1)
;     fortError1 [op,:args]
;   op in ['"MATRIX","MATRIX"] =>
;     args is [var, =NIL,:rows] =>
;       var := object2String var
;       nrows := #rows - 1
;       ncols := #(rest first rows) - 1
;       si := $fortranArrayStartingIndex
;       for r in rows for rx in si.. repeat
;         for c in rest r for cx in si.. repeat
;           $exprStack := [["=",[var,object2String rx,object2String cx],
;                           fortPre1(c)],:$exprStack]
;     fortError1 [op,:args]
;   fortError1 [op,:args]
 
(DEFUN |exp2FortSpecial| (|op| |args| |nargs|)
  (PROG (|$fortInts2Floats| |ncols| |nrows| |rows| |sArgs| |sOp| |hidim| |si|
         |elts| |ISTMP#2| |ISTMP#1| |var| |tailPart| |arg|)
    (DECLARE (SPECIAL |$fortInts2Floats|))
    (RETURN
     (COND
      ((AND (EQ |op| 'CONCAT)
            (|member| (CAR |args|) (LIST '< '> '<= '>= '~ '|and| '|or|)))
       (|mkFortFn| (CAR |args|) (CDADAR (CDR |args|))
        (LENGTH (CDADAR (CDR |args|)))))
      ((AND (EQ |op| 'CONCAT) (EQ (CADR |args|) 'EQ))
       (|mkFortFn| 'EQ (LIST (CAR |args|) (CADDR |args|)) 2))
      ((EQ |op| 'QUOTE)
       (COND ((ATOM (SETQ |arg| (CAR |args|))) (STRINGIMAGE |arg|))
             (#1='T
              (PROGN
               (SETQ |tailPart|
                       ((LAMBDA (|bfVar#7| |bfVar#6| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#6|)
                                 (PROGN (SETQ |x| (CAR |bfVar#6|)) NIL))
                             (RETURN |bfVar#7|))
                            (#1#
                             (SETQ |bfVar#7|
                                     (STRCONC |bfVar#7| (STRCONC "," |x|)))))
                           (SETQ |bfVar#6| (CDR |bfVar#6|))))
                        "" (CDR |arg|) NIL))
               (STRCONC "[" (CAR |arg|) |tailPart| "]")))))
      ((EQ |op| 'PAREN)
       (PROGN
        (SETQ |args| (CAR |args|))
        (COND
         ((NULL (EQ (CAR |args|) 'CONCATB)) (|fortError1| (CONS |op| |args|)))
         (#1# (|mkMat| |args|)))))
      ((EQ |op| 'SUB)
       (PROGN
        (SETQ |$fortInts2Floats| NIL)
        (|mkFortFn| (CAR |args|) (CDR |args|) (LENGTH (CDR |args|)))))
      ((|member| |op| (LIST 'BRACE 'BRACKET))
       (COND
        ((AND (CONSP |args|)
              (PROGN
               (SETQ |var| (CAR |args|))
               (SETQ |ISTMP#1| (CDR |args|))
               (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                    (PROGN
                     (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) 'AGGLST)
                          (PROGN (SETQ |elts| (CDR |ISTMP#2|)) #1#))))))
         (PROGN
          (SETQ |var| (|object2String| |var|))
          (SETQ |si| |$fortranArrayStartingIndex|)
          (SETQ |hidim| (+ (- (LENGTH |elts|) 1) |si|))
          (COND
           ((AND (LISTP (CAR |elts|)) (EQL (LENGTH |elts|) 1)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |elts|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |sOp| (CAR |ISTMP#1|))
                        (SETQ |sArgs| (CDR |ISTMP#1|))
                        #1#))))
            (COND
             ((|member| |sOp| (LIST "SEGMENT" 'SEGMENT))
              (IDENTITY
               (COND ((EQL (LENGTH |sArgs|) 1) (|fortError1| (CAR |elts|)))
                     ((NULL
                       (AND (NUMBERP (CAR |sArgs|))
                            (NUMBERP (SECOND |sArgs|))))
                      (|fortError| '|Cannot expand segment: | (CAR |elts|)))
                     ((< (SECOND |sArgs|) (CAR |sArgs|))
                      (|fortError1|
                       "Lower bound of segment exceeds upper bound."))
                     (#1#
                      ((LAMBDA (|bfVar#8| |e| |i|)
                         (LOOP
                          (COND ((> |e| |bfVar#8|) (RETURN NIL))
                                (#1#
                                 (SETQ |$exprStack|
                                         (CONS
                                          (LIST '=
                                                (LIST |var|
                                                      (|object2String| |i|))
                                                (|fortPre1| |e|))
                                          |$exprStack|))))
                          (SETQ |e| (+ |e| 1))
                          (SETQ |i| (+ |i| 1))))
                       (SECOND |sArgs|) (CAR |sArgs|) |si|))))))))
          ((LAMBDA (|bfVar#9| |e| |i|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#9|) (PROGN (SETQ |e| (CAR |bfVar#9|)) NIL))
                (RETURN NIL))
               (#1#
                (SETQ |$exprStack|
                        (CONS
                         (LIST '= (LIST |var| (|object2String| |i|))
                               (|fortPre1| |e|))
                         |$exprStack|))))
              (SETQ |bfVar#9| (CDR |bfVar#9|))
              (SETQ |i| (+ |i| 1))))
           |elts| NIL |si|)))
        (#1# (|fortError1| (CONS |op| |args|)))))
      ((|member| |op| (LIST 'CONCAT 'CONCATB))
       (COND ((EQL |nargs| 0) NIL) ((EQL |nargs| 1) (|fortPre1| (CAR |args|)))
             ((AND (EQL |nargs| 2) (|member| (CAR (CDR |args|)) (LIST '! "!")))
              (|mkFortFn| 'FACTORIAL (LIST (CAR |args|)) 1))
             (#1# (|fortError1| (CONS |op| |args|)))))
      ((|member| |op| (LIST "MATRIX" 'MATRIX))
       (COND
        ((AND (CONSP |args|)
              (PROGN
               (SETQ |var| (CAR |args|))
               (SETQ |ISTMP#1| (CDR |args|))
               (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) NIL)
                    (PROGN (SETQ |rows| (CDR |ISTMP#1|)) #1#))))
         (PROGN
          (SETQ |var| (|object2String| |var|))
          (SETQ |nrows| (- (LENGTH |rows|) 1))
          (SETQ |ncols| (- (LENGTH (CDR (CAR |rows|))) 1))
          (SETQ |si| |$fortranArrayStartingIndex|)
          ((LAMBDA (|bfVar#10| |r| |rx|)
             (LOOP
              (COND
               ((OR (ATOM |bfVar#10|) (PROGN (SETQ |r| (CAR |bfVar#10|)) NIL))
                (RETURN NIL))
               (#1#
                ((LAMBDA (|bfVar#11| |c| |cx|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#11|)
                          (PROGN (SETQ |c| (CAR |bfVar#11|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (SETQ |$exprStack|
                              (CONS
                               (LIST '=
                                     (LIST |var| (|object2String| |rx|)
                                           (|object2String| |cx|))
                                     (|fortPre1| |c|))
                               |$exprStack|))))
                    (SETQ |bfVar#11| (CDR |bfVar#11|))
                    (SETQ |cx| (+ |cx| 1))))
                 (CDR |r|) NIL |si|)))
              (SETQ |bfVar#10| (CDR |bfVar#10|))
              (SETQ |rx| (+ |rx| 1))))
           |rows| NIL |si|)))
        (#1# (|fortError1| (CONS |op| |args|)))))
      (#1# (|fortError1| (CONS |op| |args|)))))))
 
; mkMat(args) ==
;   $fortInts2Floats : fluid := nil
;   mkFortFn(first rest args,rest rest args,#(rest rest args))
 
(DEFUN |mkMat| (|args|)
  (PROG (|$fortInts2Floats|)
    (DECLARE (SPECIAL |$fortInts2Floats|))
    (RETURN
     (PROGN
      (SETQ |$fortInts2Floats| NIL)
      (|mkFortFn| (CAR (CDR |args|)) (CDR (CDR |args|))
       (LENGTH (CDR (CDR |args|))))))))
 
; mkFortFn(op,args,nargs) ==
;   [fortranifyFunctionName(STRINGIMAGE op,nargs),
;    :MAPCAR(function fortPre1 , args) ]
 
(DEFUN |mkFortFn| (|op| |args| |nargs|)
  (PROG ()
    (RETURN
     (CONS (|fortranifyFunctionName| (STRINGIMAGE |op|) |nargs|)
           (MAPCAR #'|fortPre1| |args|)))))
 
; fortranifyFunctionName(op,nargs) ==
;   op = '"<" => '".LT."
;   op = '">" => '".GT."
;   op = '"<=" => '".LE."
;   op = '">=" => '".GE."
;   op = '"EQ" => '".EQ."
;   op = '"and" => '".AND."
;   op = '"or" => '".OR."
;   op = '"~" => '".NOT."
;   fortranifyIntrinsicFunctionName(op,nargs)
 
(DEFUN |fortranifyFunctionName| (|op| |nargs|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |op| "<") ".LT.") ((EQUAL |op| ">") ".GT.")
           ((EQUAL |op| "<=") ".LE.") ((EQUAL |op| ">=") ".GE.")
           ((EQUAL |op| "EQ") ".EQ.") ((EQUAL |op| "and") ".AND.")
           ((EQUAL |op| "or") ".OR.") ((EQUAL |op| "~") ".NOT.")
           ('T (|fortranifyIntrinsicFunctionName| |op| |nargs|))))))
 
; fortranifyIntrinsicFunctionName(op,nargs) ==
;   $useIntrinsicFunctions =>
;     intrinsic := if op = '"acos" then '"ACOS"
;     else if op = '"asin" then '"ASIN"
;     else if op = '"atan" then
;       nargs = 2 => '"ATAN2"
;       '"ATAN"
;     else if op = '"cos" then '"COS"
;     else if op = '"cosh" then '"COSH"
;     else if op = '"cot" then '"COTAN"
;     else if op = '"erf" then '"ERF"
;     else if op = '"exp" then '"EXP"
;     else if op = '"log" then '"LOG"
;     else if op = '"log10" then '"LOG10"
;     else if op = '"sin" then '"SIN"
;     else if op = '"sinh" then '"SINH"
;     else if op = '"sqrt" then '"SQRT"
;     else if op = '"tan" then '"TAN"
;     else if op = '"tanh" then '"TANH"
;     intrinsic =>
;       $intrinsics := ADJOIN(intrinsic,$intrinsics)
;       intrinsic
;     op
;   $fortranPrecision = 'double =>
;     op = '"acos" => '"DACOS"
;     op = '"asin" => '"DASIN"
;     op = '"atan" =>
;       nargs = 2 => '"DATAN2"
;       '"DATAN"
;     op = '"cos" => '"DCOS"
;     op = '"cosh" => '"DCOSH"
;     op = '"cot" => '"DCOTAN"
;     op = '"erf" => '"DERF"
;     op = '"exp" => '"DEXP"
;     op = '"log" => '"DLOG"
;     op = '"log10" => '"DLOG10"
;     op = '"sin" => '"DSIN"
;     op = '"sinh" => '"DSINH"
;     op = '"sqrt" => '"DSQRT"
;     op = '"tan" => '"DTAN"
;     op = '"tanh" => '"DTANH"
;     op = '"abs" => '"DABS"
;     op
;   op = '"acos" => '"ACOS"
;   op = '"asin" => '"ASIN"
;   op = '"atan" =>
;     nargs = 2 => '"ATAN2"
;     '"ATAN"
;   op = '"cos" => '"COS"
;   op = '"cosh" => '"COSH"
;   op = '"cot" => '"COTAN"
;   op = '"erf" => '"ERF"
;   op = '"exp" => '"EXP"
;   op = '"log" => '"ALOG"
;   op = '"log10" => '"ALOG10"
;   op = '"sin" => '"SIN"
;   op = '"sinh" => '"SINH"
;   op = '"sqrt" => '"SQRT"
;   op = '"tan" => '"TAN"
;   op = '"tanh" => '"TANH"
;   op = '"abs" => '"ABS"
;   op
 
(DEFUN |fortranifyIntrinsicFunctionName| (|op| |nargs|)
  (PROG (|intrinsic|)
    (RETURN
     (COND
      (|$useIntrinsicFunctions|
       (PROGN
        (SETQ |intrinsic|
                (COND ((EQUAL |op| "acos") "ACOS") ((EQUAL |op| "asin") "ASIN")
                      ((EQUAL |op| "atan")
                       (COND ((EQL |nargs| 2) "ATAN2") (#1='T "ATAN")))
                      ((EQUAL |op| "cos") "COS") ((EQUAL |op| "cosh") "COSH")
                      ((EQUAL |op| "cot") "COTAN") ((EQUAL |op| "erf") "ERF")
                      ((EQUAL |op| "exp") "EXP") ((EQUAL |op| "log") "LOG")
                      ((EQUAL |op| "log10") "LOG10") ((EQUAL |op| "sin") "SIN")
                      ((EQUAL |op| "sinh") "SINH") ((EQUAL |op| "sqrt") "SQRT")
                      ((EQUAL |op| "tan") "TAN") ((EQUAL |op| "tanh") "TANH")))
        (COND
         (|intrinsic|
          (PROGN
           (SETQ |$intrinsics| (ADJOIN |intrinsic| |$intrinsics|))
           |intrinsic|))
         (#1# |op|))))
      ((EQ |$fortranPrecision| '|double|)
       (COND ((EQUAL |op| "acos") "DACOS") ((EQUAL |op| "asin") "DASIN")
             ((EQUAL |op| "atan")
              (COND ((EQL |nargs| 2) "DATAN2") (#1# "DATAN")))
             ((EQUAL |op| "cos") "DCOS") ((EQUAL |op| "cosh") "DCOSH")
             ((EQUAL |op| "cot") "DCOTAN") ((EQUAL |op| "erf") "DERF")
             ((EQUAL |op| "exp") "DEXP") ((EQUAL |op| "log") "DLOG")
             ((EQUAL |op| "log10") "DLOG10") ((EQUAL |op| "sin") "DSIN")
             ((EQUAL |op| "sinh") "DSINH") ((EQUAL |op| "sqrt") "DSQRT")
             ((EQUAL |op| "tan") "DTAN") ((EQUAL |op| "tanh") "DTANH")
             ((EQUAL |op| "abs") "DABS") (#1# |op|)))
      ((EQUAL |op| "acos") "ACOS") ((EQUAL |op| "asin") "ASIN")
      ((EQUAL |op| "atan") (COND ((EQL |nargs| 2) "ATAN2") (#1# "ATAN")))
      ((EQUAL |op| "cos") "COS") ((EQUAL |op| "cosh") "COSH")
      ((EQUAL |op| "cot") "COTAN") ((EQUAL |op| "erf") "ERF")
      ((EQUAL |op| "exp") "EXP") ((EQUAL |op| "log") "ALOG")
      ((EQUAL |op| "log10") "ALOG10") ((EQUAL |op| "sin") "SIN")
      ((EQUAL |op| "sinh") "SINH") ((EQUAL |op| "sqrt") "SQRT")
      ((EQUAL |op| "tan") "TAN") ((EQUAL |op| "tanh") "TANH")
      ((EQUAL |op| "abs") "ABS") (#1# |op|)))))
 
; indentFortLevel(i) ==
;   $maximumFortranExpressionLength := $maximumFortranExpressionLength -2*i
;   $fortIndent := $fortIndent + 2*i
 
(DEFUN |indentFortLevel| (|i|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$maximumFortranExpressionLength|
              (- |$maximumFortranExpressionLength| (* 2 |i|)))
      (SETQ |$fortIndent| (+ |$fortIndent| (* 2 |i|)))))))
 
; changeExprLength(i) ==
;   $maximumFortranExpressionLength := $maximumFortranExpressionLength + i
 
(DEFUN |changeExprLength| (|i|)
  (PROG ()
    (RETURN
     (SETQ |$maximumFortranExpressionLength|
             (+ |$maximumFortranExpressionLength| |i|)))))
 
; fortFormatDo(var,lo,hi,incr,lab) ==
;   $fortError : fluid := nil
;   $fortInts2Floats : fluid := nil
;   incr=1 =>
;     checkLines fortran2Lines
;       ['"DO ",STRINGIMAGE lab,'" ",STRINGIMAGE var,'"=",:statement2Fortran lo,_
;        '",", :statement2Fortran hi]
;   checkLines fortran2Lines
;     ['"DO ",STRINGIMAGE lab,'" ",STRINGIMAGE var,'"=",:statement2Fortran lo,_
;      '",", :statement2Fortran hi,'",",:statement2Fortran incr]
 
(DEFUN |fortFormatDo| (|var| |lo| |hi| |incr| |lab|)
  (PROG (|$fortInts2Floats| |$fortError|)
    (DECLARE (SPECIAL |$fortInts2Floats| |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (SETQ |$fortInts2Floats| NIL)
      (COND
       ((EQL |incr| 1)
        (|checkLines|
         (|fortran2Lines|
          (CONS "DO "
                (CONS (STRINGIMAGE |lab|)
                      (CONS " "
                            (CONS (STRINGIMAGE |var|)
                                  (CONS "="
                                        (APPEND (|statement2Fortran| |lo|)
                                                (CONS ","
                                                      (|statement2Fortran|
                                                       |hi|)))))))))))
       ('T
        (|checkLines|
         (|fortran2Lines|
          (CONS "DO "
                (CONS (STRINGIMAGE |lab|)
                      (CONS " "
                            (CONS (STRINGIMAGE |var|)
                                  (CONS "="
                                        (APPEND (|statement2Fortran| |lo|)
                                                (CONS ","
                                                      (APPEND
                                                       (|statement2Fortran|
                                                        |hi|)
                                                       (CONS ","
                                                             (|statement2Fortran|
                                                              |incr|))))))))))))))))))
 
; fortFormatIfGoto(switch,label) ==
;   changeExprLength(-8) -- Leave room for IF( ... )GOTO
;   $fortError : fluid := nil
;   if first(switch) = "NULL" then switch := first rest switch
;   r := nreverse statement2Fortran switch
;   changeExprLength(8)
;   l := ['")GOTO ",STRINGIMAGE label]
;   while r and not(first(r) = '"%l") repeat
;     l := [first(r),:l]
;     r := rest(r)
;   checkLines fortran2Lines nreverse [:nreverse l,'"IF(",:r]
 
(DEFUN |fortFormatIfGoto| (|switch| |label|)
  (PROG (|$fortError| |l| |r|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (|changeExprLength| (- 8))
      (SETQ |$fortError| NIL)
      (COND ((EQ (CAR |switch|) 'NULL) (SETQ |switch| (CAR (CDR |switch|)))))
      (SETQ |r| (NREVERSE (|statement2Fortran| |switch|)))
      (|changeExprLength| 8)
      (SETQ |l| (LIST ")GOTO " (STRINGIMAGE |label|)))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (AND |r| (NULL (EQUAL (CAR |r|) "%l")))) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |l| (CONS (CAR |r|) |l|))
                  (SETQ |r| (CDR |r|))))))))
      (|checkLines|
       (|fortran2Lines|
        (NREVERSE (APPEND (NREVERSE |l|) (CONS "IF(" |r|)))))))))
 
; fortFormatLabelledIfGoto(switch,label1,label2) ==
;   changeExprLength(-8) -- Leave room for IF( ... )GOTO
;   $fortError : fluid := nil
;   if LISTP(switch) and first(switch) = "NULL" then switch := first rest switch
;   r := nreverse statement2Fortran switch
;   changeExprLength(8)
;   l := ['")GOTO ",STRINGIMAGE label2]
;   while r and not(first(r) = '"%l") repeat
;     l := [first(r),:l]
;     r := rest(r)
;   labString := STRINGIMAGE label1
;   for i in #(labString)..5 repeat labString := STRCONC(labString,'" ")
;   lines := fortran2Lines nreverse [:nreverse l,'"IF(",:r]
;   lines := [STRCONC(labString,SUBSEQ(first lines,6)),:rest lines]
;   checkLines lines
 
(DEFUN |fortFormatLabelledIfGoto| (|switch| |label1| |label2|)
  (PROG (|$fortError| |lines| |labString| |l| |r|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (|changeExprLength| (- 8))
      (SETQ |$fortError| NIL)
      (COND
       ((AND (LISTP |switch|) (EQ (CAR |switch|) 'NULL))
        (SETQ |switch| (CAR (CDR |switch|)))))
      (SETQ |r| (NREVERSE (|statement2Fortran| |switch|)))
      (|changeExprLength| 8)
      (SETQ |l| (LIST ")GOTO " (STRINGIMAGE |label2|)))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (AND |r| (NULL (EQUAL (CAR |r|) "%l")))) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |l| (CONS (CAR |r|) |l|))
                  (SETQ |r| (CDR |r|))))))))
      (SETQ |labString| (STRINGIMAGE |label1|))
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| 5) (RETURN NIL))
                (#1# (SETQ |labString| (STRCONC |labString| " "))))
          (SETQ |i| (+ |i| 1))))
       (LENGTH |labString|))
      (SETQ |lines|
              (|fortran2Lines|
               (NREVERSE (APPEND (NREVERSE |l|) (CONS "IF(" |r|)))))
      (SETQ |lines|
              (CONS (STRCONC |labString| (SUBSEQ (CAR |lines|) 6))
                    (CDR |lines|)))
      (|checkLines| |lines|)))))
 
; fortFormatIf(switch) ==
;   changeExprLength(-8) -- Leave room for IF( ... )THEN
;   $fortError : fluid := nil
;   if LISTP(switch) and first(switch) = "NULL" then switch := first rest switch
;   r := nreverse statement2Fortran switch
;   changeExprLength(8)
;   l := ['")THEN"]
;   while r and not(first(r) = '"%l") repeat
;     l := [first(r),:l]
;     r := rest(r)
;   checkLines fortran2Lines nreverse [:nreverse l,'"IF(",:r]
 
(DEFUN |fortFormatIf| (|switch|)
  (PROG (|$fortError| |l| |r|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (|changeExprLength| (- 8))
      (SETQ |$fortError| NIL)
      (COND
       ((AND (LISTP |switch|) (EQ (CAR |switch|) 'NULL))
        (SETQ |switch| (CAR (CDR |switch|)))))
      (SETQ |r| (NREVERSE (|statement2Fortran| |switch|)))
      (|changeExprLength| 8)
      (SETQ |l| (LIST ")THEN"))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (AND |r| (NULL (EQUAL (CAR |r|) "%l")))) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |l| (CONS (CAR |r|) |l|))
                  (SETQ |r| (CDR |r|))))))))
      (|checkLines|
       (|fortran2Lines|
        (NREVERSE (APPEND (NREVERSE |l|) (CONS "IF(" |r|)))))))))
 
; fortFormatElseIf(switch) ==
;   -- Leave room for IF( ... )THEN
;   changeExprLength(-12)
;   $fortError : fluid := nil
;   if LISTP(switch) and first(switch) = "NULL" then switch := first rest switch
;   r := nreverse statement2Fortran switch
;   changeExprLength(12)
;   l := ['")THEN"]
;   while r and not(first(r) = '"%l") repeat
;     l := [first(r),:l]
;     r := rest(r)
;   checkLines fortran2Lines nreverse [:nreverse l,'"ELSEIF(",:r]
 
(DEFUN |fortFormatElseIf| (|switch|)
  (PROG (|$fortError| |l| |r|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (|changeExprLength| (- 12))
      (SETQ |$fortError| NIL)
      (COND
       ((AND (LISTP |switch|) (EQ (CAR |switch|) 'NULL))
        (SETQ |switch| (CAR (CDR |switch|)))))
      (SETQ |r| (NREVERSE (|statement2Fortran| |switch|)))
      (|changeExprLength| 12)
      (SETQ |l| (LIST ")THEN"))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (AND |r| (NULL (EQUAL (CAR |r|) "%l")))) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |l| (CONS (CAR |r|) |l|))
                  (SETQ |r| (CDR |r|))))))))
      (|checkLines|
       (|fortran2Lines|
        (NREVERSE (APPEND (NREVERSE |l|) (CONS "ELSEIF(" |r|)))))))))
 
; fortFormatHead(returnType,name,args) ==
;   $fortError : fluid := nil
;   $fortranSegment : fluid := nil
;   -- if returnType = '"_"_(_)_"" then
;   if returnType = '"void" then
;     asp := ['"SUBROUTINE "]
;     changeExprLength(l := -11)
;   else
;     asp := [s := checkType STRINGIMAGE returnType,'" FUNCTION "]
;     changeExprLength(l := -10-LENGTH(s))
;   displayLines fortran2Lines [:asp,:statement2Fortran [name,:CDADR args] ]
;   changeExprLength(-l)
 
(DEFUN |fortFormatHead| (|returnType| |name| |args|)
  (PROG (|$fortranSegment| |$fortError| |s| |l| |asp|)
    (DECLARE (SPECIAL |$fortranSegment| |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (SETQ |$fortranSegment| NIL)
      (COND
       ((EQUAL |returnType| "void") (SETQ |asp| (LIST "SUBROUTINE "))
        (|changeExprLength| (SETQ |l| (- 11))))
       ('T
        (SETQ |asp|
                (LIST (SETQ |s| (|checkType| (STRINGIMAGE |returnType|)))
                      " FUNCTION "))
        (|changeExprLength| (SETQ |l| (- (- 10) (LENGTH |s|))))))
      (|displayLines|
       (|fortran2Lines|
        (APPEND |asp| (|statement2Fortran| (CONS |name| (CDADR |args|))))))
      (|changeExprLength| (- |l|))))))
 
; checkType ty ==
;   ty := STRING_-UPCASE STRINGIMAGE ty
;   $fortranPrecision = "double" =>
;     ty = '"REAL" => '"DOUBLE PRECISION"
;     ty = '"COMPLEX" => '"DOUBLE COMPLEX"
;     ty
;   ty
 
(DEFUN |checkType| (|ty|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |ty| (STRING-UPCASE (STRINGIMAGE |ty|)))
      (COND
       ((EQ |$fortranPrecision| '|double|)
        (COND ((EQUAL |ty| "REAL") "DOUBLE PRECISION")
              ((EQUAL |ty| "COMPLEX") "DOUBLE COMPLEX") (#1='T |ty|)))
       (#1# |ty|))))))
 
; mkParameterList l ==
;   [par2string(u) for u in l] where par2string u ==
;       atom(u) => STRINGIMAGE u
;       u := rest first rest u
;       apply('STRCONC,[STRINGIMAGE(first u),'"(",_
;                :rest [:['",",:statement2Fortran(v)] for v in rest u],'")"])
 
(DEFUN |mkParameterList| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#13| |bfVar#12| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#12|) (PROGN (SETQ |u| (CAR |bfVar#12|)) NIL))
           (RETURN (NREVERSE |bfVar#13|)))
          ('T
           (SETQ |bfVar#13|
                   (CONS (|mkParameterList,par2string| |u|) |bfVar#13|))))
         (SETQ |bfVar#12| (CDR |bfVar#12|))))
      NIL |l| NIL))))
(DEFUN |mkParameterList,par2string| (|u|)
  (PROG ()
    (RETURN
     (COND ((ATOM |u|) (STRINGIMAGE |u|))
           (#1='T
            (PROGN
             (SETQ |u| (CDR (CAR (CDR |u|))))
             (APPLY 'STRCONC
                    (CONS (STRINGIMAGE (CAR |u|))
                          (CONS "("
                                (APPEND
                                 (CDR
                                  ((LAMBDA (|bfVar#15| |bfVar#14| |v|)
                                     (LOOP
                                      (COND
                                       ((OR (ATOM |bfVar#14|)
                                            (PROGN
                                             (SETQ |v| (CAR |bfVar#14|))
                                             NIL))
                                        (RETURN (NREVERSE |bfVar#15|)))
                                       (#1#
                                        (SETQ |bfVar#15|
                                                (APPEND
                                                 (REVERSE
                                                  (CONS ","
                                                        (|statement2Fortran|
                                                         |v|)))
                                                 |bfVar#15|))))
                                      (SETQ |bfVar#14| (CDR |bfVar#14|))))
                                   NIL (CDR |u|) NIL))
                                 (CONS ")" NIL)))))))))))
 
; nameLen n ==
;  +/[1+LENGTH(u) for u in n]
 
(DEFUN |nameLen| (|n|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#17| |bfVar#16| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#16|) (PROGN (SETQ |u| (CAR |bfVar#16|)) NIL))
           (RETURN |bfVar#17|))
          ('T (SETQ |bfVar#17| (+ |bfVar#17| (+ 1 (LENGTH |u|))))))
         (SETQ |bfVar#16| (CDR |bfVar#16|))))
      0 |n| NIL))))
 
; fortFormatTypes(typeName,names) ==
;   null names => return nil
;   $fortError : fluid := nil
;   $fortranSegment : fluid := nil
;   $fortInts2Floats : fluid := nil
;   typeName := checkType typeName
;   typeName = '"CHARACTER" =>
;     fortFormatCharacterTypes([unravel(u) for u in names])
;       where unravel u ==
;               atom u => u
;               CDADR u
;   fortFormatTypes1(typeName,mkParameterList names)
 
(DEFUN |fortFormatTypes| (|typeName| |names|)
  (PROG (|$fortInts2Floats| |$fortranSegment| |$fortError|)
    (DECLARE (SPECIAL |$fortInts2Floats| |$fortranSegment| |$fortError|))
    (RETURN
     (COND ((NULL |names|) (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |$fortError| NIL)
             (SETQ |$fortranSegment| NIL)
             (SETQ |$fortInts2Floats| NIL)
             (SETQ |typeName| (|checkType| |typeName|))
             (COND
              ((EQUAL |typeName| "CHARACTER")
               (|fortFormatCharacterTypes|
                ((LAMBDA (|bfVar#19| |bfVar#18| |u|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#18|)
                          (PROGN (SETQ |u| (CAR |bfVar#18|)) NIL))
                      (RETURN (NREVERSE |bfVar#19|)))
                     (#1#
                      (SETQ |bfVar#19|
                              (CONS (|fortFormatTypes,unravel| |u|)
                                    |bfVar#19|))))
                    (SETQ |bfVar#18| (CDR |bfVar#18|))))
                 NIL |names| NIL)))
              (#1#
               (|fortFormatTypes1| |typeName|
                (|mkParameterList| |names|))))))))))
(DEFUN |fortFormatTypes,unravel| (|u|)
  (PROG () (RETURN (COND ((ATOM |u|) |u|) ('T (CDADR |u|))))))
 
; fortFormatTypes1(typeName,names) ==
;   l := $maximumFortranExpressionLength-1-LENGTH(typeName)
;   while nameLen(names) > l repeat
;     n := []
;     ln := 0
;     while (ln := ln + LENGTH(first names) + 1) < l repeat
;       n := [first names,:n]
;       names := rest names
;     displayLines fortran2Lines [typeName,'" ",:addCommas n]
;   displayLines fortran2Lines [typeName,'" ",:addCommas names]
 
(DEFUN |fortFormatTypes1| (|typeName| |names|)
  (PROG (|l| |n| |ln|)
    (RETURN
     (PROGN
      (SETQ |l|
              (- (- |$maximumFortranExpressionLength| 1) (LENGTH |typeName|)))
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (< |l| (|nameLen| |names|))) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |n| NIL)
                  (SETQ |ln| 0)
                  ((LAMBDA ()
                     (LOOP
                      (COND
                       ((NOT
                         (< (SETQ |ln| (+ (+ |ln| (LENGTH (CAR |names|))) 1))
                            |l|))
                        (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |n| (CONS (CAR |names|) |n|))
                         (SETQ |names| (CDR |names|))))))))
                  (|displayLines|
                   (|fortran2Lines|
                    (CONS |typeName| (CONS " " (|addCommas| |n|)))))))))))
      (|displayLines|
       (|fortran2Lines| (CONS |typeName| (CONS " " (|addCommas| |names|)))))))))
 
; insertEntry(size,el,aList) ==
;   entry := assoc(size,aList)
;   null entry => CONS(CONS(size,LIST el),aList)
;   RPLACD(entry, CONS(el, rest entry))
;   aList
 
(DEFUN |insertEntry| (SIZE |el| |aList|)
  (PROG (|entry|)
    (RETURN
     (PROGN
      (SETQ |entry| (|assoc| SIZE |aList|))
      (COND ((NULL |entry|) (CONS (CONS SIZE (LIST |el|)) |aList|))
            ('T (PROGN (RPLACD |entry| (CONS |el| (CDR |entry|))) |aList|)))))))
 
; fortFormatCharacterTypes(names) ==
;   sortedByLength := []
;   genuineArrays  := []
;   for u in names repeat
;     ATOM u => sortedByLength := insertEntry(0,u,sortedByLength)
;     #u=2 => sortedByLength := insertEntry(CADR u, first u, sortedByLength)
;     genuineArrays := [u,:genuineArrays]
;   for u in sortedByLength repeat
;     fortFormatTypes1(mkCharName car u, [STRINGIMAGE(s) for s in cdr(u)]) where
;        mkCharName v == CONCAT("CHARACTER*(",STRINGIMAGE v,")")
;   if (not null genuineArrays) then
;     fortFormatTypes1('"CHARACTER",mkParameterList2 genuineArrays) where
;        mkParameterList2 l ==
;          [par2string(u) for u in l] where par2string u ==
;              apply('STRCONC,[STRINGIMAGE(first u),'"(",_
;                       :rest [:['",",:statement2Fortran(v)] for v in rest u],'")"])
 
(DEFUN |fortFormatCharacterTypes| (|names|)
  (PROG (|sortedByLength| |genuineArrays|)
    (RETURN
     (PROGN
      (SETQ |sortedByLength| NIL)
      (SETQ |genuineArrays| NIL)
      ((LAMBDA (|bfVar#20| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#20|) (PROGN (SETQ |u| (CAR |bfVar#20|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((ATOM |u|)
              (SETQ |sortedByLength| (|insertEntry| 0 |u| |sortedByLength|)))
             ((EQL (LENGTH |u|) 2)
              (SETQ |sortedByLength|
                      (|insertEntry| (CADR |u|) (CAR |u|) |sortedByLength|)))
             (#1# (SETQ |genuineArrays| (CONS |u| |genuineArrays|))))))
          (SETQ |bfVar#20| (CDR |bfVar#20|))))
       |names| NIL)
      ((LAMBDA (|bfVar#21| |u|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#21|) (PROGN (SETQ |u| (CAR |bfVar#21|)) NIL))
            (RETURN NIL))
           (#1#
            (|fortFormatTypes1|
             (|fortFormatCharacterTypes,mkCharName| (CAR |u|))
             ((LAMBDA (|bfVar#23| |bfVar#22| |s|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#22|)
                       (PROGN (SETQ |s| (CAR |bfVar#22|)) NIL))
                   (RETURN (NREVERSE |bfVar#23|)))
                  (#1# (SETQ |bfVar#23| (CONS (STRINGIMAGE |s|) |bfVar#23|))))
                 (SETQ |bfVar#22| (CDR |bfVar#22|))))
              NIL (CDR |u|) NIL))))
          (SETQ |bfVar#21| (CDR |bfVar#21|))))
       |sortedByLength| NIL)
      (COND
       ((NULL (NULL |genuineArrays|))
        (|fortFormatTypes1| "CHARACTER"
         (|fortFormatCharacterTypes,mkParameterList2| |genuineArrays|))))))))
(DEFUN |fortFormatCharacterTypes,mkParameterList2| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#25| |bfVar#24| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#24|) (PROGN (SETQ |u| (CAR |bfVar#24|)) NIL))
           (RETURN (NREVERSE |bfVar#25|)))
          ('T
           (SETQ |bfVar#25|
                   (CONS (|fortFormatCharacterTypes,par2string| |u|)
                         |bfVar#25|))))
         (SETQ |bfVar#24| (CDR |bfVar#24|))))
      NIL |l| NIL))))
(DEFUN |fortFormatCharacterTypes,par2string| (|u|)
  (PROG ()
    (RETURN
     (APPLY 'STRCONC
            (CONS (STRINGIMAGE (CAR |u|))
                  (CONS "("
                        (APPEND
                         (CDR
                          ((LAMBDA (|bfVar#27| |bfVar#26| |v|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#26|)
                                    (PROGN (SETQ |v| (CAR |bfVar#26|)) NIL))
                                (RETURN (NREVERSE |bfVar#27|)))
                               ('T
                                (SETQ |bfVar#27|
                                        (APPEND
                                         (REVERSE
                                          (CONS "," (|statement2Fortran| |v|)))
                                         |bfVar#27|))))
                              (SETQ |bfVar#26| (CDR |bfVar#26|))))
                           NIL (CDR |u|) NIL))
                         (CONS ")" NIL))))))))
(DEFUN |fortFormatCharacterTypes,mkCharName| (|v|)
  (PROG () (RETURN (CONCAT '|CHARACTER*(| (STRINGIMAGE |v|) '|)|))))
 
; fortFormatIntrinsics(l) ==
;   $fortError : fluid := nil
;   null l => return nil
;   displayLines fortran2Lines ['"INTRINSIC ",:addCommas(l)]
 
(DEFUN |fortFormatIntrinsics| (|l|)
  (PROG (|$fortError|)
    (DECLARE (SPECIAL |$fortError|))
    (RETURN
     (PROGN
      (SETQ |$fortError| NIL)
      (COND ((NULL |l|) (RETURN NIL))
            ('T
             (|displayLines|
              (|fortran2Lines| (CONS "INTRINSIC " (|addCommas| |l|))))))))))
 
; currentSP () ==
;   -- Return the name of the current subprogram being generated
;   $currentSubprogram or "MAIN"
 
(DEFUN |currentSP| () (PROG () (RETURN (OR |$currentSubprogram| 'MAIN))))
 
; updateSymbolTable(name,type) ==
;     fun := ['$elt,'SYMS,'declare_!]
;     coercion := ['_:_:,STRING type,'FST]
;     $insideCompileBodyIfTrue: local := false
;     interpret([fun,["QUOTE",name],coercion])
 
(DEFUN |updateSymbolTable| (|name| |type|)
  (PROG (|$insideCompileBodyIfTrue| |coercion| |fun|)
    (DECLARE (SPECIAL |$insideCompileBodyIfTrue|))
    (RETURN
     (PROGN
      (SETQ |fun| (LIST '|$elt| 'SYMS '|declare!|))
      (SETQ |coercion| (LIST '|::| (STRING |type|) 'FST))
      (SETQ |$insideCompileBodyIfTrue| NIL)
      (|interpret| (LIST |fun| (LIST 'QUOTE |name|) |coercion|))))))
 
; addCommas l ==
;   not l => nil
;   r := [STRINGIMAGE first l]
;   for e in rest l repeat r := [STRINGIMAGE e,'",",:r]
;   reverse r
 
(DEFUN |addCommas| (|l|)
  (PROG (|r|)
    (RETURN
     (COND ((NULL |l|) NIL)
           (#1='T
            (PROGN
             (SETQ |r| (LIST (STRINGIMAGE (CAR |l|))))
             ((LAMBDA (|bfVar#28| |e|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#28|)
                       (PROGN (SETQ |e| (CAR |bfVar#28|)) NIL))
                   (RETURN NIL))
                  (#1# (SETQ |r| (CONS (STRINGIMAGE |e|) (CONS "," |r|)))))
                 (SETQ |bfVar#28| (CDR |bfVar#28|))))
              (CDR |l|) NIL)
             (REVERSE |r|)))))))
 
; $intrinsics := []
 
(EVAL-WHEN (EVAL LOAD) (SETQ |$intrinsics| NIL))
 
; initialiseIntrinsicList() ==
;   $intrinsics := []
 
(DEFUN |initialiseIntrinsicList| () (PROG () (RETURN (SETQ |$intrinsics| NIL))))
 
; getIntrinsicList() ==
;   $intrinsics
 
(DEFUN |getIntrinsicList| () (PROG () (RETURN |$intrinsics|)))
 
; fortPre l ==
;   -- Essentially, the idea is to fix things so that we know what size of
;   -- expression we will generate, which helps segment large expressions
;   -- and do transformations to double precision output etc..
;   $exprStack : fluid := nil -- sometimes we will add elements to this in
;                             -- other functions, for example when extracing
;                             -- lists etc.
;   for e in l repeat if new := fortPre1 e then
;      $exprStack := [new,:$exprStack]
;   reverse $exprStack
 
(DEFUN |fortPre| (|l|)
  (PROG (|$exprStack| |new|)
    (DECLARE (SPECIAL |$exprStack|))
    (RETURN
     (PROGN
      (SETQ |$exprStack| NIL)
      ((LAMBDA (|bfVar#29| |e|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#29|) (PROGN (SETQ |e| (CAR |bfVar#29|)) NIL))
            (RETURN NIL))
           ('T
            (COND
             ((SETQ |new| (|fortPre1| |e|))
              (SETQ |$exprStack| (CONS |new| |$exprStack|))))))
          (SETQ |bfVar#29| (CDR |bfVar#29|))))
       |l| NIL)
      (REVERSE |$exprStack|)))))
 
; fortPre1 e ==
;   -- replace spad function names by Fortran equivalents
;   -- where appropriate, replace integers by floats
;   -- extract complex numbers
;   -- replace powers of %e by calls to EXP
;   -- replace x**2 by x*x etc.
;   -- replace ROOT by either SQRT or **(1./ ... )
;   -- replace N-ary by binary functions
;   -- strip the '%' character off objects like %pi etc..
;   null e => nil
;   INTEGERP(e) =>
;     $fortInts2Floats = true =>
;       e >= 0 => fix2FortranFloat(e)
;       ['"-", fix2FortranFloat(-e)]
;     e
;   isFloat(e) => checkPrecision(e)
;   -- Keep strings as strings:
;   -- STRINGP(e) => STRCONC(STRING(34),e,STRING(34))
;   STRINGP(e) => e
;   e = "%e" => fortPre1 ["exp" , 1]
;   imags := ['"%i","%i"]
;   e in imags => ['"CMPLX",fortPre1(0),fortPre1(1)]
;   -- other special objects
;   ELT(STRINGIMAGE e, 0) = char "%" => SUBSEQ(STRINGIMAGE e, 1)
;   atom e => e
;   [op, :args] := e
;   op in ["^" , '"^"] =>
;     [rand,exponent] := args
;     rand = "%e" => fortPre1 ["exp", exponent]
;     (IDENTP rand or STRINGP rand) and exponent=2 => ["*", rand, rand]
;     (FIXP exponent and ABS(exponent) < 32768) => ["**",fortPre1 rand,exponent]
;     ["**", fortPre1 rand,fortPre1 exponent]
;   op = "ROOT" =>
;     #args = 1 => fortPreRoot ["sqrt", first args]
;     [ "**" , fortPreRoot first args , [ "/" , fortPreRoot(1), fortPreRoot first rest args] ]
;   if op in ['"OVER", "OVER"] then op := '"/"
;   specialOps  := '(BRACKET BRACE SUB AGGLST SUPERSUB MATRIX SEGMENT ALTSUPERSUB
;                    PAREN CONCAT CONCATB QUOTE STRING SIGMA  STEP IN SIGMA2
;                    INTSIGN  PI PI2 INDEFINTEGRAL)
;   op in specialOps => exp2FortSpecial(op,args,#args)
;   op in ['"*", "*", '"+", "+", '"-", "-"] and (#args > 2) =>
;     binaryExpr := fortPre1 [op,first args, SECOND args]
;     for i in 3..#args repeat
;       binaryExpr := [op,binaryExpr,fortPre1 NTH(i-1,args)]
;     binaryExpr
;   -- Now look for any complex objects
;   #args = 2 =>
;     [arg1,arg2] := args
;     op in ["*",'"*"] and arg2 in imags => ['"CMPLX",fortPre1(0),fortPre1(arg1)]
;     op in ["+",'"+"] and arg2 in imags => ['"CMPLX",fortPre1(arg1),fortPre1(1)]
;     op in ["+",'"+"] and arg2 is [mop,m1,m2] and mop in ["*",'"*"] =>
;       m2 in imags => ['"CMPLX",fortPre1(arg1),fortPre1(m1)]
;       m1 in imags => ['"CMPLX",fortPre1(arg1),fortPre1(m2)]
;       ["+",fortPre1 arg1,fortPre1 arg2]
;     op in ["+",'"+"] and arg1 is [mop,m1,m2] and mop in ["*",'"*"] =>
;       m2 in imags => ['"CMPLX",fortPre1(arg2),fortPre1(m1)]
;       m1 in imags => ['"CMPLX",fortPre1(arg2),fortPre1(m2)]
;       ["+",fortPre1 arg1,fortPre1 arg2]
;     mkFortFn(op,args,2)
;   mkFortFn(op,args,#args)
 
(DEFUN |fortPre1| (|e|)
  (PROG (|imags| |op| |args| |rand| |exponent| |specialOps| |binaryExpr| |arg1|
         |arg2| |mop| |ISTMP#1| |m1| |ISTMP#2| |m2|)
    (RETURN
     (COND ((NULL |e|) NIL)
           ((INTEGERP |e|)
            (COND
             ((EQUAL |$fortInts2Floats| T)
              (COND ((NOT (MINUSP |e|)) (|fix2FortranFloat| |e|))
                    (#1='T (LIST "-" (|fix2FortranFloat| (- |e|))))))
             (#1# |e|)))
           ((|isFloat| |e|) (|checkPrecision| |e|)) ((STRINGP |e|) |e|)
           ((EQ |e| '|%e|) (|fortPre1| (LIST '|exp| 1)))
           (#1#
            (PROGN
             (SETQ |imags| (LIST "%i" '|%i|))
             (COND
              ((|member| |e| |imags|)
               (LIST "CMPLX" (|fortPre1| 0) (|fortPre1| 1)))
              ((EQUAL (ELT (STRINGIMAGE |e|) 0) (|char| '%))
               (SUBSEQ (STRINGIMAGE |e|) 1))
              ((ATOM |e|) |e|)
              (#1#
               (PROGN
                (SETQ |op| (CAR |e|))
                (SETQ |args| (CDR |e|))
                (COND
                 ((|member| |op| (LIST '^ "^"))
                  (PROGN
                   (SETQ |rand| (CAR |args|))
                   (SETQ |exponent| (CADR |args|))
                   (COND
                    ((EQ |rand| '|%e|) (|fortPre1| (LIST '|exp| |exponent|)))
                    ((AND (OR (IDENTP |rand|) (STRINGP |rand|))
                          (EQL |exponent| 2))
                     (LIST '* |rand| |rand|))
                    ((AND (FIXP |exponent|) (< (ABS |exponent|) 32768))
                     (LIST '** (|fortPre1| |rand|) |exponent|))
                    (#1#
                     (LIST '** (|fortPre1| |rand|) (|fortPre1| |exponent|))))))
                 ((EQ |op| 'ROOT)
                  (COND
                   ((EQL (LENGTH |args|) 1)
                    (|fortPreRoot| (LIST '|sqrt| (CAR |args|))))
                   (#1#
                    (LIST '** (|fortPreRoot| (CAR |args|))
                          (LIST '/ (|fortPreRoot| 1)
                                (|fortPreRoot| (CAR (CDR |args|))))))))
                 (#1#
                  (PROGN
                   (COND ((|member| |op| (LIST "OVER" 'OVER)) (SETQ |op| "/")))
                   (SETQ |specialOps|
                           '(BRACKET BRACE SUB AGGLST SUPERSUB MATRIX SEGMENT
                             ALTSUPERSUB PAREN CONCAT CONCATB QUOTE STRING
                             SIGMA STEP IN SIGMA2 INTSIGN PI PI2
                             INDEFINTEGRAL))
                   (COND
                    ((|member| |op| |specialOps|)
                     (|exp2FortSpecial| |op| |args| (LENGTH |args|)))
                    ((AND (|member| |op| (LIST "*" '* "+" '+ "-" '-))
                          (< 2 (LENGTH |args|)))
                     (PROGN
                      (SETQ |binaryExpr|
                              (|fortPre1|
                               (LIST |op| (CAR |args|) (SECOND |args|))))
                      ((LAMBDA (|bfVar#30| |i|)
                         (LOOP
                          (COND ((> |i| |bfVar#30|) (RETURN NIL))
                                (#1#
                                 (SETQ |binaryExpr|
                                         (LIST |op| |binaryExpr|
                                               (|fortPre1|
                                                (NTH (- |i| 1) |args|))))))
                          (SETQ |i| (+ |i| 1))))
                       (LENGTH |args|) 3)
                      |binaryExpr|))
                    ((EQL (LENGTH |args|) 2)
                     (PROGN
                      (SETQ |arg1| (CAR |args|))
                      (SETQ |arg2| (CADR |args|))
                      (COND
                       ((AND (|member| |op| (LIST '* "*"))
                             (|member| |arg2| |imags|))
                        (LIST "CMPLX" (|fortPre1| 0) (|fortPre1| |arg1|)))
                       ((AND (|member| |op| (LIST '+ "+"))
                             (|member| |arg2| |imags|))
                        (LIST "CMPLX" (|fortPre1| |arg1|) (|fortPre1| 1)))
                       ((AND (|member| |op| (LIST '+ "+")) (CONSP |arg2|)
                             (PROGN
                              (SETQ |mop| (CAR |arg2|))
                              (SETQ |ISTMP#1| (CDR |arg2|))
                              (AND (CONSP |ISTMP#1|)
                                   (PROGN
                                    (SETQ |m1| (CAR |ISTMP#1|))
                                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                    (AND (CONSP |ISTMP#2|)
                                         (EQ (CDR |ISTMP#2|) NIL)
                                         (PROGN
                                          (SETQ |m2| (CAR |ISTMP#2|))
                                          #1#)))))
                             (|member| |mop| (LIST '* "*")))
                        (COND
                         ((|member| |m2| |imags|)
                          (LIST "CMPLX" (|fortPre1| |arg1|) (|fortPre1| |m1|)))
                         ((|member| |m1| |imags|)
                          (LIST "CMPLX" (|fortPre1| |arg1|) (|fortPre1| |m2|)))
                         (#1#
                          (LIST '+ (|fortPre1| |arg1|) (|fortPre1| |arg2|)))))
                       ((AND (|member| |op| (LIST '+ "+")) (CONSP |arg1|)
                             (PROGN
                              (SETQ |mop| (CAR |arg1|))
                              (SETQ |ISTMP#1| (CDR |arg1|))
                              (AND (CONSP |ISTMP#1|)
                                   (PROGN
                                    (SETQ |m1| (CAR |ISTMP#1|))
                                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                    (AND (CONSP |ISTMP#2|)
                                         (EQ (CDR |ISTMP#2|) NIL)
                                         (PROGN
                                          (SETQ |m2| (CAR |ISTMP#2|))
                                          #1#)))))
                             (|member| |mop| (LIST '* "*")))
                        (COND
                         ((|member| |m2| |imags|)
                          (LIST "CMPLX" (|fortPre1| |arg2|) (|fortPre1| |m1|)))
                         ((|member| |m1| |imags|)
                          (LIST "CMPLX" (|fortPre1| |arg2|) (|fortPre1| |m2|)))
                         (#1#
                          (LIST '+ (|fortPre1| |arg1|) (|fortPre1| |arg2|)))))
                       (#1# (|mkFortFn| |op| |args| 2)))))
                    (#1# (|mkFortFn| |op| |args| (LENGTH |args|))))))))))))))))
 
; fortPreRoot e ==
; -- To set $fortInts2Floats
;   $fortInts2Floats : fluid := true
;   fortPre1 e
 
(DEFUN |fortPreRoot| (|e|)
  (PROG (|$fortInts2Floats|)
    (DECLARE (SPECIAL |$fortInts2Floats|))
    (RETURN (PROGN (SETQ |$fortInts2Floats| T) (|fortPre1| |e|)))))
 
; fix2FortranFloat e ==
;   -- Return a Fortran float for a given integer.
;   $fortranPrecision = "double" => STRCONC(STRINGIMAGE(e),".0D0")
;   STRCONC(STRINGIMAGE(e),".")
 
(DEFUN |fix2FortranFloat| (|e|)
  (PROG ()
    (RETURN
     (COND
      ((EQ |$fortranPrecision| '|double|) (STRCONC (STRINGIMAGE |e|) '|.0D0|))
      ('T (STRCONC (STRINGIMAGE |e|) '|.|))))))
 
; isFloat e ==
;   FLOATP(e) or STRINGP(e) and FIND(char ".",e)
 
(DEFUN |isFloat| (|e|)
  (PROG ()
    (RETURN (OR (FLOATP |e|) (AND (STRINGP |e|) (FIND (|char| '|.|) |e|))))))
 
; checkPrecision e ==
;   -- Do we have a string?
;   STRINGP(e) and CHAR_-CODE(CHAR(e,0)) = 34 => e
;   e := delete(char " ",STRINGIMAGE e)
;   $fortranPrecision = "double" =>
;     iPart := SUBSEQ(e,0,(period:=POSITION(char ".",e))+1)
;     expt  := if ePos := POSITION(char "E",e) then SUBSEQ(e,ePos+1) else "0"
;     rPart :=
;       ePos => SUBSEQ(e,period+1,ePos)
;       period+1 < LENGTH e => SUBSEQ(e,period+1)
;       "0"
;     STRCONC(iPart,rPart,"D",expt)
;   e
 
(DEFUN |checkPrecision| (|e|)
  (PROG (|period| |iPart| |ePos| |expt| |rPart|)
    (RETURN
     (COND ((AND (STRINGP |e|) (EQL (CHAR-CODE (CHAR |e| 0)) 34)) |e|)
           (#1='T
            (PROGN
             (SETQ |e| (|delete| (|char| '| |) (STRINGIMAGE |e|)))
             (COND
              ((EQ |$fortranPrecision| '|double|)
               (PROGN
                (SETQ |iPart|
                        (SUBSEQ |e| 0
                                (+ (SETQ |period| (POSITION (|char| '|.|) |e|))
                                   1)))
                (SETQ |expt|
                        (COND
                         ((SETQ |ePos| (POSITION (|char| 'E) |e|))
                          (SUBSEQ |e| (+ |ePos| 1)))
                         (#1# '|0|)))
                (SETQ |rPart|
                        (COND (|ePos| (SUBSEQ |e| (+ |period| 1) |ePos|))
                              ((< (+ |period| 1) (LENGTH |e|))
                               (SUBSEQ |e| (+ |period| 1)))
                              (#1# '|0|)))
                (STRCONC |iPart| |rPart| 'D |expt|)))
              (#1# |e|))))))))
 
; fortExpSize e ==
;   -- computes a tree reflecting the number of characters of the printed
;   -- expression.
;   -- The first element of a list is the "total so far", while subsequent
;   -- elements are the sizes of the components.
;   --
;   -- This function overestimates the size because it assumes that e.g.
;   -- (+ x (+ y z)) will be printed as "x+(y+z)" rather than "x+y+z"
;   -- which is the actual case.
;   atom e => LENGTH STRINGIMAGE e
;   #e > 3 => 2+fortSize MAPCAR(function fortExpSize, e)
;   #e < 3 => 2+fortSize MAPCAR(function fortExpSize, e)
;   [op,arg1,arg2] := e
;   op := STRINGIMAGE op
;   op = '"CMPLX" => 3+fortSize [fortExpSize arg1,fortExpSize arg2]
;   narys := ['"+",'"*"] -- those nary ops we changed to binary
;   op in narys =>
;     LISTP arg1 and not(op=STRINGIMAGE first arg1) =>
;       2+fortSize MAPCAR(function fortExpSize, e)
;     LISTP arg2 and not(op=STRINGIMAGE first arg2) =>
;       2+fortSize MAPCAR(function fortExpSize, e)
;     1+fortSize [fortExpSize arg1,fortExpSize arg2]
;   2+fortSize MAPCAR(function fortExpSize, e)
 
(DEFUN |fortExpSize| (|e|)
  (PROG (|op| |arg1| |arg2| |narys|)
    (RETURN
     (COND ((ATOM |e|) (LENGTH (STRINGIMAGE |e|)))
           ((< 3 (LENGTH |e|)) (+ 2 (|fortSize| (MAPCAR #'|fortExpSize| |e|))))
           ((< (LENGTH |e|) 3) (+ 2 (|fortSize| (MAPCAR #'|fortExpSize| |e|))))
           (#1='T
            (PROGN
             (SETQ |op| (CAR |e|))
             (SETQ |arg1| (CADR . #2=(|e|)))
             (SETQ |arg2| (CADDR . #2#))
             (SETQ |op| (STRINGIMAGE |op|))
             (COND
              ((EQUAL |op| "CMPLX")
               (+ 3
                  (|fortSize|
                   (LIST (|fortExpSize| |arg1|) (|fortExpSize| |arg2|)))))
              (#1#
               (PROGN
                (SETQ |narys| (LIST "+" "*"))
                (COND
                 ((|member| |op| |narys|)
                  (COND
                   ((AND (LISTP |arg1|)
                         (NULL (EQUAL |op| (STRINGIMAGE (CAR |arg1|)))))
                    (+ 2 (|fortSize| (MAPCAR #'|fortExpSize| |e|))))
                   ((AND (LISTP |arg2|)
                         (NULL (EQUAL |op| (STRINGIMAGE (CAR |arg2|)))))
                    (+ 2 (|fortSize| (MAPCAR #'|fortExpSize| |e|))))
                   (#1#
                    (+ 1
                       (|fortSize|
                        (LIST (|fortExpSize| |arg1|)
                              (|fortExpSize| |arg2|)))))))
                 (#1# (+ 2 (|fortSize| (MAPCAR #'|fortExpSize| |e|))))))))))))))
 
; fortSize e ==
;   +/[elen u for u in e] where
;     elen z ==
;       atom z => z
;       first z
 
(DEFUN |fortSize| (|e|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#32| |bfVar#31| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#31|) (PROGN (SETQ |u| (CAR |bfVar#31|)) NIL))
           (RETURN |bfVar#32|))
          ('T (SETQ |bfVar#32| (+ |bfVar#32| (|fortSize,elen| |u|)))))
         (SETQ |bfVar#31| (CDR |bfVar#31|))))
      0 |e| NIL))))
(DEFUN |fortSize,elen| (|z|)
  (PROG () (RETURN (COND ((ATOM |z|) |z|) ('T (CAR |z|))))))
 
; tempLen () == 1 + LENGTH STRINGIMAGE $exp2FortTempVarIndex
 
(DEFUN |tempLen| ()
  (PROG () (RETURN (+ 1 (LENGTH (STRINGIMAGE |$exp2FortTempVarIndex|))))))
 
; segment l ==
;   not $fortranSegment => l
;   s := nil
;   for e in l repeat
;     if LISTP(e) and first e in ["=",'"="] then
;       var := NTH(1,e)
;       exprs := segment1(THIRD e,
;                         $maximumFortranExpressionLength-1-fortExpSize var)
;       s:= [:[['"=",var,car exprs],:cdr exprs],:s]
;     else if LISTP(e) and first e in ['"RETURN"] then
;       exprs := segment1(SECOND e,
;                         $maximumFortranExpressionLength-2-fortExpSize first e)
;       s := [:[[first e,car exprs],:cdr exprs],:s]
;     else s:= [e,:s]
;   reverse s
 
(DEFUN |segment| (|l|)
  (PROG (|s| |var| |exprs|)
    (RETURN
     (COND ((NULL |$fortranSegment|) |l|)
           (#1='T
            (PROGN
             (SETQ |s| NIL)
             ((LAMBDA (|bfVar#33| |e|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#33|)
                       (PROGN (SETQ |e| (CAR |bfVar#33|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((AND (LISTP |e|) (|member| (CAR |e|) (LIST '= "=")))
                     (SETQ |var| (NTH 1 |e|))
                     (SETQ |exprs|
                             (|segment1| (THIRD |e|)
                              (- (- |$maximumFortranExpressionLength| 1)
                                 (|fortExpSize| |var|))))
                     (SETQ |s|
                             (APPEND
                              (CONS (LIST "=" |var| (CAR |exprs|))
                                    (CDR |exprs|))
                              |s|)))
                    ((AND (LISTP |e|) (|member| (CAR |e|) (LIST "RETURN")))
                     (SETQ |exprs|
                             (|segment1| (SECOND |e|)
                              (- (- |$maximumFortranExpressionLength| 2)
                                 (|fortExpSize| (CAR |e|)))))
                     (SETQ |s|
                             (APPEND
                              (CONS (LIST (CAR |e|) (CAR |exprs|))
                                    (CDR |exprs|))
                              |s|)))
                    (#1# (SETQ |s| (CONS |e| |s|))))))
                 (SETQ |bfVar#33| (CDR |bfVar#33|))))
              |l| NIL)
             (REVERSE |s|)))))))
 
; segment1(e,maxSize) ==
;   (size := fortExpSize e) < maxSize => [e]
;   expressions := nil;
;   newE := [first e]
;   -- Assume we have to replace each argument with a temporary variable, and
;   -- that the temporary variable may be larger than we expect.
;   safeSize := maxSize -  (#e-1)*(tempLen()+1) - fortExpSize newE
;   for i in 2..#e repeat
;     subSize := fortExpSize NTH(i-1,e)
;     -- We could have a check here for symbols which are simply too big
;     -- for Fortran (i.e. more than the maximum practical expression length)
;     subSize <= safeSize =>
;       safeSize := safeSize - subSize
;       newE := [:newE,NTH(i-1,e)]
;     -- this ones too big.
;     exprs := segment2(NTH(i-1,e),safeSize)
;     expressions := [:(cdr exprs),:expressions]
;     newE := [:newE,(car exprs)]
;     safeSize := safeSize - fortExpSize car exprs
;   [newE,:expressions]
 
(DEFUN |segment1| (|e| |maxSize|)
  (PROG (SIZE |expressions| |newE| |safeSize| |subSize| |exprs|)
    (RETURN
     (COND ((< (SETQ SIZE (|fortExpSize| |e|)) |maxSize|) (LIST |e|))
           (#1='T
            (PROGN
             (SETQ |expressions| NIL)
             (SETQ |newE| (LIST (CAR |e|)))
             (SETQ |safeSize|
                     (- (- |maxSize| (* (- (LENGTH |e|) 1) (+ (|tempLen|) 1)))
                        (|fortExpSize| |newE|)))
             ((LAMBDA (|bfVar#34| |i|)
                (LOOP
                 (COND ((> |i| |bfVar#34|) (RETURN NIL))
                       (#1#
                        (PROGN
                         (SETQ |subSize| (|fortExpSize| (NTH (- |i| 1) |e|)))
                         (COND
                          ((NOT (< |safeSize| |subSize|))
                           (PROGN
                            (SETQ |safeSize| (- |safeSize| |subSize|))
                            (SETQ |newE|
                                    (APPEND |newE|
                                            (CONS (NTH (- |i| 1) |e|) NIL)))))
                          (#1#
                           (PROGN
                            (SETQ |exprs|
                                    (|segment2| (NTH (- |i| 1) |e|)
                                     |safeSize|))
                            (SETQ |expressions|
                                    (APPEND (CDR |exprs|) |expressions|))
                            (SETQ |newE|
                                    (APPEND |newE| (CONS (CAR |exprs|) NIL)))
                            (SETQ |safeSize|
                                    (- |safeSize|
                                       (|fortExpSize| (CAR |exprs|))))))))))
                 (SETQ |i| (+ |i| 1))))
              (LENGTH |e|) 2)
             (CONS |newE| |expressions|)))))))
 
; segment2(e,topSize) ==
;   maxSize := $maximumFortranExpressionLength -tempLen()-1
;   atom(e) => [e]
;   exprs := nil
;   newE  := [first e]
;   topSize := topSize - fortExpSize newE
;   for i in 2..#e repeat
;     subE := NTH(i-1,e)
;     (subSize := fortExpSize subE) > maxSize =>
;       subE := segment2(subE,maxSize)
;       exprs := [:(cdr subE),:exprs]
;       if (subSize := fortExpSize first subE) <= topSize then
;         newE := [:newE,first subE]
;         topSize := topSize - subSize
;       else
;         newVar := newFortranTempVar()
;         newE := [:newE,newVar]
;         exprs:=[['"=",newVar,first subE],:exprs]
;         topSize := topSize - fortExpSize newVar
;     newE := [:newE,subE]
;     topSize := topSize - subSize
;   topSize > 0 => [newE,:exprs]
;   newVar := newFortranTempVar()
;   [newVar,['"=",newVar,newE],:exprs]
 
(DEFUN |segment2| (|e| |topSize|)
  (PROG (|maxSize| |exprs| |newE| |subE| |subSize| |newVar|)
    (RETURN
     (PROGN
      (SETQ |maxSize| (- (- |$maximumFortranExpressionLength| (|tempLen|)) 1))
      (COND ((ATOM |e|) (LIST |e|))
            (#1='T
             (PROGN
              (SETQ |exprs| NIL)
              (SETQ |newE| (LIST (CAR |e|)))
              (SETQ |topSize| (- |topSize| (|fortExpSize| |newE|)))
              ((LAMBDA (|bfVar#35| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#35|) (RETURN NIL))
                        (#1#
                         (PROGN
                          (SETQ |subE| (NTH (- |i| 1) |e|))
                          (COND
                           ((< |maxSize|
                               (SETQ |subSize| (|fortExpSize| |subE|)))
                            (PROGN
                             (SETQ |subE| (|segment2| |subE| |maxSize|))
                             (SETQ |exprs| (APPEND (CDR |subE|) |exprs|))
                             (COND
                              ((NOT
                                (< |topSize|
                                   (SETQ |subSize|
                                           (|fortExpSize| (CAR |subE|)))))
                               (SETQ |newE|
                                       (APPEND |newE| (CONS (CAR |subE|) NIL)))
                               (SETQ |topSize| (- |topSize| |subSize|)))
                              (#1# (SETQ |newVar| (|newFortranTempVar|))
                               (SETQ |newE|
                                       (APPEND |newE| (CONS |newVar| NIL)))
                               (SETQ |exprs|
                                       (CONS (LIST "=" |newVar| (CAR |subE|))
                                             |exprs|))
                               (SETQ |topSize|
                                       (- |topSize|
                                          (|fortExpSize| |newVar|)))))))
                           (#1#
                            (PROGN
                             (SETQ |newE| (APPEND |newE| (CONS |subE| NIL)))
                             (SETQ |topSize| (- |topSize| |subSize|))))))))
                  (SETQ |i| (+ |i| 1))))
               (LENGTH |e|) 2)
              (COND ((< 0 |topSize|) (CONS |newE| |exprs|))
                    (#1#
                     (PROGN
                      (SETQ |newVar| (|newFortranTempVar|))
                      (CONS |newVar|
                            (CONS (LIST "=" |newVar| |newE|) |exprs|))))))))))))
