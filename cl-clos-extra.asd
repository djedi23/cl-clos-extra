#|
  This file is a part of cl-clos-extra project.
|#

(in-package :cl-user)
(defpackage cl-clos-extra-asd
  (:use :cl :asdf))
(in-package :cl-clos-extra-asd)

(defsystem cl-clos-extra
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:closer-mop)
  :components ((:module "src"
                :components
                ((:file "package")
		 (:file "util" :depends-on ("package"))
		 (:file "clos-alias" :depends-on ("package" "util"))
		 (:file "clos-remove" :depends-on ("package" "util"))
		 (:file "extra-definition" :depends-on ("clos-alias" "clos-remove"))
		 )))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-clos-extra-test))))
