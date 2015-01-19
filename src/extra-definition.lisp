(in-package :cl-clos-extra)

(defclass extra-definition-slot-class (aliasable-slot-class removable-slot-class)  ())
(defmethod sb-mop:validate-superclass ((class extra-definition-slot-class) (superclass standard-class)) t)
(defclass extra-definition-slot-definition (aliasable-slot-definition removable-slot-definition) ())
(defclass extra-definition-effective-slot-definition (aliasable-effective-slot-definition removable-effective-slot-definition)  ())
(defmethod sb-mop:direct-slot-definition-class ((class extra-definition-slot-class) &rest initargs)
  (declare (ignore initargs))
  (find-class 'extra-definition-slot-definition))
(defmethod sb-mop:effective-slot-definition-class ((class extra-definition-slot-class) &rest initargs)
  (declare (ignore initargs))
  (find-class 'extra-definition-effective-slot-definition))