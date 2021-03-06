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
                         :condition '(or (equal (filiere-moyennefiliere Litteraire) -1) (equal (filiere-moyennefiliere FEconomie) -1) (equal (filiere-moyennefiliere Scientifique) -1))
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