
;;;======================================================
;;;  MEDYCZNY SYSTEM EKSPERTOWY
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))

(deftemplate state-list
   (slot current)
   (multislot sequence))

(deffacts startup
   (state-list))

;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>

  (assert (UI-state (display tytul)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers aplikacja info))))

;;;*****************************************
;;;             * QUERY RULES *
;;;*****************************************

;;;***************
;;;APLIKACJA
;;;***************

(defrule start ""
	(logical (start aplikacja))
	=>
	(assert (UI-state (display tytul2)
                      (relation-asserted tytul2)
                      (valid-answers cisnienie cisnienie1 tetno tetno1 napiecie))))

(defrule cis ""
	(logical (tytul2 cisnienie))
	=>
	(assert (UI-state (display pytc)
                      (relation-asserted pytc)
                      (valid-answers tak nie))))

(defrule cis2 ""
	(logical (tytul2 cisnienie1))
	=>
	(assert (UI-state (display pytc2)
                      (relation-asserted pytc2)
                      (valid-answers tak nie))))

(defrule tet ""
	(logical (tytul2 tetno))
	=>
	(assert (UI-state (display pytt)
                      (relation-asserted pytt)
                      (valid-answers tak nie))))

(defrule tet2 ""
	(logical (tytul2 tetno1))
	=>
	(assert (UI-state (display pytt2)
                      (relation-asserted pytt2)
                      (valid-answers tak nie))))

(defrule pytctak ""
	(logical (pytc tak))
	=>
	(assert (UI-state (display leki)
                      (relation-asserted leki)
                      (valid-answers tak nie))))

(defrule pytttak ""
	(logical (pytt tak))
	=>
	(assert (UI-state (display leki1)
                      (relation-asserted leki1)
                      (valid-answers tak nie))))

;(defrule pytcnie ""
;	(logical (pytc nie))
;	=>
;	(assert (UI-state (display )
 ;                     (relation-asserted )
  ;                    (valid-answers ))))

;(defrule pyttnie ""
;	(logical (pytt nie))
;	=>
;	(assert (UI-state (display )
 ;                     (relation-asserted )
  ;                    (valid-answers ))))

;;;**************
;;;OD PACJENTA
;;;**************

(defrule start2 ""
	(logical (start info))
	=>
	(assert (UI-state (display tytul2)
                      (relation-asserted tytul2)
                      (valid-answers glowa zawroty oslabienie))))
;;;Astma

;;;Cukrzyca

;;;Alergia


;;;POChP

;;;Arytmia serca

;;;przedzawałowe

;;;przedudarowe


;;;Depresja


;;;Reumatoidalne zapalenie stawow


(defrule bolglowy ""
	(logical (tytul2 glowa))
	=>
	(assert (UI-state (display tytul3)
                      (relation-asserted tytul3)
                      (valid-answers wymioty zawroty nudnosci))))

(defrule wymioty ""
	(logical (tytul3 wymioty))
	=>
	(assert (UI-state (display tytul3)
                      (relation-asserted tytul3)
                      (valid-answers bodzce swiatlo zmeczenia))))

(defrule bodzce ""
	(logical (tytul3 bodzce))
	=>
	(assert (UI-state (display tytul3)
                      (relation-asserted tytul3)
                      (valid-answers niedowlad drazliwosc widzenie ))))


;;;*****************************************
;;;            * FINAL RULES *
;;;*****************************************

;;;adventure
(defrule migrena ""
   (logical (tytul3 drazliwosc))
   =>
   (assert (UI-state (display migrena)
                     (state final))))
					 
(defrule Conclusion-The-goonies ""
   (logical (spooked Yes))
   =>
   (assert (UI-state (display Conclusion-The-goonies)
                     (state final))))

;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question
   (declare (salience 5))
   (UI-state (id ?id))
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
   =>
   (modify ?f (current ?id)
              (sequence ?id ?s))
   (halt))

(defrule handle-next-no-change-none-middle-of-chain
   (declare (salience 10))
   ?f1 <- (next ?id)
   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
   =>
   (retract ?f1)
   (modify ?f2 (current ?nid))
   (halt))

(defrule handle-next-response-none-end-of-chain
   (declare (salience 10))
   ?f <- (next ?id)
   (state-list (sequence ?id $?))
   (UI-state (id ?id)
             (relation-asserted ?relation))
   =>
   (retract ?f)
   (assert (add-response ?id)))

(defrule handle-next-no-change-middle-of-chain
   (declare (salience 10))
   ?f1 <- (next ?id ?response)
   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
   (UI-state (id ?id) (response ?response))
   =>
   (retract ?f1)
   (modify ?f2 (current ?nid))
   (halt))

(defrule handle-next-change-middle-of-chain
   (declare (salience 10))
   (next ?id ?response)
   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
   (UI-state (id ?id) (response ~?response))
   ?f2 <- (UI-state (id ?nid))
   =>
   (modify ?f1 (sequence ?b ?id ?e))
   (retract ?f2))

(defrule handle-next-response-end-of-chain
   (declare (salience 10))
   ?f1 <- (next ?id ?response)
   (state-list (sequence ?id $?))
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
   =>
   (retract ?f1)
   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
   (assert (add-response ?id ?response)))

(defrule handle-add-response
   (declare (salience 10))
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   ?f1 <- (add-response ?id ?response)
   =>
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   (retract ?f1))

(defrule handle-add-response-none
   (declare (salience 10))
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   ?f1 <- (add-response ?id)
   =>
   (str-assert (str-cat "(" ?relation ")"))
   (retract ?f1))

(defrule handle-prev
   (declare (salience 10))
   ?f1 <- (prev ?id)
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
   =>
   (retract ?f1)
   (modify ?f2 (current ?p))
   (halt))
