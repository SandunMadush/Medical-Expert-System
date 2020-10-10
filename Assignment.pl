/*Medical Expert System*/
go:-
hypothesis(Disease),
write('I believe that the patient have : '),
write(Disease),
nl,
write('TAKE CARE!!! '),
undo.

/*Hypothesis that should be tested*/
hypothesis(cold) :- cold, !.
hypothesis(flu) :- flu, !.
hypothesis(covid_19) :- covid_19, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(measles) :- measles, !.
hypothesis(dengue) :- dengue, !.
hypothesis(unknown). /* no diagnosis*/

/*Hypothesis Identification Rules*/
cold :-
verify(headache),
verify(runny_nose),
verify(sneezing),
verify(sore_throat),
write('Advices and Suggestions:'),
nl,
write('1: Tylenol '),
nl,
write('2: Panadol '),
nl,
write('3: Nasal spray '),
nl,
write('Please wear warm cloths because : '),
nl.

flu :-
verify(fever),
verify(headache),
verify(chills),
verify(body_ache),
write('Advices and Suggestions:'),
nl,
write('1: Tamiflu '),
nl,
write('2: Panadol '),
nl,
write('3: Zanamivir '),
nl,
write('Please take a warm bath and do salt gargling because : '),
nl.

covid_19 :-
verify(fever),
verify(headache),
verify(chills),
verify(sore_throat),
verify(body_ache),
verify(breathlessness),
write('Advices and Suggestions:'),
nl,
write('No direct vaccine or medication for now :- under investigation. '),
nl,
write('To reduce fever and body pain take Acetaminophen.'),
nl,
write('Please take plenty of rest, stay well hydrated because : '),
nl.

typhoid :-
verify(headache),
verify(abdominal_pain),
verify(poor_appetite),
verify(fever),
write('Advices and Suggestions:'),
nl,
write('1: Chloramphenicol '),
nl,
write('2: Amoxicillin '),
nl,
write('3: Ciprofloxacin '),
nl,
write('4: Azithromycin '),
nl,
write('Please do complete bed rest and take soft diet because : '),
nl.

measles :-
verify(fever),
verify(runny_nose),
verify(rash),
verify(conjunctivitis),
write('Advices and Suggestions: '),
nl,
write('1: Tylenol '),
nl,
write('2: Aleve '),
nl,
write('3: Advil '),
nl,
write('4: Vitamin A '),
nl,
write('Please get some rest and drink more fluids because : '),
nl.

dengue :-
verify(fever),
verify(sweating),
verify(headache),
verify(nausea),
verify(vomiting),
verify(joint_pain),
write('Advices and Suggestions:'),
nl,
write('Acetaminophen to reduce fever and joint_pain. '),
nl,
write('Please do not sleep in open air, cover your full skin and drink plenty of fluids to be hydrated because : '),
nl.

/* How to ask questions */
ask(Question) :-
write('Does the patient has following symptom: '),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
