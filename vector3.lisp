(in-package :cl-threejs-valtan)

(defun make-vector3 (&optional (x 0) (y 0) (z 0))
  (ffi:new #j:THREE:Vector3 x y z))

;; (log console (make-vector3))