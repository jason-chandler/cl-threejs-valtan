(in-package :cl-threejs-valtan)

(defclass renderer (js-object) ())

(defun append-to-document-body (target)
  (#j:document:body:appendChild target))

(defun make-renderer ()
  (ffi:new #j:THREE:WebGLRenderer))

(defun get-size (renderer)
  (ffi:ref renderer "size"))

(defun set-size (renderer size-x size-y)
  ((ffi:ref renderer "setSize") size-x size-y))

(defun render (renderer scene camera)
  ((ffi:ref renderer "render") scene camera))

(defun dom-element (obj)
  (ffi:ref obj "domElement"))

(defun initialize-renderer ()
  (let* ((window (ffi:ref "window"))
         (inner-width (ffi:ref window "innerWidth"))
         (inner-height (ffi:ref window "innerHeight")))
    (defparameter *renderer* (make-renderer))
    (set-size *renderer* inner-width inner-height)
    (#j:document:body:appendChild (dom-element *renderer*))))

;; (set-size *renderer* 10 10)

;; (log console (get-size *renderer*))
;; (log console *renderer*)
