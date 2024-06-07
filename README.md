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
Una delle caratteristiche distintive di Dart è la sua flessibilità nell’ambito dello sviluppo cross-platform. Con Dart, gli sviluppatori possono scrivere codice una sola volta e distribuirlo su diverse piatteforme, tra cui Android, iOS, web e persino applicazioni desktop. Questo è reso possibile grazie a kit di sviluppo come Flutter e AngularDart. 
AngularDart è un kit di sviluppo di applicazioni web che sfrutta la potenza di Dart per creare interfacce utente dinamiche e complesse. Basato sul framework JavaScript Angular, AngularDart offre un’esperienza di sviluppo moderna e scalabile per la creazione di applicazioni web complesse.
Oltre alle sue capacità cross-platform, Dart offre una serie di funzionalità avanzate ch lo rendono un linguaggio potente per lo sviluppo di applicazioni moderne. Tra queste vi sono:
 * Tipizzazione Statica: Dart supporta la tipizzazione statica, che consente agli sviluppatori di individuare errori nel codice durante la compilazione anziché a tempo di esecuzione. Questo aiuta a migliorare la robustezza e la stabilità delle applicazioni.
'''dart
int somma(int a, int b) {
	return a + b;
}

void main() {
	print(somma(5, 10)); // Output: 15
}
'''
 * Garbage collection: Dart gestisce automaticamente la memoria allocata per gli oggetti non utilizzati mediante il garbage collection, semplificando il processo di gestione della memoria per gli sviluppatori.
 * Asincronia: Dart offre un supporto nativo per la programmazione asincrona, consentendo agli sviluppatori di scrivere codice che gestisce operazioni non bloccanti come chiamate di rete e operazioni di I/O in modo efficiente e conciso.
Future<void> main() async {
	print(‘Inizio’);
	await Future.delayed(Duration(seconds: 2));
print(‘Fine’);
}
 * Librerie standard: Dart fornisce una ricca libreria standard che include una vasta gamma di funzionalità per la gestione di dati, la manipolazione di stringhe, l’elaborazione di file e molto altro ancora. Queste librerie aiutano gli sviluppatori a scrivere codice più efficiente e riducono la necessità di scrivere codice personalizzato per compiti comuni.

Per iniziare a sviluppare applicazioni con Dart, è necessario scaricare e installare l’SDK di Dart. Una volta installato, è possibile utilizzare strumenti come Webdev per semplificare lo sviluppo di applicazioni web in Dart. 
Webdev gestisce le dipendenze del progetto e avvia un server locale per la visualizzazione dell’applicazione durante lo sviluppo.
La creazione di una nuova web app Dart è semplice grazie al comando ‘dart create-t web nomeprogetto’. 
Questo comando crea una struttura di base per la web app, inclusi i file main.dart per la logica dell’applicazione, un file HTML per la struttura della pagina web e un file CSS per lo stile.
Una delle caratteristiche più potenti di Dart è la possibilità di ricarica automaticamente le modifiche apportate al codice durante lo sviluppo. 
Ogni volta che vengono apportate modifiche ai file della web app, Webdev rileva automaticamente queste modifiche e le ricarica nel browser in tempo reale, consentendo un flusso di lavoro efficiente e produttivo.

## Knime

## Web App
Istruzioni per iniziare con il progetto.

## Modello di Knime
Progetto su piattaforma di Knime

## Istrusione di uso

## Esempi di uso

