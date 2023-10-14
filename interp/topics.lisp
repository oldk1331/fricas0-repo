 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; $topicsDefaults := '(
;   (basic elt setelt qelt qsetelt eval xRange yRange zRange map map_! qsetelt_!)
;   (conversion coerce convert retract)
;   (hidden retractIfCan Zero One)
;   (predicate _< _=)
;   (algebraic _+ _- _* _*_* _/ quo rem exquo)
;   (trignometric acos acot acsc asec asin atan cos cot csc sec sin tan)
;   (hyperbolic acosh acoth acsch asech asinh atanh cosh coth csch sech sinh tanh)
;   (destructive setelt qsetelt)
;   (extraction xRange yRange zRange elt qelt)
;   (transformation map map_!))
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$topicsDefaults|
          '((|basic| |elt| |setelt| |qelt| |qsetelt| |eval| |xRange| |yRange|
             |zRange| |map| |map!| |qsetelt!|)
            (|conversion| |coerce| |convert| |retract|)
            (|hidden| |retractIfCan| |Zero| |One|) (|predicate| < =)
            (|algebraic| + - * ** / |quo| |rem| |exquo|)
            (|trignometric| |acos| |acot| |acsc| |asec| |asin| |atan| |cos|
             |cot| |csc| |sec| |sin| |tan|)
            (|hyperbolic| |acosh| |acoth| |acsch| |asech| |asinh| |atanh|
             |cosh| |coth| |csch| |sech| |sinh| |tanh|)
            (|destructive| |setelt| |qsetelt|)
            (|extraction| |xRange| |yRange| |zRange| |elt| |qelt|)
            (|transformation| |map| |map!|))))
 
; $topicSynonyms := '(
;   (b . basic)
;   (h . hidden)
;   (e . extended)
;   (a . algebraic)
;   (g . algebraic)
;   (c . construct)
;   (d . destructive)
;   (v . conversion)
;   (m . miscellaneous)
;   (x . extraction)
;   (p . predicate)
;   (tg . trignometric)
;   (hy . hyperbolic)
;   (t . transformation))
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$topicSynonyms|
          '((|b| . |basic|) (|h| . |hidden|) (|e| . |extended|)
            (|a| . |algebraic|) (|g| . |algebraic|) (|c| . |construct|)
            (|d| . |destructive|) (|v| . |conversion|) (|m| . |miscellaneous|)
            (|x| . |extraction|) (|p| . |predicate|) (|tg| . |trignometric|)
            (|hy| . |hyperbolic|) (|t| . |transformation|))))
 
; $groupAssoc := '((extended . 1) (basic . 2) (hidden . 4))
 
(EVAL-WHEN (EVAL LOAD)
  (SETQ |$groupAssoc| '((|extended| . 1) (|basic| . 2) (|hidden| . 4))))
 
; mkTopicHashTable() ==                         --given $groupAssoc = ((extended . 1)(basic . 2)(xx . 4)..)
;   $defaultsHash := MAKE_-HASHTABLE 'ID        --keys are ops, value is list of topic names
;   for [kind,:items] in $topicsDefaults repeat --$topicsDefaults is ((<topic> op ...) ..)
;     for item in items repeat
;       HPUT($defaultsHash,item,[kind,:HGET($defaultsHash,item)])
;   $conTopicHash  := MAKE_-HASHTABLE 'EQL      --key is constructor name; value is
;   instream := OPEN '"topics.data"
;   while not EOFP instream repeat
;     line := READLINE instream
;     while blankLine? line repeat line := READLINE instream
;     m := MAXINDEX line                        --file "topics.data" has form:
;     m = -1 => 'skip                           --1   ConstructorName:
;     line.0 = char '_- => 'skip                --2      constructorName or operation name
;     line := trimString line                   --3-n    ...
;     m := MAXINDEX line                        --     (blank line) ...
;     line.m ~= (char '_:) => systemError('"wrong heading")
;     con := INTERN SUBSTRING(line,0,m)
;     alist := [lst while not EOFP instream and
;        not (blankLine? (line := READLINE instream)) and
;          line.0 ~= char '_- for i in 1..
;            | lst := string2OpAlist line]
;     alist => HPUT($conTopicHash,con,alist)
;   --initialize table of topic classes
;   $topicHash := MAKE_-HASHTABLE 'ID           --$topicHash has keys: topic and value: index
;   for [x,:c] in $groupAssoc repeat HPUT($topicHash,x,c)
;   $topicIndex := rest last $groupAssoc
; 
;   --replace each property list by a topic code
;   --store under each construct an OR of all codes
;   for con in HKEYS $conTopicHash repeat
;     conCode := 0
;     for pair in HGET($conTopicHash,con) repeat
;       RPLACD(pair, code := topicCode rest pair)
;       conCode := LOGIOR(conCode,code)
;     HPUT($conTopicHash,con,
;       [['constructor,:conCode],:HGET($conTopicHash,con)])
;   SHUT instream
; 
; --reduce integers stored under names to 1 + its power of 2
;   for key in HKEYS $topicHash repeat
;     HPUT($topicHash,key,INTEGER_-LENGTH HGET($topicHash,key))
; 
;   $conTopicHash   --keys are ops or 'constructor', values are codes
 
(DEFUN |mkTopicHashTable| ()
  (PROG (|code| |conCode| |c| |x| |alist| |lst| |con| |m| |line| |instream|
         |items| |kind|)
    (RETURN
     (PROGN
      (SETQ |$defaultsHash| (MAKE-HASHTABLE 'ID))
      ((LAMBDA (|bfVar#2| |bfVar#1|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#1|)
                 (PROGN
                  (SETQ |kind| (CAR |bfVar#1|))
                  (SETQ |items| (CDR |bfVar#1|))
                  #1#)
                 ((LAMBDA (|bfVar#3| |item|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#3|)
                           (PROGN (SETQ |item| (CAR |bfVar#3|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (HPUT |$defaultsHash| |item|
                             (CONS |kind| (HGET |$defaultsHash| |item|)))))
                     (SETQ |bfVar#3| (CDR |bfVar#3|))))
                  |items| NIL))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |$topicsDefaults| NIL)
      (SETQ |$conTopicHash| (MAKE-HASHTABLE 'EQL))
      (SETQ |instream| (OPEN "topics.data"))
      ((LAMBDA ()
         (LOOP
          (COND ((EOFP |instream|) (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |line| (READLINE |instream|))
                  ((LAMBDA ()
                     (LOOP
                      (COND ((NOT (|blankLine?| |line|)) (RETURN NIL))
                            (#1# (SETQ |line| (READLINE |instream|)))))))
                  (SETQ |m| (MAXINDEX |line|))
                  (COND ((EQUAL |m| (- 1)) '|skip|)
                        ((EQUAL (ELT |line| 0) (|char| '-)) '|skip|)
                        (#1#
                         (PROGN
                          (SETQ |line| (|trimString| |line|))
                          (SETQ |m| (MAXINDEX |line|))
                          (COND
                           ((NOT (EQUAL (ELT |line| |m|) (|char| '|:|)))
                            (|systemError| "wrong heading"))
                           (#1#
                            (PROGN
                             (SETQ |con| (INTERN (SUBSTRING |line| 0 |m|)))
                             (SETQ |alist|
                                     ((LAMBDA (|bfVar#4| |i|)
                                        (LOOP
                                         (COND
                                          ((NOT
                                            (AND (NULL (EOFP |instream|))
                                                 (NULL
                                                  (|blankLine?|
                                                   (SETQ |line|
                                                           (READLINE
                                                            |instream|))))
                                                 (NOT
                                                  (EQUAL (ELT |line| 0)
                                                         (|char| '-)))))
                                           (RETURN (NREVERSE |bfVar#4|)))
                                          (#1#
                                           (AND
                                            (SETQ |lst|
                                                    (|string2OpAlist| |line|))
                                            (SETQ |bfVar#4|
                                                    (CONS |lst| |bfVar#4|)))))
                                         (SETQ |i| (+ |i| 1))))
                                      NIL 1))
                             (COND
                              (|alist|
                               (HPUT |$conTopicHash| |con|
                                     |alist|)))))))))))))))
      (SETQ |$topicHash| (MAKE-HASHTABLE 'ID))
      ((LAMBDA (|bfVar#6| |bfVar#5|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (CONSP |bfVar#5|)
                 (PROGN
                  (SETQ |x| (CAR |bfVar#5|))
                  (SETQ |c| (CDR |bfVar#5|))
                  #1#)
                 (HPUT |$topicHash| |x| |c|))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       |$groupAssoc| NIL)
      (SETQ |$topicIndex| (CDR (|last| |$groupAssoc|)))
      ((LAMBDA (|bfVar#7| |con|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#7|) (PROGN (SETQ |con| (CAR |bfVar#7|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (SETQ |conCode| 0)
             ((LAMBDA (|bfVar#8| |pair|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#8|)
                       (PROGN (SETQ |pair| (CAR |bfVar#8|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (PROGN
                    (RPLACD |pair| (SETQ |code| (|topicCode| (CDR |pair|))))
                    (SETQ |conCode| (LOGIOR |conCode| |code|)))))
                 (SETQ |bfVar#8| (CDR |bfVar#8|))))
              (HGET |$conTopicHash| |con|) NIL)
             (HPUT |$conTopicHash| |con|
                   (CONS (CONS '|constructor| |conCode|)
                         (HGET |$conTopicHash| |con|))))))
          (SETQ |bfVar#7| (CDR |bfVar#7|))))
       (HKEYS |$conTopicHash|) NIL)
      (SHUT |instream|)
      ((LAMBDA (|bfVar#9| |key|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |key| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1#
            (HPUT |$topicHash| |key|
                  (INTEGER-LENGTH (HGET |$topicHash| |key|)))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       (HKEYS |$topicHash|) NIL)
      |$conTopicHash|))))
 
; blankLine? line ==
;   MAXINDEX line = -1 or and/[line . j = (char '_ ) for j in 0..MAXINDEX line]
 
(DEFUN |blankLine?| (|line|)
  (PROG ()
    (RETURN
     (OR (EQUAL (MAXINDEX |line|) (- 1))
         ((LAMBDA (|bfVar#11| |bfVar#10| |j|)
            (LOOP
             (COND ((> |j| |bfVar#10|) (RETURN |bfVar#11|))
                   ('T
                    (PROGN
                     (SETQ |bfVar#11| (EQUAL (ELT |line| |j|) (|char| '| |)))
                     (COND ((NOT |bfVar#11|) (RETURN NIL))))))
             (SETQ |j| (+ |j| 1))))
          T (MAXINDEX |line|) 0)))))
 
; string2OpAlist s ==
;   m := #s
;   k := skipBlanks(s,0,m) or return nil
;   UPPER_-CASE_-P s.k => nil       --skip constructor names
;   k := 0
;   while (k := skipBlanks(s,k,m)) repeat
;     acc := [INTERN SUBSTRING(s,k,-k + (k := charPosition(char '_ ,s,k + 1))),:acc]
;   acc := NREVERSE acc
;   --now add defaults
;   if u := getDefaultProps first acc then acc := [first acc,:u,:rest acc]
;   acc
 
(DEFUN |string2OpAlist| (|s|)
  (PROG (|m| |k| |acc| |u|)
    (RETURN
     (PROGN
      (SETQ |m| (LENGTH |s|))
      (SETQ |k| (OR (|skipBlanks| |s| 0 |m|) (RETURN NIL)))
      (COND ((UPPER-CASE-P (ELT |s| |k|)) NIL)
            (#1='T
             (PROGN
              (SETQ |k| 0)
              ((LAMBDA ()
                 (LOOP
                  (COND
                   ((NOT (SETQ |k| (|skipBlanks| |s| |k| |m|))) (RETURN NIL))
                   (#1#
                    (SETQ |acc|
                            (CONS
                             (INTERN
                              (SUBSTRING |s| |k|
                                         (+ (- |k|)
                                            (SETQ |k|
                                                    (|charPosition|
                                                     (|char| '| |) |s|
                                                     (+ |k| 1))))))
                             |acc|)))))))
              (SETQ |acc| (NREVERSE |acc|))
              (COND
               ((SETQ |u| (|getDefaultProps| (CAR |acc|)))
                (SETQ |acc| (CONS (CAR |acc|) (APPEND |u| (CDR |acc|))))))
              |acc|)))))))
 
; getDefaultProps name ==
;   u := HGET($defaultsHash,name)
;   if (s := PNAME name).(m := MAXINDEX s) = char '? then u := ['p,:u]
;   if s.m = char '_! then u := ['destructive,:u]
;   u
 
(DEFUN |getDefaultProps| (|name|)
  (PROG (|u| |s| |m|)
    (RETURN
     (PROGN
      (SETQ |u| (HGET |$defaultsHash| |name|))
      (COND
       ((EQUAL (ELT (SETQ |s| (PNAME |name|)) (SETQ |m| (MAXINDEX |s|)))
               (|char| '?))
        (SETQ |u| (CONS '|p| |u|))))
      (COND
       ((EQUAL (ELT |s| |m|) (|char| '!))
        (SETQ |u| (CONS '|destructive| |u|))))
      |u|))))
 
; skipBlanks(u,i,m) ==
;   while i < m and u.i = $charBlank repeat i := i + 1
;   i >= m => nil
;   i
 
(DEFUN |skipBlanks| (|u| |i| |m|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT (AND (< |i| |m|) (EQUAL (ELT |u| |i|) |$charBlank|)))
            (RETURN NIL))
           (#1='T (SETQ |i| (+ |i| 1)))))))
      (COND ((NOT (< |i| |m|)) NIL) (#1# |i|))))))
 
; topicCode lst ==
;   u := [y for x in lst] where y ==
;     rename := LASSOC(x,$topicSynonyms) => rename
;     x
;   if null intersection('(basic extended hidden),u) then u := ['extended,:u]
;   bitIndexList := nil
;   for x in REMDUP u repeat
;     bitIndexList := [fn x,:bitIndexList] where fn x ==
;       k := HGET($topicHash,x) => k
;       HPUT($topicHash,x,$topicIndex := $topicIndex * 2)
;       $topicIndex
;   code := +/[i for i in bitIndexList]
 
(DEFUN |topicCode| (|lst|)
  (PROG (|rename| |u| |bitIndexList| |code|)
    (RETURN
     (PROGN
      (SETQ |u|
              ((LAMBDA (|bfVar#13| |bfVar#12| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#12|)
                        (PROGN (SETQ |x| (CAR |bfVar#12|)) NIL))
                    (RETURN (NREVERSE |bfVar#13|)))
                   (#1='T
                    (SETQ |bfVar#13|
                            (CONS
                             (COND
                              ((SETQ |rename| (LASSOC |x| |$topicSynonyms|))
                               |rename|)
                              (#1# |x|))
                             |bfVar#13|))))
                  (SETQ |bfVar#12| (CDR |bfVar#12|))))
               NIL |lst| NIL))
      (COND
       ((NULL (|intersection| '(|basic| |extended| |hidden|) |u|))
        (SETQ |u| (CONS '|extended| |u|))))
      (SETQ |bitIndexList| NIL)
      ((LAMBDA (|bfVar#14| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#14|) (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
            (RETURN NIL))
           (#1#
            (SETQ |bitIndexList| (CONS (|topicCode,fn| |x|) |bitIndexList|))))
          (SETQ |bfVar#14| (CDR |bfVar#14|))))
       (REMDUP |u|) NIL)
      (SETQ |code|
              ((LAMBDA (|bfVar#16| |bfVar#15| |i|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#15|)
                        (PROGN (SETQ |i| (CAR |bfVar#15|)) NIL))
                    (RETURN |bfVar#16|))
                   (#1# (SETQ |bfVar#16| (+ |bfVar#16| |i|))))
                  (SETQ |bfVar#15| (CDR |bfVar#15|))))
               0 |bitIndexList| NIL))))))
(DEFUN |topicCode,fn| (|x|)
  (PROG (|k|)
    (RETURN
     (COND ((SETQ |k| (HGET |$topicHash| |x|)) |k|)
           ('T
            (PROGN
             (HPUT |$topicHash| |x| (SETQ |$topicIndex| (* |$topicIndex| 2)))
             |$topicIndex|))))))
 
; addTopic2Documentation(con,docAlist) ==
;   alist := HGET($conTopicHash,con) or return docAlist
;   [y for x in docAlist] where y ==
;     [op,:pairlist] := x
;     code := LASSOC(op,alist) or 0
;     for sigDoc in pairlist repeat
;       sigDoc is [.,.] => RPLACD(rest sigDoc,code)
;       systemError sigDoc
;   docAlist
 
(DEFUN |addTopic2Documentation| (|con| |docAlist|)
  (PROG (|alist| |op| |pairlist| |code| |ISTMP#1|)
    (RETURN
     (PROGN
      (SETQ |alist| (OR (HGET |$conTopicHash| |con|) (RETURN |docAlist|)))
      ((LAMBDA (|bfVar#18| |bfVar#17| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#17|) (PROGN (SETQ |x| (CAR |bfVar#17|)) NIL))
            (RETURN (NREVERSE |bfVar#18|)))
           (#1='T
            (SETQ |bfVar#18|
                    (CONS
                     (PROGN
                      (SETQ |op| (CAR |x|))
                      (SETQ |pairlist| (CDR |x|))
                      (SETQ |code| (OR (LASSOC |op| |alist|) 0))
                      ((LAMBDA (|bfVar#19| |sigDoc|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#19|)
                                (PROGN (SETQ |sigDoc| (CAR |bfVar#19|)) NIL))
                            (RETURN NIL))
                           (#1#
                            (COND
                             ((AND (CONSP |sigDoc|)
                                   (PROGN
                                    (SETQ |ISTMP#1| (CDR |sigDoc|))
                                    (AND (CONSP |ISTMP#1|)
                                         (EQ (CDR |ISTMP#1|) NIL))))
                              (RPLACD (CDR |sigDoc|) |code|))
                             (#1# (|systemError| |sigDoc|)))))
                          (SETQ |bfVar#19| (CDR |bfVar#19|))))
                       |pairlist| NIL))
                     |bfVar#18|))))
          (SETQ |bfVar#17| (CDR |bfVar#17|))))
       NIL |docAlist| NIL)
      |docAlist|))))
 
; td con ==
;   $topicClasses := ASSOCRIGHT mySort
;       [[HGET($topicHash,key),:key] for key in HKEYS $topicHash]
;   hash := MAKE_-HASHTABLE 'ID
;   tdAdd(con,hash)
;   tdPrint hash
 
(DEFUN |td| (|con|)
  (PROG (|hash|)
    (RETURN
     (PROGN
      (SETQ |$topicClasses|
              (ASSOCRIGHT
               (|mySort|
                ((LAMBDA (|bfVar#21| |bfVar#20| |key|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#20|)
                          (PROGN (SETQ |key| (CAR |bfVar#20|)) NIL))
                      (RETURN (NREVERSE |bfVar#21|)))
                     ('T
                      (SETQ |bfVar#21|
                              (CONS (CONS (HGET |$topicHash| |key|) |key|)
                                    |bfVar#21|))))
                    (SETQ |bfVar#20| (CDR |bfVar#20|))))
                 NIL (HKEYS |$topicHash|) NIL))))
      (SETQ |hash| (MAKE-HASHTABLE 'ID))
      (|tdAdd| |con| |hash|)
      (|tdPrint| |hash|)))))
 
; tdAdd(con,hash) ==
;   v := HGET($conTopicHash,con)
;   u := addTopic2Documentation(con,v)
; --u := GETDATABASE(con,'DOCUMENTATION)
;   for pair in u | FIXP (code := myLastAtom pair) and
;        (op := first pair) ~= 'construct repeat
;     for x in (names := code2Classes code) repeat HPUT(hash,x,insert(op,HGET(hash,x)))
 
(DEFUN |tdAdd| (|con| |hash|)
  (PROG (|v| |u| |code| |op| |names|)
    (RETURN
     (PROGN
      (SETQ |v| (HGET |$conTopicHash| |con|))
      (SETQ |u| (|addTopic2Documentation| |con| |v|))
      ((LAMBDA (|bfVar#22| |pair|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#22|) (PROGN (SETQ |pair| (CAR |bfVar#22|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (FIXP (SETQ |code| (|myLastAtom| |pair|)))
                 (NOT (EQ (SETQ |op| (CAR |pair|)) '|construct|))
                 ((LAMBDA (|bfVar#23| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#23|)
                           (PROGN (SETQ |x| (CAR |bfVar#23|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (HPUT |hash| |x| (|insert| |op| (HGET |hash| |x|)))))
                     (SETQ |bfVar#23| (CDR |bfVar#23|))))
                  (SETQ |names| (|code2Classes| |code|)) NIL))))
          (SETQ |bfVar#22| (CDR |bfVar#22|))))
       |u| NIL)))))
 
; tdPrint hash ==
;   for key in mySort HKEYS hash repeat
;     sayBrightly [key,'":"]
;     sayBrightlyNT '"   "
;     for x in HGET(hash,key) repeat sayBrightlyNT ['" ",x]
;     TERPRI()
 
(DEFUN |tdPrint| (|hash|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#24| |key|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#24|) (PROGN (SETQ |key| (CAR |bfVar#24|)) NIL))
           (RETURN NIL))
          (#1='T
           (PROGN
            (|sayBrightly| (LIST |key| ":"))
            (|sayBrightlyNT| "   ")
            ((LAMBDA (|bfVar#25| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#25|)
                      (PROGN (SETQ |x| (CAR |bfVar#25|)) NIL))
                  (RETURN NIL))
                 (#1# (|sayBrightlyNT| (LIST " " |x|))))
                (SETQ |bfVar#25| (CDR |bfVar#25|))))
             (HGET |hash| |key|) NIL)
            (TERPRI))))
         (SETQ |bfVar#24| (CDR |bfVar#24|))))
      (|mySort| (HKEYS |hash|)) NIL))))
 
; topics con ==
;   --assumes that DOCUMENTATION property already has #s added
;   $topicClasses := ASSOCRIGHT mySort
;       [[HGET($topicHash,key),:key] for key in HKEYS $topicHash]
;   hash := MAKE_-HASHTABLE 'ID
;   tdAdd(con,hash)
;   for x in REMDUP [CAAR y for y in ancestorsOf(getConstructorForm con,nil)] repeat
;     tdAdd(x,hash)
;   for x in HKEYS hash repeat HPUT(hash,x,mySort HGET(hash,x))
;   tdPrint hash
 
(DEFUN |topics| (|con|)
  (PROG (|hash|)
    (RETURN
     (PROGN
      (SETQ |$topicClasses|
              (ASSOCRIGHT
               (|mySort|
                ((LAMBDA (|bfVar#27| |bfVar#26| |key|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#26|)
                          (PROGN (SETQ |key| (CAR |bfVar#26|)) NIL))
                      (RETURN (NREVERSE |bfVar#27|)))
                     (#1='T
                      (SETQ |bfVar#27|
                              (CONS (CONS (HGET |$topicHash| |key|) |key|)
                                    |bfVar#27|))))
                    (SETQ |bfVar#26| (CDR |bfVar#26|))))
                 NIL (HKEYS |$topicHash|) NIL))))
      (SETQ |hash| (MAKE-HASHTABLE 'ID))
      (|tdAdd| |con| |hash|)
      ((LAMBDA (|bfVar#30| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#30|) (PROGN (SETQ |x| (CAR |bfVar#30|)) NIL))
            (RETURN NIL))
           (#1# (|tdAdd| |x| |hash|)))
          (SETQ |bfVar#30| (CDR |bfVar#30|))))
       (REMDUP
        ((LAMBDA (|bfVar#29| |bfVar#28| |y|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#28|) (PROGN (SETQ |y| (CAR |bfVar#28|)) NIL))
              (RETURN (NREVERSE |bfVar#29|)))
             (#1# (SETQ |bfVar#29| (CONS (CAAR |y|) |bfVar#29|))))
            (SETQ |bfVar#28| (CDR |bfVar#28|))))
         NIL (|ancestorsOf| (|getConstructorForm| |con|) NIL) NIL))
       NIL)
      ((LAMBDA (|bfVar#31| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#31|) (PROGN (SETQ |x| (CAR |bfVar#31|)) NIL))
            (RETURN NIL))
           (#1# (HPUT |hash| |x| (|mySort| (HGET |hash| |x|)))))
          (SETQ |bfVar#31| (CDR |bfVar#31|))))
       (HKEYS |hash|) NIL)
      (|tdPrint| |hash|)))))
 
; code2Classes cc ==
;   cc := 2*cc
;   [x while cc ~= 0 for x in $topicClasses | ODDP (cc := QUOTIENT(cc,2))]
 
(DEFUN |code2Classes| (|cc|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |cc| (* 2 |cc|))
      ((LAMBDA (|bfVar#33| |bfVar#32| |x|)
         (LOOP
          (COND
           ((OR (EQL |cc| 0) (ATOM |bfVar#32|)
                (PROGN (SETQ |x| (CAR |bfVar#32|)) NIL))
            (RETURN (NREVERSE |bfVar#33|)))
           ('T
            (AND (ODDP (SETQ |cc| (QUOTIENT |cc| 2)))
                 (SETQ |bfVar#33| (CONS |x| |bfVar#33|)))))
          (SETQ |bfVar#32| (CDR |bfVar#32|))))
       NIL |$topicClasses| NIL)))))
 
; myLastAtom x ==
;   while x is [.,:x] repeat nil
;   x
 
(DEFUN |myLastAtom| (|x|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA ()
         (LOOP
          (COND
           ((NOT (AND (CONSP |x|) (PROGN (SETQ |x| (CDR |x|)) #1='T)))
            (RETURN NIL))
           (#1# NIL)))))
      |x|))))
 
; transferClassCodes(conform,opAlist) ==
;   transferCodeCon(opOf conform,opAlist)
;   for x in ancestorsOf(conform,nil) repeat
;     transferCodeCon(CAAR x,opAlist)
 
(DEFUN |transferClassCodes| (|conform| |opAlist|)
  (PROG ()
    (RETURN
     (PROGN
      (|transferCodeCon| (|opOf| |conform|) |opAlist|)
      ((LAMBDA (|bfVar#34| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#34|) (PROGN (SETQ |x| (CAR |bfVar#34|)) NIL))
            (RETURN NIL))
           ('T (|transferCodeCon| (CAAR |x|) |opAlist|)))
          (SETQ |bfVar#34| (CDR |bfVar#34|))))
       (|ancestorsOf| |conform| NIL) NIL)))))
 
; transferCodeCon(con,opAlist) ==
;   for pair in GETDATABASE(con,'DOCUMENTATION)
;     | FIXP (code := myLastAtom pair) repeat
;       u := assoc(QCAR pair,opAlist) => RPLACD(LASTNODE u,code)
 
(DEFUN |transferCodeCon| (|con| |opAlist|)
  (PROG (|code| |u|)
    (RETURN
     ((LAMBDA (|bfVar#35| |pair|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#35|) (PROGN (SETQ |pair| (CAR |bfVar#35|)) NIL))
           (RETURN NIL))
          ('T
           (AND (FIXP (SETQ |code| (|myLastAtom| |pair|)))
                (COND
                 ((SETQ |u| (|assoc| (QCAR |pair|) |opAlist|))
                  (IDENTITY (RPLACD (LASTNODE |u|) |code|)))))))
         (SETQ |bfVar#35| (CDR |bfVar#35|))))
      (GETDATABASE |con| 'DOCUMENTATION) NIL))))
 
; filterByTopic(opAlist,topic) ==
;   bitNumber := HGET($topicHash,topic)
;   [x for x in opAlist
;     | FIXP (code := myLastAtom x) and LOGBITP(bitNumber,code)]
 
(DEFUN |filterByTopic| (|opAlist| |topic|)
  (PROG (|bitNumber| |code|)
    (RETURN
     (PROGN
      (SETQ |bitNumber| (HGET |$topicHash| |topic|))
      ((LAMBDA (|bfVar#37| |bfVar#36| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#36|) (PROGN (SETQ |x| (CAR |bfVar#36|)) NIL))
            (RETURN (NREVERSE |bfVar#37|)))
           ('T
            (AND (FIXP (SETQ |code| (|myLastAtom| |x|)))
                 (LOGBITP |bitNumber| |code|)
                 (SETQ |bfVar#37| (CONS |x| |bfVar#37|)))))
          (SETQ |bfVar#36| (CDR |bfVar#36|))))
       NIL |opAlist| NIL)))))
 
; listOfTopics(conname) ==
;   doc := GETDATABASE(conname,'DOCUMENTATION)
;   u := assoc('constructor,doc) or return nil
;   code := myLastAtom u
; --null FIXP code => nil
;   mySort [key for key in HKEYS($topicHash) | LOGBITP(HGET($topicHash,key),code)]
 
(DEFUN |listOfTopics| (|conname|)
  (PROG (|doc| |u| |code|)
    (RETURN
     (PROGN
      (SETQ |doc| (GETDATABASE |conname| 'DOCUMENTATION))
      (SETQ |u| (OR (|assoc| '|constructor| |doc|) (RETURN NIL)))
      (SETQ |code| (|myLastAtom| |u|))
      (|mySort|
       ((LAMBDA (|bfVar#39| |bfVar#38| |key|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#38|) (PROGN (SETQ |key| (CAR |bfVar#38|)) NIL))
             (RETURN (NREVERSE |bfVar#39|)))
            ('T
             (AND (LOGBITP (HGET |$topicHash| |key|) |code|)
                  (SETQ |bfVar#39| (CONS |key| |bfVar#39|)))))
           (SETQ |bfVar#38| (CDR |bfVar#38|))))
        NIL (HKEYS |$topicHash|) NIL))))))
