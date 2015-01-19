(in-package :cl-user)
(defpackage cl-clos-extra-test
  (:use :cl
        :cl-clos-extra
        :prove))
(in-package :cl-clos-extra-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-clos-extra)' in your Lisp.

(plan nil)

(defclass a
    ()
  (a b c))

(defclass b (a)
  (c d (e :alias b) f)
  (:metaclass clos-extra:aliasable-slot-class))

(let ((b (make-instance 'b)))
  (setf (slot-value b 'b) 5)
  (is (slot-value b 'b) 5 "init aliased slot")
  (is (slot-value b 'e) 5 "read alias slot")

  (ok (setf (slot-value b 'e) 10) "set alias slot")
  (is (slot-value b 'b) 10 "read aliased slot")
  (is (slot-value b 'e) 10 "read alias slot")
  )

(finalize)
