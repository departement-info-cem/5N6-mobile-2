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
