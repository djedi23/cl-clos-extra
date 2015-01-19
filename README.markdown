# Cl-Clos-Extra

## Usage

    (ql:quickload :cl-clos-extra)
    
    (defclass  ()
        (a
         b
         (c :remove t)
         (e :alias b))
      (:metaclass clos-extra:extra-definition-slot-class))

## Dependencies

## Installation

Links cl-clos-extra.asd and cl-clos-extra-test.asd into $HOME/quicklisp/local-projects