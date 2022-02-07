# pair-generation
### _Alejandro Zamora Fonseca <ale2014.zamora@gmail.com>_

Correlated pair generation in ABCL Common Lisp (Work in progress)


Quickstart

Clone this project to your Quicklisp's local-projects folder

```
CL-USER> (ql:quickload "pair-generation")
To load "pair-generation":
  Load 1 ASDF system:
    pair-generation
; Loading "pair-generation"

("pair-generation")
CL-USER> (let ((gen-list (lambda () (loop for i from 1 below 25 collect (random i))))
               (gen-fun (lambda (c) (random 100)))
               (distances-fun (lambda (c d)
                                (mapcar (lambda (h) (- c h)) d)))
               (correlation-fun (lambda (c d)
                                  (let ((correlation (pair-generation:pearson-correlation c d)))
                                    (> (abs correlation) 0.7)))))
           (loop :with x = nil
                 :until x
                 :do (setf x
                           (pair-generation:generate
                            (funcall gen-list)
                            (funcall gen-list)
                            gen-fun
                            gen-fun
                            distances-fun
                            distances-fun
                            correlation-fun))
                 :finally (return x)))
(92 0)
CL-USER>
```


## License

MIT
