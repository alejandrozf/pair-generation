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
       (builder-instance4 (jcall opt-filter-method builder-instance3 "size" "256"))
       (opt-arguments-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                      "optArguments" "java.util.Map"))
       (java-util-map-class (jclass "java.util.Map"))
       (map-of-method (jmethod "java.util.Map" "of" "java.lang.Object"
                               "java.lang.Object"))
       (map-instance (jstatic map-of-method java-util-map-class "truncation" 0.4))
       (builder-instance5 (jcall opt-arguments-method builder-instance4 map-instance))
       (opt-engine-method (jmethod "ai.djl.repository.zoo.Criteria$Builder" "optEngine"
                                   "java.lang.String"))
       (builder-instance6 (jcall opt-engine-method builder-instance5 "PyTorch"))

       )


  builder-instance6

  ;; TODO:  "optProgress", "build"

  )
