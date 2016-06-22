;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 400)
(define WIDTH 200)
(define CTR-X (/ WIDTH 2))
(define MTSCN (empty-scene WIDTH HEIGHT "blue"))
(define FLAT-ROCK-BED (rectangle WIDTH 10 "solid" "red"))
(define FLAT-ROCK-BED-TO-BOTTOM (- HEIGHT (/ (image-height FLAT-ROCK-BED) 2)))
(define FLAT-ROCK-BED-SCN (place-image FLAT-ROCK-BED
                                       CTR-X
                                       FLAT-ROCK-BED-TO-BOTTOM
                                       MTSCN))
(define UFO (overlay (circle 10 "solid" "green")
                     (rectangle 40 4 "solid" "green")))
(define UFO-CENTER-TO-FLAT-ROCK-BED (- (- HEIGHT (image-height FLAT-ROCK-BED))
                                       (/ (image-height UFO) 2)))


(define (create-ufo-scene h)
  (cond [(<= h UFO-CENTER-TO-FLAT-ROCK-BED)
         (place-image UFO CTR-X h FLAT-ROCK-BED-SCN)]
        [(> h UFO-CENTER-TO-FLAT-ROCK-BED)
         (place-image UFO CTR-X UFO-CENTER-TO-FLAT-ROCK-BED FLAT-ROCK-BED-SCN)]))