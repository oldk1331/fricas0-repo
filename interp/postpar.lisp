 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; postTransform y ==
;   x:= y
;   u:= postTran x
;   if u is ["@Tuple", :l, [":", y, t]] and (and/[IDENTP x for x in l]) then
;       u := [":", ['LISTOF, :l, y], t]
;   postTransformCheck u
;   u
 
(DEFUN |postTransform| (|y|)
  (PROG (|x| |u| |ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |ISTMP#5| |t| |l|)
    (RETURN
     (PROGN
      (SETQ |x| |y|)
      (SETQ |u| (|postTran| |x|))
      (COND
       ((AND (CONSP |u|) (EQ (CAR |u|) '|@Tuple|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |u|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1='T)
                   (CONSP |ISTMP#2|)
                   (PROGN
                    (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                    (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '|:|)
                         (PROGN
                          (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                          (AND (CONSP |ISTMP#4|)
                               (PROGN
                                (SETQ |y| (CAR |ISTMP#4|))
                                (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                (AND (CONSP |ISTMP#5|) (EQ (CDR |ISTMP#5|) NIL)
                                     (PROGN
                                      (SETQ |t| (CAR |ISTMP#5|))
                                      #1#)))))))
                   (PROGN (SETQ |l| (CDR |ISTMP#2|)) #1#)
                   (PROGN (SETQ |l| (NREVERSE |l|)) #1#)))
             ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#1|) (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                   (RETURN |bfVar#2|))
                  (#1#
                   (PROGN
                    (SETQ |bfVar#2| (IDENTP |x|))
                    (COND ((NOT |bfVar#2|) (RETURN NIL))))))
                 (SETQ |bfVar#1| (CDR |bfVar#1|))))
              T |l| NIL))
        (SETQ |u| (LIST '|:| (CONS 'LISTOF (APPEND |l| (CONS |y| NIL))) |t|))))
      (|postTransformCheck| |u|)
      |u|))))
 
; displayPreCompilationErrors() ==
;   n:= #($postStack:= REMDUP NREVERSE $postStack)
;   n=0 => nil
;   errors:=
;     1<n => '"errors"
;     '"error"
;   if $InteractiveMode
;     then sayBrightly ['"   Semantic ",errors,'" detected: "]
;     else
;       heading:=
;         $topOp ~= '$topOp => ['"   ",$topOp,'" has"]
;         ['"   You have"]
;       sayBrightly [:heading,'%b,n,'%d,'"precompilation ",errors,'":"]
;   if 1<n then
;     (for x in $postStack for i in 1.. repeat sayMath ['"   ",i,'"_) ",:x])
;     else sayMath ['"    ",:first $postStack]
;   TERPRI()
 
(DEFUN |displayPreCompilationErrors| ()
  (PROG (|heading| |errors| |n|)
    (RETURN
     (PROGN
      (SETQ |n| (LENGTH (SETQ |$postStack| (REMDUP (NREVERSE |$postStack|)))))
      (COND ((EQL |n| 0) NIL)
            (#1='T
             (PROGN
              (SETQ |errors| (COND ((< 1 |n|) "errors") (#1# "error")))
              (COND
               (|$InteractiveMode|
                (|sayBrightly| (LIST "   Semantic " |errors| " detected: ")))
               (#1#
                (SETQ |heading|
                        (COND
                         ((NOT (EQ |$topOp| '|$topOp|))
                          (LIST "   " |$topOp| " has"))
                         (#1# (LIST "   You have"))))
                (|sayBrightly|
                 (APPEND |heading|
                         (CONS '|%b|
                               (CONS |n|
                                     (CONS '|%d|
                                           (CONS "precompilation "
                                                 (CONS |errors|
                                                       (CONS ":" NIL))))))))))
              (COND
               ((< 1 |n|)
                ((LAMBDA (|bfVar#3| |x| |i|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#3|)
                          (PROGN (SETQ |x| (CAR |bfVar#3|)) NIL))
                      (RETURN NIL))
                     (#1# (|sayMath| (CONS "   " (CONS |i| (CONS ") " |x|))))))
                    (SETQ |bfVar#3| (CDR |bfVar#3|))
                    (SETQ |i| (+ |i| 1))))
                 |$postStack| NIL 1))
               (#1# (|sayMath| (CONS "    " (CAR |$postStack|)))))
              (TERPRI))))))))
 
; postTran x ==
;   atom x =>
;     postAtom x
;   op := first x
;   IDENTP(op) and (f := GET(op, 'postTran)) => FUNCALL(f, x)
;   op is ['elt,a,b] =>
;     u:= postTran [b,:rest x]
;     [postTran op,:rest u]
;   op~=(y:= postOp op) => [y,:postTranList rest x]
;   postForm x
 
(DEFUN |postTran| (|x|)
  (PROG (|op| |f| |ISTMP#1| |a| |ISTMP#2| |b| |u| |y|)
    (RETURN
     (COND ((ATOM |x|) (|postAtom| |x|))
           (#1='T
            (PROGN
             (SETQ |op| (CAR |x|))
             (COND
              ((AND (IDENTP |op|) (SETQ |f| (GET |op| '|postTran|)))
               (FUNCALL |f| |x|))
              ((AND (CONSP |op|) (EQ (CAR |op|) '|elt|)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |op|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |a| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
               (PROGN
                (SETQ |u| (|postTran| (CONS |b| (CDR |x|))))
                (CONS (|postTran| |op|) (CDR |u|))))
              ((NOT (EQUAL |op| (SETQ |y| (|postOp| |op|))))
               (CONS |y| (|postTranList| (CDR |x|))))
              (#1# (|postForm| |x|)))))))))
 
; postTranList x == [postTran y for y in x]
 
(DEFUN |postTranList| (|x|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#5| |bfVar#4| |y|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#4|) (PROGN (SETQ |y| (CAR |bfVar#4|)) NIL))
           (RETURN (NREVERSE |bfVar#5|)))
          ('T (SETQ |bfVar#5| (CONS (|postTran| |y|) |bfVar#5|))))
         (SETQ |bfVar#4| (CDR |bfVar#4|))))
      NIL |x| NIL))))
 
; postBigFloat x ==
;   [.,mant, expon] := x
;   $BOOT => FLOAT(mant) * FLOAT(10)^expon
;   eltword := if $InteractiveMode then "$elt" else 'elt
;   postTran [[eltword,'(Float),'float],[",",[",",mant,expon],10]]
 
(DEFUN |postBigFloat| (|x|)
  (PROG (|mant| |expon| |eltword|)
    (RETURN
     (PROGN
      (SETQ |mant| (CADR . #1=(|x|)))
      (SETQ |expon| (CADDR . #1#))
      (COND ($BOOT (* (FLOAT |mant|) (EXPT (FLOAT 10) |expon|)))
            (#2='T
             (PROGN
              (SETQ |eltword| (COND (|$InteractiveMode| '|$elt|) (#2# '|elt|)))
              (|postTran|
               (LIST (LIST |eltword| '(|Float|) '|float|)
                     (LIST '|,| (LIST '|,| |mant| |expon|) 10))))))))))
 
; postAdd ['add,a,:b] ==
;   null b => postCapsule a
;   ['add,postTran a,postCapsule first b]
 
(DEFUN |postAdd| (|bfVar#6|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#6|)))
      (SETQ |b| (CDDR . #1#))
      (COND ((NULL |b|) (|postCapsule| |a|))
            ('T (LIST '|add| (|postTran| |a|) (|postCapsule| (CAR |b|)))))))))
 
; checkWarning msg == postError concat('"Parsing error: ",msg)
 
(DEFUN |checkWarning| (|msg|)
  (PROG () (RETURN (|postError| (|concat| "Parsing error: " |msg|)))))
 
; checkWarningIndentation() ==
;   checkWarning ['"Apparent indentation error following",:bright "add"]
 
(DEFUN |checkWarningIndentation| ()
  (PROG ()
    (RETURN
     (|checkWarning|
      (CONS "Apparent indentation error following" (|bright| '|add|))))))
 
; postCapsule x ==
;   x isnt [op,:.] => checkWarningIndentation()
;   INTEGERP op or op = "==" => ['CAPSULE,postBlockItem x]
;   op = ";" => ['CAPSULE,:postBlockItemList postFlatten(x,";")]
;   op = "if" => ['CAPSULE,postBlockItem x]
;   checkWarningIndentation()
 
(DEFUN |postCapsule| (|x|)
  (PROG (|op|)
    (RETURN
     (COND
      ((NOT (AND (CONSP |x|) (PROGN (SETQ |op| (CAR |x|)) #1='T)))
       (|checkWarningIndentation|))
      ((OR (INTEGERP |op|) (EQ |op| '==))
       (LIST 'CAPSULE (|postBlockItem| |x|)))
      ((EQ |op| '|;|)
       (CONS 'CAPSULE (|postBlockItemList| (|postFlatten| |x| '|;|))))
      ((EQ |op| '|if|) (LIST 'CAPSULE (|postBlockItem| |x|)))
      (#1# (|checkWarningIndentation|))))))
 
; postQUOTE x == x
 
(DEFUN |postQUOTE| (|x|) (PROG () (RETURN |x|)))
 
; postColon u ==
;   u is [":",x] => [":",postTran x]
;   u is [":",x,y] => [":",postTran x,:postType y]
 
(DEFUN |postColon| (|u|)
  (PROG (|ISTMP#1| |x| |ISTMP#2| |y|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |x| (CAR |ISTMP#1|)) #1='T))))
       (LIST '|:| (|postTran| |x|)))
      ((AND (CONSP |u|) (EQ (CAR |u|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |x| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1#))))))
       (CONS '|:| (CONS (|postTran| |x|) (|postType| |y|))))))))
 
; postColonColon u ==
;   -- for Lisp package calling
;   -- boot syntax is package::fun but probably need to parenthesize it
;   $BOOT and u is ["::",package,fun] =>
;     INTERN(STRINGIMAGE fun, package)
;   postForm u
 
(DEFUN |postColonColon| (|u|)
  (PROG (|ISTMP#1| |package| |ISTMP#2| |fun|)
    (RETURN
     (COND
      ((AND $BOOT (CONSP |u|) (EQ (CAR |u|) '|::|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |package| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |fun| (CAR |ISTMP#2|)) #1='T))))))
       (INTERN (STRINGIMAGE |fun|) |package|))
      (#1# (|postForm| |u|))))))
 
; postAtSign ["@",x,y] == ["@",postTran x,:postType y]
 
(DEFUN |postAtSign| (|bfVar#7|)
  (PROG (|x| |y|)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#7|)))
      (SETQ |y| (CADDR . #1#))
      (CONS '@ (CONS (|postTran| |x|) (|postType| |y|)))))))
 
; postPretend ['pretend,x,y] == ['pretend,postTran x,:postType y]
 
(DEFUN |postPretend| (|bfVar#8|)
  (PROG (|x| |y|)
    (RETURN
     (PROGN
      (SETQ |x| (CADR . #1=(|bfVar#8|)))
      (SETQ |y| (CADDR . #1#))
      (CONS '|pretend| (CONS (|postTran| |x|) (|postType| |y|)))))))
 
; postConstruct u ==
;   u is ['construct,b] =>
;     a:= (b is [",",:.] => comma2Tuple b; b)
;     a is ['SEGMENT,p,q] => ['construct,postTranSegment(p,q)]
;     a is ["@Tuple", :l] =>
;       or/[x is [":",y] for x in l] => postMakeCons l
;       or/[x is ['SEGMENT,:.] for x in l] => tuple2List l
;       ['construct,:postTranList l]
;     ['construct,postTran a]
;   u
 
(DEFUN |postConstruct| (|u|)
  (PROG (|ISTMP#1| |b| |a| |p| |ISTMP#2| |q| |l| |y|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) '|construct|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |b| (CAR |ISTMP#1|)) #1='T))))
       (PROGN
        (SETQ |a|
                (COND
                 ((AND (CONSP |b|) (EQ (CAR |b|) '|,|)) (|comma2Tuple| |b|))
                 (#1# |b|)))
        (COND
         ((AND (CONSP |a|) (EQ (CAR |a|) 'SEGMENT)
               (PROGN
                (SETQ |ISTMP#1| (CDR |a|))
                (AND (CONSP |ISTMP#1|)
                     (PROGN
                      (SETQ |p| (CAR |ISTMP#1|))
                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                      (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                           (PROGN (SETQ |q| (CAR |ISTMP#2|)) #1#))))))
          (LIST '|construct| (|postTranSegment| |p| |q|)))
         ((AND (CONSP |a|) (EQ (CAR |a|) '|@Tuple|)
               (PROGN (SETQ |l| (CDR |a|)) #1#))
          (COND
           (((LAMBDA (|bfVar#10| |bfVar#9| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#9|) (PROGN (SETQ |x| (CAR |bfVar#9|)) NIL))
                  (RETURN |bfVar#10|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#10|
                           (AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |x|))
                                 (AND (CONSP |ISTMP#1|)
                                      (EQ (CDR |ISTMP#1|) NIL)
                                      (PROGN
                                       (SETQ |y| (CAR |ISTMP#1|))
                                       #1#)))))
                   (COND (|bfVar#10| (RETURN |bfVar#10|))))))
                (SETQ |bfVar#9| (CDR |bfVar#9|))))
             NIL |l| NIL)
            (|postMakeCons| |l|))
           (((LAMBDA (|bfVar#12| |bfVar#11| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#11|)
                      (PROGN (SETQ |x| (CAR |bfVar#11|)) NIL))
                  (RETURN |bfVar#12|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#12| (AND (CONSP |x|) (EQ (CAR |x|) 'SEGMENT)))
                   (COND (|bfVar#12| (RETURN |bfVar#12|))))))
                (SETQ |bfVar#11| (CDR |bfVar#11|))))
             NIL |l| NIL)
            (|tuple2List| |l|))
           (#1# (CONS '|construct| (|postTranList| |l|)))))
         (#1# (LIST '|construct| (|postTran| |a|))))))
      (#1# |u|)))))
 
; postError msg ==
;   xmsg:=
;     BOUNDP("$defOp") and not $InteractiveMode =>
;         [$defOp, '": " , :msg]
;     msg
;   $postStack:= [xmsg,:$postStack]
;   nil
 
(DEFUN |postError| (|msg|)
  (PROG (|xmsg|)
    (RETURN
     (PROGN
      (SETQ |xmsg|
              (COND
               ((AND (BOUNDP '|$defOp|) (NULL |$InteractiveMode|))
                (CONS |$defOp| (CONS ": " |msg|)))
               ('T |msg|)))
      (SETQ |$postStack| (CONS |xmsg| |$postStack|))
      NIL))))
 
; postMakeCons l ==
;   null l => nil
;   l is [[":",a],:l'] =>
;     l' => ['append,postTran a,postMakeCons l']
;     postTran a
;   ['cons,postTran first l,postMakeCons rest l]
 
(DEFUN |postMakeCons| (|l|)
  (PROG (|ISTMP#1| |ISTMP#2| |a| |l'|)
    (RETURN
     (COND ((NULL |l|) NIL)
           ((AND (CONSP |l|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |l|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |a| (CAR |ISTMP#2|)) #1='T)))))
                 (PROGN (SETQ |l'| (CDR |l|)) #1#))
            (COND
             (|l'| (LIST '|append| (|postTran| |a|) (|postMakeCons| |l'|)))
             (#1# (|postTran| |a|))))
           (#1#
            (LIST '|cons| (|postTran| (CAR |l|))
                  (|postMakeCons| (CDR |l|))))))))
 
; postAtom x ==
;   $BOOT => x
;   x=0 => '(Zero)
;   x=1 => '(One)
;   EQ(x,'T) => 'T_$ -- rename T in spad code to T$
;   IDENTP x and GETDATABASE(x,'NILADIC) => LIST x
;   x
 
(DEFUN |postAtom| (|x|)
  (PROG ()
    (RETURN
     (COND ($BOOT |x|) ((EQL |x| 0) '(|Zero|)) ((EQL |x| 1) '(|One|))
           ((EQ |x| 'T) 'T$)
           ((AND (IDENTP |x|) (GETDATABASE |x| 'NILADIC)) (LIST |x|))
           ('T |x|)))))
 
; postBlock ['Block,:l,x] ==
;   ['SEQ,:postBlockItemList l,['exit,postTran x]]
 
(DEFUN |postBlock| (|bfVar#13|)
  (PROG (|LETTMP#1| |x| |l|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (REVERSE (CDR |bfVar#13|)))
      (SETQ |x| (CAR |LETTMP#1|))
      (SETQ |l| (NREVERSE (CDR |LETTMP#1|)))
      (CONS 'SEQ
            (APPEND (|postBlockItemList| |l|)
                    (CONS (LIST '|exit| (|postTran| |x|)) NIL)))))))
 
; postBlockItemList l == [postBlockItem x for x in l]
 
(DEFUN |postBlockItemList| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#15| |bfVar#14| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#14|) (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
           (RETURN (NREVERSE |bfVar#15|)))
          ('T (SETQ |bfVar#15| (CONS (|postBlockItem| |x|) |bfVar#15|))))
         (SETQ |bfVar#14| (CDR |bfVar#14|))))
      NIL |l| NIL))))
 
; postBlockItem x ==
;   x:= postTran x
;   x is ["@Tuple", :l, [":", y, t]] and (and/[IDENTP x for x in l]) =>
;     [":",['LISTOF,:l,y],t]
;   x
 
(DEFUN |postBlockItem| (|x|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |y| |ISTMP#5| |t| |l|)
    (RETURN
     (PROGN
      (SETQ |x| (|postTran| |x|))
      (COND
       ((AND (CONSP |x|) (EQ (CAR |x|) '|@Tuple|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |x|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1='T)
                   (CONSP |ISTMP#2|)
                   (PROGN
                    (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                    (AND (CONSP |ISTMP#3|) (EQ (CAR |ISTMP#3|) '|:|)
                         (PROGN
                          (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                          (AND (CONSP |ISTMP#4|)
                               (PROGN
                                (SETQ |y| (CAR |ISTMP#4|))
                                (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                (AND (CONSP |ISTMP#5|) (EQ (CDR |ISTMP#5|) NIL)
                                     (PROGN
                                      (SETQ |t| (CAR |ISTMP#5|))
                                      #1#)))))))
                   (PROGN (SETQ |l| (CDR |ISTMP#2|)) #1#)
                   (PROGN (SETQ |l| (NREVERSE |l|)) #1#)))
             ((LAMBDA (|bfVar#17| |bfVar#16| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#16|)
                       (PROGN (SETQ |x| (CAR |bfVar#16|)) NIL))
                   (RETURN |bfVar#17|))
                  (#1#
                   (PROGN
                    (SETQ |bfVar#17| (IDENTP |x|))
                    (COND ((NOT |bfVar#17|) (RETURN NIL))))))
                 (SETQ |bfVar#16| (CDR |bfVar#16|))))
              T |l| NIL))
        (LIST '|:| (CONS 'LISTOF (APPEND |l| (CONS |y| NIL))) |t|))
       (#1# |x|))))))
 
; postCategory (u is ['CATEGORY,:l]) ==
;   --RDJ: ugh_ please -- someone take away need for PROGN as soon as possible
;   null l => u
;   op :=
;     $insidePostCategoryIfTrue = true => 'PROGN
;     'CATEGORY
;   [op,:[fn x for x in l]] where fn x ==
;     $insidePostCategoryIfTrue: local := true
;     postTran x
 
(DEFUN |postCategory| (|u|)
  (PROG (|l| |op|)
    (RETURN
     (PROGN
      (SETQ |l| (CDR |u|))
      (COND ((NULL |l|) |u|)
            (#1='T
             (PROGN
              (SETQ |op|
                      (COND ((EQUAL |$insidePostCategoryIfTrue| T) 'PROGN)
                            (#1# 'CATEGORY)))
              (CONS |op|
                    ((LAMBDA (|bfVar#19| |bfVar#18| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#18|)
                              (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
                          (RETURN (NREVERSE |bfVar#19|)))
                         (#1#
                          (SETQ |bfVar#19|
                                  (CONS (|postCategory,fn| |x|) |bfVar#19|))))
                        (SETQ |bfVar#18| (CDR |bfVar#18|))))
                     NIL |l| NIL)))))))))
(DEFUN |postCategory,fn| (|x|)
  (PROG (|$insidePostCategoryIfTrue|)
    (DECLARE (SPECIAL |$insidePostCategoryIfTrue|))
    (RETURN (PROGN (SETQ |$insidePostCategoryIfTrue| T) (|postTran| |x|)))))
 
; postComma u == postTuple comma2Tuple u
 
(DEFUN |postComma| (|u|) (PROG () (RETURN (|postTuple| (|comma2Tuple| |u|)))))
 
; comma2Tuple u == ["@Tuple", :postFlatten(u, ",")]
 
(DEFUN |comma2Tuple| (|u|)
  (PROG () (RETURN (CONS '|@Tuple| (|postFlatten| |u| '|,|)))))
 
; postDef [defOp,lhs,rhs] ==
; --+
;   lhs is ["macro",name] => postMDef ["==>",name,rhs]
; 
;   if not($BOOT) then recordHeaderDocumentation nil
;   if $maxSignatureLineNumber ~= 0 then
;     $docList := [['constructor,:$headerDocumentation],:$docList]
;     $maxSignatureLineNumber := 0
;     --reset this for next constructor; see recordDocumentation
;   lhs:= postTran lhs
;   [form,targetType]:=
;     lhs is [":",:.] => rest lhs
;     [lhs,nil]
;   if null $InteractiveMode and atom form then form := LIST form
;   newLhs:=
;     atom form => form
;     [op,:argl]:= [(x is [":",a,.] => a; x) for x in form]
;     [op,:postDefArgs argl]
;   argTypeList:=
;     atom form => nil
;     [(x is [":",.,t] => t; nil) for x in rest form]
;   typeList:= [targetType,:argTypeList]
;   if atom form then form := [form]
;   specialCaseForm := [nil for x in form]
;   trhs :=
;       rhs is ["=>", a, b] => ['IF,postTran a, postTran b, 'noBranch]
;       postTran rhs
;   ['DEF, newLhs, typeList, specialCaseForm, trhs]
 
(DEFUN |postDef| (|bfVar#26|)
  (PROG (|defOp| |lhs| |rhs| |ISTMP#1| |name| |LETTMP#1| |form| |targetType|
         |a| |ISTMP#2| |op| |argl| |newLhs| |t| |argTypeList| |typeList|
         |specialCaseForm| |b| |trhs|)
    (RETURN
     (PROGN
      (SETQ |defOp| (CAR |bfVar#26|))
      (SETQ |lhs| (CADR . #1=(|bfVar#26|)))
      (SETQ |rhs| (CADDR . #1#))
      (COND
       ((AND (CONSP |lhs|) (EQ (CAR |lhs|) '|macro|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |lhs|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |name| (CAR |ISTMP#1|)) #2='T))))
        (|postMDef| (LIST '==> |name| |rhs|)))
       (#2#
        (PROGN
         (COND ((NULL $BOOT) (|recordHeaderDocumentation| NIL)))
         (COND
          ((NOT (EQL |$maxSignatureLineNumber| 0))
           (SETQ |$docList|
                   (CONS (CONS '|constructor| |$headerDocumentation|)
                         |$docList|))
           (SETQ |$maxSignatureLineNumber| 0)))
         (SETQ |lhs| (|postTran| |lhs|))
         (SETQ |LETTMP#1|
                 (COND ((AND (CONSP |lhs|) (EQ (CAR |lhs|) '|:|)) (CDR |lhs|))
                       (#2# (LIST |lhs| NIL))))
         (SETQ |form| (CAR |LETTMP#1|))
         (SETQ |targetType| (CADR |LETTMP#1|))
         (COND
          ((AND (NULL |$InteractiveMode|) (ATOM |form|))
           (SETQ |form| (LIST |form|))))
         (SETQ |newLhs|
                 (COND ((ATOM |form|) |form|)
                       (#2#
                        (PROGN
                         (SETQ |LETTMP#1|
                                 ((LAMBDA (|bfVar#21| |bfVar#20| |x|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#20|)
                                           (PROGN
                                            (SETQ |x| (CAR |bfVar#20|))
                                            NIL))
                                       (RETURN (NREVERSE |bfVar#21|)))
                                      (#2#
                                       (SETQ |bfVar#21|
                                               (CONS
                                                (COND
                                                 ((AND (CONSP |x|)
                                                       (EQ (CAR |x|) '|:|)
                                                       (PROGN
                                                        (SETQ |ISTMP#1|
                                                                (CDR |x|))
                                                        (AND (CONSP |ISTMP#1|)
                                                             (PROGN
                                                              (SETQ |a|
                                                                      (CAR
                                                                       |ISTMP#1|))
                                                              (SETQ |ISTMP#2|
                                                                      (CDR
                                                                       |ISTMP#1|))
                                                              (AND
                                                               (CONSP
                                                                |ISTMP#2|)
                                                               (EQ
                                                                (CDR |ISTMP#2|)
                                                                NIL))))))
                                                  |a|)
                                                 (#2# |x|))
                                                |bfVar#21|))))
                                     (SETQ |bfVar#20| (CDR |bfVar#20|))))
                                  NIL |form| NIL))
                         (SETQ |op| (CAR |LETTMP#1|))
                         (SETQ |argl| (CDR |LETTMP#1|))
                         (CONS |op| (|postDefArgs| |argl|))))))
         (SETQ |argTypeList|
                 (COND ((ATOM |form|) NIL)
                       (#2#
                        ((LAMBDA (|bfVar#23| |bfVar#22| |x|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#22|)
                                  (PROGN (SETQ |x| (CAR |bfVar#22|)) NIL))
                              (RETURN (NREVERSE |bfVar#23|)))
                             (#2#
                              (SETQ |bfVar#23|
                                      (CONS
                                       (COND
                                        ((AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                                              (PROGN
                                               (SETQ |ISTMP#1| (CDR |x|))
                                               (AND (CONSP |ISTMP#1|)
                                                    (PROGN
                                                     (SETQ |ISTMP#2|
                                                             (CDR |ISTMP#1|))
                                                     (AND (CONSP |ISTMP#2|)
                                                          (EQ (CDR |ISTMP#2|)
                                                              NIL)
                                                          (PROGN
                                                           (SETQ |t|
                                                                   (CAR
                                                                    |ISTMP#2|))
                                                           #2#))))))
                                         |t|)
                                        (#2# NIL))
                                       |bfVar#23|))))
                            (SETQ |bfVar#22| (CDR |bfVar#22|))))
                         NIL (CDR |form|) NIL))))
         (SETQ |typeList| (CONS |targetType| |argTypeList|))
         (COND ((ATOM |form|) (SETQ |form| (LIST |form|))))
         (SETQ |specialCaseForm|
                 ((LAMBDA (|bfVar#25| |bfVar#24| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#24|)
                           (PROGN (SETQ |x| (CAR |bfVar#24|)) NIL))
                       (RETURN (NREVERSE |bfVar#25|)))
                      (#2# (SETQ |bfVar#25| (CONS NIL |bfVar#25|))))
                     (SETQ |bfVar#24| (CDR |bfVar#24|))))
                  NIL |form| NIL))
         (SETQ |trhs|
                 (COND
                  ((AND (CONSP |rhs|) (EQ (CAR |rhs|) '=>)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |rhs|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |a| (CAR |ISTMP#1|))
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN (SETQ |b| (CAR |ISTMP#2|)) #2#))))))
                   (LIST 'IF (|postTran| |a|) (|postTran| |b|) '|noBranch|))
                  (#2# (|postTran| |rhs|))))
         (LIST 'DEF |newLhs| |typeList| |specialCaseForm| |trhs|))))))))
 
; postDefArgs argl ==
;   null argl => argl
;   argl is [[":",a],:b] =>
;     b => postError
;       ['"   Argument",:bright a,'"of indefinite length must be last"]
;     atom a or a is ['QUOTE,:.] => a
;     postError
;       ['"   Argument",:bright a,'"of indefinite length must be a name"]
;   [first argl,:postDefArgs rest argl]
 
(DEFUN |postDefArgs| (|argl|)
  (PROG (|ISTMP#1| |ISTMP#2| |a| |b|)
    (RETURN
     (COND ((NULL |argl|) |argl|)
           ((AND (CONSP |argl|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |argl|))
                  (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |a| (CAR |ISTMP#2|)) #1='T)))))
                 (PROGN (SETQ |b| (CDR |argl|)) #1#))
            (COND
             (|b|
              (|postError|
               (CONS "   Argument"
                     (APPEND (|bright| |a|)
                             (CONS "of indefinite length must be last" NIL)))))
             ((OR (ATOM |a|) (AND (CONSP |a|) (EQ (CAR |a|) 'QUOTE))) |a|)
             (#1#
              (|postError|
               (CONS "   Argument"
                     (APPEND (|bright| |a|)
                             (CONS "of indefinite length must be a name"
                                   NIL)))))))
           (#1# (CONS (CAR |argl|) (|postDefArgs| (CDR |argl|))))))))
 
; postMDef(t) ==
;   [.,lhs,rhs] := t
;   $InteractiveMode and not $BOOT =>
;     lhs := postTran lhs
;     null IDENTP lhs => throwKeyedMsg("S2IP0001",NIL)
;     ['MDEF,lhs,NIL,NIL,postTran rhs]
;   lhs:= postTran lhs
;   [form,targetType]:=
;     lhs is [":",:.] => rest lhs
;     [lhs,nil]
;   form:=
;     atom form => LIST form
;     form
;   newLhs:= [(x is [":",a,:.] => a; x) for x in form]
;   typeList:= [targetType,:[(x is [":",.,t] => t; nil) for x in rest form]]
;   ['MDEF,newLhs,typeList,[nil for x in form],postTran rhs]
 
(DEFUN |postMDef| (|t|)
  (PROG (|lhs| |rhs| |LETTMP#1| |form| |targetType| |ISTMP#1| |a| |newLhs|
         |ISTMP#2| |typeList|)
    (RETURN
     (PROGN
      (SETQ |lhs| (CADR . #1=(|t|)))
      (SETQ |rhs| (CADDR . #1#))
      (COND
       ((AND |$InteractiveMode| (NULL $BOOT))
        (PROGN
         (SETQ |lhs| (|postTran| |lhs|))
         (COND ((NULL (IDENTP |lhs|)) (|throwKeyedMsg| 'S2IP0001 NIL))
               (#2='T (LIST 'MDEF |lhs| NIL NIL (|postTran| |rhs|))))))
       (#2#
        (PROGN
         (SETQ |lhs| (|postTran| |lhs|))
         (SETQ |LETTMP#1|
                 (COND ((AND (CONSP |lhs|) (EQ (CAR |lhs|) '|:|)) (CDR |lhs|))
                       (#2# (LIST |lhs| NIL))))
         (SETQ |form| (CAR |LETTMP#1|))
         (SETQ |targetType| (CADR |LETTMP#1|))
         (SETQ |form| (COND ((ATOM |form|) (LIST |form|)) (#2# |form|)))
         (SETQ |newLhs|
                 ((LAMBDA (|bfVar#28| |bfVar#27| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#27|)
                           (PROGN (SETQ |x| (CAR |bfVar#27|)) NIL))
                       (RETURN (NREVERSE |bfVar#28|)))
                      (#2#
                       (SETQ |bfVar#28|
                               (CONS
                                (COND
                                 ((AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                                       (PROGN
                                        (SETQ |ISTMP#1| (CDR |x|))
                                        (AND (CONSP |ISTMP#1|)
                                             (PROGN
                                              (SETQ |a| (CAR |ISTMP#1|))
                                              #2#))))
                                  |a|)
                                 (#2# |x|))
                                |bfVar#28|))))
                     (SETQ |bfVar#27| (CDR |bfVar#27|))))
                  NIL |form| NIL))
         (SETQ |typeList|
                 (CONS |targetType|
                       ((LAMBDA (|bfVar#30| |bfVar#29| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#29|)
                                 (PROGN (SETQ |x| (CAR |bfVar#29|)) NIL))
                             (RETURN (NREVERSE |bfVar#30|)))
                            (#2#
                             (SETQ |bfVar#30|
                                     (CONS
                                      (COND
                                       ((AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                                             (PROGN
                                              (SETQ |ISTMP#1| (CDR |x|))
                                              (AND (CONSP |ISTMP#1|)
                                                   (PROGN
                                                    (SETQ |ISTMP#2|
                                                            (CDR |ISTMP#1|))
                                                    (AND (CONSP |ISTMP#2|)
                                                         (EQ (CDR |ISTMP#2|)
                                                             NIL)
                                                         (PROGN
                                                          (SETQ |t|
                                                                  (CAR
                                                                   |ISTMP#2|))
                                                          #2#))))))
                                        |t|)
                                       (#2# NIL))
                                      |bfVar#30|))))
                           (SETQ |bfVar#29| (CDR |bfVar#29|))))
                        NIL (CDR |form|) NIL)))
         (LIST 'MDEF |newLhs| |typeList|
               ((LAMBDA (|bfVar#32| |bfVar#31| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#31|)
                         (PROGN (SETQ |x| (CAR |bfVar#31|)) NIL))
                     (RETURN (NREVERSE |bfVar#32|)))
                    (#2# (SETQ |bfVar#32| (CONS NIL |bfVar#32|))))
                   (SETQ |bfVar#31| (CDR |bfVar#31|))))
                NIL |form| NIL)
               (|postTran| |rhs|)))))))))
 
; postElt (u is [.,a,b]) ==
;   a:= postTran a
;   b is ['Sequence,:.] =>
;       BREAK()
;       [['elt,a,'makeRecord],:postTranList rest b]
;   ['elt,a,postTran b]
 
(DEFUN |postElt| (|u|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|u|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |a| (|postTran| |a|))
      (COND
       ((AND (CONSP |b|) (EQ (CAR |b|) '|Sequence|))
        (PROGN
         (BREAK)
         (CONS (LIST '|elt| |a| '|makeRecord|) (|postTranList| (CDR |b|)))))
       ('T (LIST '|elt| |a| (|postTran| |b|))))))))
 
; postExit ["=>",a,b] == ['IF,postTran a,['exit,postTran b],'noBranch]
 
(DEFUN |postExit| (|bfVar#33|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#33|)))
      (SETQ |b| (CADDR . #1#))
      (LIST 'IF (|postTran| |a|) (LIST '|exit| (|postTran| |b|))
            '|noBranch|)))))
 
; postFlatten(x,op) ==
;   x is [ =op,a,b] => [:postFlatten(a,op),:postFlatten(b,op)]
;   LIST x
 
(DEFUN |postFlatten| (|x| |op|)
  (PROG (|ISTMP#1| |a| |ISTMP#2| |b|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQUAL (CAR |x|) |op|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |a| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1='T))))))
       (APPEND (|postFlatten| |a| |op|) (|postFlatten| |b| |op|)))
      (#1# (LIST |x|))))))
 
; postForm (u is [op,:argl]) ==
;   x:=
;     atom op =>
;       argl':= postTranList argl
;       [op,:argl']
;     u:= postTranList u
;     if u is [["@Tuple", :.], :.] then
;       postError ['"  ",:bright u,
;         '"is illegal because tuples cannot be applied!",'%l,
;           '"   Did you misuse infix dot?"]
;     u
;   x is [., ["@Tuple", :y]] => [first x, :y]
;   x
 
(DEFUN |postForm| (|u|)
  (PROG (|op| |argl| |argl'| |ISTMP#1| |x| |ISTMP#2| |y|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |u|))
      (SETQ |argl| (CDR |u|))
      (SETQ |x|
              (COND
               ((ATOM |op|)
                (PROGN
                 (SETQ |argl'| (|postTranList| |argl|))
                 (CONS |op| |argl'|)))
               (#1='T
                (PROGN
                 (SETQ |u| (|postTranList| |u|))
                 (COND
                  ((AND (CONSP |u|)
                        (PROGN
                         (SETQ |ISTMP#1| (CAR |u|))
                         (AND (CONSP |ISTMP#1|)
                              (EQ (CAR |ISTMP#1|) '|@Tuple|))))
                   (|postError|
                    (CONS "  "
                          (APPEND (|bright| |u|)
                                  (CONS
                                   "is illegal because tuples cannot be applied!"
                                   (CONS '|%l|
                                         (CONS "   Did you misuse infix dot?"
                                               NIL))))))))
                 |u|))))
      (COND
       ((AND (CONSP |x|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |x|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN
                    (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|@Tuple|)
                         (PROGN (SETQ |y| (CDR |ISTMP#2|)) #1#))))))
        (CONS (CAR |x|) |y|))
       (#1# |x|))))))
 
; postQuote [.,a] == ['QUOTE,a]
 
(DEFUN |postQuote| (|bfVar#34|)
  (PROG (|a|) (RETURN (PROGN (SETQ |a| (CADR |bfVar#34|)) (LIST 'QUOTE |a|)))))
 
; postIf t ==
;   t isnt ["if",:l] => t
;   ['IF,:[(null (x:= postTran x) and null $BOOT => 'noBranch; x)
;     for x in l]]
 
(DEFUN |postIf| (|t|)
  (PROG (|l|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |t|) (EQ (CAR |t|) '|if|)
             (PROGN (SETQ |l| (CDR |t|)) #1='T)))
       |t|)
      (#1#
       (CONS 'IF
             ((LAMBDA (|bfVar#36| |bfVar#35| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#35|)
                       (PROGN (SETQ |x| (CAR |bfVar#35|)) NIL))
                   (RETURN (NREVERSE |bfVar#36|)))
                  (#1#
                   (SETQ |bfVar#36|
                           (CONS
                            (COND
                             ((AND (NULL (SETQ |x| (|postTran| |x|)))
                                   (NULL $BOOT))
                              '|noBranch|)
                             (#1# |x|))
                            |bfVar#36|))))
                 (SETQ |bfVar#35| (CDR |bfVar#35|))))
              NIL |l| NIL)))))))
 
; postJoin ['Join,a,:l] ==
;   a:= postTran a
;   l:= postTranList l
;   if l is [b] and b is [name,:.] and MEMQ(name,'(ATTRIBUTE SIGNATURE)) then l
;     := LIST ['CATEGORY,b]
;   al:=
;     a is ["@Tuple", :c] => c
;     LIST a
;   ['Join,:al,:l]
 
(DEFUN |postJoin| (|bfVar#37|)
  (PROG (|a| |l| |b| |name| |c| |al|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#37|)))
      (SETQ |l| (CDDR . #1#))
      (SETQ |a| (|postTran| |a|))
      (SETQ |l| (|postTranList| |l|))
      (COND
       ((AND (CONSP |l|) (EQ (CDR |l|) NIL) (PROGN (SETQ |b| (CAR |l|)) #2='T)
             (CONSP |b|) (PROGN (SETQ |name| (CAR |b|)) #2#)
             (MEMQ |name| '(ATTRIBUTE SIGNATURE)))
        (SETQ |l| (LIST (LIST 'CATEGORY |b|)))))
      (SETQ |al|
              (COND
               ((AND (CONSP |a|) (EQ (CAR |a|) '|@Tuple|)
                     (PROGN (SETQ |c| (CDR |a|)) #2#))
                |c|)
               (#2# (LIST |a|))))
      (CONS '|Join| (APPEND |al| |l|))))))
 
; postMapping u  ==
;   u isnt ["->",source,target] => u
;   ['Mapping,postTran target,:unTuple postTran source]
 
(DEFUN |postMapping| (|u|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |target|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |u|) (EQ (CAR |u|) '->)
             (PROGN
              (SETQ |ISTMP#1| (CDR |u|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |source| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1='T)))))))
       |u|)
      (#1#
       (CONS '|Mapping|
             (CONS (|postTran| |target|)
                   (|unTuple| (|postTran| |source|)))))))))
 
; postOp x ==
;   x=":=" =>
;     $BOOT => 'SPADLET
;     'LET
;   x='Attribute => 'ATTRIBUTE
;   x
 
(DEFUN |postOp| (|x|)
  (PROG ()
    (RETURN
     (COND ((EQ |x| '|:=|) (COND ($BOOT 'SPADLET) (#1='T 'LET)))
           ((EQ |x| '|Attribute|) 'ATTRIBUTE) (#1# |x|)))))
 
; postRepeat ['REPEAT,:m,x] == ['REPEAT,:postIteratorList m,postTran x]
 
(DEFUN |postRepeat| (|bfVar#38|)
  (PROG (|LETTMP#1| |x| |m|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (REVERSE (CDR |bfVar#38|)))
      (SETQ |x| (CAR |LETTMP#1|))
      (SETQ |m| (NREVERSE (CDR |LETTMP#1|)))
      (CONS 'REPEAT
            (APPEND (|postIteratorList| |m|) (CONS (|postTran| |x|) NIL)))))))
 
; postSEGMENT ['SEGMENT,a,b] ==
;   key:= [a,'"..",:(b => [b]; nil)]
;   postError ['"   Improper placement of segment",:bright key]
 
(DEFUN |postSEGMENT| (|bfVar#39|)
  (PROG (|a| |b| |key|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#39|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |key| (CONS |a| (CONS ".." (COND (|b| (LIST |b|)) ('T NIL)))))
      (|postError|
       (CONS "   Improper placement of segment" (|bright| |key|)))))))
 
; postCollect [constructOp,:m,x] ==
;   x is [['elt,D,'construct],:y] =>
;     postCollect [['elt,D,'COLLECT],:m,['construct,:y]]
;   itl:= postIteratorList m
;   x:= (x is ['construct,r] => r; x)  --added 84/8/31
;   y:= postTran x
;   finish(constructOp,itl,y) where
;     finish(op,itl,y) ==
;       y is [":",a] => ['REDUCE,'append,0,[op,:itl,a]]
;       y is ["@Tuple", :l] =>
;         newBody:=
;           or/[x is [":",y] for x in l] => postMakeCons l
;           or/[x is ['SEGMENT,:.] for x in l] => tuple2List l
;           ['construct,:postTranList l]
;         ['REDUCE,'append,0,[op,:itl,newBody]]
;       [op,:itl,y]
 
(DEFUN |postCollect| (|bfVar#44|)
  (PROG (|constructOp| |LETTMP#1| |x| |m| |ISTMP#1| |ISTMP#2| D |ISTMP#3| |y|
         |itl| |r|)
    (RETURN
     (PROGN
      (SETQ |constructOp| (CAR |bfVar#44|))
      (SETQ |LETTMP#1| (REVERSE (CDR |bfVar#44|)))
      (SETQ |x| (CAR |LETTMP#1|))
      (SETQ |m| (NREVERSE (CDR |LETTMP#1|)))
      (COND
       ((AND (CONSP |x|)
             (PROGN
              (SETQ |ISTMP#1| (CAR |x|))
              (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|elt|)
                   (PROGN
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|)
                         (PROGN
                          (SETQ D (CAR |ISTMP#2|))
                          (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                          (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                               (EQ (CAR |ISTMP#3|) '|construct|)))))))
             (PROGN (SETQ |y| (CDR |x|)) #1='T))
        (|postCollect|
         (CONS (LIST '|elt| D 'COLLECT)
               (APPEND |m| (CONS (CONS '|construct| |y|) NIL)))))
       (#1#
        (PROGN
         (SETQ |itl| (|postIteratorList| |m|))
         (SETQ |x|
                 (COND
                  ((AND (CONSP |x|) (EQ (CAR |x|) '|construct|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |x|))
                         (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                              (PROGN (SETQ |r| (CAR |ISTMP#1|)) #1#))))
                   |r|)
                  (#1# |x|)))
         (SETQ |y| (|postTran| |x|))
         (|postCollect,finish| |constructOp| |itl| |y|))))))))
(DEFUN |postCollect,finish| (|op| |itl| |y|)
  (PROG (|ISTMP#1| |a| |l| |newBody|)
    (RETURN
     (COND
      ((AND (CONSP |y|) (EQ (CAR |y|) '|:|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |y|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1='T))))
       (LIST 'REDUCE '|append| 0 (CONS |op| (APPEND |itl| (CONS |a| NIL)))))
      ((AND (CONSP |y|) (EQ (CAR |y|) '|@Tuple|)
            (PROGN (SETQ |l| (CDR |y|)) #1#))
       (PROGN
        (SETQ |newBody|
                (COND
                 (((LAMBDA (|bfVar#41| |bfVar#40| |x|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#40|)
                            (PROGN (SETQ |x| (CAR |bfVar#40|)) NIL))
                        (RETURN |bfVar#41|))
                       (#1#
                        (PROGN
                         (SETQ |bfVar#41|
                                 (AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                                      (PROGN
                                       (SETQ |ISTMP#1| (CDR |x|))
                                       (AND (CONSP |ISTMP#1|)
                                            (EQ (CDR |ISTMP#1|) NIL)
                                            (PROGN
                                             (SETQ |y| (CAR |ISTMP#1|))
                                             #1#)))))
                         (COND (|bfVar#41| (RETURN |bfVar#41|))))))
                      (SETQ |bfVar#40| (CDR |bfVar#40|))))
                   NIL |l| NIL)
                  (|postMakeCons| |l|))
                 (((LAMBDA (|bfVar#43| |bfVar#42| |x|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#42|)
                            (PROGN (SETQ |x| (CAR |bfVar#42|)) NIL))
                        (RETURN |bfVar#43|))
                       (#1#
                        (PROGN
                         (SETQ |bfVar#43|
                                 (AND (CONSP |x|) (EQ (CAR |x|) 'SEGMENT)))
                         (COND (|bfVar#43| (RETURN |bfVar#43|))))))
                      (SETQ |bfVar#42| (CDR |bfVar#42|))))
                   NIL |l| NIL)
                  (|tuple2List| |l|))
                 (#1# (CONS '|construct| (|postTranList| |l|)))))
        (LIST 'REDUCE '|append| 0
              (CONS |op| (APPEND |itl| (CONS |newBody| NIL))))))
      (#1# (CONS |op| (APPEND |itl| (CONS |y| NIL))))))))
 
; postTupleCollect [constructOp,:m,x] ==
;   postCollect [constructOp,:m,['construct,x]]
 
(DEFUN |postTupleCollect| (|bfVar#45|)
  (PROG (|constructOp| |LETTMP#1| |x| |m|)
    (RETURN
     (PROGN
      (SETQ |constructOp| (CAR |bfVar#45|))
      (SETQ |LETTMP#1| (REVERSE (CDR |bfVar#45|)))
      (SETQ |x| (CAR |LETTMP#1|))
      (SETQ |m| (NREVERSE (CDR |LETTMP#1|)))
      (|postCollect|
       (CONS |constructOp| (APPEND |m| (CONS (LIST '|construct| |x|) NIL))))))))
 
; postIteratorList x ==
;   x is [p,:l] =>
;     (p:= postTran p) is ['IN,y,u] =>
;       u is ["|",a,b] => [['IN,y,postInSeq a],["|",b],:postIteratorList l]
;       [['IN,y,postInSeq u],:postIteratorList l]
;     p is  ['INBY, y, u, v] =>
;       u is ["|",a,b] =>
;           [['INBY, y, postInSeq a, v], ["|",b], :postIteratorList l]
;       [['INBY, y, u, v], :postIteratorList l]
;     [p,:postIteratorList l]
;   x
 
(DEFUN |postIteratorList| (|x|)
  (PROG (|p| |l| |ISTMP#1| |ISTMP#2| |y| |ISTMP#3| |u| |a| |b| |v|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |p| (CAR |x|)) (SETQ |l| (CDR |x|)) #1='T))
       (COND
        ((PROGN
          (SETQ |ISTMP#1| (SETQ |p| (|postTran| |p|)))
          (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'IN)
               (PROGN
                (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                (AND (CONSP |ISTMP#2|)
                     (PROGN
                      (SETQ |y| (CAR |ISTMP#2|))
                      (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                      (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                           (PROGN (SETQ |u| (CAR |ISTMP#3|)) #1#)))))))
         (COND
          ((AND (CONSP |u|) (EQ (CAR |u|) '|\||)
                (PROGN
                 (SETQ |ISTMP#1| (CDR |u|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |a| (CAR |ISTMP#1|))
                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                       (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                            (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
           (CONS (LIST 'IN |y| (|postInSeq| |a|))
                 (CONS (LIST '|\|| |b|) (|postIteratorList| |l|))))
          (#1#
           (CONS (LIST 'IN |y| (|postInSeq| |u|)) (|postIteratorList| |l|)))))
        ((AND (CONSP |p|) (EQ (CAR |p|) 'INBY)
              (PROGN
               (SETQ |ISTMP#1| (CDR |p|))
               (AND (CONSP |ISTMP#1|)
                    (PROGN
                     (SETQ |y| (CAR |ISTMP#1|))
                     (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                     (AND (CONSP |ISTMP#2|)
                          (PROGN
                           (SETQ |u| (CAR |ISTMP#2|))
                           (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                           (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                (PROGN (SETQ |v| (CAR |ISTMP#3|)) #1#))))))))
         (COND
          ((AND (CONSP |u|) (EQ (CAR |u|) '|\||)
                (PROGN
                 (SETQ |ISTMP#1| (CDR |u|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |a| (CAR |ISTMP#1|))
                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                       (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                            (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1#))))))
           (CONS (LIST 'INBY |y| (|postInSeq| |a|) |v|)
                 (CONS (LIST '|\|| |b|) (|postIteratorList| |l|))))
          (#1# (CONS (LIST 'INBY |y| |u| |v|) (|postIteratorList| |l|)))))
        (#1# (CONS |p| (|postIteratorList| |l|)))))
      (#1# |x|)))))
 
; postin arg ==
;   arg isnt ["in",i,seq] => systemErrorHere '"postin"
;   ["in",postTran i, postInSeq seq]
 
(DEFUN |postin| (|arg|)
  (PROG (|ISTMP#1| |i| |ISTMP#2| |seq|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |arg|) (EQ (CAR |arg|) '|in|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |arg|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |i| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |seq| (CAR |ISTMP#2|)) #1='T)))))))
       (|systemErrorHere| "postin"))
      (#1# (LIST '|in| (|postTran| |i|) (|postInSeq| |seq|)))))))
 
; postIn arg ==
;   arg isnt ['IN,i,seq] => systemErrorHere '"postIn"
;   ['IN,postTran i,postInSeq seq]
 
(DEFUN |postIn| (|arg|)
  (PROG (|ISTMP#1| |i| |ISTMP#2| |seq|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |arg|) (EQ (CAR |arg|) 'IN)
             (PROGN
              (SETQ |ISTMP#1| (CDR |arg|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |i| (CAR |ISTMP#1|))
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |seq| (CAR |ISTMP#2|)) #1='T)))))))
       (|systemErrorHere| "postIn"))
      (#1# (LIST 'IN (|postTran| |i|) (|postInSeq| |seq|)))))))
 
; postInSeq seq ==
;   seq is ['SEGMENT,p,q] => postTranSegment(p,q)
;   seq is ["@Tuple", :l] => tuple2List l
;   postTran seq
 
(DEFUN |postInSeq| (|seq|)
  (PROG (|ISTMP#1| |p| |ISTMP#2| |q| |l|)
    (RETURN
     (COND
      ((AND (CONSP |seq|) (EQ (CAR |seq|) 'SEGMENT)
            (PROGN
             (SETQ |ISTMP#1| (CDR |seq|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |p| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |q| (CAR |ISTMP#2|)) #1='T))))))
       (|postTranSegment| |p| |q|))
      ((AND (CONSP |seq|) (EQ (CAR |seq|) '|@Tuple|)
            (PROGN (SETQ |l| (CDR |seq|)) #1#))
       (|tuple2List| |l|))
      (#1# (|postTran| |seq|))))))
 
; postTranSegment(p,q) == ['SEGMENT,postTran p,(q => postTran q; nil)]
 
(DEFUN |postTranSegment| (|p| |q|)
  (PROG ()
    (RETURN
     (LIST 'SEGMENT (|postTran| |p|) (COND (|q| (|postTran| |q|)) ('T NIL))))))
 
; tuple2List l ==
;   l is [a,:l'] =>
;     u:= tuple2List l'
;     a is ['SEGMENT,p,q] =>
;       null u => ['construct,postTranSegment(p,q)]
;       $InteractiveMode and null $BOOT =>
;         ['append,['construct,postTranSegment(p,q)],tuple2List l']
;       ["nconc",['construct,postTranSegment(p,q)],tuple2List l']
;     null u => ['construct,postTran a]
;     ["cons",postTran a,tuple2List l']
;   nil
 
(DEFUN |tuple2List| (|l|)
  (PROG (|a| |l'| |u| |ISTMP#1| |p| |ISTMP#2| |q|)
    (RETURN
     (COND
      ((AND (CONSP |l|)
            (PROGN (SETQ |a| (CAR |l|)) (SETQ |l'| (CDR |l|)) #1='T))
       (PROGN
        (SETQ |u| (|tuple2List| |l'|))
        (COND
         ((AND (CONSP |a|) (EQ (CAR |a|) 'SEGMENT)
               (PROGN
                (SETQ |ISTMP#1| (CDR |a|))
                (AND (CONSP |ISTMP#1|)
                     (PROGN
                      (SETQ |p| (CAR |ISTMP#1|))
                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                      (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                           (PROGN (SETQ |q| (CAR |ISTMP#2|)) #1#))))))
          (COND ((NULL |u|) (LIST '|construct| (|postTranSegment| |p| |q|)))
                ((AND |$InteractiveMode| (NULL $BOOT))
                 (LIST '|append|
                       (LIST '|construct| (|postTranSegment| |p| |q|))
                       (|tuple2List| |l'|)))
                (#1#
                 (LIST '|nconc| (LIST '|construct| (|postTranSegment| |p| |q|))
                       (|tuple2List| |l'|)))))
         ((NULL |u|) (LIST '|construct| (|postTran| |a|)))
         (#1# (LIST '|cons| (|postTran| |a|) (|tuple2List| |l'|))))))
      (#1# NIL)))))
 
; SEGMENT(a,b) == [i for i in a..b]
 
(DEFUN SEGMENT (|a| |b|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#46| |i|)
        (LOOP
         (COND ((> |i| |b|) (RETURN (NREVERSE |bfVar#46|)))
               ('T (SETQ |bfVar#46| (CONS |i| |bfVar#46|))))
         (SETQ |i| (+ |i| 1))))
      NIL |a|))))
 
; postReduce ['Reduce,op,expr] ==
;   $InteractiveMode or expr is ['COLLECT,:.] =>
;     ['REDUCE,op,0,postTran expr]
;   postReduce ['Reduce,op,['COLLECT,['IN,g:= GENSYM(),expr],
;     ['construct,  g]]]
 
(DEFUN |postReduce| (|bfVar#47|)
  (PROG (|op| |expr| |g|)
    (RETURN
     (PROGN
      (SETQ |op| (CADR . #1=(|bfVar#47|)))
      (SETQ |expr| (CADDR . #1#))
      (COND
       ((OR |$InteractiveMode| (AND (CONSP |expr|) (EQ (CAR |expr|) 'COLLECT)))
        (LIST 'REDUCE |op| 0 (|postTran| |expr|)))
       ('T
        (|postReduce|
         (LIST '|Reduce| |op|
               (LIST 'COLLECT (LIST 'IN (SETQ |g| (GENSYM)) |expr|)
                     (LIST '|construct| |g|))))))))))
 
; postFlattenLeft(x,op) ==--
;   x is [ =op,a,b] => [:postFlattenLeft(a,op),b]
;   [x]
 
(DEFUN |postFlattenLeft| (|x| |op|)
  (PROG (|ISTMP#1| |a| |ISTMP#2| |b|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQUAL (CAR |x|) |op|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |a| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1='T))))))
       (APPEND (|postFlattenLeft| |a| |op|) (CONS |b| NIL)))
      (#1# (LIST |x|))))))
 
; postSemiColon u == postBlock ['Block,:postFlattenLeft(u,";")]
 
(DEFUN |postSemiColon| (|u|)
  (PROG () (RETURN (|postBlock| (CONS '|Block| (|postFlattenLeft| |u| '|;|))))))
 
; postSignature1(op, sig) ==
;     sig1 := postType sig
;     op := postAtom (STRINGP op => INTERN op; op)
;     sig is ["->",:.] =>
;         ["SIGNATURE",op,:removeSuperfluousMapping killColons sig1]
;     ["SIGNATURE", op, killColons sig1, "constant"]
 
(DEFUN |postSignature1| (|op| |sig|)
  (PROG (|sig1|)
    (RETURN
     (PROGN
      (SETQ |sig1| (|postType| |sig|))
      (SETQ |op|
              (|postAtom| (COND ((STRINGP |op|) (INTERN |op|)) (#1='T |op|))))
      (COND
       ((AND (CONSP |sig|) (EQ (CAR |sig|) '->))
        (CONS 'SIGNATURE
              (CONS |op| (|removeSuperfluousMapping| (|killColons| |sig1|)))))
       (#1# (LIST 'SIGNATURE |op| (|killColons| |sig1|) '|constant|)))))))
 
; postSignature ['Signature, op, sig, doc] ==
;     res1 := postSignature1(op, sig)
;     if res1 then record_on_docList(rest res1, doc)
;     res1
 
(DEFUN |postSignature| (|bfVar#48|)
  (PROG (|op| |sig| |doc| |res1|)
    (RETURN
     (PROGN
      (SETQ |op| (CADR . #1=(|bfVar#48|)))
      (SETQ |sig| (CADDR . #1#))
      (SETQ |doc| (CADDDR . #1#))
      (SETQ |res1| (|postSignature1| |op| |sig|))
      (COND (|res1| (|record_on_docList| (CDR |res1|) |doc|)))
      |res1|))))
 
; killColons x ==
;   atom x => x
;   x is ['Record,:.] => x
;   x is ['Union,:.] => x
;   x is [":",.,y] => killColons y
;   [killColons first x,:killColons rest x]
 
(DEFUN |killColons| (|x|)
  (PROG (|ISTMP#1| |ISTMP#2| |y|)
    (RETURN
     (COND ((ATOM |x|) |x|) ((AND (CONSP |x|) (EQ (CAR |x|) '|Record|)) |x|)
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Union|)) |x|)
           ((AND (CONSP |x|) (EQ (CAR |x|) '|:|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1='T))))))
            (|killColons| |y|))
           (#1# (CONS (|killColons| (CAR |x|)) (|killColons| (CDR |x|))))))))
 
; postSlash ['_/,a,b] ==
;   STRINGP a => postTran ['Reduce,INTERN a,b]
;   ['_/,postTran a,postTran b]
 
(DEFUN |postSlash| (|bfVar#49|)
  (PROG (|a| |b|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#49|)))
      (SETQ |b| (CADDR . #1#))
      (COND ((STRINGP |a|) (|postTran| (LIST '|Reduce| (INTERN |a|) |b|)))
            ('T (LIST '/ (|postTran| |a|) (|postTran| |b|))))))))
 
; removeSuperfluousMapping sig1 ==
;   --get rid of this asap
;   sig1 is [x,:y] and x is ['Mapping,:.] => [rest x,:y]
;   sig1
 
(DEFUN |removeSuperfluousMapping| (|sig1|)
  (PROG (|x| |y|)
    (RETURN
     (COND
      ((AND (CONSP |sig1|)
            (PROGN (SETQ |x| (CAR |sig1|)) (SETQ |y| (CDR |sig1|)) #1='T)
            (CONSP |x|) (EQ (CAR |x|) '|Mapping|))
       (CONS (CDR |x|) |y|))
      (#1# |sig1|)))))
 
; postType typ ==
;   typ is ["->",source,target] =>
;     source="constant" => [LIST postTran target,"constant"]
;     LIST ['Mapping,postTran target,:unTuple postTran source]
;   typ is ["->",target] => LIST ['Mapping,postTran target]
;   LIST postTran typ
 
(DEFUN |postType| (|typ|)
  (PROG (|ISTMP#1| |source| |ISTMP#2| |target|)
    (RETURN
     (COND
      ((AND (CONSP |typ|) (EQ (CAR |typ|) '->)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typ|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |source| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |target| (CAR |ISTMP#2|)) #1='T))))))
       (COND
        ((EQ |source| '|constant|)
         (LIST (LIST (|postTran| |target|)) '|constant|))
        (#1#
         (LIST
          (CONS '|Mapping|
                (CONS (|postTran| |target|)
                      (|unTuple| (|postTran| |source|))))))))
      ((AND (CONSP |typ|) (EQ (CAR |typ|) '->)
            (PROGN
             (SETQ |ISTMP#1| (CDR |typ|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |target| (CAR |ISTMP#1|)) #1#))))
       (LIST (LIST '|Mapping| (|postTran| |target|))))
      (#1# (LIST (|postTran| |typ|)))))))
 
; postTuple u ==
;   u is ["@Tuple"] => u
;   u is ["@Tuple", :l, a] => (["@Tuple", :postTranList rest u])
 
(DEFUN |postTuple| (|u|)
  (PROG (|ISTMP#1| |ISTMP#2| |a| |l|)
    (RETURN
     (COND ((AND (CONSP |u|) (EQ (CDR |u|) NIL) (EQ (CAR |u|) '|@Tuple|)) |u|)
           ((AND (CONSP |u|) (EQ (CAR |u|) '|@Tuple|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1='T)
                       (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |a| (CAR |ISTMP#2|))
                        (SETQ |l| (CDR |ISTMP#2|))
                        #1#)
                       (PROGN (SETQ |l| (NREVERSE |l|)) #1#))))
            (CONS '|@Tuple| (|postTranList| (CDR |u|))))))))
 
; postWhere ["where",a,b] ==
;   x:=
;     b is ['Block,:c] => BREAK()
;     LIST b
;   ["where",postTran a,:postTranList x]
 
(DEFUN |postWhere| (|bfVar#50|)
  (PROG (|a| |b| |c| |x|)
    (RETURN
     (PROGN
      (SETQ |a| (CADR . #1=(|bfVar#50|)))
      (SETQ |b| (CADDR . #1#))
      (SETQ |x|
              (COND
               ((AND (CONSP |b|) (EQ (CAR |b|) '|Block|)
                     (PROGN (SETQ |c| (CDR |b|)) #2='T))
                (BREAK))
               (#2# (LIST |b|))))
      (CONS '|where| (CONS (|postTran| |a|) (|postTranList| |x|)))))))
 
; postWith ["with",a] ==
;   $insidePostCategoryIfTrue: local := true
;   a:= postTran a
;   a is [op,:.] and MEMQ(op,'(SIGNATURE ATTRIBUTE IF)) => ['CATEGORY,a]
;   a is ['PROGN,:b] => ['CATEGORY,:b]
;   a
 
(DEFUN |postWith| (|bfVar#51|)
  (PROG (|$insidePostCategoryIfTrue| |b| |op| |a|)
    (DECLARE (SPECIAL |$insidePostCategoryIfTrue|))
    (RETURN
     (PROGN
      (SETQ |a| (CADR |bfVar#51|))
      (SETQ |$insidePostCategoryIfTrue| T)
      (SETQ |a| (|postTran| |a|))
      (COND
       ((AND (CONSP |a|) (PROGN (SETQ |op| (CAR |a|)) #1='T)
             (MEMQ |op| '(SIGNATURE ATTRIBUTE IF)))
        (LIST 'CATEGORY |a|))
       ((AND (CONSP |a|) (EQ (CAR |a|) 'PROGN)
             (PROGN (SETQ |b| (CDR |a|)) #1#))
        (CONS 'CATEGORY |b|))
       (#1# |a|))))))
 
; postTransformCheck x ==
;   $defOp: local:= nil
;   postcheck x
 
(DEFUN |postTransformCheck| (|x|)
  (PROG (|$defOp|)
    (DECLARE (SPECIAL |$defOp|))
    (RETURN (PROGN (SETQ |$defOp| NIL) (|postcheck| |x|)))))
 
; postcheck x ==
;   atom x => nil
;   x is ['DEF,form,[target,:.],:.] =>
;     setDefOp form
;     nil
;   x is ['QUOTE,:.] => nil
;   postcheck first x
;   postcheck rest x
 
(DEFUN |postcheck| (|x|)
  (PROG (|ISTMP#1| |form| |ISTMP#2| |ISTMP#3| |target|)
    (RETURN
     (COND ((ATOM |x|) NIL)
           ((AND (CONSP |x|) (EQ (CAR |x|) 'DEF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |form| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|)
                                   (PROGN
                                    (SETQ |target| (CAR |ISTMP#3|))
                                    #1='T))))))))
            (PROGN (|setDefOp| |form|) NIL))
           ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE)) NIL)
           (#1# (PROGN (|postcheck| (CAR |x|)) (|postcheck| (CDR |x|))))))))
 
; setDefOp f ==
;   if f is [":",g,:.] then f := g
;   f := (atom f => f; first f)
;   if $topOp then $defOp:= f else $topOp:= f
 
(DEFUN |setDefOp| (|f|)
  (PROG (|ISTMP#1| |g|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |f|) (EQ (CAR |f|) '|:|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |f|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |g| (CAR |ISTMP#1|)) #1='T))))
        (SETQ |f| |g|)))
      (SETQ |f| (COND ((ATOM |f|) |f|) (#1# (CAR |f|))))
      (COND (|$topOp| (SETQ |$defOp| |f|)) (#1# (SETQ |$topOp| |f|)))))))
 
; unTuple x ==
;   x is ["@Tuple", :y] => y
;   LIST x
 
(DEFUN |unTuple| (|x|)
  (PROG (|y|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) '|@Tuple|)
            (PROGN (SETQ |y| (CDR |x|)) #1='T))
       |y|)
      (#1# (LIST |x|))))))
