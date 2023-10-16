(in-package :cl-threejs-valtan)

(defun make-perspective-camera (&optional (fov 50) (aspect 1) (near 0.1) (far 2000))
  (ffi:new #j:THREE:PerspectiveCamera fov aspect near far))

(defun initialize-camera ()
  (let* ((window (ffi:ref "window"))
         (inner-width (ffi:ref window "innerWidth"))
         (inner-height (ffi:ref window "innerHeight"))
         (resolution (/ inner-width inner-height)))
    (defparameter *camera* (make-perspective-camera 75 resolution 0.1 1000))))

