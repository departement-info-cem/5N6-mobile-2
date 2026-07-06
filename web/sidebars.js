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
      label: "1.1 - Intro Dart et Flutter",
      id: "cours/intro",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[0] }],
          "Joris": [{ 1020: jddates[0] }],
        },
      },
    },
    {
      type: "doc",
      label: "1.2 - Mise en page ",
      id: "cours/mise-en-page",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[1] }],
          "Joris": [{ 1020: jddates[1] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.1 - Navigation ",
      id: "cours/navigation",
      customProps: {
        avancementLabel: "TP1 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[2] }],
          "Joris": [{ 1020: jddates[2] }],
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
          "Pierre-Olivier": [{ 1010: podates[3] }],
          "Joris": [{ 1020: jddates[3] }],
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
          "Pierre-Olivier": [{ 1010: podates[4] }],
          "Joris": [{ 1020: jddates[4] }],
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
          "Pierre-Olivier": [{ 1010: podates[5] }],
          "Joris": [{ 1020: jddates[5] }],
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
          "Pierre-Olivier": [{ 1010: podates[6] }],
          "Joris": [{ 1020: jddates[6] }],
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
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[7] }],
          "Joris": [{ 1020: jddates[7] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.2 - Liste ",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP2 - Cr\u00e9\u00e9",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[8] }],
          "Joris": [{ 1020: jddates[8] }],
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
          "Pierre-Olivier": [{ 1010: podates[9] }],
          "Joris": [{ 1020: jddates[9] }],
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
          "Pierre-Olivier": [{ 1010: podates[10] }],
          "Joris": [{ 1020: jddates[10] }],
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
          "Pierre-Olivier": [{ 1010: podates[11] }],
          "Joris": [{ 1020: jddates[11] }],
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
          "Pierre-Olivier": [{ 1010: podates[12] }],
          "Joris": [{ 1020: jddates[12] }],
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
          "Pierre-Olivier": [{ 1010: podates[13] }],
          "Joris": [{ 1020: jddates[13] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.1 - Multilingue 🌐",
      id: "cours/multilingue",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.33,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[14] }],
          "Joris": [{ 1020: jddates[14] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.2 - Image Picker ",
      id: "cours/image-picker",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.67,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[15] }],
          "Joris": [{ 1020: jddates[15] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.1 - Intégration ",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[16] }],
          "Joris": [{ 1020: jddates[16] }],
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
          "Pierre-Olivier": [{ 1010: podates[17] }],
          "Joris": [{ 1020: jddates[17] }],
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
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[18] }],
          "Joris": [{ 1020: jddates[18] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.1 - DIO",
      id: "cours/dio",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[8] }],
          "Joris": [{ 1010: jodates[8] }, { 1020: jodates[8] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.2 - Examen papier Flutter + Organisation du code ",
      id: "cours/organisation",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[9] }],
          "Joris": [{ 1010: jodates[9] }, { 1020: jodates[9] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.1 - Authentification Firebase ",
      id: "cours/firebase-authentification",
      customProps: {
        avancementLabel: "TP3 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[19] }],
          "Joris": [{ 1020: jddates[19] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.2 - Firebase Firestore ",
      id: "cours/firebase-datastore",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.25,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[20] }],
          "Joris": [{ 1020: jddates[20] }],
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
          "Pierre-Olivier": [{ 1010: podates[21] }],
          "Joris": [{ 1020: jddates[21] }],
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
          "Pierre-Olivier": [{ 1010: podates[22] }],
          "Joris": [{ 1020: jddates[22] }],
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
          "Pierre-Olivier": [{ 1010: podates[23] }],
          "Joris": [{ 1020: jddates[23] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.2 - Examen Intra (20%) ",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[13] }],
          "Joris": [{ 1010: jodates[13] }, { 1020: jodates[13] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.1 - Déploiement ",
      id: "cours/deploiement",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[24] }],
          "Joris": [{ 1020: jddates[24] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.2 - Règles de validation",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[25] }],
          "Joris": [{ 1020: jddates[25] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.1 - Gestion de l'état ",
      id: "cours/gestion-etat",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[26] }],
          "Joris": [{ 1020: jddates[26] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.2 - Remise TP3 - Notifications ",
      id: "cours/notification",
      className: "remise-tp3",
      customProps: {
        avancementLabel: "TP3",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[28] }],
          "Joris": [{ 1020: jddates[28] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.1 - Intégration ",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[18] }],
          "Joris": [{ 1010: jodates[18] }, { 1020: jodates[18] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.2 - S'interfacer avec des IA",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[19] }],
          "Joris": [{ 1010: jodates[19] }, { 1020: jodates[19] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.1",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.2,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[20] }],
          "Joris": [{ 1010: jodates[20] }, { 1020: jodates[20] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.2 - Contrôle d'accès Firebase ",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[21] }],
          "Joris": [{ 1010: jodates[21] }, { 1020: jodates[21] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.1 - Contrôle d'accès Firebase ",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[22] }],
          "Joris": [{ 1010: jodates[22] }, { 1020: jodates[22] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.2 - Stockage Firebase ",
      id: "cours/firebase-storage",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[23] }],
          "Joris": [{ 1010: jodates[23] }, { 1020: jodates[23] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.1 - Stream Firebase ",
      id: "cours/firebase-stream",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.7,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[24] }],
          "Joris": [{ 1010: jodates[24] }, { 1020: jodates[24] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.2 - Règles d'accès Firebase ",
      id: "cours/firebase-rules",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[25] }],
          "Joris": [{ 1010: jodates[25] }, { 1020: jodates[25] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.1",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[26] }],
          "Joris": [{ 1010: jodates[26] }, { 1020: jodates[26] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.2 - Remise TP4 - Intégration ",
      id: "cours/integration",
      className: "remise-tp4",
      customProps: {
        avancementLabel: "TP4",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[26] }],
          "Joris": [{ 1010: jodates[27] }, { 1020: jodates[27] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif",
      id: "cours/formatif-final",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[27] }],
          "Joris": [{ 1020: jddates[27] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.2 - Examen Final (20%)",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates[29] }],
          "Joris": [{ 1020: jddates[29] }],
        },
      },
    },
  ],
  tp: [
    { type: "doc", label: "TP1 - Idée d'application ", id: "tp/tp1" },
    { type: "doc", label: "TP2 - Interface graphique ", id: "tp/tp2" },
    { type: "doc", label: "TP3 - MVP ", id: "tp/tp3" },
    { type: "doc", label: "TP4 - Version finale ", id: "tp/tp4" },
  ],
  recettes: [{
    type: 'autogenerated',
    dirName: '03-recettes'
  }],
  laboratoires: [{
    type: 'autogenerated',
    dirName: '04-laboratoires'
  }]
};

module.exports = sidebars;
