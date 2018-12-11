(defstruct matiere
    nom
    moyenne
    )

(defstruct filiere
    nom
    matieres
    )

(defstruct eleve
    nom
    matieres
    )
    (setq Francais (make-matiere :nom "Francais"
                                 :moyenne 10   ) )
    (setq Philosophie (make-matiere :nom "Philosophie"
                                 :moyenne 12   ) )
    (setq Anglais (make-matiere :nom "Anglais"
                                 :moyenne 8   ) )
    (setq Economie (make-matiere :nom "Economie"
                                 :moyenne 20   ) )
    (setq Histoire (make-matiere :nom "Histoire"
                                 :moyenne 5   ) )
    (setq Mathematiques (make-matiere :nom "Mathematiques"
                                 :moyenne 4   ) )
    (setq Physique (make-matiere :nom "Physique"
                                 :moyenne 15   ) )
    (setq SVT (make-matiere :nom "SVT"
                                 :moyenne 10   ) ) 
    (setq Litteraire '(Francais Philosophie Anglais))
    (setq Economie '(Economie Histoire Mathematiques))
    (setq Scientifique '(Mathematiques Physique SVT))
    (setq notes '(Francais Philosophie Anglais Economie Histoire Mathematiques Physique SVT))
    ( setq eleve1 (make-eleve :nom "nathanael"
     :matieres notes )
) 

(print eleve1)
