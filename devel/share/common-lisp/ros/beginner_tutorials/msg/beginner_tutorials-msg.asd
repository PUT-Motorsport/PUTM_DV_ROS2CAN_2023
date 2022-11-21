
(cl:in-package :asdf)

(defsystem "beginner_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "apps" :depends-on ("_package_apps"))
    (:file "_package_apps" :depends-on ("_package"))
  ))