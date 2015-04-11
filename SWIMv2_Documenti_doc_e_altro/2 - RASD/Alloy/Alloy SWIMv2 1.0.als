module SWIMv2

//Classi del Class Diagram portate in Alloy

sig Utente extends Visitatore {
	possiedeAbilita: some Abilita, //può avere una o più abilita
	collaboraIn: set Collaborazione,
	amicoDi: set Utente
}


sig Amministratore {
}


sig Visitatore {
}


sig Collaborazione {
	feedback: lone Feedback, //lone perche' inizialmente non e' stato ancora rilasciato
	utenteCheHaRichiesto: one Utente,	//one perche' per essere avviata un utente deve averla richiesta
	utenteCheHaRicevuto: one Utente //one perche' deve esserci anche l'utente che ha ricevuto la proposta di collaborazione (non e' detto che l'abbia accettata)
}


sig Feedback { 
	voto: lone Int, //rappresenta il voto assegnato alla collaborazione
	riguarda: one Collaborazione,
} {
	voto > 0 and voto < 6 //voto compreso tra 1 e 5
}


sig Abilita {
}



//un utente non può essere amico di se stesso
fact noAmicoDiSeStesso {
	no u: Utente | u in u.amicoDi
}

//se esiste una collaborazione, allora i due utenti di una collaborazione devono essere differenti
fact collaboratoriDiversi {
	all c: Collaborazione | c.utenteCheHaRichiesto != c.utenteCheHaRicevuto
}

//una collaborazione può riguardare solo 2 utenti, e questi sono esattamente il richiedente e il richiesto
fact collaboraIn{
	all c:Collaborazione,u1:Utente,u2:Utente |	(c in u1.collaboraIn && c in u2.collaboraIn) => ((u1=c.utenteCheHaRichiesto or u1=c.utenteCheHaRicevuto) && (u2=c.utenteCheHaRicevuto or u2=c.utenteCheHaRichiesto))
}

//dove è definita, la relazione riguarda è l'inverso della relazione feedback
fact feedbackAssociatoACollaborazione{
	all f:Feedback, c:Collaborazione | f.riguarda=c <=> c.feedback=f
}

//la relazione collaboraIn è l'inversa di utenteCheHaRichiesto+utenteCheHaRicevuto
fact utenteCollaborazione{
	all c:Collaborazione | c in c.utenteCheHaRichiesto.collaboraIn && c in c.utenteCheHaRicevuto.collaboraIn
}

//la relazione amicizia è bidirezionale
fact amiciziaBidirezionale{
	all u1:Utente, u2:Utente | u1 in u2.amicoDi <=> u2 in u1.amicoDi
}


//ora facciamo un po di controlli sul nostro mondo

//controlliamo che non esiste una collaborazione con i due utenti uguali
assert utenteNoInCollaborazioneConSeStesso {
	all c:Collaborazione |c.utenteCheHaRichiesto!=c.utenteCheHaRicevuto
}



check utenteNoInCollaborazioneConSeStesso


//controlliamo che un utente non può essere amico di se stesso
assert utenteNoAmicoDiSeStesso{
	no u:Utente|u in u.amicoDi
}

check utenteNoAmicoDiSeStesso

//controlliamo che un feedback non può esistere senza una collaborazione
assert feedBackNonEsisteSenzaCollaborazione{
	no f:Feedback | f.riguarda= none
}

check feedBackNonEsisteSenzaCollaborazione

//controlliamo che può esistere una collaborazione senza feedback
//in questo caso ci deve ritornare un controesempio

assert collaborazioneSenzaFeedback{
	all c:Collaborazione| c.feedback!=none
}

check collaborazioneSenzaFeedback

//controlliamo che un feedback non abbia un voto maggiore di 5
assert valoreVoto{
	all f:Feedback| f.voto<=5
}

check valoreVoto

//controlliamo che una collaborazione deve essere per forza tra due persone
assert collaborazioneE'ConDuePersone{
	all c:Collaborazione| c.utenteCheHaRichiesto!= none && c.utenteCheHaRicevuto!=none
}

check collaborazioneE'ConDuePersone

//controlliamo che un utente possegga almeno una abilità
assert almenoUnaAbilitaPerUtente{
	all u:Utente| #u.possiedeAbilita>=1
}

check almenoUnaAbilitaPerUtente

//controlliamo che l'amicizia sia sempre bidirezionale
assert amiciziaBidirezionale{
	all u1:Utente,u2:Utente| u1 in u2.amicoDi <=> u2 in u1.amicoDi
}

check amiciziaBidirezionale


//infine creiamo un mondo per un controllo grafico finale
pred show(){
	#Utente=5
	#amicoDi=2
	#Abilita=3
	#Collaborazione=2
	#Feedback=2
    #voto=2
}

run show for 10


