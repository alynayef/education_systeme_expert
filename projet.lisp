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
(defun moyenneGenerale (note1 note2 note3) (/ (+  note1 note2 note3) 3))

;--------------------------
;saisie des notes pour chaque matiere et instantiation des matieres
;--------------------------
(write "saisir la moyenne en Français: ")
(setq Francais (make-matiere :nom 'Francais
                                 :moyenne 12.0  ) )
(write "saisir la moyenne en Philosophie: ")
(setq Philosophie (make-matiere :nom 'Philosophie
                                :moyenne 15.0   ) )
(write "saisir la moyenne en Anglais: ")
(setq Anglais (make-matiere :nom 'Anglais
                            :moyenne 10.0  ) )
(write "saisir la moyenne en Economie: ")
(setq Economie (make-matiere :nom 'Economie
                                :moyenne 8.0   ) )
(write "saisir la moyenne en Histoire: ")
(setq Histoire (make-matiere :nom 'Histoire
                                :moyenne 7.0   ) )
(write "saisir la moyenne en Mathematiques: ")
(setq Mathematiques (make-matiere :nom 'Mathematiques
                                :moyenne 9.0   ) )
(write "saisir la moyenne en Physique: ")
(setq Physique (make-matiere :nom 'Physique
                                :moyenne 18.0   ) )
(write "saisir la moyenne en SVT: ")
(setq SVT (make-matiere :nom 'SVT
                                :moyenne 14.0   ) )
;--------------------------
;intanttiation des filiéres
;--------------------------
(setq Litteraire (make-filiere :nomfiliere 'Litteraire :matiere (list Francais Philosophie Anglais) :moyennefiliere -1.0))

(setq FEconomie (make-filiere :nomfiliere 'Economie :matiere (list Economie Histoire Mathematiques) :moyennefiliere -1.0))

(setq Scientifique (make-filiere :nomfiliere 'Scientifique :matiere (list Mathematiques Physique SVT) :moyennefiliere -1.0)) 
;--------------------------
;instantion d'un éléve
;--------------------------
(write "saisir le nom complet de l'eleve: ")
    ( setq eleve1 (make-eleve :nom (read)
    :resultats (list Litteraire FEconomie Scientifique )))
;--------------------------
;REGLES
;---------------------------------

(defstruct regle
    nom
    utilisee
    condition
    action
)

(setq regle1 (make-regle :nom 'regle1
                         :utilisee 'nil
                         :condition '(or (equal (filiere-moyennefiliere Litteraire) -1.0) (equal (filiere-moyennefiliere FEconomie) -1.0) (equal (filiere-moyennefiliere Scientifique) -1.0))
                         :action '(setf (filiere-moyennefiliere Litteraire) (moyenneGenerale (matiere-moyenne Philosophie) (matiere-moyenne Anglais) (matiere-moyenne Francais))
                                         (filiere-moyennefiliere Scientifique) (moyenneGenerale (matiere-moyenne Mathematiques) (matiere-moyenne Physique) (matiere-moyenne SVT))
                                         (filiere-moyennefiliere FEconomie) (moyenneGenerale (matiere-moyenne Mathematiques) (matiere-moyenne Economie) (matiere-moyenne Histoire)))))

(setq regle2 (make-regle :nom 'regle2
                         :utilisee 'nil
                         :condition '(and (< (filiere-moyennefiliere Litteraire) 10) (< (filiere-moyennefiliere Economie) 10) (< (filiere-moyennefiliere Scientifique) 10)
                         :action '(printf "Un redoublement serait bien!"))))

(setq regle3 (make-regle :nom 'regle3
                         :utilisee 'nil
                         :condition '(or (> (filiere-moyennefiliere Litteraire) 9.99) (> (filiere-moyennefiliere Economie) 9.99) (> (filiere-moyennefiliere Scientifique) 9.99))
                         :action '(cond ((> noteL 9.99) (format t "Filiere litteraire conseillee ~d" (/ noteL (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie) (filiere-moyennefiliere Scientifique)))))
                                        ((> noteES 9.99) (format t "Filiere economie et Social conseillee ~d" (/ noteES (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie)  (filiere-moyennefiliere Scientifique)))))
                                        ((> noteS 9.99) (format t "Filiere scientifique conseillee ~d" (/ noteS (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie) (filiere-moyennefiliere Scientifique))))))))

(setq listeregle (list regle1 regle2 regle3))

;METHODES UTILISEES
;---------------------------------

(defun calcul-ponderation-note (moyenne-filiere)
       (cond ((> moyenne-filiere 9.99) moyenne-filiere)
             (t 0)))

(defun calcul-ponderation-total (noteL noteES noteS)
       (+ (calcul-ponderation-note noteL) (calcul-ponderation-note noteES) (calcul-ponderation-note noteS)))
;--------------------------
;Programme
;--------------------------
(write-line "--------------------PROJET--------------------")
(print ( filiere-moyennefiliere Litteraire))
(print eleve1)
(write-line "--------------------REGLES--------------------")
(setq ponderationote (calcul-ponderation-total ( filiere-moyennefiliere Litteraire) ( filiere-moyennefiliere FEconomie) ( filiere-moyennefiliere Scientifique) ))
(print ponderationote)
(write-line "-----------------MODIFICATION-----------------")
(print eleve1)
(setf  ( filiere-moyennefiliere Litteraire) (moyenneGenerale ( matiere-moyenne Francais) ( matiere-moyenne Philosophie) ( matiere-moyenne Anglais) ) )
(setf  ( filiere-moyennefiliere FEconomie) (moyenneGenerale ( matiere-moyenne Economie) ( matiere-moyenne Histoire) ( matiere-moyenne Mathematiques) ) )
(setf  ( filiere-moyennefiliere Scientifique) (moyenneGenerale ( matiere-moyenne Mathematiques) ( matiere-moyenne Physique) ( matiere-moyenne SVT) ) )
(print eleve1)
(write-line "--------------------PROJET--------------------")


 
 
