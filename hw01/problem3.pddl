(define (problem bridge-torch-prob3)
  (:domain bridge-torch)
  (:objects 
    i1 i2 i3 i4 - island
    a b c d e f - guy
    t1 t2 - torch
  )
  (:init
    ;; Initialize total cost.
    (= (total-cost) 0)
    
    ;; All guys start at island i1.
    (at a i1)
    (at b i1)
    (at c i1)
    (at d i1)
    (at e i1)
    (at f i1)
    
    ;; Connectivity: i1 is connected only to i2; i2 is connected to i3 and i4.
    (connected i1 i2)
    (connected i2 i1)
    (connected i2 i3)
    (connected i3 i2)
    (connected i2 i4)
    (connected i4 i2)
    
    ;; Torch assignments.
    (holding a t1)
    (holding f t2)
    
    ;; Mark free status: only those not holding a torch are free.
    (free b)
    (free c)
    (free d)
    (free e)
    
    ;; Speeds for each guy (in minutes).
    (= (speed a) 1)
    (= (speed b) 2)
    (= (speed c) 3)
    (= (speed d) 4)
    (= (speed e) 5)
    (= (speed f) 6)
    
    ;; Define slower relationships (a guy is "slower" if his speed value is higher):
    (slower b a)  ; since 2 > 1
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
    (at a i3)
    (at b i3)
    (at c i3)
    (at d i4)
    (at e i4)
    (at f i4)
  ))
  (:metric minimize (total-cost))
)
