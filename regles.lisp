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
             (t (cond ((> eleve.noteL 10) )))