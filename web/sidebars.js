// @ts-check
// Les dates des séances viennent du site du département (fiches des profs, calendrier scolaire, cours annulés ou
// déplacés) : config.js donne le numéro du cours, et chaque séance son rang, « seance: 13 » pour la 13e rencontre
// de chaque groupe. Un groupe qui ne suit pas l'ordre commun a son propre numéro : seance: { defaut: 14, "1010": 15 }.
// Voir le wiki du gabarit (MainDocsCalendar).

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docs: [
    {
      type: "doc",
      id: "cours/intro",
      customProps: {
        avancementLabel: "TP1 - Créé",
        avancement: 0,
        seance: 1,
      },
    },
    {
      type: "doc",
      id: "cours/mise-en-page",
      className: "remise-tp1",
      customProps: {
        avancementLabel: "TP1",
        avancement: 0.5,
        seance: 2,
      },
    },
    {
      type: "doc",
      id: "cours/navigation",
      customProps: {
        avancementLabel: "TP1 - Complété",
        avancement: 1,
        seance: 3,
      },
    },
    {
      type: "doc",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP2 - Créé",
        avancement: 0.05,
        seance: 4,
      },
    },
    {
      type: "doc",
      id: "cours/multilingue-reactivite",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.33,
        seance: 5,
      },
    },
    {
      type: "doc",
      label: "3.2 - Image Client 🖼️",
      id: "cours/image-client",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.6,
        seance: 6,
      },
    },

    {
      type: "doc",
      label: "4.1 - Intégration 🔨",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.8,
        seance: 7,
      },
    },
    {
      type: "doc",
      label: "4.2 - Intégration 🔨",
      className: "remise-tp2",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2 - Complété",
        avancement: 1,
        seance: 8,
      },
    },
    {
      type: "doc",
      label: "5.1 - Firebase : Authentification 👮",
      id: "cours/firebase-authentification",
      customProps: {
        avancementLabel: "TP3 - Créé",
        avancement: 0.0,
        seance: 9,
      },
    },
    {
      type: "doc",
      label: "5.2 - Firebase : stockage des données 📦",
      id: "cours/firebase-firestore",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.1,
        seance: 10,
      },
    },
    {
      type: "doc",
      label: "6.1 - HTTP 👆",
      id: "cours/http",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.2,
        seance: 11,
      },
    },
    {
      type: "doc",
      label: "6.2 - Organisation du code 🧹 / Intégration",
      id: "cours/organisation",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.3,
        seance: 12,
      },
    },
    {
      type: "doc",
      label: "7.1 - Examen intra formatif ✍️",
      id: "cours/formatif-intra",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.4,
        seance: 13,
      },
    },
    {
      type: "doc",
      label: "7.2 - Examen intra (20%) ✍️",
      id: "cours/examen",
      className: "examen",
      customProps: {
        seance: { defaut: 14, "1010": 15 },
      },
    },
    {
      type: "doc",
      label: "8.1 - Firebase : Stockage de fichiers 💾",
      id: "cours/firebase-storage",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.5,
        seance: { defaut: 15, "1010": 14 },
      },
    },
    {
      type: "doc",
      label: "8.2 - Déploiement 🤖",
      id: "cours/deploiement",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.6,
        seance: 16,
      },
    },
    {
      type: "doc",
      label: "9.1 - Règles de validation sur les champs texte",
      id: "cours/validation",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.7,
        seance: 17,
      },
    },
    {
      type: "doc",
      label: "9.2 - Gestion de l'état 💱 + Cycle de vie 🚲 + Hero 🦸",
      id: "cours/gestion-etat-cycle-vie-hero",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.9,
        seance: 18,
      },
    },
    {
      type: "doc",
      label: "10.1 - Cloud Functions",
      className: "remise-tp3",
      id: "cours/cloud-functions",
      customProps: {
        avancementLabel: "TP3",
        avancement: 1,
        seance: 19,
      },
    },
    {
      type: "doc",
      label: "10.2 - Notifications push",
      id: "cours/notification",
      customProps: {
        avancementLabel: "TP4 - Créé",
        avancement: 0,
        seance: 20,
      },
    },
    {
      type: "doc",
      label: "11.1 - Notification 2 : le retour - Travail sur le TP",
      id: "cours/notification-2",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.1,
        seance: 21,
      },
    },
    {
      type: "doc",
      label: "11.2 - Multiplateforme Firebase (Web)",
      id: "cours/firebase-multi",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.2,
        seance: 22,
      },
    },
    {
      type: "doc",
      label: "12.1 - Cybersec et règles d'accès Firebase",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.3,
        seance: 23,
      },
    },
    {
      type: "doc",
      label: "12.2 - S'interfacer avec des IA 🤖",
      id: "cours/firebase-ia",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.4,
        seance: 24,
      },
    },
    {
      type: "doc",
      label: "13.1 - Mode hors ligne",
      id: "cours/firebase-hors-ligne",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.5,
        seance: 25,
      },
    },
    {
      type: "doc",
      label: "13.2 - Intégration 🔨",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.6,
        seance: 26,
      },
    },
    {
      type: "doc",
      label: "14.1 - Travail - Récits utilisateurs",
      id: "cours/recits-utilisateurs",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.8,
        seance: 27,
      },
    },
    {
      type: "doc",
      label: "14.2 - Remise TP4 + Intégration 🔨 - Travail sur le TP",
      className: "remise-tp4",
      id: "tp/tp4",
      customProps: {
        avancementLabel: "TP4",
        avancement: 1,
        seance: 28,
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif ✍️",
      id: "cours/formatif-final",
      customProps: {
        seance: 29,
      },
    },
    {
      type: "doc",
      label: "15.2 - Examen final (20 %) ✍️",
      id: "cours/examen",
      className: "examen",
      customProps: {
        seance: 30,
      },
    },
  ],
  tp: [
    {
      type: "autogenerated",
      dirName: "02-tp",
    },
  ],
  recettes: [
    {
      type: "autogenerated",
      dirName: "03-recettes",
    },
  ],
  laboratoires: [
    {
      type: "autogenerated",
      dirName: "04-laboratoires",
    },
  ],
};

module.exports = sidebars;
