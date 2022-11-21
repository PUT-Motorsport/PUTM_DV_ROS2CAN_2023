
(cl:in-package :asdf)

(defsystem "package_rostocan-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "apps" :depends-on ("_package_apps"))
    (:file "_package_apps" :depends-on ("_package"))
  ))