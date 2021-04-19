(defun all-function-symbols (package-name macros-p)
  "Retrieves all function symbols from a package.
From http://reference-error.org/2015/08/30/common-lisp-finding-all-functions-in-a-package.html"
  (declare ((or package string symbol) package-name))
  (the list
       (let ((lst (list))
             (package (find-package package-name)))
         (cond (package
                (do-all-symbols (symb package)
                  (when (and (if macros-p
                                 (macro-function symb)
                                 (fboundp symb))
                             (eql (symbol-package symb) package))
                    (push symb lst)))
                lst)
               (t
                (error "~S does not designate a package" package-name))))))

(ql:quickload :alexandria)
(loop for symbol in (remove-duplicates (all-function-symbols :alexandria nil))
      do (format t "[\"~(~A~)\"] = true,~%" symbol))
