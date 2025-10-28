// @ts-check
let jmdates = [
  "2025-08-22", 
  "2025-08-26", 
  "2025-09-02", 
  "2025-09-09",
  "2025-09-16",
  "2025-09-19",
  "2025-09-23",
  "2025-09-24",
  "2025-09-26",
  "2025-10-03",
  "2025-10-21",
  "2025-10-21",
  "2025-10-07",
  "2025-10-10",
  "2025-10-28",
  "2025-10-01",
  "2025-10-31",
  "2025-11-04",
  "2025-11-07",
  "2025-11-11",
  "2025-11-14",
  "2025-11-18",
  "2025-11-21",
  "2025-11-25",
  "2025-11-28",
  "2025-12-02",
  "2025-12-05",
  "2025-12-09",
  "2025-12-16",
  "2025-12-19",
]

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docs: [
    {
      type: "doc",
      label: "1.1 - Intro 🏁",
      id: "cours/intro",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ "1030": "2025-08-25" }],
          "Jean-Michel": [{ "1010": jmdates[0] }, { "1020": jmdates[0] },]
        },
      },
    },
    {
      type: "doc",
      label: "1.2 - Mise en page 📄",
      id: "cours/mise-en-page",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ "1030": "2025-08-28" }],
          "Jean-Michel": [{ "1010": jmdates[1] }, { "1020": jmdates[1] },]
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
          "Pierre-Olivier": [{ "1030": "2025-08-29" }],
          "Jean-Michel": [{ "1010": jmdates[2] }, { "1020": jmdates[2] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-04" }],
          "Jean-Michel": [{ "1010": jmdates[3] }, { "1020": jmdates[3] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-08" }],
          "Jean-Michel": [{ "1010": jmdates[4] }, { "1020": jmdates[4] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-11" }],
          "Jean-Michel": [{ "1010": jmdates[5] }, { "1020": jmdates[5] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-15" }],
          "Jean-Michel": [{ "1010": jmdates[6] }, { "1020": jmdates[6] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-18" }],
          "Jean-Michel": [{ "1010": jmdates[7] }, { "1020": jmdates[7] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-22" }],
          "Jean-Michel": [{ "1010": jmdates[8] }, { "1020": jmdates[8] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-25" }],
          "Jean-Michel": [{ "1010": jmdates[9] }, { "1020": jmdates[9] },]
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
          "Pierre-Olivier": [{ "1030": "2025-09-29" }],
          "Jean-Michel": [{ "1010": jmdates[10] }, { "1020": jmdates[10] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-02" }],
          "Jean-Michel": [{ "1010": jmdates[11] }, { "1020": jmdates[11] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-06" }],
          "Jean-Michel": [{ "1010": jmdates[12] }, { "1020": jmdates[12] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-09" }],
          "Jean-Michel": [{ "1010": jmdates[13] }, { "1020": jmdates[13] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-20" }],
          "Jean-Michel": [{ "1010": jmdates[14] }, { "1020": jmdates[14] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-23" }],
          "Jean-Michel": [{ "1010": jmdates[15] }, { "1020": jmdates[15] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-27" }],
          "Jean-Michel": [{ "1010": jmdates[16] }, { "1020": jmdates[16] },]
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
          "Pierre-Olivier": [{ "1030": "2025-10-30" }],
          "Jean-Michel": [{ "1010": jmdates[17] }, { "1020": jmdates[17] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-03" }],
          "Jean-Michel": [{ "1010": jmdates[18] }, { "1020": jmdates[18] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-06" }],
          "Jean-Michel": [{ "1010": jmdates[19] }, { "1020": jmdates[19] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-13" }],
          "Jean-Michel": [{ "1010": jmdates[20] }, { "1020": jmdates[20] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-17" }],
          "Jean-Michel": [{ "1010": jmdates[21] }, { "1020": jmdates[21] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-20" }],
          "Jean-Michel": [{ "1010": jmdates[22] }, { "1020": jmdates[22] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-24" }],
          "Jean-Michel": [{ "1010": jmdates[23] }, { "1020": jmdates[23] },]
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
          "Pierre-Olivier": [{ "1030": "2025-11-27" }],
          "Jean-Michel": [{ "1010": jmdates[24] }, { "1020": jmdates[24] },]
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
          "Pierre-Olivier": [{ "1030": "2025-12-01" }],
          "Jean-Michel": [{ "1010": jmdates[25] }, { "1020": jmdates[25] },]
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
          "Pierre-Olivier": [{ "1030": "2025-12-04" }],
          "Jean-Michel": [{ "1010": jmdates[26] }, { "1020": jmdates[26] },]
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
          "Pierre-Olivier": [{ "1030": "2025-12-08" }],
          "Jean-Michel": [{ "1010": jmdates[27] }, { "1020": jmdates[27] },]
        },
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif ✍️",
      id: "cours/formatif-final",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ "1030": "2025-12-11" }],
          "Jean-Michel": [{ "1010": jmdates[28] }, { "1020": jmdates[28] },]
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
          "Pierre-Olivier": [{ "1030": "2025-12-22" }],
          "Jean-Michel": [{ "1010": jmdates[29] }, { "1020": jmdates[29] },]
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
