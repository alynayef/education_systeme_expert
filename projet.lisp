(defstruct matiere
    nom
    moyenne
    )

(defstruct filiere
    nomfiliere
    matiere
    moyennefiliere
    )

(defstruct eleve
    nom
    resultats
    )
    (setq Francais (make-matiere :nom 'Francais
                                 :moyenne 10.0   ) )
    (setq Philosophie (make-matiere :nom 'Philosophie
                                 :moyenne 12.0   ) )
    (setq Anglais (make-matiere :nom 'Anglais
                                 :moyenne 8.0  ) )
    (setq Economie (make-matiere :nom 'Economie
                                 :moyenne 20.0   ) )
    (setq Histoire (make-matiere :nom 'Histoire
                                 :moyenne 5.0   ) )
    (setq Mathematiques (make-matiere :nom 'Mathematiques
                                 :moyenne 4.0   ) )
    (setq Physique (make-matiere :nom 'Physique
                                 :moyenne 15.0   ) )
    (setq SVT (make-matiere :nom 'SVT
                                 :moyenne 10.0   ) ) 

    (setq sommeMoyenne (+ ( matiere-moyenne Francais) ( matiere-moyenne Philosophie) ( matiere-moyenne Anglais)))
    (setq moyenneGeneral (/ sommeMoyenne 3))
    (setq Litteraire (make-filiere :nomfiliere 'Litteraire :matiere (list Francais Philosophie Anglais) :moyennefiliere moyenneGeneral))

    (setq sommeMoyenne (+ ( matiere-moyenne Economie) ( matiere-moyenne Histoire) ( matiere-moyenne Mathematiques)))
    (setq moyenneGeneral (/ sommeMoyenne 3))
    (setq Economie (make-filiere :nomfiliere 'Economie :matiere (list Economie Histoire Mathematiques) :moyennefiliere moyenneGeneral))

    (setq sommeMoyenne (+ ( matiere-moyenne Mathematiques) ( matiere-moyenne Physique) ( matiere-moyenne SVT)))
    (setq moyenneGeneral (/ sommeMoyenne 3))
    (setq Scientifique (make-filiere :nomfiliere 'Scientifique :matiere (list Mathematiques Physique SVT) :moyennefiliere moyenneGeneral))

    ( setq eleve1 (make-eleve :nom 'nathanael
     :resultats (list Litteraire Economie Scientifique ))
)

(print eleve1)

 
 
