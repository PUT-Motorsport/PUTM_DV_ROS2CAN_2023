; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude apps.msg.html

(cl:defclass <apps> (roslisp-msg-protocol:ros-message)
  ((pedal_position
    :reader pedal_position
    :initarg :pedal_position
    :type cl:fixnum
    :initform 0)
   (counter
    :reader counter
    :initarg :counter
    :type cl:fixnum
    :initform 0)
   (position_diff
    :reader position_diff
    :initarg :position_diff
    :type cl:fixnum
    :initform 0))
)

(cl:defclass apps (<apps>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <apps>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'apps)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<apps> is deprecated: use beginner_tutorials-msg:apps instead.")))

(cl:ensure-generic-function 'pedal_position-val :lambda-list '(m))
(cl:defmethod pedal_position-val ((m <apps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:pedal_position-val is deprecated.  Use beginner_tutorials-msg:pedal_position instead.")
  (pedal_position m))

(cl:ensure-generic-function 'counter-val :lambda-list '(m))
(cl:defmethod counter-val ((m <apps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:counter-val is deprecated.  Use beginner_tutorials-msg:counter instead.")
  (counter m))

(cl:ensure-generic-function 'position_diff-val :lambda-list '(m))
(cl:defmethod position_diff-val ((m <apps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:position_diff-val is deprecated.  Use beginner_tutorials-msg:position_diff instead.")
  (position_diff m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <apps>) ostream)
  "Serializes a message object of type '<apps>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pedal_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pedal_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'counter)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'position_diff)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <apps>) istream)
  "Deserializes a message object of type '<apps>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pedal_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pedal_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'counter)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position_diff) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<apps>)))
  "Returns string type for a message object of type '<apps>"
  "beginner_tutorials/apps")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'apps)))
  "Returns string type for a message object of type 'apps"
  "beginner_tutorials/apps")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<apps>)))
  "Returns md5sum for a message object of type '<apps>"
  "7d6478f1da74e05ce29749e8a7519384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'apps)))
  "Returns md5sum for a message object of type 'apps"
  "7d6478f1da74e05ce29749e8a7519384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<apps>)))
  "Returns full string definition for message of type '<apps>"
  (cl:format cl:nil "uint16 pedal_position~%uint8 counter~%int8 position_diff~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'apps)))
  "Returns full string definition for message of type 'apps"
  (cl:format cl:nil "uint16 pedal_position~%uint8 counter~%int8 position_diff~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <apps>))
  (cl:+ 0
     2
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <apps>))
  "Converts a ROS message object to a list"
  (cl:list 'apps
    (cl:cons ':pedal_position (pedal_position msg))
    (cl:cons ':counter (counter msg))
    (cl:cons ':position_diff (position_diff msg))
))
