;;; 

;;; ======================================================================= ;;;
;;; GUI FONTS
;;; ======================================================================= ;;;
(defun set-gui-fonts ()
  (interactive)
  (if window-system
      (progn
	;; Set default fonts to monospace-10
	(set-frame-font "monospace-10")
	;; Fonts speedbar, ediff etc
	(add-to-list 'default-frame-alist '(font . "monospace-10")))))

;;; ======================================================================= ;;;
;;; COLORS
;;; ======================================================================= ;;;
(defun set-color-theme ()
  (interactive)
  (require 'color-theme)
        (eval-after-load "color-theme"
          '(progn
             (color-theme-initialize)
	     (color-theme-jsc-light)
             )))

;;; ======================================================================= ;;;
;;; FRAMESIZE
;;; ======================================================================= ;;;
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
      (progn
        ;; use 120 char wide window for largeish displays
        ;; and smaller 80 column windows for smaller displays
        ;; pick whatever numbers make sense for you
        (if (> (x-display-pixel-width) 1280)
            (add-to-list 'default-frame-alist (cons 'width 120))
          (add-to-list 'default-frame-alist (cons 'width 80)))
        ;; for the height, subtract a couple hundred pixels
        ;; from the screen height (for panels, menubars and
        ;; whatnot), then divide by the height of a char to
        ;; get the height we want
        (add-to-list 'default-frame-alist
                     (cons 'height (/ (- (x-display-pixel-height) 350)
                                      (frame-char-height)))))))

(set-gui-fonts)
(set-color-theme)
(set-frame-size-according-to-resolution)

(provide 'pemacs-apperance)
