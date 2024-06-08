# JSONDART
Progetto di parsing e visualizzazione.

## Indice
- [Introruzione](#Introduzione)
- [Dart](#dart)
- [Knime](#Knime)
- [Web App](#Web-App)
- [Modello di Knime](#Modello-di-Knime)
- [Istruzioni di uso](#Istruzioni-di-uso)
- [Esempi di Uso](#esempi-di-markdown)
  - [Codice](#codice)

# Introduzione
I sistemi informativi si scambiano dati e informazioni attraverso un flusso di dati. Tali dati sono strutturati in formati che permettono loro di essere codificati e decodificati. Il processo di parsing permette la loro conversione.

## Dart
Dart è un linguaggio di programmazione open-source sviluppato da Google, progettato per offrire un ambiente di sviluppo moderno e per performante per la creazione di applicazione web e mobile. La sua sintassi chiara e intuitiva, insieme a una serie di strumenti e framework, rendono Dart una scelta popolare tra gli sviluppatori che cercano ci creare applicazioni robuste e scalabili.

Una delle caratteristiche distintive di Dart è la sua flessibilità nell’ambito dello sviluppo cross-platform. Con Dart, gli sviluppatori possono scrivere codice una sola volta e distribuirlo su diverse piatteforme, tra cui Android, iOS, web e persino applicazioni desktop. 

Questo è reso possibile grazie a kit di sviluppo come Flutter e AngularDart. 
AngularDart è un kit di sviluppo di applicazioni web che sfrutta la potenza di Dart per creare interfacce utente dinamiche e complesse. 

Basato sul framework JavaScript Angular, AngularDart offre un’esperienza di sviluppo moderna e scalabile per la creazione di applicazioni web complesse.
Oltre alle sue capacità cross-platform, Dart offre una serie di funzionalità avanzate ch lo rendono un linguaggio potente per lo sviluppo di applicazioni moderne. Tra queste vi sono:
 * Tipizzazione Statica: Dart supporta la tipizzazione statica, che consente agli sviluppatori di individuare errori nel codice durante la compilazione anziché a tempo di esecuzione. Questo aiuta a migliorare la robustezza e la stabilità delle applicazioni.

```dart
int somma(int a, int b) {
	return a + b;
}

void main() {
	print(somma(5, 10)); // Output: 15
}
```


 * Garbage collection: Dart gestisce automaticamente la memoria allocata per gli oggetti non utilizzati mediante il garbage collection, semplificando il processo di gestione della memoria per gli sviluppatori.
 * Asincronia: Dart offre un supporto nativo per la programmazione asincrona, consentendo agli sviluppatori di scrivere codice che gestisce operazioni non bloccanti come chiamate di rete e operazioni di I/O in modo efficiente e conciso.

```dart
Future<void> main() async {
	print(‘Inizio’);
	await Future.delayed(Duration(seconds: 2));
print(‘Fine’);
}
```

 * Librerie standard: Dart fornisce una ricca libreria standard che include una vasta gamma di funzionalità per la gestione di dati, la manipolazione di stringhe, l’elaborazione di file e molto altro ancora. Queste librerie aiutano gli sviluppatori a scrivere codice più efficiente e riducono la necessità di scrivere codice personalizzato per compiti comuni.

Per iniziare a sviluppare applicazioni con Dart, è necessario scaricare e installare l’SDK di Dart. Una volta installato, è possibile utilizzare strumenti come Webdev per semplificare lo sviluppo di applicazioni web in Dart. 
Webdev gestisce le dipendenze del progetto e avvia un server locale per la visualizzazione dell’applicazione durante lo sviluppo.
La creazione di una nuova web app Dart è semplice grazie al comando 
```dart
dart create-t web nomeprogetto
```
Questo comando crea una struttura di base per la web app, inclusi i file main.dart per la logica dell’applicazione, un file HTML per la struttura della pagina web e un file CSS per lo stile.

Una delle caratteristiche più potenti di Dart è la possibilità di ricarica automaticamente le modifiche apportate al codice durante lo sviluppo. 
Ogni volta che vengono apportate modifiche ai file della web app, Webdev rileva automaticamente queste modifiche e le ricarica nel browser in tempo reale, consentendo un flusso di lavoro efficiente e produttivo.

## Knime

Knime (Konstanz Information Miner) è un progetto open-source per l’analisi dei dati e l’integrazione di flussi di lavoro. Creato nel 2004 all’Università di Konstanz e rilasciato pubblicamente nella metà del 2006.

Offre un ambiente visuale drag-and-drop per la creazione, l'esecuzione, l'integrazione e l'automazione di analisi dei dati e processi di machine learning. Consente agli utenti di combinare in modo molto semplice dati provenienti da diverse fonti, eseguire analisi statistiche, applicare algoritmi di machine learning e visualizzare i risultati in modo chiaro e comprensibile.

Knime, grazie a queste sue caratteristiche, rientra nella categoria no-code (vedere paragrafo 2.6).
Knime utilizza due concetti importanti: il nodo e il flusso di lavoro.
L’interfaccia utente di Knime è composta da sei finestre principali ognuna con un proprio scopo. Tali finestre sono visibili una volta avviata l’applicazione di Knime.
 
Figura 1 Interfaccia dell'ambiente di lavoro di Knime
1. Explorer: è dove i diversi flussi di lavoro sono conservati e organizzato in una struttura gerarchica di cartelle. Tra le varie cartelle che sono presenti nell’Explorer vi sono: il server pubblico Knime con diversi flussi di lavoro di esempio strutturati per argomento da trarre per ispirazione e riadattare alle nostre esigenze; lo spazio My-Knime-hub, collegato al nostro spazio utente sulla piattaforma cloud chiamate Knime Hub, dove possiamo condividere o pubblicamente a tutti o renderli privati e visibili solo all’utente. 
2. Node Repository: in questo spazio si trova il menu completo dei nodi Knime disponibili e pronti per essere usati nel flusso di lavoro. Sono organizzati per categorie e a volte per sottocategorie.
3. Workflow Editor: qui i nodi vengono trascinati e usati per creare un flusso di lavoro. Rappresenta uno spazio bianco dove è possibile creare ogni tipo di flusso di lavoro, sulla base delle proprie esigenze o sulla base dei propri obbiettivi. 
4. Node Description: è una finestra molto utile perche offre una guida pratica per l’utilizzo di ciascun nodo all’interno di Knime. Cliccando su un nodo qualsiasi, che sia presente nel Workflow Editor o che sia presente nel repository dei nodi, apparirà tutto quello che c’è da sapere per usare al meglio il nodo. La descrizione sarà composta da tre parti: un riassunto di che cosa fa e come funziona, elenco dei vari passi necessari alla configurazione e, infine, descrizione di quali dati ci si aspetta di avere alle porte di ingresso e di uscita del nodo, le porte.
5. Outline: flusso di lavoro può raggiunge ampi volumi ed estendersi oltra il Workflow Editor. La finestra di Outline permetta una vista a volo d’uccello del flusso di lavoro e mostra  quale sezione è attualmente visualizzata nell’editor. Trascinando con il mouse il riquadro blu è possibile muoversi sulla parte del workflow che è di interesse.
6. Console e Node Monitor: in questa sezione ci trovano due strumenti utili per capire se ci sono dei problemi nella fase di esecuzione del flusso di lavoro ed eventualmente correggerli attraverso attività di debug.

In Figura 2 è rappresentato un esempio di flusso di lavoro (o workflow), all’interno del Workflow Editor di Knime che inizia leggendo un file Excel e successivamente procede con un processo di analisi e manipolazione dei dati.
L’esempio permette di dare una migliore prospettiva di come funziona Knime e del flusso di lavoro che in questo caso va da sinistra a destra.
Il flusso di lavoro è costituito da nodi, rappresentati da un’icona quadrata con del testo e delle forme intorno.
In cima al nodo vi è il suo nome in grassetto. Il nome rappresenta la funzione di quel nodo. Se per esempio, si dovesse leggere in file Json usiamo il nodo Json Reader.

Nella parte inferiore è possibile scrivere un commento. Il commento permette di dare una spiegazione o contesto al nodo all’interno del flusso di lavoro. Di default Knime crea un comento in ogni nodo aggiunto al flusso di lavoro usando un semplice contatore. Ad esempio: Nod1, Node2 e così via. Con un doppio clic si può modificare facilmente.
I nodi sono collegati attraverso connettori o delle porte, presenti a sinistra e a destra del quadrato del nodo. Per convenzione la parte sinistra del nodo indica l’input e la parte destra indica l’output. 

Tali porte possono avere forma e colore diverso a seconda del tipo di contenuto che le attraversa: di forma triangolare indica il trasporto di tabelle di dati o dataset e rappresentano la maggior parte di esse ricadono in questa categoria, di forma quadrata trasportano modelli statistici, connessioni remote o immagini o di forma triangolare per le variabili.
 
Figura 2 Esempio workflow editor

Nella parte inferiore di ogni nodo, si trova un semaforo che segnala lo stato del nodo. Se la luce rossa del semaforo è accesa indica che il nodo non è ancora pronto per fare il suo lavoro, potrebbe essere che alcuni dati richiesti in input non siano disponibili o che sia necessario qualche ulteriore fase di configurazione. Luce gialla, il nodo ha tutto ciò che gli serve ed è pronto per essere pronto per essere eseguito, non appena gli viene dato l’ordine di esecuzione. Luce verde, indica che il nodo è stato eseguito con successo e i risultati sono disponibili per i connettori di uscita. 
Possono apparire anche altre icone sul semaforo: 
* Triangolo giallo con un punto esclamativo, segnala un warming, un potenziale errore. Rappresenta un insolito e potenziale errore che richiede la nostra attenzione.
* Cerchio rosso con una croce annuncia invece un errore che bloccante. Non permette quindi al nodo di essere, in alcun modo, eseguito. In questi casi, con il puntatore del mouse per un secondo, appare un’etichetta con le informazioni o vedendo nei messaggi sulla console di Knime.

Nel repository di Knime sono disponibili diverse famiglie di nodi disponibili e ognuna delle quali risponde a una diversa classe di esigenza. I più popolari sono:
* Input e Output: questa categoria di nodi portano i dati all’interno e all’esterno di Knime comportandosi da sistemi di Input e sistemi di Output. Tipicamente i nodi di input sono all’inizio del flusso di lavoro e servono ad aprire file in diversi formati(CSV, Excel, immagini, pagine web, pdf e altro) o a connettersi a database remoti o locali ed estrarre i dati di cui si ha bisogno. I nodi di questa categoria hanno la funzione di iniziare il flusso di lavoro che termina con quelli di output.
* Manipolazione: i nodi appartenenti a questa categoria permettono la manipolazione di tabelle di dati e trasformarle secondo le esigenze dell’utente. Si possono aggreggiare, combinare, ordinare, filtrare e rimodellare le tabelle, ma anche gestirne i valori mancanti normalizzando le scale e convertire i tipi di dato, come xml a Json, ma anche gestire i valori mancanti, normalizzare le scale e convertire i tipi di dato. I nodi appartenenti a questo gruppo e a quelli di Input e Output sono sempre presenti all’interno di un flusso di lavoro. I nodi della Manipolazione possono avere più di una porta di ingresso o più di una porta di uscita, essendo in grado di fondere più tabelle insieme o di suddividerle in più parti.
* Analytics: sono nodi con una componente più complessa in quanto sono in grado di generare modelli statistici e di implementare algoritmi di apprendimento basati sui sistemi di intelligenza artificiale. Alcune porte dei nodi di questa categoria sono quadrate. 
* Flow Control: i flussi di lavoro avranno bisogno di andare oltre il semplice andamento lineare da sinistra a destra scorrendo in sequenza da un nodo a un altro. I nodi appartenenti a questa categoria sono in grado di controllare il flusso di esecuzione attraverso l’implementazione dei cicli, dei loop controllati,  in modo da poter ripetere dei passi più volter similmente alle strutture di controllo dei linguaggi di programmazione, come gli “if”, “for” e i “do/while”. Si può controllare dinamicamente il comportamento dei nodi gestendone la configurazione con l’uso di variabili. Con i nodi di controlli si può controllare i cicli e le variabili e implementare logiche più complesse anche se le esigenze di progetto consento di farne a meno.
* Altre tipologie: oltre alle tipologie viste fino ad ora, vi sono molteplici tipi di nodi che permettono di aiutare l’utente nelle esigenze più specifiche. Alcuni nodi ci permettono per esempio di interagire con applicazione terze attraverso Api. Altri nodi permettono di integrare i linguaggi di programmazione come il Javascript nel flusso di lavoro o al contrario di innestare il flusso di lavoro preparato in Knime all’interno di un programma scritto in un altro linguaggio. Ci sono anche nodi per test statistici e per costruire visualizzazioni o generare report più complessi.



## Web App
Istruzioni per iniziare con il progetto.

## Modello di Knime
Progetto su piattaforma di Knime

## Istrusione di uso

## Esempi di uso

