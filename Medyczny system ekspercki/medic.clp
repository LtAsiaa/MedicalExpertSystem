
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
                    (valid-answers wewnetrzne nerwicowe))))

;;;*****************************************
;;;             * QUERY RULES *
;;;*****************************************

;;;**************
;;;OD PACJENTA
;;;**************

;;;WEWNETRZNE

(defrule start2 ""
	(logical (start wewnetrzne))
	=>
	(assert (UI-state (display tytul21)
                      (relation-asserted tytul21)
                      (valid-answers glowa dusznosc pragnienie oslabienie1 kaszell wkatar wodkatar  inne))))

(defrule start33 ""
	(logical (tytul21 inne))
	=>
	(assert (UI-state (display tytul22)
                      (relation-asserted tytul22)
                      (valid-answers  serceee jednoslab smutek1 zimno zadyszka pamiecsw oczko inne))))

(defrule start4 ""
	(logical (tytul22 inne))
	=>
	(assert (UI-state (display tytul23)
                      (relation-asserted tytul23)
                      (valid-answers  bolkl wysilek wyciek samopocz gorr bolpluc zgaga inne))))

(defrule start5 ""
	(logical (tytul23 inne))
	=>
	(assert (UI-state (display tytul24)
                      (relation-asserted tytul24)
                      (valid-answers  oslabienie2 bladoscc silnybol przyrost krwaslu obnizcis))))
;;;;;;;;;;;;;;;;;;;;;;;;
;;;Migrena
(defrule migrenaa ""
	(logical (tytul21 glowa))
	=>
	(assert (UI-state (display nastrojj)
                      (relation-asserted nastrojj)
                      (valid-answers tak nie))))
(defrule migrenaa1 ""
	(logical (nastrojj tak))
	=>
	(assert (UI-state (display drazliwosc)
                      (relation-asserted drazliwosc)
                      (valid-answers tak nie))))
(defrule migrena11 ""
	(logical (nastrojj nie))
	=>
	(assert (UI-state (display drazliwosc)
                      (relation-asserted drazliwosc)
                      (valid-answers tak nie))))

(defrule migrena2 ""
	(logical (drazliwosc tak))
	=>
	(assert (UI-state (display aura)
                      (relation-asserted aura)
                      (valid-answers tak nie))))
(defrule migrena22 ""
	(logical (drazliwosc nie))
	=>
	(assert (UI-state (display aura)
                      (relation-asserted aura)
                      (valid-answers tak nie))))
 (defrule migrena3 ""
 	(logical (aura tak))
 	=>
 	(assert (UI-state (display nudnosci)
                       (relation-asserted nudnosci)
                       (valid-answers tak nie))))
 (defrule migrena33 ""
 	(logical (aura nie))
 	=>
 	(assert (UI-state (display nudnosci)
                       (relation-asserted nudnosci)
                       (valid-answers tak nie))))
  (defrule migrena4 ""
  	(logical (nudnosci tak))
  	=>
  	(assert (UI-state (display wymioty)
                        (relation-asserted wymioty)
                        (valid-answers tak nie))))
  (defrule migrena44 ""
  	(logical (nudnosci nie))
  	=>
  	(assert (UI-state (display wymioty)
                        (relation-asserted wymioty)
                        (valid-answers tak nie))))
   (defrule migrena5 ""
   	(logical (wymioty tak))
   	=>
   	(assert (UI-state (display swiatlo)
                         (relation-asserted swiatlo)
                         (valid-answers tak nie))))
   (defrule migrena55 ""
   	(logical (wymioty nie))
   	=>
   	(assert (UI-state (display swiatlo)
                         (relation-asserted swiatlo)
                         (valid-answers tak nie))))
   (defrule migrena6 ""
   	(logical (swiatlo tak))
   	=>
   	(assert (UI-state (display bodzce)
                         (relation-asserted bodzce)
                         (valid-answers tak nie))))
   (defrule migrena66 ""
   	(logical (swiatlo nie))
   	=>
   	(assert (UI-state (display bodzce)
                         (relation-asserted bodzce)
                         (valid-answers tak nie))))
   (defrule migrena7 ""
   	(logical (bodzce tak))
   	=>
   	(assert (UI-state (display lzawienie)
                         (relation-asserted lzawienie)
                         (valid-answers tak nie))))
   (defrule migrena77 ""
   	(logical (bodzce nie))
   	=>
   	(assert (UI-state (display lzawienie)
                         (relation-asserted lzawienie)
                         (valid-answers tak nie))))
   (defrule migrena8 ""
   	(logical (lzawienie tak))
   	=>
   	(assert (UI-state (display omdlenia)
                         (relation-asserted omdlenia)
                         (valid-answers tak nie))))
   (defrule migrena88 ""
   	(logical (lzawienie nie))
   	=>
   	(assert (UI-state (display omdlenia)
                         (relation-asserted omdlenia)
                         (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Astma
(defrule astmaa ""
	(logical (tytul21 dusznosc))
	=>
	(assert (UI-state (display kaszel)
                      (relation-asserted kaszel)
                      (valid-answers tak nie))))
(defrule astmaa1 ""
	(logical (kaszel tak))
	=>
	(assert (UI-state (display swoddech)
                      (relation-asserted  swoddech)
                      (valid-answers tak nie))))
(defrule astmaa11 ""
	(logical (kaszel nie))
	=>
	(assert (UI-state (display swoddech)
                      (relation-asserted  swoddech)
                      (valid-answers tak nie))))
(defrule astmaa2 ""
	(logical (swoddech tak))
	=>
	(assert (UI-state (display ucisk)
                      (relation-asserted  ucisk)
                      (valid-answers tak nie))))
(defrule astmaa22 ""
	(logical (swoddech nie))
	=>
	(assert (UI-state (display ucisk)
                      (relation-asserted  ucisk)
                      (valid-answers tak nie))))

 (defrule astmaa3 ""
 	(logical (ucisk tak))
 	=>
 	(assert (UI-state (display alergiaa)
                       (relation-asserted  alergiaa)
                       (valid-answers tak nie))))
 (defrule astmaa33 ""
 	(logical (ucisk nie))
 	=>
 	(assert (UI-state (display alergiaa)
                       (relation-asserted  alergiaa)
                       (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Cukrzyca
(defrule cuukrzycaa ""
	(logical (tytul21 pragnienie))
	=>
	(assert (UI-state (display mocz)
                      (relation-asserted mocz)
                      (valid-answers tak nie))))

(defrule cuukrzycaa1 ""
 	(logical (mocz tak))
 	=>
 	(assert (UI-state (display apetyt)
                       (relation-asserted  apetyt)
                       (valid-answers tak nie))))
 (defrule cuukrzycaa11 ""
 	(logical (mocz nie))
 	=>
 	(assert (UI-state (display apetyt)
                       (relation-asserted  apetyt)
                       (valid-answers tak nie))))

(defrule cuukrzycaa2 ""
 	(logical (apetyt tak))
 	=>
 	(assert (UI-state (display suchosc)
                       (relation-asserted  suchosc)
                       (valid-answers tak nie))))
 (defrule cuukrzycaa22 ""
 	(logical (apetyt nie))
 	=>
 	(assert (UI-state (display suchosc)
                       (relation-asserted  suchosc)
                       (valid-answers tak nie))))

(defrule cuukrzycaa3 ""
 	(logical (suchosc tak))
 	=>
 	(assert (UI-state (display masa)
                       (relation-asserted  masa)
                       (valid-answers tak nie))))
 (defrule cuukrzycaa33 ""
 	(logical (suchosc nie))
 	=>
 	(assert (UI-state (display masa)
                       (relation-asserted  masa)
                       (valid-answers tak nie))))

(defrule cuukrzycaa4 ""
 	(logical (masa tak))
 	=>
 	(assert (UI-state (display widzenie)
                       (relation-asserted  widzenie)
                       (valid-answers tak nie))))
 (defrule cuukrzycaa44 ""
 	(logical (masa nie))
 	=>
 	(assert (UI-state (display widzenie)
                       (relation-asserted  widzenie)
                       (valid-answers tak nie))))

(defrule cuukrzycaa5 ""
 	(logical (widzenie tak))
 	=>
 	(assert (UI-state (display zmeczenie)
                       (relation-asserted  zmeczenie)
                       (valid-answers tak nie))))
 (defrule cuukrzycaa55 ""
 	(logical (widzenie nie))
 	=>
 	(assert (UI-state (display zmeczenie)
                       (relation-asserted  zmeczenie)
                       (valid-answers tak nie))))

 (defrule cuukrzycaa6 ""
  	(logical (zmeczenie tak))
  	=>
  	(assert (UI-state (display sennosc)
                        (relation-asserted  sennosc)
                        (valid-answers tak nie))))
  (defrule cuukrzycaa66 ""
  	(logical (zmeczenie nie))
  	=>
  	(assert (UI-state (display sennosc)
                        (relation-asserted  sennosc)
                        (valid-answers tak nie))))

 (defrule cuukrzycaa7 ""
  	(logical (sennosc tak))
  	=>
  	(assert (UI-state (display apatia)
                        (relation-asserted  apatia)
                        (valid-answers tak nie))))
  (defrule cuukrzycaa77 ""
  	(logical (sennosc nie))
  	=>
  	(assert (UI-state (display apatia)
                        (relation-asserted  apatia)
                        (valid-answers tak nie))))

  (defrule cuukrzycaa8 ""
   	(logical (apatia tak))
   	=>
   	(assert (UI-state (display koncentracja1)
                         (relation-asserted  koncentracja1)
                         (valid-answers tak nie))))
   (defrule cuukrzycaa9 ""
   	(logical (koncentracja1 tak))
   	=>
   	(assert (UI-state (display suchoscskory)
                         (relation-asserted  suchoscskory)
                         (valid-answers aceton swiad))))

 (defrule cuukrzycaa10 ""
  	(logical (suchoscskory aceton))
  	=>
  	(assert (UI-state (display infekcje)
                        (relation-asserted  infekcje)
                        (valid-answers tak nie))))

   (defrule cuukrzycaa11 ""
    	(logical (infekcje tak))
    	=>
    	(assert (UI-state (display zmeczenie)
                          (relation-asserted  zmeczenie)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa111 ""
    	(logical (infekcje nie))
    	=>
    	(assert (UI-state (display zmeczenie)
                          (relation-asserted  zmeczenie)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa12 ""
    	(logical (zmeczenie tak))
    	=>
    	(assert (UI-state (display smasa)
                          (relation-asserted  smasa)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa121 ""
    	(logical (zmeczenie nie))
    	=>
    	(assert (UI-state (display smasa)
                          (relation-asserted  smasa)
                          (valid-answers tak nie))))

  (defrule cuukrzycaa101 ""
  	(logical (suchoscskory swiad))
  	=>
  	(assert (UI-state (display trudnosc)
                        (relation-asserted  trudnosc)
                        (valid-answers tak nie))))


    (defrule cuukrzycaa13 ""
    	(logical (trudnosc tak))
    	=>
    	(assert (UI-state (display zakazenie)
                          (relation-asserted  zakazenie)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa131 ""
    	(logical (trudnosc nie))
    	=>
    	(assert (UI-state (display zakazenie)
                          (relation-asserted  zakazenie)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa14 ""
    	(logical (zakazenie tak))
    	=>
    	(assert (UI-state (display boll)
                          (relation-asserted  boll)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa141 ""
    	(logical (zakazenie nie))
    	=>
    	(assert (UI-state (display boll)
                          (relation-asserted  boll)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa15 ""
    	(logical (boll tak))
    	=>
    	(assert (UI-state (display koncentracja2)
                          (relation-asserted  koncentracja2)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa151 ""
    	(logical (boll nie))
    	=>
    	(assert (UI-state (display koncentracja2)
                          (relation-asserted  koncentracja2)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa16 ""
    	(logical (koncentracja2 tak))
    	=>
    	(assert (UI-state (display wahania)
                          (relation-asserted  wahania)
                          (valid-answers tak nie))))
    (defrule cuukrzycaa161 ""
    	(logical (koncentracja2 nie))
    	=>
    	(assert (UI-state (display wahania)
                          (relation-asserted  wahania)
                          (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Reumatoidalne zapalenie stawów
(defrule reumatoidlanezap ""
	(logical (tytul21 oslabienie1))
	=>
	(assert (UI-state (display goraczka)
                      (relation-asserted goraczka)
                      (valid-answers tak nie))))

(defrule reumatoidlanezap1 ""
 	(logical (goraczka tak))
 	=>
 	(assert (UI-state (display miesnie)
                       (relation-asserted  miesnie)
                       (valid-answers tak nie))))
 (defrule reumatoidlanezap11 ""
 	(logical (goraczka nie))
 	=>
 	(assert (UI-state (display miesnie)
                       (relation-asserted  miesnie)
                       (valid-answers tak nie))))

 (defrule reumatoidlanezap2 ""
  	(logical (miesnie tak))
  	=>
  	(assert (UI-state (display apetyt1)
                        (relation-asserted  apetyt1)
                        (valid-answers tak nie))))
  (defrule reumatoidlanezap22 ""
  	(logical (miesnie nie))
  	=>
  	(assert (UI-state (display apetyt1)
                        (relation-asserted  apetyt1)
                        (valid-answers tak nie))))

   (defrule reumatoidlanezap3 ""
    	(logical (apetyt1 tak))
    	=>
    	(assert (UI-state (display masa2)
                          (relation-asserted  masa2)
                          (valid-answers tak nie))))
    (defrule reumatoidlanezap33 ""
    	(logical (apetyt1 nie))
    	=>
    	(assert (UI-state (display masa2)
                          (relation-asserted  masa2)
                          (valid-answers tak nie))))

    (defrule reumatoidlanezap4 ""
     	(logical (masa2 tak))
     	=>
     	(assert (UI-state (display sztywnosc)
                           (relation-asserted  sztywnosc)
                           (valid-answers tak nie))))
     (defrule reumatoidlanezap44 ""
     	(logical (masa2 nie))
     	=>
     	(assert (UI-state (display sztywnosc)
                           (relation-asserted  sztywnosc)
                           (valid-answers tak nie))))
    (defrule reumatoidlanezap5 ""
     	(logical (sztywnosc tak))
     	=>
     	(assert (UI-state (display zmeczenie1)
                           (relation-asserted  zmeczenie1)
                           (valid-answers tak nie))))
     (defrule reumatoidlanezap55 ""
     	(logical (sztywnosc nie))
     	=>
     	(assert (UI-state (display zmeczenie1)
                           (relation-asserted  zmeczenie1)
                           (valid-answers tak nie))))
    (defrule reumatoidlanezap6 ""
     	(logical (zmeczenie1 tak))
     	=>
     	(assert (UI-state (display stawy)
                           (relation-asserted  stawy)
                           (valid-answers tak nie))))
     (defrule reumatoidlanezap66 ""
     	(logical (zmeczenie1 nie))
     	=>
     	(assert (UI-state (display stawy)
                           (relation-asserted  stawy)
                           (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;POCHP
(defrule poochpp ""
	(logical (tytul21 kaszell))
	=>
	(assert (UI-state (display pluwociny)
                      (relation-asserted pluwociny)
                      (valid-answers tak nie))))

(defrule poochpp1 ""
 	(logical (pluwociny tak))
 	=>
 	(assert (UI-state (display dusznosc1)
                       (relation-asserted  dusznosc1)
                       (valid-answers tak nie))))
 (defrule poochpp11 ""
 	(logical (pluwociny nie))
 	=>
 	(assert (UI-state (display dusznosc1)
                       (relation-asserted  dusznosc1)
                       (valid-answers tak nie))))

 (defrule poochpp2 ""
  	(logical (dusznosc1 tak))
  	=>
  	(assert (UI-state (display ucisk1)
                        (relation-asserted  ucisk1)
                        (valid-answers tak nie))))
  (defrule poochpp22 ""
  	(logical (dusznosc1 nie))
  	=>
  	(assert (UI-state (display ucisk1)
                        (relation-asserted  ucisk1)
                        (valid-answers tak nie))))

   (defrule poochpp3 ""
    	(logical (ucisk1 tak))
    	=>
    	(assert (UI-state (display wysilek)
                          (relation-asserted  wysilek)
                          (valid-answers tak nie))))
    (defrule poochpp33 ""
    	(logical (ucisk1 nie))
    	=>
    	(assert (UI-state (display wysilek)
                          (relation-asserted  wysilek)
                          (valid-answers tak nie))))

    (defrule poochpp4 ""
     	(logical (wysilek tak))
     	=>
     	(assert (UI-state (display problemy)
                           (relation-asserted  problemy)
                           (valid-answers tak nie))))
     (defrule poochpp44 ""
     	(logical (wysilek nie))
     	=>
     	(assert (UI-state (display problemy)
                           (relation-asserted  problemy)
                           (valid-answers tak nie))))
    (defrule poochpp5 ""
     	(logical (problemy tak))
     	=>
     	(assert (UI-state (display dusznosc2)
                           (relation-asserted  dusznosc2)
                           (valid-answers tak nie))))
     (defrule poochpp55 ""
     	(logical (problemy nie))
     	=>
     	(assert (UI-state (display dusznosc2)
                           (relation-asserted  dusznosc2)
                           (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Alergia
(defrule aalleerrggiiaa ""
	(logical (tytul21 wkatar))
	=>
	(assert (UI-state (display kichanie)
                      (relation-asserted kichanie)
                      (valid-answers tak nie))))

(defrule aalleerrggiiaa1 ""
 	(logical (kichanie tak))
 	=>
 	(assert (UI-state (display nos)
                       (relation-asserted  nos)
                       (valid-answers tak nie))))
 (defrule aalleerrggiiaa11 ""
 	(logical (kichanie nie))
 	=>
 	(assert (UI-state (display nos)
                       (relation-asserted  nos)
                       (valid-answers tak nie))))

 (defrule aalleerrggiiaa2 ""
  	(logical (nos tak))
  	=>
  	(assert (UI-state (display oczy)
                        (relation-asserted  oczy)
                        (valid-answers tak nie))))
  (defrule aalleerrggiiaa22 ""
  	(logical (nos nie))
  	=>
  	(assert (UI-state (display oczy)
                        (relation-asserted  oczy)
                        (valid-answers tak nie))))

   (defrule aalleerrggiiaa3 ""
    	(logical (oczy tak))
    	=>
    	(assert (UI-state (display gardlo)
                          (relation-asserted  gardlo)
                          (valid-answers tak nie))))
    (defrule aalleerrggiiaa33 ""
    	(logical (oczy nie))
    	=>
    	(assert (UI-state (display gardlo)
                          (relation-asserted  gardlo)
                          (valid-answers tak nie))))

    (defrule aalleerrggiiaa4 ""
     	(logical (gardlo tak))
     	=>
     	(assert (UI-state (display kaszel1)
                           (relation-asserted  kaszel1)
                           (valid-answers tak nie))))
     (defrule aalleerrggiiaa44 ""
     	(logical (gardlo nie))
     	=>
     	(assert (UI-state (display kaszel1)
                           (relation-asserted  kaszel1)
                           (valid-answers tak nie))))
    (defrule aalleerrggiiaa5 ""
     	(logical (kaszel1 tak))
     	=>
     	(assert (UI-state (display oddech)
                           (relation-asserted  oddech)
                           (valid-answers tak nie))))
     (defrule aalleerrggiiaa55 ""
     	(logical (kaszel1 nie))
     	=>
     	(assert (UI-state (display oddech)
                           (relation-asserted  oddech)
                           (valid-answers tak nie))))
    (defrule aalleerrggiiaa6 ""
     	(logical (oddech tak))
     	=>
     	(assert (UI-state (display skora)
                           (relation-asserted  skora)
                           (valid-answers tak nie))))
     (defrule aalleerrggiiaa66 ""
     	(logical (oddech nie))
     	=>
     	(assert (UI-state (display skora)
                           (relation-asserted  skora)
                           (valid-answers tak nie))))
    (defrule aalleerrggiiaa7 ""
     	(logical (skora tak))
     	=>
     	(assert (UI-state (display powieki)
                           (relation-asserted  powieki)
                           (valid-answers tak nie))))
     (defrule aalleerrggiiaa77 ""
     	(logical (skora nie))
     	=>
     	(assert (UI-state (display powieki)
                           (relation-asserted  powieki)
                           (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Niezyt nosa

(defrule nieezytt ""
	(logical (tytul21 wodkatar))
	=>
	(assert (UI-state (display kichanie1)
                      (relation-asserted kichanie1)
                      (valid-answers tak nie))))

(defrule nieezytt1 ""
 	(logical (kichanie1 tak))
 	=>
 	(assert (UI-state (display noss)
                       (relation-asserted  noss)
                       (valid-answers tak nie))))
 (defrule nieezytt11 ""
 	(logical (kichanie1 nie))
 	=>
 	(assert (UI-state (display noss)
                       (relation-asserted  noss)
                       (valid-answers tak nie))))

 (defrule nieezytt2 ""
  	(logical (noss tak))
  	=>
  	(assert (UI-state (display wydzielina)
                        (relation-asserted  wydzielina)
                        (valid-answers tak nie))))
  (defrule nieezytt22 ""
  	(logical (noss nie))
  	=>
  	(assert (UI-state (display wydzielina)
                        (relation-asserted  wydzielina)
                        (valid-answers tak nie))))

   (defrule nieezytt3 ""
    	(logical (wydzielina tak))
    	=>
    	(assert (UI-state (display swiad1)
                          (relation-asserted  swiad1)
                          (valid-answers tak nie))))
    (defrule nieezytt33 ""
    	(logical (wydzielina nie))
    	=>
    	(assert (UI-state (display swiad1)
                          (relation-asserted  swiad1)
                          (valid-answers tak nie))))

    (defrule nieezytt4 ""
     	(logical (swiad1 tak))
     	=>
     	(assert (UI-state (display wech)
                           (relation-asserted  wech)
                           (valid-answers tak nie))))
     (defrule nieezytt44 ""
     	(logical (swiad1 nie))
     	=>
     	(assert (UI-state (display wech)
                           (relation-asserted  wech)
                           (valid-answers tak nie))))
    (defrule nieezytt5 ""
     	(logical (wech tak))
     	=>
     	(assert (UI-state (display sen)
                           (relation-asserted  sen)
                           (valid-answers tak nie))))
     (defrule nieezytt55 ""
     	(logical (wech nie))
     	=>
     	(assert (UI-state (display sen)
                           (relation-asserted  sen)
                           (valid-answers tak nie))))
    (defrule nieezytt6 ""
     	(logical (sen tak))
     	=>
     	(assert (UI-state (display swiatlo1)
                           (relation-asserted  swiatlo1)
                           (valid-answers tak nie))))
     (defrule nieezytt66 ""
     	(logical (sen nie))
     	=>
     	(assert (UI-state (display swiatlo1)
                           (relation-asserted  swiatlo1)
                           (valid-answers tak nie))))
    (defrule nieezytt7 ""
     	(logical (swiatlo1 tak))
     	=>
     	(assert (UI-state (display temp)
                           (relation-asserted  temp)
                           (valid-answers tak nie))))
     (defrule nieezytt77 ""
     	(logical (swiatlo1 nie))
     	=>
     	(assert (UI-state (display temp)
                           (relation-asserted  temp)
                           (valid-answers tak nie))))
    (defrule nieezytt8 ""
     	(logical (temp tak))
     	=>
     	(assert (UI-state (display glowaa)
                           (relation-asserted  glowaa)
                           (valid-answers tak nie))))
     (defrule nieezytt88 ""
     	(logical (temp nie))
     	=>
     	(assert (UI-state (display glowaa)
                           (relation-asserted  glowaa)
                           (valid-answers tak nie))))
    (defrule nieezytt9 ""
     	(logical (glowaa tak))
     	=>
     	(assert (UI-state (display nosss)
                           (relation-asserted  nosss)
                           (valid-answers tak nie))))
     (defrule nieezytt99 ""
     	(logical (glowaa nie))
     	=>
     	(assert (UI-state (display nosss)
                           (relation-asserted  nosss)
                           (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;Arytmia serca
(defrule arrytmiaa ""
	(logical (tytul22 serceee))
	=>
	(assert (UI-state (display dusznoscc)
                      (relation-asserted dusznoscc)
                      (valid-answers tak nie))))

(defrule arrytmiaa1 ""
 	(logical (dusznoscc tak))
 	=>
 	(assert (UI-state (display bolee)
                       (relation-asserted  bolee)
                       (valid-answers tak nie))))
 (defrule arrytmiaa11 ""
 	(logical (dusznoscc nie))
 	=>
 	(assert (UI-state (display bolee)
                       (relation-asserted  bolee)
                       (valid-answers tak nie))))

 (defrule arrytmiaa2 ""
  	(logical (bolee tak))
  	=>
  	(assert (UI-state (display zaslabniecie)
                        (relation-asserted  zaslabniecie)
                        (valid-answers tak nie))))
  (defrule arrytmiaa22 ""
  	(logical (bolee nie))
  	=>
  	(assert (UI-state (display zaslabniecie)
                        (relation-asserted  zaslabniecie)
                        (valid-answers tak nie))))

   (defrule arrytmiaa3 ""
    	(logical (zaslabniecie tak))
    	=>
    	(assert (UI-state (display przytomnosc )
                          (relation-asserted  przytomnosc )
                          (valid-answers tak nie))))
    (defrule arrytmiaa33 ""
    	(logical (zaslabniecie nie))
    	=>
    	(assert (UI-state (display przytomnosc )
                          (relation-asserted  przytomnosc )
                          (valid-answers tak nie))))

    (defrule arrytmiaa4 ""
     	(logical (przytomnosc  tak))
     	=>
     	(assert (UI-state (display zawrotyy)
                           (relation-asserted  zawrotyy)
                           (valid-answers tak nie))))
     (defrule arrytmiaa44 ""
     	(logical (przytomnosc  nie))
     	=>
     	(assert (UI-state (display zawrotyy)
                           (relation-asserted  zawrotyy)
                           (valid-answers tak nie))))
    (defrule arrytmiaa5 ""
     	(logical (zawrotyy tak))
     	=>
     	(assert (UI-state (display lekii )
                           (relation-asserted  lekii )
                           (valid-answers tak nie))))
     (defrule arrytmiaa55 ""
     	(logical (zawrotyy nie))
     	=>
     	(assert (UI-state (display lekii )
                           (relation-asserted  lekii )
                           (valid-answers tak nie))))
    (defrule arrytmiaa6 ""
     	(logical (lekii  tak))
     	=>
     	(assert (UI-state (display pamiecc)
                           (relation-asserted  pamiecc)
                           (valid-answers tak nie))))
     (defrule arrytmiaa66 ""
     	(logical (lekii  nie))
     	=>
     	(assert (UI-state (display pamiecc)
                           (relation-asserted  pamiecc)
                           (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;;;;;
;;;przedzawałowe

(defrule zaawall ""
	(logical (tytul22 jednoslab))
	=>
	(assert (UI-state (display rozumienie)
                      (relation-asserted rozumienie)
                      (valid-answers tak nie))))

(defrule zaawall1 ""
 	(logical (rozumienie tak))
 	=>
 	(assert (UI-state (display niemowa)
                       (relation-asserted  niemowa)
                       (valid-answers tak nie))))
 (defrule zaawall11 ""
 	(logical (rozumienie nie))
 	=>
 	(assert (UI-state (display niemowa)
                       (relation-asserted  niemowa)
                       (valid-answers tak nie))))

 (defrule zaawall2 ""
  	(logical (niemowa tak))
  	=>
  	(assert (UI-state (display belkot)
                        (relation-asserted  belkot)
                        (valid-answers tak nie))))
  (defrule zaawall22 ""
  	(logical (niemowa nie))
  	=>
  	(assert (UI-state (display belkot)
                        (relation-asserted  belkot)
                        (valid-answers tak nie))))

   (defrule zaawall3 ""
    	(logical (belkot tak))
    	=>
    	(assert (UI-state (display widzenie1)
                          (relation-asserted  widzenie1)
                          (valid-answers tak nie))))
    (defrule zaawall33 ""
    	(logical (belkot nie))
    	=>
    	(assert (UI-state (display widzenie1)
                          (relation-asserted  widzenie1)
                          (valid-answers tak nie))))

    (defrule zaawall4 ""
     	(logical (widzenie1  tak))
     	=>
     	(assert (UI-state (display chod)
                           (relation-asserted  chod)
                           (valid-answers tak nie))))
     (defrule zaawall44 ""
     	(logical (widzenie1  nie))
     	=>
     	(assert (UI-state (display chod)
                           (relation-asserted  chod)
                           (valid-answers tak nie))))
    (defrule zaawall5 ""
     	(logical (chod tak))
     	=>
     	(assert (UI-state (display glowaaa)
                           (relation-asserted  glowaaa)
                           (valid-answers tak nie))))
     (defrule zaawall55 ""
     	(logical (chod nie))
     	=>
     	(assert (UI-state (display glowaaa)
                           (relation-asserted  glowaaa)
                           (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;;;;;;
;;;Depresja

(defrule deppresjaaaa ""
	(logical (tytul22 smutek1))
	=>
	(assert (UI-state (display placzliwosc)
                      (relation-asserted placzliwosc)
                      (valid-answers tak nie))))

(defrule deppresjaa1 ""
 	(logical (placzliwosc tak))
 	=>
 	(assert (UI-state (display zainteresowanie1)
                       (relation-asserted  zainteresowanie1)
                       (valid-answers tak nie))))
 (defrule deppresjaa11 ""
 	(logical (placzliwosc nie))
 	=>
 	(assert (UI-state (display zainteresowanie1)
                       (relation-asserted  zainteresowanie1)
                       (valid-answers tak nie))))

 (defrule deppresjaa2 ""
  	(logical (zainteresowanie1 tak))
  	=>
  	(assert (UI-state (display aktywnosc)
                        (relation-asserted  aktywnosc)
                        (valid-answers tak nie))))
  (defrule deppresjaa22 ""
  	(logical (zainteresowanie1 nie))
  	=>
  	(assert (UI-state (display aktywnosc)
                        (relation-asserted  aktywnosc)
                        (valid-answers tak nie))))

   (defrule deppresjaa3 ""
    	(logical (aktywnosc tak))
    	=>
    	(assert (UI-state (display zmeczenie2)
                          (relation-asserted  zmeczenie2)
                          (valid-answers tak nie))))
    (defrule deppresjaa33 ""
    	(logical (aktywnosc nie))
    	=>
    	(assert (UI-state (display zmeczenie2)
                          (relation-asserted  zmeczenie2)
                          (valid-answers tak nie))))

    (defrule deppresjaa4 ""
     	(logical (zmeczenie2  tak))
     	=>
     	(assert (UI-state (display apetyty)
                           (relation-asserted apetyty)
                           (valid-answers tak nie))))
     (defrule deppresjaa44 ""
     	(logical (zmeczenie2  nie))
     	=>
     	(assert (UI-state (display apetyty)
                           (relation-asserted  apetyty)
                           (valid-answers tak nie))))
    (defrule deppresjaa5 ""
     	(logical (apetyty tak))
     	=>
     	(assert (UI-state (display senn)
                           (relation-asserted  senn)
                           (valid-answers tak nie))))
     (defrule deppresjaa55 ""
     	(logical (apetyty nie))
     	=>
     	(assert (UI-state (display senn)
                           (relation-asserted  senn)
                           (valid-answers tak nie))))


      (defrule deppresjaa6 ""
       	(logical (senn tak))
       	=>
       	(assert (UI-state (display niepokoj)
                             (relation-asserted  niepokoj)
                             (valid-answers tak nie))))
       (defrule deppresjaa66 ""
       	(logical (senn nie))
       	=>
       	(assert (UI-state (display niepokoj)
                             (relation-asserted  niepokoj)
                             (valid-answers tak nie))))
      (defrule deppresjaa7 ""
       	(logical (niepokoj tak))
       	=>
       	(assert (UI-state (display koncenctracja)
                             (relation-asserted  koncenctracja)
                             (valid-answers tak nie))))
       (defrule deppresjaa77 ""
       	(logical (niepokoj nie))
       	=>
       	(assert (UI-state (display koncenctracja)
                             (relation-asserted  koncenctracja)
                             (valid-answers tak nie))))
      (defrule deppresjaa8 ""
       	(logical (koncenctracja tak))
       	=>
       	(assert (UI-state (display napiecie)
                             (relation-asserted  napiecie)
                             (valid-answers tak nie))))
       (defrule deppresjaa88 ""
       	(logical (koncenctracja nie))
       	=>
       	(assert (UI-state (display napiecie)
                             (relation-asserted  napiecie)
                             (valid-answers tak nie))))
     (defrule deppresjaa9 ""
      	(logical (napiecie tak))
      	=>
      	(assert (UI-state (display bezuzytecznosc)
                            (relation-asserted  bezuzytecznosc)
                            (valid-answers tak nie))))
      (defrule deppresjaa99 ""
      	(logical (napiecie nie))
      	=>
      	(assert (UI-state (display bezuzytecznosc)
                            (relation-asserted  bezuzytecznosc)
                            (valid-answers tak nie))))
     (defrule deppresjaa10 ""
      	(logical (bezuzytecznosc tak))
      	=>
      	(assert (UI-state (display samobojstwo)
                            (relation-asserted  samobojstwo)
                            (valid-answers tak nie))))
      (defrule deppresjaa101 ""
      	(logical (bezuzytecznosc nie))
      	=>
      	(assert (UI-state (display samobojstwo)
                            (relation-asserted  samobojstwo)
                            (valid-answers tak nie))))
      (defrule deppresjaa11 ""
       	(logical (samobojstwo tak))
       	=>
       	(assert (UI-state (display bole)
                             (relation-asserted  bole)
                             (valid-answers tak nie))))
       (defrule deppresjaa111 ""
       	(logical (samobojstwo nie))
       	=>
       	(assert (UI-state (display bole)
                             (relation-asserted  bole)
                             (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hashimoto

(defrule hashhimotoo ""
	(logical (tytul22 zimno))
	=>
	(assert (UI-state (display zmeczeniee)
                      (relation-asserted zmeczeniee)
                      (valid-answers tak nie))))

      (defrule hashhimotoo1 ""
       	(logical (zmeczeniee tak))
       	=>
       	(assert (UI-state (display depresjaa)
                             (relation-asserted  depresjaa)
                             (valid-answers tak nie))))
       (defrule hashhimotoo11 ""
       	(logical (zmeczeniee nie))
       	=>
       	(assert (UI-state (display depresjaa)
                             (relation-asserted  depresjaa)
                             (valid-answers tak nie))))
      (defrule hashhimotoo2 ""
       	(logical (depresjaa tak))
       	=>
       	(assert (UI-state (display pamieccc)
                             (relation-asserted  pamieccc)
                             (valid-answers tak nie))))
       (defrule hashhimotoo22 ""
       	(logical (depresjaa nie))
       	=>
       	(assert (UI-state (display pamieccc)
                             (relation-asserted  pamieccc)
                             (valid-answers tak nie))))
       (defrule hashhimotoo3 ""
        	(logical (pamieccc tak))
        	=>
        	(assert (UI-state (display masaa)
                              (relation-asserted  masaa)
                              (valid-answers tak nie))))
        (defrule hashhimotoo33 ""
        	(logical (pamieccc nie))
        	=>
        	(assert (UI-state (display masaa)
                              (relation-asserted  masaa)
                              (valid-answers tak nie))))
       (defrule hashhimotoo4 ""
        	(logical (masaa tak))
        	=>
        	(assert (UI-state (display zaparcia)
                              (relation-asserted  zaparcia)
                              (valid-answers tak nie))))
        (defrule hashhimotoo44 ""
        	(logical (masaa nie))
        	=>
        	(assert (UI-state (display zaparcia)
                              (relation-asserted  zaparcia)
                              (valid-answers tak nie))))
        (defrule hashhimotoo5 ""
         	(logical (zaparcia tak))
         	=>
         	(assert (UI-state (display niskiecis)
                               (relation-asserted  niskiecis)
                               (valid-answers tak nie))))
         (defrule hashhimotoo55 ""
         	(logical (zaparcia nie))
         	=>
         	(assert (UI-state (display niskiecis)
                               (relation-asserted  niskiecis)
                               (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;
;;;Nadczynnosc
(defrule naddczynnosc ""
	(logical (tytul22 zadyszka))
	=>
	(assert (UI-state (display oslabienie)
                      (relation-asserted oslabienie)
                      (valid-answers tak nie))))

      (defrule naddczynnosc1 ""
       	(logical (oslabienie tak))
       	=>
       	(assert (UI-state (display kolataniee )
                             (relation-asserted  kolataniee )
                             (valid-answers tak nie))))
       (defrule naddczynnosc11 ""
       	(logical (oslabienie nie))
       	=>
       	(assert (UI-state (display kolataniee )
                             (relation-asserted  kolataniee )
                             (valid-answers tak nie))))
      (defrule naddczynnosc2 ""
       	(logical (kolataniee tak))
       	=>
       	(assert (UI-state (display gorac)
                             (relation-asserted  gorac)
                             (valid-answers tak nie))))
       (defrule naddczynnosc22 ""
       	(logical (kolataniee nie))
       	=>
       	(assert (UI-state (display gorac)
                             (relation-asserted  gorac)
                             (valid-answers tak nie))))
       (defrule naddczynnosc3 ""
        	(logical (gorac tak))
        	=>
        	(assert (UI-state (display potliwosc)
                              (relation-asserted  potliwosc)
                              (valid-answers tak nie))))
        (defrule naddczynnosc33 ""
        	(logical (gorac nie))
        	=>
        	(assert (UI-state (display potliwosc)
                              (relation-asserted  potliwosc)
                              (valid-answers tak nie))))
       (defrule naddczynnosc4 ""
        	(logical (potliwosc tak))
        	=>
        	(assert (UI-state (display nerwowosc)
                              (relation-asserted  nerwowosc)
                              (valid-answers tak nie))))
        (defrule naddczynnosc44 ""
        	(logical (potliwosc nie))
        	=>
        	(assert (UI-state (display nerwowosc)
                              (relation-asserted  nerwowosc)
                              (valid-answers tak nie))))
        (defrule naddczynnosc5 ""
         	(logical (nerwowosc tak))
         	=>
         	(assert (UI-state (display maasa)
                               (relation-asserted  maasa)
                               (valid-answers tak nie))))
         (defrule naddczynnosc55 ""
         	(logical (nerwowosc nie))
         	=>
         	(assert (UI-state (display maasa)
                               (relation-asserted  maasa)
                               (valid-answers tak nie))))
        (defrule naddczynnosc6 ""
         	(logical (maasa tak))
         	=>
         	(assert (UI-state (display migotanie)
                               (relation-asserted  migotanie)
                               (valid-answers tak nie))))
         (defrule naddczynnosc66 ""
         	(logical (maasa nie))
         	=>
         	(assert (UI-state (display migotanie)
                               (relation-asserted  migotanie)
                               (valid-answers tak nie))))
         (defrule naddczynnosc7 ""
          	(logical (migotanie tak))
          	=>
          	(assert (UI-state (display miesiaczki)
                                (relation-asserted  miesiaczki)
                                (valid-answers tak nie))))
          (defrule naddczynnosc77 ""
          	(logical (migotanie nie))
          	=>
          	(assert (UI-state (display miesiaczki)
                                (relation-asserted  miesiaczki)
                                (valid-answers tak nie))))
          (defrule naddczynnosc8 ""
           	(logical (miesiaczki tak))
           	=>
           	(assert (UI-state (display biegunki)
                                 (relation-asserted  biegunki)
                                 (valid-answers tak nie))))
           (defrule naddczynnosc88 ""
           	(logical (miesiaczki nie))
           	=>
           	(assert (UI-state (display biegunki)
                                 (relation-asserted  biegunki)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;
;;;Otepienie
(defrule ootepienieee ""
	(logical (tytul22 pamiecsw))
	=>
	(assert (UI-state (display info)
                      (relation-asserted info)
                      (valid-answers tak nie))))


      (defrule ootepienieee4 ""
        	(logical (info tak))
        	=>
        	(assert (UI-state (display zapominanie)
                              (relation-asserted  zapominanie)
                              (valid-answers tak nie))))
        (defrule ootepienieee44 ""
        	(logical (info nie))
        	=>
        	(assert (UI-state (display zapominanie)
                              (relation-asserted  zapominanie)
                              (valid-answers tak nie))))
        (defrule ootepienieee5 ""
         	(logical (zapominanie tak))
         	=>
         	(assert (UI-state (display zainter)
                               (relation-asserted  zainter)
                               (valid-answers tak nie))))
         (defrule ootepienieee55 ""
         	(logical (zapominanie nie))
         	=>
         	(assert (UI-state (display zainter)
                               (relation-asserted  zainter)
                               (valid-answers tak nie))))
        (defrule ootepienieee6 ""
         	(logical (zainter tak))
         	=>
         	(assert (UI-state (display hustawka)
                               (relation-asserted  hustawka)
                               (valid-answers tak nie))))
         (defrule ootepienieee66 ""
         	(logical (zainter nie))
         	=>
         	(assert (UI-state (display hustawka)
                               (relation-asserted  hustawka)
                               (valid-answers tak nie))))
         (defrule ootepienieee7 ""
          	(logical (hustawka tak))
          	=>
          	(assert (UI-state (display rozpoznawanie)
                                (relation-asserted  rozpoznawanie)
                                (valid-answers tak nie))))
          (defrule ootepienieee77 ""
          	(logical (hustawka nie))
          	=>
          	(assert (UI-state (display rozpoznawanie)
                                (relation-asserted  rozpoznawanie)
                                (valid-answers tak nie))))
          (defrule ootepienieee8 ""
           	(logical (rozpoznawanie tak))
           	=>
           	(assert (UI-state (display czynnosci)
                                 (relation-asserted  czynnosci)
                                 (valid-answers tak nie))))
           (defrule ootepienieee88 ""
           	(logical (rozpoznawanie nie))
           	=>
           	(assert (UI-state (display czynnosci)
                                 (relation-asserted  czynnosci)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;
;;;SM
(defrule stwardnienieroz ""
	(logical (tytul22 oczko))
	=>
	(assert (UI-state (display ostrosc)
                      (relation-asserted ostrosc)
                      (valid-answers tak nie))))

      (defrule stwardnienieroz4 ""
        	(logical (ostrosc tak))
        	=>
        	(assert (UI-state (display zawrroty)
                              (relation-asserted  zawrroty)
                              (valid-answers tak nie))))
        (defrule stwardnienieroz44 ""
        	(logical (ostrosc nie))
        	=>
        	(assert (UI-state (display zawrroty)
                              (relation-asserted  zawrroty)
                              (valid-answers tak nie))))
        (defrule stwardnienieroz5 ""
         	(logical (zawrroty tak))
         	=>
         	(assert (UI-state (display ruch)
                               (relation-asserted  ruch)
                               (valid-answers tak nie))))
         (defrule stwardnienieroz55 ""
         	(logical (zawrroty nie))
         	=>
         	(assert (UI-state (display ruch)
                               (relation-asserted  ruch)
                               (valid-answers tak nie))))
        (defrule stwardnienieroz6 ""
         	(logical (ruch tak))
         	=>
         	(assert (UI-state (display oslab)
                               (relation-asserted  oslab)
                               (valid-answers tak nie))))
         (defrule stwardnienieroz66 ""
         	(logical (ruch nie))
         	=>
         	(assert (UI-state (display oslab)
                               (relation-asserted  oslab)
                               (valid-answers tak nie))))
         (defrule stwardnienieroz7 ""
          	(logical (oslab tak))
          	=>
          	(assert (UI-state (display czucie)
                                (relation-asserted  czucie)
                                (valid-answers tak nie))))
          (defrule stwardnienieroz77 ""
          	(logical (oslab nie))
          	=>
          	(assert (UI-state (display czucie)
                                (relation-asserted  czucie)
                                (valid-answers tak nie))))
          (defrule stwardnienieroz8 ""
           	(logical (czucie tak))
           	=>
           	(assert (UI-state (display drzeniee)
                                 (relation-asserted  drzeniee)
                                 (valid-answers tak nie))))
           (defrule stwardnienieroz88 ""
           	(logical (czucie nie))
           	=>
           	(assert (UI-state (display drzeniee)
                                 (relation-asserted  drzeniee)
                                 (valid-answers tak nie))))
          (defrule stwardnienieroz9 ""
           	(logical (drzeniee tak))
           	=>
           	(assert (UI-state (display pamieec)
                                 (relation-asserted  pamieec)
                                 (valid-answers tak nie))))
           (defrule stwardnienieroz99 ""
           	(logical (drzeniee nie))
           	=>
           	(assert (UI-state (display pamieec)
                                 (relation-asserted  pamieec)
                                 (valid-answers tak nie))))
           (defrule stwardnienieroz10 ""
            	(logical (pamieec tak))
            	=>
            	(assert (UI-state (display depre)
                                  (relation-asserted  depre)
                                  (valid-answers tak nie))))
            (defrule stwardnienieroz101 ""
            	(logical (pamieec nie))
            	=>
            	(assert (UI-state (display depre)
                                  (relation-asserted  depre)
                                  (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Zapalenie miesnia sercowego
(defrule zapaleniemserc ""
	(logical (tytul23 bolkl))
	=>
	(assert (UI-state (display bicieserca )
                      (relation-asserted bicieserca )
                      (valid-answers tak nie))))

        (defrule zapaleniemserc5 ""
         	(logical (bicieserca tak))
         	=>
         	(assert (UI-state (display duusznosc)
                               (relation-asserted  duusznosc)
                               (valid-answers tak nie))))
         (defrule zapaleniemserc55 ""
         	(logical (bicieserca nie))
         	=>
         	(assert (UI-state (display duusznosc)
                               (relation-asserted  duusznosc)
                               (valid-answers tak nie))))
        (defrule zapaleniemserc6 ""
         	(logical (duusznosc tak))
         	=>
         	(assert (UI-state (display zmeczeenie)
                               (relation-asserted  zmeczeenie)
                               (valid-answers tak nie))))
         (defrule zapaleniemserc66 ""
         	(logical (duusznosc nie))
         	=>
         	(assert (UI-state (display zmeczeenie)
                               (relation-asserted  zmeczeenie)
                               (valid-answers tak nie))))
         (defrule zapaleniemserc7 ""
          	(logical (zmeczeenie tak))
          	=>
          	(assert (UI-state (display obrzek)
                                (relation-asserted  obrzek)
                                (valid-answers tak nie))))
          (defrule zapaleniemserc77 ""
          	(logical (zmeczeenie nie))
          	=>
          	(assert (UI-state (display obrzek)
                                (relation-asserted  obrzek)
                                (valid-answers tak nie))))
          (defrule zapaleniemserc8 ""
           	(logical (obrzek tak))
           	=>
           	(assert (UI-state (display bool)
                                 (relation-asserted  bool)
                                 (valid-answers tak nie))))
           (defrule zapaleniemserc88 ""
           	(logical (obrzek nie))
           	=>
           	(assert (UI-state (display bool)
                                 (relation-asserted  bool)
                                 (valid-answers tak nie))))
          (defrule zapaleniemserc9 ""
           	(logical (bool tak))
           	=>
           	(assert (UI-state (display biegu)
                                 (relation-asserted  biegu)
                                 (valid-answers tak nie))))
           (defrule zapaleniemserc99 ""
           	(logical (bool nie))
           	=>
           	(assert (UI-state (display biegu)
                                 (relation-asserted  biegu)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Niewydolnosc serca
(defrule niewydolnosccsercaa ""
	(logical (tytul23 wysilek))
	=>
	(assert (UI-state (display duusznoscc)
                      (relation-asserted duusznoscc)
                      (valid-answers tak nie))))


        (defrule niewydolnosccsercaa5 ""
         	(logical (duusznoscc tak))
         	=>
         	(assert (UI-state (display kaaszell)
                               (relation-asserted  kaaszell)
                               (valid-answers tak nie))))
         (defrule niewydolnosccsercaa55 ""
         	(logical (duusznoscc nie))
         	=>
         	(assert (UI-state (display kaaszell)
                               (relation-asserted  kaaszell)
                               (valid-answers tak nie))))
        (defrule niewydolnosccsercaa6 ""
         	(logical (kaaszell tak))
         	=>
         	(assert (UI-state (display obrzeki)
                               (relation-asserted  obrzeki)
                               (valid-answers tak nie))))
         (defrule niewydolnosccsercaa66 ""
         	(logical (kaaszell nie))
         	=>
         	(assert (UI-state (display obrzeki)
                               (relation-asserted  obrzeki)
                               (valid-answers tak nie))))
         (defrule niewydolnosccsercaa7 ""
          	(logical (obrzeki tak))
          	=>
          	(assert (UI-state (display bolbrzuch)
                                (relation-asserted  bolbrzuch)
                                (valid-answers tak nie))))
          (defrule niewydolnosccsercaa77 ""
          	(logical (obrzeki nie))
          	=>
          	(assert (UI-state (display bolbrzuch)
                                (relation-asserted  bolbrzuch)
                                (valid-answers tak nie))))
          (defrule niewydolnosccsercaa8 ""
           	(logical (bolbrzuch tak))
           	=>
           	(assert (UI-state (display bladosc)
                                 (relation-asserted  bladosc)
                                 (valid-answers tak nie))))
           (defrule niewydolnosccsercaa88 ""
           	(logical (bolbrzuch nie))
           	=>
           	(assert (UI-state (display bladosc)
                                 (relation-asserted  bladosc)
                                 (valid-answers tak nie))))
          (defrule niewydolnosccsercaa9 ""
           	(logical (bladosc tak))
           	=>
           	(assert (UI-state (display potliwoscc )
                                 (relation-asserted  potliwoscc )
                                 (valid-answers tak nie))))
           (defrule niewydolnosccsercaa99 ""
           	(logical (bladosc nie))
           	=>
           	(assert (UI-state (display potliwoscc )
                                 (relation-asserted  potliwoscc )
                                 (valid-answers tak nie))))
          (defrule niewydolnosccsercaa10 ""
            (logical (potliwoscc tak))
             =>
             (assert (UI-state (display tachykardia )
                                   (relation-asserted  tachykardia )
                                   (valid-answers tak nie))))
          (defrule niewydolnosccsercaa101 ""
        	(logical (potliwoscc nie))
           =>
           (assert (UI-state (display tachykardia )
                              (relation-asserted  tachykardia )
                              (valid-answers tak nie))))
            (defrule niewydolnosccsercaa11 ""
           	(logical (tachykardia  tak))
           	=>
           	(assert (UI-state (display cisnienie)
                                 (relation-asserted  cisnienie)
                                 (valid-answers tak nie))))
           (defrule niewydolnosccsercaa111 ""
           	(logical (tachykardia  nie))
           	=>
           	(assert (UI-state (display cisnienie)
                                 (relation-asserted  cisnienie)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Zapalenie zatok przynosowych
(defrule zaapalenieezatokk ""
	(logical (tytul23 wyciek))
	=>
	(assert (UI-state (display zatkany)
                      (relation-asserted zatkany)
                      (valid-answers tak nie))))

        (defrule zaapalenieezatokk5 ""
         	(logical (zatkany tak))
         	=>
         	(assert (UI-state (display kasz)
                               (relation-asserted  kasz)
                               (valid-answers tak nie))))
         (defrule zaapalenieezatokk55 ""
         	(logical (zatkany nie))
         	=>
         	(assert (UI-state (display kasz)
                               (relation-asserted  kasz)
                               (valid-answers tak nie))))
        (defrule zaapalenieezatokk6 ""
         	(logical (kasz tak))
         	=>
         	(assert (UI-state (display drap)
                               (relation-asserted  drap)
                               (valid-answers tak nie))))
         (defrule zaapalenieezatokk66 ""
         	(logical (kasz nie))
         	=>
         	(assert (UI-state (display drap)
                               (relation-asserted  drap)
                               (valid-answers tak nie))))
         (defrule zaapalenieezatokk7 ""
          	(logical (drap tak))
          	=>
          	(assert (UI-state (display wecch)
                                (relation-asserted  wecch)
                                (valid-answers tak nie))))
          (defrule zaapalenieezatokk77 ""
          	(logical (drap nie))
          	=>
          	(assert (UI-state (display wecch)
                                (relation-asserted  wecch)
                                (valid-answers tak nie))))
          (defrule zaapalenieezatokk8 ""
           	(logical (wecch tak))
           	=>
           	(assert (UI-state (display gloowa)
                                 (relation-asserted  gloowa)
                                 (valid-answers tak nie))))
           (defrule zaapalenieezatokk88 ""
           	(logical (wecch nie))
           	=>
           	(assert (UI-state (display gloowa)
                                 (relation-asserted  gloowa)
                                 (valid-answers tak nie))))
          (defrule zaapalenieezatokk9 ""
           	(logical (gloowa tak))
           	=>
           	(assert (UI-state (display goracz)
                                 (relation-asserted  goracz )
                                 (valid-answers tak nie))))
           (defrule zaapalenieezatokk99 ""
           	(logical (gloowa nie))
           	=>
           	(assert (UI-state (display goracz )
                                 (relation-asserted  goracz )
                                 (valid-answers tak nie))))
          (defrule zaapalenieezatokk10 ""
            (logical (goracz  tak))
             =>
             (assert (UI-state (display zaczerwienie)
                                   (relation-asserted  zaczerwienie)
                                   (valid-answers tak nie))))
          (defrule zaapalenieezatokk101 ""
        	(logical (goracz  nie))
           =>
           (assert (UI-state (display zaczerwienie)
                              (relation-asserted  zaczerwienie)
                              (valid-answers tak nie))))
            (defrule zaapalenieezatokk11 ""
           	(logical (zaczerwienie tak))
           	=>
           	(assert (UI-state (display powieeki)
                                 (relation-asserted  powieeki)
                                 (valid-answers tak nie))))
           (defrule zaapalenieezatokk111 ""
           	(logical (zaczerwienie  nie))
           	=>
           	(assert (UI-state (display powieeki)
                                 (relation-asserted  powieeki)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;
#Ostre zapalenie gardla
(defrule zaapalenieegardlaa ""
	(logical (tytul23 samopocz))
	=>
	(assert (UI-state (display gard)
                      (relation-asserted gard)
                      (valid-answers tak nie))))

        (defrule zaapalenieegardlaa5 ""
         	(logical (gard tak))
         	=>
         	(assert (UI-state (display nudnoscii)
                               (relation-asserted  nudnoscii)
                               (valid-answers tak nie))))
         (defrule zaapalenieegardlaa55 ""
         	(logical (gard nie))
         	=>
         	(assert (UI-state (display nudnoscii)
                               (relation-asserted  nudnoscii)
                               (valid-answers tak nie))))
        (defrule zaapalenieegardlaa6 ""
         	(logical (nudnoscii tak))
         	=>
         	(assert (UI-state (display gor)
                               (relation-asserted  gor)
                               (valid-answers tak nie))))
         (defrule zaapalenieegardlaa66 ""
         	(logical (nudnoscii nie))
         	=>
         	(assert (UI-state (display gor)
                               (relation-asserted  gor)
                               (valid-answers tak nie))))
         (defrule zaapalenieegardlaa7 ""
          	(logical (gor tak))
          	=>
          	(assert (UI-state (display obrzekgardla)
                                (relation-asserted  obrzekgardla)
                                (valid-answers tak nie))))
          (defrule zaapalenieegardlaa77 ""
          	(logical (gor nie))
          	=>
          	(assert (UI-state (display obrzekgardla)
                                (relation-asserted  obrzekgardla)
                                (valid-answers tak nie))))
          (defrule zaapalenieegardlaa8 ""
           	(logical (obrzekgardla tak))
           	=>
           	(assert (UI-state (display migdal)
                                 (relation-asserted  migdal)
                                 (valid-answers tak nie))))
           (defrule zaapalenieegardlaa88 ""
           	(logical (obrzekgardla nie))
           	=>
           	(assert (UI-state (display migdal)
                                 (relation-asserted  migdal)
                                 (valid-answers tak nie))))
          (defrule zaapalenieegardlaa9 ""
           	(logical (migdal tak))
           	=>
           	(assert (UI-state (display nalot)
                                 (relation-asserted  nalot)
                                 (valid-answers tak nie))))
           (defrule zaapalenieegardlaa99 ""
           	(logical (migdal nie))
           	=>
           	(assert (UI-state (display nalot)
                                 (relation-asserted  nalot)
                                 (valid-answers tak nie))))
          (defrule zaapalenieegardlaa10 ""
            (logical (nalot  tak))
             =>
             (assert (UI-state (display wybroczyny)
                                   (relation-asserted  wybroczyny)
                                   (valid-answers tak nie))))
          (defrule zaapalenieegardlaa101 ""
        	(logical (nalot  nie))
           =>
           (assert (UI-state (display wybroczyny)
                              (relation-asserted  wybroczyny)
                              (valid-answers tak nie))))
            (defrule zaapalenieegardlaa11 ""
           	(logical (wybroczyny tak))
           	=>
           	(assert (UI-state (display wezly)
                                 (relation-asserted  wezly)
                                 (valid-answers tak nie))))
           (defrule zaapalenieegardlaa111 ""
           	(logical (wybroczyny  nie))
           	=>
           	(assert (UI-state (display wezly)
                                 (relation-asserted wezly)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;
#Zapalenie oskrzeli
(defrule zaapalenieeoskrzelii ""
	(logical (tytul23 gorr))
	=>
	(assert (UI-state (display bolm)
                      (relation-asserted bolm)
                      (valid-answers tak nie))))


        (defrule zaapalenieeoskrzelii5 ""
         	(logical (bolm tak))
         	=>
         	(assert (UI-state (display kaszz)
                               (relation-asserted  kaszz)
                               (valid-answers tak nie))))
         (defrule zaapalenieeoskrzelii55 ""
         	(logical (bolm nie))
         	=>
         	(assert (UI-state (display kaszz)
                               (relation-asserted  kaszz)
                               (valid-answers tak nie))))
        (defrule zaapalenieeoskrzelii6 ""
         	(logical (kaszz tak))
         	=>
         	(assert (UI-state (display wydzielinaa)
                               (relation-asserted  wydzielinaa)
                               (valid-answers tak nie))))
         (defrule zaapalenieeoskrzelii66 ""
         	(logical (kaszz nie))
         	=>
         	(assert (UI-state (display wydzielinaa)
                               (relation-asserted wydzielinaa)
                               (valid-answers tak nie))))
         (defrule zaapalenieeoskrzelii7 ""
          	(logical (wydzielinaa tak))
          	=>
          	(assert (UI-state (display swiszcz)
                                (relation-asserted  swiszcz)
                                (valid-answers tak nie))))
          (defrule zaapalenieeoskrzelii77 ""
          	(logical (wydzielinaa nie))
          	=>
          	(assert (UI-state (display swiszcz)
                                (relation-asserted  swiszcz)
                                (valid-answers tak nie))))
          (defrule zaapalenieeoskrzelii8 ""
           	(logical (swiszcz tak))
           	=>
           	(assert (UI-state (display rozb)
                                 (relation-asserted  rozb)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeoskrzelii88 ""
           	(logical (swiszcz nie))
           	=>
           	(assert (UI-state (display rozb)
                                 (relation-asserted  rozb)
                                 (valid-answers tak nie))))
          (defrule zaapalenieeoskrzelii9 ""
           	(logical (rozb tak))
           	=>
           	(assert (UI-state (display wykszt)
                                 (relation-asserted  wykszt)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeoskrzelii99 ""
           	(logical (rozb nie))
           	=>
           	(assert (UI-state (display wykszt)
                                 (relation-asserted  wykszt)
                                 (valid-answers tak nie))))
          (defrule zaapalenieeoskrzelii10 ""
            (logical (wykszt  tak))
             =>
             (assert (UI-state (display szmer)
                                   (relation-asserted  szmer)
                                   (valid-answers tak nie))))
          (defrule zaapalenieeoskrzelii101 ""
        	(logical (wykszt  nie))
           =>
           (assert (UI-state (display szmer)
                              (relation-asserted  szmer)
                              (valid-answers tak nie))))
            (defrule zaapalenieeoskrzelii11 ""
           	(logical (szmer tak))
           	=>
           	(assert (UI-state (display charczenie)
                                 (relation-asserted  charczenie)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeoskrzelii111 ""
           	(logical (szmer  nie))
           	=>
           	(assert (UI-state (display charczenie)
                                 (relation-asserted charczenie)
                                 (valid-answers tak nie))))
            (defrule zaapalenieeoskrzelii12 ""
           	(logical (charczenie tak))
           	=>
           	(assert (UI-state (display pieczenie)
                                 (relation-asserted  pieczenie)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeoskrzelii121 ""
           	(logical (charczenie  nie))
           	=>
           	(assert (UI-state (display pieczenie)
                                 (relation-asserted pieczenie)
                                 (valid-answers tak nie))))
             (defrule zaapalenieeoskrzelii13 ""
            	(logical (pieczenie tak))
            	=>
            	(assert (UI-state (display zlesamo)
                                  (relation-asserted  zlesamo)
                                  (valid-answers tak nie))))
            (defrule zaapalenieeoskrzelii131 ""
            	(logical (pieczenie  nie))
            	=>
            	(assert (UI-state (display zlesamo)
                                  (relation-asserted zlesamo)
                                  (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;
#Zapalenie pluc
(defrule zaapalenieeplucc ""
	(logical (tytul23 bolpluc))
	=>
	(assert (UI-state (display goor)
                      (relation-asserted goor)
                      (valid-answers tak nie))))


        (defrule zaapalenieeplucc5 ""
         	(logical (goor tak))
         	=>
         	(assert (UI-state (display kaasz)
                               (relation-asserted  kaasz)
                               (valid-answers tak nie))))
         (defrule zaapalenieeplucc55 ""
         	(logical (goor nie))
         	=>
         	(assert (UI-state (display kaasz)
                               (relation-asserted  kaasz)
                               (valid-answers tak nie))))
        (defrule zaapalenieeplucc6 ""
         	(logical (kaasz tak))
         	=>
         	(assert (UI-state (display bolgl)
                               (relation-asserted  bolgl)
                               (valid-answers tak nie))))
         (defrule zaapalenieeplucc66 ""
         	(logical (kaasz nie))
         	=>
         	(assert (UI-state (display bolgl)
                               (relation-asserted bolgl)
                               (valid-answers tak nie))))
         (defrule zaapalenieeplucc7 ""
          	(logical (bolgl tak))
          	=>
          	(assert (UI-state (display bolmiesni)
                                (relation-asserted  bolmiesni)
                                (valid-answers tak nie))))
          (defrule zaapalenieeplucc77 ""
          	(logical (bolgl nie))
          	=>
          	(assert (UI-state (display bolmiesni)
                                (relation-asserted  bolmiesni)
                                (valid-answers tak nie))))
          (defrule zaapalenieeplucc8 ""
           	(logical (bolmiesni tak))
           	=>
           	(assert (UI-state (display bolg)
                                 (relation-asserted bolg)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeplucc88 ""
           	(logical (bolmiesni nie))
           	=>
           	(assert (UI-state (display bolg)
                                 (relation-asserted bolg)
                                 (valid-answers tak nie))))
          (defrule zaapalenieeplucc9 ""
           	(logical (bolg tak))
           	=>
           	(assert (UI-state (display duszn)
                                 (relation-asserted  duszn)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeplucc99 ""
           	(logical (bolg nie))
           	=>
           	(assert (UI-state (display duszn)
                                 (relation-asserted  duszn)
                                 (valid-answers tak nie))))
          (defrule zaapalenieeplucc10 ""
            (logical (duszn tak))
             =>
             (assert (UI-state (display czestoscod)
                                   (relation-asserted  czestoscod)
                                   (valid-answers tak nie))))
          (defrule zaapalenieeplucc101 ""
        	(logical (duszn nie))
           =>
           (assert (UI-state (display czestoscod)
                              (relation-asserted czestoscod)
                              (valid-answers tak nie))))
            (defrule zaapalenieeplucc11 ""
           	(logical (czestoscod tak))
           	=>
           	(assert (UI-state (display szmerr)
                                 (relation-asserted szmerr)
                                 (valid-answers tak nie))))
           (defrule zaapalenieeplucc111 ""
           	(logical (czestoscod nie))
           	=>
           	(assert (UI-state (display szmerr)
                                 (relation-asserted szmerr)
                                 (valid-answers tak nie))))
            (defrule zaapalenieeplucc12 ""
           	(logical (szmerr tak))
           	=>
           	(assert (UI-state (display trzeszczenie )
                                 (relation-asserted trzeszczenie )
                                 (valid-answers tak nie))))
           (defrule zaapalenieeplucc121 ""
           	(logical (szmerr nie))
           	=>
           	(assert (UI-state (display trzeszczenie )
                                 (relation-asserted trzeszczenie )
                                 (valid-answers tak nie))))
             (defrule zaapalenieeplucc13 ""
            	(logical (trzeszczenie tak))
            	=>
            	(assert (UI-state (display opukiwanie )
                                  (relation-asserted  opukiwanie )
                                  (valid-answers tak nie))))
            (defrule zaapalenieeplucc131 ""
            	(logical (trzeszczenie  nie))
            	=>
            	(assert (UI-state (display opukiwanie )
                                  (relation-asserted opukiwanie )
                                  (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Choroba refluksowa przelyku
(defrule refflukss ""
	(logical (tytul23 zgaga))
	=>
	(assert (UI-state (display odbijanie)
                      (relation-asserted odbijanie)
                      (valid-answers tak nie))))

        (defrule refflukss5 ""
         	(logical (odbijanie tak))
         	=>
         	(assert (UI-state (display cofanie)
                               (relation-asserted  cofanie)
                               (valid-answers tak nie))))
         (defrule refflukss55 ""
         	(logical (odbijanie nie))
         	=>
         	(assert (UI-state (display cofanie)
                               (relation-asserted  cofanie)
                               (valid-answers tak nie))))
        (defrule refflukss6 ""
         	(logical (cofanie tak))
         	=>
         	(assert (UI-state (display polykanie)
                               (relation-asserted  polykanie)
                               (valid-answers tak nie))))
         (defrule refflukss66 ""
         	(logical (cofanie nie))
         	=>
         	(assert (UI-state (display polykanie)
                               (relation-asserted polykanie)
                               (valid-answers tak nie))))
         (defrule refflukss7 ""
          	(logical (polykanie tak))
          	=>
          	(assert (UI-state (display polykanie2)
                                (relation-asserted  polykanie2)
                                (valid-answers tak nie))))
          (defrule refflukss77 ""
          	(logical (polykanie nie))
          	=>
          	(assert (UI-state (display polykanie2)
                                (relation-asserted  polykanie2)
                                (valid-answers tak nie))))
          (defrule refflukss8 ""
           	(logical (polykanie2 tak))
           	=>
           	(assert (UI-state (display massa)
                                 (relation-asserted massa)
                                 (valid-answers tak nie))))
           (defrule refflukss88 ""
           	(logical (polykanie2 nie))
           	=>
           	(assert (UI-state (display massa)
                                 (relation-asserted massa)
                                 (valid-answers tak nie))))
          (defrule refflukss9 ""
           	(logical (massa tak))
           	=>
           	(assert (UI-state (display krwawienie)
                                 (relation-asserted  krwawienie)
                                 (valid-answers tak nie))))
           (defrule refflukss99 ""
           	(logical (massa nie))
           	=>
           	(assert (UI-state (display krwawienie)
                                 (relation-asserted krwawienie)
                                 (valid-answers tak nie))))
          (defrule refflukss10 ""
            (logical (krwawienie tak))
             =>
             (assert (UI-state (display chrypka)
                                   (relation-asserted  chrypka)
                                   (valid-answers tak nie))))
          (defrule refflukss101 ""
        	(logical (krwawienie nie))
           =>
           (assert (UI-state (display chrypka)
                              (relation-asserted chrypka)
                              (valid-answers tak nie))))
            (defrule refflukss11 ""
           	(logical (chrypka tak))
           	=>
           	(assert (UI-state (display suchykaszel)
                                 (relation-asserted suchykaszel)
                                 (valid-answers tak nie))))
           (defrule refflukss111 ""
           	(logical (chrypka nie))
           	=>
           	(assert (UI-state (display suchykaszel)
                                 (relation-asserted suchykaszel)
                                 (valid-answers tak nie))))
            (defrule refflukss12 ""
           	(logical (suchykaszel tak))
           	=>
           	(assert (UI-state (display swiszoddech)
                                 (relation-asserted swiszoddech)
                                 (valid-answers tak nie))))
           (defrule refflukss121 ""
           	(logical (suchykaszel nie))
           	=>
           	(assert (UI-state (display swiszoddech)
                                 (relation-asserted swiszoddech)
                                 (valid-answers tak nie))))
             (defrule refflukss13 ""
            	(logical (swiszoddech tak))
            	=>
            	(assert (UI-state (display klatka)
                                  (relation-asserted  klatka)
                                  (valid-answers tak nie))))
            (defrule refflukss131 ""
            	(logical (swiszoddech  nie))
            	=>
            	(assert (UI-state (display klatka)
                                  (relation-asserted klatka)
                                  (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Choroba Lesniowskiego Crohna
(defrule crrohnn ""
	(logical (tytul24 oslabienie2))
	=>
	(assert (UI-state (display goraczk)
                      (relation-asserted goraczk)
                      (valid-answers tak nie))))


        (defrule crrohnn5 ""
         	(logical (goraczk tak))
         	=>
         	(assert (UI-state (display losmas)
                               (relation-asserted  losmas)
                               (valid-answers tak nie))))
         (defrule crrohnn55 ""
         	(logical (goraczk nie))
         	=>
         	(assert (UI-state (display losmas)
                               (relation-asserted  losmas)
                               (valid-answers tak nie))))
        (defrule crrohnn6 ""
         	(logical (losmas tak))
         	=>
         	(assert (UI-state (display bieg)
                               (relation-asserted  bieg)
                               (valid-answers tak nie))))
         (defrule crrohnn66 ""
         	(logical (losmas nie))
         	=>
         	(assert (UI-state (display bieg)
                               (relation-asserted bieg)
                               (valid-answers tak nie))))
         (defrule crrohnn7 ""
          	(logical (bieg tak))
          	=>
          	(assert (UI-state (display brzuch)
                                (relation-asserted  brzuch)
                                (valid-answers tak nie))))
          (defrule crrohnn77 ""
          	(logical (bieg nie))
          	=>
          	(assert (UI-state (display brzuch)
                                (relation-asserted  brzuch)
                                (valid-answers tak nie))))
          (defrule crrohnn8 ""
           	(logical (brzuch tak))
           	=>
           	(assert (UI-state (display boldziasel)
                                 (relation-asserted boldziasel)
                                 (valid-answers tak nie))))
           (defrule crrohnn88 ""
           	(logical (brzuch nie))
           	=>
           	(assert (UI-state (display boldziasel)
                                 (relation-asserted boldziasel)
                                 (valid-answers tak nie))))
          (defrule crrohnn9 ""
           	(logical (boldziasel tak))
           	=>
           	(assert (UI-state (display owrzodzenie)
                                 (relation-asserted  owrzodzenie)
                                 (valid-answers tak nie))))
           (defrule crrohnn99 ""
           	(logical (boldziasel nie))
           	=>
           	(assert (UI-state (display owrzodzenie)
                                 (relation-asserted owrzodzenie)
                                 (valid-answers tak nie))))
          (defrule crrohnn10 ""
            (logical (owrzodzenie tak))
             =>
             (assert (UI-state (display wymiotyy)
                                   (relation-asserted  wymiotyy)
                                   (valid-answers tak nie))))
          (defrule crrohnn101 ""
        	(logical (owrzodzenie nie))
           =>
           (assert (UI-state (display wymiotyy)
                              (relation-asserted wymiotyy)
                              (valid-answers tak nie))))
            (defrule crrohnn11 ""
           	(logical (wymiotyy tak))
           	=>
           	(assert (UI-state (display sluz)
                                 (relation-asserted sluz)
                                 (valid-answers tak nie))))
           (defrule crrohnn111 ""
           	(logical (wymiotyy nie))
           	=>
           	(assert (UI-state (display sluz)
                                 (relation-asserted sluz)
                                 (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Niedokrwistosc

(defrule niedookrwiii ""
	(logical (tytul24 bladoscc))
	=>
	(assert (UI-state (display slab)
                      (relation-asserted slab)
                      (valid-answers tak nie))))

        (defrule niedookrwiii5 ""
         	(logical (slab tak))
         	=>
         	(assert (UI-state (display dusz)
                               (relation-asserted  dusz)
                               (valid-answers tak nie))))
         (defrule niedookrwiii55 ""
         	(logical (slab nie))
         	=>
         	(assert (UI-state (display dusz)
                               (relation-asserted  dusz)
                               (valid-answers tak nie))))
        (defrule niedookrwiii6 ""
         	(logical (dusz tak))
         	=>
         	(assert (UI-state (display glow)
                               (relation-asserted  glow)
                               (valid-answers tak nie))))
         (defrule niedookrwiii66 ""
         	(logical (dusz nie))
         	=>
         	(assert (UI-state (display glow)
                               (relation-asserted glow)
                               (valid-answers tak nie))))
         (defrule niedookrwiii7 ""
          	(logical (glow tak))
          	=>
          	(assert (UI-state (display szmeer)
                                (relation-asserted  szmeer)
                                (valid-answers tak nie))))
          (defrule niedookrwiii77 ""
          	(logical (glow nie))
          	=>
          	(assert (UI-state (display szmeer)
                                (relation-asserted szmeer)
                                (valid-answers tak nie))))
          (defrule niedookrwiii8 ""
           	(logical (szmeer tak))
           	=>
           	(assert (UI-state (display pieczeniee)
                                 (relation-asserted pieczeniee)
                                 (valid-answers tak nie))))
           (defrule niedookrwiii88 ""
           	(logical (szmeer nie))
           	=>
           	(assert (UI-state (display pieczeniee)
                                 (relation-asserted pieczeniee)
                                 (valid-answers tak nie))))
          (defrule niedookrwiii9 ""
           	(logical (pieczeniee tak))
           	=>
           	(assert (UI-state (display lamliwosc)
                                 (relation-asserted  lamliwosc)
                                 (valid-answers tak nie))))
           (defrule niedookrwiii99 ""
           	(logical (pieczeniee nie))
           	=>
           	(assert (UI-state (display lamliwosc)
                                 (relation-asserted lamliwosc)
                                 (valid-answers tak nie))))
          (defrule niedookrwiii10 ""
            (logical (lamliwosc tak))
             =>
             (assert (UI-state (display pazn)
                                   (relation-asserted  pazn)
                                   (valid-answers tak nie))))
          (defrule niedookrwiii101 ""
        	(logical (lamliwosc nie))
           =>
           (assert (UI-state (display pazn)
                              (relation-asserted pazn)
                              (valid-answers tak nie))))
            (defrule niedookrwiii11 ""
           	(logical (pazn tak))
           	=>
           	(assert (UI-state (display apetytt)
                                 (relation-asserted apetytt)
                                 (valid-answers tak nie))))
           (defrule niedookrwiii111 ""
           	(logical (pazn nie))
           	=>
           	(assert (UI-state (display apetytt)
                                 (relation-asserted apetytt)
                                 (valid-answers tak nie))))
             (defrule niedookrwiii12 ""
            	(logical (apetytt tak))
            	=>
            	(assert (UI-state (display zaparciaa)
                                  (relation-asserted zaparciaa)
                                  (valid-answers tak nie))))
            (defrule niedookrwiii121 ""
            	(logical (apetytt nie))
            	=>
            	(assert (UI-state (display zaparciaa)
                                  (relation-asserted zaparciaa)
                                  (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;
#Zapalenie trzustki

(defrule zapalenieeetrzustkii ""
	(logical (tytul24 silnybol))
	=>
	(assert (UI-state (display brzuchbol)
                      (relation-asserted brzuchbol)
                      (valid-answers tak nie))))

        (defrule zapalenieeetrzustkii5 ""
         	(logical (brzuchbol tak))
         	=>
         	(assert (UI-state (display wymiot)
                               (relation-asserted  wymiot)
                               (valid-answers tak nie))))
         (defrule zapalenieeetrzustkii55 ""
         	(logical (brzuchbol nie))
         	=>
         	(assert (UI-state (display wymiot)
                               (relation-asserted  wymiot)
                               (valid-answers tak nie))))
        (defrule zapalenieeetrzustkii6 ""
         	(logical (wymiot tak))
         	=>
         	(assert (UI-state (display wzdecia)
                               (relation-asserted  wzdecia)
                               (valid-answers tak nie))))
         (defrule zapalenieeetrzustkii66 ""
         	(logical (wymiot nie))
         	=>
         	(assert (UI-state (display wzdecia)
                               (relation-asserted wzdecia)
                               (valid-answers tak nie))))
         (defrule zapalenieeetrzustkii7 ""
          	(logical (wzdecia tak))
          	=>
          	(assert (UI-state (display twarz)
                                (relation-asserted  twarz)
                                (valid-answers tak nie))))
          (defrule zapalenieeetrzustkii77 ""
          	(logical (wzdecia nie))
          	=>
          	(assert (UI-state (display twarz)
                                (relation-asserted twarz)
                                (valid-answers tak nie))))
          (defrule zapalenieeetrzustkii8 ""
           	(logical (twarz tak))
           	=>
           	(assert (UI-state (display wstrzas)
                                 (relation-asserted wstrzas)
                                 (valid-answers tak nie))))
           (defrule zapalenieeetrzustkii88 ""
           	(logical (twarz nie))
           	=>
           	(assert (UI-state (display wstrzas)
                                 (relation-asserted wstrzas)
                                 (valid-answers tak nie))))
          (defrule zapalenieeetrzustkii9 ""
           	(logical (wstrzas tak))
           	=>
           	(assert (UI-state (display spadcisnienie)
                                 (relation-asserted  spadcisnienie)
                                 (valid-answers tak nie))))
           (defrule zapalenieeetrzustkii99 ""
           	(logical (wstrzas nie))
           	=>
           	(assert (UI-state (display spadcisnienie)
                                 (relation-asserted spadcisnienie)
                                 (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;
#Choroba Cushinga
(defrule cushhinggaa ""
	(logical (tytul24 przyrost))
	=>
	(assert (UI-state (display otyl)
                      (relation-asserted otyl)
                      (valid-answers tak nie))))

        (defrule cushhinggaa5 ""
         	(logical (otyl tak))
         	=>
         	(assert (UI-state (display nagro)
                               (relation-asserted  nagro)
                               (valid-answers tak nie))))
         (defrule cushhinggaa55 ""
         	(logical (otyl nie))
         	=>
         	(assert (UI-state (display nagro)
                               (relation-asserted  nagro)
                               (valid-answers tak nie))))
        (defrule cushhinggaa6 ""
         	(logical (nagro tak))
         	=>
         	(assert (UI-state (display rozstepy)
                               (relation-asserted  rozstepy)
                               (valid-answers tak nie))))
         (defrule cushhinggaa66 ""
         	(logical (nagro nie))
         	=>
         	(assert (UI-state (display rozstepy)
                               (relation-asserted rozstepy)
                               (valid-answers tak nie))))
         (defrule cushhinggaa7 ""
          	(logical (rozstepy tak))
          	=>
          	(assert (UI-state (display tradzik)
                                (relation-asserted  tradzik)
                                (valid-answers tak nie))))
          (defrule cushhinggaa77 ""
          	(logical (rozstepy nie))
          	=>
          	(assert (UI-state (display tradzik)
                                (relation-asserted tradzik)
                                (valid-answers tak nie))))
          (defrule cushhinggaa8 ""
           	(logical (tradzik tak))
           	=>
           	(assert (UI-state (display dep)
                                 (relation-asserted dep)
                                 (valid-answers tak nie))))
           (defrule cushhinggaa88 ""
           	(logical (tradzik nie))
           	=>
           	(assert (UI-state (display dep)
                                 (relation-asserted dep)
                                 (valid-answers tak nie))))
          (defrule cushhinggaa9 ""
           	(logical (dep tak))
           	=>
           	(assert (UI-state (display sennn)
                                 (relation-asserted  sennn)
                                 (valid-answers tak nie))))
           (defrule cushhinggaa99 ""
           	(logical (dep nie))
           	=>
           	(assert (UI-state (display sennn)
                                 (relation-asserted sennn)
                                 (valid-answers tak nie))))
          (defrule cushhinggaa10 ""
           	(logical (sennn tak))
           	=>
           	(assert (UI-state (display nadcisn)
                                 (relation-asserted  nadcisn)
                                 (valid-answers tak nie))))
           (defrule cushhinggaa11 ""
           	(logical (sennn nie))
           	=>
           	(assert (UI-state (display nadcisn)
                                 (relation-asserted nadcisn)
                                 (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;
#Hemofilia
(defrule hemooooo ""
	(logical (tytul24 krwaslu))
	=>
	(assert (UI-state (display krwadzia)
                      (relation-asserted krwadzia)
                      (valid-answers tak nie))))


        (defrule hemooooo5 ""
         	(logical (krwadzia tak))
         	=>
         	(assert (UI-state (display siniaki)
                               (relation-asserted  siniaki)
                               (valid-answers tak nie))))
         (defrule hemooooo55 ""
         	(logical (krwadzia nie))
         	=>
         	(assert (UI-state (display siniaki)
                               (relation-asserted  siniaki)
                               (valid-answers tak nie))))
        (defrule hemooooo6 ""
         	(logical (siniaki tak))
         	=>
         	(assert (UI-state (display chodzenie)
                               (relation-asserted chodzenie)
                               (valid-answers tak nie))))
         (defrule hemooooo66 ""
         	(logical (siniaki nie))
         	=>
         	(assert (UI-state (display chodzenie)
                               (relation-asserted chodzenie)
                               (valid-answers tak nie))))
         (defrule hemooooo7 ""
          	(logical (chodzenie tak))
          	=>
          	(assert (UI-state (display krwanos)
                                (relation-asserted krwanos)
                                (valid-answers tak nie))))
          (defrule hemooooo77 ""
          	(logical (chodzenie nie))
          	=>
          	(assert (UI-state (display krwanos)
                                (relation-asserted krwanos)
                                (valid-answers tak nie))))
          (defrule hemooooo8 ""
           	(logical (krwanos tak))
           	=>
           	(assert (UI-state (display infekcoddech)
                                 (relation-asserted infekcoddech)
                                 (valid-answers tak nie))))
           (defrule hemooooo88 ""
           	(logical (krwanos nie))
           	=>
           	(assert (UI-state (display infekcoddech)
                                 (relation-asserted infekcoddech)
                                 (valid-answers tak nie))))
          (defrule hemooooo9 ""
           	(logical (infekcoddech tak))
           	=>
           	(assert (UI-state (display trudnruch)
                                 (relation-asserted trudnruch)
                                 (valid-answers tak nie))))
           (defrule hemooooo99 ""
           	(logical (infekcoddech nie))
           	=>
           	(assert (UI-state (display trudnruch)
                                 (relation-asserted trudnruch)
                                 (valid-answers tak nie))))
          (defrule hemooooo10 ""
           	(logical (trudnruch tak))
           	=>
           	(assert (UI-state (display mrowienie)
                                 (relation-asserted mrowienie)
                                 (valid-answers tak nie))))
           (defrule hemooooo101 ""
           	(logical (trudnruch nie))
           	=>
           	(assert (UI-state (display mrowienie)
                                 (relation-asserted mrowienie)
                                 (valid-answers tak nie))))

          (defrule hemooooo11 ""
           	(logical (mrowienie tak))
           	=>
           	(assert (UI-state (display rozpieranie)
                                 (relation-asserted rozpieranie)
                                 (valid-answers tak nie))))
           (defrule hemooooo111 ""
           	(logical (mrowienie nie))
           	=>
           	(assert (UI-state (display rozpieranie)
                                 (relation-asserted rozpieranie)
                                 (valid-answers tak nie))))

           (defrule hemooooo12 ""
            	(logical (rozpieranie tak))
            	=>
            	(assert (UI-state (display cieplo)
                                  (relation-asserted cieplo)
                                  (valid-answers tak nie))))
            (defrule hemooooo121 ""
            	(logical (rozpieranie nie))
            	=>
            	(assert (UI-state (display cieplo)
                                  (relation-asserted cieplo)
                                  (valid-answers tak nie))))
           (defrule hemooooo103 ""
            	(logical (cieplo tak))
            	=>
            	(assert (UI-state (display staw)
                                  (relation-asserted staw)
                                  (valid-answers tak nie))))
            (defrule hemooooo131 ""
            	(logical (cieplo nie))
            	=>
            	(assert (UI-state (display staw)
                                  (relation-asserted staw)
                                  (valid-answers tak nie))))

           (defrule hemooooo14 ""
            	(logical (staw tak))
            	=>
            	(assert (UI-state (display sztyw)
                                  (relation-asserted sztyw)
                                  (valid-answers tak nie))))
            (defrule hemooooo141 ""
            	(logical (staw nie))
            	=>
            	(assert (UI-state (display sztyw)
                                  (relation-asserted sztyw)
                                  (valid-answers tak nie))))

           (defrule hemooooo15 ""
            	(logical (sztyw tak))
            	=>
            	(assert (UI-state (display przewbol)
                                  (relation-asserted przewbol)
                                  (valid-answers tak nie))))
            (defrule hemooooo151 ""
            	(logical (sztyw nie))
            	=>
            	(assert (UI-state (display przewbol)
                                  (relation-asserted przewbol)
                                  (valid-answers tak nie))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#Zaburzenia gospodarki wodnej
(defrule woddneejj ""
	(logical (tytul24 obnizcis))
	=>
	(assert (UI-state (display tachy)
                      (relation-asserted tachy)
                      (valid-answers tak nie))))

        (defrule woddneejj5 ""
         	(logical (tachy tak))
         	=>
         	(assert (UI-state (display skapomocz)
                               (relation-asserted  skapomocz)
                               (valid-answers tak nie))))
         (defrule woddneejj55 ""
         	(logical (tachy nie))
         	=>
         	(assert (UI-state (display skapomocz)
                               (relation-asserted skapomocz)
                               (valid-answers tak nie))))
        (defrule woddneejj6 ""
         	(logical (skapomocz tak))
         	=>
         	(assert (UI-state (display suchoscblon)
                               (relation-asserted suchoscblon)
                               (valid-answers tak nie))))
         (defrule woddneejj66 ""
         	(logical (skapomocz nie))
         	=>
         	(assert (UI-state (display suchoscblon)
                               (relation-asserted suchoscblon)
                               (valid-answers tak nie))))
         (defrule woddneejj7 ""
          	(logical (suchoscblon tak))
          	=>
          	(assert (UI-state (display poty)
                                (relation-asserted  poty)
                                (valid-answers tak nie))))
          (defrule woddneejj77 ""
          	(logical (suchoscblon nie))
          	=>
          	(assert (UI-state (display poty)
                                (relation-asserted poty)
                                (valid-answers tak nie))))
          (defrule woddneejj8 ""
           	(logical (poty tak))
           	=>
           	(assert (UI-state (display kreatynina)
                                 (relation-asserted kreatynina)
                                 (valid-answers tak nie))))
           (defrule woddneejj88 ""
           	(logical (poty nie))
           	=>
           	(assert (UI-state (display kreatynina)
                                 (relation-asserted kreatynina)
                                 (valid-answers tak nie))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;NERWICOWE
(defrule start3 ""
	(logical (start nerwicowe))
	=>
	(assert (UI-state (display tytul2)
                      (relation-asserted tytul2)
                      (valid-answers natretnemysli napieciowy mania brakkontaktu halucynajce brakstrachu strach))))

(defrule natretnemysli ""
	(logical (tytul2 natretnemysli))
	=>
	(assert (UI-state (display czynnoscnatretne)
                      (relation-asserted czynnoscnatretne)
                      (valid-answers tak nie))))

(defrule czynnoscnatretne ""
	(logical (czynnoscnatretne tak))
	=>
	(assert (UI-state (display lekowe)
                      (relation-asserted lekowe)
                      (valid-answers tak nie))))
(defrule czynnoscnatretne1 ""
	(logical (czynnoscnatretne nie))
	=>
	(assert (UI-state (display lekowe)
                      (relation-asserted lekowe)
                      (valid-answers tak nie))))

(defrule lekowe ""
	(logical (lekowe tak))
	=>
	(assert (UI-state (display odepresji)
                      (relation-asserted odepresji)
                      (valid-answers tak nie))))
(defrule lekowe1 ""
	(logical (lekowe nie))
	=>
	(assert (UI-state (display odepresji)
                      (relation-asserted odepresji)
                      (valid-answers tak nie))))

(defrule odepresji ""
	(logical (lekowe tak))
	=>
	(assert (UI-state (display tiki)
                      (relation-asserted tiki)
                      (valid-answers tak nie))))
(defrule odepresji1 ""
	(logical (lekowe nie))
	=>
	(assert (UI-state (display tiki)
                      (relation-asserted tiki)
                      (valid-answers tak nie))))

(defrule napieciowy ""
	(logical (tytul2 napieciowy))
	=>
	(assert (UI-state (display bzoladka)
                      (relation-asserted bzoladka)
                      (valid-answers tak nie))))
(defrule bzoladka ""
	(logical (bzoladka tak))
	=>
	(assert (UI-state (display sercee)
                      (relation-asserted sercee)
                      (valid-answers tak nie))))
(defrule bzoladka1 ""
	(logical (bzoladka nie))
	=>
	(assert (UI-state (display sercee)
                      (relation-asserted sercee)
                      (valid-answers tak nie))))
(defrule sercee ""
	(logical (sercee tak))
	=>
	(assert (UI-state (display kregoslup)
                      (relation-asserted kregoslup)
                      (valid-answers tak nie))))
(defrule sercee1 ""
	(logical (sercee nie))
	=>
	(assert (UI-state (display kregoslup)
                      (relation-asserted kregoslup)
                      (valid-answers tak nie))))
(defrule kregoslup ""
	(logical (kregoslup tak))
	=>
	(assert (UI-state (display drzenie)
                      (relation-asserted drzenie)
                      (valid-answers tak nie))))
(defrule kregoslup1 ""
	(logical (kregoslup nie))
	=>
	(assert (UI-state (display drzenie)
                      (relation-asserted drzenie)
                      (valid-answers tak nie))))
(defrule drzenie ""
	(logical (drzenie tak))
	=>
	(assert (UI-state (display kolatanie)
                      (relation-asserted kolatanie)
                      (valid-answers tak nie))))
(defrule drzenie1 ""
	(logical (drzenie nie))
	=>
	(assert (UI-state (display kolatanie)
                      (relation-asserted kolatanie)
                      (valid-answers tak nie))))
(defrule kolatanie ""
	(logical (kolatanie tak))
	=>
	(assert (UI-state (display wybuchy)
                      (relation-asserted wybuchy)
                      (valid-answers tak nie))))
(defrule kolatanie1 ""
	(logical (kolatanie nie))
	=>
	(assert (UI-state (display wybuchy)
                      (relation-asserted wybuchy)
                      (valid-answers tak nie))))
(defrule wybuchy ""
	(logical (wybuchy tak))
	=>
	(assert (UI-state (display ruchowe)
                      (relation-asserted ruchowe)
                      (valid-answers tak nie))))
(defrule wybuchy1 ""
	(logical (wybuchy nie))
	=>
	(assert (UI-state (display ruchowe)
                      (relation-asserted ruchowe)
                      (valid-answers tak nie))))
(defrule ruchowe ""
	(logical (ruchowe tak))
	=>
	(assert (UI-state (display pamiec)
                      (relation-asserted pamiec)
                      (valid-answers tak nie))))
(defrule ruchowe1 ""
	(logical (ruchowe nie))
	=>
	(assert (UI-state (display pamiec)
                      (relation-asserted pamiec)
                      (valid-answers tak nie))))
(defrule pamiec ""
	(logical (pamiec tak))
	=>
	(assert (UI-state (display zawroty)
                      (relation-asserted zawroty)
                      (valid-answers tak nie))))
(defrule pamiec1 ""
	(logical (pamiec nie))
	=>
	(assert (UI-state (display zawroty)
                      (relation-asserted zawroty)
                      (valid-answers tak nie))))
(defrule zawroty ""
	(logical (zawroty tak))
	=>
	(assert (UI-state (display koncentracja)
                      (relation-asserted koncentracja)
                      (valid-answers tak nie))))
(defrule zawroty1 ""
	(logical (zawroty nie))
	=>
	(assert (UI-state (display koncentracja)
                      (relation-asserted koncentracja)
                      (valid-answers tak nie))))
(defrule koncentracja ""
	(logical (koncentracja tak))
	=>
	(assert (UI-state (display fobie)
                      (relation-asserted fobie)
                      (valid-answers tak nie))))
(defrule fobie ""
	(logical (fobie tak))
	=>
	(assert (UI-state (display fobie2)
                      (relation-asserted fobie2)
                      (valid-answers tak nie))))
(defrule fobie1 ""
	(logical (fobie nie))
	=>
	(assert (UI-state (display fobie21)
                      (relation-asserted fobie21)
                      (valid-answers tak nie))))

(defrule mania ""
	(logical (tytul2 mania))
	=>
	(assert (UI-state (display nastroj)
                      (relation-asserted nastroj)
                      (valid-answers tak nie))))
(defrule nastroj ""
	(logical (nastroj tak))
	=>
	(assert (UI-state (display saooocena)
                      (relation-asserted saooocena)
                      (valid-answers tak nie))))
(defrule nastroj1 ""
	(logical (nastroj nie))
	=>
	(assert (UI-state (display saooocena)
                      (relation-asserted saooocena)
                      (valid-answers tak nie))))
(defrule saooocena ""
	(logical (saooocena tak))
	=>
	(assert (UI-state (display pewnosc)
                      (relation-asserted pewnosc)
                      (valid-answers tak nie))))
(defrule saooocena1 ""
	(logical (saooocena nie))
	=>
	(assert (UI-state (display pewnosc)
                      (relation-asserted pewnosc)
                      (valid-answers tak nie))))
(defrule pewnosc ""
	(logical (pewnosc tak))
	=>
	(assert (UI-state (display smutek)
                      (relation-asserted smutek)
                      (valid-answers tak nie))))
(defrule pewnosc1 ""
	(logical (pewnosc nie))
	=>
	(assert (UI-state (display smutek)
                      (relation-asserted smutek)
                      (valid-answers tak nie))))
(defrule smutek ""
	(logical (smutek tak))
	=>
	(assert (UI-state (display zainteresowanie)
                      (relation-asserted zainteresowanie)
                      (valid-answers tak nie))))
(defrule smutek1 ""
	(logical (smutek nie))
	=>
	(assert (UI-state (display zainteresowanie)
                      (relation-asserted zainteresowanie)
                      (valid-answers tak nie))))
(defrule zainteresowanie ""
	(logical (zainteresowanie tak))
	=>
	(assert (UI-state (display przygnebienie)
                      (relation-asserted przygnebienie)
                      (valid-answers tak nie))))
(defrule zainteresowanie1 ""
	(logical (zainteresowanie nie))
	=>
	(assert (UI-state (display przygnebienie)
                      (relation-asserted przygnebienie)
                      (valid-answers tak nie))))
(defrule przygnebienie ""
	(logical (przygnebienie tak))
	=>
	(assert (UI-state (display stres)
                      (relation-asserted stres)
                      (valid-answers tak nie))))
(defrule przygnebienie1 ""
	(logical (przygnebienie nie))
	=>
	(assert (UI-state (display stres)
                      (relation-asserted stres)
                      (valid-answers tak nie))))
(defrule stres ""
	(logical (stres tak))
	=>
	(assert (UI-state (display uzywki)
                      (relation-asserted uzywki)
                      (valid-answers tak nie))))
(defrule stres1 ""
	(logical (stres nie))
	=>
	(assert (UI-state (display uzywki)
                      (relation-asserted uzywki)
                      (valid-answers tak nie))))

(defrule brakkontaktu ""
	(logical (tytul2 brakkontaktu))
	=>
	(assert (UI-state (display usmiech)
                      (relation-asserted usmiech)
                      (valid-answers tak nie))))

(defrule halucynajce ""
	(logical (tytul2 halucynajce))
	=>
	(assert (UI-state (display omamy)
                      (relation-asserted omamy)
                      (valid-answers tak nie))))
(defrule omamy ""
	(logical (omamy tak))
	=>
	(assert (UI-state (display gonitwa)
                      (relation-asserted gonitwa)
                      (valid-answers tak nie))))
(defrule omamy1 ""
	(logical (omamy nie))
	=>
	(assert (UI-state (display gonitwa)
                      (relation-asserted gonitwa)
                      (valid-answers tak nie))))

(defrule brakstrachu ""
	(logical (tytul2 brakstrachu))
	=>
	(assert (UI-state (display bol)
                      (relation-asserted bol)
                      (valid-answers tak nie))))
(defrule bol ""
	(logical (bol tak))
	=>
	(assert (UI-state (display brakodczuc)
                      (relation-asserted brakodczuc)
                      (valid-answers tak nie))))
(defrule bol ""
	(logical (bol nie))
	=>
	(assert (UI-state (display brakodczuc)
                      (relation-asserted brakodczuc)
                      (valid-answers tak nie))))

(defrule strach ""
	(logical (tytul2 strach))
	=>
	(assert (UI-state (display wrazliwosc)
                      (relation-asserted wrazliwosc)
                      (valid-answers tak nie))))

;;;*****************************************
;;;            * FINAL RULES *
;;;*****************************************

;;;****************
;;;   WEWNETRZNE
;;;****************
(defrule migrena ""
   (logical (omdlenia tak))
   =>
   (assert (UI-state (display migrena)
                     (state final))))
(defrule  migrena1 ""
   (logical (omdlenia nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))


(defrule astma ""
   (logical (alergiaa tak))
   =>
   (assert (UI-state (display astma)
                     (state final))))
(defrule  astma1 ""
   (logical (alergiaa nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule cukrzyca ""
   (logical (smasa tak))
   =>
   (assert (UI-state (display cukrzycaT1)
                     (state final))))
(defrule cukrzycaa ""
   (logical (smasa nie))
   =>
   (assert (UI-state (display cukrzycaT1)
                     (state final))))
(defrule cukrzyca1 ""
   (logical (wahania tak))
   =>
   (assert (UI-state (display cukrzycaT2)
                     (state final))))
 (defrule cukrzycaa1 ""
    (logical (wahania nie))
    =>
    (assert (UI-state (display cukrzycaT2)
                      (state final))))
(defrule  cukrzyca2 ""
   (logical (koncentracja1 nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule rzs ""
   (logical (stawy tak))
   =>
   (assert (UI-state (display rzs)
                     (state final))))
(defrule  rzs1 ""
   (logical (stawy nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule pochp ""
   (logical (dusznosc2 tak))
   =>
   (assert (UI-state (display pochp)
                     (state final))))
(defrule  pochp1 ""
   (logical (dusznosc2 nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))


(defrule alergia ""
   (logical (powieki tak))
   =>
   (assert (UI-state (display alergia)
                     (state final))))
(defrule  alergia1 ""
   (logical (powieki nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule niezyt ""
   (logical (nosss tak))
   =>
   (assert (UI-state (display niezyt)
                     (state final))))
(defrule  niezyt1 ""
   (logical (nosss nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule arytmia ""
   (logical (pamiecc tak))
   =>
   (assert (UI-state (display arytmia)
                     (state final))))
(defrule  arytmia1 ""
   (logical (pamiecc nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule zawal ""
   (logical (glowaaa tak))
   =>
   (assert (UI-state (display zawal)
                     (state final))))
(defrule  zawal1 ""
   (logical (glowaaa nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



(defrule depresja ""
   (logical (bole tak))
   =>
   (assert (UI-state (display depresja)
                     (state final))))
(defrule  depresja1 ""
   (logical (bole nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



  (defrule hashimoto ""
     (logical (niskiecis tak))
     =>
     (assert (UI-state (display hashimoto)
                       (state final))))
  (defrule  hashimoto1 ""
     (logical (niskiecis nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))



 (defrule nadczynnosc ""
     (logical (biegunki tak))
     =>
     (assert (UI-state (display nadczynnosc)
                       (state final))))
  (defrule  nadczynnosc1 ""
     (logical (biegunki nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))



 (defrule otepienie ""
     (logical (czynnosci tak))
     =>
     (assert (UI-state (display otepienie)
                       (state final))))
  (defrule  otepienie1 ""
     (logical (czynnosci nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))


 (defrule otepienie ""
     (logical (depre tak))
     =>
     (assert (UI-state (display sm)
                       (state final))))
  (defrule  otepienie1 ""
     (logical (depre nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))

 (defrule zapalenieserca ""
     (logical (biegu tak))
     =>
     (assert (UI-state (display zapalenieserca)
                       (state final))))
  (defrule  zapalenieserca1 ""
     (logical (biegu nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))




(defrule niewydolnoscserca ""
     (logical (cisnienie tak))
     =>
     (assert (UI-state (display niewydolnoscserca)
                       (state final))))
  (defrule  niewydolnoscserca1 ""
     (logical (cisnienie nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))



(defrule zapaleniezatok ""
     (logical (powieeki tak))
     =>
     (assert (UI-state (display zapaleniezatok)
                       (state final))))
  (defrule  zapaleniezatok1 ""
     (logical (powieeki nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))




(defrule zapaleniegardla ""
     (logical (wezly tak))
     =>
     (assert (UI-state (display zapaleniegardla)
                       (state final))))
  (defrule  zapaleniegardla1 ""
     (logical (wezly nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))



(defrule oskrzeli ""
     (logical (zlesamo tak))
     =>
     (assert (UI-state (display oskrzeli)
                       (state final))))
  (defrule  oskrzeli1 ""
     (logical (zlesamo nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))



(defrule pluc ""
     (logical (opukiwanie tak))
     =>
     (assert (UI-state (display pluc)
                       (state final))))
  (defrule  pluc1 ""
     (logical (opukiwanie nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))



(defrule refluks ""
     (logical (klatka tak))
     =>
     (assert (UI-state (display refluks)
                       (state final))))
  (defrule  refluks1 ""
     (logical (klatka nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))




(defrule crohn ""
     (logical (sluz tak))
     =>
     (assert (UI-state (display crohn)
                       (state final))))
  (defrule  crohn1 ""
     (logical (sluz nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))




(defrule niedokrwistosc ""
     (logical (zaparciaa tak))
     =>
     (assert (UI-state (display niedokrwistosc)
                       (state final))))
  (defrule  niedokrwistosc1 ""
     (logical (zaparciaa nie))
     =>
     (assert (UI-state (display brak)
                       (state final))))


 (defrule trzustka ""
      (logical (spadcisnienie tak))
      =>
      (assert (UI-state (display trzustka)
                        (state final))))
   (defrule  trzustka1 ""
      (logical (spadcisnienie nie))
      =>
      (assert (UI-state (display brak)
                        (state final))))


(defrule cushing ""
      (logical (nadcisn tak))
      =>
      (assert (UI-state (display cushing)
                        (state final))))
   (defrule  cushing1 ""
      (logical (nadcisn nie))
      =>
      (assert (UI-state (display brak)
                        (state final))))


 (defrule hemofilia ""
       (logical (przewbol tak))
       =>
       (assert (UI-state (display hemofilia)
                         (state final))))
    (defrule  hemofilia1 ""
       (logical (przewbol nie))
       =>
       (assert (UI-state (display brak)
                         (state final))))


  (defrule woda ""
        (logical (kreatynina tak))
        =>
        (assert (UI-state (display woda)
                          (state final))))
     (defrule  woda1 ""
        (logical (kreatynina nie))
        =>
        (assert (UI-state (display brak)
                          (state final))))
;;;****************
;;;   NERWICOWE
;;;****************
(defrule zabkompobses ""
   (logical (tiki tak))
   =>
   (assert (UI-state (display obseskomp)
                     (state final))))
(defrule zabkompobses1 ""
   (logical (tiki nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))


(defrule lek ""
   (logical (wrazliwosc tak))
   =>
   (assert (UI-state (display lek)
                     (state final))))
(defrule lek1 ""
   (logical (wrazliwosc nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))


(defrule autyzm ""
   (logical (usmiech tak))
   =>
   (assert (UI-state (display autyzm)
                     (state final))))
(defrule autyzm1 ""
   (logical (usmiech nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))


 (defrule dyssocjalna ""
    (logical (brakodczuc tak))
    =>
    (assert (UI-state (display osobdysoc)
                      (state final))))
(defrule dyssocjalna1 ""
   (logical (brakodczuc nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



 (defrule schizo ""
    (logical (gonitwa tak))
    =>
    (assert (UI-state (display schizofrenia)
                      (state final))))
(defrule schizo1 ""
   (logical (gonitwa nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))


 (defrule afektywna ""
    (logical (uzywki tak))
    =>
    (assert (UI-state (display afektywna)
                      (state final))))
(defrule afektywna1 ""
   (logical (uzywki nie))
   =>
   (assert (UI-state (display brak)
                     (state final))))



 (defrule zabnerw ""
    (logical (koncentracja nie))
    =>
    (assert (UI-state (display brak)
                      (state final))))


  (defrule zabnerw1 ""
     (logical (fobie2 tak))
     =>
     (assert (UI-state (display zabnerw)
                       (state final))))

  (defrule zabnerw2 ""
     (logical (fobie2 nie))
     =>
     (assert (UI-state (display zabnerw1)
                       (state final))))

  (defrule zabnerw3 ""
     (logical (fobie21 tak))
     =>
     (assert (UI-state (display zabnerw2)
                       (state final))))

  (defrule zabnerw4 ""
     (logical (fobie21 nie))
     =>
     (assert (UI-state (display zabnerw)
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
