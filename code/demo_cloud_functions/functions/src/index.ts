import {setGlobalOptions} from "firebase-functions";
import {onCall, HttpsError} from "firebase-functions/https";
import * as logger from "firebase-functions/logger";

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
