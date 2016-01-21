;;; zone-sl.el --- Zone out with steam locomotives.

;; Filename: zone-sl.el
;; Description: Zone out with steam locomotives
;; Author: KAWABATA, Taichi <kawabata.taichi_at_gmail.com>
;; Created: 2016-01-19
;; Version: 1.160121
;; Package-Requires: ((emacs "24.3"))
;; Keywords: games
;; URL: https://github.com/kawabata/zone-sl

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Zone out with steam locomotives.
;; This code is based on, and inspired by, https://github.com/mtoyoda/sl
;;
;; It can be directly invoked by `M-x zone-sl'.
;;
;; Or, it can be added to zone programs by using
;; `zone-select-add-program' of `zone-select' package.

;;; TODO
;; - make it flyable as sl "-F" option.

;;; Code:

(require 'cl-lib)
(require 'zone)

(defgroup zone-sl nil
  "Zone out with steam locomotives."
  :group 'games)

(defcustom zone-sl-wait 0.1 "." :group 'zone-sl)

;;; define smokes

(defun zone-sl-smoke (k) "K."
  (elt
   '(("                      (@@) (  ) (@)  ( )  @@    ()    @     O     @     O      @"
      "                 (   )                                                          "
      "             (@@@@)                                                             "
      "          (    )                                                                "
      "                                                                                "
      "        (@@@)                                                                   ")
     ("                      (  ) (@@) ( )  (@)  ()    @@    O     @     O     @      O"
      "                 (@@@)                                                          "
      "             (    )                                                             "
      "          (@@@@)                                                                "
      "                                                                                "
      "        (   )                                                                   "))
   (% (/ k 3) 2)))

(defun zone-sl-smoke-2 (k) "K."
  (elt
   '(("                      (@@) (  )                                                 "
      "                 (   )          (@)  ( )                                        "
      "             (@@@@)                       @@    ()                              "
      "          (    )                                      @     O                   "
      "                                                                  @     O       "
      "        (@@@)                                                                  @")
     ("                      (  ) (@@)                                                 "
      "                 (@@@)          ( )  (@)                                        "
      "             (    )                       ()    @@                              "
      "          (@@@@)                                      O     @                   "
      "                                                                  O     @       "
      "        (   )                                                                  O"))
   (% (/ k 3) 2)))

;;; define cars

(defun zone-sl-d51 (k) "K."
  `("      ====        ________                ___________ "
    "  _D _|  |_______/        \\__I_I_____===__|_________| "
    "   |(_)---  |   H\\________/ |   |        =|___ ___|   "
    "   /     |  |   H  |  |     |   |         ||_| |_||   "
    "  |      |  |   H  |__--------------------| [___] |   "
    "  | ________|___H__/__|_____/[][]~\\_______|       |   "
    "  |/ |   |-----------I_____I [][] []  D   |=======|__ "
    ,@
    (elt
     '(("__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__ "
        " |/-=|___|=    ||    ||    ||    |_____/~\\___/        "
        "  \\_/      \\O=====O=====O=====O_/      \\_/            ")
       ("__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__ "
        " |/-=|___|=    ||    ||    ||    |_____/~\\___/        "
        "  \\_/      \\_O=====O=====O=====O/      \\_/            ")
       ("__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__ "
        " |/-=|___|=   O=====O=====O=====O|_____/~\\___/        "
        "  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/            ")
       ("__/ =| o |=-~O=====O=====O=====O\\ ____Y___________|__ "
        " |/-=|___|=    ||    ||    ||    |_____/~\\___/        "
        "  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/            ")
       ("__/ =| o |=-O=====O=====O=====O \\ ____Y___________|__ "
        " |/-=|___|=    ||    ||    ||    |_____/~\\___/        "
        "  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/            ")
       ("__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__ "
        " |/-=|___|=O=====O=====O=====O   |_____/~\\___/        "
        "  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/            "))
     (% k 6))))

(defun zone-sl-c51 (k) "K."
  `("        ___                                            "
    "       _|_|_  _     __       __             ___________"
    "    D__/   \\_(_)___|  |__H__|  |_____I_Ii_()|_________|"
    "     | `---'   |:: `--'  H  `--'         |  |___ ___|  "
    "    +|~~~~~~~~++::~~~~~~~H~~+=====+~~~~~~|~~||_| |_||  "
    "    ||        | ::       H  +=====+      |  |::  ...|  "
    "|    | _______|_::-----------------[][]-----|       |  "
    ,@
    (elt
     '(("| /~~ ||   |-----/~~~~\\  /[I_____I][][] --|||_______|__"
        "------'|oOo|==[]=-     ||      ||      |  ||=======_|__"
        "/~\\____|___|/~\\_|   O=======O=======O  |__|+-/~\\_|     "
        "\\_/         \\_/  \\____/  \\____/  \\____/      \\_/       ")
       ("| /~~ ||   |-----/~~~~\\  /[I_____I][][] --|||_______|__"
        "------'|oOo|===[]=-    ||      ||      |  ||=======_|__"
        "/~\\____|___|/~\\_|    O=======O=======O |__|+-/~\\_|     "
        "\\_/         \\_/  \\____/  \\____/  \\____/      \\_/       ")
       ("| /~~ ||   |-----/~~~~\\  /[I_____I][][] --|||_______|__"
        "------'|oOo|===[]=- O=======O=======O  |  ||=======_|__"
        "/~\\____|___|/~\\_|      ||      ||      |__|+-/~\\_|     "
        "\\_/         \\_/  \\____/  \\____/  \\____/      \\_/       ")
       ("| /~~ ||   |-----/~~~~\\  /[I_____I][][] --|||_______|__"
        "------'|oOo|==[]=- O=======O=======O   |  ||=======_|__"
        "/~\\____|___|/~\\_|      ||      ||      |__|+-/~\\_|     "
        "\\_/         \\_/  \\____/  \\____/  \\____/      \\_/       ")
       ("| /~~ ||   |-----/~~~~\\  /[I_____I][][] --|||_______|__"
        "------'|oOo|=[]=- O=======O=======O    |  ||=======_|__"
        "/~\\____|___|/~\\_|      ||      ||      |__|+-/~\\_|     "
        "\\_/         \\_/  \\____/  \\____/  \\____/      \\_/       ")
       ("| /~~ ||   |-----/~~~~\\  /[I_____I][][] --|||_______|__"
        "------'|oOo|=[]=-      ||      ||      |  ||=======_|__"
        "/~\\____|___|/~\\_|  O=======O=======O   |__|+-/~\\_|     "
        "\\_/         \\_/  \\____/  \\____/  \\____/      \\_/       "))
     (% k 6))))


(defvar zone-sl-tender
  '("    _________________         "
    "   _|                \\_____A  "
    " =|                        |  "
    " -|                        |  "
    "__|________________________|_ "
    "|__________________________|_ "
    "   |_D__D__D_|  |_D__D__D_|   "
    "    \\_/   \\_/    \\_/   \\_/    "))

(defvar zone-sl-passenger
  '("          _____  _____  _____  _____  _____  _____  _____  _____  _____  _____          "
    " _________|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|_________ "
    "  | ____  _____  _____  _____  _____  _____  _____  _____  _____  _____  _____  ____ |  "
    "  | |  |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |  | |  "
    "  | |  |  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |  | |  "
    "  | |  |                                                                        |  | |  "
    "  | |  |                                   @@                                   |  | |  "
    "__|_|__|________________________________________________________________________|__|_|__"
    "\\==|_/_\\____/_\\_|  |______|Z          +--|_________________|------+    |_/_\\____/_\\_|==/"
    "     \\_/    \\_/                                       +++~~              \\_/    \\_/     "
    ))

(defvar zone-sl-last-passenger
  '("          _____  _____  _____  _____  _____  _____  _____  _____  _____  _____           "
    " _________|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|__|___|________   "
    "  | ____  _____  _____  _____  _____  _____  _____  _____  _____  _____  ____   _____|   "
    "  | |  |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |   |  |  |   |   |    "
    "  | |  |  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |___|  |  |   |   |    "
    "  | |  |                                                                 |  |   |___|    "
    "  | |  |                                   @@                            |  |   |_|_|    "
    "__|_|__|_________________________________________________________________|__|___|_|_|___ "
    "\\==|_/_\\____/_\\_|  |______|XX                    +-|_______|------+    |_/_\\____/_\\_|==/ "
    "     \\_/    \\_/                                                          \\_/    \\_/      "
    ))

(defun zone-sl-logo (k) "K."
  `("     ++      +------  "
    "     ||      |+-+ |   "
    "   /---------|| | |   "
    "  + ========  +-+ |   "
    ,@
    (elt
     '((" _|--O========O~\\-+   "
        "//// \\_/      \\_/     ")
       (" _|--/~\\------/~\\-+   "
        "//// O========O_/     ")
       (" _|--/~\\------/~\\-+   "
        "//// \\O========O/     ")
       (" _|--/~\\------/~\\-+   "
        "//// \\_O========O     ")
       (" _|--/~O========O-+   "
        "//// \\_/      \\_/     ")
       (" _|--/O========O\\-+   "
        "//// \\_/      \\_/     "))
     (% k 6))))

(defvar zone-sl-logo-tender
  '("____                 "
    "|   \\@@@@@@@@@@@     "
    "|    \\@@@@@@@@@@@@@_ "
    "|                  | "
    "|__________________| "
    "   (O)       (O)     "))

(defvar zone-sl-logo-passenger
  '(" ____________________ "
    " |  ___ ___ ___ ___ | "
    " |  |_| |_| |_| |_| | "
    " |__________________| "
    "_|__________________|_"
    "    (O)        (O)    "))

(defvar zone-sl-locomotives '(zone-sl-d51 zone-sl-c51 zone-sl-logo)
  "List of cars with smokes.")

;; define trains
(defvar zone-sl-d51-l1     '(zone-sl-d51 zone-sl-tender))
(defvar zone-sl-d51-l1p2   '(zone-sl-d51 zone-sl-tender zone-sl-passenger zone-sl-last-passenger))
(defvar zone-sl-d51-l3p10  '(((zone-sl-d51 zone-sl-tender) . 3) (zone-sl-passenger . 9) zone-sl-last-passenger))
(defvar zone-sl-d51-p1l1   '(zone-sl-passenger zone-sl-d51))
(defvar zone-sl-c51-l1     '(zone-sl-c51 zone-sl-tender))
(defvar zone-sl-c51-l1p2   '(zone-sl-c51 zone-sl-tender zone-sl-passenger zone-sl-last-passenger))
(defvar zone-sl-c51-l3p10  '(((zone-sl-c51 zone-sl-tender) . 3) (zone-sl-passenger . 9) zone-sl-last-passenger))
(defvar zone-sl-logo-l1    '(zone-sl-logo zone-sl-logo-tender))
(defvar zone-sl-logo-l1p2  '(zone-sl-logo zone-sl-logo-tender (zone-sl-logo-passenger . 2)))
(defvar zone-sl-logo-l3p10 '(((zone-sl-logo zone-sl-logo-tender) . 3) (zone-sl-logo-passenger . 10)))

;;(defcustom zone-sl-direction '(-2 0) "Direction." :group 'zone-sl)
(defvar zone-sl-direction '(-2 0)) ;; TODO
(defcustom zone-sl-trains '(zone-sl-d51-l1    zone-sl-c51-l1    zone-sl-logo-l1
                            zone-sl-d51-l1p2  zone-sl-c51-l1p2  zone-sl-logo-l1p2
                            zone-sl-d51-l3p10 zone-sl-c51-l3p10 zone-sl-logo-l3p10
                            zone-sl-d51-p1l1)
  "Train Specs." :group 'zone-sl)

;;; Code

(defun zone-sl-train-expand (train)
  "Expand TRAIN symbol to actual train specification."
  (apply
   'append
   (mapcar (lambda (spec)
             (pcase spec
               (`(,(pred listp) . ,(pred integerp))
                (apply 'append (make-list (cdr spec) (car spec))))
               (`(,(pred symbolp) . ,(pred integerp))
                (make-list (cdr spec) (car spec)))
               ((pred symbolp) (list spec))
               (_ (error "Illegal train spec! %s" train))))
           (symbol-value train))))

(defun zone-sl-car-width (car)
  "Width of train CAR."
  (length
   (car (if (functionp car) (funcall car 0) (symbol-value car)))))

(defun zone-sl-train-width (train)
  "Width of TRAIN."
  (apply '+ (mapcar 'zone-sl-car-width train)))

(defun zone-sl-car-height (car)
  "Height of CAR."
  (length
   (if (functionp car) (funcall car 0) (symbol-value car))))

(defun zone-sl-train-height (train)
  "Height of TRAIN."
  (apply 'max (mapcar 'zone-sl-car-height train)))

(defun zone-sl-pad-height (car height)
  "Pad CAR for HEIGHT." ;; CAR cannot be a function!
  (let ((width (length (car car)))
        (h (length car)))
    (if (< h height)
        (nconc (make-list (- height h) (make-string width ? ))
               car)
      car)))

(defun zone-sl-smoke-specs (train)
  "Smoke specs of TRAIN."
  (let (result
        (width 0))
    (dolist (car train)
      (when (memq car zone-sl-locomotives)
        (setq result (nconc result (list width)))
        (setq width 0))
      (cl-incf width (zone-sl-car-width car)))
    (nconc result (list width))))

;;;###autoload
(defun zone-pgm-sl ()
  "Zone out with steam locomotive."
  (delete-other-windows)
  (let* ((truncate-lines t)
         (window-height (window-height))
         (window-width (window-width)))
    (cl-loop
     for j = 0 then (1+ j)
     for train = (zone-sl-train-expand
                  (elt zone-sl-trains (% j (length zone-sl-trains))))
     for train-width = (zone-sl-train-width train)
     for train-height = (zone-sl-train-height train)
     for dx = (elt zone-sl-direction 0)
     for dy = (elt zone-sl-direction 1)
     for smoke-func = (if (= dy 0) 'zone-sl-smoke 'zone-sl-smoke-2)
     for smoke = (funcall smoke-func 0)
     for smoke-height = (length smoke)
     for smoke-width = (length (car smoke))
     for smoke-specs = (zone-sl-smoke-specs train)
     for total-height = (+ train-height smoke-height)
     while (not (input-pending-p))
     do
     (zone-fill-out-screen (window-width) (window-height))
     (cl-loop
      for x = window-width then (+ x dx)
      for y = (random (- window-height total-height 5)) then (+ y dy)
      for k = 0 then (1+ k)
      while (and (not (input-pending-p))
                 (<= 0 (+ x train-width)))
      for train-strs =  (mapcar (lambda (car)
                               (zone-sl-pad-height
                                (if (functionp car) (funcall car k) (symbol-value car))
                                train-height))
                             train)
      for smoke-strs = (let ((smoke (funcall smoke-func k)))
                     (mapcar
                      (lambda (s)
                        (concat
                         (make-string (car smoke-specs) ? )
                         (mapconcat
                          (lambda (smoke-spec)
                            (if (< smoke-spec smoke-width)
                                (substring s 0 smoke-spec)
                              (concat s (make-string (- smoke-spec smoke-width) ? ))))
                          (cdr smoke-specs) "")))
                      smoke))
      do
      (goto-char (window-start))
      (forward-line (floor y))
      (dotimes (i total-height)
        (if (< 0 x) (move-to-column x))
        (delete-region (point) (point-at-eol))
        (let ((str   (if (< i smoke-height) (elt smoke-strs i)
                       (mapconcat
                        (lambda (x) (elt x (- i smoke-height))) train-strs "")))
              (start (if (< x 0) (- x) 0))
              (end   (if (< window-width (+ x train-width)) (- window-width x))))
          ;;(message "k=%s length=%s train-width=%s" k (length str) train-width)
          (insert (substring str start end))
          (forward-line)))
      (if (< 0 x) (move-to-column x))
      (delete-region (point) (point-at-eol))
      (sit-for zone-sl-wait)))))

;;;###autoload
(defun zone-sl ()
  "Zone out with steame locomotive."
  (interactive)
  (let ((zone-programs [zone-pgm-sl]))
    (zone)))

(defvar eshell-command-aliases-list)
(with-eval-after-load "em-alias"
  (add-to-list 'eshell-command-aliases-list '("sl" "zone-sl")))

(provide 'zone-sl)
;;; zone-sl.el ends here

;; Local Variables:
;; time-stamp-pattern: "10/Version:\\\\?[ \t]+1.%02y%02m%02d\\\\?\n"
;; End:
