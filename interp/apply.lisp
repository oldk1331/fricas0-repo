 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; oldCompilerAutoloadOnceTrigger() == nil
 
(DEFUN |oldCompilerAutoloadOnceTrigger| () (PROG () (RETURN NIL)))
 
; compAtomWithModemap(x,m,e,v) ==
;   Tl :=
;     [[transImplementation(x, map), target, e]
;       for map in v | map is [[.,target],[.,fn]]] =>
;                                          --accept only monadic operators
;         T:= or/[t for (t:= [.,target,.]) in Tl | modeEqual(m,target)] => T
;         1=#(Tl:= [y for t in Tl | (y:= convert(t,m))]) => first Tl
;         0<#Tl and m=$NoValueMode => first Tl
;         nil
 
(DEFUN |compAtomWithModemap| (|x| |m| |e| |v|)
  (PROG (|ISTMP#1| |ISTMP#2| |target| |ISTMP#3| |ISTMP#4| |ISTMP#5| |fn| |Tl|
         T$ |y|)
    (RETURN
     (COND
      ((SETQ |Tl|
               ((LAMBDA (|bfVar#2| |bfVar#1| |map|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#1|)
                         (PROGN (SETQ |map| (CAR |bfVar#1|)) NIL))
                     (RETURN (NREVERSE |bfVar#2|)))
                    (#1='T
                     (AND (CONSP |map|)
                          (PROGN
                           (SETQ |ISTMP#1| (CAR |map|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |target| (CAR |ISTMP#2|))
                                       #1#)))))
                          (PROGN
                           (SETQ |ISTMP#3| (CDR |map|))
                           (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                (PROGN
                                 (SETQ |ISTMP#4| (CAR |ISTMP#3|))
                                 (AND (CONSP |ISTMP#4|)
                                      (PROGN
                                       (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                       (AND (CONSP |ISTMP#5|)
                                            (EQ (CDR |ISTMP#5|) NIL)
                                            (PROGN
                                             (SETQ |fn| (CAR |ISTMP#5|))
                                             #1#)))))))
                          (SETQ |bfVar#2|
                                  (CONS
                                   (LIST (|transImplementation| |x| |map|)
                                         |target| |e|)
                                   |bfVar#2|)))))
                   (SETQ |bfVar#1| (CDR |bfVar#1|))))
                NIL |v| NIL))
       (IDENTITY
        (COND
         ((SETQ T$
                  ((LAMBDA (|bfVar#4| |bfVar#3| |t|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#3|)
                            (PROGN (SETQ |t| (CAR |bfVar#3|)) NIL))
                        (RETURN |bfVar#4|))
                       (#1#
                        (AND (CONSP |t|)
                             (PROGN
                              (SETQ |ISTMP#1| (CDR |t|))
                              (AND (CONSP |ISTMP#1|)
                                   (PROGN
                                    (SETQ |target| (CAR |ISTMP#1|))
                                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                    (AND (CONSP |ISTMP#2|)
                                         (EQ (CDR |ISTMP#2|) NIL)))))
                             (|modeEqual| |m| |target|)
                             (PROGN
                              (SETQ |bfVar#4| |t|)
                              (COND (|bfVar#4| (RETURN |bfVar#4|)))))))
                      (SETQ |bfVar#3| (CDR |bfVar#3|))))
                   NIL |Tl| NIL))
          T$)
         ((EQL 1
               (LENGTH
                (SETQ |Tl|
                        ((LAMBDA (|bfVar#6| |bfVar#5| |t|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#5|)
                                  (PROGN (SETQ |t| (CAR |bfVar#5|)) NIL))
                              (RETURN (NREVERSE |bfVar#6|)))
                             (#1#
                              (AND (SETQ |y| (|convert| |t| |m|))
                                   (SETQ |bfVar#6| (CONS |y| |bfVar#6|)))))
                            (SETQ |bfVar#5| (CDR |bfVar#5|))))
                         NIL |Tl| NIL))))
          (CAR |Tl|))
         ((AND (< 0 (LENGTH |Tl|)) (EQUAL |m| |$NoValueMode|)) (CAR |Tl|))
         (#1# NIL))))))))
 
; transImplementation(op, map) ==
; --+
;   fn := genDeltaEntry [op,:map]
;   fn is ["XLAM",:.] => [fn]
;   ["call",fn]
 
(DEFUN |transImplementation| (|op| |map|)
  (PROG (|fn|)
    (RETURN
     (PROGN
      (SETQ |fn| (|genDeltaEntry| (CONS |op| |map|)))
      (COND ((AND (CONSP |fn|) (EQ (CAR |fn|) 'XLAM)) (LIST |fn|))
            ('T (LIST '|call| |fn|)))))))
 
; compToApply(op,argl,m,e) ==
;   T:= compNoStacking(op,$EmptyMode,e) or return nil
;   m1:= T.mode
;   T.expr is ["QUOTE", =m1] => nil
;   compApplication(op,argl,m,T.env,T)
 
(DEFUN |compToApply| (|op| |argl| |m| |e|)
  (PROG (T$ |m1| |ISTMP#1| |ISTMP#2|)
    (RETURN
     (PROGN
      (SETQ T$ (OR (|compNoStacking| |op| |$EmptyMode| |e|) (RETURN NIL)))
      (SETQ |m1| (CADR T$))
      (COND
       ((PROGN
         (SETQ |ISTMP#1| (CAR T$))
         (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'QUOTE)
              (PROGN
               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                    (EQUAL (CAR |ISTMP#2|) |m1|)))))
        NIL)
       ('T (|compApplication| |op| |argl| |m| (CADDR T$) T$)))))))
 
; compApplication(op,argl,m,e,T) ==
;   T.mode is ['Mapping, retm, :argml] =>
;     #argl ~= #argml => nil
;     retm := resolve(m, retm)
;     retm = $Category or isCategoryForm(retm,e) => nil  -- not handled
;     argTl := [[.,.,e] := comp(x,m,e) or return "failed"
;               for x in argl for m in argml]
;     argTl = "failed" => nil
;     form:=
;       not (member(op,$formalArgList) or member(T.expr,$formalArgList)) and ATOM T.expr =>
;         nprefix := $prefix or
;         -- following needed for referencing local funs at capsule level
;            getAbbreviation($op,#rest $form)
;         [op',:[a.expr for a in argTl],"$"] where
;           op':= INTERN STRCONC(encodeItem nprefix,";",encodeItem T.expr)
;       ['call, ['applyFun, T.expr], :[a.expr for a in argTl]]
;     coerce([form, retm, e],resolve(retm,m))
;   op = 'elt => nil
;   eltForm := ['elt, op, :argl]
;   comp(eltForm, m, e)
 
(DEFUN |compApplication| (|op| |argl| |m| |e| T$)
  (PROG (|ISTMP#1| |ISTMP#2| |retm| |argml| |LETTMP#1| |argTl| |nprefix| |op'|
         |form| |eltForm|)
    (RETURN
     (COND
      ((PROGN
        (SETQ |ISTMP#1| (CADR T$))
        (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|Mapping|)
             (PROGN
              (SETQ |ISTMP#2| (CDR |ISTMP#1|))
              (AND (CONSP |ISTMP#2|)
                   (PROGN
                    (SETQ |retm| (CAR |ISTMP#2|))
                    (SETQ |argml| (CDR |ISTMP#2|))
                    #1='T)))))
       (COND ((NOT (EQL (LENGTH |argl|) (LENGTH |argml|))) NIL)
             (#1#
              (PROGN
               (SETQ |retm| (|resolve| |m| |retm|))
               (COND
                ((OR (EQUAL |retm| |$Category|) (|isCategoryForm| |retm| |e|))
                 NIL)
                (#1#
                 (PROGN
                  (SETQ |argTl|
                          ((LAMBDA (|bfVar#9| |bfVar#7| |x| |bfVar#8| |m|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#7|)
                                    (PROGN (SETQ |x| (CAR |bfVar#7|)) NIL)
                                    (ATOM |bfVar#8|)
                                    (PROGN (SETQ |m| (CAR |bfVar#8|)) NIL))
                                (RETURN (NREVERSE |bfVar#9|)))
                               (#1#
                                (SETQ |bfVar#9|
                                        (CONS
                                         (PROGN
                                          (SETQ |LETTMP#1|
                                                  (OR (|comp| |x| |m| |e|)
                                                      (RETURN '|failed|)))
                                          (SETQ |e| (CADDR |LETTMP#1|))
                                          |LETTMP#1|)
                                         |bfVar#9|))))
                              (SETQ |bfVar#7| (CDR |bfVar#7|))
                              (SETQ |bfVar#8| (CDR |bfVar#8|))))
                           NIL |argl| NIL |argml| NIL))
                  (COND ((EQ |argTl| '|failed|) NIL)
                        (#1#
                         (PROGN
                          (SETQ |form|
                                  (COND
                                   ((AND
                                     (NULL
                                      (OR (|member| |op| |$formalArgList|)
                                          (|member| (CAR T$)
                                           |$formalArgList|)))
                                     (ATOM (CAR T$)))
                                    (PROGN
                                     (SETQ |nprefix|
                                             (OR |$prefix|
                                                 (|getAbbreviation| |$op|
                                                  (LENGTH (CDR |$form|)))))
                                     (SETQ |op'|
                                             (INTERN
                                              (STRCONC (|encodeItem| |nprefix|)
                                               '|;| (|encodeItem| (CAR T$)))))
                                     (CONS |op'|
                                           (APPEND
                                            ((LAMBDA
                                                 (|bfVar#11| |bfVar#10| |a|)
                                               (LOOP
                                                (COND
                                                 ((OR (ATOM |bfVar#10|)
                                                      (PROGN
                                                       (SETQ |a|
                                                               (CAR
                                                                |bfVar#10|))
                                                       NIL))
                                                  (RETURN
                                                   (NREVERSE |bfVar#11|)))
                                                 (#1#
                                                  (SETQ |bfVar#11|
                                                          (CONS (CAR |a|)
                                                                |bfVar#11|))))
                                                (SETQ |bfVar#10|
                                                        (CDR |bfVar#10|))))
                                             NIL |argTl| NIL)
                                            (CONS '$ NIL)))))
                                   (#1#
                                    (CONS '|call|
                                          (CONS (LIST '|applyFun| (CAR T$))
                                                ((LAMBDA
                                                     (|bfVar#13| |bfVar#12|
                                                      |a|)
                                                   (LOOP
                                                    (COND
                                                     ((OR (ATOM |bfVar#12|)
                                                          (PROGN
                                                           (SETQ |a|
                                                                   (CAR
                                                                    |bfVar#12|))
                                                           NIL))
                                                      (RETURN
                                                       (NREVERSE |bfVar#13|)))
                                                     (#1#
                                                      (SETQ |bfVar#13|
                                                              (CONS (CAR |a|)
                                                                    |bfVar#13|))))
                                                    (SETQ |bfVar#12|
                                                            (CDR |bfVar#12|))))
                                                 NIL |argTl| NIL))))))
                          (|coerce| (LIST |form| |retm| |e|)
                           (|resolve| |retm| |m|))))))))))))
      ((EQ |op| '|elt|) NIL)
      (#1#
       (PROGN
        (SETQ |eltForm| (CONS '|elt| (CONS |op| |argl|)))
        (|comp| |eltForm| |m| |e|)))))))
 
; compFormWithModemap(form is [op,:argl],m,e,modemap) ==
;   [map:= [.,target,:.],[pred,impl]]:= modemap
;   -- this fails if the subsuming modemap is conditional
;   --impl is ['Subsumed,:.] => nil
;   if isCategoryForm(target,e) and isFunctor op then
;     [modemap,e]:= substituteIntoFunctorModemap(argl,modemap,e) or return nil
;     [map:= [.,target,:.],:cexpr]:= modemap
;   sv:=listOfSharpVars map
;   if sv then
;      -- SAY [ "compiling ", op, " in compFormWithModemap,
;      -- mode= ",map," sharp vars=",sv]
;     for x in argl for ss in $FormalMapVariableList repeat
;       if ss in sv then
;         [map:= [.,target,:.],:cexpr]:= modemap :=SUBST(x,ss,modemap)
;         -- SAY ["new map is",map]
;   not (target':= coerceable(target,m,e)) => nil
;   map:= [target',:rest map]
;   [f,Tl,sl]:= compApplyModemap(form,modemap,e,nil) or return nil
; 
;   --generate code; return
;   T:=
;     [x',m',e'] where
;       m':= SUBLIS(sl,map.(1))
;       x':=
;         form':= [f,:[t.expr for t in Tl]]
;         (m'=$Category or isCategoryForm(m',e)) and ATOM(f) => form'
;         -- try to deal with new-style Unions where we know the conditions
;         op = "elt" and f is ['XLAM,:.] and IDENTP(z:=CAR argl) and
;           (c:=get(z,'condition,e)) and
;             c is [["case", =z, c1]] and
;               (c1 is ['_:,=(CADR argl),=m] or EQ(c1,CADR argl) ) =>
; -- first is a full tag, as placed by getInverseEnvironment
; -- second is what getSuccessEnvironment will place there
;                 ["CDR",z]
;         ["call",:form']
;       e':=
;         Tl => (last Tl).env
;         e
;   convert(T,m)
 
(DEFUN |compFormWithModemap| (|form| |m| |e| |modemap|)
  (PROG (|op| |argl| |map| |target| |pred| |impl| |LETTMP#1| |cexpr| |sv|
         |target'| |f| |Tl| |sl| |m'| |form'| |z| |c| |ISTMP#1| |ISTMP#2|
         |ISTMP#3| |c1| |x'| |e'| T$)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (SETQ |map| (CAR . #1=(|modemap|)))
      (SETQ |target| (CADAR . #1#))
      (SETQ |pred| (CAADR . #2=(|modemap|)))
      (SETQ |impl| (CADADR . #2#))
      (COND
       ((AND (|isCategoryForm| |target| |e|) (|isFunctor| |op|))
        (SETQ |LETTMP#1|
                (OR (|substituteIntoFunctorModemap| |argl| |modemap| |e|)
                    (RETURN NIL)))
        (SETQ |modemap| (CAR |LETTMP#1|)) (SETQ |e| (CADR |LETTMP#1|))
        (SETQ |map| (CAR . #3=(|modemap|))) (SETQ |target| (CADAR . #3#))
        (SETQ |cexpr| (CDR |modemap|)) |modemap|))
      (SETQ |sv| (|listOfSharpVars| |map|))
      (COND
       (|sv|
        ((LAMBDA (|bfVar#14| |x| |bfVar#15| |ss|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#14|) (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL)
                  (ATOM |bfVar#15|) (PROGN (SETQ |ss| (CAR |bfVar#15|)) NIL))
              (RETURN NIL))
             (#4='T
              (COND
               ((|member| |ss| |sv|)
                (SETQ |modemap| (SUBST |x| |ss| |modemap|))
                (SETQ |map| (CAR . #5=(|modemap|)))
                (SETQ |target| (CADAR . #5#)) (SETQ |cexpr| (CDR |modemap|))
                |modemap|))))
            (SETQ |bfVar#14| (CDR |bfVar#14|))
            (SETQ |bfVar#15| (CDR |bfVar#15|))))
         |argl| NIL |$FormalMapVariableList| NIL)))
      (COND ((NULL (SETQ |target'| (|coerceable| |target| |m| |e|))) NIL)
            (#4#
             (PROGN
              (SETQ |map| (CONS |target'| (CDR |map|)))
              (SETQ |LETTMP#1|
                      (OR (|compApplyModemap| |form| |modemap| |e| NIL)
                          (RETURN NIL)))
              (SETQ |f| (CAR |LETTMP#1|))
              (SETQ |Tl| (CADR . #6=(|LETTMP#1|)))
              (SETQ |sl| (CADDR . #6#))
              (SETQ |m'| (SUBLIS |sl| (ELT |map| 1)))
              (SETQ |x'|
                      (PROGN
                       (SETQ |form'|
                               (CONS |f|
                                     ((LAMBDA (|bfVar#17| |bfVar#16| |t|)
                                        (LOOP
                                         (COND
                                          ((OR (ATOM |bfVar#16|)
                                               (PROGN
                                                (SETQ |t| (CAR |bfVar#16|))
                                                NIL))
                                           (RETURN (NREVERSE |bfVar#17|)))
                                          (#4#
                                           (SETQ |bfVar#17|
                                                   (CONS (CAR |t|)
                                                         |bfVar#17|))))
                                         (SETQ |bfVar#16| (CDR |bfVar#16|))))
                                      NIL |Tl| NIL)))
                       (COND
                        ((AND
                          (OR (EQUAL |m'| |$Category|)
                              (|isCategoryForm| |m'| |e|))
                          (ATOM |f|))
                         |form'|)
                        ((AND (EQ |op| '|elt|) (CONSP |f|) (EQ (CAR |f|) 'XLAM)
                              (IDENTP (SETQ |z| (CAR |argl|)))
                              (SETQ |c| (|get| |z| '|condition| |e|))
                              (CONSP |c|) (EQ (CDR |c|) NIL)
                              (PROGN
                               (SETQ |ISTMP#1| (CAR |c|))
                               (AND (CONSP |ISTMP#1|)
                                    (EQ (CAR |ISTMP#1|) '|case|)
                                    (PROGN
                                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                     (AND (CONSP |ISTMP#2|)
                                          (EQUAL (CAR |ISTMP#2|) |z|)
                                          (PROGN
                                           (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                           (AND (CONSP |ISTMP#3|)
                                                (EQ (CDR |ISTMP#3|) NIL)
                                                (PROGN
                                                 (SETQ |c1| (CAR |ISTMP#3|))
                                                 #4#)))))))
                              (OR
                               (AND (CONSP |c1|) (EQ (CAR |c1|) '|:|)
                                    (PROGN
                                     (SETQ |ISTMP#1| (CDR |c1|))
                                     (AND (CONSP |ISTMP#1|)
                                          (EQUAL (CAR |ISTMP#1|) (CADR |argl|))
                                          (PROGN
                                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                           (AND (CONSP |ISTMP#2|)
                                                (EQ (CDR |ISTMP#2|) NIL)
                                                (EQUAL (CAR |ISTMP#2|)
                                                       |m|))))))
                               (EQ |c1| (CADR |argl|))))
                         (LIST 'CDR |z|))
                        (#4# (CONS '|call| |form'|)))))
              (SETQ |e'| (COND (|Tl| (CADDR (|last| |Tl|))) (#4# |e|)))
              (SETQ T$ (LIST |x'| |m'| |e'|))
              (|convert| T$ |m|))))))))
 
; applyMapping([op,:argl],m,e,ml) ==
;   #argl~=#ml-1 => nil
;   isCategoryForm(first ml,e) =>
;                                 --is op a functor?
;     pairlis:= [[v,:a] for a in argl for v in $FormalMapVariableList]
;     ml' := SUBLIS(pairlis, ml)
;     argl':=
;       [T.expr for x in argl for m' in rest ml'] where
;         T() == [.,.,e]:= comp(x,m',e) or return "failed"
;     if argl'="failed" then return nil
;     form:= [op,:argl']
;     convert([form,first ml',e],m)
;   argl':=
;     [T.expr for x in argl for m' in rest ml] where
;       T() == [.,.,e]:= comp(x,m',e) or return "failed"
;   if argl'="failed" then return nil
;   form:=
;     not member(op,$formalArgList) and ATOM op and not get(op,'value,e) =>
;       nprefix := $prefix or
;    -- following needed for referencing local funs at capsule level
;         getAbbreviation($op,#rest $form)
;       [op',:argl',"$"] where
;         op':= INTERN STRCONC(encodeItem nprefix,";",encodeItem op)
;     ['call,['applyFun,op],:argl']
;   pairlis:= [[v,:a] for a in argl' for v in $FormalMapVariableList]
;   convert([form,SUBLIS(pairlis,first ml),e],m)
 
(DEFUN |applyMapping| (|bfVar#30| |m| |e| |ml|)
  (PROG (|op| |argl| |pairlis| |ml'| |LETTMP#1| |argl'| |form| |nprefix| |op'|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#30|))
      (SETQ |argl| (CDR |bfVar#30|))
      (COND ((NOT (EQL (LENGTH |argl|) (- (LENGTH |ml|) 1))) NIL)
            ((|isCategoryForm| (CAR |ml|) |e|)
             (PROGN
              (SETQ |pairlis|
                      ((LAMBDA (|bfVar#20| |bfVar#18| |a| |bfVar#19| |v|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#18|)
                                (PROGN (SETQ |a| (CAR |bfVar#18|)) NIL)
                                (ATOM |bfVar#19|)
                                (PROGN (SETQ |v| (CAR |bfVar#19|)) NIL))
                            (RETURN (NREVERSE |bfVar#20|)))
                           (#1='T
                            (SETQ |bfVar#20|
                                    (CONS (CONS |v| |a|) |bfVar#20|))))
                          (SETQ |bfVar#18| (CDR |bfVar#18|))
                          (SETQ |bfVar#19| (CDR |bfVar#19|))))
                       NIL |argl| NIL |$FormalMapVariableList| NIL))
              (SETQ |ml'| (SUBLIS |pairlis| |ml|))
              (SETQ |argl'|
                      ((LAMBDA (|bfVar#23| |bfVar#21| |x| |bfVar#22| |m'|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#21|)
                                (PROGN (SETQ |x| (CAR |bfVar#21|)) NIL)
                                (ATOM |bfVar#22|)
                                (PROGN (SETQ |m'| (CAR |bfVar#22|)) NIL))
                            (RETURN (NREVERSE |bfVar#23|)))
                           (#1#
                            (SETQ |bfVar#23|
                                    (CONS
                                     (CAR
                                      (PROGN
                                       (SETQ |LETTMP#1|
                                               (OR (|comp| |x| |m'| |e|)
                                                   (RETURN '|failed|)))
                                       (SETQ |e| (CADDR |LETTMP#1|))
                                       |LETTMP#1|))
                                     |bfVar#23|))))
                          (SETQ |bfVar#21| (CDR |bfVar#21|))
                          (SETQ |bfVar#22| (CDR |bfVar#22|))))
                       NIL |argl| NIL (CDR |ml'|) NIL))
              (COND ((EQ |argl'| '|failed|) (RETURN NIL)))
              (SETQ |form| (CONS |op| |argl'|))
              (|convert| (LIST |form| (CAR |ml'|) |e|) |m|)))
            (#1#
             (PROGN
              (SETQ |argl'|
                      ((LAMBDA (|bfVar#26| |bfVar#24| |x| |bfVar#25| |m'|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#24|)
                                (PROGN (SETQ |x| (CAR |bfVar#24|)) NIL)
                                (ATOM |bfVar#25|)
                                (PROGN (SETQ |m'| (CAR |bfVar#25|)) NIL))
                            (RETURN (NREVERSE |bfVar#26|)))
                           (#1#
                            (SETQ |bfVar#26|
                                    (CONS
                                     (CAR
                                      (PROGN
                                       (SETQ |LETTMP#1|
                                               (OR (|comp| |x| |m'| |e|)
                                                   (RETURN '|failed|)))
                                       (SETQ |e| (CADDR |LETTMP#1|))
                                       |LETTMP#1|))
                                     |bfVar#26|))))
                          (SETQ |bfVar#24| (CDR |bfVar#24|))
                          (SETQ |bfVar#25| (CDR |bfVar#25|))))
                       NIL |argl| NIL (CDR |ml|) NIL))
              (COND ((EQ |argl'| '|failed|) (RETURN NIL)))
              (SETQ |form|
                      (COND
                       ((AND (NULL (|member| |op| |$formalArgList|))
                             (ATOM |op|) (NULL (|get| |op| '|value| |e|)))
                        (PROGN
                         (SETQ |nprefix|
                                 (OR |$prefix|
                                     (|getAbbreviation| |$op|
                                      (LENGTH (CDR |$form|)))))
                         (SETQ |op'|
                                 (INTERN
                                  (STRCONC (|encodeItem| |nprefix|) '|;|
                                   (|encodeItem| |op|))))
                         (CONS |op'| (APPEND |argl'| (CONS '$ NIL)))))
                       (#1#
                        (CONS '|call|
                              (CONS (LIST '|applyFun| |op|) |argl'|)))))
              (SETQ |pairlis|
                      ((LAMBDA (|bfVar#29| |bfVar#27| |a| |bfVar#28| |v|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#27|)
                                (PROGN (SETQ |a| (CAR |bfVar#27|)) NIL)
                                (ATOM |bfVar#28|)
                                (PROGN (SETQ |v| (CAR |bfVar#28|)) NIL))
                            (RETURN (NREVERSE |bfVar#29|)))
                           (#1#
                            (SETQ |bfVar#29|
                                    (CONS (CONS |v| |a|) |bfVar#29|))))
                          (SETQ |bfVar#27| (CDR |bfVar#27|))
                          (SETQ |bfVar#28| (CDR |bfVar#28|))))
                       NIL |argl'| NIL |$FormalMapVariableList| NIL))
              (|convert| (LIST |form| (SUBLIS |pairlis| (CAR |ml|)) |e|)
               |m|))))))))
 
; compApplyModemap(form,modemap,$e,sl) ==
;   $generatingCall : local := true
;   [op,:argl] := form                   --form to be compiled
;   [[mc,mr,:margl],:fnsel] := modemap   --modemap we are testing
; 
;   -- $e     is the current environment
;   -- sl     substitution list, nil means bottom-up, otherwise top-down
; 
;   -- 0.  fail immediately if #argl=#margl
; 
;   if #argl~=#margl then return nil
; 
;   -- 1.  use modemap to evaluate arguments, returning failed if
;   --     not possible
; 
;   lt:=
;     [[.,m',$e]:=
;       comp(y,g,$e) or return "failed" where
;         g:= SUBLIS(sl,m) where
;             sl:= pmatchWithSl(m',m,sl) for y in argl for m in margl]
;   lt="failed" => return nil
; 
;   -- 2.  coerce each argument to final domain, returning failed
;   --     if not possible
; 
;   lt':= [coerce(y,d) or return "failed"
;          for y in lt for d in SUBLIS(sl,margl)]
;   lt'="failed" => return nil
; 
;   -- 3.  obtain domain-specific function, if possible, and return
; 
;   --$bindings is bound by compMapCond
;   [f,$bindings]:= compMapCond(op,mc,sl,fnsel) or return nil
; 
; --+ can no longer trust what the modemap says for a reference into
; --+ an exterior domain (it is calculating the displacement based on view
; --+ information which is no longer valid; thus ignore this index and
; --+ store the signature instead.
; 
; --$NRTflag=true and f is [op1,d,.] and NE(d,'$) and member(op1,'(ELT CONST)) =>
;   f is [op1,d,.] and member(op1,'(ELT CONST Subsumed)) =>
;     [genDeltaEntry [op,:modemap],lt',$bindings]
;   [f,lt',$bindings]
 
(DEFUN |compApplyModemap| (|form| |modemap| |$e| |sl|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|$generatingCall| |ISTMP#2| |d| |ISTMP#1| |op1| |f| |lt'| |lt| |m'|
         |LETTMP#1| |g| |fnsel| |margl| |mr| |mc| |argl| |op|)
    (DECLARE (SPECIAL |$generatingCall|))
    (RETURN
     (PROGN
      (SETQ |$generatingCall| T)
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (SETQ |mc| (CAAR . #1=(|modemap|)))
      (SETQ |mr| (CADAR . #1#))
      (SETQ |margl| (CDDAR . #1#))
      (SETQ |fnsel| (CDR |modemap|))
      (COND ((NOT (EQL (LENGTH |argl|) (LENGTH |margl|))) (RETURN NIL)))
      (SETQ |lt|
              ((LAMBDA (|bfVar#33| |bfVar#31| |y| |bfVar#32| |m|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#31|)
                        (PROGN (SETQ |y| (CAR |bfVar#31|)) NIL)
                        (ATOM |bfVar#32|)
                        (PROGN (SETQ |m| (CAR |bfVar#32|)) NIL))
                    (RETURN (NREVERSE |bfVar#33|)))
                   (#2='T
                    (SETQ |bfVar#33|
                            (CONS
                             (PROGN
                              (SETQ |sl| (|pmatchWithSl| |m'| |m| |sl|))
                              (SETQ |g| (SUBLIS |sl| |m|))
                              (SETQ |LETTMP#1|
                                      (OR (|comp| |y| |g| |$e|)
                                          (RETURN '|failed|)))
                              (SETQ |m'| (CADR |LETTMP#1|))
                              (SETQ |$e| (CADDR |LETTMP#1|))
                              |LETTMP#1|)
                             |bfVar#33|))))
                  (SETQ |bfVar#31| (CDR |bfVar#31|))
                  (SETQ |bfVar#32| (CDR |bfVar#32|))))
               NIL |argl| NIL |margl| NIL))
      (COND ((EQ |lt| '|failed|) (RETURN NIL))
            (#2#
             (PROGN
              (SETQ |lt'|
                      ((LAMBDA (|bfVar#36| |bfVar#34| |y| |bfVar#35| |d|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#34|)
                                (PROGN (SETQ |y| (CAR |bfVar#34|)) NIL)
                                (ATOM |bfVar#35|)
                                (PROGN (SETQ |d| (CAR |bfVar#35|)) NIL))
                            (RETURN (NREVERSE |bfVar#36|)))
                           (#2#
                            (SETQ |bfVar#36|
                                    (CONS
                                     (OR (|coerce| |y| |d|) (RETURN '|failed|))
                                     |bfVar#36|))))
                          (SETQ |bfVar#34| (CDR |bfVar#34|))
                          (SETQ |bfVar#35| (CDR |bfVar#35|))))
                       NIL |lt| NIL (SUBLIS |sl| |margl|) NIL))
              (COND ((EQ |lt'| '|failed|) (RETURN NIL))
                    (#2#
                     (PROGN
                      (SETQ |LETTMP#1|
                              (OR (|compMapCond| |op| |mc| |sl| |fnsel|)
                                  (RETURN NIL)))
                      (SETQ |f| (CAR |LETTMP#1|))
                      (SETQ |$bindings| (CADR |LETTMP#1|))
                      (COND
                       ((AND (CONSP |f|)
                             (PROGN
                              (SETQ |op1| (CAR |f|))
                              (SETQ |ISTMP#1| (CDR |f|))
                              (AND (CONSP |ISTMP#1|)
                                   (PROGN
                                    (SETQ |d| (CAR |ISTMP#1|))
                                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                    (AND (CONSP |ISTMP#2|)
                                         (EQ (CDR |ISTMP#2|) NIL)))))
                             (|member| |op1| '(ELT CONST |Subsumed|)))
                        (LIST (|genDeltaEntry| (CONS |op| |modemap|)) |lt'|
                              |$bindings|))
                       (#2# (LIST |f| |lt'| |$bindings|)))))))))))))
 
; compMapCond(op,mc,$bindings,fnsel) ==
;   or/[compMapCond'(u,op,mc,$bindings) for u in fnsel]
 
(DEFUN |compMapCond| (|op| |mc| |$bindings| |fnsel|)
  (DECLARE (SPECIAL |$bindings|))
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#38| |bfVar#37| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#37|) (PROGN (SETQ |u| (CAR |bfVar#37|)) NIL))
           (RETURN |bfVar#38|))
          ('T
           (PROGN
            (SETQ |bfVar#38| (|compMapCond'| |u| |op| |mc| |$bindings|))
            (COND (|bfVar#38| (RETURN |bfVar#38|))))))
         (SETQ |bfVar#37| (CDR |bfVar#37|))))
      NIL |fnsel| NIL))))
 
; compMapCond'([cexpr,fnexpr],op,dc,bindings) ==
;   compMapCond''(cexpr,dc) => compMapCondFun(fnexpr,op,dc,bindings)
;   stackMessage ["not known that",'%b,dc,'%d,"has",'%b,cexpr,'%d]
 
(DEFUN |compMapCond'| (|bfVar#39| |op| |dc| |bindings|)
  (PROG (|cexpr| |fnexpr|)
    (RETURN
     (PROGN
      (SETQ |cexpr| (CAR |bfVar#39|))
      (SETQ |fnexpr| (CADR |bfVar#39|))
      (COND
       ((|compMapCond''| |cexpr| |dc|)
        (|compMapCondFun| |fnexpr| |op| |dc| |bindings|))
       ('T
        (|stackMessage|
         (LIST '|not known that| '|%b| |dc| '|%d| '|has| '|%b| |cexpr|
               '|%d|))))))))
 
; compMapCond''(cexpr,dc) ==
;   cexpr=true => true
;   cexpr is ["AND", :l] or cexpr is ["and", :l] =>
;       and/[compMapCond''(u, dc) for u in l]
;   cexpr is ["OR", :l] or cexpr is ["or", :l] =>
;       or/[compMapCond''(u, dc) for u in l]
;   cexpr is ["not",u] => not compMapCond''(u,dc)
;   cexpr is ["has",name,cat] => (knownInfo cexpr => true; false)
;         --for the time being we'll stop here - shouldn't happen so far
;         --$disregardConditionIfTrue => true
;         --stackSemanticError(("not known that",'%b,name,
;         -- '%d,"has",'%b,cat,'%d),nil)
;   BREAK()
 
(DEFUN |compMapCond''| (|cexpr| |dc|)
  (PROG (|l| |ISTMP#1| |u| |name| |ISTMP#2| |cat|)
    (RETURN
     (COND ((EQUAL |cexpr| T) T)
           ((OR
             (AND (CONSP |cexpr|) (EQ (CAR |cexpr|) 'AND)
                  (PROGN (SETQ |l| (CDR |cexpr|)) #1='T))
             (AND (CONSP |cexpr|) (EQ (CAR |cexpr|) '|and|)
                  (PROGN (SETQ |l| (CDR |cexpr|)) #1#)))
            ((LAMBDA (|bfVar#41| |bfVar#40| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#40|)
                      (PROGN (SETQ |u| (CAR |bfVar#40|)) NIL))
                  (RETURN |bfVar#41|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#41| (|compMapCond''| |u| |dc|))
                   (COND ((NOT |bfVar#41|) (RETURN NIL))))))
                (SETQ |bfVar#40| (CDR |bfVar#40|))))
             T |l| NIL))
           ((OR
             (AND (CONSP |cexpr|) (EQ (CAR |cexpr|) 'OR)
                  (PROGN (SETQ |l| (CDR |cexpr|)) #1#))
             (AND (CONSP |cexpr|) (EQ (CAR |cexpr|) '|or|)
                  (PROGN (SETQ |l| (CDR |cexpr|)) #1#)))
            ((LAMBDA (|bfVar#43| |bfVar#42| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#42|)
                      (PROGN (SETQ |u| (CAR |bfVar#42|)) NIL))
                  (RETURN |bfVar#43|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#43| (|compMapCond''| |u| |dc|))
                   (COND (|bfVar#43| (RETURN |bfVar#43|))))))
                (SETQ |bfVar#42| (CDR |bfVar#42|))))
             NIL |l| NIL))
           ((AND (CONSP |cexpr|) (EQ (CAR |cexpr|) '|not|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |cexpr|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |u| (CAR |ISTMP#1|)) #1#))))
            (NULL (|compMapCond''| |u| |dc|)))
           ((AND (CONSP |cexpr|) (EQ (CAR |cexpr|) '|has|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |cexpr|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |name| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |cat| (CAR |ISTMP#2|)) #1#))))))
            (COND ((|knownInfo| |cexpr|) T) (#1# NIL)))
           (#1# (BREAK))))))
 
; compMapCondFun(fnexpr,op,dc,bindings) == [fnexpr,bindings]
 
(DEFUN |compMapCondFun| (|fnexpr| |op| |dc| |bindings|)
  (PROG () (RETURN (LIST |fnexpr| |bindings|))))
