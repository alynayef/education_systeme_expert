(defun print-m (m)
    (format t " ~A : ~d ~%" (matiere-nom m) (matiere-moyenne m)))

(defun print-f (f)
    (format t "~%")
    (format t " >>> ~A <<<~%" (filiere-nomfiliere f))
    (loop for m in (filiere-matiere f) do (print-m m))
    (format t " -> moyennefiliere : ~,2f~%"  (filiere-moyennefiliere f)))

(defun print-list-f (l)
    (loop for x in l do (print-f x)))

(defun print-eleve (e)
    (format t "~%------------------------------------~%")
    (format t " Nom de l'eleve : ~A.~%" (eleve-nom e))
    (print-list-f (eleve-resultats e))
    (format t "------------------------------------~%"))

(print-eleve eleve1)