; structure du programme
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

    ;--------------------------
    ;Methode utilisées
    ;--------------------------
    (defun moyenneGeneral (note1 note2 note3) (/ (+  note1 note2 note3) 3))

    ;--------------------------
    ;saisie des notes pour chaque matiere et instantiation des matieres
    ;--------------------------
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
    ;--------------------------
    ;intanttiation des filiéres
    ;--------------------------
    (setq Litteraire (make-filiere :nomfiliere 'Litteraire :matiere (list Francais Philosophie Anglais) :moyennefiliere -1))

    (setq FEconomie (make-filiere :nomfiliere 'Economie :matiere (list Economie Histoire Mathematiques) :moyennefiliere -1))

    (setq Scientifique (make-filiere :nomfiliere 'Scientifique :matiere (list Mathematiques Physique SVT) :moyennefiliere -1)) 
    ;--------------------------
    ;instantion d'un éléve
    ;--------------------------
    (write "saisir le nom complet de l'eleve: ")
     ( setq eleve1 (make-eleve :nom (read)
     :resultats (list Litteraire FEconomie Scientifique )))
(write "--------------------PROJET--------------------")
(print ( filiere-moyennefiliere Litteraire))
(print eleve1)
(write "-----------------MODIFICATION-----------------")
(setf  ( filiere-moyennefiliere Litteraire) (moyenneGeneral ( matiere-moyenne Francais) ( matiere-moyenne Philosophie) ( matiere-moyenne Anglais) ) )
(setf  ( filiere-moyennefiliere FEconomie) (moyenneGeneral ( matiere-moyenne Economie) ( matiere-moyenne Histoire) ( matiere-moyenne Mathematiques) ) )
(setf  ( filiere-moyennefiliere Scientifique) (moyenneGeneral ( matiere-moyenne Mathematiques) ( matiere-moyenne Physique) ( matiere-moyenne SVT) ) )
(print eleve1)
(write "--------------------PROJET--------------------")


 
 
