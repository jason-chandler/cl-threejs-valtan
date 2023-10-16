(in-package :cl-threejs-valtan)

(defun make-scene ()
  (ffi:new #j:THREE:Scene))

(defun add (scene target)
  ((ffi:ref scene "add") target))

(defun initialize-scene ()
  (defparameter *scene* (make-scene)))

;; (defparameter test-scene (make-instance 'scene))

;; (log console (ffi:ref *three* -scene))

