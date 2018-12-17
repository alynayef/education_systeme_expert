(defstruct Eleve
    nom
    ;----
    francais
    philosophie
    anglais
    histoire
    economie
    mathematique
    physique
    SVT
    ;----
    note-L
    note-S
    note-ES
)


(setf eleve (make-Eleve))

(write-line "Saisir le nom, stp : ")
(setq radius (read))
(print radius)
(write-line "français : ")
(setf (Eleve-francais eleve) (read))
(write-line "philosophie : ")
(setf (Eleve-philosophie eleve) (read))
(write-line "anglais : ")
(setf (Eleve-anglais eleve) (read))
(write-line "histoire : ")
(setf (Eleve-histoire eleve) (read))
(write-line "économie : ")
(setf (Eleve-economie eleve) (read))
(write-line "mathématique : ")
(setf (Eleve-mathematique eleve) (read))
(write-line "physique : ")
(setf (Eleve-physique eleve) (read))
(write-line "SVT : ")
(setf (Eleve-SVT eleve) (read))

;(setf (Eleve-note-L eleve) (/ (+ ((get 'eleve 'francais) (get 'eleve 'philosophie) (get 'eleve 'anglais)) 3)))
;(setf (Eleve-note-S eleve) ())
;(setf (Eleve-note-ES eleve) ())




;(print eleve)
(write (Eleve-nom eleve))