
; )package "BOOT"

(IN-PACKAGE "BOOT")

; any_to_string(u) == WRITE_-TO_-STRING(u)

(DEFUN |any_to_string| (|u|) (PROG () (RETURN (WRITE-TO-STRING |u|))))

; value_to_form(arg, t, in_form?) ==
;     form :=
;          in_form? => ["InputForm"]
;          $OutputForm
;     isValidType(t) and PAIRP(t) and
;             (get_database(first(t), 'CONSTRUCTORKIND) = 'domain) =>
;         (val := coerceInteractive(objNewWrap(arg, t), form)) =>
;             objValUnwrap(val)
;         -- Wrong, but we try to produce something
;         in_form? => ["error", '"Bad value"]
;         any_to_string(arg)
;     -- Wrong, but we try to produce something
;     in_form? => ["error", '"Bad value"]
;     any_to_string(arg)

(DEFUN |value_to_form| (|arg| |t| |in_form?|)
  (PROG (|form| |val|)
    (RETURN
     (PROGN
      (SETQ |form|
              (COND (|in_form?| (LIST '|InputForm|)) (#1='T |$OutputForm|)))
      (COND
       ((AND (|isValidType| |t|) (CONSP |t|)
             (EQ (|get_database| (CAR |t|) 'CONSTRUCTORKIND) '|domain|))
        (COND
         ((SETQ |val| (|coerceInteractive| (|objNewWrap| |arg| |t|) |form|))
          (|objValUnwrap| |val|))
         (|in_form?| (LIST '|error| "Bad value"))
         (#1# (|any_to_string| |arg|))))
       (|in_form?| (LIST '|error| "Bad value"))
       (#1# (|any_to_string| |arg|)))))))

; arg_to_form(arg, t, c, in_form?) ==
;     c => constructor_to_form(arg, in_form?)
;     value_to_form(arg, t, in_form?)

(DEFUN |arg_to_form| (|arg| |t| |c| |in_form?|)
  (PROG ()
    (RETURN
     (COND (|c| (|constructor_to_form| |arg| |in_form?|))
           ('T (|value_to_form| |arg| |t| |in_form?|))))))

; prefix_to_string(con) ==
;     u := prefix2String(con)
;     atom(u) => u
;     concatenateStringList([object2String(x) for x in u])

(DEFUN |prefix_to_string| (|con|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|prefix2String| |con|))
      (COND ((ATOM |u|) |u|)
            (#1='T
             (|concatenateStringList|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1#
                    (SETQ |bfVar#2| (CONS (|object2String| |x|) |bfVar#2|))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |u| NIL))))))))

; mkCategory_to_OutputForm(argl) ==
;     throwMessage('"mkCategory_to_OutputForm called")

(DEFUN |mkCategory_to_OutputForm| (|argl|)
  (PROG () (RETURN (|throwMessage| "mkCategory_to_OutputForm called"))))

; Join_to_OutputForm(argl) ==
;     throwMessage('"Join_to_OutputForm called")

(DEFUN |Join_to_OutputForm| (|argl|)
  (PROG () (RETURN (|throwMessage| "Join_to_OutputForm called"))))

; record_arg_to_form(at, in_form?) ==
;     [., name, type] := at
;     in_form? => [":", name, constructor_to_form(type, in_form?)]
;     ['CONCAT, name, '":", constructor_to_form(type, in_form?)]

(DEFUN |record_arg_to_form| (|at| |in_form?|)
  (PROG (|name| |type|)
    (RETURN
     (PROGN
      (SETQ |name| (CADR . #1=(|at|)))
      (SETQ |type| (CADDR . #1#))
      (COND
       (|in_form?|
        (LIST '|:| |name| (|constructor_to_form| |type| |in_form?|)))
       ('T
        (LIST 'CONCAT |name| ":"
              (|constructor_to_form| |type| |in_form?|))))))))

; record_args_to_form(argl, in_form?) ==
;     res := []
;     for at in argl repeat
;         res := cons(record_arg_to_form(at, in_form?), res)
;     nreverse(res)

(DEFUN |record_args_to_form| (|argl| |in_form?|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#3| |at|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |at| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           ('T
            (SETQ |res| (CONS (|record_arg_to_form| |at| |in_form?|) |res|))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |argl| NIL)
      (NREVERSE |res|)))))

; Record_to_form(argl, in_form?) ==
;     cons('Record, record_args_to_form(argl, in_form?))

(DEFUN |Record_to_form| (|argl| |in_form?|)
  (PROG () (RETURN (CONS '|Record| (|record_args_to_form| |argl| |in_form?|)))))

; Union_to_form(argl, in_form?) ==
;     not(null(argl)) and (first(argl) is [":", name, type]) =>
;         -- new style Union
;         cons('Union, record_args_to_form(argl, in_form?))
;     -- old style
;     cons('Union, [constructor_to_form(arg, in_form?) for arg in argl])

(DEFUN |Union_to_form| (|argl| |in_form?|)
  (PROG (|ISTMP#1| |ISTMP#2| |name| |ISTMP#3| |type|)
    (RETURN
     (COND
      ((AND (NULL (NULL |argl|))
            (PROGN
             (SETQ |ISTMP#1| (CAR |argl|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |name| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (PROGN
                               (SETQ |type| (CAR |ISTMP#3|))
                               #1='T))))))))
       (CONS '|Union| (|record_args_to_form| |argl| |in_form?|)))
      (#1#
       (CONS '|Union|
             ((LAMBDA (|bfVar#5| |bfVar#4| |arg|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#4|)
                       (PROGN (SETQ |arg| (CAR |bfVar#4|)) NIL))
                   (RETURN (NREVERSE |bfVar#5|)))
                  (#1#
                   (SETQ |bfVar#5|
                           (CONS (|constructor_to_form| |arg| |in_form?|)
                                 |bfVar#5|))))
                 (SETQ |bfVar#4| (CDR |bfVar#4|))))
              NIL |argl| NIL)))))))

; Mapping_to_form(argl, in_form?) ==
;     -- should we allow this ???
;     null(argl) =>
;         in_form? => ["error", '"Bad mapping"]
;         ['PAREN, ["->", '"()", '"()"]]
;     rt := constructor_to_form(first(argl), in_form?)
;     nargs := [constructor_to_form(arg, in_form?) for arg in rest(argl)]
;     in_form? => ["Mapping", rt, :nargs]
;     if #nargs > 1 then
;         nargs := ['PAREN, ['AGGLST, :nargs]]
;     else if null(nargs) then
;         nargs := '"()"
;     else
;         nargs := first(nargs)
;     ['PAREN, ["->", nargs, rt]]

(DEFUN |Mapping_to_form| (|argl| |in_form?|)
  (PROG (|rt| |nargs|)
    (RETURN
     (COND
      ((NULL |argl|)
       (COND (|in_form?| (LIST '|error| "Bad mapping"))
             (#1='T (LIST 'PAREN (LIST '-> "()" "()")))))
      (#1#
       (PROGN
        (SETQ |rt| (|constructor_to_form| (CAR |argl|) |in_form?|))
        (SETQ |nargs|
                ((LAMBDA (|bfVar#7| |bfVar#6| |arg|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#6|)
                          (PROGN (SETQ |arg| (CAR |bfVar#6|)) NIL))
                      (RETURN (NREVERSE |bfVar#7|)))
                     (#1#
                      (SETQ |bfVar#7|
                              (CONS (|constructor_to_form| |arg| |in_form?|)
                                    |bfVar#7|))))
                    (SETQ |bfVar#6| (CDR |bfVar#6|))))
                 NIL (CDR |argl|) NIL))
        (COND (|in_form?| (CONS '|Mapping| (CONS |rt| |nargs|)))
              (#1#
               (PROGN
                (COND
                 ((< 1 (LENGTH |nargs|))
                  (SETQ |nargs| (LIST 'PAREN (CONS 'AGGLST |nargs|))))
                 ((NULL |nargs|) (SETQ |nargs| "()"))
                 (#1# (SETQ |nargs| (CAR |nargs|))))
                (LIST 'PAREN (LIST '-> |nargs| |rt|)))))))))))

; constructor_to_form(con, in_form?) ==
;     if VECTORP(con) then
;         con := devaluate(con)
;     STRINGP(con) =>
;         in_form? => con
;         CONCAT("_"", con, "_"")
;     ATOM(con) =>
;         con = $EmptyMode => '"?"
;         -- Wrong, but we try to produce something
;         in_form? => ["error", '"Bad type"]
;         any_to_string(con)
;     op := first(con)
;     argl := rest(con)
;
;     op = 'Join => Join_to_OutputForm(argl)
;     op = 'mkCategory => mkCategory_to_OutputForm(argl)
;     op = 'Enumeration =>
;         in_form? => con
;         prefix_to_string(con)
;     op = 'Record => Record_to_form(argl, in_form?)
;     op = 'Union => Union_to_form(argl, in_form?)
;     op = 'Mapping => Mapping_to_form(argl, in_form?)
;     (abb := constructor?(op)) =>
;         null(argl) =>
;             in_form? => con
;             constructorName(op)
;         con_sig := getConstructorSignature(op)
;         cosig := get_database(op, 'COSIG)
;         null(con_sig) or null(cosig) =>
;             -- Wrong, but we try to produce something
;             in_form? => ["error", '"Bad type"]
;             prefix_to_string(con)
;         con_sig := rest(con_sig)
;         cosig := rest(cosig)
;         if not freeOfSharpVars(con_sig) then
;             con_sig := SUBLIS([[s_var, :val]
;                                for s_var in $FormalMapVariableList
;                                for val in argl], con_sig)
;         n_argl := [arg_to_form(arg, t, c, in_form?) for arg in argl
;                    for t in con_sig for c in cosig]
;         in_form? => cons(op, n_argl)
;         [constructorName(op), :n_argl]
;     -- Wrong, but we try to produce something
;     in_form? => ["error", '"Bad type"]
;     prefix_to_string(con)

(DEFUN |constructor_to_form| (|con| |in_form?|)
  (PROG (|op| |argl| |abb| |con_sig| |cosig| |n_argl|)
    (RETURN
     (PROGN
      (COND ((VECTORP |con|) (SETQ |con| (|devaluate| |con|))))
      (COND
       ((STRINGP |con|)
        (COND (|in_form?| |con|) (#1='T (CONCAT '|"| |con| '|"|))))
       ((ATOM |con|)
        (COND ((EQUAL |con| |$EmptyMode|) "?")
              (|in_form?| (LIST '|error| "Bad type"))
              (#1# (|any_to_string| |con|))))
       (#1#
        (PROGN
         (SETQ |op| (CAR |con|))
         (SETQ |argl| (CDR |con|))
         (COND ((EQ |op| '|Join|) (|Join_to_OutputForm| |argl|))
               ((EQ |op| '|mkCategory|) (|mkCategory_to_OutputForm| |argl|))
               ((EQ |op| '|Enumeration|)
                (COND (|in_form?| |con|) (#1# (|prefix_to_string| |con|))))
               ((EQ |op| '|Record|) (|Record_to_form| |argl| |in_form?|))
               ((EQ |op| '|Union|) (|Union_to_form| |argl| |in_form?|))
               ((EQ |op| '|Mapping|) (|Mapping_to_form| |argl| |in_form?|))
               ((SETQ |abb| (|constructor?| |op|))
                (COND
                 ((NULL |argl|)
                  (COND (|in_form?| |con|) (#1# (|constructorName| |op|))))
                 (#1#
                  (PROGN
                   (SETQ |con_sig| (|getConstructorSignature| |op|))
                   (SETQ |cosig| (|get_database| |op| 'COSIG))
                   (COND
                    ((OR (NULL |con_sig|) (NULL |cosig|))
                     (COND (|in_form?| (LIST '|error| "Bad type"))
                           (#1# (|prefix_to_string| |con|))))
                    (#1#
                     (PROGN
                      (SETQ |con_sig| (CDR |con_sig|))
                      (SETQ |cosig| (CDR |cosig|))
                      (COND
                       ((NULL (|freeOfSharpVars| |con_sig|))
                        (SETQ |con_sig|
                                (SUBLIS
                                 ((LAMBDA
                                      (|bfVar#10| |bfVar#8| |s_var| |bfVar#9|
                                       |val|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#8|)
                                           (PROGN
                                            (SETQ |s_var| (CAR |bfVar#8|))
                                            NIL)
                                           (ATOM |bfVar#9|)
                                           (PROGN
                                            (SETQ |val| (CAR |bfVar#9|))
                                            NIL))
                                       (RETURN (NREVERSE |bfVar#10|)))
                                      (#1#
                                       (SETQ |bfVar#10|
                                               (CONS (CONS |s_var| |val|)
                                                     |bfVar#10|))))
                                     (SETQ |bfVar#8| (CDR |bfVar#8|))
                                     (SETQ |bfVar#9| (CDR |bfVar#9|))))
                                  NIL |$FormalMapVariableList| NIL |argl| NIL)
                                 |con_sig|))))
                      (SETQ |n_argl|
                              ((LAMBDA
                                   (|bfVar#14| |bfVar#11| |arg| |bfVar#12| |t|
                                    |bfVar#13| |c|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#11|)
                                        (PROGN
                                         (SETQ |arg| (CAR |bfVar#11|))
                                         NIL)
                                        (ATOM |bfVar#12|)
                                        (PROGN (SETQ |t| (CAR |bfVar#12|)) NIL)
                                        (ATOM |bfVar#13|)
                                        (PROGN
                                         (SETQ |c| (CAR |bfVar#13|))
                                         NIL))
                                    (RETURN (NREVERSE |bfVar#14|)))
                                   (#1#
                                    (SETQ |bfVar#14|
                                            (CONS
                                             (|arg_to_form| |arg| |t| |c|
                                              |in_form?|)
                                             |bfVar#14|))))
                                  (SETQ |bfVar#11| (CDR |bfVar#11|))
                                  (SETQ |bfVar#12| (CDR |bfVar#12|))
                                  (SETQ |bfVar#13| (CDR |bfVar#13|))))
                               NIL |argl| NIL |con_sig| NIL |cosig| NIL))
                      (COND (|in_form?| (CONS |op| |n_argl|))
                            (#1#
                             (CONS (|constructorName| |op|) |n_argl|))))))))))
               (|in_form?| (LIST '|error| "Bad type"))
               (#1# (|prefix_to_string| |con|))))))))))

; constructor_to_OutputForm(con) == constructor_to_form(con, false)

(DEFUN |constructor_to_OutputForm| (|con|)
  (PROG () (RETURN (|constructor_to_form| |con| NIL))))

; constructor_to_InputForm(con) == constructor_to_form(con, true)

(DEFUN |constructor_to_InputForm| (|con|)
  (PROG () (RETURN (|constructor_to_form| |con| T))))
