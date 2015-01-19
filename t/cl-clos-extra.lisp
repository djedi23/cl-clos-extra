(in-package :cl-user)
(defpackage cl-clos-extra-test
  (:use :cl
        :cl-clos-extra
        :prove))
(in-package :cl-clos-extra-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-clos-extra)' in your Lisp.

(plan 3)

(defclass a
    ()
  (a b c))

(defclass b (a)
  (c d (e :alias b) f)
  (:metaclass clos-extra:aliasable-slot-class))

(subtest "Slot alias"
  (let ((b (make-instance 'b)))
    (setf (slot-value b 'b) 5)
    (is (slot-value b 'b) 5 "init aliased slot")
    (is (slot-value b 'e) 5 "read alias slot")

    (ok (setf (slot-value b 'e) 10) "set alias slot")
    (is (slot-value b 'b) 10 "read aliased slot")
    (is (slot-value b 'e) 10 "read alias slot")
    ))

(defclass c (a)
  ((c :remove t) d e f)
  (:metaclass clos-extra:removable-slot-class))

(subtest "Removable slot"
  (let ((b (make-instance 'c)))
    (is-error (slot-value b 'c) 'simple-error "read removed slot")
    (is-error (setf (slot-value b 'c) 10) 'simple-error "set removed slot")
    ))



(defclass d (a)
  ((c :remove t) d (e :alias b) f)
  (:metaclass clos-extra:extra-definition-slot-class))

(subtest "Slot alias and remove"
  (let ((b (make-instance 'd)))
    (setf (slot-value b 'b) 5)
    (is (slot-value b 'b) 5 "init aliased slot")
    (is (slot-value b 'e) 5 "read alias slot")

    (ok (setf (slot-value b 'e) 10) "set alias slot")
    (is (slot-value b 'b) 10 "read aliased slot")
    (is (slot-value b 'e) 10 "read alias slot")

    (is-error (slot-value b 'c) 'simple-error "read removed slot")
    (is-error (setf (slot-value b 'c) 10) 'simple-error "set removed slot")
    ))


(finalize)
