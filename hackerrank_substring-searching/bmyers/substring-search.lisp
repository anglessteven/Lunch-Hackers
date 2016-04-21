(defun search-text (text pat text-index pat-index table)
  (cond ((>= (+ text-index pat-index) (length text)) 
          'NO)
        ((char= (char pat pat-index) (char text (+ text-index pat-index)))
          (if (= pat-index (1- (length pat)))
              'YES
              (search-text text
                          pat
                          text-index
                          (1+ pat-index)
                          table)))
        (t (progn (if (> (nth pat-index table) -1)
                      (search-text text 
                                  pat
                                  (+ text-index
                                     pat-index
                                     (- (nth pat-index table)))
                                  (nth pat-index table)
                                  table)
                      (search-text text
                                  pat
                                  (1+ text-index)
                                  0
                                  table))))))

(defun build-table (pat table pos cnd)
  (cond ((>= pos (length pat)) table)
        ((char= (char pat (1- pos)) (char pat cnd))
          (build-table pat 
                       (reverse (cons (1+ cnd) (reverse table)))
                       (1+ pos)
                       (1+ cnd)))
        ((> cnd 0)
          (build-table pat
                       table
                       pos
                       (nth cnd table)))
        (t (build-table pat 
                        (reverse (cons 0 (reverse table)))
                        (1+ pos)
                        cnd))))

(defun has-substring? (text pat)
  (search-text text pat 0 0 (build-table pat '(-1 0) 2 0)))

(loop for i from 1 to (parse-integer (read-line))
  do (format t "~A~%" (has-substring? (read-line) (read-line))))