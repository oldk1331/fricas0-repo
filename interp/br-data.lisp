
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $tick := char '_`            --field separator for database files

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$tick| (|char| '|`|)))

; getConstructorForm(name) ==
;     name = 'Union   => '(Union  (_: a A) (_: b B))
;     name = 'UntaggedUnion => '(Union A B)
;     name = 'Record  => '(Record (_: a A) (_: b B))
;     name = 'Mapping => '(Mapping T S)
;     name = 'Enumeration => '(Enumeration a b)
;     get_database(name, 'CONSTRUCTORFORM)

(DEFUN |getConstructorForm| (|name|)
  (PROG ()
    (RETURN
     (COND ((EQ |name| '|Union|) '(|Union| (|:| |a| A) (|:| |b| B)))
           ((EQ |name| '|UntaggedUnion|) '(|Union| A B))
           ((EQ |name| '|Record|) '(|Record| (|:| |a| A) (|:| |b| B)))
           ((EQ |name| '|Mapping|) '(|Mapping| T S))
           ((EQ |name| '|Enumeration|) '(|Enumeration| |a| |b|))
           ('T (|get_database| |name| 'CONSTRUCTORFORM))))))

; dbInfovec(name) ==
;     'category = get_database(name, 'CONSTRUCTORKIND) => nil
;     get_database(name, 'ASHARP?) => nil
;     loadLibIfNotLoaded(name)
;     u := GET(name, 'infovec) => u

(DEFUN |dbInfovec| (|name|)
  (PROG (|u|)
    (RETURN
     (COND ((EQ '|category| (|get_database| |name| 'CONSTRUCTORKIND)) NIL)
           ((|get_database| |name| 'ASHARP?) NIL)
           ('T
            (PROGN
             (|loadLibIfNotLoaded| |name|)
             (COND ((SETQ |u| (GET |name| '|infovec|)) |u|))))))))

; extractHasArgs(pred) ==
;     x := find(pred) or return nil where find(x) ==
;         x is [op, :argl] =>
;             op = 'hasArgs => x
;             MEMQ(op, '(AND OR NOT)) => or/[find(y) for y in argl]
;             nil
;         nil
;     [rest(x), :simpBool(substitute('T, x, pred))]

(DEFUN |extractHasArgs| (|pred|)
  (PROG (|x|)
    (RETURN
     (PROGN
      (SETQ |x| (OR (|extractHasArgs,find| |pred|) (RETURN NIL)))
      (CONS (CDR |x|) (|simpBool| (|substitute| 'T |x| |pred|)))))))
(DEFUN |extractHasArgs,find| (|x|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
       (COND ((EQ |op| '|hasArgs|) |x|)
             ((MEMQ |op| '(AND OR NOT))
              ((LAMBDA (|bfVar#2| |bfVar#1| |y|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |y| (CAR |bfVar#1|)) NIL))
                    (RETURN |bfVar#2|))
                   (#1#
                    (PROGN
                     (SETQ |bfVar#2| (|extractHasArgs,find| |y|))
                     (COND (|bfVar#2| (RETURN |bfVar#2|))))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |argl| NIL))
             (#1# NIL)))
      (#1# NIL)))))

; augmentHasArgs(alist,conform) ==
;     conname := opOf(conform)
;     args := IFCDR(conform) or return alist
;     n := #args
;     [[name, :pred] for [name, :p] in alist] where pred ==
;          extractHasArgs(p) is [a,:b] => p
;          quickAnd(p, ['hasArgs,
;                       :TAKE(n, IFCDR(getConstructorForm(opOf(name))))])

(DEFUN |augmentHasArgs| (|alist| |conform|)
  (PROG (|conname| |args| |n| |name| |p| |ISTMP#1| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |args| (OR (IFCDR |conform|) (RETURN |alist|)))
      (SETQ |n| (LENGTH |args|))
      ((LAMBDA (|bfVar#5| |bfVar#4| |bfVar#3|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
            (RETURN (NREVERSE |bfVar#5|)))
           (#1='T
            (AND (CONSP |bfVar#3|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#3|))
                  (SETQ |p| (CDR |bfVar#3|))
                  #1#)
                 (SETQ |bfVar#5|
                         (CONS
                          (CONS |name|
                                (COND
                                 ((PROGN
                                   (SETQ |ISTMP#1| (|extractHasArgs| |p|))
                                   (AND (CONSP |ISTMP#1|)
                                        (PROGN
                                         (SETQ |a| (CAR |ISTMP#1|))
                                         (SETQ |b| (CDR |ISTMP#1|))
                                         #1#)))
                                  |p|)
                                 (#1#
                                  (|quickAnd| |p|
                                   (CONS '|hasArgs|
                                         (TAKE |n|
                                          (IFCDR
                                           (|getConstructorForm|
                                            (|opOf| |name|)))))))))
                          |bfVar#5|)))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       NIL |alist| NIL)))))

; evalDomainOpPred(dom, pred, preds) ==
;     u := convert_pred(dom, pred)
;     eval_pred(dom, u, preds)

(DEFUN |evalDomainOpPred| (|dom| |pred| |preds|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|convert_pred| |dom| |pred|))
      (|eval_pred| |dom| |u| |preds|)))))

; convert_pred(dom, pred) ==
;     pred = 'T => true
;     pred is [op, :argl] =>
;         op = 'AND or op = 'OR => [op, :[convert_pred(dom, x) for x in argl]]
;         op = 'NOT => ['NOT, convert_pred(dom, first(argl))]
;         op = 'has =>
;             [arg, p] := argl
;             ['HasCategory, arg, convert_cat_arg(p)]
;         systemError '"unknown predicate form"
;     systemError([])

(DEFUN |convert_pred| (|dom| |pred|)
  (PROG (|op| |argl| |arg| |p|)
    (RETURN
     (COND ((EQ |pred| 'T) T)
           ((AND (CONSP |pred|)
                 (PROGN
                  (SETQ |op| (CAR |pred|))
                  (SETQ |argl| (CDR |pred|))
                  #1='T))
            (COND
             ((OR (EQ |op| 'AND) (EQ |op| 'OR))
              (CONS |op|
                    ((LAMBDA (|bfVar#7| |bfVar#6| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#6|)
                              (PROGN (SETQ |x| (CAR |bfVar#6|)) NIL))
                          (RETURN (NREVERSE |bfVar#7|)))
                         (#1#
                          (SETQ |bfVar#7|
                                  (CONS (|convert_pred| |dom| |x|)
                                        |bfVar#7|))))
                        (SETQ |bfVar#6| (CDR |bfVar#6|))))
                     NIL |argl| NIL)))
             ((EQ |op| 'NOT) (LIST 'NOT (|convert_pred| |dom| (CAR |argl|))))
             ((EQ |op| '|has|)
              (PROGN
               (SETQ |arg| (CAR |argl|))
               (SETQ |p| (CADR |argl|))
               (LIST '|HasCategory| |arg| (|convert_cat_arg| |p|))))
             (#1# (|systemError| "unknown predicate form"))))
           (#1# (|systemError| NIL))))))

; convert_cat_arg(p) ==
;     SYMBOLP(p) and member(p, $FormalMapVariableList) => ["devaluate", p]
;     ATOM(p) or #p = 1 => MKQ(p)
;     ['LIST, MKQ(first(p)), :[convert_cat_arg(x) for x in rest p]]

(DEFUN |convert_cat_arg| (|p|)
  (PROG ()
    (RETURN
     (COND
      ((AND (SYMBOLP |p|) (|member| |p| |$FormalMapVariableList|))
       (LIST '|devaluate| |p|))
      ((OR (ATOM |p|) (EQL (LENGTH |p|) 1)) (MKQ |p|))
      (#1='T
       (CONS 'LIST
             (CONS (MKQ (CAR |p|))
                   ((LAMBDA (|bfVar#9| |bfVar#8| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#8|)
                             (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
                         (RETURN (NREVERSE |bfVar#9|)))
                        (#1#
                         (SETQ |bfVar#9|
                                 (CONS (|convert_cat_arg| |x|) |bfVar#9|))))
                       (SETQ |bfVar#8| (CDR |bfVar#8|))))
                    NIL (CDR |p|) NIL))))))))

; eval_pred(dom, pred, preds) ==
;     pred = 'T => true
;     k := POSN1(pred, preds) => testBitVector(dom.3, k + 1)
;     eval_pred1(dom, pred, preds)

(DEFUN |eval_pred| (|dom| |pred| |preds|)
  (PROG (|k|)
    (RETURN
     (COND ((EQ |pred| 'T) T)
           ((SETQ |k| (POSN1 |pred| |preds|))
            (|testBitVector| (ELT |dom| 3) (+ |k| 1)))
           ('T (|eval_pred1| |dom| |pred| |preds|))))))

; eval_pred1(dom, pred, preds) ==
;     pred is [op,:argl] =>
;         op = 'AND => "and"/[eval_pred(dom, x, preds) for x in argl]
;         op = 'OR  => "or"/[eval_pred(dom, x, preds) for x in argl]
;         op = 'NOT => not eval_pred(dom, first(argl), preds)
;         nil
;     systemError '"unknown atomic predicate form"

(DEFUN |eval_pred1| (|dom| |pred| |preds|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |pred|)
            (PROGN (SETQ |op| (CAR |pred|)) (SETQ |argl| (CDR |pred|)) #1='T))
       (COND
        ((EQ |op| 'AND)
         ((LAMBDA (|bfVar#11| |bfVar#10| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#10|) (PROGN (SETQ |x| (CAR |bfVar#10|)) NIL))
               (RETURN |bfVar#11|))
              (#1#
               (PROGN
                (SETQ |bfVar#11| (|eval_pred| |dom| |x| |preds|))
                (COND ((NOT |bfVar#11|) (RETURN NIL))))))
             (SETQ |bfVar#10| (CDR |bfVar#10|))))
          T |argl| NIL))
        ((EQ |op| 'OR)
         ((LAMBDA (|bfVar#13| |bfVar#12| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#12|) (PROGN (SETQ |x| (CAR |bfVar#12|)) NIL))
               (RETURN |bfVar#13|))
              (#1#
               (PROGN
                (SETQ |bfVar#13| (|eval_pred| |dom| |x| |preds|))
                (COND (|bfVar#13| (RETURN |bfVar#13|))))))
             (SETQ |bfVar#12| (CDR |bfVar#12|))))
          NIL |argl| NIL))
        ((EQ |op| 'NOT) (NULL (|eval_pred| |dom| (CAR |argl|) |preds|)))
        (#1# NIL)))
      (#1# (|systemError| "unknown atomic predicate form"))))))

; kFormatSlotDomain1(x, infovec) ==
;               fn(formatSlotDomain1(x, infovec)) where fn(x) ==
;     ATOM(x) => x
;     (op := first(x)) = '_% => '_%
;     op = 'local => CADR(x)
;     op = ":" => [":", CADR(x), fn(CADDR(x))]
;     MEMQ(op, $Primitives) or constructor?(op) =>
;         [fn(y) for y in x]
;     INTEGERP(op) => op
;     op = 'QUOTE and ATOM(CADR(x)) => CADR(x)
;     x

(DEFUN |kFormatSlotDomain1| (|x| |infovec|)
  (PROG ()
    (RETURN (|kFormatSlotDomain1,fn| (|formatSlotDomain1| |x| |infovec|)))))
(DEFUN |kFormatSlotDomain1,fn| (|x|)
  (PROG (|op|)
    (RETURN
     (COND ((ATOM |x|) |x|) ((EQ (SETQ |op| (CAR |x|)) '%) '%)
           ((EQ |op| '|local|) (CADR |x|))
           ((EQ |op| '|:|)
            (LIST '|:| (CADR |x|) (|kFormatSlotDomain1,fn| (CADDR |x|))))
           ((OR (MEMQ |op| |$Primitives|) (|constructor?| |op|))
            ((LAMBDA (|bfVar#15| |bfVar#14| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#14|)
                      (PROGN (SETQ |y| (CAR |bfVar#14|)) NIL))
                  (RETURN (NREVERSE |bfVar#15|)))
                 (#1='T
                  (SETQ |bfVar#15|
                          (CONS (|kFormatSlotDomain1,fn| |y|) |bfVar#15|))))
                (SETQ |bfVar#14| (CDR |bfVar#14|))))
             NIL |x| NIL))
           ((INTEGERP |op|) |op|)
           ((AND (EQ |op| 'QUOTE) (ATOM (CADR |x|))) (CADR |x|)) (#1# |x|)))))

; dbSearchOrder(conform, domname, domain) == --domain = nil or set to live domain
;     conform := domname or conform
;     name := opOf(conform)
;     infovec := dbInfovec(name) or return nil  --exit for categories
;     u := infovec.3
;     predvec :=
;         domain => domain.3
;         get_database(name, 'PREDICATES)
;     catpredvec := first(u)
;     catinfo := CADR(u)
;     catvec := CADDR(u)
;     catforms := [[pakform, :pred] for i in 0..MAXINDEX(catvec) | test ] where
;         test ==
;             p := SUBLISLIS(rest(conform), $FormalMapVariableList,
;                            kTestPred(catpredvec.i, domain, predvec))
;             if domain then p := EVAL(p)
;             pred := simpCatPredicate(p)
;             if domname and CONTAINED('%, pred) then
;                 pred := SUBST(domname, '%, pred)
;             (pak := catinfo.i) and pred   --only those with default packages
;         pakform ==
;             -- in case it has been instantiated
;             pak and not(IDENTP(pak)) => devaluate(pak)
;             catform := kFormatSlotDomain1(catvec.i, infovec)
;             res := dbSubConform(rest(conform), [pak, "%", :rest(catform)])
;             domname => SUBST(domname, '%, res)
;             res
;     [:dbAddChain(conform), :catforms]

(DEFUN |dbSearchOrder| (|conform| |domname| |domain|)
  (PROG (|name| |infovec| |u| |predvec| |catpredvec| |catinfo| |catvec| |p|
         |pred| |pak| |catform| |res| |catforms|)
    (RETURN
     (PROGN
      (SETQ |conform| (OR |domname| |conform|))
      (SETQ |name| (|opOf| |conform|))
      (SETQ |infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |u| (ELT |infovec| 3))
      (SETQ |predvec|
              (COND (|domain| (ELT |domain| 3))
                    (#1='T (|get_database| |name| 'PREDICATES))))
      (SETQ |catpredvec| (CAR |u|))
      (SETQ |catinfo| (CADR |u|))
      (SETQ |catvec| (CADDR |u|))
      (SETQ |catforms|
              ((LAMBDA (|bfVar#17| |bfVar#16| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#16|) (RETURN (NREVERSE |bfVar#17|)))
                        (#1#
                         (AND
                          (PROGN
                           (SETQ |p|
                                   (SUBLISLIS (CDR |conform|)
                                    |$FormalMapVariableList|
                                    (|kTestPred| (ELT |catpredvec| |i|)
                                     |domain| |predvec|)))
                           (COND (|domain| (SETQ |p| (EVAL |p|))))
                           (SETQ |pred| (|simpCatPredicate| |p|))
                           (COND
                            ((AND |domname| (CONTAINED '% |pred|))
                             (SETQ |pred| (SUBST |domname| '% |pred|))))
                           (AND (SETQ |pak| (ELT |catinfo| |i|)) |pred|))
                          (SETQ |bfVar#17|
                                  (CONS
                                   (CONS
                                    (COND
                                     ((AND |pak| (NULL (IDENTP |pak|)))
                                      (|devaluate| |pak|))
                                     (#1#
                                      (PROGN
                                       (SETQ |catform|
                                               (|kFormatSlotDomain1|
                                                (ELT |catvec| |i|) |infovec|))
                                       (SETQ |res|
                                               (|dbSubConform| (CDR |conform|)
                                                (CONS |pak|
                                                      (CONS '%
                                                            (CDR |catform|)))))
                                       (COND
                                        (|domname| (SUBST |domname| '% |res|))
                                        (#1# |res|)))))
                                    |pred|)
                                   |bfVar#17|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |catvec|) 0))
      (APPEND (|dbAddChain| |conform|) |catforms|)))))

; kisValidType(typeForm) ==
;     $ProcessInteractiveValue: fluid := true
;     $noEvalTypeMsg: fluid := true
;     $printTimeIfTrue : local := false
;     $printStorageIfTrue : local := false
;     $BreakMode : local := 'throw_reader
;     CATCH('SPAD_READER, CATCH('top_level, processInteractive(typeForm, nil)))
;         is [[h, :.], :t] and member(h, '(Type Category)) => t
;     false

(DEFUN |kisValidType| (|typeForm|)
  (PROG (|$BreakMode| |$printStorageIfTrue| |$printTimeIfTrue| |$noEvalTypeMsg|
         |$ProcessInteractiveValue| |t| |h| |ISTMP#2| |ISTMP#1|)
    (DECLARE
     (SPECIAL |$BreakMode| |$printStorageIfTrue| |$printTimeIfTrue|
      |$noEvalTypeMsg| |$ProcessInteractiveValue|))
    (RETURN
     (PROGN
      (SETQ |$ProcessInteractiveValue| T)
      (SETQ |$noEvalTypeMsg| T)
      (SETQ |$printTimeIfTrue| NIL)
      (SETQ |$printStorageIfTrue| NIL)
      (SETQ |$BreakMode| '|throw_reader|)
      (COND
       ((AND
         (PROGN
          (SETQ |ISTMP#1|
                  (CATCH 'SPAD_READER
                    (CATCH '|top_level|
                      (|processInteractive| |typeForm| NIL))))
          (AND (CONSP |ISTMP#1|)
               (PROGN
                (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                (AND (CONSP |ISTMP#2|)
                     (PROGN (SETQ |h| (CAR |ISTMP#2|)) #1='T)))
               (PROGN (SETQ |t| (CDR |ISTMP#1|)) #1#)))
         (|member| |h| '(|Type| |Category|)))
        |t|)
       (#1# NIL))))))

; parseNoMacroFromString(s) ==
;     s := next(function ncloopParse,
;               next(function lineoftoks, incString(s)))
;     StreamNull(s) => nil
;     pf2Sex(first(rest(first(s))))

(DEFUN |parseNoMacroFromString| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |s|
              (|next| #'|ncloopParse|
               (|next| #'|lineoftoks| (|incString| |s|))))
      (COND ((|StreamNull| |s|) NIL) ('T (|pf2Sex| (CAR (CDR (CAR |s|))))))))))

; mkConform(kind, name, argString) ==
;     kind ~= '"default package" =>
;         form := STRCONC(name, argString)
;         parse := parseNoMacroFromString(form)
;         null(parse) =>
;             sayBrightlyNT '"Won't parse: "
;             pp(form)
;             systemError('"Keywords in argument list?")
;         ATOM(parse) => [parse]
;         parse
;     -- & case
;     [INTERN(name), :rest(ncParseFromString(STRCONC(char('d), argString)))]

(DEFUN |mkConform| (|kind| |name| |argString|)
  (PROG (|form| |parse|)
    (RETURN
     (COND
      ((NOT (EQUAL |kind| "default package"))
       (PROGN
        (SETQ |form| (STRCONC |name| |argString|))
        (SETQ |parse| (|parseNoMacroFromString| |form|))
        (COND
         ((NULL |parse|)
          (PROGN
           (|sayBrightlyNT| "Won't parse: ")
           (|pp| |form|)
           (|systemError| "Keywords in argument list?")))
         ((ATOM |parse|) (LIST |parse|)) (#1='T |parse|))))
      (#1#
       (CONS (INTERN |name|)
             (CDR
              (|ncParseFromString| (STRCONC (|char| '|d|) |argString|)))))))))

; kTestPred(n, dom, preds) ==
;     n = 0 => true
;     dom => testBitVector(preds, n)
;     simpHasPred(preds.(n - 1))

(DEFUN |kTestPred| (|n| |dom| |preds|)
  (PROG ()
    (RETURN
     (COND ((EQL |n| 0) T) (|dom| (|testBitVector| |preds| |n|))
           ('T (|simpHasPred| (ELT |preds| (- |n| 1))))))))

; dbAddChainDomain(conform) ==
;     [name, :args] := conform
;     infovec := dbInfovec(name) or return nil  --exit for categories
;     template := infovec.0
;     null(form := template.5) => nil
;     dbSubConform(args, kFormatSlotDomain1(devaluate(form), infovec))

(DEFUN |dbAddChainDomain| (|conform|)
  (PROG (|name| |args| |infovec| |template| |form|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |template| (ELT |infovec| 0))
      (COND ((NULL (SETQ |form| (ELT |template| 5))) NIL)
            ('T
             (|dbSubConform| |args|
              (|kFormatSlotDomain1| (|devaluate| |form|) |infovec|))))))))

; dbSubConform(args, u) ==
;     ATOM(u) =>
;         (n := position(u,$FormalMapVariableList)) >= 0 => args.n
;         u
;     u is ['local, y] => dbSubConform(args, y)
;     [dbSubConform(args,x) for x in u]

(DEFUN |dbSubConform| (|args| |u|)
  (PROG (|n| |ISTMP#1| |y|)
    (RETURN
     (COND
      ((ATOM |u|)
       (COND
        ((NOT (MINUSP (SETQ |n| (|position| |u| |$FormalMapVariableList|))))
         (ELT |args| |n|))
        (#1='T |u|)))
      ((AND (CONSP |u|) (EQ (CAR |u|) '|local|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#))))
       (|dbSubConform| |args| |y|))
      (#1#
       ((LAMBDA (|bfVar#19| |bfVar#18| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#18|) (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
             (RETURN (NREVERSE |bfVar#19|)))
            (#1#
             (SETQ |bfVar#19| (CONS (|dbSubConform| |args| |x|) |bfVar#19|))))
           (SETQ |bfVar#18| (CDR |bfVar#18|))))
        NIL |u| NIL))))))

; dbAddChain(conform) ==
;     u := dbAddChainDomain(conform) =>
;         ATOM(u) => nil
;         [[u, :true], :dbAddChain(u)]
;     nil

(DEFUN |dbAddChain| (|conform|)
  (PROG (|u|)
    (RETURN
     (COND
      ((SETQ |u| (|dbAddChainDomain| |conform|))
       (COND ((ATOM |u|) NIL) (#1='T (CONS (CONS |u| T) (|dbAddChain| |u|)))))
      (#1# NIL)))))

; buildLibdb(domainList) ==  --called by make-databases (daase.lisp)
;   $OpLst: local := nil
;   $AttrLst: local := nil
;   $DomLst : local := nil
;   $CatLst : local := nil
;   $PakLst : local := nil
;   $DefLst : local := nil
;   $outStream : local := MAKE_OUTSTREAM('"temp.text")
;   --build local libdb if list of domains is given
;   if null domainList then
;     comments :=
;       '"\spad{Union(A,B,...,C)} is a primitive type in FriCAS used to represent objects of type \spad{A} or of type \spad{B} or...or of type \spad{C}."
;     writedb
;       buildLibdbString ['"dUnion",1,'"x",'"special",'"(A,B,...,C)",'UNION,comments]
;     comments :=
;       '"\spad{Record(a:A,b:B,...,c:C)} is a primitive type in FriCAS used to represent composite objects made up of objects of type \spad{A}, \spad{B},..., \spad{C} which are indexed by _"keys_" (identifiers) \spad{a},\spad{b},...,\spad{c}."
;     writedb
;       buildLibdbString ['"dRecord",1,'"x",'"special",'"(a:A,b:B,...,c:C)",'RECORD,comments]
;     comments :=
;       '"\spad{Mapping(T,S)} is a primitive type in FriCAS used to represent mappings from source type \spad{S} to target type \spad{T}. Similarly, \spad{Mapping(T,A,B)} denotes a mapping from source type \spad{(A,B)} to target type \spad{T}."
;     writedb
;       buildLibdbString ['"dMapping",1,'"x",'"special",'"(T,S)",'MAPPING,comments]
;     comments :=
;       '"\spad{Enumeration(a,b,...,c)} is a primitive type in FriCAS used to represent the object composed of the symbols \spad{a},\spad{b},..., and \spad{c}."
;     writedb
;       buildLibdbString ['"dEnumeration",1,'"x",'"special",'"(a,b,...,c)",'ENUM,comments]
;   $conname: local := nil
;   $conform: local := nil
;   $exposed?:local := nil
;   $doc:     local := nil
;   $kind:    local := nil
;   constructorList := domainList or allConstructors()
;   for con in constructorList repeat
;     writedb buildLibdbConEntry con
;     [., :oplist] := getConstructorExports($conform, false)
;     buildLibOps oplist
;   CLOSE($outStream)
;   domainList => 'done         --leave new database in temp.text
;   -- FIXME: This is confusing: result is in olibdb.text,
;   -- but this is expected by save_browser_data
;   run_shell_command '"sort temp.text -o olibdb.text"
;   delete_file('"temp.text")

(DEFUN |buildLibdb| (|domainList|)
  (PROG (|$kind| |$doc| |$exposed?| |$conform| |$conname| |$outStream|
         |$DefLst| |$PakLst| |$CatLst| |$DomLst| |$AttrLst| |$OpLst| |oplist|
         |LETTMP#1| |constructorList| |comments|)
    (DECLARE
     (SPECIAL |$kind| |$doc| |$exposed?| |$conform| |$conname| |$outStream|
      |$DefLst| |$PakLst| |$CatLst| |$DomLst| |$AttrLst| |$OpLst|))
    (RETURN
     (PROGN
      (SETQ |$OpLst| NIL)
      (SETQ |$AttrLst| NIL)
      (SETQ |$DomLst| NIL)
      (SETQ |$CatLst| NIL)
      (SETQ |$PakLst| NIL)
      (SETQ |$DefLst| NIL)
      (SETQ |$outStream| (MAKE_OUTSTREAM "temp.text"))
      (COND
       ((NULL |domainList|)
        (SETQ |comments|
                "\\spad{Union(A,B,...,C)} is a primitive type in FriCAS used to represent objects of type \\spad{A} or of type \\spad{B} or...or of type \\spad{C}.")
        (|writedb|
         (|buildLibdbString|
          (LIST "dUnion" 1 "x" "special" "(A,B,...,C)" 'UNION |comments|)))
        (SETQ |comments|
                "\\spad{Record(a:A,b:B,...,c:C)} is a primitive type in FriCAS used to represent composite objects made up of objects of type \\spad{A}, \\spad{B},..., \\spad{C} which are indexed by \"keys\" (identifiers) \\spad{a},\\spad{b},...,\\spad{c}.")
        (|writedb|
         (|buildLibdbString|
          (LIST "dRecord" 1 "x" "special" "(a:A,b:B,...,c:C)" 'RECORD
                |comments|)))
        (SETQ |comments|
                "\\spad{Mapping(T,S)} is a primitive type in FriCAS used to represent mappings from source type \\spad{S} to target type \\spad{T}. Similarly, \\spad{Mapping(T,A,B)} denotes a mapping from source type \\spad{(A,B)} to target type \\spad{T}.")
        (|writedb|
         (|buildLibdbString|
          (LIST "dMapping" 1 "x" "special" "(T,S)" 'MAPPING |comments|)))
        (SETQ |comments|
                "\\spad{Enumeration(a,b,...,c)} is a primitive type in FriCAS used to represent the object composed of the symbols \\spad{a},\\spad{b},..., and \\spad{c}.")
        (|writedb|
         (|buildLibdbString|
          (LIST "dEnumeration" 1 "x" "special" "(a,b,...,c)" 'ENUM
                |comments|)))))
      (SETQ |$conname| NIL)
      (SETQ |$conform| NIL)
      (SETQ |$exposed?| NIL)
      (SETQ |$doc| NIL)
      (SETQ |$kind| NIL)
      (SETQ |constructorList| (OR |domainList| (|allConstructors|)))
      ((LAMBDA (|bfVar#20| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#20|) (PROGN (SETQ |con| (CAR |bfVar#20|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (|writedb| (|buildLibdbConEntry| |con|))
             (SETQ |LETTMP#1| (|getConstructorExports| |$conform| NIL))
             (SETQ |oplist| (CDR |LETTMP#1|))
             (|buildLibOps| |oplist|))))
          (SETQ |bfVar#20| (CDR |bfVar#20|))))
       |constructorList| NIL)
      (CLOSE |$outStream|)
      (COND (|domainList| '|done|)
            (#1#
             (PROGN
              (|run_shell_command| "sort temp.text -o olibdb.text")
              (|delete_file| "temp.text"))))))))

; buildLibdbConEntry conname ==
;     NULL(get_database(conname, 'CONSTRUCTORMODEMAP)) => nil
;     abb := get_database(conname, 'ABBREVIATION)
;     $conname := conname
;     -- hack for Category,..
;     conform := get_database(conname, 'CONSTRUCTORFORM) or [conname]
;     $conform := dbMkForm SUBST('T,"T$",conform)
;     null $conform => nil
;     $exposed? := (isExposedConstructor conname => '"x"; '"n")
;     $doc      := get_database(conname, 'DOCUMENTATION)
;     pname := PNAME conname
;     kind  := get_database(conname, 'CONSTRUCTORKIND)
;     if kind = 'domain
;       and get_database(conname, 'CONSTRUCTORMODEMAP) is [[., t, :.], :.]
;        and t is ['CATEGORY,'package,:.] then kind := 'package
;     $kind :=
;       pname.(MAXINDEX pname) = char '_& => 'x
;       DOWNCASE (PNAME kind).0
;     argl := rest $conform
;     conComments :=
;       LASSOC('constructor,$doc) is [[=nil,:r]] => libdbTrim concatWithBlanks r
;       '""
;     argpart:= SUBSTRING(form2HtString ['f,:argl],1,nil)
;     sigpart:= libConstructorSig $conform
;     header := STRCONC($kind,PNAME conname)
;     buildLibdbString [header,#argl,$exposed?,sigpart,argpart,abb,conComments]

(DEFUN |buildLibdbConEntry| (|conname|)
  (PROG (|abb| |conform| |pname| |kind| |ISTMP#1| |ISTMP#2| |ISTMP#3| |t|
         |argl| |r| |conComments| |argpart| |sigpart| |header|)
    (RETURN
     (COND ((NULL (|get_database| |conname| 'CONSTRUCTORMODEMAP)) NIL)
           (#1='T
            (PROGN
             (SETQ |abb| (|get_database| |conname| 'ABBREVIATION))
             (SETQ |$conname| |conname|)
             (SETQ |conform|
                     (OR (|get_database| |conname| 'CONSTRUCTORFORM)
                         (LIST |conname|)))
             (SETQ |$conform| (|dbMkForm| (SUBST 'T 'T$ |conform|)))
             (COND ((NULL |$conform|) NIL)
                   (#1#
                    (PROGN
                     (SETQ |$exposed?|
                             (COND ((|isExposedConstructor| |conname|) "x")
                                   (#1# "n")))
                     (SETQ |$doc| (|get_database| |conname| 'DOCUMENTATION))
                     (SETQ |pname| (PNAME |conname|))
                     (SETQ |kind| (|get_database| |conname| 'CONSTRUCTORKIND))
                     (COND
                      ((AND (EQ |kind| '|domain|)
                            (PROGN
                             (SETQ |ISTMP#1|
                                     (|get_database| |conname|
                                      'CONSTRUCTORMODEMAP))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (PROGN
                                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                         (AND (CONSP |ISTMP#3|)
                                              (PROGN
                                               (SETQ |t| (CAR |ISTMP#3|))
                                               #1#)))))))
                            (CONSP |t|) (EQ (CAR |t|) 'CATEGORY)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |t|))
                             (AND (CONSP |ISTMP#1|)
                                  (EQ (CAR |ISTMP#1|) '|package|))))
                       (SETQ |kind| '|package|)))
                     (SETQ |$kind|
                             (COND
                              ((EQUAL (ELT |pname| (MAXINDEX |pname|))
                                      (|char| '&))
                               '|x|)
                              (#1# (DOWNCASE (ELT (PNAME |kind|) 0)))))
                     (SETQ |argl| (CDR |$conform|))
                     (SETQ |conComments|
                             (COND
                              ((PROGN
                                (SETQ |ISTMP#1| (LASSOC '|constructor| |$doc|))
                                (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                     (PROGN
                                      (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                      (AND (CONSP |ISTMP#2|)
                                           (EQUAL (CAR |ISTMP#2|) NIL)
                                           (PROGN
                                            (SETQ |r| (CDR |ISTMP#2|))
                                            #1#)))))
                               (|libdbTrim| (|concatWithBlanks| |r|)))
                              (#1# "")))
                     (SETQ |argpart|
                             (SUBSTRING (|form2HtString| (CONS '|f| |argl|)) 1
                                        NIL))
                     (SETQ |sigpart| (|libConstructorSig| |$conform|))
                     (SETQ |header| (STRCONC |$kind| (PNAME |conname|)))
                     (|buildLibdbString|
                      (LIST |header| (LENGTH |argl|) |$exposed?| |sigpart|
                            |argpart| |abb| |conComments|)))))))))))

; dbMkForm x == atom x and [x] or x

(DEFUN |dbMkForm| (|x|) (PROG () (RETURN (OR (AND (ATOM |x|) (LIST |x|)) |x|))))

; buildLibdbString [x,:u] ==
;   STRCONC(STRINGIMAGE x,"STRCONC"/[STRCONC('"`",STRINGIMAGE y) for y in u])

(DEFUN |buildLibdbString| (|bfVar#23|)
  (PROG (|x| |u|)
    (RETURN
     (PROGN
      (SETQ |x| (CAR |bfVar#23|))
      (SETQ |u| (CDR |bfVar#23|))
      (STRCONC (STRINGIMAGE |x|)
       ((LAMBDA (|bfVar#22| |bfVar#21| |y|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#21|) (PROGN (SETQ |y| (CAR |bfVar#21|)) NIL))
             (RETURN |bfVar#22|))
            ('T
             (SETQ |bfVar#22|
                     (STRCONC |bfVar#22| (STRCONC "`" (STRINGIMAGE |y|))))))
           (SETQ |bfVar#21| (CDR |bfVar#21|))))
        "" |u| NIL))))))

; libConstructorSig [conname,:argl] ==
;   [[., :sig], :.] := get_database(conname, 'CONSTRUCTORMODEMAP)
;   formals := TAKE(#argl,$FormalMapVariableList)
;   sig := SUBLISLIS(formals,$TriangleVariableList,sig)
;   keys := [g(f,sig,i) for f in formals for i in 1..] where
;     g(x,u,i) ==  --does x appear in any but i-th element of u?
;       or/[CONTAINED(x,y) for y in u for j in 1.. | j ~= i]
;   sig := fn SUBLISLIS(argl,$FormalMapVariableList,sig) where
;     fn x ==
;       atom x => x
;       x is ['Join,a,:r] => ['Join,fn a,'etc]
;       x is ['CATEGORY,:.] => 'etc
;       [fn y for y in x]
;   sig := [first sig,:[(k => [":",a,s]; s)
;             for a in argl for s in rest sig for k in keys]]
;   sigpart:= form2LispString ['Mapping,:sig]
;   if null ncParseFromString sigpart then
;     sayBrightly ['"Won't parse: ",sigpart]
;   sigpart

(DEFUN |libConstructorSig| (|bfVar#34|)
  (PROG (|conname| |argl| |LETTMP#1| |sig| |formals| |keys| |sigpart|)
    (RETURN
     (PROGN
      (SETQ |conname| (CAR |bfVar#34|))
      (SETQ |argl| (CDR |bfVar#34|))
      (SETQ |LETTMP#1| (|get_database| |conname| 'CONSTRUCTORMODEMAP))
      (SETQ |sig| (CDAR |LETTMP#1|))
      (SETQ |formals| (TAKE (LENGTH |argl|) |$FormalMapVariableList|))
      (SETQ |sig| (SUBLISLIS |formals| |$TriangleVariableList| |sig|))
      (SETQ |keys|
              ((LAMBDA (|bfVar#25| |bfVar#24| |f| |i|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#24|)
                        (PROGN (SETQ |f| (CAR |bfVar#24|)) NIL))
                    (RETURN (NREVERSE |bfVar#25|)))
                   (#1='T
                    (SETQ |bfVar#25|
                            (CONS (|libConstructorSig,g| |f| |sig| |i|)
                                  |bfVar#25|))))
                  (SETQ |bfVar#24| (CDR |bfVar#24|))
                  (SETQ |i| (+ |i| 1))))
               NIL |formals| NIL 1))
      (SETQ |sig|
              (|libConstructorSig,fn|
               (SUBLISLIS |argl| |$FormalMapVariableList| |sig|)))
      (SETQ |sig|
              (CONS (CAR |sig|)
                    ((LAMBDA
                         (|bfVar#33| |bfVar#30| |a| |bfVar#31| |s| |bfVar#32|
                          |k|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#30|)
                              (PROGN (SETQ |a| (CAR |bfVar#30|)) NIL)
                              (ATOM |bfVar#31|)
                              (PROGN (SETQ |s| (CAR |bfVar#31|)) NIL)
                              (ATOM |bfVar#32|)
                              (PROGN (SETQ |k| (CAR |bfVar#32|)) NIL))
                          (RETURN (NREVERSE |bfVar#33|)))
                         (#1#
                          (SETQ |bfVar#33|
                                  (CONS
                                   (COND (|k| (LIST '|:| |a| |s|)) (#1# |s|))
                                   |bfVar#33|))))
                        (SETQ |bfVar#30| (CDR |bfVar#30|))
                        (SETQ |bfVar#31| (CDR |bfVar#31|))
                        (SETQ |bfVar#32| (CDR |bfVar#32|))))
                     NIL |argl| NIL (CDR |sig|) NIL |keys| NIL)))
      (SETQ |sigpart| (|form2LispString| (CONS '|Mapping| |sig|)))
      (COND
       ((NULL (|ncParseFromString| |sigpart|))
        (|sayBrightly| (LIST "Won't parse: " |sigpart|))))
      |sigpart|))))
(DEFUN |libConstructorSig,fn| (|x|)
  (PROG (|ISTMP#1| |a| |r|)
    (RETURN
     (COND ((ATOM |x|) |x|)
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Join|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |a| (CAR |ISTMP#1|))
                        (SETQ |r| (CDR |ISTMP#1|))
                        #1='T))))
            (LIST '|Join| (|libConstructorSig,fn| |a|) '|etc|))
           ((AND (CONSP |x|) (EQ (CAR |x|) 'CATEGORY)) '|etc|)
           (#1#
            ((LAMBDA (|bfVar#29| |bfVar#28| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#28|)
                      (PROGN (SETQ |y| (CAR |bfVar#28|)) NIL))
                  (RETURN (NREVERSE |bfVar#29|)))
                 (#1#
                  (SETQ |bfVar#29|
                          (CONS (|libConstructorSig,fn| |y|) |bfVar#29|))))
                (SETQ |bfVar#28| (CDR |bfVar#28|))))
             NIL |x| NIL))))))
(DEFUN |libConstructorSig,g| (|x| |u| |i|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#27| |bfVar#26| |y| |j|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#26|) (PROGN (SETQ |y| (CAR |bfVar#26|)) NIL))
           (RETURN |bfVar#27|))
          ('T
           (AND (NOT (EQUAL |j| |i|))
                (PROGN
                 (SETQ |bfVar#27| (CONTAINED |x| |y|))
                 (COND (|bfVar#27| (RETURN |bfVar#27|)))))))
         (SETQ |bfVar#26| (CDR |bfVar#26|))
         (SETQ |j| (+ |j| 1))))
      NIL |u| NIL 1))))

; concatWithBlanks r ==
;   r is [head,:tail] =>
;     tail => STRCONC(head,'" ",concatWithBlanks tail)
;     head
;   '""

(DEFUN |concatWithBlanks| (|r|)
  (PROG (|head| |tail|)
    (RETURN
     (COND
      ((AND (CONSP |r|)
            (PROGN (SETQ |head| (CAR |r|)) (SETQ |tail| (CDR |r|)) #1='T))
       (COND (|tail| (STRCONC |head| " " (|concatWithBlanks| |tail|)))
             (#1# |head|)))
      (#1# "")))))

; writedb(u) ==
;   not STRINGP u => nil        --skip if not a string
;   PRINTEXP(u, $outStream)
;   TERPRI $outStream

(DEFUN |writedb| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL (STRINGP |u|)) NIL)
           ('T (PROGN (PRINTEXP |u| |$outStream|) (TERPRI |$outStream|)))))))

; buildLibOps oplist == for [op,sig,:pred] in oplist repeat buildLibOp(op,sig,pred)

(DEFUN |buildLibOps| (|oplist|)
  (PROG (|op| |ISTMP#1| |sig| |pred|)
    (RETURN
     ((LAMBDA (|bfVar#36| |bfVar#35|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#36|)
               (PROGN (SETQ |bfVar#35| (CAR |bfVar#36|)) NIL))
           (RETURN NIL))
          (#1='T
           (AND (CONSP |bfVar#35|)
                (PROGN
                 (SETQ |op| (CAR |bfVar#35|))
                 (SETQ |ISTMP#1| (CDR |bfVar#35|))
                 (AND (CONSP |ISTMP#1|)
                      (PROGN
                       (SETQ |sig| (CAR |ISTMP#1|))
                       (SETQ |pred| (CDR |ISTMP#1|))
                       #1#)))
                (|buildLibOp| |op| |sig| |pred|))))
         (SETQ |bfVar#36| (CDR |bfVar#36|))))
      |oplist| NIL))))

; buildLibOp(op,sig,pred) ==
; --operations      OKop  \#\sig \conname\pred\comments (K is U or C)
;   nsig := SUBLISLIS(rest $conform,$FormalMapVariableList,sig)
;   pred := SUBLISLIS(rest $conform,$FormalMapVariableList,pred)
;   nsig := SUBST('T,"T$",nsig)   --this ancient artifact causes troubles!
;   pred := SUBST('T,"T$",pred)
;   sigpart:= form2LispString ['Mapping,:nsig]
;   predString := (pred = 'T => '""; form2LispString pred)
;   sop := STRINGIMAGE(op)
;   header := STRCONC('"o",sop)
;   conform:= STRCONC($kind,form2LispString $conform)
;   comments:= libdbTrim concatWithBlanks LASSOC(sig,LASSOC(op,$doc))
;   checkCommentsForBraces('operation,sop,sigpart,comments)
;   writedb
;     buildLibdbString [header,# rest sig,$exposed?,sigpart,conform,predString,comments]

(DEFUN |buildLibOp| (|op| |sig| |pred|)
  (PROG (|nsig| |sigpart| |predString| |sop| |header| |conform| |comments|)
    (RETURN
     (PROGN
      (SETQ |nsig| (SUBLISLIS (CDR |$conform|) |$FormalMapVariableList| |sig|))
      (SETQ |pred|
              (SUBLISLIS (CDR |$conform|) |$FormalMapVariableList| |pred|))
      (SETQ |nsig| (SUBST 'T 'T$ |nsig|))
      (SETQ |pred| (SUBST 'T 'T$ |pred|))
      (SETQ |sigpart| (|form2LispString| (CONS '|Mapping| |nsig|)))
      (SETQ |predString|
              (COND ((EQ |pred| 'T) "") ('T (|form2LispString| |pred|))))
      (SETQ |sop| (STRINGIMAGE |op|))
      (SETQ |header| (STRCONC "o" |sop|))
      (SETQ |conform| (STRCONC |$kind| (|form2LispString| |$conform|)))
      (SETQ |comments|
              (|libdbTrim|
               (|concatWithBlanks| (LASSOC |sig| (LASSOC |op| |$doc|)))))
      (|checkCommentsForBraces| '|operation| |sop| |sigpart| |comments|)
      (|writedb|
       (|buildLibdbString|
        (LIST |header| (LENGTH (CDR |sig|)) |$exposed?| |sigpart| |conform|
              |predString| |comments|)))))))

; libdbTrim s ==
;   k := MAXINDEX s
;   k < 0 => s
;   for i in 0..k repeat
;     s.i = $Newline => SETELT(s,i,char '_ )
;   trimString s

(DEFUN |libdbTrim| (|s|)
  (PROG (|k|)
    (RETURN
     (PROGN
      (SETQ |k| (MAXINDEX |s|))
      (COND ((MINUSP |k|) |s|)
            (#1='T
             (PROGN
              ((LAMBDA (|i|)
                 (LOOP
                  (COND ((> |i| |k|) (RETURN NIL))
                        (#1#
                         (COND
                          ((EQUAL (ELT |s| |i|) |$Newline|)
                           (IDENTITY (SETELT |s| |i| (|char| '| |)))))))
                  (SETQ |i| (+ |i| 1))))
               0)
              (|trimString| |s|))))))))

; checkCommentsForBraces(kind,sop,sigpart,comments) ==
;   count := 0
;   for i in 0..MAXINDEX comments repeat
;     c := comments.i
;     c = char '_{ => count := count + 1
;     c = char '_} =>
;       count := count - 1
;       count < 0 => missingLeft := true
;   if count < 0 or missingLeft then
;     tail :=
;       kind = 'attribute => [sop,'"(",sigpart,'")"]
;       [sop,'": ",sigpart]
;     sayBrightly ['"(",$conname,'" documentation) missing left brace--> ",:tail]
;   if count > 0 then
;     sayBrightly ['"(",$conname,'" documentation) missing right brace--> ",:tail]
;   if count ~= 0 or missingLeft then pp comments

(DEFUN |checkCommentsForBraces| (|kind| |sop| |sigpart| |comments|)
  (PROG (|count| |c| |missingLeft| |tail|)
    (RETURN
     (PROGN
      (SETQ |count| 0)
      ((LAMBDA (|bfVar#37| |i|)
         (LOOP
          (COND ((> |i| |bfVar#37|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |c| (ELT |comments| |i|))
                  (COND ((EQUAL |c| (|char| '{)) (SETQ |count| (+ |count| 1)))
                        ((EQUAL |c| (|char| '}))
                         (PROGN
                          (SETQ |count| (- |count| 1))
                          (COND
                           ((MINUSP |count|) (SETQ |missingLeft| T)))))))))
          (SETQ |i| (+ |i| 1))))
       (MAXINDEX |comments|) 0)
      (COND
       ((OR (MINUSP |count|) |missingLeft|)
        (SETQ |tail|
                (COND ((EQ |kind| '|attribute|) (LIST |sop| "(" |sigpart| ")"))
                      (#1# (LIST |sop| ": " |sigpart|))))
        (|sayBrightly|
         (CONS "("
               (CONS |$conname|
                     (CONS " documentation) missing left brace--> "
                           |tail|))))))
      (COND
       ((< 0 |count|)
        (|sayBrightly|
         (CONS "("
               (CONS |$conname|
                     (CONS " documentation) missing right brace--> "
                           |tail|))))))
      (COND ((OR (NOT (EQL |count| 0)) |missingLeft|) (|pp| |comments|)))))))

; dbHasExamplePage conname ==
;   sname    := STRINGIMAGE conname
;   abb      := constructor? conname
;   ucname   := UPCASE STRINGIMAGE abb
;   pathname :=STRCONC($spadroot, '"/share/hypertex/pages/", ucname, '".ht")
;   fricas_probe_file(pathname) => INTERN STRCONC(sname,'"XmpPage")
;   nil

(DEFUN |dbHasExamplePage| (|conname|)
  (PROG (|sname| |abb| |ucname| |pathname|)
    (RETURN
     (PROGN
      (SETQ |sname| (STRINGIMAGE |conname|))
      (SETQ |abb| (|constructor?| |conname|))
      (SETQ |ucname| (UPCASE (STRINGIMAGE |abb|)))
      (SETQ |pathname|
              (STRCONC |$spadroot| "/share/hypertex/pages/" |ucname| ".ht"))
      (COND
       ((|fricas_probe_file| |pathname|) (INTERN (STRCONC |sname| "XmpPage")))
       ('T NIL))))))

; dbReadComments(n) ==
;   n = 0 => '""
;   instream := MAKE_INSTREAM(STRCONC($spadroot, '"/algebra/comdb.text"))
;   FILE_-POSITION(instream,n)
;   line := read_line instream
;   k := dbTickIndex(line,1,1)
;   line := SUBSTRING(line,k + 1,nil)
;   CLOSE(instream)
;   line

(DEFUN |dbReadComments| (|n|)
  (PROG (|instream| |line| |k|)
    (RETURN
     (COND ((EQL |n| 0) "")
           ('T
            (PROGN
             (SETQ |instream|
                     (MAKE_INSTREAM
                      (STRCONC |$spadroot| "/algebra/comdb.text")))
             (FILE-POSITION |instream| |n|)
             (SETQ |line| (|read_line| |instream|))
             (SETQ |k| (|dbTickIndex| |line| 1 1))
             (SETQ |line| (SUBSTRING |line| (+ |k| 1) NIL))
             (CLOSE |instream|)
             |line|))))))

; dbSplitLibdb() ==
;   instream := MAKE_INSTREAM('"olibdb.text")
;   outstream := MAKE_OUTSTREAM('"libdb.text")
;   comstream := MAKE_OUTSTREAM('"comdb.text")
;   PRINTEXP(0,    comstream)
;   PRINTEXP($tick,comstream)
;   PRINTEXP('"",  comstream)
;   TERPRI(comstream)
;   while (line := read_line(instream)) repeat
;         outP := FILE_-POSITION(outstream)
;         comP := FILE_-POSITION(comstream)
;         [prefix, comments] := dbSplit(line, 6, 1)
;         PRINTEXP(prefix, outstream)
;         PRINTEXP($tick, outstream)
;         comments = '"" =>
;             PRINTEXP(0, outstream)
;             TERPRI(outstream)
;         PRINTEXP(comP, outstream)
;         TERPRI(outstream)
;         PRINTEXP(outP, comstream)
;         PRINTEXP($tick, comstream)
;         PRINTEXP(comments, comstream)
;         TERPRI(comstream)
;   CLOSE(instream)
;   CLOSE(outstream)
;   CLOSE(comstream)
;   delete_file('"olibdb.text")

(DEFUN |dbSplitLibdb| ()
  (PROG (|comments| |prefix| |LETTMP#1| |comP| |outP| |line| |comstream|
         |outstream| |instream|)
    (RETURN
     (PROGN
      (SETQ |instream| (MAKE_INSTREAM "olibdb.text"))
      (SETQ |outstream| (MAKE_OUTSTREAM "libdb.text"))
      (SETQ |comstream| (MAKE_OUTSTREAM "comdb.text"))
      (PRINTEXP 0 |comstream|)
      (PRINTEXP |$tick| |comstream|)
      (PRINTEXP "" |comstream|)
      (TERPRI |comstream|)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (SETQ |line| (|read_line| |instream|))) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |outP| (FILE-POSITION |outstream|))
                  (SETQ |comP| (FILE-POSITION |comstream|))
                  (SETQ |LETTMP#1| (|dbSplit| |line| 6 1))
                  (SETQ |prefix| (CAR |LETTMP#1|))
                  (SETQ |comments| (CADR |LETTMP#1|))
                  (PRINTEXP |prefix| |outstream|)
                  (PRINTEXP |$tick| |outstream|)
                  (COND
                   ((EQUAL |comments| "")
                    (PROGN (PRINTEXP 0 |outstream|) (TERPRI |outstream|)))
                   (#1#
                    (PROGN
                     (PRINTEXP |comP| |outstream|)
                     (TERPRI |outstream|)
                     (PRINTEXP |outP| |comstream|)
                     (PRINTEXP |$tick| |comstream|)
                     (PRINTEXP |comments| |comstream|)
                     (TERPRI |comstream|))))))))))
      (CLOSE |instream|)
      (CLOSE |outstream|)
      (CLOSE |comstream|)
      (|delete_file| "olibdb.text")))))

; dbSplit(line,n,k) ==
;   k := charPosition($tick,line,k + 1)
;   n = 1 => [SUBSTRING(line, 0, k), SUBSTRING(line, k + 1, nil)]
;   dbSplit(line,n - 1,k)

(DEFUN |dbSplit| (|line| |n| |k|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |k| (|charPosition| |$tick| |line| (+ |k| 1)))
      (COND
       ((EQL |n| 1)
        (LIST (SUBSTRING |line| 0 |k|) (SUBSTRING |line| (+ |k| 1) NIL)))
       ('T (|dbSplit| |line| (- |n| 1) |k|)))))))

; buildGloss() ==  --called by buildDatabase (database.boot)
; --starting with gloss.text, build glosskey.text and glossdef.text
;   $constructorName : local := nil
;   $exposeFlag : local := true
;   $x : local := nil
;   $attribute? : local := true     --do not surround first word
;   pathname := '"gloss.text"
;   instream := MAKE_INSTREAM(pathname)
;   keypath  := '"glosskey.text"
;   maybe_delete_file(keypath)
;   outstream := MAKE_OUTSTREAM(keypath)
;   htpath   := '"gloss.ht"
;   maybe_delete_file(htpath)
;   htstream := MAKE_OUTSTREAM(htpath)
;   defpath  := '"glossdef.text"
;   defstream := MAKE_OUTSTREAM(defpath)
;   pairs := getGlossLines instream
;   PRINTEXP('"\begin{page}{GlossaryPage}{G l o s s a r y}\beginscroll\beginmenu",htstream)
;   for [name,:line] in pairs repeat
;     outP  := FILE_-POSITION outstream
;     defP  := FILE_-POSITION defstream
;     n_line := transformAndRecheckComments(name,[line])
;     PRINTEXP(name, outstream)
;     PRINTEXP($tick,outstream)
;     PRINTEXP(defP, outstream)
;     TERPRI(outstream)
;     PRINTEXP('"\item\newline{\em \menuitemstyle{}}{\em ",htstream)
;     PRINTEXP(name,        htstream)
;     PRINTEXP('"}\space{}",htstream)
;     TERPRI(htstream)
;     PRINTEXP(outP, defstream)
;     PRINTEXP($tick,defstream)
;     PRINTEXP(n_line, defstream)
;     TERPRI defstream
;     PRINTEXP(n_line, htstream)
;     TERPRI htstream
;   PRINTEXP('"\endmenu\endscroll",htstream)
;   PRINTEXP('"\lispdownlink{Search}{(|htGloss| _"\stringvalue{pattern}_")} for glossary entry matching \inputstring{pattern}{24}{*}",htstream)
;   PRINTEXP('"\end{page}",htstream)
;   CLOSE(instream)
;   CLOSE(outstream)
;   CLOSE(defstream)
;   CLOSE(htstream)

(DEFUN |buildGloss| ()
  (PROG (|$attribute?| |$x| |$exposeFlag| |$constructorName| |pathname|
         |instream| |keypath| |outstream| |htpath| |htstream| |defpath|
         |defstream| |pairs| |name| |line| |outP| |defP| |n_line|)
    (DECLARE (SPECIAL |$attribute?| |$x| |$exposeFlag| |$constructorName|))
    (RETURN
     (PROGN
      (SETQ |$constructorName| NIL)
      (SETQ |$exposeFlag| T)
      (SETQ |$x| NIL)
      (SETQ |$attribute?| T)
      (SETQ |pathname| "gloss.text")
      (SETQ |instream| (MAKE_INSTREAM |pathname|))
      (SETQ |keypath| "glosskey.text")
      (|maybe_delete_file| |keypath|)
      (SETQ |outstream| (MAKE_OUTSTREAM |keypath|))
      (SETQ |htpath| "gloss.ht")
      (|maybe_delete_file| |htpath|)
      (SETQ |htstream| (MAKE_OUTSTREAM |htpath|))
      (SETQ |defpath| "glossdef.text")
      (SETQ |defstream| (MAKE_OUTSTREAM |defpath|))
      (SETQ |pairs| (|getGlossLines| |instream|))
      (PRINTEXP
       "\\begin{page}{GlossaryPage}{G l o s s a r y}\\beginscroll\\beginmenu"
       |htstream|)
      ((LAMBDA (|bfVar#39| |bfVar#38|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#39|)
                (PROGN (SETQ |bfVar#38| (CAR |bfVar#39|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#38|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#38|))
                  (SETQ |line| (CDR |bfVar#38|))
                  #1#)
                 (PROGN
                  (SETQ |outP| (FILE-POSITION |outstream|))
                  (SETQ |defP| (FILE-POSITION |defstream|))
                  (SETQ |n_line|
                          (|transformAndRecheckComments| |name| (LIST |line|)))
                  (PRINTEXP |name| |outstream|)
                  (PRINTEXP |$tick| |outstream|)
                  (PRINTEXP |defP| |outstream|)
                  (TERPRI |outstream|)
                  (PRINTEXP "\\item\\newline{\\em \\menuitemstyle{}}{\\em "
                   |htstream|)
                  (PRINTEXP |name| |htstream|)
                  (PRINTEXP "}\\space{}" |htstream|)
                  (TERPRI |htstream|)
                  (PRINTEXP |outP| |defstream|)
                  (PRINTEXP |$tick| |defstream|)
                  (PRINTEXP |n_line| |defstream|)
                  (TERPRI |defstream|)
                  (PRINTEXP |n_line| |htstream|)
                  (TERPRI |htstream|)))))
          (SETQ |bfVar#39| (CDR |bfVar#39|))))
       |pairs| NIL)
      (PRINTEXP "\\endmenu\\endscroll" |htstream|)
      (PRINTEXP
       "\\lispdownlink{Search}{(|htGloss| \"\\stringvalue{pattern}\")} for glossary entry matching \\inputstring{pattern}{24}{*}"
       |htstream|)
      (PRINTEXP "\\end{page}" |htstream|)
      (CLOSE |instream|)
      (CLOSE |outstream|)
      (CLOSE |defstream|)
      (CLOSE |htstream|)))))

; getGlossLines instream ==
; --instream has text of the form:
; ----- key1`this is the first line
; ----- and this is the second
; ----- key2'and this is the third
; --result is
; ----- key1'this is the first line and this is the second
; ----- key2'and this is the third
;   keys := nil
;   text := nil
;   lastLineHadTick := false
;   while (line := read_line(instream)) repeat
;     #line = 0 => 'skip
;     n := charPosition($tick,line,0)
;     last := IFCAR text
;     n > MAXINDEX line =>  --this line is continuation of previous line; concat it
;       fill :=
;         #last = 0 =>
;           lastLineHadTick => '""
;           '"\blankline "
;         #last > 0 and last.(MAXINDEX last) ~= $charBlank => $charBlank
;         '""
;       lastLineHadTick := false
;       text := [STRCONC(last,fill,line),:rest text]
;     lastLineHadTick := true
;     keys := [SUBSTRING(line,0,n),:keys]
;     text := [SUBSTRING(line,n + 1,nil),:text]
;   ASSOCRIGHT listSort(function GLESSEQP,[[DOWNCASE key,key,:def] for key in keys for def in text])

(DEFUN |getGlossLines| (|instream|)
  (PROG (|keys| |text| |lastLineHadTick| |line| |n| |last| |fill|)
    (RETURN
     (PROGN
      (SETQ |keys| NIL)
      (SETQ |text| NIL)
      (SETQ |lastLineHadTick| NIL)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (SETQ |line| (|read_line| |instream|))) (RETURN NIL))
                (#1='T
                 (COND ((EQL (LENGTH |line|) 0) '|skip|)
                       (#1#
                        (PROGN
                         (SETQ |n| (|charPosition| |$tick| |line| 0))
                         (SETQ |last| (IFCAR |text|))
                         (COND
                          ((< (MAXINDEX |line|) |n|)
                           (PROGN
                            (SETQ |fill|
                                    (COND
                                     ((EQL (LENGTH |last|) 0)
                                      (COND (|lastLineHadTick| "")
                                            (#1# "\\blankline ")))
                                     ((AND (< 0 (LENGTH |last|))
                                           (NOT
                                            (EQUAL
                                             (ELT |last| (MAXINDEX |last|))
                                             |$charBlank|)))
                                      |$charBlank|)
                                     (#1# "")))
                            (SETQ |lastLineHadTick| NIL)
                            (SETQ |text|
                                    (CONS (STRCONC |last| |fill| |line|)
                                          (CDR |text|)))))
                          (#1#
                           (PROGN
                            (SETQ |lastLineHadTick| T)
                            (SETQ |keys|
                                    (CONS (SUBSTRING |line| 0 |n|) |keys|))
                            (SETQ |text|
                                    (CONS (SUBSTRING |line| (+ |n| 1) NIL)
                                          |text|)))))))))))))
      (ASSOCRIGHT
       (|listSort| #'GLESSEQP
        ((LAMBDA (|bfVar#42| |bfVar#40| |key| |bfVar#41| |def|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#40|) (PROGN (SETQ |key| (CAR |bfVar#40|)) NIL)
                  (ATOM |bfVar#41|) (PROGN (SETQ |def| (CAR |bfVar#41|)) NIL))
              (RETURN (NREVERSE |bfVar#42|)))
             (#1#
              (SETQ |bfVar#42|
                      (CONS (CONS (DOWNCASE |key|) (CONS |key| |def|))
                            |bfVar#42|))))
            (SETQ |bfVar#40| (CDR |bfVar#40|))
            (SETQ |bfVar#41| (CDR |bfVar#41|))))
         NIL |keys| NIL |text| NIL)))))))

; mkUsersHashTable() ==  --called by make-databases (daase.lisp)
;   usersTb := MAKE_HASHTABLE('EQUAL)
;   for x in allConstructors() repeat
;     for conform in getImports x repeat
;       name := opOf conform
;       if not MEMQ(name,'(QUOTE)) then
;                 HPUT(usersTb, name, insert(x, HGET(usersTb, name)))
;   for k in HKEYS(usersTb) repeat
;         HPUT(usersTb, k, listSort(function GLESSEQP, HGET(usersTb, k)))
;   for x in allConstructors() | isDefaultPackageName x repeat
;         HPUT(usersTb, x, getDefaultPackageClients(x))
;   usersTb

(DEFUN |mkUsersHashTable| ()
  (PROG (|name| |usersTb|)
    (RETURN
     (PROGN
      (SETQ |usersTb| (MAKE_HASHTABLE 'EQUAL))
      ((LAMBDA (|bfVar#43| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#43|) (PROGN (SETQ |x| (CAR |bfVar#43|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#44| |conform|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#44|)
                      (PROGN (SETQ |conform| (CAR |bfVar#44|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (PROGN
                   (SETQ |name| (|opOf| |conform|))
                   (COND
                    ((NULL (MEMQ |name| '(QUOTE)))
                     (HPUT |usersTb| |name|
                           (|insert| |x| (HGET |usersTb| |name|))))))))
                (SETQ |bfVar#44| (CDR |bfVar#44|))))
             (|getImports| |x|) NIL)))
          (SETQ |bfVar#43| (CDR |bfVar#43|))))
       (|allConstructors|) NIL)
      ((LAMBDA (|bfVar#45| |k|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#45|) (PROGN (SETQ |k| (CAR |bfVar#45|)) NIL))
            (RETURN NIL))
           (#1#
            (HPUT |usersTb| |k| (|listSort| #'GLESSEQP (HGET |usersTb| |k|)))))
          (SETQ |bfVar#45| (CDR |bfVar#45|))))
       (HKEYS |usersTb|) NIL)
      ((LAMBDA (|bfVar#46| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#46|) (PROGN (SETQ |x| (CAR |bfVar#46|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (|isDefaultPackageName| |x|)
                 (HPUT |usersTb| |x| (|getDefaultPackageClients| |x|)))))
          (SETQ |bfVar#46| (CDR |bfVar#46|))))
       (|allConstructors|) NIL)
      |usersTb|))))

; getDefaultPackageClients con ==  --called by mkUsersHashTable
;   catname := INTERN SUBSTRING(s := PNAME con,0,MAXINDEX s)
;   for [catAncestor,:.] in childrenOf([catname]) repeat
;     pakname := INTERN STRCONC(PNAME catAncestor,'"&")
;     if get_database(pakname, 'ABBREVIATION) then acc := [pakname,:acc]
;     acc := union([CAAR x for x in domainsOf([catAncestor],nil)],acc)
;   listSort(function GLESSEQP,acc)

(DEFUN |getDefaultPackageClients| (|con|)
  (PROG (|s| |catname| |catAncestor| |pakname| |acc|)
    (RETURN
     (PROGN
      (SETQ |catname|
              (INTERN (SUBSTRING (SETQ |s| (PNAME |con|)) 0 (MAXINDEX |s|))))
      ((LAMBDA (|bfVar#48| |bfVar#47|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#48|)
                (PROGN (SETQ |bfVar#47| (CAR |bfVar#48|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#47|)
                 (PROGN (SETQ |catAncestor| (CAR |bfVar#47|)) #1#)
                 (PROGN
                  (SETQ |pakname| (INTERN (STRCONC (PNAME |catAncestor|) "&")))
                  (COND
                   ((|get_database| |pakname| 'ABBREVIATION)
                    (SETQ |acc| (CONS |pakname| |acc|))))
                  (SETQ |acc|
                          (|union|
                           ((LAMBDA (|bfVar#50| |bfVar#49| |x|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#49|)
                                     (PROGN (SETQ |x| (CAR |bfVar#49|)) NIL))
                                 (RETURN (NREVERSE |bfVar#50|)))
                                (#1#
                                 (SETQ |bfVar#50|
                                         (CONS (CAAR |x|) |bfVar#50|))))
                               (SETQ |bfVar#49| (CDR |bfVar#49|))))
                            NIL (|domainsOf| (LIST |catAncestor|) NIL) NIL)
                           |acc|))))))
          (SETQ |bfVar#48| (CDR |bfVar#48|))))
       (|childrenOf| (LIST |catname|)) NIL)
      (|listSort| #'GLESSEQP |acc|)))))

; mkDependentsHashTable() == --called by make-databases (database.boot)
;     depTb := MAKE_HASHTABLE('EQUAL)
;     for nam in allConstructors() repeat
;         for con in getArgumentConstructors nam repeat
;             HPUT(depTb, con, [nam, :HGET(depTb, con)])
;     for k in HKEYS(depTb) repeat
;         HPUT(depTb, k, listSort(function GLESSEQP, HGET(depTb, k)))
;     depTb

(DEFUN |mkDependentsHashTable| ()
  (PROG (|depTb|)
    (RETURN
     (PROGN
      (SETQ |depTb| (MAKE_HASHTABLE 'EQUAL))
      ((LAMBDA (|bfVar#51| |nam|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#51|) (PROGN (SETQ |nam| (CAR |bfVar#51|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#52| |con|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#52|)
                      (PROGN (SETQ |con| (CAR |bfVar#52|)) NIL))
                  (RETURN NIL))
                 (#1# (HPUT |depTb| |con| (CONS |nam| (HGET |depTb| |con|)))))
                (SETQ |bfVar#52| (CDR |bfVar#52|))))
             (|getArgumentConstructors| |nam|) NIL)))
          (SETQ |bfVar#51| (CDR |bfVar#51|))))
       (|allConstructors|) NIL)
      ((LAMBDA (|bfVar#53| |k|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#53|) (PROGN (SETQ |k| (CAR |bfVar#53|)) NIL))
            (RETURN NIL))
           (#1# (HPUT |depTb| |k| (|listSort| #'GLESSEQP (HGET |depTb| |k|)))))
          (SETQ |bfVar#53| (CDR |bfVar#53|))))
       (HKEYS |depTb|) NIL)
      |depTb|))))

; getArgumentConstructors con == --called by mkDependentsHashTable
;   argtypes := IFCDR IFCAR getConstructorModemap con or return nil
;   fn argtypes where
;     fn(u) == "union"/[gn x for x in u]
;     gn(x) ==
;       atom x => nil
;       x is ['Join,:r] => fn(r)
;       x is ['CATEGORY,:.] => nil
;       constructor? first x => [first x,:fn rest x]
;       fn rest x

(DEFUN |getArgumentConstructors| (|con|)
  (PROG (|argtypes|)
    (RETURN
     (PROGN
      (SETQ |argtypes|
              (OR (IFCDR (IFCAR (|getConstructorModemap| |con|)))
                  (RETURN NIL)))
      (|getArgumentConstructors,fn| |argtypes|)))))
(DEFUN |getArgumentConstructors,fn| (|u|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#55| |bfVar#54| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#54|) (PROGN (SETQ |x| (CAR |bfVar#54|)) NIL))
           (RETURN |bfVar#55|))
          ('T
           (SETQ |bfVar#55|
                   (|union| |bfVar#55| (|getArgumentConstructors,gn| |x|)))))
         (SETQ |bfVar#54| (CDR |bfVar#54|))))
      NIL |u| NIL))))
(DEFUN |getArgumentConstructors,gn| (|x|)
  (PROG (|r|)
    (RETURN
     (COND ((ATOM |x|) NIL)
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Join|)
                 (PROGN (SETQ |r| (CDR |x|)) #1='T))
            (|getArgumentConstructors,fn| |r|))
           ((AND (CONSP |x|) (EQ (CAR |x|) 'CATEGORY)) NIL)
           ((|constructor?| (CAR |x|))
            (CONS (CAR |x|) (|getArgumentConstructors,fn| (CDR |x|))))
           (#1# (|getArgumentConstructors,fn| (CDR |x|)))))))

; getImports conname == --called by mkUsersHashTable
;   conform := get_database(conname, 'CONSTRUCTORFORM)
;   infovec := dbInfovec conname or return nil
;   template := infovec.0
;   u := [import(i,template)
;           for i in 5..(MAXINDEX template) | test]  where
;     test == template.i is [op,:.] and IDENTP op
;               and not MEMQ(op,'(Mapping Union Record Enumeration CONS QUOTE local))
;     import(x,template) ==
;       x is [op,:args] =>
;         op = 'QUOTE or op = 'NRTEVAL => first args
;         op = 'local => first args
;         op = 'Record =>
;           ['Record,:[[":",CADR y,import(CADDR y,template)] for y in args]]
;
; --TTT next three lines: handles some tagged/untagged Union case.
;         op = 'Union=>
;           args is [['_:,:x1],:x2] =>
;                -- tagged!
;                ['Union,:[[":",CADR y,import(CADDR y,template)] for y in args]]
;           [op,:[import(y,template) for y in args]]
;
;         [op,:[import(y,template) for y in args]]
;       INTEGERP x => import(template.x,template)
;       x = '% => '%
;       x = "$$" => "$$"
;       STRINGP x => x
;       systemError '"bad argument in template"
;   listSort(function GLESSEQP,SUBLISLIS(rest conform,$FormalMapVariableList,u))

(DEFUN |getImports| (|conname|)
  (PROG (|conform| |infovec| |template| |ISTMP#1| |op| |u|)
    (RETURN
     (PROGN
      (SETQ |conform| (|get_database| |conname| 'CONSTRUCTORFORM))
      (SETQ |infovec| (OR (|dbInfovec| |conname|) (RETURN NIL)))
      (SETQ |template| (ELT |infovec| 0))
      (SETQ |u|
              ((LAMBDA (|bfVar#57| |bfVar#56| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#56|) (RETURN (NREVERSE |bfVar#57|)))
                        (#1='T
                         (AND
                          (AND
                           (PROGN
                            (SETQ |ISTMP#1| (ELT |template| |i|))
                            (AND (CONSP |ISTMP#1|)
                                 (PROGN (SETQ |op| (CAR |ISTMP#1|)) #1#)))
                           (IDENTP |op|)
                           (NULL
                            (MEMQ |op|
                                  '(|Mapping| |Union| |Record| |Enumeration|
                                    CONS QUOTE |local|))))
                          (SETQ |bfVar#57|
                                  (CONS (|getImports,import| |i| |template|)
                                        |bfVar#57|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |template|) 5))
      (|listSort| #'GLESSEQP
       (SUBLISLIS (CDR |conform|) |$FormalMapVariableList| |u|))))))
(DEFUN |getImports,import| (|x| |template|)
  (PROG (|op| |args| |ISTMP#1| |x1| |x2|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |args| (CDR |x|)) #1='T))
       (COND ((OR (EQ |op| 'QUOTE) (EQ |op| 'NRTEVAL)) (CAR |args|))
             ((EQ |op| '|local|) (CAR |args|))
             ((EQ |op| '|Record|)
              (CONS '|Record|
                    ((LAMBDA (|bfVar#59| |bfVar#58| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#58|)
                              (PROGN (SETQ |y| (CAR |bfVar#58|)) NIL))
                          (RETURN (NREVERSE |bfVar#59|)))
                         (#1#
                          (SETQ |bfVar#59|
                                  (CONS
                                   (LIST '|:| (CADR |y|)
                                         (|getImports,import| (CADDR |y|)
                                          |template|))
                                   |bfVar#59|))))
                        (SETQ |bfVar#58| (CDR |bfVar#58|))))
                     NIL |args| NIL)))
             ((EQ |op| '|Union|)
              (COND
               ((AND (CONSP |args|)
                     (PROGN
                      (SETQ |ISTMP#1| (CAR |args|))
                      (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                           (PROGN (SETQ |x1| (CDR |ISTMP#1|)) #1#)))
                     (PROGN (SETQ |x2| (CDR |args|)) #1#))
                (CONS '|Union|
                      ((LAMBDA (|bfVar#61| |bfVar#60| |y|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#60|)
                                (PROGN (SETQ |y| (CAR |bfVar#60|)) NIL))
                            (RETURN (NREVERSE |bfVar#61|)))
                           (#1#
                            (SETQ |bfVar#61|
                                    (CONS
                                     (LIST '|:| (CADR |y|)
                                           (|getImports,import| (CADDR |y|)
                                            |template|))
                                     |bfVar#61|))))
                          (SETQ |bfVar#60| (CDR |bfVar#60|))))
                       NIL |args| NIL)))
               (#1#
                (CONS |op|
                      ((LAMBDA (|bfVar#63| |bfVar#62| |y|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#62|)
                                (PROGN (SETQ |y| (CAR |bfVar#62|)) NIL))
                            (RETURN (NREVERSE |bfVar#63|)))
                           (#1#
                            (SETQ |bfVar#63|
                                    (CONS (|getImports,import| |y| |template|)
                                          |bfVar#63|))))
                          (SETQ |bfVar#62| (CDR |bfVar#62|))))
                       NIL |args| NIL)))))
             (#1#
              (CONS |op|
                    ((LAMBDA (|bfVar#65| |bfVar#64| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#64|)
                              (PROGN (SETQ |y| (CAR |bfVar#64|)) NIL))
                          (RETURN (NREVERSE |bfVar#65|)))
                         (#1#
                          (SETQ |bfVar#65|
                                  (CONS (|getImports,import| |y| |template|)
                                        |bfVar#65|))))
                        (SETQ |bfVar#64| (CDR |bfVar#64|))))
                     NIL |args| NIL)))))
      ((INTEGERP |x|) (|getImports,import| (ELT |template| |x|) |template|))
      ((EQ |x| '%) '%) ((EQ |x| '$$) '$$) ((STRINGP |x|) |x|)
      (#1# (|systemError| "bad argument in template"))))))

; getParentsFor(cname,formalParams,constructorCategory) ==
; --called by compDefineFunctor1
;   acc := nil
;   formals := TAKE(#formalParams,$TriangleVariableList)
;   constructorForm := get_database(cname, 'CONSTRUCTORFORM)
;   for x in folks constructorCategory repeat
;     x := SUBLISLIS(formalParams,formals,x)
;     x := SUBLISLIS(IFCDR constructorForm,formalParams,x)
;     acc := [:explodeIfs x,:acc]
;   NREVERSE acc

(DEFUN |getParentsFor| (|cname| |formalParams| |constructorCategory|)
  (PROG (|acc| |formals| |constructorForm|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      (SETQ |formals| (TAKE (LENGTH |formalParams|) |$TriangleVariableList|))
      (SETQ |constructorForm| (|get_database| |cname| 'CONSTRUCTORFORM))
      ((LAMBDA (|bfVar#66| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#66|) (PROGN (SETQ |x| (CAR |bfVar#66|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |x| (SUBLISLIS |formalParams| |formals| |x|))
             (SETQ |x|
                     (SUBLISLIS (IFCDR |constructorForm|) |formalParams| |x|))
             (SETQ |acc| (APPEND (|explodeIfs| |x|) |acc|)))))
          (SETQ |bfVar#66| (CDR |bfVar#66|))))
       (|folks| |constructorCategory|) NIL)
      (NREVERSE |acc|)))))

; parentsOf con == --called by kcpPage, ancestorsRecur
;   if null BOUNDP '$parentsCache then SETQ($parentsCache, MAKE_HASHTABLE('EQ))
;   HGET($parentsCache,con) or
;     parents := getParentsForDomain con
;     HPUT($parentsCache,con,parents)
;     parents

(DEFUN |parentsOf| (|con|)
  (PROG (|parents|)
    (RETURN
     (PROGN
      (COND
       ((NULL (BOUNDP '|$parentsCache|))
        (SETQ |$parentsCache| (MAKE_HASHTABLE 'EQ))))
      (OR (HGET |$parentsCache| |con|)
          (PROGN
           (SETQ |parents| (|getParentsForDomain| |con|))
           (HPUT |$parentsCache| |con| |parents|)
           |parents|))))))

; parentsOfForm [op,:argl] ==
;   parents := parentsOf op
;   null argl or argl = (newArgl := rest get_database(op, 'CONSTRUCTORFORM)) =>
;     parents
;   SUBLISLIS(argl, newArgl, parents)

(DEFUN |parentsOfForm| (|bfVar#67|)
  (PROG (|op| |argl| |parents| |newArgl|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#67|))
      (SETQ |argl| (CDR |bfVar#67|))
      (SETQ |parents| (|parentsOf| |op|))
      (COND
       ((OR (NULL |argl|)
            (EQUAL |argl|
                   (SETQ |newArgl|
                           (CDR (|get_database| |op| 'CONSTRUCTORFORM)))))
        |parents|)
       ('T (SUBLISLIS |argl| |newArgl| |parents|)))))))

; getParentsForDomain domname  == --called by parentsOf
;   acc := nil
;   for x in folks(get_database(domname, 'CONSTRUCTORCATEGORY)) repeat
;     x :=
;       get_database(domname,'CONSTRUCTORKIND) = 'category =>
;         sublisFormal(IFCDR getConstructorForm domname,x,$TriangleVariableList)
;       sublisFormal(IFCDR getConstructorForm domname,x)
;     acc := [:explodeIfs x,:acc]
;   NREVERSE acc

(DEFUN |getParentsForDomain| (|domname|)
  (PROG (|acc|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      ((LAMBDA (|bfVar#68| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#68|) (PROGN (SETQ |x| (CAR |bfVar#68|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |x|
                     (COND
                      ((EQ (|get_database| |domname| 'CONSTRUCTORKIND)
                           '|category|)
                       (|sublisFormal| (IFCDR (|getConstructorForm| |domname|))
                        |x| |$TriangleVariableList|))
                      (#1#
                       (|sublisFormal| (IFCDR (|getConstructorForm| |domname|))
                        |x|))))
             (SETQ |acc| (APPEND (|explodeIfs| |x|) |acc|)))))
          (SETQ |bfVar#68| (CDR |bfVar#68|))))
       (|folks| (|get_database| |domname| 'CONSTRUCTORCATEGORY)) NIL)
      (NREVERSE |acc|)))))

; explodeIfs x == main where  --called by getParents, getParentsForDomain
;   main ==
;     x is ['IF,p,a,b] => fn(p,a,b)
;     [[x,:true]]
;   fn(p,a,b) ==
;     [:"append"/[gn(p,y) for y in a],:"append"/[gn(['NOT,p],y) for y in b]]
;   gn(p,a) ==
;     a is ['IF,q,b,:.] => fn(MKPF([p,q],'AND),b,nil)
;     [[a,:p]]

(DEFUN |explodeIfs| (|x|)
  (PROG (|ISTMP#1| |p| |ISTMP#2| |a| |ISTMP#3| |b|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |p| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |a| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (PROGN (SETQ |b| (CAR |ISTMP#3|)) #1='T))))))))
       (|explodeIfs,fn| |p| |a| |b|))
      (#1# (LIST (CONS |x| T)))))))
(DEFUN |explodeIfs,fn| (|p| |a| |b|)
  (PROG ()
    (RETURN
     (APPEND
      ((LAMBDA (|bfVar#70| |bfVar#69| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#69|) (PROGN (SETQ |y| (CAR |bfVar#69|)) NIL))
            (RETURN |bfVar#70|))
           (#1='T
            (SETQ |bfVar#70| (APPEND |bfVar#70| (|explodeIfs,gn| |p| |y|)))))
          (SETQ |bfVar#69| (CDR |bfVar#69|))))
       NIL |a| NIL)
      ((LAMBDA (|bfVar#72| |bfVar#71| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#71|) (PROGN (SETQ |y| (CAR |bfVar#71|)) NIL))
            (RETURN |bfVar#72|))
           (#1#
            (SETQ |bfVar#72|
                    (APPEND |bfVar#72|
                            (|explodeIfs,gn| (LIST 'NOT |p|) |y|)))))
          (SETQ |bfVar#71| (CDR |bfVar#71|))))
       NIL |b| NIL)))))
(DEFUN |explodeIfs,gn| (|p| |a|)
  (PROG (|ISTMP#1| |q| |ISTMP#2| |b|)
    (RETURN
     (COND
      ((AND (CONSP |a|) (EQ (CAR |a|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |a|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |q| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1='T))))))
       (|explodeIfs,fn| (MKPF (LIST |p| |q|) 'AND) |b| NIL))
      (#1# (LIST (CONS |a| |p|)))))))

; folks u == --called by getParents and getParentsForDomain
;   atom u => nil
;   u is [op,:v] and MEMQ(op,'(Join PROGN))
;     or u is ['CATEGORY,a,:v] => "append"/[folks x for x in v]
;   u is ['SIGNATURE,:.] => nil
;   u is ['ATTRIBUTE,a] =>
;     PAIRP a and constructor? opOf a => folks a
;     nil
;   u is ['IF,p,q,r] =>
;     q1 := folks q
;     r1 := folks r
;     q1 or r1 => [['IF,p,q1,r1]]
;     nil
;   [u]

(DEFUN |folks| (|u|)
  (PROG (|op| |v| |ISTMP#1| |a| |p| |ISTMP#2| |q| |ISTMP#3| |r| |q1| |r1|)
    (RETURN
     (COND ((ATOM |u|) NIL)
           ((OR
             (AND (CONSP |u|)
                  (PROGN (SETQ |op| (CAR |u|)) (SETQ |v| (CDR |u|)) #1='T)
                  (MEMQ |op| '(|Join| PROGN)))
             (AND (CONSP |u|) (EQ (CAR |u|) 'CATEGORY)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |u|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |a| (CAR |ISTMP#1|))
                         (SETQ |v| (CDR |ISTMP#1|))
                         #1#)))))
            ((LAMBDA (|bfVar#74| |bfVar#73| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#73|)
                      (PROGN (SETQ |x| (CAR |bfVar#73|)) NIL))
                  (RETURN |bfVar#74|))
                 (#1# (SETQ |bfVar#74| (APPEND |bfVar#74| (|folks| |x|)))))
                (SETQ |bfVar#73| (CDR |bfVar#73|))))
             NIL |v| NIL))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'SIGNATURE)) NIL)
           ((AND (CONSP |u|) (EQ (CAR |u|) 'ATTRIBUTE)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1#))))
            (COND
             ((AND (CONSP |a|) (|constructor?| (|opOf| |a|))) (|folks| |a|))
             (#1# NIL)))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'IF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |p| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |q| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |r| (CAR |ISTMP#3|))
                                    #1#))))))))
            (PROGN
             (SETQ |q1| (|folks| |q|))
             (SETQ |r1| (|folks| |r|))
             (COND ((OR |q1| |r1|) (LIST (LIST 'IF |p| |q1| |r1|)))
                   (#1# NIL))))
           (#1# (LIST |u|))))))

; descendantsOf(conform,domform) ==  --called by kcdPage
;   'category = get_database((conname := opOf conform), 'CONSTRUCTORKIND) =>
;     cats := catsOf(conform,domform)
;     [op,:argl] := conform
;     null argl or argl = (newArgl := rest(get_database(op, 'CONSTRUCTORFORM)))
;         => cats
;     SUBLISLIS(argl, newArgl, cats)
;   'notAvailable

(DEFUN |descendantsOf| (|conform| |domform|)
  (PROG (|conname| |cats| |op| |argl| |newArgl|)
    (RETURN
     (COND
      ((EQ '|category|
           (|get_database| (SETQ |conname| (|opOf| |conform|))
            'CONSTRUCTORKIND))
       (PROGN
        (SETQ |cats| (|catsOf| |conform| |domform|))
        (SETQ |op| (CAR |conform|))
        (SETQ |argl| (CDR |conform|))
        (COND
         ((OR (NULL |argl|)
              (EQUAL |argl|
                     (SETQ |newArgl|
                             (CDR (|get_database| |op| 'CONSTRUCTORFORM)))))
          |cats|)
         (#1='T (SUBLISLIS |argl| |newArgl| |cats|)))))
      (#1# '|notAvailable|)))))

; childrenOf conform ==
;   [pair for pair in descendantsOf(conform,nil) |
;     childAssoc(conform,parentsOfForm first pair)]

(DEFUN |childrenOf| (|conform|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#76| |bfVar#75| |pair|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#75|) (PROGN (SETQ |pair| (CAR |bfVar#75|)) NIL))
           (RETURN (NREVERSE |bfVar#76|)))
          ('T
           (AND (|childAssoc| |conform| (|parentsOfForm| (CAR |pair|)))
                (SETQ |bfVar#76| (CONS |pair| |bfVar#76|)))))
         (SETQ |bfVar#75| (CDR |bfVar#75|))))
      NIL (|descendantsOf| |conform| NIL) NIL))))

; childAssoc(form,alist) ==
;   null (argl := rest form) => assoc(form, alist)
;   u := assocCar(opOf form, alist) => childArgCheck(argl, rest first u) and u
;   nil

(DEFUN |childAssoc| (|form| |alist|)
  (PROG (|argl| |u|)
    (RETURN
     (COND ((NULL (SETQ |argl| (CDR |form|))) (|assoc| |form| |alist|))
           ((SETQ |u| (|assocCar| (|opOf| |form|) |alist|))
            (AND (|childArgCheck| |argl| (CDR (CAR |u|))) |u|))
           ('T NIL)))))

; assocCar(x, al) == or/[pair for pair in al | x = CAAR pair]

(DEFUN |assocCar| (|x| |al|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#78| |bfVar#77| |pair|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#77|) (PROGN (SETQ |pair| (CAR |bfVar#77|)) NIL))
           (RETURN |bfVar#78|))
          ('T
           (AND (EQUAL |x| (CAAR |pair|))
                (PROGN
                 (SETQ |bfVar#78| |pair|)
                 (COND (|bfVar#78| (RETURN |bfVar#78|)))))))
         (SETQ |bfVar#77| (CDR |bfVar#77|))))
      NIL |al| NIL))))

; childArgCheck(argl, nargl) ==
;   and/[fn for x in argl for y in nargl for i in 0..] where
;     fn ==
;       x = y or constructor? opOf y => true
;       isSharpVar y => i = POSN1(y, $FormalMapVariableList)
;       false

(DEFUN |childArgCheck| (|argl| |nargl|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#81| |bfVar#79| |x| |bfVar#80| |y| |i|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#79|) (PROGN (SETQ |x| (CAR |bfVar#79|)) NIL)
               (ATOM |bfVar#80|) (PROGN (SETQ |y| (CAR |bfVar#80|)) NIL))
           (RETURN |bfVar#81|))
          (#1='T
           (PROGN
            (SETQ |bfVar#81|
                    (COND
                     ((OR (EQUAL |x| |y|) (|constructor?| (|opOf| |y|))) T)
                     ((|isSharpVar| |y|)
                      (EQUAL |i| (POSN1 |y| |$FormalMapVariableList|)))
                     (#1# NIL)))
            (COND ((NOT |bfVar#81|) (RETURN NIL))))))
         (SETQ |bfVar#79| (CDR |bfVar#79|))
         (SETQ |bfVar#80| (CDR |bfVar#80|))
         (SETQ |i| (+ |i| 1))))
      T |argl| NIL |nargl| NIL 0))))

; ancestors_of_cat(conform, domform) ==
;        conname := opOf(conform)
;        alist := get_database(conname, 'ANCESTORS)
;        argl := IFCDR domform or IFCDR conform
;        [pair for [a,:b] in alist | pair] where pair ==
;          left :=  sublisFormal(argl,a)
;          right := sublisFormal(argl,b)
;          if domform then right := simpHasPred right
;          null right => false
;          [left,:right]

(DEFUN |ancestors_of_cat| (|conform| |domform|)
  (PROG (|conname| |alist| |argl| |a| |b| |left| |right|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |alist| (|get_database| |conname| 'ANCESTORS))
      (SETQ |argl| (OR (IFCDR |domform|) (IFCDR |conform|)))
      ((LAMBDA (|bfVar#84| |bfVar#83| |bfVar#82|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#83|)
                (PROGN (SETQ |bfVar#82| (CAR |bfVar#83|)) NIL))
            (RETURN (NREVERSE |bfVar#84|)))
           (#1='T
            (AND (CONSP |bfVar#82|)
                 (PROGN
                  (SETQ |a| (CAR |bfVar#82|))
                  (SETQ |b| (CDR |bfVar#82|))
                  #1#)
                 #2=(PROGN
                     (SETQ |left| (|sublisFormal| |argl| |a|))
                     (SETQ |right| (|sublisFormal| |argl| |b|))
                     (COND (|domform| (SETQ |right| (|simpHasPred| |right|))))
                     (COND ((NULL |right|) NIL) (#1# (CONS |left| |right|))))
                 (SETQ |bfVar#84| (CONS #2# |bfVar#84|)))))
          (SETQ |bfVar#83| (CDR |bfVar#83|))))
       NIL |alist| NIL)))))

; ancestorsOf(conform,domform) ==  --called by kcaPage, originsInOrder,...
;   'category = get_database((conname := opOf(conform)), 'CONSTRUCTORKIND) =>
;        ancestors_of_cat(conform, domform)
;   computeAncestorsOf(conform,domform)

(DEFUN |ancestorsOf| (|conform| |domform|)
  (PROG (|conname|)
    (RETURN
     (COND
      ((EQ '|category|
           (|get_database| (SETQ |conname| (|opOf| |conform|))
            'CONSTRUCTORKIND))
       (|ancestors_of_cat| |conform| |domform|))
      ('T (|computeAncestorsOf| |conform| |domform|))))))

; computeAncestorsOf(conform,domform) ==
;   $done : local := MAKE_HASHTABLE('EQUAL)
;   $if :   local := MAKE_HASHTABLE('EQ)
;   ancestorsRecur(conform, domform, true, true)
;   acc := nil
;   for op in listSort(function GLESSEQP,HKEYS $if) repeat
;     for pair in HGET($if,op) repeat acc := [pair,:acc]
;   NREVERSE acc

(DEFUN |computeAncestorsOf| (|conform| |domform|)
  (PROG (|$if| |$done| |acc|)
    (DECLARE (SPECIAL |$if| |$done|))
    (RETURN
     (PROGN
      (SETQ |$done| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$if| (MAKE_HASHTABLE 'EQ))
      (|ancestorsRecur| |conform| |domform| T T)
      (SETQ |acc| NIL)
      ((LAMBDA (|bfVar#85| |op|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#85|) (PROGN (SETQ |op| (CAR |bfVar#85|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#86| |pair|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#86|)
                      (PROGN (SETQ |pair| (CAR |bfVar#86|)) NIL))
                  (RETURN NIL))
                 (#1# (SETQ |acc| (CONS |pair| |acc|))))
                (SETQ |bfVar#86| (CDR |bfVar#86|))))
             (HGET |$if| |op|) NIL)))
          (SETQ |bfVar#85| (CDR |bfVar#85|))))
       (|listSort| #'GLESSEQP (HKEYS |$if|)) NIL)
      (NREVERSE |acc|)))))

; ancestorsRecur(conform, domform, pred, firstTime?) ==
;   op      := opOf conform
;   pred = HGET($done, conform) => nil   --skip if already processed
;   parents :=
;     firstTime? and ($insideCategoryIfTrue or $insideFunctorIfTrue) =>
;         getParentsFor($op, $FormalMapVariableList, $lisplibCategory)
;     parentsOf op
;   originalConform :=
;     firstTime? and ($insideCategoryIfTrue or $insideFunctorIfTrue) =>
;         $functorForm
;     getConstructorForm op
;   if conform ~= originalConform then
;     parents := SUBLISLIS(IFCDR conform,IFCDR originalConform,parents)
;   for [newform,:p] in parents repeat
;     p is ['has, '%, newform] => "iterate"
;     if domform and rest domform then
;       newdomform := SUBLISLIS(rest domform,rest conform,newform)
;       p          := SUBLISLIS(rest domform,rest conform,p)
;     newPred := quickAnd(pred,p)
;     ancestorsAdd(simpHasPred newPred,newdomform or newform)
;     ancestorsRecur(newform,newdomform,newPred,false)
;   HPUT($done, conform, pred)                  --mark as already processed

(DEFUN |ancestorsRecur| (|conform| |domform| |pred| |firstTime?|)
  (PROG (|op| |parents| |originalConform| |newform| |p| |ISTMP#1| |ISTMP#2|
         |newdomform| |newPred|)
    (RETURN
     (PROGN
      (SETQ |op| (|opOf| |conform|))
      (COND ((EQUAL |pred| (HGET |$done| |conform|)) NIL)
            (#1='T
             (PROGN
              (SETQ |parents|
                      (COND
                       ((AND |firstTime?|
                             (OR |$insideCategoryIfTrue|
                                 |$insideFunctorIfTrue|))
                        (|getParentsFor| |$op| |$FormalMapVariableList|
                         |$lisplibCategory|))
                       (#1# (|parentsOf| |op|))))
              (SETQ |originalConform|
                      (COND
                       ((AND |firstTime?|
                             (OR |$insideCategoryIfTrue|
                                 |$insideFunctorIfTrue|))
                        |$functorForm|)
                       (#1# (|getConstructorForm| |op|))))
              (COND
               ((NOT (EQUAL |conform| |originalConform|))
                (SETQ |parents|
                        (SUBLISLIS (IFCDR |conform|) (IFCDR |originalConform|)
                         |parents|))))
              ((LAMBDA (|bfVar#88| |bfVar#87|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#88|)
                        (PROGN (SETQ |bfVar#87| (CAR |bfVar#88|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (AND (CONSP |bfVar#87|)
                         (PROGN
                          (SETQ |newform| (CAR |bfVar#87|))
                          (SETQ |p| (CDR |bfVar#87|))
                          #1#)
                         (COND
                          ((AND (CONSP |p|) (EQ (CAR |p|) '|has|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |p|))
                                 (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '%)
                                      (PROGN
                                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CDR |ISTMP#2|) NIL)
                                            (PROGN
                                             (SETQ |newform| (CAR |ISTMP#2|))
                                             #1#))))))
                           '|iterate|)
                          (#1#
                           (PROGN
                            (COND
                             ((AND |domform| (CDR |domform|))
                              (SETQ |newdomform|
                                      (SUBLISLIS (CDR |domform|)
                                       (CDR |conform|) |newform|))
                              (SETQ |p|
                                      (SUBLISLIS (CDR |domform|)
                                       (CDR |conform|) |p|))))
                            (SETQ |newPred| (|quickAnd| |pred| |p|))
                            (|ancestorsAdd| (|simpHasPred| |newPred|)
                             (OR |newdomform| |newform|))
                            (|ancestorsRecur| |newform| |newdomform| |newPred|
                             NIL)))))))
                  (SETQ |bfVar#88| (CDR |bfVar#88|))))
               |parents| NIL)
              (HPUT |$done| |conform| |pred|))))))))

; ancestorsAdd(pred,form) == --called by ancestorsRecur
;   null pred => nil
;   op := IFCAR form or form
;   alist := HGET($if,op)
;   existingNode := assoc(form,alist) =>
;     RPLACD(existingNode, quickOr(rest existingNode, pred))
;   HPUT($if,op,[[form,:pred],:alist])

(DEFUN |ancestorsAdd| (|pred| |form|)
  (PROG (|op| |alist| |existingNode|)
    (RETURN
     (COND ((NULL |pred|) NIL)
           (#1='T
            (PROGN
             (SETQ |op| (OR (IFCAR |form|) |form|))
             (SETQ |alist| (HGET |$if| |op|))
             (COND
              ((SETQ |existingNode| (|assoc| |form| |alist|))
               (RPLACD |existingNode| (|quickOr| (CDR |existingNode|) |pred|)))
              (#1# (HPUT |$if| |op| (CONS (CONS |form| |pred|) |alist|))))))))))

; domainsOf(conform, domname) ==
;   conname := opOf conform
;   u := [key for key in HKEYS $has_category_hash
;     | key is [anc,: =conname]]
;   --u is list of pairs (a . b) where b = conname
;   --we sort u then replace each b by the predicate for which this is true
;   s := listSort(function GLESSEQP,COPY u)
;   s := [[first pair, :get_database(pair, 'HASCATEGORY)] for pair in s]
;   transKCatAlist(conform,domname,listSort(function GLESSEQP,s))

(DEFUN |domainsOf| (|conform| |domname|)
  (PROG (|conname| |anc| |u| |s|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |u|
              ((LAMBDA (|bfVar#90| |bfVar#89| |key|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#89|)
                        (PROGN (SETQ |key| (CAR |bfVar#89|)) NIL))
                    (RETURN (NREVERSE |bfVar#90|)))
                   (#1='T
                    (AND (CONSP |key|) (PROGN (SETQ |anc| (CAR |key|)) #1#)
                         (EQUAL (CDR |key|) |conname|)
                         (SETQ |bfVar#90| (CONS |key| |bfVar#90|)))))
                  (SETQ |bfVar#89| (CDR |bfVar#89|))))
               NIL (HKEYS |$has_category_hash|) NIL))
      (SETQ |s| (|listSort| #'GLESSEQP (COPY |u|)))
      (SETQ |s|
              ((LAMBDA (|bfVar#92| |bfVar#91| |pair|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#91|)
                        (PROGN (SETQ |pair| (CAR |bfVar#91|)) NIL))
                    (RETURN (NREVERSE |bfVar#92|)))
                   (#1#
                    (SETQ |bfVar#92|
                            (CONS
                             (CONS (CAR |pair|)
                                   (|get_database| |pair| 'HASCATEGORY))
                             |bfVar#92|))))
                  (SETQ |bfVar#91| (CDR |bfVar#91|))))
               NIL |s| NIL))
      (|transKCatAlist| |conform| |domname| (|listSort| #'GLESSEQP |s|))))))

; catsOf(conform, domname) ==
;   conname := opOf conform
;   alist := nil
;   for key in allConstructors() repeat
;     for item in get_database(key, 'ANCESTORS) | conname = CAAR item repeat
;       [[op,:args],:pred] := item
;       newItem :=
;         args => [[args,:pred],:LASSOC(key,alist)]
;         pred
;       alist := insertShortAlist(key,newItem,alist)
;   transKCatAlist(conform,domname,listSort(function GLESSEQP,alist))

(DEFUN |catsOf| (|conform| |domname|)
  (PROG (|conname| |alist| |op| |args| |pred| |newItem|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |alist| NIL)
      ((LAMBDA (|bfVar#93| |key|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#93|) (PROGN (SETQ |key| (CAR |bfVar#93|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#94| |item|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#94|)
                      (PROGN (SETQ |item| (CAR |bfVar#94|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (AND (EQUAL |conname| (CAAR |item|))
                       (PROGN
                        (SETQ |op| (CAAR . #2=(|item|)))
                        (SETQ |args| (CDAR . #2#))
                        (SETQ |pred| (CDR |item|))
                        (SETQ |newItem|
                                (COND
                                 (|args|
                                  (CONS (CONS |args| |pred|)
                                        (LASSOC |key| |alist|)))
                                 (#1# |pred|)))
                        (SETQ |alist|
                                (|insertShortAlist| |key| |newItem|
                                 |alist|))))))
                (SETQ |bfVar#94| (CDR |bfVar#94|))))
             (|get_database| |key| 'ANCESTORS) NIL)))
          (SETQ |bfVar#93| (CDR |bfVar#93|))))
       (|allConstructors|) NIL)
      (|transKCatAlist| |conform| |domname| (|listSort| #'GLESSEQP |alist|))))))

; transKCatAlist(conform,domname,s) == main where
;   main ==
;     domname => --accept only exact matches after substitution
;       domargs := rest domname
;       acc := nil
;       rest conform =>
;         for pair in s repeat --pair has form [con,[conargs,:pred],...]]
;           leftForm := getConstructorForm first pair
;           for (ap := [args, :pred]) in rest pair repeat
;             match? :=
;               domargs = args => true
;               HAS_SHARP_VAR args => domargs = sublisFormal(IFCDR domname, args)
;               nil
;             null match? => 'skip
;             npred := sublisFormal(IFCDR leftForm, pred)
;             acc := [[leftForm,:npred],:acc]
;         NREVERSE acc
;       --conform has no arguments so each pair has form [con,:pred]
;       for pair in s repeat
;         leftForm := getConstructorForm first pair or systemError nil
;         RPLACA(pair,leftForm)
;         RPLACD(pair, sublisFormal(IFCDR leftForm, rest pair))
;       s
;     --no domname, so look for special argument combinations
;     acc := nil
;     IFCDR conform =>
;       farglist := TAKE(#rest conform,$FormalMapVariableList)
;       for pair in s repeat --pair has form [con,[conargs,:pred],...]]
;         leftForm := getConstructorForm first pair
;         for (ap := [args, :pred]) in rest pair repeat
;           hasArgsForm? := args ~= farglist
;           npred := sublisFormal(IFCDR leftForm, pred)
;           if hasArgsForm? then
;             subargs := sublisFormal(IFCDR leftForm, args)
;             hpred :=
;               ['hasArgs,:subargs]
;             npred := quickAnd(hpred,npred)
;           acc := [[leftForm,:npred],:acc]
;       NREVERSE acc
;     for pair in s repeat --pair has form [con,:pred]
;       leftForm := getConstructorForm first pair
;       RPLACA(pair,leftForm)
;       RPLACD(pair, sublisFormal(IFCDR leftForm, rest pair))
;     s

(DEFUN |transKCatAlist| (|conform| |domname| |s|)
  (PROG (|domargs| |acc| |leftForm| |args| |pred| |match?| |npred| |farglist|
         |hasArgsForm?| |subargs| |hpred|)
    (RETURN
     (COND
      (|domname|
       (PROGN
        (SETQ |domargs| (CDR |domname|))
        (SETQ |acc| NIL)
        (COND
         ((CDR |conform|)
          (PROGN
           ((LAMBDA (|bfVar#95| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#95|)
                     (PROGN (SETQ |pair| (CAR |bfVar#95|)) NIL))
                 (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |leftForm| (|getConstructorForm| (CAR |pair|)))
                  ((LAMBDA (|bfVar#96| |ap|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#96|)
                            (PROGN (SETQ |ap| (CAR |bfVar#96|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |ap|)
                             (PROGN
                              (SETQ |args| (CAR |ap|))
                              (SETQ |pred| (CDR |ap|))
                              #1#)
                             (PROGN
                              (SETQ |match?|
                                      (COND ((EQUAL |domargs| |args|) T)
                                            ((HAS_SHARP_VAR |args|)
                                             (EQUAL |domargs|
                                                    (|sublisFormal|
                                                     (IFCDR |domname|)
                                                     |args|)))
                                            (#1# NIL)))
                              (COND ((NULL |match?|) '|skip|)
                                    (#1#
                                     (PROGN
                                      (SETQ |npred|
                                              (|sublisFormal|
                                               (IFCDR |leftForm|) |pred|))
                                      (SETQ |acc|
                                              (CONS (CONS |leftForm| |npred|)
                                                    |acc|)))))))))
                      (SETQ |bfVar#96| (CDR |bfVar#96|))))
                   (CDR |pair|) NIL))))
               (SETQ |bfVar#95| (CDR |bfVar#95|))))
            |s| NIL)
           (NREVERSE |acc|)))
         (#1#
          (PROGN
           ((LAMBDA (|bfVar#97| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#97|)
                     (PROGN (SETQ |pair| (CAR |bfVar#97|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |leftForm|
                          (OR (|getConstructorForm| (CAR |pair|))
                              (|systemError| NIL)))
                  (RPLACA |pair| |leftForm|)
                  (RPLACD |pair|
                          (|sublisFormal| (IFCDR |leftForm|) (CDR |pair|))))))
               (SETQ |bfVar#97| (CDR |bfVar#97|))))
            |s| NIL)
           |s|)))))
      (#1#
       (PROGN
        (SETQ |acc| NIL)
        (COND
         ((IFCDR |conform|)
          (PROGN
           (SETQ |farglist|
                   (TAKE (LENGTH (CDR |conform|)) |$FormalMapVariableList|))
           ((LAMBDA (|bfVar#98| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#98|)
                     (PROGN (SETQ |pair| (CAR |bfVar#98|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |leftForm| (|getConstructorForm| (CAR |pair|)))
                  ((LAMBDA (|bfVar#99| |ap|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#99|)
                            (PROGN (SETQ |ap| (CAR |bfVar#99|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |ap|)
                             (PROGN
                              (SETQ |args| (CAR |ap|))
                              (SETQ |pred| (CDR |ap|))
                              #1#)
                             (PROGN
                              (SETQ |hasArgsForm?|
                                      (NOT (EQUAL |args| |farglist|)))
                              (SETQ |npred|
                                      (|sublisFormal| (IFCDR |leftForm|)
                                       |pred|))
                              (COND
                               (|hasArgsForm?|
                                (SETQ |subargs|
                                        (|sublisFormal| (IFCDR |leftForm|)
                                         |args|))
                                (SETQ |hpred| (CONS '|hasArgs| |subargs|))
                                (SETQ |npred| (|quickAnd| |hpred| |npred|))))
                              (SETQ |acc|
                                      (CONS (CONS |leftForm| |npred|)
                                            |acc|))))))
                      (SETQ |bfVar#99| (CDR |bfVar#99|))))
                   (CDR |pair|) NIL))))
               (SETQ |bfVar#98| (CDR |bfVar#98|))))
            |s| NIL)
           (NREVERSE |acc|)))
         (#1#
          (PROGN
           ((LAMBDA (|bfVar#100| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#100|)
                     (PROGN (SETQ |pair| (CAR |bfVar#100|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |leftForm| (|getConstructorForm| (CAR |pair|)))
                  (RPLACA |pair| |leftForm|)
                  (RPLACD |pair|
                          (|sublisFormal| (IFCDR |leftForm|) (CDR |pair|))))))
               (SETQ |bfVar#100| (CDR |bfVar#100|))))
            |s| NIL)
           |s|)))))))))

; sublisFormal(args,exp,:options) == main where
;   main ==  --use only on LIST structures; see also sublisFormalAlist
;     $formals: local := IFCAR options or $FormalMapVariableList
;     null args => exp
;     sublisFormal1(args,exp,#args - 1)
;   sublisFormal1(args,x,n) ==    --[sublisFormal1(args,y) for y in x]
;     x is [.,:.] =>
;       acc := nil
;       y := x
;       while null atom y repeat
;         acc := [sublisFormal1(args,QCAR y,n),:acc]
;         y := QCDR y
;       r := NREVERSE acc
;       if y then
;         nd := LASTNODE r
;         RPLACD(nd,sublisFormal1(args,y,n))
;       r
;     IDENTP x =>
;       j := or/[i for f in $formals for i in 0..n | EQ(f,x)] =>
;           args.j
;       x
;     x

(DEFUN |sublisFormal| (|args| |exp| &REST |options|)
  (PROG (|$formals|)
    (DECLARE (SPECIAL |$formals|))
    (RETURN
     (PROGN
      (SETQ |$formals| (OR (IFCAR |options|) |$FormalMapVariableList|))
      (COND ((NULL |args|) |exp|)
            ('T
             (|sublisFormal,sublisFormal1| |args| |exp|
              (- (LENGTH |args|) 1))))))))
(DEFUN |sublisFormal,sublisFormal1| (|args| |x| |n|)
  (PROG (DOT |acc| |y| |r| |nd| |j|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ DOT (CDR |x|)) #1='T))
       (PROGN
        (SETQ |acc| NIL)
        (SETQ |y| |x|)
        ((LAMBDA ()
           (LOOP
            (COND ((ATOM |y|) (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |acc|
                            (CONS
                             (|sublisFormal,sublisFormal1| |args| (QCAR |y|)
                              |n|)
                             |acc|))
                    (SETQ |y| (QCDR |y|))))))))
        (SETQ |r| (NREVERSE |acc|))
        (COND
         (|y| (SETQ |nd| (LASTNODE |r|))
          (RPLACD |nd| (|sublisFormal,sublisFormal1| |args| |y| |n|))))
        |r|))
      ((IDENTP |x|)
       (COND
        ((SETQ |j|
                 ((LAMBDA (|bfVar#102| |bfVar#101| |f| |i|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#101|)
                           (PROGN (SETQ |f| (CAR |bfVar#101|)) NIL)
                           (> |i| |n|))
                       (RETURN |bfVar#102|))
                      (#1#
                       (AND (EQ |f| |x|)
                            (PROGN
                             (SETQ |bfVar#102| |i|)
                             (COND (|bfVar#102| (RETURN |bfVar#102|)))))))
                     (SETQ |bfVar#101| (CDR |bfVar#101|))
                     (SETQ |i| (+ |i| 1))))
                  NIL |$formals| NIL 0))
         (ELT |args| |j|))
        (#1# |x|)))
      (#1# |x|)))))

; buildDefaultPackageNamesHT() ==
;   $defaultPackageNamesHT := MAKE_HASHTABLE('EQUAL)
;   for nam in allConstructors() | isDefaultPackageName nam repeat
;     HPUT($defaultPackageNamesHT,nam,true)
;   $defaultPackageNamesHT

(DEFUN |buildDefaultPackageNamesHT| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$defaultPackageNamesHT| (MAKE_HASHTABLE 'EQUAL))
      ((LAMBDA (|bfVar#103| |nam|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#103|) (PROGN (SETQ |nam| (CAR |bfVar#103|)) NIL))
            (RETURN NIL))
           ('T
            (AND (|isDefaultPackageName| |nam|)
                 (HPUT |$defaultPackageNamesHT| |nam| T))))
          (SETQ |bfVar#103| (CDR |bfVar#103|))))
       (|allConstructors|) NIL)
      |$defaultPackageNamesHT|))))

; $defaultPackageNamesHT := buildDefaultPackageNamesHT()

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$defaultPackageNamesHT| (|buildDefaultPackageNamesHT|)))

; MAKEPROP('Record, 'documentation, '(
;   (_=  (((Boolean) _% _%)
;    "\spad{r = s} tests for equality of two records \spad{r} and \spad{s}"))
;   (coerce (((OutputForm) _%)
;    "\spad{coerce(r)} returns a representation of \spad{r} as an output form")
;          ((_% (List (Any)))
;    "\spad{coerce(u)}, where \spad{u} is the list \spad{[x,y]} for \spad{x} of type \spad{A} and \spad{y} of type \spad{B}, returns the record \spad{[a:x,b:y]}"))
;   (construct ((_% A B)
;    "\spad{construct(x, y)} returns the record \spad{[a:x,b:y]}"))
;   (elt ((A % "a")
;    "\spad{r . a} returns the value stored in record \spad{r} under selector \spad{a}.")
;       ((B % "b")
;    "\spad{r . b} returns the value stored in record \spad{r} under selector \spad{b}."))
;   (setelt_! ((A % "a" A)
;    "\spad{r . a := x} destructively replaces the value stored in record \spad{r} under selector \spad{a} by the value of \spad{x}. Error: if \spad{r} has not been previously assigned a value.")
;          ((B % "b" B)
;    "\spad{r . b := y} destructively replaces the value stored in record \spad{r} under selector \spad{b} by the value of \spad{y}. Error: if \spad{r} has not been previously assigned a value."))
;    ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Record| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{r = s} tests for equality of two records \\spad{r} and \\spad{s}"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(r)} returns a representation of \\spad{r} as an output form")
         ((% (|List| (|Any|)))
          "\\spad{coerce(u)}, where \\spad{u} is the list \\spad{[x,y]} for \\spad{x} of type \\spad{A} and \\spad{y} of type \\spad{B}, returns the record \\spad{[a:x,b:y]}"))
        (|construct|
         ((% A B)
          "\\spad{construct(x, y)} returns the record \\spad{[a:x,b:y]}"))
        (|elt|
         ((A % "a")
          "\\spad{r . a} returns the value stored in record \\spad{r} under selector \\spad{a}.")
         ((B % "b")
          "\\spad{r . b} returns the value stored in record \\spad{r} under selector \\spad{b}."))
        (|setelt!|
         ((A % "a" A)
          "\\spad{r . a := x} destructively replaces the value stored in record \\spad{r} under selector \\spad{a} by the value of \\spad{x}. Error: if \\spad{r} has not been previously assigned a value.")
         ((B % "b" B)
          "\\spad{r . b := y} destructively replaces the value stored in record \\spad{r} under selector \\spad{b} by the value of \\spad{y}. Error: if \\spad{r} has not been previously assigned a value.")))))))

; MAKEPROP('UntaggedUnion, 'documentation, '(
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
;   (case (((Boolean) % A)
;     "\spad{u case A} tests if \spad{u} is of the type \spad{A} branch of the union.")
;         (((Boolean) % B)
;     "\spad{u case B} tests if \spad{u} is of the \spad{B} branch of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of the \spad{A} branch of the union. Error: if \spad{u} is of the \spad{B} branch of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of the \spad{B} branch of the union. Error: if \spad{u} is of the \spad{A} branch of the union.")
;           ((% A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           ((% B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|UntaggedUnion| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
        (CASE
            (((|Boolean|) % A)
             "\\spad{u case A} tests if \\spad{u} is of the type \\spad{A} branch of the union.")
          (((|Boolean|) % B)
           "\\spad{u case B} tests if \\spad{u} is of the \\spad{B} branch of the union."))
        (|coerce|
         ((A %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of the \\spad{A} branch of the union. Error: if \\spad{u} is of the \\spad{B} branch of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of the \\spad{B} branch of the union. Error: if \\spad{u} is of the \\spad{A} branch of the union.")
         ((% A)
          "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
         ((% B)
          "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type.")))))))

; MAKEPROP('Union, 'documentation, '(
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if two objects of the union are equal, that is, \spad{u} and \spad{v} are objects of same branch which are equal."))
;   (case (((Boolean) % "a")
;     "\spad{u case a} tests if \spad{u} is of branch \spad{a} of the union.")
;         (((Boolean) % "b")
;     "\spad{u case b} tests if \spad{u} is of branch \spad{b} of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of the branch \spad{a} of the union. Error: if \spad{u} is of the branch \spad{b} of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of the branch \spad{b} of the union. Error: if \spad{u} is of the branch \spad{a} of the union.")
;           ((% A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           ((% B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Union| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if two objects of the union are equal, that is, \\spad{u} and \\spad{v} are objects of same branch which are equal."))
        (CASE
            (((|Boolean|) % "a")
             "\\spad{u case a} tests if \\spad{u} is of branch \\spad{a} of the union.")
          (((|Boolean|) % "b")
           "\\spad{u case b} tests if \\spad{u} is of branch \\spad{b} of the union."))
        (|coerce|
         ((A %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of the branch \\spad{a} of the union. Error: if \\spad{u} is of the branch \\spad{b} of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of the branch \\spad{b} of the union. Error: if \\spad{u} is of the branch \\spad{a} of the union.")
         ((% A)
          "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
         ((% B)
          "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type.")))))))

; MAKEPROP('Mapping, 'documentation, '(
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if mapping objects are equal."))
;    ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Mapping| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if mapping objects are equal.")))))))

; MAKEPROP('Enumeration, 'documentation, '(
;   (_= (((Boolean) _% _%)
;     "\spad{e = f} tests for equality of two enumerations \spad{e} and \spad{f}"))
;   (_^_= (((Boolean) _% _%)
;     "\spad{e ~= f} tests that two enumerations \spad{e} and \spad{f} are not equal"))
;   (coerce (((OutputForm) _%)
;      "\spad{coerce(e)} returns a representation of enumeration \spad{r} as an output form")
;           ((_% (Symbol))
;      "\spad{coerce(s)} converts a symbol \spad{s} into an enumeration which has \spad{s} as a member symbol"))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Enumeration| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{e = f} tests for equality of two enumerations \\spad{e} and \\spad{f}"))
        (^=
         (((|Boolean|) % %)
          "\\spad{e ~= f} tests that two enumerations \\spad{e} and \\spad{f} are not equal"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(e)} returns a representation of enumeration \\spad{r} as an output form")
         ((% (|Symbol|))
          "\\spad{coerce(s)} converts a symbol \\spad{s} into an enumeration which has \\spad{s} as a member symbol")))))))
