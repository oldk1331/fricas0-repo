
(/VERSIONCHECK 2) 

(DEFPARAMETER |SegmentExpansionCategory;CAT| 'NIL) 

(DEFPARAMETER |SegmentExpansionCategory;AL| 'NIL) 

(DEFUN |SegmentExpansionCategory| (&REST #1=#:G126)
  (LET (#2=#:G127)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#) |SegmentExpansionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |SegmentExpansionCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|SegmentExpansionCategory;| #1#)))
               |SegmentExpansionCategory;AL|))
      #2#)))) 

(DEFUN |SegmentExpansionCategory;| (|t#1| |t#2|)
  (PROG (#1=#:G125)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV|
                (PAIR '(|t#1| |t#2|)
                      (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                (COND (|SegmentExpansionCategory;CAT|)
                      ('T
                       (LETT |SegmentExpansionCategory;CAT|
                             (|Join| (|SegmentCategory| '|t#1|)
                                     (|mkCategory|
                                      '(((|expand| (|t#2| (|List| $))) T)
                                        ((|expand| (|t#2| $)) T)
                                        ((|map|
                                          (|t#2| (|Mapping| |t#1| |t#1|) $))
                                         T))
                                      NIL '((|List| $)) NIL))
                             . #2=(|SegmentExpansionCategory|)))))
               . #2#)
       (SETELT #1# 0
               (LIST '|SegmentExpansionCategory| (|devaluate| |t#1|)
                     (|devaluate| |t#2|))))))) 
