(in-package :cl-threejs-valtan)

(define-react-component <app> ())

(setup '<app> "root" :remote-eval t)

(defun request-animation-frame (fun)
  (#j:window:requestAnimationFrame fun))

(defun main ()
  (initialize-scene)
  (initialize-camera)
  (initialize-renderer))

(defun start-the-engine ()
  (let* ((geometry (ffi:new #j:THREE:BoxGeometry 1 1 1))
         (material (ffi:new #j:THREE:MeshBasicMaterial (ffi:object :color "0x00ff00")))
         (cube (ffi:new #j:THREE:Mesh geometry material)))
    (add *scene* cube)
    (ffi:set (ffi:ref *camera* "position" "z") 5)
    (labels ((animate (&rest body)
               (request-animation-frame #'animate)
               (ffi:set (ffi:ref cube "rotation" x) (+ 0.01 (ffi:ref cube "rotation" x)))
               (ffi:set (ffi:ref cube "rotation" y) (+ 0.01 (ffi:ref cube "rotation" y)))
               (render *renderer* *scene* *camera*)))
      (animate))))
(main)
(start-the-engine)