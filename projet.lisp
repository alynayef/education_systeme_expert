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
    (write "saisir la moyenne en Français: ")
    (setq Francais (make-matiere :nom 'Francais
                                 :moyenne (read)  ) )
    (write "saisir la moyenne en Philosophie: ")
    (setq Philosophie (make-matiere :nom 'Philosophie
                                 :moyenne (read)   ) )
    (write "saisir la moyenne en Anglais: ")
    (setq Anglais (make-matiere :nom 'Anglais
                                 :moyenne (read)  ) )
    (write "saisir la moyenne en Economie: ")
    (setq Economie (make-matiere :nom 'Economie
                                 :moyenne (read)   ) )
    (write "saisir la moyenne en Histoire: ")
    (setq Histoire (make-matiere :nom 'Histoire
                                 :moyenne (read)   ) )
    (write "saisir la moyenne en Mathematiques: ")
    (setq Mathematiques (make-matiere :nom 'Mathematiques
                                 :moyenne (read)   ) )
    (write "saisir la moyenne en Physique: ")
    (setq Physique (make-matiere :nom 'Physique
                                 :moyenne (read)   ) )
    (write "saisir la moyenne en SVT: ")
    (setq SVT (make-matiere :nom 'SVT
                                 :moyenne (read)   ) ) 
    (defun moyenneGeneral (note1 note2 note3) (/ (+ (+ note1 note2) note3) 3))

    (setq sommeLitteraire  (+ ( matiere-moyenne Francais) ( matiere-moyenne Philosophie) ( matiere-moyenne Anglais)))
    (setq moyenneLitteraire (/ sommeLitteraire 3))
    (setq  moyenneLitteraire (moyenneGeneral ( matiere-moyenne Francais) ( matiere-moyenne Philosophie) ( matiere-moyenne Anglais)))
    (setq Litteraire (make-filiere :nomfiliere 'Litteraire :matiere (list Francais Philosophie Anglais) :moyennefiliere moyenneLitteraire))

    (setq sommeEconomie (+ ( matiere-moyenne Economie) ( matiere-moyenne Histoire) ( matiere-moyenne Mathematiques)))
    (setq moyenneEconomie (/ sommeEconomie 3))
    (setq Economie (make-filiere :nomfiliere 'Economie :matiere (list Economie Histoire Mathematiques) :moyennefiliere -1))

    (setq sommeScientifique (+ ( matiere-moyenne Mathematiques) ( matiere-moyenne Physique) ( matiere-moyenne SVT)))
    (setq moyenneScientifique (/ sommeScientifique 3))
    (setq Scientifique (make-filiere :nomfiliere 'Scientifique :matiere (list Mathematiques Physique SVT) :moyennefiliere -1))

    ( setq eleve1 (make-eleve :nom 'nathanael
     :resultats (list Litteraire Economie Scientifique )))
(write "--------------------PROJET--------------------")
(print ( filiere-moyennefiliere Litteraire))
(print eleve1)
(print moyenneLitteraire)
(write "--------------------PROJET--------------------")


 
 
