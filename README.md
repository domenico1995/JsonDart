# JSONDART
Progetto di parsing e visualizzazione.

## Indice
- [Introduzione](#Introduzione)
- [JSON](#json)
- [Dart](#dart)
- [Knime](#Knime)
- [Web App](#Web-App)
- [Modello di Knime](#Modello-di-Knime)
- [Istruzioni di uso](#Istruzioni-di-uso)
- [Esempi di Uso](#esempi-di-markdown)
  - [Codice](#codice)

# Introduzione
I sistemi informativi si scambiano dati e informazioni attraverso un flusso di dati. Tali dati sono strutturati in formati che permettono loro di essere codificati e decodificati. Il processo di parsing permette la loro conversione.

## JSON
JSON (JavaScript Object Notation) è un formato molto utilizzato oggi per lo scambio di informazioni. Questo formato è stato standardizzato per la prima volta nel 2013 all'interno dello standard ECMA-404, e successivamente è stato aggiornato nella sua seconda versione nel 2017 come parte dello standard ISO/IEC 21778. 

È stato definito anche all’interno del RFC 8259. Dalla prima alla seconda versione dell’RFC 8259, sono state fatte alcune modifiche per rendere più facile capire e usare il formato JSON. 

Queste modifiche includono spiegazioni extra per chiarire il significato di alcune idee, consigli nuovi su come usare JSON correttamente e nuovi esempi per aiutare a capire meglio come funziona. Inoltre, sono state aggiunte informazioni sulla sicurezza e su come gestire eventuali errori, per aiutare gli sviluppatori a fare applicazioni più sicure e solide che usano JSON per scambiare i dati.

ECMA (European Computer Manufacturers Association) è un'associazione fondata nel 1961 che si occupa di standardizzazione nel settore informatico e dei sistemi di telecomunicazione. ISO/IEC 21778 è uno standard definito dall'ISO (Organizzazione internazionale per la normazione) e dall'IEC (Commissione elettrotecnica internazionale), due entità che collaborano nella definizione degli standard.

Il formato JSON è composto da una sequenza di token ed include sei caratteri strutturali ([ - { - ] - } - : -  ,), stringhe, numeri e tre nomi letterali (true, false, null) ed è un valore serializzato. Quest’ultimo aspetto permette di rappresentare dati strutturati in una sequenza di caratteri secondo le specifiche di JSON.
 
La sintassi di JSON è definita come segue.
JSON è composto da: 
Spazi bianchi (ws: white spaces), seguiti da un valore (value) nel seguente modo: 

JSON Text = ws value ws

Sei caratteri strutturali:
* Inizio-array = ws %x5B ws; ‘[‘ parentesi quadra aperta per l’inizio di un array
* Inizio-oggetto = ws %x7B ws; ‘{‘ parantesi graffa aperta per l’inizio di un oggetto
* Fine-array = ws %x5D ws; ‘]’ parentesi quadra chiusa per la fine di un array
* Fine-oggetto = ws %7Dws; ‘}’ parentesi graffa chiusa per la fina di un oggetto
* separatore-nome = ws %x3A ws; ‘:’ due punti  
* separatore-valore = ws %x2C ws; ‘,’ virgola
 
I valori sono rappresentati usando la notazione ‘%xhh’ per rappresentare i valori esadecimali. Ad esempio %x5B indica la parentesi quadra aperta ‘[‘.
 
È consentito inserire spazi vuoti prima o dopo uno qualsiasi dei sei caratteri strutturali:
* %x20; spazio
* %x09; tabulazione orizzontale
* %x0A; avanzamento di riga o Nuova riga
* %x0D; ritorno a capo
 
Un valore JSON deve essere un oggetto, array, un numero o una stringa, oppure uno dei letterali: true, false, null.
 
I nomi dei letterali dei letterali devono essere in minuscolo. Non sono ammessi altri letterali secondo le seguenti regole:
* valori = false / null / true / oggetto / array / stringa / numero
* false = %x66.61.6c.73.65 : false
* null = %x6e.75.6c.6c : null
* true = %x74.72.75.65 : true
 
Una struttura di oggetto è rappresentata da una coppia di parentesi graffe che circondano zero o più coppie di nome/valore. Un nome è una stringa. Dopo ogni nome viene inserito un solo due punti, separando il nome dal valore. Una singola virgola separa un valore da un nome seguente. 

La sintassi risulta:
oggetto = inizio-oggetto [ membro * (separatore-valore membro ) ] fine-oggetto
membro = stringa separatore-nome valore
 
I nomi all’interno di un oggetto devono assolutamente essere unici. Quando in nomi di un oggetto non sono unici, il comportamento delle diverse implicazioni del software può variare. 
Alcune implementazioni potrebbero ignorare le coppie duplicate e considerare solo l’ultima coppia di un nome specifico, mentre altre potrebbero restituire un errore o comportarsi in modo imprevedibile. 

Le librerie JSON possono differire sulla questione di mantenere l’ordine dei membri dell’oggetto.
Le implementazioni che non dipendono dall’ordine dei membri saranno compatibili tra loro, mentre quelle che si basano sull’ordine dei membri potrebbero mostrare comportamenti diversi.
Un array è rappresentato da una serie di elementi racchiusi tra parentesi quadre. 
La sintassi risulta:
array = inizio-array [ valore *( separatore-valore valore ) ] fine-array

Non è richiesto che gli elementi all’interno di un array siano dello stesso tipo.
Per i numeri la rappresentazione è molto simile a quella utilizzata nella maggior parte dei linguaggi di programmazione comuni. Un numero può contenere una componente intera, una parte frazionarie e/o una parte esponenziale. 

La parte intera può essere preceduta da un segno meno opzionale (per rappresentare numeri negativi) e consiste in una sequenza di cifre decimali. Non sono ammessi zeri iniziali.
La parte frazionaria è costituita da un punto decimale seguito da un a o più cifre decimali.
La parte esponenziale inizia con la lettera “E” (in maiuscolo o minuscolo) seguita da un segno più o meno opzionale e da una o più cifre decimali che rappresentano l’esponente.

La specifica consente alle implementazioni di impostare limiti sul range e sula precisione dei numeri accettati, la precisione e il range dei numeri JSON possono variare a seconda dell’implementazione, ma per garantire l’interoperabilità, le implementazioni dovrebbero approssimare i numeri JSON entro la cifra prevista.

Ad esempio, i numeri molto grandi come 1E400 o con molte cifre come il pi greco possono causare problemi di interoperabilità se il software che riceve questi numeri non ha la capacità di gestirli correttamente.
Numeri speciali come infinito e NaN (Not a Number) non sono ammessi in JSON.

La sintassi sarebbe:
numero = [meno] int [frazione] [esponente]
punto decimale = %x2E ; . punto decimale
cifra da 1 a 9 = %x31-39 ; 1-9
e = %x65 / %x45 ; e / E
esponente = e [meno / più] 1*cifra
intero = zero / (cifra da 1 a 9 *cifra)
meno = %x2D ; -
più = %x2V ; +
zero = %x30 ; 0

Le stringhe in JSON sono delimitate da virgolette e possono contenere qualsiasi carattere Unicode, ad eccezione di alcuni caratteri che devono essere sequenze di escape, ovvero il carattere virgolette doppie ("), la barra rovesciata (), e i caratteri di controllo nell’intervallo U+0000 a U+001F.

Ogni carattere può essere una sequenza di escape. Se il carattere si trova nel Basic Multilingual Plane (U+0000 a U+FFFF), può essere rappresentato come una sequenza di escape di sei caratteri. 

Questa sequenza inizia con una barra rovesciata (), seguita dalla lettera 'u' minuscola e quattro cifre esadecimali che codificano il punto di codice del carattere. Le lettere esadecimali da A ad F possono essere sia maiuscole che minuscole.

In alternativa, alcuni caratteri comuni possono essere rappresentati in modo più compatto utilizzando una sequenza di escape di due caratteri.
Per i caratteri estesi che non rientrano nel Basic Multilingual Plane, la loro rappresentazione è una sequenza di 12 caratteri, che codifica la coppia surrogata UTF-16 del carattere.
 
La sintassi è:
stringa = virgolette *carattere virgolette
carattere = senza caratteri di sequenza di escape / sequenza di escape (
%x22 / ; “ virgolette U+0022
%x5C / ; \ barra rovesciata U+005C
%x2F / ;  / barra U+002F
%x62 / ; b retrospazio U+0008
%x66 / ; f alimentazione a capo U+000C
%x6E / ; n avanzamento riga U+000A
%x72 / ; r ritorno a capo U+000D
%x74 / ; t tabulazione U+0009
%x75 4HEXDIG ) ; uXXXX U +XXXX
 
Sequenza di escape = %x5C ; \
virgolette = %x22 ; “
senza sequenza di escape = %x20-21 / %x23-5B / %x5D-10FFFF
 
Tutte le stringhe in un testo JSON sono composte interamente da caratteri Unicode, anche se alcuni di essi sono sequenze di escape (cioè, rappresentati con la notazione “\u” seguita da un codice esadecimale), allora quel teso JSON è considerato interoperabile. 

Ciò significa che tutte le implementazioni software che analizzano quel testo JSON dovrebbero essere d’accordo sul significato dei nomi e die valori delle stringhe all’interno degli oggetti e degli array.
Comunque, la specifica JSON permette teoricamente la presenza di sequenza di bit che non possono rappresentare correttamente caratteri Unicode validi. 

Questo può causare problemi, come quando una libreria tronca una stringa senza verificare se tale troncamento divide una coppia di surrogati UTF-16. In tali casi, il comportamento del software che riceve questi testi JSON contenenti tali valori imprevedibili, potendo restituire valori diversi per la lunghezza di una stringa o subire eccezioni fatali durante l’esecuzione.

```json
{
  "nome": "Paolo",
  "cognome": "Rossi",
  "età": 42,
  "sesso": "maschio",
  "sposato": true,
  "hobby": [
    "escursionismo",
    "giardinaggio",
    "cucina"
  ],
  "indirizzo": {
    "via": "Via Roma",
    "numero": 10,
    "città": "Milano",
    "cap": "20121"
  }
}
```

L'esempio fornito illustra un documento JSON che contiene una serie di informazioni relative a persone. Ogni persona è rappresentata da un oggetto all'interno di un array. Ogni oggetto contiene diversi attributi, come il nome, il cognome, l'età e il sesso.

Si possono notare vari tipi di valori: le stringhe per i nomi e i cognomi, i valori numerici per le età e le stringhe per i sessi, che possono essere "maschio" o "femmina". Inoltre, è presente un array associato all'attributo "hobby", che potrebbe contenere una lista di interessi o attività preferite, e un oggetto associato all'attributo "indirizzo", che potrebbe rappresentare dettagli relativi al luogo di residenza di ciascuna persona.  

```json              
[
  {
    "nome": "Paolo",
    "cognome": "Rossi",
    "età": 42,
    "sesso": "maschio"
  },
  {
    "nome": "Anna",
    "cognome": "Bianchi",
    "età": 35,
    "sesso": "femmina"
  }
]
```

Questo ulteriore esempio mostra come i dati possano essere organizzati in un formato strutturato e interoperabile come JSON, facilitando lo scambio e l'interpretazione delle informazioni tra diversi sistemi e applicazioni.	

Un parser JSON è un componente software che converte un testo scritto in formato JSON in un’altra forma di rappresentazione, solitamente una struttura dati che il programma possa elaborare in modo più efficiente o significato . 

Il parser deve essere in grado di accettare tutti i testi che rispettano la grammatica definita per il JSON. 
Per le derivazioni o le estensioni del formato JSON bisogna fare una ulteriore considerazione. Le estensioni possono introdurre regole aggiuntive o modificare il comportamento standard del parser.
 
Le estensioni possono rendere il codice meno interoperabile e più complesso, è importante usarle con cautela. Le estensioni dovrebbero essere implementate solo se necessario e se vi è una chiara comprensione degli effetti che potrebbero avere sulle altre parti del sistema.
Quando si utilizzano estensioni o derivazioni è importante documentarle in maniera chiara e ordinata per evitare fraintendimenti e problemi di compatibilità.


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

![Linterfaccia-utente-di-KNIME](https://github.com/domenico1995/JsonDart/assets/46219063/f581017f-e9f5-4f0e-b27d-4d99e9313617)
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

Nella parte inferiore è possibile scrivere un commento. Il commento permette di dare una spiegazione o contesto al nodo all’interno del flusso di lavoro. Di default Knime crea un comento in ogni nodo aggiunto al flusso di lavoro usando un semplice contatore. Ad esempio: Nod1, Node2 e così via. 

Con un doppio clic si può modificare facilmente.
I nodi sono collegati attraverso connettori o delle porte, presenti a sinistra e a destra del quadrato del nodo. Per convenzione la parte sinistra del nodo indica l’input e la parte destra indica l’output. 

Tali porte possono avere forma e colore diverso a seconda del tipo di contenuto che le attraversa: di forma triangolare indica il trasporto di tabelle di dati o dataset e rappresentano la maggior parte di esse ricadono in questa categoria, di forma quadrata trasportano modelli statistici, connessioni remote o immagini o di forma triangolare per le variabili.

![Knime_example](https://github.com/domenico1995/JsonDart/assets/46219063/c101dc9a-d962-4975-bd61-1d04064c445d)

Figura 2 Esempio workflow editor

Nella parte inferiore di ogni nodo, si trova un semaforo che segnala lo stato del nodo. 

Se la luce rossa del semaforo è accesa indica che il nodo non è ancora pronto per fare il suo lavoro, potrebbe essere che alcuni dati richiesti in input non siano disponibili o che sia necessario qualche ulteriore fase di configurazione. 

Luce gialla, il nodo ha tutto ciò che gli serve ed è pronto per essere pronto per essere eseguito, non appena gli viene dato l’ordine di esecuzione. 

Luce verde, indica che il nodo è stato eseguito con successo e i risultati sono disponibili per i connettori di uscita. 

Possono apparire anche altre icone sul semaforo: 
* Triangolo giallo con un punto esclamativo, segnala un warming, un potenziale errore. Rappresenta un insolito e potenziale errore che richiede la nostra attenzione.
* Cerchio rosso con una croce annuncia invece un errore che bloccante. Non permette quindi al nodo di essere, in alcun modo, eseguito. In questi casi, con il puntatore del mouse per un secondo, appare un’etichetta con le informazioni o vedendo nei messaggi sulla console di Knime.

Nel repository di Knime sono disponibili diverse famiglie di nodi disponibili e ognuna delle quali risponde a una diversa classe di esigenza. 

I più popolari sono:
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

