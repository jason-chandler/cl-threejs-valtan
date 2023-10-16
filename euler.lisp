(in-package :cl-threejs-valtan)

(defun make-euler (&optional x y z order-string)
  (if (and (not x) (not y) (not z) (not order-string))
      (ffi:new #j:THREE:Euler)
      (ffi:new #j:THREE:Euler x y z order-string)))


;; (log console (make-euler 0 0 0 "YXZ"))

