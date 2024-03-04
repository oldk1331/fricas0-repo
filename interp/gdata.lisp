
; )package "BOOT"

(IN-PACKAGE "BOOT")

; localasy(asy, object, only, make_database?, noexpose) ==
;     SET_-FILE_-GETTER(object)
;     for domain in asy repeat
;         key := first(domain)
;         alist := rest(domain)
;         asharp_name := asharp_global_name(PATHNAME_-NAME(object), key,
;                                           LASSOC('typeCode, alist))
;         #alist < 4 =>
;             -- handle toplevel function object
;             opname := key
;             modemap := CAR(LASSOC('modemaps, alist))
;             oldmaps := get_database(opname, 'OPERATION)
;             HPUT($operation_hash, opname, adjoin_equal(
;                 SUBST(asharp_name, opname, CDR(modemap)), oldmaps))
;             set_asharp_autoload_function(object, asharp_name)
;         if (null(only) => key ~= '%%; MEMBER(key, only)) then
;             $all_operations := []       -- force this to recompute
;             oldmaps := get_database(key, 'modemaps)
;             dbstruct := MAKE_-database()
;             PUT(key, 'DATABASE, dbstruct)
;             $all_constructors := ADJOIN(key, $all_constructors)
;             abbrev := fetch_data_from_alist(alist, '"abbreviation") or key
;             kind := set_dbstruct(dbstruct, FUNCTION(fetch_data_from_alist),
;                       alist, false,
;                         fetch_data_from_alist(alist, '"constructorForm"),
;                           abbrev, CONS(object, asharp_name))
;             PUT(abbrev, 'ABBREVIATIONFOR, key)
;             ADDOPERATIONS(key, oldmaps)
;             cname := opOf(database_-constructorform(dbstruct))
;             if not(noexpose) then setExposeAddConstr([cname])
;             if not(make_database?) then
;                 updateDatabase(cname) -- makes many hashtables???
;                 installConstructor(cname)
;                 -- following can break category database build
;                 if kind = 'category then
;                     SETF(database_-ancestors(dbstruct),
;                          fetch_data_from_alist(alist, '"ancestors"))
;                 if kind = 'domain then
;                     for pair in fetch_data_from_alist(alist, '"ancestors")
;                       repeat
;                         HPUT($has_category_hash, CONS(cname, CAAR(pair)),
;                              CDR(pair))
;                 if $InteractiveMode then $CategoryFrame := $EmptyEnvironment
;             if kind = 'category then
;                 set_asharp_autoload_category(object, cname, asharp_name,
;                                          database_-cosig(dbstruct))
;             else
;                 set_asharp_autoload_functor(object, cname, asharp_name,
;                                             database_-cosig(dbstruct))
;             sayKeyedMsg('S2IU0001i, [cname, object])

(DEFUN |localasy| (|asy| |object| |only| |make_database?| |noexpose|)
  (PROG (|key| |alist| |asharp_name| |opname| |modemap| |oldmaps| |dbstruct|
         |abbrev| |kind| |cname|)
    (RETURN
     (PROGN
      (SET-FILE-GETTER |object|)
      ((LAMBDA (|bfVar#1| |domain|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |domain| (CAR |bfVar#1|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |key| (CAR |domain|))
             (SETQ |alist| (CDR |domain|))
             (SETQ |asharp_name|
                     (|asharp_global_name| (PATHNAME-NAME |object|) |key|
                      (LASSOC '|typeCode| |alist|)))
             (COND
              ((< (LENGTH |alist|) 4)
               (PROGN
                (SETQ |opname| |key|)
                (SETQ |modemap| (CAR (LASSOC '|modemaps| |alist|)))
                (SETQ |oldmaps| (|get_database| |opname| 'OPERATION))
                (HPUT |$operation_hash| |opname|
                      (|adjoin_equal|
                       (SUBST |asharp_name| |opname| (CDR |modemap|))
                       |oldmaps|))
                (|set_asharp_autoload_function| |object| |asharp_name|)))
              (#1#
               (COND
                ((COND ((NULL |only|) (NOT (EQ |key| '%%)))
                       (#1# (MEMBER |key| |only|)))
                 (SETQ |$all_operations| NIL)
                 (SETQ |oldmaps| (|get_database| |key| '|modemaps|))
                 (SETQ |dbstruct| (|MAKE-database|))
                 (PUT |key| 'DATABASE |dbstruct|)
                 (SETQ |$all_constructors| (ADJOIN |key| |$all_constructors|))
                 (SETQ |abbrev|
                         (OR (|fetch_data_from_alist| |alist| "abbreviation")
                             |key|))
                 (SETQ |kind|
                         (|set_dbstruct| |dbstruct| #'|fetch_data_from_alist|
                          |alist| NIL
                          (|fetch_data_from_alist| |alist| "constructorForm")
                          |abbrev| (CONS |object| |asharp_name|)))
                 (PUT |abbrev| 'ABBREVIATIONFOR |key|)
                 (ADDOPERATIONS |key| |oldmaps|)
                 (SETQ |cname|
                         (|opOf| (|database-constructorform| |dbstruct|)))
                 (COND
                  ((NULL |noexpose|) (|setExposeAddConstr| (LIST |cname|))))
                 (COND
                  ((NULL |make_database?|) (|updateDatabase| |cname|)
                   (|installConstructor| |cname|)
                   (COND
                    ((EQ |kind| '|category|)
                     (SETF (|database-ancestors| |dbstruct|)
                             (|fetch_data_from_alist| |alist| "ancestors"))))
                   (COND
                    ((EQ |kind| '|domain|)
                     ((LAMBDA (|bfVar#2| |pair|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#2|)
                               (PROGN (SETQ |pair| (CAR |bfVar#2|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (HPUT |$has_category_hash|
                                 (CONS |cname| (CAAR |pair|)) (CDR |pair|))))
                         (SETQ |bfVar#2| (CDR |bfVar#2|))))
                      (|fetch_data_from_alist| |alist| "ancestors") NIL)))
                   (COND
                    (|$InteractiveMode|
                     (SETQ |$CategoryFrame| |$EmptyEnvironment|)))))
                 (COND
                  ((EQ |kind| '|category|)
                   (|set_asharp_autoload_category| |object| |cname|
                    |asharp_name| (|database-cosig| |dbstruct|)))
                  (#1#
                   (|set_asharp_autoload_functor| |object| |cname|
                    |asharp_name| (|database-cosig| |dbstruct|))))
                 (|sayKeyedMsg| '|S2IU0001i| (LIST |cname| |object|)))))))))
          (SETQ |bfVar#1| (CDR |bfVar#1|))))
       |asy| NIL)))))

; localnrlib1(in_f, key, object, make_database?, noexpose) ==
;     FILE_-POSITION(in_f, READ(in_f))
;     alist := READ(in_f)
;     -- (setq pos (third (assoc "constructorForm" alist :test #'string=)))
;     pos := first(rest(fetch_data_from_alist(alist, '"constructorForm")))
;     FILE_-POSITION(in_f, pos)
;     constructorform := READ(in_f)
;     key := first(constructorform)
;     oldmaps := get_database(key, 'MODEMAPS)
;     dbstruct := MAKE_-database()
;     PUT(key, 'DATABASE, dbstruct)
;     $all_constructors := ADJOIN(key, $all_constructors)
;     abbrev := INTERN(PATHNAME_-NAME(last(PATHNAME_-DIRECTORY(object))))
;     ds := [alist, in_f]
;     kind :=
;         set_dbstruct(dbstruct, FUNCTION(fetch_data_from_file), ds,
;                      make_database?, constructorform, abbrev, object)
;     $all_operations := []  -- force this to recompute
;     PUT(abbrev, 'ABBREVIATIONFOR, key)
;     ADDOPERATIONS(key, oldmaps)
;     if not(make_database?) then
;         if kind = 'category then
;             SETF(database_-ancestors(dbstruct),
;                  SUBLISLIS($FormalMapVariableList, rest(constructorform),
;                            fetch_data_from_file(ds, '"ancestors")))
;         updateDatabase(key) -- makes many hashtables???
;         installConstructor(key) -- used to be key cname ...
;         updateCategoryTable(key, kind)
;         if $InteractiveMode  then $CategoryFrame := $EmptyEnvironment
;     REMPROP(key, 'LOADED)
;     if not(noexpose) then setExposeAddConstr([key])
;     spad_set_autoload(key, object)
;     sayKeyedMsg('S2IU0001, [key, object])

(DEFUN |localnrlib1| (|in_f| |key| |object| |make_database?| |noexpose|)
  (PROG (|alist| |pos| |constructorform| |oldmaps| |dbstruct| |abbrev| |ds|
         |kind|)
    (RETURN
     (PROGN
      (FILE-POSITION |in_f| (READ |in_f|))
      (SETQ |alist| (READ |in_f|))
      (SETQ |pos|
              (CAR (CDR (|fetch_data_from_alist| |alist| "constructorForm"))))
      (FILE-POSITION |in_f| |pos|)
      (SETQ |constructorform| (READ |in_f|))
      (SETQ |key| (CAR |constructorform|))
      (SETQ |oldmaps| (|get_database| |key| 'MODEMAPS))
      (SETQ |dbstruct| (|MAKE-database|))
      (PUT |key| 'DATABASE |dbstruct|)
      (SETQ |$all_constructors| (ADJOIN |key| |$all_constructors|))
      (SETQ |abbrev|
              (INTERN (PATHNAME-NAME (|last| (PATHNAME-DIRECTORY |object|)))))
      (SETQ |ds| (LIST |alist| |in_f|))
      (SETQ |kind|
              (|set_dbstruct| |dbstruct| #'|fetch_data_from_file| |ds|
               |make_database?| |constructorform| |abbrev| |object|))
      (SETQ |$all_operations| NIL)
      (PUT |abbrev| 'ABBREVIATIONFOR |key|)
      (ADDOPERATIONS |key| |oldmaps|)
      (COND
       ((NULL |make_database?|)
        (COND
         ((EQ |kind| '|category|)
          (SETF (|database-ancestors| |dbstruct|)
                  (SUBLISLIS |$FormalMapVariableList| (CDR |constructorform|)
                   (|fetch_data_from_file| |ds| "ancestors")))))
        (|updateDatabase| |key|) (|installConstructor| |key|)
        (|updateCategoryTable| |key| |kind|)
        (COND
         (|$InteractiveMode| (SETQ |$CategoryFrame| |$EmptyEnvironment|)))))
      (REMPROP |key| 'LOADED)
      (COND ((NULL |noexpose|) (|setExposeAddConstr| (LIST |key|))))
      (|spad_set_autoload| |key| |object|)
      (|sayKeyedMsg| 'S2IU0001 (LIST |key| |object|))))))

; localnrlib(key, nrlib, object, make_database?, noexpose) ==
;     handle_input_file(nrlib, FUNCTION(localnrlib1),
;                       [key, object, make_database?, noexpose])

(DEFUN |localnrlib| (|key| |nrlib| |object| |make_database?| |noexpose|)
  (PROG ()
    (RETURN
     (|handle_input_file| |nrlib| #'|localnrlib1|
                          (LIST |key| |object| |make_database?| |noexpose|)))))
