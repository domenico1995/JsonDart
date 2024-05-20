import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

const firebaseConfig = {
  apiKey: "AIzaSyBRnnsTTPor1QiSYTQsiyNNT-xLGteF_NQ",
  authDomain: "jsondart.firebaseapp.com",
  projectId: "jsondart",
  storageBucket: "jsondart.appspot.com",
  messagingSenderId: "935251777974",
  appId: "1:935251777974:web:c7b51568c488a3b9c44917",
  measurementId: "G-1VXG39EMHF"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);