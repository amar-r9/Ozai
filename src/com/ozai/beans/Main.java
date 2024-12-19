package com.ozai.beans;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
public class Main {

	public static void main(String[] args) throws FileNotFoundException, IOException {
		GoogleCredentials googleCredentials = GoogleCredentials
	            .fromStream(new FileInputStream("D:\\Git\\Ozai_Web\\Ozai\\WebContent\\ozai-living-firebase-adminsdk-6h4gz-37950de73d.json"));
	    FirebaseOptions firebaseOptions = FirebaseOptions
	            .builder()
	            .setCredentials(googleCredentials)
	            .build();
	    FirebaseApp app = FirebaseApp.initializeApp(firebaseOptions, "Ozai Living");
	    FirebaseMessaging.getInstance(app);

	}

}
