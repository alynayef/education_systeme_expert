(defstruct eleve
    nom
    matiere
    )
    (setq matieres '(10 12 8 20 5 4 15 10) )
    ( setq eleve1 (make-eleve :nom "nathanael"
     :matiere matieres )
) 
(print eleve1)
