(define (problem bridge-torch-prob1)
  (:domain bridge-torch)
  (:objects 
    l r - island
    a b c d - guy
    t - torch
  )
  (:init
    ;; Initialize total cost.
    (= (total-cost) 0)
    
    ;; All guys start at island l.
    (at a l)
    (at b l)
    (at c l)
    (at d l)
    
    ;; Connectivity (bidirectional bridge).
    (connected l r)
    (connected r l)
    
    ;; Torch assignment: a initially holds the torch.
    (holding a t)
    
    ;; Mark who is free (a is not free because he holds the torch).
    (free b)
    (free c)
    (free d)
    
    ;; Speed for each guy (in minutes).
    (= (speed a) 1)
    (= (speed b) 2)
    (= (speed c) 5)
    (= (speed d) 8)
    
    ;; Define slower relationships.
    ;; "slower" means "takes longer" (i.e. higher speed value).
    (slower b a)  ; since 2 > 1
    (slower c a)  ; 5 > 1
    (slower c b)  ; 5 > 2
    (slower d a)  ; 8 > 1
    (slower d b)  ; 8 > 2
    (slower d c)  ; 8 > 5
  )
  (:goal (and
    (at a r)
    (at b r)
    (at c r)
    (at d r)
  ))
  (:metric minimize (total-cost))

)
