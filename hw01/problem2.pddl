(define (problem bridge-torch-prob2)
  (:domain bridge-torch)
  (:objects 
    l r - island
    a b c d e f - guy
    t1 t2 - torch
  )
  (:init
    ;; Initialize total cost.
    (= (total-cost) 0)
    
    ;; All guys start at island l.
    (at a l)
    (at b l)
    (at c l)
    (at d l)
    (at e l)
    (at f l)
    
    ;; Islands are connected (bidirectional bridge).
    (connected l r)
    (connected r l)
    
    ;; Torch assignments.
    (holding a t1)
    (holding b t2)
    
    ;; Mark free status: only guys not holding a torch are free.
    (free c)
    (free d)
    (free e)
    (free f)
    
    ;; Crossing speeds (in minutes):
    (= (speed a) 1)
    (= (speed b) 2)
    (= (speed c) 3)
    (= (speed d) 4)
    (= (speed e) 5)
    (= (speed f) 6)
    
    ;; Define slower relationships (a guy is slower if his speed is higher).
    (slower b a)  ; 2 > 1
    (slower c a)  ; 3 > 1
    (slower c b)  ; 3 > 2
    (slower d a)  ; 4 > 1
    (slower d b)  ; 4 > 2
    (slower d c)  ; 4 > 3
    (slower e a)  ; 5 > 1
    (slower e b)  ; 5 > 2
    (slower e c)  ; 5 > 3
    (slower e d)  ; 5 > 4
    (slower f a)  ; 6 > 1
    (slower f b)  ; 6 > 2
    (slower f c)  ; 6 > 3
    (slower f d)  ; 6 > 4
    (slower f e)  ; 6 > 5
  )
  (:goal (and
    (at a r)
    (at b r)
    (at c r)
    (at d r)
    (at e r)
    (at f r)
  ))
  (:metric minimize (total-cost))
)
