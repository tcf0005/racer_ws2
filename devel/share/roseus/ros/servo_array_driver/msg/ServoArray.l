;; Auto-generated. Do not edit!


(when (boundp 'servo_array_driver::ServoArray)
  (if (not (find-package "SERVO_ARRAY_DRIVER"))
    (make-package "SERVO_ARRAY_DRIVER"))
  (shadow 'ServoArray (find-package "SERVO_ARRAY_DRIVER")))
(unless (find-package "SERVO_ARRAY_DRIVER::SERVOARRAY")
  (make-package "SERVO_ARRAY_DRIVER::SERVOARRAY"))

(in-package "ROS")
;;//! \htmlinclude ServoArray.msg.html


(defclass servo_array_driver::ServoArray
  :super ros::object
  :slots (_servos ))

(defmethod servo_array_driver::ServoArray
  (:init
   (&key
    ((:servos __servos) (let (r) (dotimes (i 0) (push (instance servo_array_driver::Servo :init) r)) r))
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
    ;; servo_array_driver/Servo[] _servos
    (apply #'+ (send-all _servos :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; servo_array_driver/Servo[] _servos
     (write-long (length _servos) s)
     (dolist (elem _servos)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; servo_array_driver/Servo[] _servos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servos (let (r) (dotimes (i n) (push (instance servo_array_driver::Servo :init) r)) r))
     (dolist (elem- _servos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get servo_array_driver::ServoArray :md5sum-) "7dcfd407a2095ba27997610e5008ca84")
(setf (get servo_array_driver::ServoArray :datatype-) "servo_array_driver/ServoArray")
(setf (get servo_array_driver::ServoArray :definition-)
      "# the ServoArray message is commonly used message in this package to
# handle multiple assignments of values to servos. the purpose of
# the value is dependent on the topic or service being called

Servo[] servos

================================================================================
MSG: servo_array_driver/Servo
# the Servo message is commonly used message in this package to
# assign a value to a specific servo. the purpose of the value is
# dependent on the topic or service being called

int16 servo
float32 value

")



(provide :servo_array_driver/ServoArray "7dcfd407a2095ba27997610e5008ca84")


