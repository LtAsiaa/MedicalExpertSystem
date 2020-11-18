
;;;======================================================
;;;  Family Movie Expert System
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
                    (valid-answers adventure laugh sport animation dance animal wowed))))

;;;***************
;;;* QUERY RULES *
;;;***************

;;; adventure
(defrule ok-adventure ""
	(logical (start adventure))
	=>
	(assert (UI-state (display handle-or-travel)
                      (relation-asserted handle-or-travel)
                      (valid-answers handle travel))))
					 
(defrule ok-handle ""
	(logical (handle-or-travel handle))
	=>
	(assert (UI-state (display handle)
                      (relation-asserted handle)
                      (valid-answers No Yes))))
					 
(defrule ok-handlee ""
	(logical (handle Yes))
	=>
	(assert (UI-state (display spooked)
                      (relation-asserted spooked)
                      (valid-answers Yes take))))

(defrule ok-travel ""
	(logical (handle-or-travel travel))
	=>
	(assert (UI-state (display travel)
                      (relation-asserted travel) 
                      (valid-answers Yes alternate chronological))))
					 
(defrule ok-travell ""
	(logical (travel alternate))
	=>
	(assert (UI-state (display tunes)
                      (relation-asserted tunes)
                      (valid-answers Yes different))))
					 

;;;laugh				 
(defrule ok-laugh ""
	(logical (start laugh))
	=>
	(assert (UI-state (display humor)
                      (relation-asserted humor)
                      (valid-answers values dark bc))))	

(defrule ok-humor ""
	(logical (humor values))
	=>
	(assert (UI-state (display kevin)
                      (relation-asserted kevin)
                      (valid-answers support show))))					 

(defrule ok-humorr ""
	(logical (humor dark))
	=>
	(assert (UI-state (display jokes)
                      (relation-asserted jokes)
                      (valid-answers Yes slapstick))))
					
(defrule ok-humorrr ""
	(logical (humor bc))
	=>
	(assert (UI-state (display squirrel)
                      (relation-asserted squirrel)
                      (valid-answers Yes learn))))

;;;animal
(defrule ok-animal ""
	(logical (start animal))
	=>
	(assert (UI-state (display cry)
                      (relation-asserted cry)
                      (valid-answers Yes hend recover No))))

;;;dance
(defrule ok-dance ""
	(logical (start dance))
	=>
	(assert (UI-state (display alive-or-holidays)
                      (relation-asserted alive-or-holidays)
                      (valid-answers alive holidays))))


(defrule ok-alive ""
	(logical (alive-or-holidays alive))
	=>
	(assert (UI-state (display alive)
                      (relation-asserted alive)
                      (valid-answers scatecrows Yes))))

(defrule ok-holidays ""
	(logical (alive-or-holidays holidays))
	=>
	(assert (UI-state (display holidays)
                      (relation-asserted holidays) 
                      (valid-answers halloween Yes))))

;;;animation

(defrule ok-animation ""
	(logical (start animation))
	=>
	(assert (UI-state (display pixar-or-sing)
					  (relation-asserted pixar-or-sing)
					  (valid-answers pixar sing))))
					 
(defrule ok-sing ""
	(logical (pixar-or-sing sing))
	=>
	(assert (UI-state (display sing)
					  (relation-asserted sing)
					  (valid-answers variety Yes))))
					 
(defrule ok-pixar ""
	(logical (pixar-or-sing pixar))
	=>
	(assert (UI-state (display pixar)
					  (relation-asserted pixar)
					  (valid-answers Disney Yes disney))))
					 
(defrule ok-Disney ""
	(logical (pixar Disney))
	=>
	(assert (UI-state (display mice)
					  (relation-asserted mice)
					  (valid-answers Yes No))))
					 
(defrule ok-pixarr ""
	(logical (pixar Yes))
	=>
	(assert (UI-state (display command)
					  (relation-asserted command)
					  (valid-answers ballon Yes))))
					 
(defrule ok-disney ""
	(logical (pixar disney))
	=>
	(assert (UI-state (display DonBluth)
					  (relation-asserted DonBluth)
					  (valid-answers Yes double))))


;;;sport
(defrule ok-sport ""
	(logical (start sport))
	=>
	(assert (UI-state (display foot-hock-base-basket)
					  (relation-asserted foot-hock-base-basket)
					  (valid-answers Football Hockey Baseball Basketball))))
					  
(defrule ok-football ""
	(logical (foot-hock-base-basket Football))
	=>
	(assert (UI-state (display trip)
					  (relation-asserted trip)
					  (valid-answers Yes keep))))
	
(defrule ok-hockey ""
	(logical (foot-hock-base-basket Hockey))
	=>
	(assert (UI-state (display truestory)
					  (relation-asserted truestory)
					  (valid-answers Yes truly))))
	
(defrule ok-basketball ""
	(logical (foot-hock-base-basket Basketball))
	=>
	(assert (UI-state (display dog)
					  (relation-asserted dog)
					  (valid-answers Yes No))))
					  
(defrule Conclusion-The-sandlot ""
	(logical (foot-hock-base-basket Baseball))
	=>
	(assert (UI-state (display Conclusion-The-sandlot)
					  (relation-asserted peffercorn)
					  (valid-answers ok))))
			
(defrule Conclusion-Rookie-of-the-year ""
	(logical (peffercorn ok))
	=>
	(assert (UI-state (display Conclusion-Rookie-of-the-year)
					  (relation-asserted sleep)
					  (valid-answers ok))))

;;;wowed

(defrule ok-wowed ""
	(logical (start wowed))
	=>
	(assert (UI-state (display magic-or-greatmov-childhood)
					  (relation-asserted magic-or-greatmov-childhood)
					  (valid-answers magic greatmov childhood))))
					  
(defrule ok-magic ""
	(logical (magic-or-greatmov-childhood magic))
	=>
	(assert (UI-state (display magic)
					  (relation-asserted magic)
					  (valid-answers Yes action))))
					  
(defrule ok-childhood ""
	(logical (magic-or-greatmov-childhood childhood))
	=>
	(assert (UI-state (display dialog)
					  (relation-asserted dialog)
					  (valid-answers Yes No))))
					  
(defrule Conclusion-The-princess-bride ""
	(logical (magic-or-greatmov-childhood greatmov))
	=>
	(assert (UI-state (display Conclusion-The-princess-bride)
					  (relation-asserted greatestmov)
					  (valid-answers ok))))
					  
(defrule Conclusion-Fantasia ""
	(logical (dialog No))
	=>
	(assert (UI-state (display Conclusion-Fantasia)
					  (relation-asserted old)
					  (valid-answers ok))))
;;;****************
;;;* FINAL RULES *
;;;****************

;;;adventure
(defrule Conclusion-Wall-e ""
   (logical (handle No))
   =>
   (assert (UI-state (display Conclusion-Wall-e)
                     (state final))))
					 
(defrule Conclusion-The-goonies ""
   (logical (spooked Yes))
   =>
   (assert (UI-state (display Conclusion-The-goonies)
                     (state final))))
					 
(defrule Conclusion-Indiana-Jones-raiders-of-the-lost-ark ""
   (logical (spooked take))
   =>
   (assert (UI-state (display Conclusion-Indiana-Jones-raiders-of-the-lost-ark)
                     (state final))))
(defrule Conclusion-Back-to-the-future ""
   (logical (travel Yes))
   =>
   (assert (UI-state (display Conclusion-Back-to-the-future)
                     (state final))))
(defrule Conclusion-Forrest-gump ""
   (logical (travel chronological))
   =>
   (assert (UI-state (display Conclusion-Forrest-gump)
                     (state final))))
(defrule Conclusion-Who-framed-roger-rabbit? ""
   (logical (tunes Yes))
   =>
   (assert (UI-state (display Conclusion-Who-framed-roger-rabbit?)
                     (state final))))
(defrule Conclusion-Ferngully-the-last-rainforest ""
   (logical (tunes different))
   =>
   (assert (UI-state (display Conclusion-Ferngully-the-last-rainforest)
                     (state final))))
					 
;;;laugh
(defrule Conclusion-Uncle-buck ""
   (logical (kevin support))
   =>
   (assert (UI-state (display Conclusion-Uncle-buck)
                     (state final))))

(defrule Conclusion-Home-alone ""
   (logical (kevin show))
   =>
   (assert (UI-state (display Conclusion-Home-alone)
                     (state final))))
					 
(defrule Conclusion-The-Addams-family ""
   (logical (jokes Yes))
   =>
   (assert (UI-state (display Conclusion-The-Addams-family)
                     (state final))))
					 
(defrule Conclusion-Ghostbusters ""
   (logical (jokes slapstick))
   =>
   (assert (UI-state (display Conclusion-Ghostbusters)
                     (state final))))
					 
(defrule Conclusion-The-emperors-new-groove ""
   (logical (squirrel Yes))
   =>
   (assert (UI-state (display Conclusion-The-emperors-new-groove)
                     (state final))))
					 
(defrule Conclusion-Ice-age ""
   (logical (squirrel learn))
   =>
   (assert (UI-state (display Conclusion-Ice-age)
                     (state final))))
					 
;;;animal

(defrule Conclusion-Turner-and-hooch ""
   (logical (cry Yes))
   =>
   (assert (UI-state (display Conclusion-Turner-and-hooch)
                     (state final))))
					
(defrule Conclusion-The-lion-king ""
   (logical (cry hend))
   =>
   (assert (UI-state (display Conclusion-The-lion-king)
                     (state final))))
					 
(defrule Conclusion-bambi ""
   (logical (cry recover))
   =>
   (assert (UI-state (display Conclusion-bambi)
                     (state final))))
					 
(defrule Conclusion-Jumanji ""
   (logical (cry No))
   =>
   (assert (UI-state (display Conclusion-Jumanji)
                     (state final))))
					 
;;;dance

(defrule Conclusion-The-wizard-of-oz ""
   (logical (alive scatecrows))
   =>
   (assert (UI-state (display Conclusion-The-wizard-of-oz)
                     (state final))))
					 
(defrule Conclusion-The-sound-of-music ""
   (logical (alive Yes))
   =>
   (assert (UI-state (display Conclusion-The-sound-of-music)
                     (state final))))
					 
(defrule Conclusion-The-nightmare-before-christmas ""
   (logical (holidays halloween))
   =>
   (assert (UI-state (display Conclusion-The-nightmare-before-christmas)
                     (state final))))
					 
(defrule Conclusion-Scrooge ""
   (logical (holidays Yes))
   =>
   (assert (UI-state (display Conclusion-Scrooge)
                     (state final))))
					 
;;;animation

(defrule Conclusion-Aladdin ""
	(logical (sing variety))
	=>
	(assert (UI-state (display Conclusion-Aladdin)
					  (state final))))

(defrule Conclusion-Frozen ""
	(logical (sing Yes))
	=>
	(assert (UI-state (display Conclusion-Frozen)
					  (state final))))
					  
(defrule Conclusion-Up ""
	(logical (command ballon))
	=>
	(assert (UI-state (display Conclusion-Up)
					  (state final))))
				
(defrule Conclusion-Toy-story ""
	(logical (command Yes))
	=>
	(assert (UI-state (display Conclusion-Toy-story)
					  (state final))))
					 
(defrule  Conclusion-All-dogs-go-to-heaven ""
	(logical (DonBluth Yes))
	=>
	(assert (UI-state (display Conclusion-All-dogs-go-to-heaven)
					  (state final))))
				
(defrule Conclusion-The-land-before-time ""
	(logical (DonBluth double))
	=>
	(assert (UI-state (display Conclusion-The-land-before-time)
					  (state final))))
					
(defrule Conclusion-Beauty-and-the-beast ""
	(logical (mice No))
	=>
	(assert (UI-state (display Conclusion-Beauty-and-the-beast)
					  (state final))))
					  
(defrule Conclusion-The-rescuers ""
	(logical (mice Yes))
	=>
	(assert (UI-state (display Conclusion-The-rescuers)
					  (state final))))
					  
;;;sport

(defrule Conclusion-Little-big-league ""
	(logical (sleep ok))
	=>
	(assert (UI-state (display Conclusion-Little-big-league)
					  (state final))))
					
(defrule Conclusion-Air-Bud ""
	(logical (sleep No))
	=>
	(assert (UI-state (display Conclusion-Air-Bud)
					  (state final))))
					  
(defrule Conclusion-Hoosiers ""
	(logical (sleep Yes))
	=>
	(assert (UI-state (display Conclusion-Hoosiers)
					  (state final))))

(defrule Conclusion-Miracle ""
	(logical (truestory Yes))
	=>
	(assert (UI-state (display Conclusion-Miracle)
					  (state final))))

(defrule Conclusion-The-mighty-ducks ""
	(logical (truestory truly))
	=>
	(assert (UI-state (display Conclusion-The-mighty-ducks)
					  (state final))))

(defrule Conclusion-Little-giants ""
	(logical (trip keep))
	=>
	(assert (UI-state (display Conclusion-Little-giants)
					  (state final))))

(defrule Conclusion-Remember-the-titans ""
	(logical (trip Yes))
	=>
	(assert (UI-state (display Conclusion-Remember-the-titans)
					  (state final))))
;;;wowed

(defrule Conclusion-Harry-Potter-series ""
	(logical (magic Yes))
	=>
	(assert (UI-state (display Conclusion-Harry-Potter-series)
					  (state final))))

(defrule Conclusion-The-Lords-of-the-Rings-series ""
	(logical (magic action))
	=>
	(assert (UI-state (display Conclusion-The-Lords-of-the-Rings-series)
					  (state final))))

(defrule Conclusion-ET-the-extra-terrestrial ""
	(logical (dialog Yes))
	=>
	(assert (UI-state (display Conclusion-ET-the-extra-terrestrial)
					  (state final))))

(defrule Conclusion-Willy-Wonka-and-the-Chocolate-Faktory ""
	(logical (old ok))
	=>
	(assert (UI-state (display Conclusion-Willy-Wonka-and-the-Chocolate-Faktory)
					  (state final))))
					  
(defrule Conclusion-Star-Wars-e4-A-New-Hope ""
	(logical (greatestmov ok))
	=>
	(assert (UI-state (display Conclusion-Star-Wars-e4-A-New-Hope)
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
