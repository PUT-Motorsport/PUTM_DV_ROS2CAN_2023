;; Auto-generated. Do not edit!


(when (boundp 'package_rostocan::apps)
  (if (not (find-package "PACKAGE_ROSTOCAN"))
    (make-package "PACKAGE_ROSTOCAN"))
  (shadow 'apps (find-package "PACKAGE_ROSTOCAN")))
(unless (find-package "PACKAGE_ROSTOCAN::APPS")
  (make-package "PACKAGE_ROSTOCAN::APPS"))

(in-package "ROS")
;;//! \htmlinclude apps.msg.html


(defclass package_rostocan::apps
  :super ros::object
  :slots (_pedal_position _counter _position_diff ))

(defmethod package_rostocan::apps
  (:init
   (&key
    ((:pedal_position __pedal_position) 0)
    ((:counter __counter) 0)
    ((:position_diff __position_diff) 0)
    )
   (send-super :init)
   (setq _pedal_position (round __pedal_position))
   (setq _counter (round __counter))
   (setq _position_diff (round __position_diff))
   self)
  (:pedal_position
   (&optional __pedal_position)
   (if __pedal_position (setq _pedal_position __pedal_position)) _pedal_position)
  (:counter
   (&optional __counter)
   (if __counter (setq _counter __counter)) _counter)
  (:position_diff
   (&optional __position_diff)
   (if __position_diff (setq _position_diff __position_diff)) _position_diff)
  (:serialization-length
   ()
   (+
    ;; uint16 _pedal_position
    2
    ;; uint8 _counter
    1
    ;; int8 _position_diff
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _pedal_position
       (write-word _pedal_position s)
     ;; uint8 _counter
       (write-byte _counter s)
     ;; int8 _position_diff
       (write-byte _position_diff s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _pedal_position
     (setq _pedal_position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _counter
     (setq _counter (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _position_diff
     (setq _position_diff (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _position_diff 127) (setq _position_diff (- _position_diff 256)))
   ;;
   self)
  )

(setf (get package_rostocan::apps :md5sum-) "7d6478f1da74e05ce29749e8a7519384")
(setf (get package_rostocan::apps :datatype-) "package_rostocan/apps")
(setf (get package_rostocan::apps :definition-)
      "uint16 pedal_position
uint8 counter
int8 position_diff

")



(provide :package_rostocan/apps "7d6478f1da74e05ce29749e8a7519384")


