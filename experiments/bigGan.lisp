;; https://github.com/deepjavalibrary/djl/blob/master/examples/src/main/java/ai/djl/examples/inference/BigGAN.java

(add-to-classpath "/home/alejandrozf/projects/pair-generation/lib/gson-2.8.9.jar")
(add-to-classpath "/home/alejandrozf/projects/pair-generation/lib/api-0.15.0-SNAPSHOT.jar")

(let* ((criteria-builder-method (jmethod "ai.djl.repository.zoo.Criteria" "builder"))
       (builder-instance1 (jcall criteria-builder-method "ai.djl.repository.zoo.Criteria"))
       (method-of (jmethod "ai.djl.Application" "of" "java.lang.String"))
       (application-class (jclass "ai.djl.Application"))
       (application-instance (jcall method-of application-class "cv/image_generation"))
       (opt-application-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                        "optApplication" "ai.djl.Application"))
       (builder-instance2 (jcall opt-application-method builder-instance1
                                 application-instance))
       (set-types-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                  "setTypes" "java.lang.Class" "java.lang.Class"))
       (int-array-class (jclass "int[]"))
       (image-array-class (jclass "[Lai.djl.modality.cv.Image;"))
       (builder-instance3 (jcall set-types-method builder-instance2
                                 int-array-class image-array-class))
       (opt-filter-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                   "optFilter" "java.lang.String" "java.lang.String"))
       (builder-instance4 (jcall opt-filter-method builder-instance3 "size" "256")))

  builder-instance4

  ;; TODO: "optArgument", "optEngine", "optProgress", "build"

  )
