;REGLES
;---------------------------------

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
                         :action '(cond ((> noteL 9.99) (format t "Filière littéraire conseillée à ~d" (/ noteL (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie) (filiere-moyennefiliere Scientifique)))))
                                        ((> noteES 9.99) (format t "Filière economie et Social conseillée à ~d" (/ noteES (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie)  (filiere-moyennefiliere Scientifique)))))
                                        ((> noteS 9.99) (format t "Filière scientifique conseillée à ~d" (/ noteS (calcul-ponderation-total (filiere-moyennefiliere Litteraire) (filiere-moyennefiliere Economie) (filiere-moyennefiliere Scientifique))))))))


;METHODES UTILISEES
;---------------------------------

(defun calcule-moyennes ()
      ((setf (filiere-moyennefiliere Litteraire) moyenneLitteraire)
       (setf (filiere-moyennefiliere Scientifique) moyenneScientifique)
       (setf (filiere-moyennefiliere Economie) moyenneEconomie)))

(defun calcul-ponderation-note (note)
       (cond ((> note 9.99) note)
             (t 0)))

(defun calcul-ponderation-total (noteL noteES noteS)
       (+ (calcul-ponderation-note noteL) (calcul-ponderation-note noteES) (calcul-ponderation-note noteS)))