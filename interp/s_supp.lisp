(in-package "BOOT")

; delete key from association list
(defun |assoc_delete_equal|(al key)
    (delete key al :key #'car :test #'equal))

; find key in association list
(defun |find_key| (itable key)
    (assoc key itable :test #'string=))

; Clean old data
(defun |clean_symbols|()
    (do-symbols (symbol)
        (when (get symbol 'database)
            (setf (get symbol 'database) nil))
        (when (get symbol 'abbreviationfor)
            (setf (get symbol 'abbreviationfor) nil)))
)

(defun |clean_symbols2|()
    (do-symbols (symbol)
        (when (get symbol 'database)
            (setf (get symbol 'database) nil)))
)

;; Helpers for reading databases

(defun |fetch_data_from_alist| (alist index)
    (cdr (assoc index alist :test #'string=)))

(defun |fetch_data_from_file| (ds index)
    (let (pos (alist (first ds)) (in (second ds)))
        (setf pos (second (assoc index alist :test #'string=)))
        (when pos
            (file-position in pos)
            (read in)))
)

;; Iteration over hash table
(defun |H_KEY_VALS|(table)
   (let (key_vals)
      (MAPHASH
        #'(lambda (key val) (push (cons key val) key_vals)) table)
        key_vals))

;; Write the timestamp
(defun |write_stamp|(masterpos out)
  #+:GCL (force-output out)

  (file-position out 0)
  (print (cons masterpos 1) out)
  #+:GCL (force-output out)
)

;------

(defun |maybe_gc|()
    nil
#+:GCL (SI::gbc t)
)
