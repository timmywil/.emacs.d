;; utility.el
;; Utilities for emacs lisp

(defun fold (proc nil-value seq)
  "The fundamental list iterator."
  (let ((acc nil-value))
    (mapc (lambda (el)
            (setq acc (funcall proc el acc)))
          seq)
    acc))


(provide 'utility)

;; end utility.el