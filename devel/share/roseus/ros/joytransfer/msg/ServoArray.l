;; Auto-generated. Do not edit!


(when (boundp 'joytransfer::ServoArray)
  (if (not (find-package "JOYTRANSFER"))
    (make-package "JOYTRANSFER"))
  (shadow 'ServoArray (find-package "JOYTRANSFER")))
(unless (find-package "JOYTRANSFER::SERVOARRAY")
  (make-package "JOYTRANSFER::SERVOARRAY"))

(in-package "ROS")
;;//! \htmlinclude ServoArray.msg.html


(defclass joytransfer::ServoArray
  :super ros::object
  :slots (_servos ))

(defmethod joytransfer::ServoArray
  (:init
   (&key
    ((:servos __servos) (let (r) (dotimes (i 0) (push (instance joytransfer::Servo :init) r)) r))
    )
   (send-super :init)
   (setq _servos __servos)
   self)
  (:servos
   (&rest __servos)
   (if (keywordp (car __servos))
       (send* _servos __servos)
     (progn
       (if __servos (setq _servos (car __servos)))
       _servos)))
  (:serialization-length
   ()
   (+
    ;; joytransfer/Servo[] _servos
    (apply #'+ (send-all _servos :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; joytransfer/Servo[] _servos
     (write-long (length _servos) s)
     (dolist (elem _servos)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; joytransfer/Servo[] _servos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servos (let (r) (dotimes (i n) (push (instance joytransfer::Servo :init) r)) r))
     (dolist (elem- _servos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get joytransfer::ServoArray :md5sum-) "7dcfd407a2095ba27997610e5008ca84")
(setf (get joytransfer::ServoArray :datatype-) "joytransfer/ServoArray")
(setf (get joytransfer::ServoArray :definition-)
      "# the ServoArray message is commonly used message in this package to
# handle multiple assignments of values to servos. the purpose of
# the value is dependent on the topic or service being called

Servo[] servos

================================================================================
MSG: joytransfer/Servo
# the Servo message is commonly used message in this package to
# assign a value to a specific servo. the purpose of the value is
# dependent on the topic or service being called

int16 servo
float32 value

")



(provide :joytransfer/ServoArray "7dcfd407a2095ba27997610e5008ca84")


