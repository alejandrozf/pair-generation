;;;; pair-generation.lisp

(in-package #:pair-generation)


(let ((apache-common-math-jar (asdf:system-relative-pathname "pair-generation" "lib/commons-math3-3.6.1.jar")))
  (java:add-to-classpath apache-common-math-jar))

(defun generate (set-a set-b
                 gen-a-function gen-b-function
                 distance-function-a
                 distance-function-b
                 correlate-function)
  (let* ((ai (funcall gen-a-function set-a))
         (bi (funcall gen-b-function set-b))
         (distances-ai (funcall distance-function-a ai set-a))
         (distances-bi (funcall distance-function-b bi set-b)))

    (when (funcall correlate-function distances-ai distances-bi)
      (list ai bi))))


(defun pearson-correlation (distances1 distances2)
  (let* ((pearson-class (java:jnew "org.apache.commons.math3.stat.correlation.PearsonsCorrelation"))
         (correlate-method (java:jmethod "org.apache.commons.math3.stat.correlation.PearsonsCorrelation"
                                         "correlation" "double []" "double []")))
    (java:jcall correlate-method pearson-class
                (java:jnew-array-from-list "double" distances1)
                (java:jnew-array-from-list "double" distances2))))
