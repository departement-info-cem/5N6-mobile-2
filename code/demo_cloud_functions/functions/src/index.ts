import {setGlobalOptions} from "firebase-functions";
import {onCall, HttpsError} from "firebase-functions/https";
import * as logger from "firebase-functions/logger";
import {initializeApp} from "firebase-admin/app";
import {getMessaging} from "firebase-admin/messaging";

// Donne accès aux services Firebase (ici, Cloud Messaging) avec le SDK Admin
initializeApp();

// Limite le nombre de serveurs démarrés en même temps, pour contrôler les coûts
setGlobalOptions({maxInstances: 10});

export const helloWorld = onCall(() => {
  logger.info("Hello logs!", {structuredData: true});
  return "Bonjour de Firebase!";
});

export const direBonjour = onCall<{nom?: string}>((request) => {
  const nom = request.data.nom?.trim();
  if (!nom) {
    throw new HttpsError("invalid-argument", "Le nom est obligatoire.");
  }
  logger.info(`Bonjour demandé pour ${nom}`);
  return {message: `Bonjour ${nom}!`, heureServeur: new Date().toISOString()};
});

export const monProfil = onCall((request) => {
  // Le SDK Firebase envoie le jeton de l'utilisateur connecté avec la requête,
  // et Firebase le vérifie avant d'exécuter la fonction
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Vous devez être connecté.");
  }
  logger.info(`Profil demandé par ${request.auth.uid}`);
  return {uid: request.auth.uid, courriel: request.auth.token.email ?? null};
});

export const envoyerNotification = onCall<{fid?: string}>(async (request) => {
  // Le FID (Firebase Installation ID) identifie l'installation de
  // l'application à qui envoyer la notification
  const fid = request.data.fid;
  if (!fid) {
    throw new HttpsError("invalid-argument", "Le FID est obligatoire.");
  }
  try {
    // FCM n'a pas d'émulateur : même dans l'émulateur, cet envoi passe
    // par les vrais serveurs de Google
    await getMessaging().send({
      fid: fid,
      notification: {
        title: "Bonjour de Firebase!",
        body: "Cette notification vient de la fonction envoyerNotification.",
      },
    });
  } catch (erreur) {
    logger.error("Échec de l'envoi de la notification", erreur);
    throw new HttpsError(
      "internal",
      "L'envoi a échoué. Consultez les journaux de l'émulateur.",
    );
  }
  logger.info("Notification envoyée");
  return "Notification envoyée.";
});
