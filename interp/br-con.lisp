
; )package "BOOT"

(IN-PACKAGE "BOOT")

; conPage(a) ==
;   --The next 4 lines allow e.g. MATRIX INT  ==> Matrix Integer (see kPage)
;   form :=
;     atom a => [a]
;     a
;   $conArgstrings : local := [form2HtString x for x in IFCDR a]
;   a := first form
;   da := DOWNCASE a
;   pageName := QLASSQ(da, '((type . CategoryType) (union . DomainUnion) _
;                            (record . DomainRecord) (mapping . DomainMapping) _
;                            (enumeration . DomainEnumeration))) =>
;       downlink pageName       --special jump out for primitive domains
;   line := conPageFastPath da  => kPage(line, [form]) --lower case name of cons?
;   line := conPageFastPath UPCASE a => kPage(line, [form]) --upper case an abbr?
;   ySearch a       --slow search (include default packages)

(DEFUN |conPage| (|a|)
  (PROG (|$conArgstrings| |line| |pageName| |da| |form|)
    (DECLARE (SPECIAL |$conArgstrings|))
    (RETURN
     (PROGN
      (SETQ |form| (COND ((ATOM |a|) (LIST |a|)) (#1='T |a|)))
      (SETQ |$conArgstrings|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1#
                    (SETQ |bfVar#2| (CONS (|form2HtString| |x|) |bfVar#2|))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL (IFCDR |a|) NIL))
      (SETQ |a| (CAR |form|))
      (SETQ |da| (DOWNCASE |a|))
      (COND
       ((SETQ |pageName|
                (QLASSQ |da|
                 '((|type| . |CategoryType|) (|union| . |DomainUnion|)
                   (|record| . |DomainRecord|) (|mapping| . |DomainMapping|)
                   (|enumeration| . |DomainEnumeration|))))
        (|downlink| |pageName|))
       ((SETQ |line| (|conPageFastPath| |da|)) (|kPage| |line| (LIST |form|)))
       ((SETQ |line| (|conPageFastPath| (UPCASE |a|)))
        (|kPage| |line| (LIST |form|)))
       (#1# (|ySearch| |a|)))))))

; conPageFastPath x == --called by conPage and constructorSearch
; --gets line quickly for constructor name or abbreviation
;   s := STRINGIMAGE x
;   charPosition(char '_*,s,0) < #s => nil     --quit if name has * in it
;   name := (STRINGP x => INTERN x; x)
;   entry := HGET($lowerCaseConTb,name) or return nil
;   conPageConEntry first entry

(DEFUN |conPageFastPath| (|x|)
  (PROG (|s| |name| |entry|)
    (RETURN
     (PROGN
      (SETQ |s| (STRINGIMAGE |x|))
      (COND ((< (|charPosition| (|char| '*) |s| 0) (LENGTH |s|)) NIL)
            (#1='T
             (PROGN
              (SETQ |name| (COND ((STRINGP |x|) (INTERN |x|)) (#1# |x|)))
              (SETQ |entry| (OR (HGET |$lowerCaseConTb| |name|) (RETURN NIL)))
              (|conPageConEntry| (CAR |entry|)))))))))

; conPageConEntry entry ==
;   $conname: local := nil
;   $conform: local := nil
;   $exposed?:local := nil
;   $doc:     local := nil
;   $kind:    local := nil
;   buildLibdbConEntry entry

(DEFUN |conPageConEntry| (|entry|)
  (PROG (|$kind| |$doc| |$exposed?| |$conform| |$conname|)
    (DECLARE (SPECIAL |$kind| |$doc| |$exposed?| |$conform| |$conname|))
    (RETURN
     (PROGN
      (SETQ |$conname| NIL)
      (SETQ |$conform| NIL)
      (SETQ |$exposed?| NIL)
      (SETQ |$doc| NIL)
      (SETQ |$kind| NIL)
      (|buildLibdbConEntry| |entry|)))))

; kxPage(htPage,name) == downlink name

(DEFUN |kxPage| (|htPage| |name|) (PROG () (RETURN (|downlink| |name|))))

; kArgPage(htPage,arg) ==
;   [op,:args] := conform := htpProperty(htPage,'conform)
;   domname := htpProperty(htPage,'domname)
;   heading := htpProperty(htPage,'heading)
;   source := CDDAR getConstructorModemap op
;   n := position(arg,args)
;   typeForm := sublisFormal(args,source . n)
;   domTypeForm := mkDomTypeForm(typeForm,conform,domname)
;   descendants := domainDescendantsOf(typeForm,domTypeForm)
;   htpSetProperty(htPage,'cAlist,descendants)
;   rank :=
;     n > 4 => nil
;     ('(First Second Third Fourth Fifth)).n
;   htpSetProperty(htPage,'rank,rank)
;   htpSetProperty(htPage,'thing,'"argument")
;   dbShowCons(htPage,'names)

(DEFUN |kArgPage| (|htPage| |arg|)
  (PROG (|conform| |op| |args| |domname| |heading| |source| |n| |typeForm|
         |domTypeForm| |descendants| |rank|)
    (RETURN
     (PROGN
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |op| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |domname| (|htpProperty| |htPage| '|domname|))
      (SETQ |heading| (|htpProperty| |htPage| '|heading|))
      (SETQ |source| (CDDAR (|getConstructorModemap| |op|)))
      (SETQ |n| (|position| |arg| |args|))
      (SETQ |typeForm| (|sublisFormal| |args| (ELT |source| |n|)))
      (SETQ |domTypeForm| (|mkDomTypeForm| |typeForm| |conform| |domname|))
      (SETQ |descendants| (|domainDescendantsOf| |typeForm| |domTypeForm|))
      (|htpSetProperty| |htPage| '|cAlist| |descendants|)
      (SETQ |rank|
              (COND ((< 4 |n|) NIL)
                    ('T
                     (ELT '(|First| |Second| |Third| |Fourth| |Fifth|) |n|))))
      (|htpSetProperty| |htPage| '|rank| |rank|)
      (|htpSetProperty| |htPage| '|thing| "argument")
      (|dbShowCons| |htPage| '|names|)))))

; mkDomTypeForm(typeForm,conform,domname) == --called by kargPage
;   domname => SUBLISLIS(rest domname,rest conform,typeForm)
;   typeForm is ['Join,:r] => ['Join,:[mkDomTypeForm(t,conform,domname) for t in r]]
;   null hasIdent typeForm => typeForm
;   nil

(DEFUN |mkDomTypeForm| (|typeForm| |conform| |domname|)
  (PROG (|r|)
    (RETURN
     (COND (|domname| (SUBLISLIS (CDR |domname|) (CDR |conform|) |typeForm|))
           ((AND (CONSP |typeForm|) (EQ (CAR |typeForm|) '|Join|)
                 (PROGN (SETQ |r| (CDR |typeForm|)) #1='T))
            (CONS '|Join|
                  ((LAMBDA (|bfVar#4| |bfVar#3| |t|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#3|)
                            (PROGN (SETQ |t| (CAR |bfVar#3|)) NIL))
                        (RETURN (NREVERSE |bfVar#4|)))
                       (#1#
                        (SETQ |bfVar#4|
                                (CONS (|mkDomTypeForm| |t| |conform| |domname|)
                                      |bfVar#4|))))
                      (SETQ |bfVar#3| (CDR |bfVar#3|))))
                   NIL |r| NIL)))
           ((NULL (|hasIdent| |typeForm|)) |typeForm|) (#1# NIL)))))

; domainDescendantsOf(conform,domform) == main where --called by kargPage
;   main ==
;     conform is [op,:r] =>
;       op = 'Join => jfn(r, IFCDR domform)
;       op = 'CATEGORY => nil
;       domainsOf(conform,domform)
;     domainsOf(conform,domform)
;   jfn([y,:r],domlist) ==  --keep only those domains that appear in ALL parts of Join
;     alist := domainsOf(y,IFCAR domlist)
;     for x in r repeat
;       domlist := IFCDR domlist
;       x is ['CATEGORY,.,:r] => alist := catScreen(r,alist)
;       keepList := nil
;       for [item,:pred] in domainsOf(x,IFCAR domlist) repeat
;         u := assoc(item,alist) =>
;             keepList := [[item, :quickAnd(rest u, pred)], :keepList]
;       alist := keepList
;     for pair in alist repeat RPLACD(pair, simpHasPred rest pair)
;     listSort(function GLESSEQP, alist)
;   catScreen(r,alist) ==
;     for x in r repeat
;       x isnt [op1,:.] and MEMQ(op1,'(ATTRIBUTE SIGNATURE)) => systemError x
;       alist := [[item,:npred] for [item,:pred] in alist |
;         (pred1 := simpHasPred ['has,item,x]) and (npred := quickAnd(pred1,pred))]
;     alist

(DEFUN |domainDescendantsOf| (|conform| |domform|)
  (PROG (|op| |r|)
    (RETURN
     (COND
      ((AND (CONSP |conform|)
            (PROGN
             (SETQ |op| (CAR |conform|))
             (SETQ |r| (CDR |conform|))
             #1='T))
       (COND
        ((EQ |op| '|Join|) (|domainDescendantsOf,jfn| |r| (IFCDR |domform|)))
        ((EQ |op| 'CATEGORY) NIL) (#1# (|domainsOf| |conform| |domform|))))
      (#1# (|domainsOf| |conform| |domform|))))))
(DEFUN |domainDescendantsOf,jfn| (|bfVar#13| |domlist|)
  (PROG (|y| |r| |alist| |ISTMP#1| |keepList| |item| |pred| |u|)
    (RETURN
     (PROGN
      (SETQ |y| (CAR |bfVar#13|))
      (SETQ |r| (CDR |bfVar#13|))
      (SETQ |alist| (|domainsOf| |y| (IFCAR |domlist|)))
      ((LAMBDA (|bfVar#5| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |x| (CAR |bfVar#5|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |domlist| (IFCDR |domlist|))
             (COND
              ((AND (CONSP |x|) (EQ (CAR |x|) 'CATEGORY)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |x|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1#))))
               (SETQ |alist| (|domainDescendantsOf,catScreen| |r| |alist|)))
              (#1#
               (PROGN
                (SETQ |keepList| NIL)
                ((LAMBDA (|bfVar#7| |bfVar#6|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#7|)
                          (PROGN (SETQ |bfVar#6| (CAR |bfVar#7|)) NIL))
                      (RETURN NIL))
                     (#1#
                      (AND (CONSP |bfVar#6|)
                           (PROGN
                            (SETQ |item| (CAR |bfVar#6|))
                            (SETQ |pred| (CDR |bfVar#6|))
                            #1#)
                           (COND
                            ((SETQ |u| (|assoc| |item| |alist|))
                             (IDENTITY
                              (SETQ |keepList|
                                      (CONS
                                       (CONS |item|
                                             (|quickAnd| (CDR |u|) |pred|))
                                       |keepList|))))))))
                    (SETQ |bfVar#7| (CDR |bfVar#7|))))
                 (|domainsOf| |x| (IFCAR |domlist|)) NIL)
                (SETQ |alist| |keepList|)))))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |r| NIL)
      ((LAMBDA (|bfVar#8| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |pair| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1# (RPLACD |pair| (|simpHasPred| (CDR |pair|)))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |alist| NIL)
      (|listSort| #'GLESSEQP |alist|)))))
(DEFUN |domainDescendantsOf,catScreen| (|r| |alist|)
  (PROG (|op1| |item| |pred| |pred1| |npred|)
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#9| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |x| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((AND (NOT (AND (CONSP |x|) (PROGN (SETQ |op1| (CAR |x|)) #1#)))
                   (MEMQ |op1| '(ATTRIBUTE SIGNATURE)))
              (|systemError| |x|))
             (#1#
              (SETQ |alist|
                      ((LAMBDA (|bfVar#12| |bfVar#11| |bfVar#10|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#11|)
                                (PROGN (SETQ |bfVar#10| (CAR |bfVar#11|)) NIL))
                            (RETURN (NREVERSE |bfVar#12|)))
                           (#1#
                            (AND (CONSP |bfVar#10|)
                                 (PROGN
                                  (SETQ |item| (CAR |bfVar#10|))
                                  (SETQ |pred| (CDR |bfVar#10|))
                                  #1#)
                                 (SETQ |pred1|
                                         (|simpHasPred|
                                          (LIST '|has| |item| |x|)))
                                 (SETQ |npred| (|quickAnd| |pred1| |pred|))
                                 (SETQ |bfVar#12|
                                         (CONS (CONS |item| |npred|)
                                               |bfVar#12|)))))
                          (SETQ |bfVar#11| (CDR |bfVar#11|))))
                       NIL |alist| NIL))))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       |r| NIL)
      |alist|))))

; kePage(htPage) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   constring       := STRCONC(name,args)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   htpSetProperty(htPage,'domname,domname)
;   $conformsAreDomains: local := domname
;   conform         := mkConform(kind,name,args)
;   conname         := opOf conform
;   heading := [capitalize kind,'" {\sf ",
;                (domname => form2HtString(domname,nil,true); constring),'"}"]
;   data := sublisFormal(IFCDR domname or rest conform,
;                        getConstructorExports((domname or conform),true))
;   [conlist, :oplist] := data
;   if domname then
;     for x in conlist repeat  rplac(rest x, simpHasPred rest x)
;     for x in oplist   repeat rplac(CDDR x, simpHasPred CDDR x)
;   prefix := pluralSay(#conlist + #oplist, '"Export", '"Exports")
;   page := htInitPage([:prefix,'" of ",:heading],htCopyProplist htPage)
;   htSayStandard '"\beginmenu "
;   htpSetProperty(page,'data,data)
;   if conlist then
;     htMakePage [['bcLinks,[menuButton(),'"",'dbShowCons1,conlist,'names]]]
;     htSayStandard '"\tab{2}"
;     htSay  '"All attributes and operations from:"
;     bcConPredTable(conlist,opOf conform,rest conform)
;   if oplist then
;     if conlist then htBigSkip()
;     kePageDisplay(page, kePageOpAlist(oplist))
;   htSayStandard '" \endmenu "
;   htShowPage()

(DEFUN |kePage| (|htPage|)
  (PROG (|$conformsAreDomains| |page| |prefix| |oplist| |conlist| |data|
         |heading| |conname| |conform| |domname| |constring| |comments|
         |abbrev| |args| |sig| |xflag| |nargs| |name| |kind| |LETTMP#1|)
    (DECLARE (SPECIAL |$conformsAreDomains|))
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (|htpSetProperty| |htPage| '|domname| |domname|)
         (SETQ |$conformsAreDomains| |domname|)
         (SETQ |conform| (|mkConform| |kind| |name| |args|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |heading|
                 (LIST (|capitalize| |kind|) " {\\sf "
                       (COND (|domname| (|form2HtString| |domname| NIL T))
                             (#4# |constring|))
                       "}"))
         (SETQ |data|
                 (|sublisFormal| (OR (IFCDR |domname|) (CDR |conform|))
                  (|getConstructorExports| (OR |domname| |conform|) T)))
         (SETQ |conlist| (CAR |data|))
         (SETQ |oplist| (CDR |data|))
         (COND
          (|domname|
           ((LAMBDA (|bfVar#14| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#14|) (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDR |x|) (|simpHasPred| (CDR |x|)))))
               (SETQ |bfVar#14| (CDR |bfVar#14|))))
            |conlist| NIL)
           ((LAMBDA (|bfVar#15| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#15|) (PROGN (SETQ |x| (CAR |bfVar#15|)) NIL))
                 (RETURN NIL))
                (#4# (|rplac| (CDDR |x|) (|simpHasPred| (CDDR |x|)))))
               (SETQ |bfVar#15| (CDR |bfVar#15|))))
            |oplist| NIL)))
         (SETQ |prefix|
                 (|pluralSay| (+ (LENGTH |conlist|) (LENGTH |oplist|)) "Export"
                  "Exports"))
         (SETQ |page|
                 (|htInitPage| (APPEND |prefix| (CONS " of " |heading|))
                  (|htCopyProplist| |htPage|)))
         (|htSayStandard| "\\beginmenu ")
         (|htpSetProperty| |page| '|data| |data|)
         (COND
          (|conlist|
           (|htMakePage|
            (LIST
             (LIST '|bcLinks|
                   (LIST (|menuButton|) "" '|dbShowCons1| |conlist|
                         '|names|))))
           (|htSayStandard| "\\tab{2}")
           (|htSay| "All attributes and operations from:")
           (|bcConPredTable| |conlist| (|opOf| |conform|) (CDR |conform|))))
         (COND
          (|oplist| (COND (|conlist| (|htBigSkip|)))
           (|kePageDisplay| |page| (|kePageOpAlist| |oplist|))))
         (|htSayStandard| " \\endmenu ")
         (|htShowPage|))))))))

; kePageOpAlist oplist ==
;   opAlist := nil
;   for [op,sig,:pred] in oplist repeat
;     u := LASSOC(op,opAlist)
;     opAlist := insertAlist(zeroOneConvert op,[[sig,pred],:u],opAlist)
;   opAlist

(DEFUN |kePageOpAlist| (|oplist|)
  (PROG (|opAlist| |op| |ISTMP#1| |sig| |pred| |u|)
    (RETURN
     (PROGN
      (SETQ |opAlist| NIL)
      ((LAMBDA (|bfVar#17| |bfVar#16|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|)
                (PROGN (SETQ |bfVar#16| (CAR |bfVar#17|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#16|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#16|))
                  (SETQ |ISTMP#1| (CDR |bfVar#16|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |sig| (CAR |ISTMP#1|))
                        (SETQ |pred| (CDR |ISTMP#1|))
                        #1#)))
                 (PROGN
                  (SETQ |u| (LASSOC |op| |opAlist|))
                  (SETQ |opAlist|
                          (|insertAlist| (|zeroOneConvert| |op|)
                           (CONS (LIST |sig| |pred|) |u|) |opAlist|))))))
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       |oplist| NIL)
      |opAlist|))))

; kePageDisplay(htPage, opAlist) ==
;   count := #opAlist
;   total := +/[#(rest entry) for entry in opAlist]
;   count = 0 => nil
;   htpSetProperty(htPage, 'opAlist, opAlist)
;   htpSetProperty(htPage, 'expandOperations, 'lists)  --mark as unexpanded
;   which := '"operation"
;   htMakePage [['bcLinks, [menuButton(), '"", 'dbShowOps, 'names]]]
;   htSayStandard '"\tab{2}"
;   if count ~= total then
;     if count = 1
;     then htSay('"1 name for ")
;     else htSayList([STRINGIMAGE count, '" names for "])
;   if total > 1
;     then htSayList([STRINGIMAGE total, '" ", pluralize which,
;                    '" are explicitly exported:"])
;     else htSayList(['"1 ", which, '" is explicitly exported:"])
;   data := dbGatherData(htPage, opAlist, 'names)
;   dbShowOpItems(data, false)

(DEFUN |kePageDisplay| (|htPage| |opAlist|)
  (PROG (|count| |total| |which| |data|)
    (RETURN
     (PROGN
      (SETQ |count| (LENGTH |opAlist|))
      (SETQ |total|
              ((LAMBDA (|bfVar#19| |bfVar#18| |entry|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#18|)
                        (PROGN (SETQ |entry| (CAR |bfVar#18|)) NIL))
                    (RETURN |bfVar#19|))
                   (#1='T
                    (SETQ |bfVar#19| (+ |bfVar#19| (LENGTH (CDR |entry|))))))
                  (SETQ |bfVar#18| (CDR |bfVar#18|))))
               0 |opAlist| NIL))
      (COND ((EQL |count| 0) NIL)
            (#1#
             (PROGN
              (|htpSetProperty| |htPage| '|opAlist| |opAlist|)
              (|htpSetProperty| |htPage| '|expandOperations| '|lists|)
              (SETQ |which| "operation")
              (|htMakePage|
               (LIST
                (LIST '|bcLinks|
                      (LIST (|menuButton|) "" '|dbShowOps| '|names|))))
              (|htSayStandard| "\\tab{2}")
              (COND
               ((NOT (EQUAL |count| |total|))
                (COND ((EQL |count| 1) (|htSay| "1 name for "))
                      (#1#
                       (|htSayList|
                        (LIST (STRINGIMAGE |count|) " names for "))))))
              (COND
               ((< 1 |total|)
                (|htSayList|
                 (LIST (STRINGIMAGE |total|) " " (|pluralize| |which|)
                       " are explicitly exported:")))
               (#1#
                (|htSayList| (LIST "1 " |which| " is explicitly exported:"))))
              (SETQ |data| (|dbGatherData| |htPage| |opAlist| '|names|))
              (|dbShowOpItems| |data| NIL))))))))

; ksPage(htPage) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   domain  := (kind = '"category" => nil; EVAL domname)
;   conform:= htpProperty(htPage,'conform)
;   page := htInitPageNoScroll(htCopyProplist htPage,
;                              ['"Search order for ",:heading])
;   htSay '"When an operation is not defined by the domain, the following domains are searched in order for a _"default definition"
;   htSayStandard '"\beginscroll "
;   u := dbSearchOrder(conform,domname,domain)
;   htpSetProperty(htPage,'cAlist,u)
;   htpSetProperty(htPage,'thing,'"constructor")
;   dbShowCons(htPage,'names)

(DEFUN |ksPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |domain| |conform| |page| |u|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |domain|
                 (COND ((EQUAL |kind| "category") NIL) (#4# (EVAL |domname|))))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |page|
                 (|htInitPageNoScroll| (|htCopyProplist| |htPage|)
                  (CONS "Search order for " |heading|)))
         (|htSay|
          "When an operation is not defined by the domain, the following domains are searched in order for a \"default definition")
         (|htSayStandard| "\\beginscroll ")
         (SETQ |u| (|dbSearchOrder| |conform| |domname| |domain|))
         (|htpSetProperty| |htPage| '|cAlist| |u|)
         (|htpSetProperty| |htPage| '|thing| "constructor")
         (|dbShowCons| |htPage| '|names|))))))))

; evalDomainOpPred(dom, pred, preds) == process(dom, pred, preds) where
;   process(dom, pred, preds) ==
;     u := convert(dom, pred)
;     u = 'T => true
;     evpred(dom, u, preds)
;   convert(dom, pred) ==
;       pred is [op, :argl] =>
;           op = 'AND => ['AND, :[convert(dom, x) for x in argl]]
;           op = 'OR => ['OR, :[convert(dom, x) for x in argl]]
;           op = 'NOT => ['NOT, convert(dom, first(argl))]
;           op = 'has =>
;               [arg, p] := argl
;               ['HasCategory, arg, convertCatArg(p)]
;           systemError '"unknown predicate form"
;       pred = 'T => true
;       systemError([])
;   convertCatArg p ==
;     SYMBOLP(p) and member(p, $FormalMapVariableList) => ["devaluate", p]
;     atom p or #p = 1 => MKQ p
;     ['LIST,MKQ first p,:[convertCatArg x for x in rest p]]
;   evpred(dom, pred, preds) ==
;       k := POSN1(pred, preds) => testBitVector(dom.3, k + 1)
;       evpred1(dom, pred, preds)
;   evpred1(dom, pred, preds) ==
;       pred is [op,:argl] =>
;           op = 'AND => "and"/[evpred1(dom, x, preds) for x in argl]
;           op = 'OR  => "or"/[evpred1(dom, x, preds) for x in argl]
;           op = 'NOT => not evpred1(dom, first(argl), preds)
;           k := POSN1(pred, preds) => testBitVector(dom.3, k + 1)
;           nil
;       pred = 'T => true
;       systemError '"unknown atomic predicate form"

(DEFUN |evalDomainOpPred| (|dom| |pred| |preds|)
  (PROG () (RETURN (|evalDomainOpPred,process| |dom| |pred| |preds|))))
(DEFUN |evalDomainOpPred,process| (|dom| |pred| |preds|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|evalDomainOpPred,convert| |dom| |pred|))
      (COND ((EQ |u| 'T) T)
            ('T (|evalDomainOpPred,evpred| |dom| |u| |preds|)))))))
(DEFUN |evalDomainOpPred,convert| (|dom| |pred|)
  (PROG (|op| |argl| |arg| |p|)
    (RETURN
     (COND
      ((AND (CONSP |pred|)
            (PROGN (SETQ |op| (CAR |pred|)) (SETQ |argl| (CDR |pred|)) #1='T))
       (COND
        ((EQ |op| 'AND)
         (CONS 'AND
               ((LAMBDA (|bfVar#21| |bfVar#20| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#20|)
                         (PROGN (SETQ |x| (CAR |bfVar#20|)) NIL))
                     (RETURN (NREVERSE |bfVar#21|)))
                    (#1#
                     (SETQ |bfVar#21|
                             (CONS (|evalDomainOpPred,convert| |dom| |x|)
                                   |bfVar#21|))))
                   (SETQ |bfVar#20| (CDR |bfVar#20|))))
                NIL |argl| NIL)))
        ((EQ |op| 'OR)
         (CONS 'OR
               ((LAMBDA (|bfVar#23| |bfVar#22| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#22|)
                         (PROGN (SETQ |x| (CAR |bfVar#22|)) NIL))
                     (RETURN (NREVERSE |bfVar#23|)))
                    (#1#
                     (SETQ |bfVar#23|
                             (CONS (|evalDomainOpPred,convert| |dom| |x|)
                                   |bfVar#23|))))
                   (SETQ |bfVar#22| (CDR |bfVar#22|))))
                NIL |argl| NIL)))
        ((EQ |op| 'NOT)
         (LIST 'NOT (|evalDomainOpPred,convert| |dom| (CAR |argl|))))
        ((EQ |op| '|has|)
         (PROGN
          (SETQ |arg| (CAR |argl|))
          (SETQ |p| (CADR |argl|))
          (LIST '|HasCategory| |arg| (|evalDomainOpPred,convertCatArg| |p|))))
        (#1# (|systemError| "unknown predicate form"))))
      ((EQ |pred| 'T) T) (#1# (|systemError| NIL))))))
(DEFUN |evalDomainOpPred,convertCatArg| (|p|)
  (PROG ()
    (RETURN
     (COND
      ((AND (SYMBOLP |p|) (|member| |p| |$FormalMapVariableList|))
       (LIST '|devaluate| |p|))
      ((OR (ATOM |p|) (EQL (LENGTH |p|) 1)) (MKQ |p|))
      (#1='T
       (CONS 'LIST
             (CONS (MKQ (CAR |p|))
                   ((LAMBDA (|bfVar#25| |bfVar#24| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#24|)
                             (PROGN (SETQ |x| (CAR |bfVar#24|)) NIL))
                         (RETURN (NREVERSE |bfVar#25|)))
                        (#1#
                         (SETQ |bfVar#25|
                                 (CONS (|evalDomainOpPred,convertCatArg| |x|)
                                       |bfVar#25|))))
                       (SETQ |bfVar#24| (CDR |bfVar#24|))))
                    NIL (CDR |p|) NIL))))))))
(DEFUN |evalDomainOpPred,evpred| (|dom| |pred| |preds|)
  (PROG (|k|)
    (RETURN
     (COND
      ((SETQ |k| (POSN1 |pred| |preds|))
       (|testBitVector| (ELT |dom| 3) (+ |k| 1)))
      ('T (|evalDomainOpPred,evpred1| |dom| |pred| |preds|))))))
(DEFUN |evalDomainOpPred,evpred1| (|dom| |pred| |preds|)
  (PROG (|op| |argl| |k|)
    (RETURN
     (COND
      ((AND (CONSP |pred|)
            (PROGN (SETQ |op| (CAR |pred|)) (SETQ |argl| (CDR |pred|)) #1='T))
       (COND
        ((EQ |op| 'AND)
         ((LAMBDA (|bfVar#27| |bfVar#26| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#26|) (PROGN (SETQ |x| (CAR |bfVar#26|)) NIL))
               (RETURN |bfVar#27|))
              (#1#
               (PROGN
                (SETQ |bfVar#27|
                        (|evalDomainOpPred,evpred1| |dom| |x| |preds|))
                (COND ((NOT |bfVar#27|) (RETURN NIL))))))
             (SETQ |bfVar#26| (CDR |bfVar#26|))))
          T |argl| NIL))
        ((EQ |op| 'OR)
         ((LAMBDA (|bfVar#29| |bfVar#28| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#28|) (PROGN (SETQ |x| (CAR |bfVar#28|)) NIL))
               (RETURN |bfVar#29|))
              (#1#
               (PROGN
                (SETQ |bfVar#29|
                        (|evalDomainOpPred,evpred1| |dom| |x| |preds|))
                (COND (|bfVar#29| (RETURN |bfVar#29|))))))
             (SETQ |bfVar#28| (CDR |bfVar#28|))))
          NIL |argl| NIL))
        ((EQ |op| 'NOT)
         (NULL (|evalDomainOpPred,evpred1| |dom| (CAR |argl|) |preds|)))
        ((SETQ |k| (POSN1 |pred| |preds|))
         (|testBitVector| (ELT |dom| 3) (+ |k| 1)))
        (#1# NIL)))
      ((EQ |pred| 'T) T)
      (#1# (|systemError| "unknown atomic predicate form"))))))

; kFormatSlotDomain1(x, infovec) ==
;               fn formatSlotDomain1(x, infovec) where fn x ==
;   atom x => x
;   (op := first x) = '_% => '_%
;   op = 'local => CADR x
;   op = ":" => [":",CADR x,fn CADDR x]
;   MEMQ(op,$Primitives) or constructor? op =>
;     [fn y for y in x]
;   INTEGERP op => op
;   op = 'QUOTE and atom CADR x => CADR x
;   x

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
            ((LAMBDA (|bfVar#31| |bfVar#30| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#30|)
                      (PROGN (SETQ |y| (CAR |bfVar#30|)) NIL))
                  (RETURN (NREVERSE |bfVar#31|)))
                 (#1='T
                  (SETQ |bfVar#31|
                          (CONS (|kFormatSlotDomain1,fn| |y|) |bfVar#31|))))
                (SETQ |bfVar#30| (CDR |bfVar#30|))))
             NIL |x| NIL))
           ((INTEGERP |op|) |op|)
           ((AND (EQ |op| 'QUOTE) (ATOM (CADR |x|))) (CADR |x|)) (#1# |x|)))))

; dbSearchOrder(conform, domname, domain) == --domain = nil or set to live domain
;   conform := domname or conform
;   name:= opOf conform
;   infovec := dbInfovec name or return nil  --exit for categories
;   u := infovec.3
;   predvec :=
;         domain => domain.3
;         get_database(name, 'PREDICATES)
;   catpredvec := first u
;   catinfo    := CADR u
;   catvec     := CADDR u
;   catforms := [[pakform,:pred] for i in 0..MAXINDEX catvec | test ] where
;     test ==
;       pred := simpCatPredicate
;         p := SUBLISLIS(rest(conform), $FormalMapVariableList,
;                         kTestPred(catpredvec.i, domain, predvec))
;         domain => EVAL(p)
;         p
;       if domname and CONTAINED('%, pred) then pred := SUBST(domname, '%, pred)
;       (pak := catinfo . i) and pred   --only those with default packages
;     pakform ==
;       pak and not IDENTP pak => devaluate pak --in case it has been instantiated
;       catform := kFormatSlotDomain1(catvec.i, infovec)
;       res := dbSubConform(rest(conform), [pak, "%", :rest(catform)])
;       if domname then res := SUBST(domname, '%, res)
;       res
;   [:dbAddChain conform,:catforms]

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
              ((LAMBDA (|bfVar#33| |bfVar#32| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#32|) (RETURN (NREVERSE |bfVar#33|)))
                        (#1#
                         (AND
                          (PROGN
                           (SETQ |pred|
                                   (|simpCatPredicate|
                                    (PROGN
                                     (SETQ |p|
                                             (SUBLISLIS (CDR |conform|)
                                              |$FormalMapVariableList|
                                              (|kTestPred|
                                               (ELT |catpredvec| |i|) |domain|
                                               |predvec|)))
                                     (COND (|domain| (EVAL |p|)) (#1# |p|)))))
                           (COND
                            ((AND |domname| (CONTAINED '% |pred|))
                             (SETQ |pred| (SUBST |domname| '% |pred|))))
                           (AND (SETQ |pak| (ELT |catinfo| |i|)) |pred|))
                          (SETQ |bfVar#33|
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
                                        (|domname|
                                         (SETQ |res|
                                                 (SUBST |domname| '% |res|))))
                                       |res|)))
                                    |pred|)
                                   |bfVar#33|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |catvec|) 0))
      (APPEND (|dbAddChain| |conform|) |catforms|)))))

; kcpPage(htPage) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   page := htInitPage(['"Parents of ",:heading],htCopyProplist htPage)
;   parents := parentsOf conname --was listSort(function GLESSEQP, =this)
;   if domname then parents := SUBLISLIS(rest domname,rest conform,parents)
;   htpSetProperty(htPage,'cAlist,parents)
;   htpSetProperty(htPage,'thing,'"parent")
;   choice :=
;     domname => 'parameters
;     'names
;   dbShowCons(htPage,choice)

(DEFUN |kcpPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |conform| |conname| |page| |parents|
         |choice|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |page|
                 (|htInitPage| (CONS "Parents of " |heading|)
                  (|htCopyProplist| |htPage|)))
         (SETQ |parents| (|parentsOf| |conname|))
         (COND
          (|domname|
           (SETQ |parents|
                   (SUBLISLIS (CDR |domname|) (CDR |conform|) |parents|))))
         (|htpSetProperty| |htPage| '|cAlist| |parents|)
         (|htpSetProperty| |htPage| '|thing| "parent")
         (SETQ |choice| (COND (|domname| '|parameters|) (#4# '|names|)))
         (|dbShowCons| |htPage| |choice|))))))))

; reduceAlistForDomain(alist,domform,conform) == --called from kccPage
;   alist := SUBLISLIS(rest domform,rest conform,alist)
;   for pair in alist repeat RPLACD(pair, simpHasPred2(rest pair, domform))
;   [pair for (pair := [.,:pred]) in alist | pred]

(DEFUN |reduceAlistForDomain| (|alist| |domform| |conform|)
  (PROG (|pred|)
    (RETURN
     (PROGN
      (SETQ |alist| (SUBLISLIS (CDR |domform|) (CDR |conform|) |alist|))
      ((LAMBDA (|bfVar#34| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#34|) (PROGN (SETQ |pair| (CAR |bfVar#34|)) NIL))
            (RETURN NIL))
           (#1='T (RPLACD |pair| (|simpHasPred2| (CDR |pair|) |domform|))))
          (SETQ |bfVar#34| (CDR |bfVar#34|))))
       |alist| NIL)
      ((LAMBDA (|bfVar#36| |bfVar#35| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#35|) (PROGN (SETQ |pair| (CAR |bfVar#35|)) NIL))
            (RETURN (NREVERSE |bfVar#36|)))
           (#1#
            (AND (CONSP |pair|) (PROGN (SETQ |pred| (CDR |pair|)) #1#) |pred|
                 (SETQ |bfVar#36| (CONS |pair| |bfVar#36|)))))
          (SETQ |bfVar#35| (CDR |bfVar#35|))))
       NIL |alist| NIL)))))

; kcaPage(htPage) ==
;     kcaPage1(htPage, '"category", '" an ", '"ancestor",
;              function ancestorsOf, false)

(DEFUN |kcaPage| (|htPage|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "category" " an " "ancestor" #'|ancestorsOf| NIL))))

; kcdPage(htPage) ==
;     kcaPage1(htPage, '"category", '" a ", '"descendant",
;              function descendantsOf, true)

(DEFUN |kcdPage| (|htPage|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "category" " a " "descendant" #'|descendantsOf| T))))

; kcdoPage(htPage)==
;     kcaPage1(htPage, '"domain", '" a ", '"descendant",
;              function domainsOf, false)

(DEFUN |kcdoPage| (|htPage|)
  (PROG ()
    (RETURN
     (|kcaPage1| |htPage| "domain" " a " "descendant" #'|domainsOf| NIL))))

; kcaPage1(htPage,kind,article,whichever,fn, isCatDescendants?) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname and not isCatDescendants? then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   ancestors := FUNCALL(fn, conform, domname)
;   if whichever ~= '"ancestor" then
;     ancestors := augmentHasArgs(ancestors,conform)
;   ancestors := listSort(function GLESSEQP,ancestors)
;   -- if domname then ancestors := SUBST(domname, '%, ancestors)
;   htpSetProperty(htPage,'cAlist,ancestors)
;   htpSetProperty(htPage,'thing,whichever)
;   choice :=
; --  domname => 'parameters
;     'names
;   dbShowCons(htPage,choice)

(DEFUN |kcaPage1|
       (|htPage| |kind| |article| |whichever| |fn| |isCatDescendants?|)
  (PROG (|LETTMP#1| |name| |nargs| |xpart| |sig| |args| |abbrev| |comments|
         |domname| |heading| |conform| |conname| |ancestors| |choice|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          ((AND |domname| (NULL |isCatDescendants?|))
           (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |ancestors| (FUNCALL |fn| |conform| |domname|))
         (COND
          ((NOT (EQUAL |whichever| "ancestor"))
           (SETQ |ancestors| (|augmentHasArgs| |ancestors| |conform|))))
         (SETQ |ancestors| (|listSort| #'GLESSEQP |ancestors|))
         (|htpSetProperty| |htPage| '|cAlist| |ancestors|)
         (|htpSetProperty| |htPage| '|thing| |whichever|)
         (SETQ |choice| '|names|)
         (|dbShowCons| |htPage| |choice|))))))))

; kccPage(htPage) ==
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   page := htInitPage(['"Children of ",:heading],htCopyProplist htPage)
;   children:= augmentHasArgs(childrenOf conform,conform)
;   if domname then children := reduceAlistForDomain(children,domname,conform)
;   htpSetProperty(htPage,'cAlist,children)
;   htpSetProperty(htPage,'thing,'"child")
;   dbShowCons(htPage,'names)

(DEFUN |kccPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |conform| |conname| |page| |children|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |conname| (|opOf| |conform|))
         (SETQ |page|
                 (|htInitPage| (CONS "Children of " |heading|)
                  (|htCopyProplist| |htPage|)))
         (SETQ |children|
                 (|augmentHasArgs| (|childrenOf| |conform|) |conform|))
         (COND
          (|domname|
           (SETQ |children|
                   (|reduceAlistForDomain| |children| |domname| |conform|))))
         (|htpSetProperty| |htPage| '|cAlist| |children|)
         (|htpSetProperty| |htPage| '|thing| "child")
         (|dbShowCons| |htPage| '|names|))))))))

; augmentHasArgs(alist,conform) ==
;   conname := opOf conform
;   args    := IFCDR conform or return alist
;   n       := #args
;   [[name,:pred] for [name,:p] in alist] where pred ==
;      extractHasArgs p is [a,:b] => p
;      quickAnd(p, ['hasArgs, :TAKE(n, IFCDR getConstructorForm opOf name)])

(DEFUN |augmentHasArgs| (|alist| |conform|)
  (PROG (|conname| |args| |n| |name| |p| |ISTMP#1| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |args| (OR (IFCDR |conform|) (RETURN |alist|)))
      (SETQ |n| (LENGTH |args|))
      ((LAMBDA (|bfVar#39| |bfVar#38| |bfVar#37|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#38|)
                (PROGN (SETQ |bfVar#37| (CAR |bfVar#38|)) NIL))
            (RETURN (NREVERSE |bfVar#39|)))
           (#1='T
            (AND (CONSP |bfVar#37|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#37|))
                  (SETQ |p| (CDR |bfVar#37|))
                  #1#)
                 (SETQ |bfVar#39|
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
                          |bfVar#39|)))))
          (SETQ |bfVar#38| (CDR |bfVar#38|))))
       NIL |alist| NIL)))))

; kcdePage(htPage) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   conname         := INTERN name
;   constring       := STRCONC(name,args)
;   conform         :=
;     kind ~= '"default package" => ncParseFromString constring
;     [INTERN name,:rest ncParseFromString STRCONC(char 'd,args)]  --because of &
;   pakname         :=
; --  kind = '"category" => INTERN STRCONC(name,char '_&)
;     opOf conform
;   domList := getDependentsOfConstructor pakname
;   cAlist := [[getConstructorForm x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"dependent")
;   dbShowCons(htPage,'names)

(DEFUN |kcdePage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |conname| |constring| |conform| |pakname| |domList|
         |cAlist|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |conname| (INTERN |name|))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |conform|
              (COND
               ((NOT (EQUAL |kind| "default package"))
                (|ncParseFromString| |constring|))
               (#4='T
                (CONS (INTERN |name|)
                      (CDR
                       (|ncParseFromString|
                        (STRCONC (|char| '|d|) |args|)))))))
      (SETQ |pakname| (|opOf| |conform|))
      (SETQ |domList| (|getDependentsOfConstructor| |pakname|))
      (SETQ |cAlist|
              ((LAMBDA (|bfVar#41| |bfVar#40| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#40|)
                        (PROGN (SETQ |x| (CAR |bfVar#40|)) NIL))
                    (RETURN (NREVERSE |bfVar#41|)))
                   (#4#
                    (SETQ |bfVar#41|
                            (CONS (CONS (|getConstructorForm| |x|) T)
                                  |bfVar#41|))))
                  (SETQ |bfVar#40| (CDR |bfVar#40|))))
               NIL |domList| NIL))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|htpSetProperty| |htPage| '|thing| "dependent")
      (|dbShowCons| |htPage| '|names|)))))

; kcuPage(htPage) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   conname         := INTERN name
;   constring       := STRCONC(name,args)
;   conform         :=
;     kind ~= '"default package" => ncParseFromString constring
;     [INTERN name,:rest ncParseFromString STRCONC(char 'd,args)]  --because of &
;   pakname         :=
;     kind = '"category" => INTERN STRCONC(name,char '_&)
;     opOf conform
;   domList := getUsersOfConstructor pakname
;   cAlist := [[getConstructorForm x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"user")
;   dbShowCons(htPage,'names)

(DEFUN |kcuPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |conname| |constring| |conform| |pakname| |domList|
         |cAlist|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |conname| (INTERN |name|))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |conform|
              (COND
               ((NOT (EQUAL |kind| "default package"))
                (|ncParseFromString| |constring|))
               (#4='T
                (CONS (INTERN |name|)
                      (CDR
                       (|ncParseFromString|
                        (STRCONC (|char| '|d|) |args|)))))))
      (SETQ |pakname|
              (COND
               ((EQUAL |kind| "category")
                (INTERN (STRCONC |name| (|char| '&))))
               (#4# (|opOf| |conform|))))
      (SETQ |domList| (|getUsersOfConstructor| |pakname|))
      (SETQ |cAlist|
              ((LAMBDA (|bfVar#43| |bfVar#42| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#42|)
                        (PROGN (SETQ |x| (CAR |bfVar#42|)) NIL))
                    (RETURN (NREVERSE |bfVar#43|)))
                   (#4#
                    (SETQ |bfVar#43|
                            (CONS (CONS (|getConstructorForm| |x|) T)
                                  |bfVar#43|))))
                  (SETQ |bfVar#42| (CDR |bfVar#42|))))
               NIL |domList| NIL))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|htpSetProperty| |htPage| '|thing| "user")
      (|dbShowCons| |htPage| '|names|)))))

; kcnPage(htPage) ==
; --if reached by a category, that category has a default package
;   [kind,name,nargs,xpart,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   domname         := kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   heading :=
;     null domname => htpProperty(htPage,'heading)
;     ['"{\sf ",form2HtString(domname,nil,true),'"}"]
;   if domname then
;     htpSetProperty(htPage,'domname,domname)
;     htpSetProperty(htPage,'heading,heading)
;   conform:= htpProperty(htPage,'conform)
;   pakname         :=
;     kind = '"category" => INTERN STRCONC(PNAME conname,char '_&)
;     opOf conform
;   domList := getImports pakname
;   if domname then
;       domList := SUBLISLIS([domname, :rest(domname)],
;                            ['%, :rest(conform)], domList)
;   cAlist := [[x,:true] for x in domList]
;   htpSetProperty(htPage,'cAlist,cAlist)
;   htpSetProperty(htPage,'thing,'"benefactor")
;   dbShowCons(htPage,'names)

(DEFUN |kcnPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xpart| |sig| |args| |abbrev|
         |comments| |domname| |heading| |conform| |pakname| |domList| |cAlist|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xpart| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |domname| (|kDomainName| |htPage| |kind| |name| |nargs|))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4='T
        (PROGN
         (SETQ |heading|
                 (COND ((NULL |domname|) (|htpProperty| |htPage| '|heading|))
                       (#4#
                        (LIST "{\\sf " (|form2HtString| |domname| NIL T)
                              "}"))))
         (COND
          (|domname| (|htpSetProperty| |htPage| '|domname| |domname|)
           (|htpSetProperty| |htPage| '|heading| |heading|)))
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |pakname|
                 (COND
                  ((EQUAL |kind| "category")
                   (INTERN (STRCONC (PNAME |conname|) (|char| '&))))
                  (#4# (|opOf| |conform|))))
         (SETQ |domList| (|getImports| |pakname|))
         (COND
          (|domname|
           (SETQ |domList|
                   (SUBLISLIS (CONS |domname| (CDR |domname|))
                    (CONS '% (CDR |conform|)) |domList|))))
         (SETQ |cAlist|
                 ((LAMBDA (|bfVar#45| |bfVar#44| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#44|)
                           (PROGN (SETQ |x| (CAR |bfVar#44|)) NIL))
                       (RETURN (NREVERSE |bfVar#45|)))
                      (#4# (SETQ |bfVar#45| (CONS (CONS |x| T) |bfVar#45|))))
                     (SETQ |bfVar#44| (CDR |bfVar#44|))))
                  NIL |domList| NIL))
         (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
         (|htpSetProperty| |htPage| '|thing| "benefactor")
         (|dbShowCons| |htPage| '|names|))))))))

; koPageInputAreaUnchanged?(htPage, nargs) ==
;   [htpLabelInputString(htPage,INTERN STRCONC('"*",STRINGIMAGE i)) for i in 1..nargs]
;       = htpProperty(htPage,'inputAreaList)

(DEFUN |koPageInputAreaUnchanged?| (|htPage| |nargs|)
  (PROG ()
    (RETURN
     (EQUAL
      ((LAMBDA (|bfVar#46| |i|)
         (LOOP
          (COND ((> |i| |nargs|) (RETURN (NREVERSE |bfVar#46|)))
                ('T
                 (SETQ |bfVar#46|
                         (CONS
                          (|htpLabelInputString| |htPage|
                           (INTERN (STRCONC "*" (STRINGIMAGE |i|))))
                          |bfVar#46|))))
          (SETQ |i| (+ |i| 1))))
       NIL 1)
      (|htpProperty| |htPage| '|inputAreaList|)))))

; kDomainName(htPage,kind,name,nargs) ==
;   htpSetProperty(htPage,'domname,nil)
;   inputAreaList :=
;     [htpLabelInputString(htPage,var) for i in 1..nargs for var in $PatternVariableList]
;   htpSetProperty(htPage,'inputAreaList,inputAreaList)
;   conname := INTERN name
;   args := [kArgumentCheck(domain?,x) or nil for x in inputAreaList
;               for domain? in rest(get_database(conname, 'COSIG))]
;   or/[null x for x in args] =>
;     (n := +/[1 for x in args | x]) > 0 =>
;       ['error,nil,'"\centerline{You gave values for only {\em ",n,'" } of the {\em ",#args,'"}}",'"\centerline{parameters of {\sf ",name,'"}}\vspace{1}\centerline{Please enter either {\em all} or {\em none} of the type parameters}"]
;     nil
;   argString :=
;     null args => '"()"
;     argTailPart :=
;       "STRCONC"/["STRCONC"/ ['",", :x] for x in IFCDR args]
;     "STRCONC"/['"(",:first args,argTailPart,'")"]
;   typeForm := CATCH('SPAD_READER, unabbrev mkConform(kind, name, argString)) or
;     ['error,'invalidType,STRCONC(name,argString)]
;   null (evaluatedTypeForm := kisValidType typeForm) =>
;     ['error,'invalidType,STRCONC(name,argString)]
;   dbMkEvalable evaluatedTypeForm

(DEFUN |kDomainName| (|htPage| |kind| |name| |nargs|)
  (PROG (|inputAreaList| |conname| |args| |n| |argTailPart| |argString|
         |typeForm| |evaluatedTypeForm|)
    (RETURN
     (PROGN
      (|htpSetProperty| |htPage| '|domname| NIL)
      (SETQ |inputAreaList|
              ((LAMBDA (|bfVar#48| |i| |bfVar#47| |var|)
                 (LOOP
                  (COND
                   ((OR (> |i| |nargs|) (ATOM |bfVar#47|)
                        (PROGN (SETQ |var| (CAR |bfVar#47|)) NIL))
                    (RETURN (NREVERSE |bfVar#48|)))
                   (#1='T
                    (SETQ |bfVar#48|
                            (CONS (|htpLabelInputString| |htPage| |var|)
                                  |bfVar#48|))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#47| (CDR |bfVar#47|))))
               NIL 1 |$PatternVariableList| NIL))
      (|htpSetProperty| |htPage| '|inputAreaList| |inputAreaList|)
      (SETQ |conname| (INTERN |name|))
      (SETQ |args|
              ((LAMBDA (|bfVar#51| |bfVar#49| |x| |bfVar#50| |domain?|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#49|)
                        (PROGN (SETQ |x| (CAR |bfVar#49|)) NIL)
                        (ATOM |bfVar#50|)
                        (PROGN (SETQ |domain?| (CAR |bfVar#50|)) NIL))
                    (RETURN (NREVERSE |bfVar#51|)))
                   (#1#
                    (SETQ |bfVar#51|
                            (CONS (OR (|kArgumentCheck| |domain?| |x|) NIL)
                                  |bfVar#51|))))
                  (SETQ |bfVar#49| (CDR |bfVar#49|))
                  (SETQ |bfVar#50| (CDR |bfVar#50|))))
               NIL |inputAreaList| NIL (CDR (|get_database| |conname| 'COSIG))
               NIL))
      (COND
       (((LAMBDA (|bfVar#53| |bfVar#52| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#52|) (PROGN (SETQ |x| (CAR |bfVar#52|)) NIL))
              (RETURN |bfVar#53|))
             (#1#
              (PROGN
               (SETQ |bfVar#53| (NULL |x|))
               (COND (|bfVar#53| (RETURN |bfVar#53|))))))
            (SETQ |bfVar#52| (CDR |bfVar#52|))))
         NIL |args| NIL)
        (COND
         ((< 0
             (SETQ |n|
                     ((LAMBDA (|bfVar#55| |bfVar#54| |x|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#54|)
                               (PROGN (SETQ |x| (CAR |bfVar#54|)) NIL))
                           (RETURN |bfVar#55|))
                          (#1# (AND |x| (SETQ |bfVar#55| (+ |bfVar#55| 1)))))
                         (SETQ |bfVar#54| (CDR |bfVar#54|))))
                      0 |args| NIL)))
          (LIST '|error| NIL "\\centerline{You gave values for only {\\em " |n|
                " } of the {\\em " (LENGTH |args|) "}}"
                "\\centerline{parameters of {\\sf " |name|
                "}}\\vspace{1}\\centerline{Please enter either {\\em all} or {\\em none} of the type parameters}"))
         (#1# NIL)))
       (#1#
        (PROGN
         (SETQ |argString|
                 (COND ((NULL |args|) "()")
                       (#1#
                        (PROGN
                         (SETQ |argTailPart|
                                 ((LAMBDA (|bfVar#60| |bfVar#59| |x|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#59|)
                                           (PROGN
                                            (SETQ |x| (CAR |bfVar#59|))
                                            NIL))
                                       (RETURN |bfVar#60|))
                                      (#1#
                                       (SETQ |bfVar#60|
                                               (STRCONC |bfVar#60|
                                                ((LAMBDA
                                                     (|bfVar#56| |bfVar#58|
                                                      |bfVar#57|)
                                                   (LOOP
                                                    (COND
                                                     ((OR (ATOM |bfVar#58|)
                                                          (PROGN
                                                           (SETQ |bfVar#57|
                                                                   (CAR
                                                                    |bfVar#58|))
                                                           NIL))
                                                      (RETURN |bfVar#56|))
                                                     (#1#
                                                      (SETQ |bfVar#56|
                                                              (STRCONC
                                                               |bfVar#56|
                                                               |bfVar#57|))))
                                                    (SETQ |bfVar#58|
                                                            (CDR |bfVar#58|))))
                                                 #2="" (CONS "," |x|) NIL)))))
                                     (SETQ |bfVar#59| (CDR |bfVar#59|))))
                                  #2# (IFCDR |args|) NIL))
                         ((LAMBDA (|bfVar#61| |bfVar#63| |bfVar#62|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#63|)
                                   (PROGN
                                    (SETQ |bfVar#62| (CAR |bfVar#63|))
                                    NIL))
                               (RETURN |bfVar#61|))
                              (#1#
                               (SETQ |bfVar#61|
                                       (STRCONC |bfVar#61| |bfVar#62|))))
                             (SETQ |bfVar#63| (CDR |bfVar#63|))))
                          #2#
                          (CONS "("
                                (APPEND (CAR |args|)
                                        (CONS |argTailPart| (CONS ")" NIL))))
                          NIL)))))
         (SETQ |typeForm|
                 (OR
                  (CATCH 'SPAD_READER
                    (|unabbrev| (|mkConform| |kind| |name| |argString|)))
                  (LIST '|error| '|invalidType| (STRCONC |name| |argString|))))
         (COND
          ((NULL (SETQ |evaluatedTypeForm| (|kisValidType| |typeForm|)))
           (LIST '|error| '|invalidType| (STRCONC |name| |argString|)))
          (#1# (|dbMkEvalable| |evaluatedTypeForm|))))))))))

; kArgumentCheck(domain?,s) ==
;   s = '"" => nil
;   domain? and (form := conSpecialString? s) =>
;     null IFCDR form => [STRINGIMAGE opOf form]
;     form2String form
;   [s]

(DEFUN |kArgumentCheck| (|domain?| |s|)
  (PROG (|form|)
    (RETURN
     (COND ((EQUAL |s| "") NIL)
           ((AND |domain?| (SETQ |form| (|conSpecialString?| |s|)))
            (COND ((NULL (IFCDR |form|)) (LIST (STRINGIMAGE (|opOf| |form|))))
                  (#1='T (|form2String| |form|))))
           (#1# (LIST |s|))))))

; dbMkEvalable form ==
; --like mkEvalable except that it does NOT quote domains
; --does not do "loadIfNecessary"
;   [op,:.] := form
;   kind := get_database(op, 'CONSTRUCTORKIND)
;   kind = 'category => form
;   mkEvalable form

(DEFUN |dbMkEvalable| (|form|)
  (PROG (|op| |kind|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |kind| (|get_database| |op| 'CONSTRUCTORKIND))
      (COND ((EQ |kind| '|category|) |form|) ('T (|mkEvalable| |form|)))))))

; kisValidType typeForm ==
;   $ProcessInteractiveValue: fluid := true
;   $noEvalTypeMsg: fluid := true
;   $printTimeIfTrue : local := false
;   $printStorageIfTrue : local := false
;   $BreakMode : local := 'throw_reader
;   CATCH('SPAD_READER, processInteractive(typeForm, nil))
;     is [[h,:.],:t] and member(h,'(Type Category)) => t
;   false

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
                  (CATCH 'SPAD_READER (|processInteractive| |typeForm| NIL)))
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
;    s := next(function ncloopParse,
;         next(function lineoftoks,incString s))
;    StreamNull s => nil
;    pf2Sex first rest first s

(DEFUN |parseNoMacroFromString| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |s|
              (|next| #'|ncloopParse|
               (|next| #'|lineoftoks| (|incString| |s|))))
      (COND ((|StreamNull| |s|) NIL) ('T (|pf2Sex| (CAR (CDR (CAR |s|))))))))))

; mkConform(kind,name,argString) ==
;   kind ~= '"default package" =>
;     form := STRCONC(name,argString)
;     parse := parseNoMacroFromString form
;     null parse =>
;       sayBrightlyNT '"Won't parse: "
;       pp form
;       systemError '"Keywords in argument list?"
;     ATOM parse => [parse]
;     parse
;   [INTERN name,:rest ncParseFromString STRCONC(char 'd,argString)]  --& case

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

; koPage(htPage) ==
;   [kind,name,nargs,xflag,sig,args,abbrev,comments] := htpProperty(htPage,'parts)
;   constring       := STRCONC(name,args)
;   conname         := INTERN name
;   domname         :=
;     (u := htpProperty(htPage,'domname)) is [=conname,:.]
;       and  (htpProperty(htPage,'fromConOpPage1) = true or
;              koPageInputAreaUnchanged?(htPage,nargs)) => u
;     kDomainName(htPage,kind,name,nargs)
;   domname is ['error,:.] => errorPage(htPage,domname)
;   htpSetProperty(htPage,'domname,domname)
;   headingString :=
;     domname => form2HtString(domname,nil,true)
;     constring
;   heading := [capitalize kind,'" {\sf ",headingString,'"}"]
;   htpSetProperty(htPage,'heading,heading)
;   conform := htpProperty(htPage,'conform)
;   opAlist := koOps(conform, domname)
;   if selectedOperation := htpProperty(htPage,'selectedOperation) then
;     opAlist := [assoc(selectedOperation,opAlist) or systemError nil]
;   dbShowOperationsFromConform(htPage, opAlist)

(DEFUN |koPage| (|htPage|)
  (PROG (|LETTMP#1| |kind| |name| |nargs| |xflag| |sig| |args| |abbrev|
         |comments| |constring| |conname| |u| |ISTMP#1| |domname|
         |headingString| |heading| |conform| |opAlist| |selectedOperation|)
    (RETURN
     (PROGN
      (SETQ |LETTMP#1| (|htpProperty| |htPage| '|parts|))
      (SETQ |kind| (CAR |LETTMP#1|))
      (SETQ |name| (CADR . #1=(|LETTMP#1|)))
      (SETQ |nargs| (CADDR . #1#))
      (SETQ |xflag| (CADDDR . #1#))
      (SETQ |sig| (CAR #2=(CDDDDR . #1#)))
      (SETQ |args| (CADR . #3=(#2#)))
      (SETQ |abbrev| (CADDR . #3#))
      (SETQ |comments| (CADDDR . #3#))
      (SETQ |constring| (STRCONC |name| |args|))
      (SETQ |conname| (INTERN |name|))
      (SETQ |domname|
              (COND
               ((AND
                 (PROGN
                  (SETQ |ISTMP#1|
                          (SETQ |u| (|htpProperty| |htPage| '|domname|)))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |conname|)))
                 (OR (EQUAL (|htpProperty| |htPage| '|fromConOpPage1|) T)
                     (|koPageInputAreaUnchanged?| |htPage| |nargs|)))
                |u|)
               (#4='T (|kDomainName| |htPage| |kind| |name| |nargs|))))
      (COND
       ((AND (CONSP |domname|) (EQ (CAR |domname|) '|error|))
        (|errorPage| |htPage| |domname|))
       (#4#
        (PROGN
         (|htpSetProperty| |htPage| '|domname| |domname|)
         (SETQ |headingString|
                 (COND (|domname| (|form2HtString| |domname| NIL T))
                       (#4# |constring|)))
         (SETQ |heading|
                 (LIST (|capitalize| |kind|) " {\\sf " |headingString| "}"))
         (|htpSetProperty| |htPage| '|heading| |heading|)
         (SETQ |conform| (|htpProperty| |htPage| '|conform|))
         (SETQ |opAlist| (|koOps| |conform| |domname|))
         (COND
          ((SETQ |selectedOperation|
                   (|htpProperty| |htPage| '|selectedOperation|))
           (SETQ |opAlist|
                   (LIST
                    (OR (|assoc| |selectedOperation| |opAlist|)
                        (|systemError| NIL))))))
         (|dbShowOperationsFromConform| |htPage| |opAlist|))))))))

; dbDocTable conform ==
; --assumes $docTableHash bound --see dbExpandOpAlistIfNecessary
;   table := HGET($docTableHash,conform) => table
;   $docTable : local := MAKE_HASHTABLE('EQ)
;   --process in reverse order so that closest cover up farthest
;   for x in originsInOrder conform repeat dbAddDocTable x
;   dbAddDocTable conform
;   HPUT($docTableHash,conform,$docTable)
;   $docTable

(DEFUN |dbDocTable| (|conform|)
  (PROG (|$docTable| |table|)
    (DECLARE (SPECIAL |$docTable|))
    (RETURN
     (COND ((SETQ |table| (HGET |$docTableHash| |conform|)) |table|)
           (#1='T
            (PROGN
             (SETQ |$docTable| (MAKE_HASHTABLE 'EQ))
             ((LAMBDA (|bfVar#64| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#64|)
                       (PROGN (SETQ |x| (CAR |bfVar#64|)) NIL))
                   (RETURN NIL))
                  (#1# (|dbAddDocTable| |x|)))
                 (SETQ |bfVar#64| (CDR |bfVar#64|))))
              (|originsInOrder| |conform|) NIL)
             (|dbAddDocTable| |conform|)
             (HPUT |$docTableHash| |conform| |$docTable|)
             |$docTable|))))))

; originsInOrder conform ==  --domain = nil or set to live domain
; --from dcCats
;   [con,:argl] := conform
;   get_database(con, 'CONSTRUCTORKIND) = 'category =>
;       ASSOCLEFT ancestorsOf(conform,nil)
;   acc := ASSOCLEFT parentsOf con
;   for x in acc repeat
;     for y in originsInOrder x repeat acc := insert(y,acc)
;   acc

(DEFUN |originsInOrder| (|conform|)
  (PROG (|con| |argl| |acc|)
    (RETURN
     (PROGN
      (SETQ |con| (CAR |conform|))
      (SETQ |argl| (CDR |conform|))
      (COND
       ((EQ (|get_database| |con| 'CONSTRUCTORKIND) '|category|)
        (ASSOCLEFT (|ancestorsOf| |conform| NIL)))
       (#1='T
        (PROGN
         (SETQ |acc| (ASSOCLEFT (|parentsOf| |con|)))
         ((LAMBDA (|bfVar#65| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#65|) (PROGN (SETQ |x| (CAR |bfVar#65|)) NIL))
               (RETURN NIL))
              (#1#
               ((LAMBDA (|bfVar#66| |y|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#66|)
                         (PROGN (SETQ |y| (CAR |bfVar#66|)) NIL))
                     (RETURN NIL))
                    (#1# (SETQ |acc| (|insert| |y| |acc|))))
                   (SETQ |bfVar#66| (CDR |bfVar#66|))))
                (|originsInOrder| |x|) NIL)))
             (SETQ |bfVar#65| (CDR |bfVar#65|))))
          |acc| NIL)
         |acc|)))))))

; dbAddDocTable conform ==
;   conname := opOf conform
;   storedArgs := rest getConstructorForm conname
;   for [op, :alist] in SUBLISLIS(["%", :rest(conform)],
;     ["%", :storedArgs], get_database(opOf(conform), 'DOCUMENTATION))
;       repeat
;        op1 :=
;          op = ["0"] => 0
;          op = ["1"] => 1
;          op
;        for [sig,doc] in alist repeat
;          HPUT($docTable,op1,[[conform,:alist],:HGET($docTable,op1)])

(DEFUN |dbAddDocTable| (|conform|)
  (PROG (|conname| |storedArgs| |op| |alist| |op1| |sig| |ISTMP#1| |doc|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |storedArgs| (CDR (|getConstructorForm| |conname|)))
      ((LAMBDA (|bfVar#68| |bfVar#67|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#68|)
                (PROGN (SETQ |bfVar#67| (CAR |bfVar#68|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#67|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#67|))
                  (SETQ |alist| (CDR |bfVar#67|))
                  #1#)
                 (PROGN
                  (SETQ |op1|
                          (COND ((EQUAL |op| (LIST '|0|)) 0)
                                ((EQUAL |op| (LIST '|1|)) 1) (#1# |op|)))
                  ((LAMBDA (|bfVar#70| |bfVar#69|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#70|)
                            (PROGN (SETQ |bfVar#69| (CAR |bfVar#70|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |bfVar#69|)
                             (PROGN
                              (SETQ |sig| (CAR |bfVar#69|))
                              (SETQ |ISTMP#1| (CDR |bfVar#69|))
                              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                   (PROGN (SETQ |doc| (CAR |ISTMP#1|)) #1#)))
                             (HPUT |$docTable| |op1|
                                   (CONS (CONS |conform| |alist|)
                                         (HGET |$docTable| |op1|))))))
                      (SETQ |bfVar#70| (CDR |bfVar#70|))))
                   |alist| NIL)))))
          (SETQ |bfVar#68| (CDR |bfVar#68|))))
       (SUBLISLIS (CONS '% (CDR |conform|)) (CONS '% |storedArgs|)
        (|get_database| (|opOf| |conform|) 'DOCUMENTATION))
       NIL)))))

; dbGetDocTable(op, $sig, docTable) == main where
; --docTable is [[origin,entry1,...,:code] ...] where
; --  each entry is [sig,doc] and code is NIL or else a topic code for op
;   main == or/[gn(x) for x in HGET(docTable, op)]
;   gn u ==  --u is [origin,entry1,...,:code]
;     $conform := first u              --origin
;     if ATOM $conform then $conform := [$conform]
;     code     := LASTATOM u         --optional topic code
;     comments := or/[p for entry in rest u | p := hn entry] or return nil
;     [$conform,first comments,:code]
;   hn [sig,:doc] ==
;     pred := #$sig = #sig and
;       alteredSig := SUBLISLIS(IFCDR $conform, $FormalMapVariableList, sig)
;       alteredSig = $sig
;     pred =>
;       doc =>
;         doc is ['constant,:r] => r
;         doc
;       '("")
;     false

(DEFUN |dbGetDocTable| (|op| |$sig| |docTable|)
  (DECLARE (SPECIAL |$sig|))
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#72| |bfVar#71| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#71|) (PROGN (SETQ |x| (CAR |bfVar#71|)) NIL))
           (RETURN |bfVar#72|))
          ('T
           (PROGN
            (SETQ |bfVar#72| (|dbGetDocTable,gn| |x|))
            (COND (|bfVar#72| (RETURN |bfVar#72|))))))
         (SETQ |bfVar#71| (CDR |bfVar#71|))))
      NIL (HGET |docTable| |op|) NIL))))
(DEFUN |dbGetDocTable,gn| (|u|)
  (PROG (|code| |p| |comments|)
    (RETURN
     (PROGN
      (SETQ |$conform| (CAR |u|))
      (COND ((ATOM |$conform|) (SETQ |$conform| (LIST |$conform|))))
      (SETQ |code| (LASTATOM |u|))
      (SETQ |comments|
              (OR
               ((LAMBDA (|bfVar#74| |bfVar#73| |entry|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#73|)
                         (PROGN (SETQ |entry| (CAR |bfVar#73|)) NIL))
                     (RETURN |bfVar#74|))
                    ('T
                     (AND (SETQ |p| (|dbGetDocTable,hn| |entry|))
                          (PROGN
                           (SETQ |bfVar#74| |p|)
                           (COND (|bfVar#74| (RETURN |bfVar#74|)))))))
                   (SETQ |bfVar#73| (CDR |bfVar#73|))))
                NIL (CDR |u|) NIL)
               (RETURN NIL)))
      (CONS |$conform| (CONS (CAR |comments|) |code|))))))
(DEFUN |dbGetDocTable,hn| (|bfVar#75|)
  (PROG (|sig| |doc| |alteredSig| |pred| |r|)
    (RETURN
     (PROGN
      (SETQ |sig| (CAR |bfVar#75|))
      (SETQ |doc| (CDR |bfVar#75|))
      (SETQ |pred|
              (AND (EQL (LENGTH |$sig|) (LENGTH |sig|))
                   (PROGN
                    (SETQ |alteredSig|
                            (SUBLISLIS (IFCDR |$conform|)
                             |$FormalMapVariableList| |sig|))
                    (EQUAL |alteredSig| |$sig|))))
      (COND
       (|pred|
        (COND
         (|doc|
          (COND
           ((AND (CONSP |doc|) (EQ (CAR |doc|) '|constant|)
                 (PROGN (SETQ |r| (CDR |doc|)) #1='T))
            |r|)
           (#1# |doc|)))
         (#1# '(""))))
       (#1# NIL))))))

; kTestPred(n, dom, preds) ==
;   n = 0 => true
;   dom => testBitVector(preds, n)
;   simpHasPred(preds.(n - 1))

(DEFUN |kTestPred| (|n| |dom| |preds|)
  (PROG ()
    (RETURN
     (COND ((EQL |n| 0) T) (|dom| (|testBitVector| |preds| |n|))
           ('T (|simpHasPred| (ELT |preds| (- |n| 1))))))))

; dbAddChainDomain conform ==
;   [name,:args] := conform
;   infovec := dbInfovec(name) or return nil  --exit for categories
;   template := infovec.0
;   null (form := template . 5) => nil
;   dbSubConform(args, kFormatSlotDomain1(devaluate(form), infovec))

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

; dbSubConform(args,u) ==
;   atom u =>
;     (n := position(u,$FormalMapVariableList)) >= 0 => args . n
;     u
;   u is ['local,y] => dbSubConform(args,y)
;   [dbSubConform(args,x) for x in u]

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
       ((LAMBDA (|bfVar#77| |bfVar#76| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#76|) (PROGN (SETQ |x| (CAR |bfVar#76|)) NIL))
             (RETURN (NREVERSE |bfVar#77|)))
            (#1#
             (SETQ |bfVar#77| (CONS (|dbSubConform| |args| |x|) |bfVar#77|))))
           (SETQ |bfVar#76| (CDR |bfVar#76|))))
        NIL |u| NIL))))))

; dbAddChain conform ==
;   u := dbAddChainDomain conform =>
;     atom u => nil
;     [[u,:true],:dbAddChain u]
;   nil

(DEFUN |dbAddChain| (|conform|)
  (PROG (|u|)
    (RETURN
     (COND
      ((SETQ |u| (|dbAddChainDomain| |conform|))
       (COND ((ATOM |u|) NIL) (#1='T (CONS (CONS |u| T) (|dbAddChain| |u|)))))
      (#1# NIL)))))

; dbShowCons(htPage, key) ==
;   cAlist  := htpProperty(htPage,'cAlist)
;   key = 'filter =>
;     filter := pmTransFilter(dbGetInputString(htPage))
;     filter is ['error,:.] => bcErrorPage filter
;     abbrev? := htpProperty(htPage,'exclusion) = 'abbrs
;     u := [x for x in cAlist | test] where test ==
;       conname := CAAR x
;       subject := (abbrev? => constructor? conname; conname)
;       superMatch?(filter,DOWNCASE STRINGIMAGE subject)
;     null u => emptySearchPage('"constructor", filter, false)
;     htPage := htInitPageNoHeading(htCopyProplist htPage)
;     htpSetProperty(htPage,'cAlist,u)
;     dbShowCons(htPage,htpProperty(htPage,'exclusion))
;   if MEMQ(key,'(exposureOn exposureOff)) then
;     $exposedOnlyIfTrue :=
;       key = 'exposureOn => 'T
;       NIL
;     key := htpProperty(htPage,'exclusion)
;   dbShowCons1(htPage,cAlist,key)

(DEFUN |dbShowCons| (|htPage| |key|)
  (PROG (|cAlist| |filter| |abbrev?| |conname| |subject| |u|)
    (RETURN
     (PROGN
      (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
      (COND
       ((EQ |key| '|filter|)
        (PROGN
         (SETQ |filter| (|pmTransFilter| (|dbGetInputString| |htPage|)))
         (COND
          ((AND (CONSP |filter|) (EQ (CAR |filter|) '|error|))
           (|bcErrorPage| |filter|))
          (#1='T
           (PROGN
            (SETQ |abbrev?|
                    (EQ (|htpProperty| |htPage| '|exclusion|) '|abbrs|))
            (SETQ |u|
                    ((LAMBDA (|bfVar#79| |bfVar#78| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#78|)
                              (PROGN (SETQ |x| (CAR |bfVar#78|)) NIL))
                          (RETURN (NREVERSE |bfVar#79|)))
                         (#1#
                          (AND
                           (PROGN
                            (SETQ |conname| (CAAR |x|))
                            (SETQ |subject|
                                    (COND
                                     (|abbrev?| (|constructor?| |conname|))
                                     (#1# |conname|)))
                            (|superMatch?| |filter|
                             (DOWNCASE (STRINGIMAGE |subject|))))
                           (SETQ |bfVar#79| (CONS |x| |bfVar#79|)))))
                        (SETQ |bfVar#78| (CDR |bfVar#78|))))
                     NIL |cAlist| NIL))
            (COND ((NULL |u|) (|emptySearchPage| "constructor" |filter| NIL))
                  (#1#
                   (PROGN
                    (SETQ |htPage|
                            (|htInitPageNoHeading|
                             (|htCopyProplist| |htPage|)))
                    (|htpSetProperty| |htPage| '|cAlist| |u|)
                    (|dbShowCons| |htPage|
                     (|htpProperty| |htPage| '|exclusion|))))))))))
       (#1#
        (PROGN
         (COND
          ((MEMQ |key| '(|exposureOn| |exposureOff|))
           (SETQ |$exposedOnlyIfTrue|
                   (COND ((EQ |key| '|exposureOn|) 'T) (#1# NIL)))
           (SETQ |key| (|htpProperty| |htPage| '|exclusion|))))
         (|dbShowCons1| |htPage| |cAlist| |key|))))))))

; conPageChoose conname ==
;   cAlist := [[getConstructorForm conname,:true]]
;   dbShowCons1(nil,cAlist,'names)

(DEFUN |conPageChoose| (|conname|)
  (PROG (|cAlist|)
    (RETURN
     (PROGN
      (SETQ |cAlist| (LIST (CONS (|getConstructorForm| |conname|) T)))
      (|dbShowCons1| NIL |cAlist| '|names|)))))

; dbShowCons1(htPage,cAlist,key) ==
;   conlist := REMDUP [item for x in cAlist | pred] where
;     pred ==
;       item := first x
;       $exposedOnlyIfTrue => isExposedConstructor opOf item
;       item
;   conlist is [.] => conPage
;     htPage and htpProperty(htPage,'domname) => first conlist
;     opOf first conlist
;   conlist := [opOf x for x in conlist]
;   kinds := "union"/[dbConstructorKind x for x in conlist]
;   kind :=
;     kinds is [a] => a
;     'constructor
;   proplist :=
;     htPage => htCopyProplist htPage
;     nil
;   page := htInitPageNoScroll(proplist,dbConsHeading(htPage,conlist,key,kind))
;   if u := htpProperty(page,'specialMessage) then APPLY(first u,rest u)
;   htSayStandard('"\beginscroll ")
;   htpSetProperty(page,'cAlist,cAlist)
;   $conformsAreDomains: local := htpProperty(page,'domname)
;   do
;   --key = 'catfilter => dbShowCatFilter(page,key)
;     key = 'names => bcNameConTable conlist
;     key = 'abbrs =>
;         bcAbbTable(page, [[con, get_database(con, 'ABBREVIATION)]
;                            for con in conlist])
;     key = 'files => BREAK()
;     key = 'documentation => dbShowConsDoc(page, conlist)
;     if $exposedOnlyIfTrue then
;       cAlist := [x for x in cAlist | isExposedConstructor opOf first x]
;     key = 'conditions => dbShowConditions(page, cAlist, kind)
;     key = 'parameters => bcConTable REMDUP ASSOCLEFT cAlist
;     key = 'kinds => dbShowConsKinds cAlist
;   dbConsExposureMessage()
;   htSayStandard('"\endscroll ")
;   dbPresentCons(page, kind, key)
;   htShowPageNoScroll()

(DEFUN |dbShowCons1| (|htPage| |cAlist| |key|)
  (PROG (|$conformsAreDomains| |u| |page| |proplist| |kind| |a| |kinds|
         |conlist| |item|)
    (DECLARE (SPECIAL |$conformsAreDomains|))
    (RETURN
     (PROGN
      (SETQ |conlist|
              (REMDUP
               ((LAMBDA (|bfVar#81| |bfVar#80| |x|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#80|)
                         (PROGN (SETQ |x| (CAR |bfVar#80|)) NIL))
                     (RETURN (NREVERSE |bfVar#81|)))
                    (#1='T
                     (AND
                      (PROGN
                       (SETQ |item| (CAR |x|))
                       (COND
                        (|$exposedOnlyIfTrue|
                         (|isExposedConstructor| (|opOf| |item|)))
                        (#1# |item|)))
                      (SETQ |bfVar#81| (CONS |item| |bfVar#81|)))))
                   (SETQ |bfVar#80| (CDR |bfVar#80|))))
                NIL |cAlist| NIL)))
      (COND
       ((AND (CONSP |conlist|) (EQ (CDR |conlist|) NIL))
        (|conPage|
         (COND
          ((AND |htPage| (|htpProperty| |htPage| '|domname|)) (CAR |conlist|))
          (#1# (|opOf| (CAR |conlist|))))))
       (#1#
        (PROGN
         (SETQ |conlist|
                 ((LAMBDA (|bfVar#83| |bfVar#82| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#82|)
                           (PROGN (SETQ |x| (CAR |bfVar#82|)) NIL))
                       (RETURN (NREVERSE |bfVar#83|)))
                      (#1# (SETQ |bfVar#83| (CONS (|opOf| |x|) |bfVar#83|))))
                     (SETQ |bfVar#82| (CDR |bfVar#82|))))
                  NIL |conlist| NIL))
         (SETQ |kinds|
                 ((LAMBDA (|bfVar#85| |bfVar#84| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#84|)
                           (PROGN (SETQ |x| (CAR |bfVar#84|)) NIL))
                       (RETURN |bfVar#85|))
                      (#1#
                       (SETQ |bfVar#85|
                               (|union| |bfVar#85|
                                (|dbConstructorKind| |x|)))))
                     (SETQ |bfVar#84| (CDR |bfVar#84|))))
                  NIL |conlist| NIL))
         (SETQ |kind|
                 (COND
                  ((AND (CONSP |kinds|) (EQ (CDR |kinds|) NIL)
                        (PROGN (SETQ |a| (CAR |kinds|)) #1#))
                   |a|)
                  (#1# '|constructor|)))
         (SETQ |proplist|
                 (COND (|htPage| (|htCopyProplist| |htPage|)) (#1# NIL)))
         (SETQ |page|
                 (|htInitPageNoScroll| |proplist|
                  (|dbConsHeading| |htPage| |conlist| |key| |kind|)))
         (COND
          ((SETQ |u| (|htpProperty| |page| '|specialMessage|))
           (APPLY (CAR |u|) (CDR |u|))))
         (|htSayStandard| "\\beginscroll ")
         (|htpSetProperty| |page| '|cAlist| |cAlist|)
         (SETQ |$conformsAreDomains| (|htpProperty| |page| '|domname|))
         (|do|
          (COND ((EQ |key| '|names|) (|bcNameConTable| |conlist|))
                ((EQ |key| '|abbrs|)
                 (|bcAbbTable| |page|
                  ((LAMBDA (|bfVar#87| |bfVar#86| |con|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#86|)
                            (PROGN (SETQ |con| (CAR |bfVar#86|)) NIL))
                        (RETURN (NREVERSE |bfVar#87|)))
                       (#1#
                        (SETQ |bfVar#87|
                                (CONS
                                 (LIST |con|
                                       (|get_database| |con| 'ABBREVIATION))
                                 |bfVar#87|))))
                      (SETQ |bfVar#86| (CDR |bfVar#86|))))
                   NIL |conlist| NIL)))
                ((EQ |key| '|files|) (BREAK))
                ((EQ |key| '|documentation|)
                 (|dbShowConsDoc| |page| |conlist|))
                (#1#
                 (PROGN
                  (COND
                   (|$exposedOnlyIfTrue|
                    (SETQ |cAlist|
                            ((LAMBDA (|bfVar#89| |bfVar#88| |x|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#88|)
                                      (PROGN (SETQ |x| (CAR |bfVar#88|)) NIL))
                                  (RETURN (NREVERSE |bfVar#89|)))
                                 (#1#
                                  (AND
                                   (|isExposedConstructor| (|opOf| (CAR |x|)))
                                   (SETQ |bfVar#89| (CONS |x| |bfVar#89|)))))
                                (SETQ |bfVar#88| (CDR |bfVar#88|))))
                             NIL |cAlist| NIL))))
                  (COND
                   ((EQ |key| '|conditions|)
                    (|dbShowConditions| |page| |cAlist| |kind|))
                   ((EQ |key| '|parameters|)
                    (|bcConTable| (REMDUP (ASSOCLEFT |cAlist|))))
                   ((EQ |key| '|kinds|) (|dbShowConsKinds| |cAlist|)))))))
         (|dbConsExposureMessage|)
         (|htSayStandard| "\\endscroll ")
         (|dbPresentCons| |page| |kind| |key|)
         (|htShowPageNoScroll|))))))))

; dbConsExposureMessage() ==
;   $atLeastOneUnexposed =>
;       htSay '"\newline{}-------------\newline{}{\em *} = unexposed"

(DEFUN |dbConsExposureMessage| ()
  (PROG ()
    (RETURN
     (COND
      (|$atLeastOneUnexposed|
       (IDENTITY
        (|htSay|
         "\\newline{}-------------\\newline{}{\\em *} = unexposed")))))))

; dbShowConsKindsFilter(htPage,[kind,cAlist]) ==
;   htpSetProperty(htPage,'cAlist,cAlist)
;   dbShowCons(htPage,htpProperty(htPage,'exclusion))

(DEFUN |dbShowConsKindsFilter| (|htPage| |bfVar#90|)
  (PROG (|kind| |cAlist|)
    (RETURN
     (PROGN
      (SETQ |kind| (CAR |bfVar#90|))
      (SETQ |cAlist| (CADR |bfVar#90|))
      (|htpSetProperty| |htPage| '|cAlist| |cAlist|)
      (|dbShowCons| |htPage| (|htpProperty| |htPage| '|exclusion|))))))

; dbShowConsDoc(htPage,conlist) ==
;   null rest conlist => dbShowConsDoc1(htPage,getConstructorForm opOf first conlist,nil)
;   cAlist := htpProperty(htPage,'cAlist)
;   --the following code is necessary to skip over duplicates on cAlist
;   index := 0
;   for x in REMDUP conlist repeat
;   -- for x in conlist repeat
;     dbShowConsDoc1(htPage,getConstructorForm x,i) where i ==
;       while CAAAR cAlist ~= x repeat
;         index := index + 1
;         cAlist := rest cAlist
;         null cAlist => systemError nil
;       index

(DEFUN |dbShowConsDoc| (|htPage| |conlist|)
  (PROG (|cAlist| |index|)
    (RETURN
     (COND
      ((NULL (CDR |conlist|))
       (|dbShowConsDoc1| |htPage|
        (|getConstructorForm| (|opOf| (CAR |conlist|))) NIL))
      (#1='T
       (PROGN
        (SETQ |cAlist| (|htpProperty| |htPage| '|cAlist|))
        (SETQ |index| 0)
        ((LAMBDA (|bfVar#91| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#91|) (PROGN (SETQ |x| (CAR |bfVar#91|)) NIL))
              (RETURN NIL))
             (#1#
              (|dbShowConsDoc1| |htPage| (|getConstructorForm| |x|)
               (PROGN
                ((LAMBDA ()
                   (LOOP
                    (COND ((EQUAL (CAAAR |cAlist|) |x|) (RETURN NIL))
                          (#1#
                           (PROGN
                            (SETQ |index| (+ |index| 1))
                            (SETQ |cAlist| (CDR |cAlist|))
                            (COND ((NULL |cAlist|) (|systemError| NIL)))))))))
                |index|))))
            (SETQ |bfVar#91| (CDR |bfVar#91|))))
         (REMDUP |conlist|) NIL)))))))

; dbShowConsDoc1(htPage,conform,indexOrNil) ==
;   [conname,:conargs] := conform
;   MEMQ(conname,$Primitives) =>
;       [["constructor", ["NIL", doc]], :.] := GET(conname, 'documentation)
;       sig :=
;          conname = 'Enumeration =>
;              '((CATEGORY domain) (Symbol) (Symbol))
;          '((CATEGORY domain) (SetCategory) (SetCategory))
;       displayDomainOp(htPage, '"constructor", conform, conname, sig, true,
;                       doc, indexOrNil, 'dbSelectCon, nil, nil)
;   exposeFlag := isExposedConstructor conname
;   doc := [getConstructorDocumentation conname]
;   signature := getConstructorSignature conname
;   sig :=
;     get_database(conname, 'CONSTRUCTORKIND) = 'category =>
;       SUBLISLIS(conargs,$TriangleVariableList,signature)
;     sublisFormal(conargs,signature)
;   displayDomainOp(htPage,'"constructor",conform,conname,sig,true,doc,indexOrNil,'dbSelectCon,null exposeFlag,nil)

(DEFUN |dbShowConsDoc1| (|htPage| |conform| |indexOrNil|)
  (PROG (|conname| |conargs| |LETTMP#1| |doc| |sig| |exposeFlag| |signature|)
    (RETURN
     (PROGN
      (SETQ |conname| (CAR |conform|))
      (SETQ |conargs| (CDR |conform|))
      (COND
       ((MEMQ |conname| |$Primitives|)
        (PROGN
         (SETQ |LETTMP#1| (GET |conname| '|documentation|))
         (SETQ |doc| (CAR (CDADAR |LETTMP#1|)))
         (SETQ |sig|
                 (COND
                  ((EQ |conname| '|Enumeration|)
                   '((CATEGORY |domain|) (|Symbol|) (|Symbol|)))
                  (#1='T
                   '((CATEGORY |domain|) (|SetCategory|) (|SetCategory|)))))
         (|displayDomainOp| |htPage| "constructor" |conform| |conname| |sig| T
          |doc| |indexOrNil| '|dbSelectCon| NIL NIL)))
       (#1#
        (PROGN
         (SETQ |exposeFlag| (|isExposedConstructor| |conname|))
         (SETQ |doc| (LIST (|getConstructorDocumentation| |conname|)))
         (SETQ |signature| (|getConstructorSignature| |conname|))
         (SETQ |sig|
                 (COND
                  ((EQ (|get_database| |conname| 'CONSTRUCTORKIND) '|category|)
                   (SUBLISLIS |conargs| |$TriangleVariableList| |signature|))
                  (#1# (|sublisFormal| |conargs| |signature|))))
         (|displayDomainOp| |htPage| "constructor" |conform| |conname| |sig| T
          |doc| |indexOrNil| '|dbSelectCon| (NULL |exposeFlag|) NIL))))))))

; getConstructorDocumentation conname ==
;   LASSOC('constructor, get_database(conname, 'DOCUMENTATION))
;     is [[nil,line,:.],:.] and line or '""

(DEFUN |getConstructorDocumentation| (|conname|)
  (PROG (|ISTMP#1| |ISTMP#2| |ISTMP#3| |line|)
    (RETURN
     (OR
      (AND
       (PROGN
        (SETQ |ISTMP#1|
                (LASSOC '|constructor|
                 (|get_database| |conname| 'DOCUMENTATION)))
        (AND (CONSP |ISTMP#1|)
             (PROGN
              (SETQ |ISTMP#2| (CAR |ISTMP#1|))
              (AND (CONSP |ISTMP#2|) (NULL (CAR |ISTMP#2|))
                   (PROGN
                    (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                    (AND (CONSP |ISTMP#3|)
                         (PROGN (SETQ |line| (CAR |ISTMP#3|)) 'T)))))))
       |line|)
      ""))))

; dbSelectCon(htPage, index) ==
;   conPage opOf first (htpProperty(htPage, 'cAlist)) . index

(DEFUN |dbSelectCon| (|htPage| |index|)
  (PROG ()
    (RETURN
     (|conPage|
      (|opOf| (CAR (ELT (|htpProperty| |htPage| '|cAlist|) |index|)))))))

; dbShowConditions(htPage,cAlist,kind) ==
;   conform := htpProperty(htPage,'conform)
;   conname := opOf conform
;   article := htpProperty(htPage,'article)
;   whichever := htpProperty(htPage,'whichever)
;   [consNoPred,:consPred] := splitConTable cAlist
;   singular := [kind,'" is"]
;   plural   := [pluralize STRINGIMAGE kind,'" are"]
;   dbSayItems(#consNoPred,singular,plural,'" unconditional")
;   bcConPredTable(consNoPred,conname)
;   htSayHrule()
;   dbSayItems(#consPred,singular,plural,'" conditional")
;   bcConPredTable(consPred,conname)

(DEFUN |dbShowConditions| (|htPage| |cAlist| |kind|)
  (PROG (|conform| |conname| |article| |whichever| |LETTMP#1| |consNoPred|
         |consPred| |singular| |plural|)
    (RETURN
     (PROGN
      (SETQ |conform| (|htpProperty| |htPage| '|conform|))
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |article| (|htpProperty| |htPage| '|article|))
      (SETQ |whichever| (|htpProperty| |htPage| '|whichever|))
      (SETQ |LETTMP#1| (|splitConTable| |cAlist|))
      (SETQ |consNoPred| (CAR |LETTMP#1|))
      (SETQ |consPred| (CDR |LETTMP#1|))
      (SETQ |singular| (LIST |kind| " is"))
      (SETQ |plural| (LIST (|pluralize| (STRINGIMAGE |kind|)) " are"))
      (|dbSayItems| (LENGTH |consNoPred|) |singular| |plural| " unconditional")
      (|bcConPredTable| |consNoPred| |conname|)
      (|htSayHrule|)
      (|dbSayItems| (LENGTH |consPred|) |singular| |plural| " conditional")
      (|bcConPredTable| |consPred| |conname|)))))

; dbConsHeading(htPage,conlist,view,kind) ==
;   thing := htPage and htpProperty(htPage,'thing) or '"constructor"
;   place :=
;     htPage => htpProperty(htPage,'domname) or htpProperty(htPage,'conform)
;     nil
;   count := #(REMDUP conlist)
;   -- count := #conlist
;   thing = '"benefactor" =>
;     [STRINGIMAGE count,'" Constructors Used by ",form2HtString(place,nil,true)]
;   modifier :=
;     thing = '"argument" =>
;       rank := htPage and htpProperty(htPage,'rank)
;       ['" Possible ",rank,'" "]
;     kind = 'constructor => ['" "]
;     ['" ",capitalize STRINGIMAGE kind,'" "]
; --  count = 1 =>
; --    ['"Select name or a {\em view} at the bottom"]
;   exposureWord :=
;     $exposedOnlyIfTrue => '(" Exposed ")
;     nil
;   prefix :=
;     count = 1 => [STRINGIMAGE count,:modifier,capitalize thing]
;     firstWord := (count = 0 => '"No "; STRINGIMAGE count)
;     [firstWord,:exposureWord, :modifier,capitalize pluralize thing]
;   placepart :=
;     place => ['" of {\em ",form2HtString(place,nil,true),"}"]
;     nil
;   heading := [:prefix,:placepart]
;   connective :=
;     member(view,'(abbrs files kinds)) => '" as "
;     '" with "
;   if count ~= 0 and member(view,'(abbrs files parameters conditions)) then heading:= [:heading,'" viewed",connective,'"{\em ",STRINGIMAGE view,'"}"]
;   heading

(DEFUN |dbConsHeading| (|htPage| |conlist| |view| |kind|)
  (PROG (|thing| |place| |count| |rank| |modifier| |exposureWord| |firstWord|
         |prefix| |placepart| |heading| |connective|)
    (RETURN
     (PROGN
      (SETQ |thing|
              (OR (AND |htPage| (|htpProperty| |htPage| '|thing|))
                  "constructor"))
      (SETQ |place|
              (COND
               (|htPage|
                (OR (|htpProperty| |htPage| '|domname|)
                    (|htpProperty| |htPage| '|conform|)))
               (#1='T NIL)))
      (SETQ |count| (LENGTH (REMDUP |conlist|)))
      (COND
       ((EQUAL |thing| "benefactor")
        (LIST (STRINGIMAGE |count|) " Constructors Used by "
              (|form2HtString| |place| NIL T)))
       (#1#
        (PROGN
         (SETQ |modifier|
                 (COND
                  ((EQUAL |thing| "argument")
                   (PROGN
                    (SETQ |rank|
                            (AND |htPage| (|htpProperty| |htPage| '|rank|)))
                    (LIST " Possible " |rank| " ")))
                  ((EQ |kind| '|constructor|) (LIST " "))
                  (#1# (LIST " " (|capitalize| (STRINGIMAGE |kind|)) " "))))
         (SETQ |exposureWord|
                 (COND (|$exposedOnlyIfTrue| '(" Exposed ")) (#1# NIL)))
         (SETQ |prefix|
                 (COND
                  ((EQL |count| 1)
                   (CONS (STRINGIMAGE |count|)
                         (APPEND |modifier|
                                 (CONS (|capitalize| |thing|) NIL))))
                  (#1#
                   (PROGN
                    (SETQ |firstWord|
                            (COND ((EQL |count| 0) "No ")
                                  (#1# (STRINGIMAGE |count|))))
                    (CONS |firstWord|
                          (APPEND |exposureWord|
                                  (APPEND |modifier|
                                          (CONS
                                           (|capitalize| (|pluralize| |thing|))
                                           NIL))))))))
         (SETQ |placepart|
                 (COND
                  (|place|
                   (LIST " of {\\em " (|form2HtString| |place| NIL T) '}))
                  (#1# NIL)))
         (SETQ |heading| (APPEND |prefix| |placepart|))
         (SETQ |connective|
                 (COND ((|member| |view| '(|abbrs| |files| |kinds|)) " as ")
                       (#1# " with ")))
         (COND
          ((AND (NOT (EQL |count| 0))
                (|member| |view| '(|abbrs| |files| |parameters| |conditions|)))
           (SETQ |heading|
                   (APPEND |heading|
                           (CONS " viewed"
                                 (CONS |connective|
                                       (CONS "{\\em "
                                             (CONS (STRINGIMAGE |view|)
                                                   (CONS "}" NIL)))))))))
         |heading|)))))))

; dbShowConstructorLines lines ==
;   cAlist := [[getConstructorForm intern dbName line,:true] for line in lines]
;   dbShowCons1(nil,listSort(function GLESSEQP,cAlist),'names)

(DEFUN |dbShowConstructorLines| (|lines|)
  (PROG (|cAlist|)
    (RETURN
     (PROGN
      (SETQ |cAlist|
              ((LAMBDA (|bfVar#93| |bfVar#92| |line|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#92|)
                        (PROGN (SETQ |line| (CAR |bfVar#92|)) NIL))
                    (RETURN (NREVERSE |bfVar#93|)))
                   ('T
                    (SETQ |bfVar#93|
                            (CONS
                             (CONS
                              (|getConstructorForm|
                               (|intern| (|dbName| |line|)))
                              T)
                             |bfVar#93|))))
                  (SETQ |bfVar#92| (CDR |bfVar#92|))))
               NIL |lines| NIL))
      (|dbShowCons1| NIL (|listSort| #'GLESSEQP |cAlist|) '|names|)))))

; isAsharpFileName? con == false

(DEFUN |isAsharpFileName?| (|con|) (PROG () (RETURN NIL)))

; MAKEPROP('Record, 'documentation, '(
;   (_=  (((Boolean) _% _%)
;    "\spad{r = s} tests for equality of two records \spad{r} and \spad{s}"))
;   (coerce (((OutputForm) _%)
;    "\spad{coerce(r)} returns an representation of \spad{r} as an output form")
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
          "\\spad{coerce(r)} returns an representation of \\spad{r} as an output form")
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
;                 (((Boolean) % "b")
;     "\spad{u case b} tests if \spad{u} is of branch \spad{b} of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of branch \spad{a} of the union. Error: if \spad{u} is of branch \spad{b} of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of branch \spad{b} branch of the union. Error: if \spad{u} is of the \spad{a} branch of the union.")
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
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of branch \\spad{a} of the union. Error: if \\spad{u} is of branch \\spad{b} of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of branch \\spad{b} branch of the union. Error: if \\spad{u} is of the \\spad{a} branch of the union.")
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
;     "\spad{e ~= f} tests that two enumerations \spad{e} and \spad{f} are nont equal"))
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
          "\\spad{e ~= f} tests that two enumerations \\spad{e} and \\spad{f} are nont equal"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(e)} returns a representation of enumeration \\spad{r} as an output form")
         ((% (|Symbol|))
          "\\spad{coerce(s)} converts a symbol \\spad{s} into an enumeration which has \\spad{s} as a member symbol")))))))
