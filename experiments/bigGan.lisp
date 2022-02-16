;; https://github.com/deepjavalibrary/djl/blob/master/examples/src/main/java/ai/djl/examples/inference/BigGAN.java

(add-to-classpath "/home/alejandrozf/projects/pair-generation/lib/djl-biggan-example-fat.jar")


(defun get-criteria ()
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
         (opt-progress-method (jmethod "ai.djl.repository.zoo.Criteria$Builder" "optProgress"
                                       "ai.djl.util.Progress"))
         (progress-bar-instance (jnew "ai.djl.training.util.ProgressBar"))
         (builder-instance7 (jcall opt-progress-method builder-instance6 progress-bar-instance))
         (model-zoo-instance (jnew "ai.djl.pytorch.zoo.PtModelZoo"))
         (opt-model-zoo-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                        "optModelZoo" "ai.djl.repository.zoo.ModelZoo"))
         (builder-instance8 (jcall opt-model-zoo-method builder-instance7 model-zoo-instance))
         (opt-group-id-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                       "optGroupId" "java.lang.String"))
         (big-gan-translator (jnew "ai.djl.modality.cv.translator.BigGANTranslator" 0.4))
         (builder-instance9 (jcall opt-group-id-method builder-instance8 "ai.djl.pytorch"))
         (opt-translator-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                         "optTranslator" "ai.djl.translate.Translator"))
         (builder-instance10 (jcall opt-translator-method builder-instance9 big-gan-translator))
         (opt-artifact-id-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                          "optArtifactId" "java.lang.String"))
         (builder-instance11 (jcall opt-artifact-id-method builder-instance10 "pytorch-model-zoo"))
         (opt-model-name-method (jmethod "ai.djl.repository.zoo.Criteria$Builder"
                                         "optModelName" "java.lang.String"))
         (builder-instance12 (jcall opt-model-name-method builder-instance11 "biggan-deep"))
         (build-method (jmethod "ai.djl.repository.zoo.Criteria$Builder" "build"))
         (zoo-criteria (jcall build-method builder-instance12))
         (input (jarray-from-list '(100 207 971 970  933)))
         (load-model-method (jmethod "ai.djl.repository.zoo.Criteria" "loadModel"))
         )


    (declare (ignore input load-model-method))

    zoo-criteria

    ;; builder-instance10

    ;; (jcall load-model-method zoo-criteria)

    ;; FIXME: add models to get rid of:
    ;; Java exception 'ai.djl.repository.zoo.ModelNotFoundException: No matching model with specified Input/Output type found.'.
    ))
