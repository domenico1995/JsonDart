# JsonDart 
Web App
Per il processo di parsing e la successiva visualizzazione, si è optato per la realizzazione di un'applicazione web (Web App). 
La Web App usa come framework Dart con delle parti di Javascript.
L’applicazione usa come hosting il servizio offerta da Firebase Hosting. In questo modo è possibile connettersi ad essa da ogni dispositivo avente connessione alla rete. L’indirizzo al quale connettersi è ‘https://parsingjson.web.app’.
Il progetto della applicazione web utilizza come strumento di gestione di gestione degli aggiornamenti Git e tiene un repository su GitHub all’indirizzo: https://github.com/domenico1995/JsonDart.git per il  momento presente su una cartella pubblica a tutti gli utenti.
La scelta è derivata dalla necessità di testare l’applicazione al di fuori del dispositivo di localhost, dove essa viene sviluppata e dalla necessita di valutare il comportamento dell’applicazione sia su PC (laptop e desktop) sia su dispositivi mobili con dimensioni varie, per individuare eventuali difetti di progettazione.
Il compito dell’applicazione è quello di: 
1)	Ricevere dati in input, come testo JSON, e di effettuare un processo di parsing e di visualizzare sotto forma di testo di output.
2)	Ricevere dati in input, come testo JSON non ben formato, e visualizzare in output il testo secondo il formato JSON aderente alla RFC 8259.
3)	Ricevere dati in input, come testo JSON, e di rappresentarlo, mediante usa di un elemento grafico, come albero che si sviluppa ad orientamento orizzontale.
 
Figura 7 Immagine Web App
In Figura 7 è possibile vedere l’immagine l’applicazione a schermo su un desktop.
Il progetto della Web App è composto da file di configurazione e directory con sottodirectory, divise per funzionalità come segue:
•	.dart_tool: è una directory creata automaticamente dal compilatore di Dart. All’interno vi sono gli strumenti di Dart: il SDK di Dart e il framework Flutter. La directory contiene i file e le informazioni utilizzati per lo sviluppo, la compilazione e l’esecuzione di app scritti in Dart.
•	.firebase: viene usata nei progetti che integrano i servizi del cloud di Firebase di Google (). La directory contiene configurazioni e informazioni che sono necessarie per interagire con il cloud di Firebase durante lo sviluppo e la distribuzione dell’applicazione.
•	.vscode: è utilizzato da Visual Studio Code (), per memorizzare le configurazioni delle specifiche di progetto. Queste informazioni sono presenti all’interno del file ‘launch.json’.
•	build: una volta che la Web App è testate testata nelle sue componenti, è possibile creare la ‘build’. La build contiene una versione della Web App da distribuire all’interno di un hosting. Oltre al codice, vi è anche le informazioni contenute nei file di configurazione e le immagini. 
•	images: è una directory contenete le immagini utilizzate dalla Web App.
•	file di configurazione: alcuni file contengono le informazioni sulle dipendenze usate nel progetto, per documentare il progetto e le informazioni di Firebase e di Git. L’insieme di questi file sono vitali per realizzare il progetto e della sua configurazione che vengono poi racchiusi, in parte nella build, del progetto.
•	web: la directory ‘web’ contiene il cuore e le funzioni vere e proprie della Web App. Le funzioni aventi compiti specifici sono presenti all’interno di una sottodirectory, ‘utils’. All’interno della cartella web, oltre ad utils, vi sono:
o	index.html:  il file html contiene gli elementi che saranno visualizzati sullo schermo una volta effettuata la connessione all’indirizzo della Web App. All’interno comandi nel linguaggio di html e collegamenti ad altri file, come ad esempio, per i fogli di stile in css e i file in javascript (script.js e i file presenti nella sottocartella utils: tab.js e albero.js) e dart (main.dart).
o	main.dart: il file funge da main principale per il controllo e la gestione  della maggior parte delle funzioni che sono utilizzate nella Web App e del flusso di controllo. Rappresenta il centro nevralgico della maggior parte delle funzioni associate alla Web App.
o	script.js: il file contiene una funzione che modifica il DOM spostando il diveder tra le due parti della Web App, quella che funge da input e quella che funge da view delle funzioni centrali della Web App, cioè da output. 
o	styles.css: il file contiene il foglio di stile usato dal Browser durante l’esecuzione del file html. All’interno non vi sono le informazioni usate dalla funzione albero.js presente invece in tree.css.
o	tree.css: il file contiene il foglio di stile usato per funzione albero.js. tale funzione permette di visualizzare ad albero i dati di input. La parte grafica dell’albero visualizzato è definita in questo albero.
Oltre ai file descritti c’è una cartella, ‘utils’ con all’interno i file contenenti le funzioni usati per compiti specifici. Uno per ogni file. È sono composti nel seguente modo:
o	albero.js: contiene la funzione javascript per generare un grafico ad albero con le informazioni fornite in input. Per la creazione del grafico viene utilizzato la libreria D3 e l’uso di SVG (vedere capitolo 3.5) per creare un grafico più fluido e iterativo. La funzione utilizza come foglio di stile tree.css. In Figura 7 è possibile vedere l’esito di un testo dato in input a sinistra e a destra il grafico creato dalla funzione. 
o	aprifile.dart: contiene il codice in Dart che permette di caricare un file da sistema locale e inserire nella Web App come dati di input.
o	conversion.dart: una volta forniti un testo JSON di input avviene il processo di estrapolazione dei dati, il parsing, che vengono successivamente mostrati in output sulla Web App.  
o	format.dart: contiene la funzione che permetta a un testo JSON in input di formattare bene il testo di input (vedere capitolo 2.1). il risultato è visibile in output
o	tab.js:  la Web App ha tre funzioni: ‘formatta’, ‘conversione’ e ‘albero’. Ognuna delle funzioni è all’interno di un proprio spazio. In Figura 7 è possibile vedere la pagina principale della Web App, ad esempio la funzione ‘Albero’, come precedente descritto. Il file si occupa della gestione e della visualizzazione a schermo dello spazio di output di esse. È possibile vedere una solo funzione alla volta
La descrizione dei file usati nel progetto, delinea solo una descrizione del loro compito, il loro obbiettivo finale o le loro informazioni. Ma descrive solo file per file solo il loro funzionamento. Mentre, nel loro insieme risulta più articolato e più complesso.
L’applicazione web è composta da due insiemi di elementi grafici e di funzioni. Tali insiemi si possono raggruppare in: Input e Output.
Per l’insieme di Input è composto:
•	Textarea di ingresso: la textarea permette di inserire il testo JSON al suo interno. All’avio dell’applicazione è presente un testo JSON per testare il funzionamento dell’applicazione stessa. Tale testo è presente all’interno del codice stesso di index.html. La textarea ha come identificativo: id=”input” nel file Html.
•	Bottone per i file: il bottone attiva il file aprifile.dart presenta nella sottocartella utils di web. In questo modo è possibile caricare un testo all’interno della textarea che funge in seguito da input. All’interno del file Html, bottone ha come identificativo: id=”apriFile” e testo: “Apri File”.
•	Bottone per pulire: il bottone permette di pulire sia la textarea “input” sia le textarea usate come output. Ha come identificativo: id=”pulireTutto” e testo: “Pulire Tutto”.
Mentre per quanto riguarda l’insieme di Output, gli elementi sono definiti come segue:
•	Bottone per la formattazione: il bottone è connesso dal file main.dart al file format.dart. Il bottone attiva la funzione di formattazione del testo Json preso dalla textarea “input”. All’interno del file Html, bottone ha come identificativo: id=”conversione” e testo: “Conversione”.
•	Bottone per la conversione: il bottone è connesso dal file main.dart al file conversion.dart. Il bottone attiva la funzione che effettua il processo di parsing del testo fornito in input alla textarea “input”. La funzione di conversione crea un testo simile del testo di input anche se il testo di ingresso non è ben formato.
•	Bottone per l’albero: il bottone è connesso direttamente con il file albero.js. Una volta premuto, il codice presente all’interno nel file javascript procede, in sequenza, a prendere il testo di “input”, formattare, estrarne il contenuto, crearne un albero di nodi e collegamenti, ed infine a mostrarlo. ”. All’interno del file Html, il bottone ha come identificativo: id=”albero” e testo: “Albero”.
•	Textarea per la formattazione: la textarea permette di visualizzare il testo formato dal codice presente in format.dart. La textarea non permette di modificare il testo che risulta solo come output. All’interno del file Html, la textarea ha come identificativo: id=”outputFormatta”.
•	Textarea per la conversione: la textarea permette di visualizzare il testo convertito dal codice presente in conversion.dart. La textarea non permette di modificare il testo che risulta solo come output. All’interno del file Html, la textarea ha come identificativo: id=”output”.
•	<div> per grafico albero: per visualizzare il grafico dell’albero si è scelto usare come riferimento un <div>. La scelta è derivata dalla volontà di creare con maggiore libertà di manovra rispetto a quella espressa da un textarea. Il grafico risultante è rappresentato come un albero che si sviluppa in orizzontale. Ogni nodo dell’albero può essere ridotto ed eventualmente ritornare alla sua precedente forma. I nodi-foglia non possono essere ridotti. L’espansione di un nodo porta l’albero allo stato precedente e di conseguenze se ci sono dei nodi ridotti in quella porzione di albero, rimangono. L’elemento <div> in questione è chiamato
A gestire la visualizzazione delle due textarea e dell’elemento div per l’albero è una funzione presente nel file tab.js, è si chiama openTab.
 
Figura 8 codice per la gestione dei tab
In Figura 8 è possibile vedere il codice in javascript della gestione della sezione di Output attraverso l’uso dei tab. In questo modo è possibile vedere il risultato delle funzioni connesse ai bottoni uno alla volta.
 
Figura 9 Variabili di Input di main.dart
 
Figura 10 Corpo della funzione main.dart
I compiti, funzioni e gli elementi grafici della applicazione web definiti in precedenza sono assolti come segue:
•	Per la conversione, l’1): tale compito viene svolto dal codice presente in conversion.dart. Per inserire il testo JSON di input da convertire è possibile scrivere direttamente sulla textarea ‘input’ oppure caricare il testo da un file presente nel dispositivo attivando il file aprifile.dart una volta premuto il pulsante ‘Apri File’. Una volta fatto questo è possibile effettuare la conversione del testo secondo standard JSON. Per la gestione dell’evento generato dal bottone, se ne occupa main.dart. In Figura 9 è possibile vedere i collegamenti tra le variabili presenti in main.dart e gli elementi grafici del file index.html. In Figura 10 è possibile il corpo principale della funzione main del file main.dart. Si intravede l’azione che viene attivata dal bottone ‘conversione’ collegata alla variabile locale ‘conversione’ di main.dart. questo evento prende il testo di input, svuota la textarea dove visualizzare il risultato e passa il testo di input alla funzione leggi del file conversion.dart con il comando: leggi(contenuto, “”);
Il risultato sarà visualizzato direttamente sulla textarea ‘output’.
 
Figura 11 funzione di formattazione del file format.dart
•	Per la formattazione, il 2): è uguale al 1) per quanto riguarda la ricezione del testo di input e l’attivazione del file per la formattazione. Si differenze, di conseguenza, nell’attivazione diretta del codice presente in format.dart. In Figura 11 è possibile vedere il funzionamento della formattazione.
•	Per la visualizzazione ad albero, il 3): la ricezione del testo di input è uguale al 1) e al 2). Come definito all’interno dello spazio utilizzato per visualizzare il grafico, questo compito risulta il più complesso e articolato perché il processo di visualizzazione contiene anche il processo usato per la conversino e la formattazione. L’albero che viene generato utilizza D3 come librerie e SVG come area per la creazione della stessa (vedere capitolo 3.5).
Per la funzione di conversione presente nel file conversion.dart si è scelto di creare delle funzioni specifiche che permettono l’analisi del testo di input e stampare nella textarea il risultato. Tali funzioni presenti nel file hanno compiti specifici descritti come segue:
•	“leggi”: accetta una stringa JSON e una spaziatura come parametri. Prima corregge la stringa JSON utilizzando la funzione fixJson, poi la decodifica in un oggetto dinamico. Se il risultato della decodifica è una lista (List), invoca la funzione processJsonArray per elaborarla; se invece è una mappa (Map<String, dynamic>), chiama la funzione processJsonObject per gestirla. Se il contenuto non è né una lista né una mappa, aggiorna il valore di output per indicare che il JSON non è valido. In caso di errore durante la decodifica, stampa un messaggio di errore con il contenuto JSON che ha causato il problema.
•	processJsonArray: itera attraverso un array JSON e processa ciascun elemento. Se l'elemento è una mappa (Map<String, dynamic>), chiama un'altra funzione chiamata processoJsonObject, passando l'elemento e una chiave aggiornata. Se l'elemento non è una mappa, converte il valore in una stringa e controlla se deve essere modificato o semplicemente aggiunto all'output. Se necessario, modifica e legge il testo con formattazione aggiornata, altrimenti aggiunge il valore formattato direttamente all'output.
•	processoJsonObject: accetta una mappa JSON, una chiave genitore e uno spazio di formattazione. Itera attraverso le coppie chiave-valore della mappa. Se il valore è una stringa, lo formatta e lo aggiunge all'output con una nuova spaziatura; altrimenti, aggiunge direttamente il valore all'output.
•	controlloTesto: verifica se una stringa contiene parentesi graffe o quadre. Se sì, restituisce vero, altrimenti falso.
•	modificaTesto: esegue una sequenza di operazioni sulla stringa di testo per adattarla al formato JSON. Trasforma i marcatori dei valori nelle virgolette appropriate, corregge gli spazi e i caratteri di apertura e chiusura delle parentesi.
•	fixJson: corregge una stringa JSON. Sostituisce le virgolette non precedute da un backslash con sequenze di escape, e risolve i casi in cui sono presenti duplicati di chiavi con due punti.
Queste funzioni hanno un applicazione ricorsiva che termina una volta esaminato completamente il testo JSON fornito.

Modello di Knime
Similmente a quanto realizzato con la Web App, è stata realizzato un progetto di Knime con un flusso di lavoro che permette l’estrazione dei dati da un file JSON (vedere capitolo 2). 
 
Figura 12 Immagine del flusso su Knime
Il progetto permette, la lettura e la serializzazione, di un testo JSON. I dati estratti dal testo JSON vengono filtrati ed elaborati nel flusso di lavoro. Una volta terminato, i dati vengono salvati in un file csv o visualizzati in forma di tabella. 
In Figura 12 è possibile vedere il flusso di lavoro del progetto di Knime e dei nodi che sono stati utilizzati.
Il flusso di lavoro di Knime però è parametrato secondo una struttura di file JSON. 
Di conseguenza, qualsiasi altro file JSON in input avrebbe problemi nell’esecuzione del flusso.
Il contenuto e l’organizzazione del file JSON è descritto come segue:
•	"numero_ordine" ( numero di ordine)
•	"cliente" (i valori dell'utente): "nome", "email", "telefono", "indirizzo".
•	"articolo" (i valori dell'articolo): "id_prodotto" (id del prodotto), "nome", "prezzo_unitario" (prezzo totale).
•	e altri valori correlati: "metodo spedizione" (metodo di spedizione), "costo spedizione" (costo di spedizione), "costo totale" (costo totale),
"metodo_pagamento" (metodo di pagamento), "stato_pagamento" (stato del pagamento), "stato_ordine", (stato dell’ordine), "data_ordine" (data dell’ordine), "data_consegna_prevista" (data della consegna) e le "note".

 
Figura 13 esempio di formato Json accettabile.
In Figura 13 è possibile vedere un formato di testo JSON compatibile per l’estrazione ed elaborazione del progetto di Knime. 
Sono presenti dei file di esempio nella cartella di test del repository del progetto di Knime: “https://github.com/domenico1995/JsonDart/tree/main/Knime/Test”.
I nomi dei valori citati in precedenza vanno scritti senza errori all’interno del file o del testo JSON. Il flusso di lavoro o modello di Knime, effettua un matching con i nomi descritti precedentemente. 
Qualora non dovesse individuare, almeno, uno dei nomi dei valori, cercherà la prima corrispondenza di quel nome all’interno del file o del testo. In caso di mancanza di matching, di un nome del valore, darà come esito valore “null”. Se l’errore del nome di un valore, ad esempio, riguarda “cliente” anche i valori all’interno come “nome”, “email”, “telefono” e “indirizzo” daranno valore “null” poiché lo stesso effetto ricadrà sui valori all’interno.
Come descritto nel capitolo 3.1, Knime utilizza dei nodi per poter eseguire dei compiti o funzioni. Tali compiti o funzioni si raggruppano in categorie e sottocategorie. I nodi appartenenti ad una categoria possono essere ricondotti ad essa o ad una sottocategoria, per via del colore di sfondo che hanno. I nodi di colore arancione appartengono alla categoria del Input e Output (IO) e a diverse sottocategorie come quelle che permettono la lettura dei file (Read). I nodi dei colori gialli 
In Figura 12 è possibile vedere il flusso di lavoro del progetto nella sua interezza.
Il progetto è suddiviso in diverse parti e ognuna è delimitata da un riquadro di colore diverso come bordo. Ogni parte ad un suo compito e funzionalità inerente al progetto: Input, Elaborazione, Visualizzazione e Salvataggio.
La sezione di Input ha il compito di svolgere il compito di inserire i dati di ingresso.
 
Figura 14 sezione di Input del modello.
All’interno del riquadro verde presente nella Figura 13 vi sono i nodi che permettono di dare il testo o file di JSON. Si ha, di conseguenza, la possibilità di selezionare il file di testo o di fornire un testo JSON come input principale del progetto.
 
Figura 15 sezione di Elaborazione del modello.
La sezione centrale con il riquadro arancione, presente nella Figura 14, si occupa della fase di estrazione ed elaborazione dei dati dal file/testo di input. Questa sezione è di Elaborazione. 
 
Figura 16 sezione di Visualizzazione e Salvataggio del progetto.
Alla fine del processo di estrazione ed elaborazione dei dati, la sezione di Elaborazione, le informazioni vengono fornite all’utente. 
Questo passaggio viene effettuato con due sezioni distinti ed in contemporanea. Tali sezioni sono: Visualizzazione e Salvataggio. 
In Figura 16 sono presenti due riquadri: uno viola per la sezione di Salvataggio ed uno blu per la sezione di Salvataggio.
La sezione di Salvataggio è composta da uno nodo, “Table View Javascript”, che ha la funzione di mostrare attraverso una view i dati elaborati in forma tabellare.
La Sezione di Output permette il salvataggio dei dati elaborati inserendoli all’interno di file csv. Il nome del file ha al suo interno la data e l’orario dell’esecuzione del flusso di lavoro. 
Qualora più dati sono stati analizzati nello stesso orario, non verranno sovrascritti ma messi in coda all’interno del file.
Come definito in precedenza, ci sono due modi per fornire l’input al modello: fornire il testo o selezionando il file JSON. 
Ognuno delle quali necessito di operazioni preliminari descritti come segue prima dell’esecuzione:
1)	Fornire il testo: collegare il nodo “String to JSON” al nodo “JSON Path”. In Figura 14 è presente tale collegamento. Configurare il nodo “Multiline Text Reader” inserendo il testo JSON. Il flusso di lavoro del progetto di Knime tiene di default questa opzione e quindi è necessario solo inserire il testo nel nodo “Multiline Text Reader”.
2)	Selezionare il file: collegare il nodo “JSON Reader” al nodo “JSON Reader”, premere il tasto destro sul nodo “File Upload” e selezionare "Interactive View: File Upload". Si aprirà una finestra con un bottone giallo con scritto "Select File", premendolo vi permetterà di scegliere il file. Va selezionato il file da esaminare. Una volta fatta bisogna chiudere scegliendo l'opzione "Aplly settings as new default" come illustrato nella Figura 17. In questo modo il file sarà selezionato e pronto per l'esecuzione. 
Il modello indipendentemente dalla scelta di selezionare il file o fornire il testo va configurato in base al dispositivo usato per eseguire il programma di Knime e il progetto appena descritto. 

 
Figura 17 Immagine finestra di chiusura per il salvataggio del nodo File Upload Widget
Queste configurazioni si basano sull’inserimento di file di default per il nodo “File Upload Widget” e la cartella di output nel nodo “Table Creator”, dove salvare i file elaborati. Tali configurazioni vanno effettuati come segue:
•	Per il nodo “File Upload Widget”: nella dicitura di configurazione “Default File” va inserito il file o selezionato un file, che sarà di default per l’esecuzione del progetto.
•	Per il nodo “Table Creator”: va inserito il percorso della cartella dove verranno salvati i file. Nella Figura 18 è possibile vedere un esempio con un percorso verso una cartella. Una volta selezionato il percorso presente in Row0 basta modificare il testo presente nella cella o eventualmente nella casella Input line quando la cella di Row0 viene selezionata.
 
Figura 18 immagine configurazione nodo Table Creator. 
La sezione di Elaborazione effettua la parte di processo di parsing e filtraggio delle informazioni. Tale processo costituito da una serie di nodi avente ognuno un compito diverso. I nodi sono descritti come segue:
•	JSON Path: il nodo ha il compito di filtrare i campi del testo JSON tramite matching dei nomi. In questa fase, eventuali nomi dei valori, vengono riscontrati.
•	Ungroup: i campi individuati vengono divisi i due gruppi. L’assegnazione di un campo verso un gruppo avviene manualmente sulla base delle necessita del progettista. 
•	Cell Splitter: divide il contenuto delle celle in una tabella. Per file JSON, usa "," come delimitatore per separare i dati all'interno delle celle in più colonne.
•	Column Filter: per compito simile al Ungroup, divide i campi in due parti. Include alcuni ed esclude altri. Ungroup è nodo che esplode le colonne contenenti dati aggregati, creando nuove righe per ciascun elemento all'interno di una colonna aggregata (come liste o colonne JSON). Column Filter è un nodo seleziona quali colonne mantenere o rimuovere da una tabella, permettendo di filtrare i dati in base alle colonne.
•	Column Rename: rinomina i campi con altri nomi. I nuovi nomi saranno usati nei nodi successivi del modello.
•	Missing value: individua i valori mancanti nei valori associati ai nomi. Una volta individuato il valore mancante, verrà inserito la stringa “null”.

Il processo di parsing e di visualizzazione trova piena applicazione all’interno del progetto della Web App e del modello su Knime. Anche se effettuato con metodiche diverse. Nel caso della Web App il processo utilizza funzioni e testo in codice per l’analisi e la visualizzazione del testo fornito in input.
Mentre per Knime, non c’è codice o funzioni. Il processo è composto da nodi che agiscono in maniera simili. Ogni nodo ha un suo compito e in maniera inversa sulla base della funzione/compito troviamo il nodo che serve.
Questo approccio diverso sta alla base della differenza tra Web App e modello di Knime.


