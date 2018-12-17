;REGLES
;---------------------------------
(load ())
(defstruct regle
    nom
    condition
    action
)

(setq regle1 (make-regle :nom 'regle1
                         :condition '(or (equal (filiere-moyennefiliere Litteraire) nil) (equal (filiere-moyennefiliere Economie) nil) (equal (filiere-moyennefiliere Scientifique) nil))
                         :action '(calcul-moyennes)))

(setq regle2 (make-regle :nom 'regle2
                         :condition '(and (< (filiere-moyennefiliere Litteraire) 10) (< (filiere-moyennefiliere Economie) 10) (< filiere-moyennefiliere Scientifique) 10)
                         :action '(printf "Un redoublement serait bien!")))

(setq regle3 (make-regle :nom 'regle3
                         :condition '(or (> (filiere-moyennefiliere Litteraire) 9.99) (> (filiere-moyennefiliere Economie) 9.99) (> (filiere-moyennefiliere Scientifique) 9.99))
                         :action '(cond ((> noteL 9.99) (format t "Fili�re litt�raire conseill�e � ~d" (/ noteL (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie) (filiere-moyennefiliere Scientifique)))))
                                        ((> noteES 9.99) (format t "Fili�re economie et Social conseill�e � ~d" (/ noteES (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie)  (filiere-moyennefiliere Scientifique)))))
                                        ((> noteS 9.99) (format t "Fili�re scientifique conseill�e � ~d" (/ noteS (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie) (filiere-moyennefiliere Scientifique))))))))

(setq listeregle (list regle1 regle2 regle3))
;METHODES UTILISEES
;---------------------------------

(defun calcule-moyennes ()
      ((setf (filiere-moyennefiliere Litteraire) (moyenneGenerale (matiere-moyenne Philosophie) (matiere-moyenne Anglais) (matiere-moyenne Francais)))
       (setf (filiere-moyennefiliere Scientifique) (moyenneGenerale (matiere-moyenne Mathematiques) (matiere-moyenne Physique) (matiere-moyenne SVT)))
       (setf (filiere-moyennefiliere Economie) (moyenneGenerale (matiere-moyenne Mathematiques) (matiere-moyenne Economie) (matiere-moyenne Histoire))))))

(defun calcul-ponderation-note (note)
       (cond ((> note 9.99) note)
             (t 0)))

(defun calcul-ponderation-total (noteL noteES noteS)
       (+ (calcul-ponderation-note noteL) (calcul-ponderation-note noteES) (calcul-ponderation-note noteS)))