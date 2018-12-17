;REGLES
;---------------------------------

(defun calcule-moyennes (eleve)
      ((setq eleve.noteL (/ (+ eleve.Philosophie.moyenne eleve.Français.moyenne eleve.Anglais.moyenne) 3))
       (setq eleve.noteES (/ (+ eleve.Mathematiques.moyenne eleve.Economie.moyenne eleve.Histoire.moyenne) 3))
       (setq eleve.noteS (/ (+ eleve.Mathematiques.moyenne eleve.Physique.moyenne eleve.SVT.moyenne) 3))))

(defun R1 (eleve)
       (calcule-moyennes (eleve))

(defun R2-R3 (eleve)
       (cond ((and (< eleve.noteL 10) (< eleve.noteS 10) (< eleve.noteES 10)) (print "Un redoublement serait bien"))
             (t (cond ((> noteL 9.99) (format t "Filière littéraire conseillée à ~d" (/ noteL (calcul-ponderation-total noteL noteES noteS))))
                      ((> noteES 9.99) (format t "Filière economie et Social conseillée à ~d" (/ noteES (calcul-ponderation-total noteL noteES noteS))))
                      ((> noteS 9.99) (format t "Filière scientifique conseillée à ~d" (/ noteS (calcul-ponderation-total noteL noteES noteS))))))))

(defun calcul-ponderation-note (note)
       (cond ((> note 9.99) note)
             (t 0)))

(defun calcul-ponderation-total (noteL noteES noteS)
       (+ (calcul-ponderation-note noteL) (calcul-ponderation-note noteES) (calcul-ponderation-note noteS)))