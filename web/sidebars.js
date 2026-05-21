// @ts-check
let jddates = [
  "2026-06-09",
  "2026-06-09",
  "2026-06-10",
  "2026-06-10",
  "2026-06-12",
  "2026-06-12",
  "2026-06-15",
  "2026-06-15",
  "2026-06-17",
  "2026-06-17",
  "2026-06-19",
  "2026-06-19",
  "2026-06-22",
  "2026-06-22",
  "2026-06-23",
  "2026-06-23",
  "2026-06-26",
  "2026-06-26",
  "2026-06-29",
  "2026-06-29",
  "2026-06-30",
  "2026-06-30",
  "2026-07-03",
  "2026-07-03",
  "2026-07-06",
  "2026-07-06",
  "2026-07-08",
  "2026-07-08",
  "2026-07-10",
  "2026-07-10",
];

let podates = [
  "2026-06-09",
  "2026-06-09",
  "2026-06-10",
  "2026-06-10",
  "2026-06-12",
  "2026-06-12",
  "2026-06-15",
  "2026-06-15",
  "2026-06-17",
  "2026-06-17",
  "2026-06-19",
  "2026-06-19",
  "2026-06-22",
  "2026-06-22",
  "2026-06-23",
  "2026-06-23",
  "2026-06-26",
  "2026-06-26",
  "2026-06-29",
  "2026-06-29",
  "2026-06-30",
  "2026-06-30",
  "2026-07-03",
  "2026-07-03",
  "2026-07-06",
  "2026-07-06",
  "2026-07-08",
  "2026-07-08",
  "2026-07-10",
  "2026-07-10",
];

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docs: [
    {
      type: "doc",
      label: "1.1 - Intro 🏁",
      id: "cours/intro",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[0] }],
          "Joris": [{ 1010: jddates[0] }],
        },
      },
    },
    {
      type: "doc",
      label: "1.2 - Mise en page 📄",
      id: "cours/mise-en-page",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[1] }],
          "Joris": [{ 1010: jddates[1] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.1 - Navigation 🧭",
      id: "cours/navigation",
      customProps: {
        avancementLabel: "TP1 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[2] }],
          "Joris": [{ 1010: jddates[2] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.2 - Liste 📋",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP1",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[3] }],
          "Joris": [{ 1010: jddates[3] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.1 - Liste 📋",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP1",
        avancement: 0.25,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[4] }],
          "Joris": [{ 1010: jddates[4] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.2 - DIO 🙏",
      id: "cours/dio",
      customProps: {
        avancementLabel: "TP1",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[5] }],
          "Joris": [{ 1010: jddates[5] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.1 - DIO 🙏",
      id: "cours/dio",
      customProps: {
        avancementLabel: "TP1",
        avancement: 0.75,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[6] }],
          "Joris": [{ 1010: jddates[6] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.2 - Intégration 🔨",
      id: "cours/integration",
      className: "remise-tp1",
      customProps: {
        avancementLabel: "TP1",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[7] }],
          "Joris": [{ 1010: jddates[7] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.1 - Organisation du code 🧹",
      id: "cours/organisation",
      customProps: {
        avancementLabel: "TP2 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[8] }],
          "Joris": [{ 1010: jddates[8] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.2 - Image Picker 🤏",
      id: "cours/image-picker",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[9] }],
          "Joris": [{ 1010: jddates[9] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.1 - Image Cookie 🍪",
      id: "cours/image-cookie",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[10] }],
          "Joris": [{ 1010: jddates[10] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.2 - Image Client 🖼️",
      id: "cours/image-client",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[11] }],
          "Joris": [{ 1010: jddates[11] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.1 - Formatif ✍️",
      id: "cours/formatif-intra",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[12] }],
          "Joris": [{ 1010: jddates[12] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.2 - Examen Intra (20%) ✍️",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[13] }],
          "Joris": [{ 1010: jddates[13] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.1 - Multilingue 🌐",
      id: "cours/multilingue",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[14] }],
          "Joris": [{ 1010: jddates[14] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.2 - Déploiement 🤖",
      id: "cours/deploiement",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.7,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[15] }],
          "Joris": [{ 1010: jddates[15] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.1 - Gestion de l'état 💱",
      id: "cours/gestion-etat",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[16] }],
          "Joris": [{ 1010: jddates[16] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.2 - Notifications 🚨",
      id: "cours/notification",
      customProps: {
        avancementLabel: "TP2",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[17] }],
          "Joris": [{ 1010: jddates[17] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.1 - Intégration 🔨",
      id: "cours/integration",
      className: "remise-tp2",
      customProps: {
        avancementLabel: "TP2",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[18] }],
          "Joris": [{ 1010: jddates[18] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.2 - Authentification Firebase 👮",
      id: "cours/firebase-authentification",
      customProps: {
        avancementLabel: "TP3 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[19] }],
          "Joris": [{ 1010: jddates[19] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.1 - Firebase Firestore 🏪",
      id: "cours/firebase-datastore",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[20] }],
          "Joris": [{ 1010: jddates[20] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.2 - Control d'accès Firebase 💂",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.2,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[21] }],
          "Joris": [{ 1010: jddates[21] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.1 - Control d'accès Firebase 💂",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[22] }],
          "Joris": [{ 1010: jddates[22] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.2 - Stockage Firebase 💾",
      id: "cours/firebase-storage",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[23] }],
          "Joris": [{ 1010: jddates[23] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.1 - Stream Firebase 🚣",
      id: "cours/firebase-stream",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[24] }],
          "Joris": [{ 1010: jddates[24] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.2 - Règles d'accès Firebase 📐",
      id: "cours/firebase-rules",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[25] }],
          "Joris": [{ 1010: jddates[25] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.1 - Hero 🦸",
      id: "cours/hero",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[26] }],
          "Joris": [{ 1010: jddates[26] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.2 - Intégration 🔨",
      id: "cours/integration",
      className: "remise-tp3",
      customProps: {
        avancementLabel: "TP3",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[27] }],
          "Joris": [{ 1010: jddates[27] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif ✍️",
      id: "cours/formatif-final",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[28] }],
          "Joris": [{ 1010: jddates[28] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.2 - Examen Final (20%) ✍️",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[29] }],
          "Joris": [{ 1010: jddates[29] }],
        },
      },
    },
  ],
  tp: [
    { type: "doc", label: "TP1 - Flutter 🐤", id: "tp/tp1" },
    { type: "doc", label: "TP2 - Gestion des images 🖼️", id: "tp/tp2" },
    { type: "doc", label: "TP3 - Sans serveur 🙅", id: "tp/tp3" },
  ],
};

module.exports = sidebars;
