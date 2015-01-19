#|
  This file is a part of cl-clos-extra project.
|#

(in-package :cl-user)
(defpackage cl-clos-extra-test-asd
  (:use :cl :asdf))
(in-package :cl-clos-extra-test-asd)

(defsystem cl-clos-extra-test
  :author ""
  :license ""
  :depends-on (:cl-clos-extra
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-clos-extra"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
