// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getStorage } from "firebase/storage"; 
import { GoogleAuthProvider } from "firebase/auth";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBWkRRi1oesyIavlTVDl8orVFr8vh9KBlQ",
  authDomain: "movie-management-9c882.firebaseapp.com",
  projectId: "movie-management-9c882",
  storageBucket: "movie-management-9c882.appspot.com",
  messagingSenderId: "70308408965",
  appId: "1:70308408965:web:351db40f7770d4f66403ec",
  measurementId: "G-GE5KEND5TB"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const storage = getStorage(app);
const googleProvider = new GoogleAuthProvider();
const author = getAuth();

export { storage, googleProvider, author };