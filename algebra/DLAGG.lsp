
(/VERSIONCHECK 2) 

(DEFPARAMETER |DoublyLinkedAggregate;CAT| 'NIL) 

(DEFPARAMETER |DoublyLinkedAggregate;AL| 'NIL) 

(DEFUN |DoublyLinkedAggregate| (#1=#:G128)
  (LET (#2=#:G129)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |DoublyLinkedAggregate;AL|))
      (CDR #2#))
     (T
      (SETQ |DoublyLinkedAggregate;AL|
              (|cons5| (CONS #3# (SETQ #2# (|DoublyLinkedAggregate;| #1#)))
                       |DoublyLinkedAggregate;AL|))
      #2#)))) 

(DEFUN |DoublyLinkedAggregate;| (|t#1|)
  (PROG (#1=#:G127)
    (RETURN
     (PROG1
         (LETT #1#
               (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                          (COND (|DoublyLinkedAggregate;CAT|)
                                ('T
                                 (LETT |DoublyLinkedAggregate;CAT|
                                       (|Join| (|RecursiveAggregate| '|t#1|)
                                               (|mkCategory|
                                                '(((|last| (|t#1| $)) T)
                                                  ((|head| ($ $)) T)
                                                  ((|tail| ($ $)) T)
                                                  ((|previous| ($ $)) T)
                                                  ((|next| ($ $)) T)
                                                  ((|concat!| ($ $ $))
                                                   (|has| $
                                                          (|shallowlyMutable|)))
                                                  ((|setprevious!| ($ $ $))
                                                   (|has| $
                                                          (|shallowlyMutable|)))
                                                  ((|setnext!| ($ $ $))
                                                   (|has| $
                                                          (|shallowlyMutable|))))
                                                NIL 'NIL NIL))
                                       . #2=(|DoublyLinkedAggregate|)))))
               . #2#)
       (SETELT #1# 0 (LIST '|DoublyLinkedAggregate| (|devaluate| |t#1|))))))) 
