(define (domain bridge-torch)
  (:requirements :strips :adl :typing :negation :equality :negative-preconditions 
                 :disjunctive-preconditions :existential-preconditions 
                 :universal-preconditions :quantified-preconditions 
                 :conditional-effects :action-costs)
  (:types island guy torch)
  (:predicates
    (at ?g - guy ?i - island)
    (connected ?i1 ?i2 - island)
    (holding ?g - guy ?t - torch)
    (free ?g - guy)           ; True if guy is not holding any torch.
    (slower ?g1 ?g2 - guy)    ; True if ?g1 is slower (i.e. takes longer) than ?g2.
  )
  (:functions
    (speed ?g - guy)
    (total-cost)
  )

  ;; Single-person crossing: a guy carrying a torch crosses from one island to another.
  (:action cross-single
    :parameters (?g - guy ?from ?to - island ?t - torch)
    :precondition (and
                    (at ?g ?from)
                    (holding ?g ?t)
                    (connected ?from ?to))
    :effect (and
             (not (at ?g ?from))
             (at ?g ?to)
             (increase (total-cost) (speed ?g))))
  
  ;; Two-person crossing (variant 1): the torch is held by ?g1, which is slower than ?g2.
  (:action cross-pair-slow-1
    :parameters (?g1 - guy ?g2 - guy ?from ?to - island ?t - torch)
    :precondition (and
                    (at ?g1 ?from)
                    (at ?g2 ?from)
                    (not (= ?g1 ?g2))
                    (holding ?g1 ?t)
                    (connected ?from ?to)
                    (slower ?g1 ?g2))
    :effect (and
             (not (at ?g1 ?from))
             (not (at ?g2 ?from))
             (at ?g1 ?to)
             (at ?g2 ?to)
             (increase (total-cost) (speed ?g1))))
  
  ;; Two-person crossing (variant 2): the torch is held by ?g2, which is slower than ?g1.
  (:action cross-pair-slow-2
    :parameters (?g1 - guy ?g2 - guy ?from ?to - island ?t - torch)
    :precondition (and
                    (at ?g1 ?from)
                    (at ?g2 ?from)
                    (not (= ?g1 ?g2))
                    (holding ?g2 ?t)
                    (connected ?from ?to)
                    (slower ?g2 ?g1))
    :effect (and
             (not (at ?g1 ?from))
             (not (at ?g2 ?from))
             (at ?g1 ?to)
             (at ?g2 ?to)
             (increase (total-cost) (speed ?g2))))
  
  ;; Torch passing: transfer a torch from one guy to another.
  ;; The receiving guy must be free (i.e. not already holding any torch).
  (:action pass-torch
    :parameters (?fromGuy - guy ?toGuy - guy ?i - island ?t - torch)
    :precondition (and
                    (at ?fromGuy ?i)
                    (at ?toGuy ?i)
                    (holding ?fromGuy ?t)
                    (free ?toGuy))
    :effect (and
             (not (holding ?fromGuy ?t))
             (holding ?toGuy ?t)
             (free ?fromGuy)
             (not (free ?toGuy))))
)
