; Structure du programme
;-------------------------------
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

(defstruct regle
    nom
    utilisee
    condition
    action
)

;--------------------------
; Saisie des notes pour chaque matiere et instantiation des matieres
;--------------------------

(format t "saisir la moyenne en Français: ~%")
(setq Francais (make-matiere :nom 'Francais
                                 :moyenne (read)  ) )
(format t "saisir la moyenne en Philosophie: ~%")
(setq Philosophie (make-matiere :nom 'Philosophie
                                :moyenne (read)   ) )
(format t "saisir la moyenne en Anglais: ~%")
(setq Anglais (make-matiere :nom 'Anglais
                            :moyenne (read)  ) )
(format t "saisir la moyenne en Economie: ~%")
(setq Economie (make-matiere :nom 'Economie
                                :moyenne (read)   ) )
(format t "saisir la moyenne en Histoire: ~%")
(setq Histoire (make-matiere :nom 'Histoire
                                :moyenne (read)  ) )
(format t "saisir la moyenne en Mathematiques: ~%")
(setq Mathematiques (make-matiere :nom 'Mathematiques
                                :moyenne (read)   ) )
(format t "saisir la moyenne en Physique: ~%")
(setq Physique (make-matiere :nom 'Physique
                                :moyenne (read)   ) )
(format t "saisir la moyenne en SVT: ~%")
(setq SVT (make-matiere :nom 'SVT
                                :moyenne (read)   ) )
;--------------------------
; Intanttiation des fileres
;--------------------------

(setq Litteraire (make-filiere :nomfiliere 'Litteraire :matiere (list Francais Philosophie Anglais) :moyennefiliere -1.0))

(setq FEconomie (make-filiere :nomfiliere 'Economie :matiere (list Economie Histoire Mathematiques) :moyennefiliere -1.0))

(setq Scientifique (make-filiere :nomfiliere 'Scientifique :matiere (list Mathematiques Physique SVT) :moyennefiliere -1.0))
 
;--------------------------
; Instanciation d'un eleve
;--------------------------

(format t "saisir le nom complet de l'eleve: ~%")
    ( setq eleve1 (make-eleve :nom (read)
    :resultats (list Litteraire FEconomie Scientifique )))

;--------------------------------
; Instanciation des regles
;---------------------------------
(format t "instanciation des régles ~%")
(setq regle1 (make-regle :nom 'regle1
                         :utilisee 'nil
                         :condition '(or (equal ( filiere-moyennefiliere Litteraire) -1.0) (equal ( filiere-moyennefiliere FEconomie) -1.0) (equal (filiere-moyennefiliere Scientifique) -1.0))
                         :action '(setf ( filiere-moyennefiliere Litteraire) ( moyenneGenerale (matiere-moyenne Philosophie) (matiere-moyenne Anglais) (matiere-moyenne Francais))
                                        ( filiere-moyennefiliere Scientifique) ( moyenneGenerale (matiere-moyenne Mathematiques) (matiere-moyenne Physique) (matiere-moyenne SVT))
                                        ( filiere-moyennefiliere FEconomie) (moyenneGenerale ( matiere-moyenne Mathematiques) (matiere-moyenne Economie) (matiere-moyenne Histoire))
                                        ( regle-utilisee regle1) t)))

(setq regle2 (make-regle :nom 'regle2
                         :utilisee 'nil
                         :condition '(and (< ( filiere-moyennefiliere Litteraire) 10) (< ( filiere-moyennefiliere FEconomie) 10) (< (filiere-moyennefiliere Scientifique) 10))
                         :action '(and (setf ( regle-utilisee regle2) t) (format t "Un redoublement serait bien!~%"))))

(setq regle3 (make-regle :nom 'regle3
                         :utilisee 'nil
                         :condition '(or (> ( filiere-moyennefiliere Litteraire) 9.99) (> ( filiere-moyennefiliere FEconomie) 9.99) (> (filiere-moyennefiliere Scientifique) 9.99))
                         :action '(and (setf ( regle-utilisee regle3) t) (mapcar 'verifie-moyenne-filiere (list Litteraire FEconomie Scientifique)))))

(setq listeregle (list regle1 regle2 regle3))

;--------------------------------
; METHODES UTILISEES
;---------------------------------

(defun moyenneGenerale (note1 note2 note3) 
       (/ (+  note1 note2 note3) 3))

(defun verifie-moyenne-filiere (filiere-evaluee) 
       (cond ((> ( filiere-moyennefiliere filiere-evaluee) 9.99) (format t "Filiere ~A conseillee a ~d~%" (filiere-nomfiliere filiere-evaluee) (/ (filiere-moyennefiliere filiere-evaluee) (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere FEconomie)  (filiere-moyennefiliere Scientifique)))))))

(defun calcul-ponderation-note (moyenne-filiere)
       (cond ((> moyenne-filiere 9.99) moyenne-filiere)
             (t 0)))

(defun calcul-ponderation-total (noteL noteES noteS)
       (+ (calcul-ponderation-note noteL) (calcul-ponderation-note noteES) (calcul-ponderation-note noteS)))

(defun affiche-etat-regles ()
       (format t "Etat des regles (nil = pas utilisee, T = utilisee) :~%")
       (format t "Etat regle 1 : ~A~%" ( regle-utilisee regle1))
       (format t "Etat regle 2 : ~A~%" ( regle-utilisee regle2))
       (format t "Etat regle 3 : ~A~%" ( regle-utilisee regle3))
)
;--------------------------
;Moteur d'inf�rence
;--------------------------
(format t "instanciation du moteur d'inférence ~%")
(defun moteur ()
       (cond ((not (and ( regle-utilisee regle1) (or ( regle-utilisee regle2) ( regle-utilisee regle3))))
              (cond ((not ( regle-utilisee regle1)) (and (cond ((eval ( regle-condition regle1)) (eval ( regle-action regle1)))) (moteur)))
                    (t (cond ((eval ( regle-condition regle2)) (and (eval ( regle-action regle2))) (moteur))
                             (t (and (eval ( regle-action regle3)) (moteur)))))))
             (t (format t "Syst�me expert termine~%"))))

;--------------------------
; Programme
;--------------------------

(format t  "--------------------PROJET-------------------- ~%")
(print ( filiere-moyennefiliere Litteraire))
(print eleve1)
(format t  "--------------------REGLES-------------------- ~%")
(setq ponderationote (calcul-ponderation-total ( filiere-moyennefiliere Litteraire) ( filiere-moyennefiliere FEconomie) ( filiere-moyennefiliere Scientifique) ))
(print ponderationote)
(print (eval ( regle-condition regle1)) (eval ( regle-action regle1)))
(format t "-----------------MODIFICATION----------------- ~%")
(print eleve1)
(setf  ( filiere-moyennefiliere Litteraire) (moyenneGenerale ( matiere-moyenne Francais) ( matiere-moyenne Philosophie) ( matiere-moyenne Anglais) ) )
(setf  ( filiere-moyennefiliere FEconomie) (moyenneGenerale ( matiere-moyenne Economie) ( matiere-moyenne Histoire) ( matiere-moyenne Mathematiques) ) )
(setf  ( filiere-moyennefiliere Scientifique) (moyenneGenerale ( matiere-moyenne Mathematiques) ( matiere-moyenne Physique) ( matiere-moyenne SVT) ) )
(print eleve1)
(format t  "--------------------PROJET-------------------- ~%")


 
 
